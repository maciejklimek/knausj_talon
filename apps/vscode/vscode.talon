app: vscode
-
tag(): user.multiple_cursors

# tag(): user.snippets # TODO: fix this
tag(): user.splits
tag(): user.tabs


window reload: user.vscode("workbench.action.reloadWindow")
window close: user.vscode("workbench.action.closeWindow")
#multiple_cursor.py support end
settings():
    speech.timeout = 0.300
    key_wait = 2

coder <user.vscode_project_names>$:
    user.vscode_open_project(vscode_project_names)
    
please [<user.text>]$:
    user.vscode("workbench.action.showCommands")
    insert(user.text or "")

###############################################################################
### Side Bar
###############################################################################
bar toggle$: user.vscode("workbench.action.toggleSidebarVisibility")
# what is the difference with workbench.view.explorer vs action.focusFilesExplorer?
explore$: user.vscode("workbench.view.explorer")
# explore$: user.vscode("filetree.focus")
bar|ba project$: user.vscode("workbench.view.extension.project-manager")
bar|ba testing|test$: user.vscode("workbench.view.extension.test")
^bar|ba extensions$: user.vscode("workbench.view.extensions")
^outline [focus]$: user.vscode("outline.focus")
[bar|ba] debug$: user.vscode("workbench.view.debug")

editor$: user.vscode("workbench.action.focusActiveEditorGroup")
[bar|ba] source$: user.vscode("workbench.view.scm")


replace: user.vscode("editor.action.startFindReplaceAction")

focus side: user.vscode("workbench.action.focusSideBar")

# focus editor: user.vscode("workbench.action.focusActiveEditorGroup")

# Settings
settings (go|show): user.vscode("workbench.action.openGlobalSettings")
settings json: user.vscode("workbench.action.openSettingsJson")
settings default: user.vscode("workbench.action.openRawDefaultSettings")

shortcuts (go|show): user.vscode("workbench.action.openGlobalKeybindings")
shortcuts json: user.vscode("workbench.action.openGlobalKeybindingsFile")

# Notebooks
# cell exec: user.vscode("jupyter.runcurrentcell")
cell (exec|execute): key("ctrl-enter")
cell advance: key("shift-enter")
# cell advance: user.vscode("jupyter.runcurrentcelladvance")

# Display
centered switch: user.vscode("workbench.action.toggleCenteredLayout")
fullscreen switch: user.vscode("workbench.action.toggleFullScreen")
theme switch: user.vscode("workbench.action.selectTheme")
wrap switch: user.vscode("editor.action.toggleWordWrap")
zen switch: user.vscode("workbench.action.toggleZenMode")


###############################################################################
### Tests
###############################################################################
test run all: 
    user.vscode("workbench.view.extension.test")
    user.vscode("testing.runAll")

test debug all: 
    user.vscode("workbench.view.extension.test")
    user.vscode("testing.debugAll")

# File Commands bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(lion|dock) [<user.text>]:
    user.vscode("workbench.action.quickOpen")
    sleep(100ms)
    insert(text or "")

    # # TODO: we would like to limit user.text only to the words appearing in open editors
    # tab [<user.text>]:
    #     user.vscode("workbench.action.showAllEditors")
    #     sleep(20ms)
    #     insert(text or "")
    #     sleep(300ms)
    #     key(enter)

pop (lion|dock) [<user.text>]:
    user.vscode("workbench.action.quickOpen")
    sleep(50ms)
    user.maybe_sleep(50, text or "")
    key(enter)

###############################################################################
### File Commands
###############################################################################
file duplicate: user.vscode("fileutils.duplicateFile")
file copy path: user.vscode("copyFilePath")
file copy relative: user.vscode("copyRelativeFilePath")
file copy link: user.vscode("gitlens.copyRemoteFileUrlToClipboard")
file copy name: user.vscode("fileutils.copyFileName")
file create sibiling: user.vscode_and_wait("fileutils.newFile")
file new: user.vscode_and_wait("explorer.newFile")
file create: user.vscode("workbench.action.files.newUntitledFile")
file rename:
    user.vscode("fileutils.renameFile")
    sleep(150ms)
    # Why do I have  all this sleeps here
folder new: user.vscode_and_wait("explorer.newFolder")
file move:
    user.vscode("fileutils.moveFile")
    sleep(150ms)
file remove:
    user.vscode("fileutils.removeFile")
file open folder: user.vscode("revealFileInOS")
(file reveal|show in tree): user.vscode("workbench.files.action.showActiveFileInExplorer")
save ugly: user.vscode("workbench.action.files.saveWithoutFormatting")

###############################################################################
### Language Features
###############################################################################
bracket match: user.vscode("editor.action.jumpToBracket")
pop symbol:
    user.vscode("workbench.action.showAllSymbols")
    sleep(200ms)
    key(enter)

symbol:
    user.vscode("workbench.action.showAllSymbols")
symbol find [<user.text>]$:
    user.vscode("workbench.action.gotoSymbol")
    sleep(50ms)
    insert(text or "")

symbol search [<user.text>]$:
    user.vscode("workbench.action.showAllSymbols")
    sleep(50ms)
    insert(text or "")
sense [<user.text>]$:
    insert(user.text or "")
    sleep(10ms)
    user.vscode("editor.action.triggerSuggest")
# ^sense param$:              user.vscode("editor.action.triggerParameterHints")
hint: user.vscode("editor.action.triggerParameterHints")

follow: user.vscode("editor.action.revealDefinition")



follow dumb:
    edit.select_word()
    user.vscode("workbench.action.findInFiles")
    sleep(50ms)
    insert(text or "")

def peek: user.vscode("editor.action.peekDefinition")
# refs peek: user.vscode("editor.action.referenceSearch.trigger")

(dev side|def side|define side): user.vscode("editor.action.revealDefinitionAside")
define: user.vscode("editor.action.revealDefinition")
type show: user.vscode("editor.action.peekTypeDefinition")
^refs$: user.vscode("editor.action.goToReferences")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# open side: user.vscode("search.action.openResultToSide")
open side: key(ctrl-enter)
format doc: user.vscode("editor.action.formatDocument")
format selection: user.vscode("editor.action.formatSelection")
format that choice: user.vscode("editor.action.formatSelection.multiple")
format that: user.vscode("editor.action.formatSelection")
imports fix: user.vscode("editor.action.organizeImports")
problem next: user.vscode("editor.action.marker.nextInFiles")
problem last: user.vscode("editor.action.marker.prevInFiles")
problem fix: user.vscode("problems.action.showQuickFixes")
rename that: user.vscode("editor.action.rename")


whitespace trim: user.vscode("editor.action.trimTrailingWhitespace")
language switch: user.vscode("workbench.action.editor.changeLanguageMode")

refactor (this|that): user.vscode("editor.action.refactor")


#code navigation
# (go declaration | follow): user.vscode("editor.action.revealDefinition")
back$: 
    user.vscode("workbench.action.navigateBack")
    user.set_next_action("back")

front$: 
    user.vscode("workbench.action.navigateForward")
    user.set_next_action("front")

# implementation: user.vscode("editor.action.goToImplementation")
# type: user.vscode("editor.action.goToTypeDefinition")
# usage: user.vscode("references-view.find")

folder open: user.vscode("workbench.action.files.openFileFolder")

link v s code: user.vscode("remoteHub.copyVscodeDevLinkFile")

# It will show  folders  to open,  not recent open files.
go recent [<user.text>]:
    user.vscode("workbench.action.openRecent")
    sleep(50ms)
    insert(text or "")
    sleep(250ms)

    # Bookmarks. Requires Bookmarks plugin
    # go marks: user.vscode("workbench.view.extension.bookmarks")
    # toggle mark: user.vscode("bookmarks.toggle")
    # go next mark: user.vscode("bookmarks.jumpToNext")
    # go last mark: user.vscode("bookmarks.jumpToPrevious")

    # Folding
    # fold that: user.vscode("editor.fold")
    # unfold that: user.vscode("editor.unfold")
    # fold those: user.vscode("editor.foldAllMarkerRegions")
    # unfold those: user.vscode("editor.unfoldRecursively")
    # fold all: user.vscode("editor.foldAll")
    # unfold all: user.vscode("editor.unfoldAll")
    # fold comments: user.vscode("editor.foldAllBlockComments")

    # Git / Github (not using verb-noun-adjective pattern, mirroring terminal commands.)



change next: key(alt-f5)
change last: key(shift-alt-f5)

###############################################################################
### Debugging
###############################################################################
break point remove all: user.vscode("workbench.debug.viewlet.action.removeAllBreakpoints")
break point: user.vscode("editor.debug.action.toggleBreakpoint")
step over: user.vscode("workbench.action.debug.stepOver")
debug step into: user.vscode("workbench.action.debug.stepInto")
debug step out [of]: user.vscode("workbench.action.debug.stepOut")
debug start: user.vscode("workbench.action.debug.start")
debug pause: user.vscode("workbench.action.debug.pause")
debug stop: user.vscode("workbench.action.debug.stop")
debug continue: user.vscode("workbench.action.debug.continue")
debug restart: user.vscode("workbench.action.debug.restart")
debug console: user.vscode("workbench.debug.action.toggleRepl")
debug shell: user.vscode("workbench.debug.action.toggleRepl")

###############################################################################
### Terminal panel
###############################################################################
terminal external: user.vscode("workbench.action.terminal.openNativeConsole")
terminal new: user.vscode("workbench.action.terminal.new")
terminal next: user.vscode("workbench.action.terminal.focusNext")
terminal last: user.vscode("workbench.action.terminal.focusPrevious")
terminal split: user.vscode("workbench.action.terminal.split")
terminal zoom: user.vscode("workbench.action.toggleMaximizedPanel")
terminal trash: user.vscode("workbench.action.terminal.kill")
terminal toggle: user.vscode_and_wait("workbench.action.terminal.toggleTerminal")
terminal scroll up: user.vscode("workbench.action.terminal.scrollUp")
terminal scroll down: upser.vscode("workbench.action.terminal.scrollDown")
terminal <number_small>: user.vscode_terminal(number_small)
terminal: user.vscode("workbench.action.terminal.toggleTerminal")
shell: user.vscode("workbench.action.terminal.focus")

###############################################################################
### Panel
###############################################################################
panel maximize|max: user.vscode("workbench.action.toggleMaximizedPanel")

# Panels
panel debug: user.vscode("workbench.panel.repl.view.focus")
panel output: user.vscode("workbench.panel.output.focus")
panel problems: user.vscode("workbench.panel.markers.view.focus")
panel switch: user.vscode("workbench.action.togglePanel")
panel terminal: user.vscode("workbench.panel.terminal.focus")
panel (close|hide): user.vscode("workbench.action.closePanel")


###############################################################################
### Terminal in editor tab
###############################################################################
console new:
    user.vscode("workbench.action.createTerminalEditor")
console side new:
    user.vscode("workbench.action.createTerminalEditorSide")

# Find a better way to switch to terminal in editor tab.
console switch:
    user.vscode("workbench.action.quickOpen")
    sleep(50ms)
    insert("fish")
    sleep(50ms)
    key(enter)



#Expand/Shrink AST Selection
select less: user.vscode("editor.action.smartSelect.shrink")
select (more|this): user.vscode("editor.action.smartSelect.expand")
# tina: user.vscode("editor.action.smartSelect.expand")


minimap: user.vscode("editor.action.toggleMinimap")
maximize: user.vscode("workbench.action.minimizeOtherEditors")
restore: user.vscode("workbench.action.evenEditorWidths")
keep editor: user.vscode("workbench.action.keepEditor")
replace here:
    user.replace("")
    key(cmd-alt-l)

hover [show]: user.vscode("editor.action.showHover")

join lines: user.vscode("editor.action.joinLines")

full screen: user.vscode("workbench.action.toggleFullScreen")

curse undo: user.vscode("cursorUndo")

select word: user.vscode("editor.action.addSelectionToNextFindMatch")
skip word: user.vscode("editor.action.moveSelectionToNextFindMatch")

# jupyter
# cell next: user.vscode("jupyter.gotoNextCellInFile")
# cell last: user.vscode("jupyter.gotoPrevCellInFile")
# cell run above: user.vscode("jupyter.runallcellsabove.palette")
# cell run: user.vscode("jupyter.runcurrentcell")

# install local: user.vscode("workbench.extensions.action.installVSIX")

###############################################################################
### Navigation between editors
###############################################################################
# pop:
#     user.vscode("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
#     sleep(10ms)
#     key(enter)
# pop wait:
#     user.vscode("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
# next: app.tab_next()
# last: app.tab_previous()

# copied from line_commands.talon
# Cursor navigation
go line <number>: edit.jump_line(number)
go line <number> end:
    edit.jump_line(number)
    edit.line_end()

    # lend: edit.line_end()
    # bend: edit.line_start()

###############################################################################
### Coping, cutting, cloning, selecting stuff
###############################################################################
copy line down: user.vscode("editor.action.copyLinesDownAction")
copy line up: user.vscode("editor.action.copyLinesUpAction")
# scratchpad: user.vscode("extension.openScratchpad")

# take <number> line:
#     user.select_next_lines(number)

# cut <number> line:
#     user.select_next_lines(number)
#     sleep(10ms)
#     key(cmd-x)

# copy <number> line:
#     user.select_next_lines(number)
#     key(cmd-c)
#     sleep(100ms)
#     key(esc)

# clone <number> line:
#     user.select_next_lines(number)
#     key(cmd-c)
#     sleep(10ms)
#     key(right cmd-v)
#     sleep(10ms)

# (clear|wipe) <number> line:
#     user.select_next_lines(number)
#     key(delete)


###############################################################################
### Indentation
###############################################################################
justify:
    key(up end)
    insert("\n")

indent <number> line:
    user.select_next_lines(number)
    edit.indent_more()

dis dent <number> line:
    user.select_next_lines(number)
    edit.indent_less()

toast close: user.vscode("notifications.clearAll")
toast accept:
    user.vscode("notifications.focusToasts")
    sleep(100ms)
    key(tab)
    key(enter)

toast focus:
    user.vscode("notifications.focusToasts")
    sleep(100ms)
    key(tab)


take next$:
    key(cmd-d)
    user.set_next_action("take next")


###############################################################################
### Searching within editor or whole workspace
###############################################################################
# show recent: user.vscode("work55bench.action.showAllEditorsByMostRecentlyUsed")

[go] search [<user.text>]$:
    user.vscode("workbench.action.findInFiles")
    sleep(50ms)
    insert(text or "")
    user.set_next_action("next")

[go] search that$:
    user.vscode("workbench.action.findInFiles")
    sleep(50ms)
    edit.paste()
    user.set_next_action("next")


[go] search <user.format_text>$:
    user.vscode("workbench.action.findInFiles")
    sleep(50ms)
    insert(format_text)
    user.set_next_action("next")


[go] search this$:
    key(cmd-d)
    key(cmd-shift-f)
    key(enter)
    user.set_next_action("next")


[go] find [<user.text>]$:
    print("go find")
    user.vscode("actions.find")
    sleep(50ms)
    insert(text or "")
    user.set_next_action("go")

[go] find that$:
    user.vscode("actions.find")
    sleep(50ms)
    edit.paste()
    key(enter)
    user.set_next_action("go")

[go] find this$:
    key(cmd-d)
    key(cmd-f)
    key(enter)
    user.set_next_action("go")

###############################################################################
### Commenting stuff & TODOs
###############################################################################

^to do create [<phrase>]$:
    insert("# TODO: ")
    user.dictation_mode(phrase or "")

^to do create me [<phrase>]$:
    insert("# TODO(maciejk): ")
    user.dictation_mode(phrase or "")

^note create [<phrase>]$:
    insert("# NOTE: ")
    user.dictation_mode(phrase or "")

^note create me [<phrase>]$:
    insert("# NOTE(maciejk): ")
    user.dictation_mode(phrase or "")

^comment new [<phrase>]$:
    code.toggle_comment()
    user.dictation_mode(phrase or "")

^comment <number> line:
    user.select_next_lines(number)
    sleep(10ms)
    user.vscode("editor.action.commentLine")

comment this: code.toggle_comment()

comment clone|clomment: 
    edit.selection_clone()
    code.toggle_comment()

###############################################################################
### project navigation
###############################################################################
proj|project [<user.text>] wait:
    user.vscode("workbench.action.openRecent")
    sleep(50ms)
    insert(text or "")

(proj|project) [<user.text>]:
    user.vscode("workbench.action.openRecent")
    sleep(50ms)
    insert(text or "")
    user.maybe_sleep(100, text or "")
    user.maybe_enter(text or "")

    # This is for github copilot
(take it|accept):
    key(tab)
folder new:
    user.vscode("explorer.newFolder")
finder show: user.vscode("revealFileInOS")

###############################################################################
### Uncategorised
###############################################################################
scratchpad new: user.vscode("scratchpads.newScratchpad")
scratchpad open: user.vscode("scratchpads.openScratchpad")
record keys: user.vscode("keybindings.editor.recordSearchKeys")
folders collapse:
    user.vscode("workbench.files.action.collapseExplorerFolders")
fix this: user.vscode("editor.action.quickFix")
^funk|funky refs$: 
    user.engine_mimic("take funk name this")
    sleep(50ms)
    user.engine_mimic("refs")

###############################################################################
### cursorless
###############################################################################
cursorless record: user.vscode("cursorless.recordTestCase")
cursorless toggle: user.vscode("cursorless.toggleDecorations")

vim toggle: user.vscode("toggleVim")

# code time dashboard: user.vscode("codetime.viewDashboard")

index:
    insert("[]")
    key(left)
call this:
    insert("()")
    key(left)

context:
    key(shift-f10)



snippets go: user.vscode("snippetExplorer.open")
snippet create: user.vscode("easySnippet.run")
command copy id: user.command_copy_id()

###############################################################################
### search view
###############################################################################
^[result] next: key(f4)
    # user.vscode("search.action.focusNextSearchResult")

    # TODO: there was a program with command "search limit talon" it was mis recognized.
    # I had to change to "limit search talon" it is a wider problem

limit search talon: user.vscode_limit_search("talon")
limit search python: user.vscode_limit_search("python")
limit search none: user.vscode_limit_sort("")

^jump {user.file_shortcuts}$: user.vscode_quick_open(user.file_shortcuts)

bracket jump: user.vscode("editor.action.jumpToBracket")
# zoom out:user.vscode("workbench.action.zoomOut")
# zoom in:user.vscode("workbench.action.zoomIn")
font smaller:user.vscode("editor.action.fontZoomOut")
font bigger:user.vscode("editor.action.fontZoomIn")


###############################################################################
### split
###############################################################################
# this is taken mainly from andreas,
group focus: user.vscode("workbench.action.toggleEditorWidths")
group one: user.vscode("workbench.action.focusFirstEditorGroup")
group two: user.vscode("workbench.action.focusSecondEditorGroup")
group three: user.vscode("workbench.action.focusThirdEditorGroup")
group next:user.vscode("workbench.action.focusNextGroup")
group last:user.vscode("workbench.action.focusPreviousGroup")

split new: user.vscode("workbench.action.splitEditor")
split flip:              user.vscode("workbench.action.toggleEditorGroupLayout")
split clear:             user.vscode("workbench.action.joinTwoGroups")

split up:                user.vscode("workbench.action.moveEditorToAboveGroup")
split down:              user.vscode("workbench.action.moveEditorToBelowGroup")
split left:              user.vscode("workbench.action.moveEditorToLeftGroup")
split right:             user.vscode("workbench.action.moveEditorToRightGroup")
copilot split:
    key(ctrl-enter)
    sleep(100ms)

# Editor tabs and editor groups stuff.
close everything: user.vscode("workbench.action.closeAllGroups")
close others: user.vscode("workbench.action.closeOtherEditors")
close all others:
    user.vscode("workbench.action.closeOtherEditors")
    user.vscode("workbench.action.closeEditorsInOtherGroups")

move left: user.vscode("workbench.action.moveEditorLeftInGroup")
move right: user.vscode("workbench.action.moveEditorRightInGroup")
move last: user.vscode("workbench.action.moveEditorToPreviousGroup")
move next: user.vscode("workbench.action.moveEditorToNextGroup")
focus group: user.vscode("workbench.action.toggleEditorWidths")
close group: user.vscode("workbench.action.closeEditorsInGroup")
one group: user.vscode("workbench.action.closeEditorsInOtherGroups")

(cross|group next): user.vscode("workbench.action.focusNextGroup")
group last: user.vscode("workbench.action.focusPreviousGroup")




# ###############################################################################
# ### KeyPad shortcuts
# ###############################################################################
# NOTE: keypad_period, keypad_asterisk does not work, keypad_enter is working
# In the past mapped the keypad keys to some strange shortcuts But I'm not sure which application I was using to do that

key(keypad_3): key(cmd-right)
key(keypad_7): key(cmd-`)
key(keypad_enter): key(tab)
#key(keypad_multiply): key(cmd-right) 

# this is a workaround for the keypad_0, keypad_period not working
# for this to work there has to be a mapping in Karabiner. 
# NOTE: this is not working
key(shift-alt-cmd-ctrl-0): user.engine_mimic("twice")
key(shift-alt-cmd-ctrl-p): key(cmd-right)


# key(keypad_0): insert("ok"))
# key(keypad_0): key(cmd-right)

# key(shift-cmd-alt-ctrl-9):
#     key(cmd-alt-right)
# key(shift-cmd-alt-ctrl-8):
#     key(cmd-alt-left)
#     # asterisk
# key(shift-cmd-alt-ctrl-a):
#     key(cmd-pagedown)
#     # user.vscode("workbench.action.nextEditorInGroup")
# key(shift-cmd-alt-ctrl-/):
#     key(cmd-pageup)
#     # user.vscode("workbench.action.previousEditorInGroup")
#     # hyphen
# key(shift-cmd-alt-ctrl-m):
#     key(cmd-w)
# key(keypad_5):
#     key(ctrl-`)

###############################################################################
### Image clicking  
###############################################################################

# confirm apply:
#         user.mouse_helper_position_save()
#         user.mouse_helper_move_image_relative("2023-11-24_12.05.56.094647.png", 0)
#         sleep(0.05)
#         mouse_click(0)
#         sleep(0.05)
#         user.mouse_helper_position_restore()