module gtk.color_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.color;
import gdk.rgba;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtk.c.functions;
import gtk.c.types;
import gtk.color_chooser;
import gtk.color_chooser_mixin;
import gtk.types;

/**
    The #GtkColorButton is a button which displays the currently selected
  color and allows to open a color selection dialog to change the color.
  It is suitable widget for selecting a color in a preference dialog.
  
  # CSS nodes
  
  GtkColorButton has a single CSS node with name button. To differentiate
  it from a plain #GtkButton, it gets the .color style class.
*/
class ColorButton : gtk.button.Button, gtk.color_chooser.ColorChooser
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

  mixin ColorChooserT!();

  /**
      Creates a new color button.
    
    This returns a widget in the form of a small button containing
    a swatch representing the current selected color. When the button
    is clicked, a color-selection dialog will open, allowing the user
    to select a color. The swatch will be updated to reflect the new
    color when the user finishes.
    Returns:     a new color button
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_button_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new color button.
    Params:
      color =       A #GdkColor to set the current color with
    Returns:     a new color button
  
    Deprecated:     Use [gtk.color_button.ColorButton.newWithRgba] instead.
  */
  static gtk.color_button.ColorButton newWithColor(gdk.color.Color color)
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_button_new_with_color(color ? cast(const(GdkColor)*)color.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.color_button.ColorButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new color button.
    Params:
      rgba =       A #GdkRGBA to set the current color with
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
      Returns the current alpha value.
    Returns:     an integer between 0 and 65535
  
    Deprecated:     Use [gtk.color_chooser.ColorChooser.getRgba] instead.
  */
  ushort getAlpha()
  {
    ushort _retval;
    _retval = gtk_color_button_get_alpha(cast(GtkColorButton*)cPtr);
    return _retval;
  }

  /**
      Sets color to be the current color in the #GtkColorButton widget.
    Params:
      color =       a #GdkColor to fill in with the current color
  
    Deprecated:     Use [gtk.color_chooser.ColorChooser.getRgba] instead.
  */
  void getColor(out gdk.color.Color color)
  {
    GdkColor _color;
    gtk_color_button_get_color(cast(GtkColorButton*)cPtr, &_color);
    color = new gdk.color.Color(cast(void*)&_color, No.Take);
  }

  /**
      Gets the title of the color selection dialog.
    Returns:     An internal string, do not free the return value
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_color_button_get_title(cast(GtkColorButton*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Does the color selection dialog use the alpha channel ?
    Returns:     true if the color sample uses alpha channel, false if not
  
    Deprecated:     Use [gtk.color_chooser.ColorChooser.getUseAlpha] instead.
  */
  bool getUseAlpha()
  {
    bool _retval;
    _retval = gtk_color_button_get_use_alpha(cast(GtkColorButton*)cPtr);
    return _retval;
  }

  /**
      Sets the current opacity to be alpha.
    Params:
      alpha =       an integer between 0 and 65535
  
    Deprecated:     Use [gtk.color_chooser.ColorChooser.setRgba] instead.
  */
  void setAlpha(ushort alpha)
  {
    gtk_color_button_set_alpha(cast(GtkColorButton*)cPtr, alpha);
  }

  /**
      Sets the current color to be color.
    Params:
      color =       A #GdkColor to set the current color with
  
    Deprecated:     Use [gtk.color_chooser.ColorChooser.setRgba] instead.
  */
  void setColor(gdk.color.Color color)
  {
    gtk_color_button_set_color(cast(GtkColorButton*)cPtr, color ? cast(const(GdkColor)*)color.cPtr(No.Dup) : null);
  }

  /**
      Sets the title for the color selection dialog.
    Params:
      title =       String containing new window title
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_color_button_set_title(cast(GtkColorButton*)cPtr, _title);
  }

  /**
      Sets whether or not the color button should use the alpha channel.
    Params:
      useAlpha =       true if color button should use alpha channel, false if not
  
    Deprecated:     Use [gtk.color_chooser.ColorChooser.setUseAlpha] instead.
  */
  void setUseAlpha(bool useAlpha)
  {
    gtk_color_button_set_use_alpha(cast(GtkColorButton*)cPtr, useAlpha);
  }

  /**
      The ::color-set signal is emitted when the user selects a color.
    When handling this signal, use [gtk.color_button.ColorButton.getRgba] to
    find out which color was just selected.
    
    Note that this signal is only emitted when the user
    changes the color. If you need to react to programmatic color changes
    as well, use the notify::color signal.
  
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
