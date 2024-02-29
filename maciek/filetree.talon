app: vscode
-
# This opens the file tree in the sidebar
bar tree: user.vscode("workbench.view.extension.filetree")

# File tree commands
chair <user.letters>:
    user.run_rpc_command("talon-filetree.toggleDirectoryOrOpenFile", letters)
chair parent <user.letters>:
    user.run_rpc_command("talon-filetree.closeParent", letters)
chair <user.letters> <number>:3
    user.run_rpc_command("talon-filetree.expandDirectory", letters, number)
chair collapse <user.letters>:
    user.run_rpc_command("talon-filetree.expandDirectory", letters, 0)
chair move <user.letters> to <user.letters>:
    user.run_rpc_command("talon-filetree.moveFile", letters_1, letters_2)
chair move <user.letters> [to] root:
    user.run_rpc_command("talon-filetree.moveFile", letters_1)
# the recommended way to open a file is using the "toggleDirectoryOrOpenFile" command
# but this may be useful for people that want to separate the two actions
# e.g. to create very distinct commands that are easier for talon to differentiate
chair open <user.letters>:
    user.run_rpc_command("talon-filetree.openFile", letters)
chair rename <user.letters>: 
    user.run_rpc_command("talon-filetree.renameFile", letters)
chair create <user.letters>:
    user.run_rpc_command("talon-filetree.createFile", letters)
chair delete <user.letters>:
    user.run_rpc_command("talon-filetree.deleteFile", letters)
chair collapse root:
    user.run_rpc_command("talon-filetree.collapseRoot")
chair select <user.letters>:
    user.run_rpc_command("talon-filetree.select", letters)
chair git:
    user.run_rpc_command("talon-filetree.toggleGitIgnoredFiles")
chair current:
    user.run_rpc_command("talon-filetree.revealCurrentFile")
chair hunt <user.letters> [for <user.text>]:
    user.run_rpc_command_and_wait("talon-filetree.findInFolder", letters)
    insert(text or "")