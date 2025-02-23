module gtk.color_dialog_button;

import gdk.rgba;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.color_dialog;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
 * The `GtkColorDialogButton` is a wrapped around a [Gtk.ColorDialog]
 * and allows to open a color chooser dialog to change the color.
 * ![An example GtkColorDialogButton](color-button.png)
 * It is suitable widget for selecting a color in a preference dialog.
 * # CSS nodes
 * ```
 * colorbutton
 * ╰── button.color
 * ╰── [content]
 * ```
 * `GtkColorDialogButton` has a single CSS node with name colorbutton which
 * contains a button node. To differentiate it from a plain `GtkButton`,
 * it gets the .color style class.
 */
class ColorDialogButton : Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_color_dialog_button_get_type != &gidSymbolNotFound ? gtk_color_dialog_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkColorDialogButton` with the
   * given `GtkColorDialog`.
   * You can pass `NULL` to this function and set a `GtkColorDialog`
   * later. The button will be insensitive until that happens.
   * Params:
   *   dialog = the `GtkColorDialog` to use
   * Returns: the new `GtkColorDialogButton`
   */
  this(ColorDialog dialog)
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_dialog_button_new(dialog ? cast(GtkColorDialog*)dialog.cPtr(Yes.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
   * Returns the `GtkColorDialog` of self.
   * Returns: the `GtkColorDialog`
   */
  ColorDialog getDialog()
  {
    GtkColorDialog* _cretval;
    _cretval = gtk_color_dialog_button_get_dialog(cast(GtkColorDialogButton*)cPtr);
    auto _retval = ObjectG.getDObject!ColorDialog(cast(GtkColorDialog*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the color of the button.
   * This function is what should be used to obtain
   * the color that was chosen by the user. To get
   * informed about changes, listen to "notify::rgba".
   * Returns: the color
   */
  RGBA getRgba()
  {
    const(GdkRGBA)* _cretval;
    _cretval = gtk_color_dialog_button_get_rgba(cast(GtkColorDialogButton*)cPtr);
    auto _retval = _cretval ? new RGBA(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Sets a `GtkColorDialog` object to use for
   * creating the color chooser dialog that is
   * presented when the user clicks the button.
   * Params:
   *   dialog = the new `GtkColorDialog`
   */
  void setDialog(ColorDialog dialog)
  {
    gtk_color_dialog_button_set_dialog(cast(GtkColorDialogButton*)cPtr, dialog ? cast(GtkColorDialog*)dialog.cPtr(No.Dup) : null);
  }

  /**
   * Sets the color of the button.
   * Params:
   *   color = the new color
   */
  void setRgba(RGBA color)
  {
    gtk_color_dialog_button_set_rgba(cast(GtkColorDialogButton*)cPtr, color ? cast(GdkRGBA*)color.cPtr(No.Dup) : null);
  }

  /**
   * Emitted when the color dialog button is activated.
   * The `::activate` signal on `GtkColorDialogButton` is an action signal
   * and emitting it causes the button to pop up its dialog.
   *   colorDialogButton = the instance the signal is connected to
   */
  alias ActivateCallbackDlg = void delegate(ColorDialogButton colorDialogButton);
  alias ActivateCallbackFunc = void function(ColorDialogButton colorDialogButton);

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
      auto colorDialogButton = getVal!ColorDialogButton(_paramVals);
      _dClosure.dlg(colorDialogButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}
