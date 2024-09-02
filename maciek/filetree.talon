app: vscode
-
# This opens the file tree in the sidebar
bar tree: user.vscode("workbench.view.extension.filetree")

# File tree commands
chair|foot <user.letters>:
    user.run_rpc_command("talon-filetree.toggleDirectoryOrOpenFile", letters)
chair|foot parent <user.letters>:
    user.run_rpc_command("talon-filetree.closeParent", letters)
chair|foot <user.letters> <number>:
    user.run_rpc_command("talon-filetree.expandDirectory", letters, number)
chair|foot collapse <user.letters>:
    user.run_rpc_command("talon-filetree.expandDirectory", letters, 0)
chair|foot move <user.letters> to <user.letters>:
    user.run_rpc_command("talon-filetree.moveFile", letters_1, letters_2)
chair|foot move <user.letters> [to] root:
    user.run_rpc_command("talon-filetree.moveFile", letters_1)
# the recommended way to open a file is using the "toggleDirectoryOrOpenFile" command
# but this may be useful for people that want to separate the two actions
# e.g. to create very distinct commands that are easier for talon to differentiate
chair|foot open <user.letters>:
    user.run_rpc_command("talon-filetree.openFile", letters)
chair|foot rename <user.letters>: 
    user.run_rpc_command("talon-filetree.renameFile", letters)
chair|foot create <user.letters>:
    user.run_rpc_command("talon-filetree.createFile", letters)
chair|foot delete <user.letters>:
    user.run_rpc_command("talon-filetree.deleteFile", letters)
chair|foot collapse root:
    user.run_rpc_command("talon-filetree.collapseRoot")
chair|foot select <user.letters>:
    user.run_rpc_command("talon-filetree.select", letters)
chair|foot git:
    user.run_rpc_command("talon-filetree.toggleGitIgnoredFiles")
chair|foot current:
    user.run_rpc_command("talon-filetree.revealCurrentFile")
chair|foot hunt <user.letters> [for <user.text>]:
    user.run_rpc_command_and_wait("talon-filetree.findInFolder", letters)
    insert(text or "")