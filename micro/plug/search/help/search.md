# Search

The `search` plugin provides easy searching for the word under cursor
or the selected text, with just one keystroke. Also it provides easy
searching for the word upon a mouse click on this word (this latter
feature is inspired by the [Acme](http://acme.cat-v.org) editor).

* Pressing `Alt-s` will search for the next occurrence of the word under
  the cursor. If there is a text selection, it will search for the
  selected text instead.

* Clicking the right mouse button on a word will search for the next
  occurrence of that word. If there is no word under the mouse click,
  it will unhighlight the current search.

You can easily bind these actions to some others keys instead of the
default `Alt-s` and `MouseRight` if you like, by modifying the
corresponding default bindings in your `bindings.json` file, e.g.:

```json
{
    "Alt-g": "lua:search.searchWord",
    "Alt-MouseLeft": "lua:search.searchClick"
}
```
