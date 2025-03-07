module gtksource.mark_attributes;

import gdk.paintable;
import gdk.rgba;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
import gobject.dclosure;
import gobject.object;
import gtk.widget;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.mark;
import gtksource.types;

/**
    The source mark attributes object.
  
  [gtksource.mark_attributes.MarkAttributes] is an object specifying attributes used by
  a `class@View` to visually show lines marked with `class@Mark`s
  of a specific category. It allows you to define a background color of a line,
  an icon shown in gutter and tooltips.
  
  The background color is used as a background of a line where a mark is placed
  and it can be set with [gtksource.mark_attributes.MarkAttributes.setBackground]. To check
  if any custom background color was defined and what color it is, use
  [gtksource.mark_attributes.MarkAttributes.getBackground].
  
  An icon is a graphic element which is shown in the gutter of a view. An
  example use is showing a red filled circle in a debugger to show that a
  breakpoint was set in certain line. To get an icon that will be placed in
  a gutter, first a base for it must be specified and then
  [gtksource.mark_attributes.MarkAttributes.renderIcon] must be called.
  There are several ways to specify a base for an icon:
  
  $(LIST
    * [gtksource.mark_attributes.MarkAttributes.setIconName]
    * [gtksource.mark_attributes.MarkAttributes.setGicon]
    * [gtksource.mark_attributes.MarkAttributes.setPixbuf]
  )
    
  Using any of the above functions overrides the one used earlier. But note
  that a getter counterpart of earlier used function can still return some
  value, but it is just not used when rendering the proper icon.
  
  To provide meaningful tooltips for a given mark of a category, you should
  connect to `signal@MarkAttributes::query-tooltip-text` or
  `signal@MarkAttributes::query-tooltip-markup` where the latter
  takes precedence.
*/
class MarkAttributes : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_mark_attributes_get_type != &gidSymbolNotFound ? gtk_source_mark_attributes_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new source mark attributes.
    Returns:     a new source mark attributes.
  */
  this()
  {
    GtkSourceMarkAttributes* _cretval;
    _cretval = gtk_source_mark_attributes_new();
    this(_cretval, Yes.Take);
  }

  /**
      Stores background color in background.
    Params:
      background =       a #GdkRGBA.
    Returns:     whether background color for attributes was set.
  */
  bool getBackground(out gdk.rgba.RGBA background)
  {
    bool _retval;
    GdkRGBA _background;
    _retval = gtk_source_mark_attributes_get_background(cast(GtkSourceMarkAttributes*)cPtr, &_background);
    background = new gdk.rgba.RGBA(cast(void*)&_background, No.Take);
    return _retval;
  }

  /**
      Gets a [gio.icon.Icon] to be used as a base for rendered icon.
    
    Note that the icon can be null if it wasn't set earlier.
    Returns:     An icon. The icon belongs to attributes and should
      not be unreffed.
  */
  gio.icon.Icon getGicon()
  {
    GIcon* _cretval;
    _cretval = gtk_source_mark_attributes_get_gicon(cast(GtkSourceMarkAttributes*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a name of an icon to be used as a base for rendered icon.
    
    Note that the icon name can be null if it wasn't set earlier.
    Returns:     An icon name. The string belongs to attributes and
      should not be freed.
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_mark_attributes_get_icon_name(cast(GtkSourceMarkAttributes*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets a [gdkpixbuf.pixbuf.Pixbuf] to be used as a base for rendered icon.
    
    Note that the pixbuf can be null if it wasn't set earlier.
    Returns:     A pixbuf. The pixbuf belongs to attributes and
      should not be unreffed.
  */
  gdkpixbuf.pixbuf.Pixbuf getPixbuf()
  {
    const(PixbufC)* _cretval;
    _cretval = gtk_source_mark_attributes_get_pixbuf(cast(GtkSourceMarkAttributes*)cPtr);
    auto _retval = ObjectG.getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(PixbufC*)_cretval, No.Take);
    return _retval;
  }

  /**
      Queries for a tooltip by emitting a `signalMarkAttributes::query-tooltip-markup` signal.
    
    The tooltip may contain a markup.
    Params:
      mark =       a #GtkSourceMark.
    Returns:     A tooltip. The returned string should be freed by
      using [glib.global.gfree] when done with it.
  */
  string getTooltipMarkup(gtksource.mark.Mark mark)
  {
    char* _cretval;
    _cretval = gtk_source_mark_attributes_get_tooltip_markup(cast(GtkSourceMarkAttributes*)cPtr, mark ? cast(GtkSourceMark*)mark.cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Queries for a tooltip by emitting a `signalMarkAttributes::query-tooltip-text` signal.
    
    The tooltip is a plain text.
    Params:
      mark =       a #GtkSourceMark.
    Returns:     A tooltip. The returned string should be freed by
      using [glib.global.gfree] when done with it.
  */
  string getTooltipText(gtksource.mark.Mark mark)
  {
    char* _cretval;
    _cretval = gtk_source_mark_attributes_get_tooltip_text(cast(GtkSourceMarkAttributes*)cPtr, mark ? cast(GtkSourceMark*)mark.cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Renders an icon of given size.
    
    The base of the icon is set by the last call to one of:
    
    $(LIST
      * [gtksource.mark_attributes.MarkAttributes.setPixbuf]
      * [gtksource.mark_attributes.MarkAttributes.setGicon]
      * [gtksource.mark_attributes.MarkAttributes.setIconName]
    )
      
    size cannot be lower than 1.
    Params:
      widget =       widget of which style settings may be used.
      size =       size of the rendered icon.
    Returns:     A #GdkPaintable. The paintable belongs to attributes
      and should not be unreffed.
  */
  gdk.paintable.Paintable renderIcon(gtk.widget.Widget widget, int size)
  {
    GdkPaintable* _cretval;
    _cretval = gtk_source_mark_attributes_render_icon(cast(GtkSourceMarkAttributes*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, size);
    auto _retval = ObjectG.getDObject!(gdk.paintable.Paintable)(cast(GdkPaintable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets background color to the one given in background.
    Params:
      background =       a #GdkRGBA.
  */
  void setBackground(gdk.rgba.RGBA background)
  {
    gtk_source_mark_attributes_set_background(cast(GtkSourceMarkAttributes*)cPtr, background ? cast(const(GdkRGBA)*)background.cPtr(No.Dup) : null);
  }

  /**
      Sets an icon to be used as a base for rendered icon.
    Params:
      gicon =       a #GIcon to be used.
  */
  void setGicon(gio.icon.Icon gicon)
  {
    gtk_source_mark_attributes_set_gicon(cast(GtkSourceMarkAttributes*)cPtr, gicon ? cast(GIcon*)(cast(ObjectG)gicon).cPtr(No.Dup) : null);
  }

  /**
      Sets a name of an icon to be used as a base for rendered icon.
    Params:
      iconName =       name of an icon to be used.
  */
  void setIconName(string iconName)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_source_mark_attributes_set_icon_name(cast(GtkSourceMarkAttributes*)cPtr, _iconName);
  }

  /**
      Sets a pixbuf to be used as a base for rendered icon.
    Params:
      pixbuf =       a #GdkPixbuf to be used.
  */
  void setPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    gtk_source_mark_attributes_set_pixbuf(cast(GtkSourceMarkAttributes*)cPtr, pixbuf ? cast(const(PixbufC)*)pixbuf.cPtr(No.Dup) : null);
  }

  /**
      The code should connect to this signal to provide a tooltip for given
    mark. The tooltip can contain a markup.
  
    ## Parameters
    $(LIST
      * $(B mark)       The #GtkSourceMark.
      * $(B markAttributes) the instance the signal is connected to
    )
    Returns:     A tooltip. The string should be freed with
      [glib.global.gfree] when done with it.
  */
  alias QueryTooltipMarkupCallbackDlg = string delegate(gtksource.mark.Mark mark, gtksource.mark_attributes.MarkAttributes markAttributes);

  /** ditto */
  alias QueryTooltipMarkupCallbackFunc = string function(gtksource.mark.Mark mark, gtksource.mark_attributes.MarkAttributes markAttributes);

  /**
    Connect to QueryTooltipMarkup signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectQueryTooltipMarkup(T)(T callback, Flag!"After" after = No.After)
  if (is(T : QueryTooltipMarkupCallbackDlg) || is(T : QueryTooltipMarkupCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto markAttributes = getVal!(gtksource.mark_attributes.MarkAttributes)(_paramVals);
      auto mark = getVal!(gtksource.mark.Mark)(&_paramVals[1]);
      auto _retval = _dClosure.dlg(mark, markAttributes);
      setVal!string(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-tooltip-markup", closure, after);
  }

  /**
      The code should connect to this signal to provide a tooltip for given
    mark. The tooltip should be just a plain text.
  
    ## Parameters
    $(LIST
      * $(B mark)       The #GtkSourceMark.
      * $(B markAttributes) the instance the signal is connected to
    )
    Returns:     A tooltip. The string should be freed with
      [glib.global.gfree] when done with it.
  */
  alias QueryTooltipTextCallbackDlg = string delegate(gtksource.mark.Mark mark, gtksource.mark_attributes.MarkAttributes markAttributes);

  /** ditto */
  alias QueryTooltipTextCallbackFunc = string function(gtksource.mark.Mark mark, gtksource.mark_attributes.MarkAttributes markAttributes);

  /**
    Connect to QueryTooltipText signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectQueryTooltipText(T)(T callback, Flag!"After" after = No.After)
  if (is(T : QueryTooltipTextCallbackDlg) || is(T : QueryTooltipTextCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto markAttributes = getVal!(gtksource.mark_attributes.MarkAttributes)(_paramVals);
      auto mark = getVal!(gtksource.mark.Mark)(&_paramVals[1]);
      auto _retval = _dClosure.dlg(mark, markAttributes);
      setVal!string(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-tooltip-text", closure, after);
  }
}
