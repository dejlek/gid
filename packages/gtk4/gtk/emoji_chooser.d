module gtk.emoji_chooser;

import gid.gid;
import gobject.dclosure;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.popover;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;

/**
 * The `GtkEmojiChooser` is used by text widgets such as `GtkEntry` or
 * `GtkTextView` to let users insert Emoji characters.
 * ![An example GtkEmojiChooser](emojichooser.png)
 * `GtkEmojiChooser` emits the signal@Gtk.EmojiChooser::emoji-picked
 * signal when an Emoji is selected.
 * # CSS nodes
 * ```
 * popover
 * ├── box.emoji-searchbar
 * │   ╰── entry.search
 * ╰── box.emoji-toolbar
 * ├── button.image-button.emoji-section
 * ├── ...
 * ╰── button.image-button.emoji-section
 * ```
 * Every `GtkEmojiChooser` consists of a main node called popover.
 * The contents of the popover are largely implementation defined
 * and supposed to inherit general styles.
 * The top searchbar used to search emoji and gets the .emoji-searchbar
 * style class itself.
 * The bottom toolbar used to switch between different emoji categories
 * consists of buttons with the .emoji-section style class and gets the
 * .emoji-toolbar style class itself.
 */
class EmojiChooser : gtk.popover.Popover
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_emoji_chooser_get_type != &gidSymbolNotFound ? gtk_emoji_chooser_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkEmojiChooser`.
   * Returns: a new `GtkEmojiChooser`
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_emoji_chooser_new();
    this(_cretval, No.Take);
  }

  /**
   * Emitted when the user selects an Emoji.
   * Params
   *   text = the Unicode sequence for the picked Emoji, in UTF-8
   *   emojiChooser = the instance the signal is connected to
   */
  alias EmojiPickedCallbackDlg = void delegate(string text, gtk.emoji_chooser.EmojiChooser emojiChooser);
  alias EmojiPickedCallbackFunc = void function(string text, gtk.emoji_chooser.EmojiChooser emojiChooser);

  /**
   * Connect to EmojiPicked signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectEmojiPicked(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EmojiPickedCallbackDlg) || is(T : EmojiPickedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto emojiChooser = getVal!(gtk.emoji_chooser.EmojiChooser)(_paramVals);
      auto text = getVal!(string)(&_paramVals[1]);
      _dClosure.dlg(text, emojiChooser);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("emoji-picked", closure, after);
  }
}
