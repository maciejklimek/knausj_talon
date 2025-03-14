import os
import subprocess
import shlex
import time
import signal

from talon import Module, app

mod = Module()


def _double_fork():
    """Double fork to fully detach process from parent.
    Returns True if this is the detached process, False if parent process.
    """
    try:
        # First fork
        pid = os.fork()
        if pid > 0:
            return False  # Parent of first fork
        
        # Decouple from parent environment
        os.chdir('/')
        os.umask(0)
        os.setsid()
        
        # Second fork
        pid = os.fork()
        if pid > 0:
            os._exit(0)  # Parent of second fork exits
            
        return True  # We are the final child process
        
    except Exception as e:
        app.notify(f"Fork failed: {e}")
        return False


def _run_command_with_session(args, shell=False, retries=2, detach=False):
    """Run a command in a new session to ensure proper cleanup.
    
    Args:
        args: Command and arguments to run
        shell: Whether to run in shell mode
        retries: Number of retries if command fails
        detach: Whether to fully detach the process from Talon
    """
    if detach and _double_fork():
        # We are in the detached child process
        try:
            # Close all file descriptors
            os.closerange(0, 1024)
            # Open null device for stdin/stdout/stderr
            null = os.open(os.devnull, os.O_RDWR)
            for i in range(3):
                try:
                    os.dup2(null, i)
                except OSError:
                    pass
            
            # Execute the command
            if shell:
                os.execv('/bin/sh', ['sh', '-c', args])
            else:
                os.execvp(args[0], args)
        except Exception as e:
            print(f"Error in detached process: {e}", file=open('/tmp/talon_cmd.log', 'a'))
            os._exit(1)
        finally:
            os._exit(0)
    
    # Parent process continues here if detached
    if detach:
        return None
        
    # Non-detached process execution
    last_error = None
    for attempt in range(retries + 1):
        try:
            proc = subprocess.Popen(
                args,
                shell=shell,
                preexec_fn=os.setsid,  # create new session
                start_new_session=True,  # additional session isolation
                stderr=subprocess.PIPE,
                stdout=subprocess.PIPE
            )
            # Wait briefly to check for immediate failure
            time.sleep(0.1)
            if proc.poll() is not None and proc.returncode != 0:
                error_msg = None
                try:
                    if proc.stderr:
                        error_msg = proc.stderr.read().decode().strip()
                except Exception:
                    pass
                last_error = error_msg or "Unknown error"
                continue
            return proc
        except Exception as e:
            last_error = str(e)
            if attempt < retries:
                time.sleep(0.5)  # Wait before retry
                continue
            break
    
    if last_error:
        app.notify(f"Command failed after {retries + 1} attempts: {last_error}")
    return None


@mod.action_class
class Actions:
    def system_command(cmd: str) -> None:
        """Execute a command on the system and wait for completion."""
        if not cmd or not cmd.strip():
            app.notify("Empty command")
            return
            
        try:
            # For blocking commands, we want to see the output
            result = subprocess.run(
                cmd,
                shell=True,
                text=True,
                capture_output=True
            )
            if result.returncode != 0:
                error_msg = result.stderr.strip() if result.stderr else "Command failed"
                app.notify(f"Command error: {error_msg}")
        except Exception as e:
            app.notify(f"Command failed: {e}")

    def system_command_nb(cmd: str) -> None:
        """Execute a command on the system without blocking."""
        if not cmd or not cmd.strip():
            app.notify("Empty command")
            return
            
        # First try to run without shell
        try:
            args = shlex.split(cmd)
            if proc := _run_command_with_session(args, detach=True):
                return
        except Exception:
            pass  # Fall through to shell mode
            
        # Fallback to shell mode
        _run_command_with_session(cmd, shell=True, detach=True)

    def system_command_attached(cmd: str) -> None:
        """Execute a command on the system without blocking, but keep it attached to Talon's process tree."""
        if not cmd or not cmd.strip():
            app.notify("Empty command")
            return
            
        # First try to run without shell
        try:
            args = shlex.split(cmd)
            if proc := _run_command_with_session(args, detach=False):
                return
        except Exception:
            pass  # Fall through to shell mode
            
        # Fallback to shell mode
        _run_command_with_session(cmd, shell=True, detach=False)
