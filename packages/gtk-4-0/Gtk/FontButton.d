module Gtk.FontButton;

import GObject.DClosure;
import GObject.ObjectG;
import Gid.gid;
import Gtk.Accessible;
import Gtk.AccessibleT;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.ConstraintTarget;
import Gtk.ConstraintTargetT;
import Gtk.FontChooser;
import Gtk.FontChooserT;
import Gtk.Types;
import Gtk.Widget;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * The `GtkFontButton` allows to open a font chooser dialog to change
 * the font.
 * ![An example GtkFontButton](font-button.png)
 * It is suitable widget for selecting a font in a preference dialog.
 * # CSS nodes
 * ```
 * fontbutton
 * ╰── button.font
 * ╰── [content]
 * ```
 * `GtkFontButton` has a single CSS node with name fontbutton which
 * contains a button node with the .font style class.

 * Deprecated: Use [Gtk.FontDialogButton] instead
 */
class FontButton : Widget, FontChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gtk_font_button_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin FontChooserT!();

  /**
   * Creates a new font picker widget.
   * Returns: a new font picker widget.

   * Deprecated: Use [Gtk.FontDialogButton] instead
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_button_new();
    this(_cretval, No.Take);
  }

  /**
   * Creates a new font picker widget showing the given font.
   * Params:
   *   fontname = Name of font to display in font chooser dialog
   * Returns: a new font picker widget.

   * Deprecated: Use [Gtk.FontDialogButton] instead
   */
  static FontButton newWithFont(string fontname)
  {
    GtkWidget* _cretval;
    const(char)* _fontname = fontname.toCString(No.Alloc);
    _cretval = gtk_font_button_new_with_font(_fontname);
    auto _retval = ObjectG.getDObject!FontButton(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets whether the dialog is modal.
   * Returns: %TRUE if the dialog is modal

   * Deprecated: Use [Gtk.FontDialogButton] instead
   */
  bool getModal()
  {
    bool _retval;
    _retval = gtk_font_button_get_modal(cast(GtkFontButton*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the title of the font chooser dialog.
   * Returns: an internal copy of the title string
   *   which must not be freed.

   * Deprecated: Use [Gtk.FontDialogButton] instead
   */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_font_button_get_title(cast(GtkFontButton*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns whether the selected font is used in the label.
   * Returns: whether the selected font is used in the label.

   * Deprecated: Use [Gtk.FontDialogButton] instead
   */
  bool getUseFont()
  {
    bool _retval;
    _retval = gtk_font_button_get_use_font(cast(GtkFontButton*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the selected size is used in the label.
   * Returns: whether the selected size is used in the label.

   * Deprecated: Use [Gtk.FontDialogButton] instead
   */
  bool getUseSize()
  {
    bool _retval;
    _retval = gtk_font_button_get_use_size(cast(GtkFontButton*)cPtr);
    return _retval;
  }

  /**
   * Sets whether the dialog should be modal.
   * Params:
   *   modal = %TRUE to make the dialog modal

   * Deprecated: Use [Gtk.FontDialogButton] instead
   */
  void setModal(bool modal)
  {
    gtk_font_button_set_modal(cast(GtkFontButton*)cPtr, modal);
  }

  /**
   * Sets the title for the font chooser dialog.
   * Params:
   *   title = a string containing the font chooser dialog title

   * Deprecated: Use [Gtk.FontDialogButton] instead
   */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_font_button_set_title(cast(GtkFontButton*)cPtr, _title);
  }

  /**
   * If use_font is %TRUE, the font name will be written
   * using the selected font.
   * Params:
   *   useFont = If %TRUE, font name will be written using font chosen.

   * Deprecated: Use [Gtk.FontDialogButton] instead
   */
  void setUseFont(bool useFont)
  {
    gtk_font_button_set_use_font(cast(GtkFontButton*)cPtr, useFont);
  }

  /**
   * If use_size is %TRUE, the font name will be written using
   * the selected size.
   * Params:
   *   useSize = If %TRUE, font name will be written using the
   *     selected size.

   * Deprecated: Use [Gtk.FontDialogButton] instead
   */
  void setUseSize(bool useSize)
  {
    gtk_font_button_set_use_size(cast(GtkFontButton*)cPtr, useSize);
  }

  /**
   * Emitted to when the font button is activated.
   * The `::activate` signal on `GtkFontButton` is an action signal and
   * emitting it causes the button to present its dialog.
   *   fontButton = the instance the signal is connected to
   */
  alias ActivateCallbackDlg = void delegate(FontButton fontButton);
  alias ActivateCallbackFunc = void function(FontButton fontButton);

  /**
   * Connect to Activate signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fontButton = getVal!FontButton(_paramVals);
      _dClosure.dlg(fontButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
   * Emitted when the user selects a font.
   * When handling this signal, use [Gtk.FontChooser.getFont]
   * to find out which font was just selected.
   * Note that this signal is only emitted when the user changes the font.
   * If you need to react to programmatic font changes as well, use
   * the notify::font signal.
   *   fontButton = the instance the signal is connected to
   */
  alias FontSetCallbackDlg = void delegate(FontButton fontButton);
  alias FontSetCallbackFunc = void function(FontButton fontButton);

  /**
   * Connect to FontSet signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectFontSet(T)(T callback, Flag!"After" after = No.After)
  if (is(T : FontSetCallbackDlg) || is(T : FontSetCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto fontButton = getVal!FontButton(_paramVals);
      _dClosure.dlg(fontButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("font-set", closure, after);
  }
}
