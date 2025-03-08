module gtk.color_selection;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.color;
import gdk.rgba;
import gid.gid;
import gobject.dclosure;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/** */
class ColorSelection : gtk.box.Box
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_color_selection_get_type != &gidSymbolNotFound ? gtk_color_selection_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new GtkColorSelection.
    Returns:     a new #GtkColorSelection
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_selection_new();
    this(_cretval, No.take);
  }

  /**
      Parses a color palette string; the string is a colon-separated
    list of color names readable by [gdk.color.Color.parse].
    Params:
      str =       a string encoding a color palette
      colors =       return location for
            allocated array of #GdkColor
    Returns:     true if a palette was successfully parsed
  */
  static bool paletteFromString(string str, out gdk.color.Color[] colors)
  {
    bool _retval;
    const(char)* _str = str.toCString(No.alloc);
    int _nColors;
    GdkColor* _colors;
    _retval = gtk_color_selection_palette_from_string(_str, &_colors, &_nColors);
    colors.length = _nColors;
    foreach (i; 0 .. _nColors)
      colors[i] = new gdk.color.Color(cast(void*)&_colors[i], Yes.take);
    safeFree(cast(void*)_colors);
    return _retval;
  }

  /**
      Encodes a palette as a string, useful for persistent storage.
    Params:
      colors =       an array of colors
    Returns:     allocated string encoding the palette
  */
  static string paletteToString(gdk.color.Color[] colors)
  {
    char* _cretval;
    int _nColors;
    if (colors)
      _nColors = cast(int)colors.length;

    GdkColor[] _tmpcolors;
    foreach (obj; colors)
      _tmpcolors ~= *cast(GdkColor*)obj.cPtr;
    const(GdkColor)* _colors = _tmpcolors.ptr;
    _cretval = gtk_color_selection_palette_to_string(_colors, _nColors);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
    return _retval;
  }

  /**
      Returns the current alpha value.
    Returns:     an integer between 0 and 65535
  */
  ushort getCurrentAlpha()
  {
    ushort _retval;
    _retval = gtk_color_selection_get_current_alpha(cast(GtkColorSelection*)cPtr);
    return _retval;
  }

  /**
      Sets color to be the current color in the GtkColorSelection widget.
    Params:
      color =       a #GdkColor to fill in with the current color
  
    Deprecated:     Use [gtk.color_selection.ColorSelection.getCurrentRgba] instead.
  */
  void getCurrentColor(out gdk.color.Color color)
  {
    GdkColor _color;
    gtk_color_selection_get_current_color(cast(GtkColorSelection*)cPtr, &_color);
    color = new gdk.color.Color(cast(void*)&_color, No.take);
  }

  /**
      Sets rgba to be the current color in the GtkColorSelection widget.
    Params:
      rgba =       a #GdkRGBA to fill in with the current color
  */
  void getCurrentRgba(out gdk.rgba.RGBA rgba)
  {
    GdkRGBA _rgba;
    gtk_color_selection_get_current_rgba(cast(GtkColorSelection*)cPtr, &_rgba);
    rgba = new gdk.rgba.RGBA(cast(void*)&_rgba, No.take);
  }

  /**
      Determines whether the colorsel has an opacity control.
    Returns:     true if the colorsel has an opacity control,
          false if it does't
  */
  bool getHasOpacityControl()
  {
    bool _retval;
    _retval = gtk_color_selection_get_has_opacity_control(cast(GtkColorSelection*)cPtr);
    return _retval;
  }

  /**
      Determines whether the color selector has a color palette.
    Returns:     true if the selector has a palette, false if it hasn't
  */
  bool getHasPalette()
  {
    bool _retval;
    _retval = gtk_color_selection_get_has_palette(cast(GtkColorSelection*)cPtr);
    return _retval;
  }

  /**
      Returns the previous alpha value.
    Returns:     an integer between 0 and 65535
  */
  ushort getPreviousAlpha()
  {
    ushort _retval;
    _retval = gtk_color_selection_get_previous_alpha(cast(GtkColorSelection*)cPtr);
    return _retval;
  }

  /**
      Fills color in with the original color value.
    Params:
      color =       a #GdkColor to fill in with the original color value
  
    Deprecated:     Use [gtk.color_selection.ColorSelection.getPreviousRgba] instead.
  */
  void getPreviousColor(out gdk.color.Color color)
  {
    GdkColor _color;
    gtk_color_selection_get_previous_color(cast(GtkColorSelection*)cPtr, &_color);
    color = new gdk.color.Color(cast(void*)&_color, No.take);
  }

  /**
      Fills rgba in with the original color value.
    Params:
      rgba =       a #GdkRGBA to fill in with the original color value
  */
  void getPreviousRgba(out gdk.rgba.RGBA rgba)
  {
    GdkRGBA _rgba;
    gtk_color_selection_get_previous_rgba(cast(GtkColorSelection*)cPtr, &_rgba);
    rgba = new gdk.rgba.RGBA(cast(void*)&_rgba, No.take);
  }

  /**
      Gets the current state of the colorsel.
    Returns:     true if the user is currently dragging
          a color around, and false if the selection has stopped
  */
  bool isAdjusting()
  {
    bool _retval;
    _retval = gtk_color_selection_is_adjusting(cast(GtkColorSelection*)cPtr);
    return _retval;
  }

  /**
      Sets the current opacity to be alpha.
    
    The first time this is called, it will also set
    the original opacity to be alpha too.
    Params:
      alpha =       an integer between 0 and 65535
  */
  void setCurrentAlpha(ushort alpha)
  {
    gtk_color_selection_set_current_alpha(cast(GtkColorSelection*)cPtr, alpha);
  }

  /**
      Sets the current color to be color.
    
    The first time this is called, it will also set
    the original color to be color too.
    Params:
      color =       a #GdkColor to set the current color with
  
    Deprecated:     Use [gtk.color_selection.ColorSelection.setCurrentRgba] instead.
  */
  void setCurrentColor(gdk.color.Color color)
  {
    gtk_color_selection_set_current_color(cast(GtkColorSelection*)cPtr, color ? cast(const(GdkColor)*)color.cPtr(No.dup) : null);
  }

  /**
      Sets the current color to be rgba.
    
    The first time this is called, it will also set
    the original color to be rgba too.
    Params:
      rgba =       A #GdkRGBA to set the current color with
  */
  void setCurrentRgba(gdk.rgba.RGBA rgba)
  {
    gtk_color_selection_set_current_rgba(cast(GtkColorSelection*)cPtr, rgba ? cast(const(GdkRGBA)*)rgba.cPtr(No.dup) : null);
  }

  /**
      Sets the colorsel to use or not use opacity.
    Params:
      hasOpacity =       true if colorsel can set the opacity, false otherwise
  */
  void setHasOpacityControl(bool hasOpacity)
  {
    gtk_color_selection_set_has_opacity_control(cast(GtkColorSelection*)cPtr, hasOpacity);
  }

  /**
      Shows and hides the palette based upon the value of has_palette.
    Params:
      hasPalette =       true if palette is to be visible, false otherwise
  */
  void setHasPalette(bool hasPalette)
  {
    gtk_color_selection_set_has_palette(cast(GtkColorSelection*)cPtr, hasPalette);
  }

  /**
      Sets the “previous” alpha to be alpha.
    
    This function should be called with some hesitations,
    as it might seem confusing to have that alpha change.
    Params:
      alpha =       an integer between 0 and 65535
  */
  void setPreviousAlpha(ushort alpha)
  {
    gtk_color_selection_set_previous_alpha(cast(GtkColorSelection*)cPtr, alpha);
  }

  /**
      Sets the “previous” color to be color.
    
    This function should be called with some hesitations,
    as it might seem confusing to have that color change.
    Calling [gtk.color_selection.ColorSelection.setCurrentColor] will also
    set this color the first time it is called.
    Params:
      color =       a #GdkColor to set the previous color with
  
    Deprecated:     Use [gtk.color_selection.ColorSelection.setPreviousRgba] instead.
  */
  void setPreviousColor(gdk.color.Color color)
  {
    gtk_color_selection_set_previous_color(cast(GtkColorSelection*)cPtr, color ? cast(const(GdkColor)*)color.cPtr(No.dup) : null);
  }

  /**
      Sets the “previous” color to be rgba.
    
    This function should be called with some hesitations,
    as it might seem confusing to have that color change.
    Calling [gtk.color_selection.ColorSelection.setCurrentRgba] will also
    set this color the first time it is called.
    Params:
      rgba =       a #GdkRGBA to set the previous color with
  */
  void setPreviousRgba(gdk.rgba.RGBA rgba)
  {
    gtk_color_selection_set_previous_rgba(cast(GtkColorSelection*)cPtr, rgba ? cast(const(GdkRGBA)*)rgba.cPtr(No.dup) : null);
  }

  /**
      This signal is emitted when the color changes in the #GtkColorSelection
    according to its update policy.
  
    ## Parameters
    $(LIST
      * $(B colorSelection) the instance the signal is connected to
    )
  */
  alias ColorChangedCallbackDlg = void delegate(gtk.color_selection.ColorSelection colorSelection);

  /** ditto */
  alias ColorChangedCallbackFunc = void function(gtk.color_selection.ColorSelection colorSelection);

  /**
    Connect to ColorChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectColorChanged(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ColorChangedCallbackDlg) || is(T : ColorChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto colorSelection = getVal!(gtk.color_selection.ColorSelection)(_paramVals);
      _dClosure.dlg(colorSelection);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("color-changed", closure, after);
  }
}
