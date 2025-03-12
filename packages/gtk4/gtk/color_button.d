module gtk.color_button;

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
import gtk.color_chooser;
import gtk.color_chooser_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    The [gtk.color_button.ColorButton] allows to open a color chooser dialog to change
  the color.
  
  ![An example GtkColorButton](color-button.png)
  
  It is suitable widget for selecting a color in a preference dialog.
  
  # CSS nodes
  
  ```
  colorbutton
  ╰── button.color
      ╰── [content]
  ```
  
  [gtk.color_button.ColorButton] has a single CSS node with name colorbutton which
  contains a button node. To differentiate it from a plain [gtk.button.Button],
  it gets the .color style class.

  Deprecated:     Use [gtk.color_dialog_button.ColorDialogButton] instead
*/
class ColorButton : gtk.widget.Widget, gtk.color_chooser.ColorChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_color_button_get_type != &gidSymbolNotFound ? gtk_color_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ColorButton self()
  {
    return this;
  }

  mixin ColorChooserT!();

  /**
      Creates a new color button.
    
    This returns a widget in the form of a small button containing
    a swatch representing the current selected color. When the button
    is clicked, a color chooser dialog will open, allowing the user
    to select a color. The swatch will be updated to reflect the new
    color when the user finishes.
    Returns:     a new color button
  
    Deprecated:     Use [gtk.color_dialog_button.ColorDialogButton] instead
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_button_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new color button showing the given color.
    Params:
      rgba =       A [gdk.rgba.RGBA] to set the current color with
    Returns:     a new color button
  */
  static gtk.color_button.ColorButton newWithRgba(gdk.rgba.RGBA rgba)
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_button_new_with_rgba(rgba ? cast(const(GdkRGBA)*)rgba.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.color_button.ColorButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the dialog is modal.
    Returns:     true if the dialog is modal
  
    Deprecated:     Use [gtk.color_dialog_button.ColorDialogButton] instead
  */
  bool getModal()
  {
    bool _retval;
    _retval = gtk_color_button_get_modal(cast(GtkColorButton*)cPtr);
    return _retval;
  }

  /**
      Gets the title of the color chooser dialog.
    Returns:     An internal string, do not free the return value
  
    Deprecated:     Use [gtk.color_dialog_button.ColorDialogButton] instead
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_color_button_get_title(cast(GtkColorButton*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets whether the dialog should be modal.
    Params:
      modal =       true to make the dialog modal
  
    Deprecated:     Use [gtk.color_dialog_button.ColorDialogButton] instead
  */
  void setModal(bool modal)
  {
    gtk_color_button_set_modal(cast(GtkColorButton*)cPtr, modal);
  }

  /**
      Sets the title for the color chooser dialog.
    Params:
      title =       String containing new window title
  
    Deprecated:     Use [gtk.color_dialog_button.ColorDialogButton] instead
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_color_button_set_title(cast(GtkColorButton*)cPtr, _title);
  }

  /**
      Emitted to when the color button is activated.
    
    The `::activate` signal on [gtk.menu_button.MenuButton] is an action signal and
    emitting it causes the button to pop up its dialog.
  
    ## Parameters
    $(LIST
      * $(B colorButton) the instance the signal is connected to
    )
  */
  alias ActivateCallbackDlg = void delegate(gtk.color_button.ColorButton colorButton);

  /** ditto */
  alias ActivateCallbackFunc = void function(gtk.color_button.ColorButton colorButton);

  /**
    Connect to Activate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto colorButton = getVal!(gtk.color_button.ColorButton)(_paramVals);
      _dClosure.dlg(colorButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Emitted when the user selects a color.
    
    When handling this signal, use [gtk.color_chooser.ColorChooser.getRgba]
    to find out which color was just selected.
    
    Note that this signal is only emitted when the user changes the color.
    If you need to react to programmatic color changes as well, use
    the notify::rgba signal.
  
    ## Parameters
    $(LIST
      * $(B colorButton) the instance the signal is connected to
    )
  */
  alias ColorSetCallbackDlg = void delegate(gtk.color_button.ColorButton colorButton);

  /** ditto */
  alias ColorSetCallbackFunc = void function(gtk.color_button.ColorButton colorButton);

  /**
    Connect to ColorSet signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectColorSet(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ColorSetCallbackDlg) || is(T : ColorSetCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto colorButton = getVal!(gtk.color_button.ColorButton)(_paramVals);
      _dClosure.dlg(colorButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("color-set", closure, after);
  }
}
