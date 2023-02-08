# This file is part of ranger, the console file manager.
# License: GNU GPL version 3, see the file "AUTHORS" for details.

from __future__ import (absolute_import, division, print_function)

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    black, blue, cyan, green, magenta, red, white, yellow, default,
    normal, bold, reverse, dim, BRIGHT,
    default_colors,
)


class Default(ColorScheme):
    progress_bar_color = green

    def use(self, context):  # pylint: disable=too-many-branches,too-many-statements
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = bold
                fg = default
            if context.empty or context.error:
                fg = 160
                attr = bold
            if context.border:
                fg = 7
                attr |= bold
            if context.media:
                fg = 208
                attr |= bold
            if context.document:
                fg = default
                attr |= bold
            if context.container:
                fg = blue
                attr |= bold
            if context.directory:
                attr |= bold
                fg = green
                fg += normal
            elif context.executable and not \
                    any((context.media, context.container,
                         context.fifo, context.socket)):
                attr |= bold
                fg = yellow
                fg += normal
            if context.socket:
                attr |= bold
                fg = blue
                fg += normal
            if context.fifo or context.device:
                attr |= bold
                fg = blue
                if context.device:
                    fg += normal
            if context.link:
                attr |= bold
                fg = blue if context.good else 160
            if context.tag_marker and not context.selected:
                if fg in (red, magenta):
                    attr |= bold
                    fg = 160
                else:
                    attr |= bold
                    fg = 160
                fg += normal
                attr |= bold
            if not context.selected and (context.cut or context.copied):
                fg = default
                fg += normal
                # If the terminal doesn't support bright colors, use dim white
                # instead of black.
                if BRIGHT == 0:
                    attr |= normal
                    fg = white
            if context.main_column:
                # Doubling up with BRIGHT here causes issues because it's
                # additive not idempotent.
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= reverse
            if context.badinfo:
                if attr & reverse:
                    bg = 160
                    attr |= bold
                else:
                    fg = 160
                    attr |= bold

            if context.inactive_pane:
                attr |= dim
                fg = 22


        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = 160 if context.bad else green
                attr |= dim
            elif context.directory:
                fg = green
                attr |= bold
            elif context.tab:
                if context.good:
                    fg = green
                    attr |= bold
                else:
                    fg = 22
                    attr |= bold
            elif context.link:
                fg = yellow
                attr |= bold

        elif context.in_statusbar:
            fg = green
            attr |= bold
            if context.permissions:
                if context.good:
                    fg = 208
                    attr |= bold
                elif context.bad:
                    fg = 160
                    attr |= bold
            if context.marked:
                attr |= bold | reverse
                fg = yellow
                fg += normal
            if context.frozen:
                attr |= bold | reverse
                fg = yellow
                fg += normal
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 160
                    fg += normal
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = blue
                attr &= ~bold
            if context.vcscommit:
                fg = magenta
                attr &= ~bold
            if context.vcsdate:
                fg = yellow
                attr &= ~bold

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = magenta

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = 160
            elif context.vcsuntracked:
                fg = yellow
            elif context.vcschanged:
                fg = magenta
            elif context.vcsunknown:
                fg = 160
            elif context.vcsstaged:
                fg = green
                attr |= dim
            elif context.vcssync:
                fg = green
                attr |= dim
            elif context.vcsignored:
                fg = default
                attr |= bold

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync or context.vcsnone:
                fg = green
                attr |= dim
            elif context.vcsbehind:
                fg = 160
            elif context.vcsahead:
                fg = blue
            elif context.vcsdiverged:
                fg = magenta
            elif context.vcsunknown:
                fg = 160

        return fg, bg, attr
