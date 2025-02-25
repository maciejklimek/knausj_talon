app: vscode
and not tag: terminal
-
###############################################################################
### Git
###############################################################################
open changes: user.vscode("gitlens.diffWithPrevious")
open changes revision: user.vscode("gitlens.diffWithRevision")
lense branches: user.vscode("gitlens.showBranchesView")
git branch: user.vscode("git.branchFrom")
git branch this: user.vscode("git.branch")
git checkout [<user.text>]:
    user.vscode("git.checkout")
    sleep(50ms)
    insert(text or "")
# git commit [<user.text>]:
#     user.vscode("git.commitStaged")
#     sleep(100ms)
#     user.insert_formatted(text or "", "CAPITALIZE_FIRST_WORD")

git commit undo: user.vscode("git.undoCommit")
# git commit amend: user.vscode("git.commitStagedAmend")
git diff: user.vscode("git.openChange")
(git discard|go discard): user.vscode("git.clean")
git discard all: user.vscode("git.cleanAll")
git ignore: user.vscode("git.ignore")
git merge: user.vscode("git.merge")
git output: user.vscode("git.showOutput")
# git pull: user.vscode("git.pullRebase")
# git push: user.vscode("git.push")
git push force: user.vscode("git.pushForce")
# git rebase: user.vscode("git.rebase")
git fetch all: user.vscode("git.fetchAll")
git rebase abort: user.vscode("git.rebaseAbort")
git reveal: user.vscode("git.revealInExplorer")
git revert: user.vscode("git.revertChange")
revert range: user.vscode("git.revertSelectedRanges")
git stash: user.vscode("git.stash")
git stash pop: user.vscode("git.stashPop")
# git status: user.vscode("workbench.scm.focus")
(git stage|stage this): user.vscode("git.stage")
git stage all: user.vscode("git.stageAll")
git unstage: user.vscode("git.unstage")
git unstage all: user.vscode("git.unstageAll")
pull request: user.vscode("pr.create")