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
    The [gtk.color_dialog_button.ColorDialogButton] is a wrapped around a [gtk.color_dialog.ColorDialog]
  and allows to open a color chooser dialog to change the color.
  
  ![An example GtkColorDialogButton](color-button.png)
  
  It is suitable widget for selecting a color in a preference dialog.
  
  # CSS nodes
  
  ```
  colorbutton
  ╰── button.color
      ╰── [content]
  ```
  
  [gtk.color_dialog_button.ColorDialogButton] has a single CSS node with name colorbutton which
  contains a button node. To differentiate it from a plain [gtk.button.Button],
  it gets the .color style class.
*/
class ColorDialogButton : gtk.widget.Widget
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_color_dialog_button_get_type != &gidSymbolNotFound ? gtk_color_dialog_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [gtk.color_dialog_button.ColorDialogButton] with the
    given [gtk.color_dialog.ColorDialog].
    
    You can pass `NULL` to this function and set a [gtk.color_dialog.ColorDialog]
    later. The button will be insensitive until that happens.
    Params:
      dialog =       the [gtk.color_dialog.ColorDialog] to use
    Returns:     the new [gtk.color_dialog_button.ColorDialogButton]
  */
  this(gtk.color_dialog.ColorDialog dialog = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_dialog_button_new(dialog ? cast(GtkColorDialog*)dialog.cPtr(Yes.dup) : null);
    this(_cretval, No.take);
  }

  /**
      Returns the [gtk.color_dialog.ColorDialog] of self.
    Returns:     the [gtk.color_dialog.ColorDialog]
  */
  gtk.color_dialog.ColorDialog getDialog()
  {
    GtkColorDialog* _cretval;
    _cretval = gtk_color_dialog_button_get_dialog(cast(GtkColorDialogButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.color_dialog.ColorDialog)(cast(GtkColorDialog*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns the color of the button.
    
    This function is what should be used to obtain
    the color that was chosen by the user. To get
    informed about changes, listen to "notify::rgba".
    Returns:     the color
  */
  gdk.rgba.RGBA getRgba()
  {
    const(GdkRGBA)* _cretval;
    _cretval = gtk_color_dialog_button_get_rgba(cast(GtkColorDialogButton*)cPtr);
    auto _retval = _cretval ? new gdk.rgba.RGBA(cast(void*)_cretval, No.take) : null;
    return _retval;
  }

  /**
      Sets a [gtk.color_dialog.ColorDialog] object to use for
    creating the color chooser dialog that is
    presented when the user clicks the button.
    Params:
      dialog =       the new [gtk.color_dialog.ColorDialog]
  */
  void setDialog(gtk.color_dialog.ColorDialog dialog)
  {
    gtk_color_dialog_button_set_dialog(cast(GtkColorDialogButton*)cPtr, dialog ? cast(GtkColorDialog*)dialog.cPtr(No.dup) : null);
  }

  /**
      Sets the color of the button.
    Params:
      color =       the new color
  */
  void setRgba(gdk.rgba.RGBA color)
  {
    gtk_color_dialog_button_set_rgba(cast(GtkColorDialogButton*)cPtr, color ? cast(const(GdkRGBA)*)color.cPtr(No.dup) : null);
  }

  /**
      Emitted when the color dialog button is activated.
    
    The `::activate` signal on [gtk.color_dialog_button.ColorDialogButton] is an action signal
    and emitting it causes the button to pop up its dialog.
  
    ## Parameters
    $(LIST
      * $(B colorDialogButton) the instance the signal is connected to
    )
  */
  alias ActivateCallbackDlg = void delegate(gtk.color_dialog_button.ColorDialogButton colorDialogButton);

  /** ditto */
  alias ActivateCallbackFunc = void function(gtk.color_dialog_button.ColorDialogButton colorDialogButton);

  /**
    Connect to Activate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto colorDialogButton = getVal!(gtk.color_dialog_button.ColorDialogButton)(_paramVals);
      _dClosure.dlg(colorDialogButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}
