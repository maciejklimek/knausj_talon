import subprocess
from colorama import Fore, Style


def run_cmd(cmd, cwd=None, exit_on_error=True):
    print(Fore.GREEN + f'Running command: "{cmd}", cwd = {cwd}')
    print(Style.RESET_ALL)
    completed_process = subprocess.run(cmd, shell=True, cwd=cwd)
    if completed_process.returncode != 0:
        print(Fore.RED + f"Command failed: {cmd}")
        print(Style.RESET_ALL)
        if exit_on_error:
            exit(1)
