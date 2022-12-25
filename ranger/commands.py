# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# A simple command for demonstration purposes follows.
# -----------------------------------------------------------------------------

from __future__ import (absolute_import, division, print_function)

# You can import any python module as needed.
import os

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command


# Any class that is a subclass of "Command" will be integrated into ranger as a
# command.  Try typing ":my_edit<ENTER>" in ranger!
class my_edit(Command):
    # The so-called doc-string of the class will be visible in the built-in
    # help that is accessible by typing "?c" inside ranger.
    """:my_edit <filename>

    A sample command for demonstration purposes that opens a file in an editor.
    """

    # The execute method is called when you run this command in ranger.
    def execute(self):
        # self.arg(1) is the first (space-separated) argument to the function.
        # This way you can write ":my_edit somefilename<ENTER>".
        if self.arg(1):
            # self.rest(1) contains self.arg(1) and everything that follows
            target_filename = self.rest(1)
        else:
            # self.fm is a ranger.core.filemanager.FileManager object and gives
            # you access to internals of ranger.
            # self.fm.thisfile is a ranger.container.file.File object and is a
            # reference to the currently selected file.
            target_filename = self.fm.thisfile.path

        # This is a generic function to print text in ranger.
        self.fm.notify("Let's edit the file " + target_filename + "!")

        # Using bad=True in fm.notify allows you to print error messages:
        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return

        # This executes a function from ranger.core.acitons, a module with a
        # variety of subroutines that can help you construct commands.
        # Check out the source, or run "pydoc ranger.core.actions" for a list.
        self.fm.edit_file(target_filename)

    # The tab method is called when you press tab, and should return a list of
    # suggestions that the user will tab through.
    # tabnum is 1 for <TAB> and -1 for <S-TAB> by default
    def tab(self, tabnum):
        # This is a generic tab-completion function that iterates through the
        # content of the current directory.
        return self._tab_directory_content()


# Show in Finder
class show_files_in_finder(Command):
    """
    :show_files_in_finder
    Present selected files in finder
    """

    def execute(self):
        import subprocess
        files = ",".join(['"{0}" as POSIX file'.format(file.path) for file in self.fm.thistab.get_selection()])
        reveal_script = "tell application \"Finder\" to reveal {{{0}}}".format(files)
        activate_script = "tell application \"Finder\" to set frontmost to true"
        script = "osascript -e '{0}' -e '{1}'".format(reveal_script, activate_script)
        self.fm.notify(script)
        subprocess.check_output(["osascript", "-e", reveal_script, "-e", activate_script])


# Show files from Finder
class get_finder(Command):

    def execute(self):
        import subprocess
        import os

        finder = self.fm.execute_command("osascript -e 'tell app \"Finder\" to POSIX path of (selection as alias)'",
                                      universal_newlines=True, stdout=subprocess.PIPE)
        stdout, _ = finder.communicate()
        if finder.returncode == 0:
            selected = os.path.abspath(stdout.strip())
            if os.path.isdir(selected):
                self.fm.cd(selected)
            else:
                self.fm.select_file(selected)


# fzf integration
from ranger.api.commands import Command


class fzf_select(Command):
    """
    :fzf_select

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """
    def execute(self):
        import subprocess
        import os.path
        fzf = self.fm.execute_command("ls -A -L | fzf --reverse +m --prompt='' --bind 'alt-c:execute-silent(echo {} | pbcopy)+abort'", universal_newlines=True, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

class fzf_locate_dirs(Command):
    """
    :fzf_locate_dirs
    Find a dir using fzf.
    With a prefix argument select only directories.
    See: https://github.com/junegunn/fzf
    """
    def execute(self):
        import subprocess
        if self.quantifier:
            command="mdfind 'kind:folder' -onlyin %s %s | fzf --reverse --bind 'alt-c:execute-silent(echo {} | pbcopy)+abort' -e -i" % (os.getcwd(), self.arg(1))
        else:
            command="mdfind 'kind:folder' -onlyin %s %s | fzf --reverse --bind 'alt-c:execute-silent(echo {} | pbcopy)+abort' -e -i" % (os.getcwd(), self.arg(1))
        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

import subprocess
import os

from ranger.api.commands import Command
from ranger.ext.get_executables import get_executables

def show_error_in_console(msg, fm):
    fm.notify(msg, bad=True)

def navigate_path(fm, selected):
    if not selected:
        return

    selected = os.path.abspath(selected)
    if os.path.isdir(selected):
        fm.cd(selected)
    elif os.path.isfile(selected):
        fm.select_file(selected)
    else:
        show_error_in_console(f"Neither directory nor file: {selected}", fm)
        return

def select_with_fzf(fzf_cmd, input, fm):
    fm.ui.suspend()
    try:
        # stderr is used to open to attach to /dev/tty
        proc = subprocess.Popen(fzf_cmd, stdout=subprocess.PIPE, stdin=subprocess.PIPE, text=True)
        stdout, _ = proc.communicate(input=input)

        # ESC gives 130
        if proc.returncode not in [0, 130]:
            raise Exception(f"Bad process exit code: {proc.returncode}, stdout={stdout}")
    finally:
        fm.ui.initialize()
    return stdout.strip()

class dir_history_navigate(Command):
    def execute(self):
        lst = []
        for d in reversed(self.fm.tabs[self.fm.current_tab].history.history):
            lst.append(d.path)

        fm = self.fm
        selected = select_with_fzf(["fzf"], "\n".join(lst), fm)

        navigate_path(fm, selected)


# Tag with red
class red_tag(Command):

    def execute(self):
        # self.fm.execute_console('shell -s red %s')
        self.fm.execute_console('shell -s if [ "$(tag -l -N %s)" = "red" ]; then; tag -r "red" %s; elif [ "$(tag -l -N %s)" = "" ]; then; tag -a "red" %s; fi')
        self.fm.execute_console("tag_toggle")


# Download git
class paste_git(Command):

    def execute(self):
        import subprocess
        import os.path
        command = self.fm.execute_command("paste-git", universal_newlines=True)


# Compress Zip
from ranger.core.loader import CommandLoader

class compress(Command):
    def execute(self):
        """ Compress marked files to current directory """
        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        original_path = cwd.path
        parts = self.line.split()
        au_flags = parts[1:]

        descr = "compressing files in: " + os.path.basename(parts[1])
        obj = CommandLoader(args=['apack'] + au_flags + \
                [os.path.relpath(f.path, cwd.path) for f in marked_files], descr=descr, read=True)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)

    def tab(self, tabnum):
        """ Complete with current folder name """

        extension = ['.zip', '.tar.gz', '.rar', '.7z']
        return ['compress ' + os.path.basename(self.fm.thisdir.path) + ext for ext in extension]


# Preview
class toggle_termplug(Command):

    def execute(self):
        p = not self.fm.settings["_termplug"]
        self.fm.settings["_termplug"] = p
        self.fm.execute_console(f"termplug {'%s' if p else ''}")
        status = f"termplug {'active' if p else 'off'}"

class termplug(Command):

    def execute(self):
        do_preview = self.fm.settings["_termplug"]
        try:
            f = self.rest(1)
            if not do_preview:
                self.fm.execute_console(f"shell -s killall mpv-bundle")
            elif not termplug:
                self.fm.notify(f"termplug script not found")
            elif os.path.isfile(f):
                self.fm.execute_console(f"shell -s termplug '{f}'")
        except Exception as e:
            self.fm.notify(e)



# Quicklook / Follow files in Finder

class follow_files_in_finder(Command):

    def execute(self):
        import subprocess
        file = '"{0}"'.format(self.fm.thisfile.path)
        script1 = "set thePath to {{{0}}} as text".format(file)
        script2 = "set name_ to name of (info for thePath)"
        script3 = "set a_ to count thePath"
        script4 = "set b_ to count name_"
        script5 = "set minus_ to a_ - b_"
        script6 = "set parentPath to text 1 thru (minus_) of thePath"
        script7 = "tell application \"Finder\" to set target of front Finder window to (POSIX file parentPath)"
        script8 = "tell application \"Finder\" to reveal thePath as POSIX file"
        script9 = "tell application \"Finder\" to set frontmost to false"
        script = "osascript -e '{0}' -e '{1}' -e '{2}' -e '{3}' -e '{4}' -e '{5}' -e '{6}' -e '{7}' -e '{8}' &> /dev/null".format(script1, script2, script3, script4, script5, script6, script7, script8, script9)
        subprocess.check_output(["osascript", "-e", script1, "-e", script2, "-e", script3, "-e", script4, "-e", script5, "-e", script6, "-e", script7, "-e", script8, "-e", script9])

follow = False
class follow_files(Command):

    def execute(self):
        global follow
        follow = not follow
        if follow:
            self.fm.execute_console("shell -s open -R %s; osascript -e 'tell application \"System Events\" to keystroke \"r\" using {control down, command down, option down, shift down}' -e 'tell application \"System Events\" to click menu item \"as Gallery\" of menu 1 of menu bar item \"View\" of menu bar 1 of application process \"Finder\"' -e 'tell application \"Finder\"' -e 'tell the front window to set toolbar visible to false' -e 'end tell' -e 'tell application \"System Events\" to keystroke tab using command down'")
            self.fm.execute_console("map <UP> chain move up=1; follow_files_in_finder")
            self.fm.execute_console("map <DOWN> chain move down=1; follow_files_in_finder")
            self.fm.execute_console("map <LEFT> chain move left=1; follow_files_in_finder")
            self.fm.execute_console("map <RIGHT> chain move right=1; follow_files_in_finder")
            self.fm.execute_console("map <HOME>     chain move to=0; follow_files_in_finder")
            self.fm.execute_console("map <END>      chain move to=-1; follow_files_in_finder")
            self.fm.execute_console("map <PAGEDOWN> chain move down=10; follow_files_in_finder")
            self.fm.execute_console("map <PAGEUP>   chain move up=10; follow_files_in_finder")
            self.fm.execute_console("map w chain move up=1; follow_files_in_finder")
            self.fm.execute_console("map s chain move down=1; follow_files_in_finder")
            self.fm.execute_console("map a chain move left=1; follow_files_in_finder")
            self.fm.execute_console("map d chain move right=1; follow_files_in_finder")
            self.fm.execute_console("map e chain mark_files toggle=True; follow_files_in_finder")
            self.fm.execute_console("map <337> chain move up=1; mark_files toggle=True movedown=False; follow_files_in_finder")
            self.fm.execute_console("map <336> chain mark_files toggle=True movedown=False; move down=1; follow_files_in_finder")
            self.fm.execute_console("map <TAB>     chain tab_move 1; follow_files_in_finder")
            self.fm.execute_console("map <S-TAB>   chain tab_move -1; follow_files_in_finder")
            self.fm.execute_console("map <a-1>     chain tab_open 1; follow_files_in_finder")
            self.fm.execute_console("map <a-2>     chain tab_open 2; follow_files_in_finder")

        else:
            self.fm.execute_console("shell -s osascript -e 'tell application \"Finder\"' -e 'tell the front window to set toolbar visible to true' -e 'end tell' -e 'tell application \"Finder\" to close its front window' -e 'tell application \"Finder\" to set visible of process \"Finder\" to false'")
            # self.fm.execute_console("shell -s osascript -e 'tell application \"Finder\"' -e 'tell the front window to set toolbar visible to true' -e 'end tell' -e 'tell application \"Finder\" to set the current view of the front Finder window to list view' -e 'tell application \"Finder\" to close its front window' -e 'tell application \"Finder\" to set visible of process \"Finder\" to false'")
            self.fm.execute_console("map <UP> move up=1")
            self.fm.execute_console("map <DOWN> move down=1")
            self.fm.execute_console("map <LEFT> move left=1")
            self.fm.execute_console("map <RIGHT> move right=1")
            self.fm.execute_console("map <HOME>     move to=0")
            self.fm.execute_console("map <END>      move to=-1")
            self.fm.execute_console("map <PAGEDOWN> move down=10")
            self.fm.execute_console("map <PAGEUP>   move up=10")
            self.fm.execute_console("map w move up=1")
            self.fm.execute_console("map s move down=1")
            self.fm.execute_console("map a move left=1")
            self.fm.execute_console("map d move right=1")
            self.fm.execute_console("map e mark_files toggle=True")
            self.fm.execute_console("map <337> chain move up=1; mark_files toggle=True movedown=False")
            self.fm.execute_console("map <336> chain mark_files toggle=True movedown=False; move down=1")
            self.fm.execute_console("map <TAB>     tab_move 1")
            self.fm.execute_console("map <S-TAB>   tab_move -1")
            self.fm.execute_console("map <a-1>     tab_open 1")
            self.fm.execute_console("map <a-2>     tab_open 2")



# Opens quicklook in fullscreen on active file
class quicklook(Command):

    def execute(self):
            self.fm.execute_console("shell -s osascript -e 'tell application \"Finder\" to activate' -e 'tell application \"System Events\" to keystroke \"y\" using {command down, option down}'")





# Move word
def move_word(self, backward=False):
    if self.line:
        self.tab_deque = None

        if backward:
            if self.pos:

                for self.pos in range(self.pos-1, -1, -1):
                        if not re.match(r'[\w\d]', self.line[self.pos-1], re.U):
                            break

        else:
            if self.pos != len(self.line):

                for self.pos in range(self.pos+1, len(self.line)+1):
                    try:
                        if not re.match(r'[\w\d]', self.line[self.pos], re.U):
                            break

                    # The cursor can go off of the line
                    except IndexError:
                        pass

from ranger.gui.widgets import console
console.Console.move_word = move_word


# Paste with root privilegies
class paste_as_root(Command):
	def execute(self):
		if self.fm.do_cut:
			self.fm.execute_console('shell sudo mv %c .')
		else:
			self.fm.execute_console('shell sudo cp -r %c .')


# Check differences in folders
class dir_diff(Command):
	def execute(self):
			self.fm.execute_console('shell python ~/CLI/md5tree.py %d %D | bat --color=always --style="plain"')


# Upload File
class upload(Command):
	def execute(self):
			self.fm.execute_console('shell python3 ~/CLI/upload.py -p --saveurls ~/.urls %s; cat ~/.urls | pbcopy; truncate -s 0 ~/.urls')

# Upload zip
class upload_zip(Command):
	def execute(self):
			self.fm.execute_console('shell python3 ~/CLI/upload.py -p -z --saveurls ~/.urls %s; cat ~/.urls | pbcopy; truncate -s 0 ~/.urls')

# Upload File to 0x0
class upload_0x0(Command):
	def execute(self):
			self.fm.execute_console('shell upload-0x0 %f | pbcopy')

# Upload File to anonfiles
class upload_anonfiles(Command):
	def execute(self):
			self.fm.execute_console('shell upload-anonfiles %f')

# Upload File to bayfiles
class upload_bayfiles(Command):
	def execute(self):
			self.fm.execute_console('shell upload-bayfiles %f')

# Upload File to file.io
class upload_fileio(Command):
	def execute(self):
			self.fm.execute_console('shell upload-fileio %f')


# Airdrop
class airdrop(Command):

    def execute(self):
            self.fm.notify("Sending %s")
            self.fm.execute_console(f"shell -s airdrop '%s'")


# Copy into selected folder
class copy_selected_to_highlighted_dir(Command):
    """:copy_selected_to_highlight"""

    def execute(self):
        # Get highlighted directory
        target_dir = self.fm.thisfile.relative_path

        if not target_dir:
            self.fm.notify("Error: target directory not highlighted", bad=True)
            return

        from os.path import join, expanduser
        target_dir = join(self.fm.thisdir.path, expanduser(target_dir))

        self.fm.execute_console("copy")
        self.fm.paste(dest=target_dir)


# Move to selected folder
class move_selected_to_highlighted_dir(Command):
    """:copy_selected_to_highlight"""

    def execute(self):
        # Get highlighted directory
        target_dir = self.fm.thisfile.relative_path

        if not target_dir:
            self.fm.notify("Error: target directory not highlighted", bad=True)
            return

        from os.path import join, expanduser
        target_dir = join(self.fm.thisdir.path, expanduser(target_dir))

        self.fm.execute_console("copy")
        self.fm.do_cut = True
        self.fm.paste(dest=target_dir)

# Find in file
class fzf_rga_documents_search(Command):
    """
    :fzf_rga_search_documents
    Search in PDFs, E-Books and Office documents in current directory.
    Allowed extensions: .epub, .odt, .docx, .fb2, .ipynb, .pdf.

    Usage: fzf_rga_search_documents <search string>
    """
    def execute(self):
        if self.arg(1):
            search_string = self.rest(1)
        else:
            self.fm.notify("Usage: fzf_rga_search_documents <search string>", bad=True)
            return

        import subprocess
        import os.path
        from ranger.container.file import File
        command="rga '%s' . --rga-adapters=pandoc,poppler | fzf +m | awk -F':' '{print $1}'" % search_string
        fzf = self.fm.execute_command(command, universal_newlines=True, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.rstrip('\n'))
            self.fm.execute_file(File(fzf_file))
