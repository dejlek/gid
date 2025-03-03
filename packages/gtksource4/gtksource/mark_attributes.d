module gtksource.mark_attributes;

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

class MarkAttributes : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_mark_attributes_get_type != &gidSymbolNotFound ? gtk_source_mark_attributes_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new source mark attributes.
   * Returns: a new source mark attributes.
   */
  this()
  {
    GtkSourceMarkAttributes* _cretval;
    _cretval = gtk_source_mark_attributes_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Stores background color in background.
   * Params:
   *   background = a #GdkRGBA.
   * Returns: whether background color for attributes was set.
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
   * Gets a #GIcon to be used as a base for rendered icon. Note that the icon can
   * be %NULL if it wasn't set earlier.
   * Returns: An icon. The icon belongs to attributes and should
   *   not be unreffed.
   */
  gio.icon.Icon getGicon()
  {
    GIcon* _cretval;
    _cretval = gtk_source_mark_attributes_get_gicon(cast(GtkSourceMarkAttributes*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets a name of an icon to be used as a base for rendered icon. Note that the
   * icon name can be %NULL if it wasn't set earlier.
   * Returns: An icon name. The string belongs to attributes and
   *   should not be freed.
   */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_mark_attributes_get_icon_name(cast(GtkSourceMarkAttributes*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets a #GdkPixbuf to be used as a base for rendered icon. Note that the
   * pixbuf can be %NULL if it wasn't set earlier.
   * Returns: A pixbuf. The pixbuf belongs to attributes and
   *   should not be unreffed.
   */
  gdkpixbuf.pixbuf.Pixbuf getPixbuf()
  {
    const(PixbufC)* _cretval;
    _cretval = gtk_source_mark_attributes_get_pixbuf(cast(GtkSourceMarkAttributes*)cPtr);
    auto _retval = ObjectG.getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(PixbufC*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Queries for a tooltip by emitting
   * a #GtkSourceMarkAttributes::query-tooltip-markup signal. The tooltip may contain
   * a markup.
   * Params:
   *   mark = a #GtkSourceMark.
   * Returns: A tooltip. The returned string should be freed by
   *   using [glib.global.gfree] when done with it.
   */
  string getTooltipMarkup(gtksource.mark.Mark mark)
  {
    char* _cretval;
    _cretval = gtk_source_mark_attributes_get_tooltip_markup(cast(GtkSourceMarkAttributes*)cPtr, mark ? cast(GtkSourceMark*)mark.cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Queries for a tooltip by emitting
   * a #GtkSourceMarkAttributes::query-tooltip-text signal. The tooltip is a plain
   * text.
   * Params:
   *   mark = a #GtkSourceMark.
   * Returns: A tooltip. The returned string should be freed by
   *   using [glib.global.gfree] when done with it.
   */
  string getTooltipText(gtksource.mark.Mark mark)
  {
    char* _cretval;
    _cretval = gtk_source_mark_attributes_get_tooltip_text(cast(GtkSourceMarkAttributes*)cPtr, mark ? cast(GtkSourceMark*)mark.cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Renders an icon of given size. The base of the icon is set by the last call
   * to one of: [gtksource.mark_attributes.MarkAttributes.setPixbuf],
   * [gtksource.mark_attributes.MarkAttributes.setGicon] or
   * [gtksource.mark_attributes.MarkAttributes.setIconName]. size cannot be lower than 1.
   * Params:
   *   widget = widget of which style settings may be used.
   *   size = size of the rendered icon.
   * Returns: A rendered pixbuf. The pixbuf belongs to attributes
   *   and should not be unreffed.
   */
  gdkpixbuf.pixbuf.Pixbuf renderIcon(gtk.widget.Widget widget, int size)
  {
    const(PixbufC)* _cretval;
    _cretval = gtk_source_mark_attributes_render_icon(cast(GtkSourceMarkAttributes*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, size);
    auto _retval = ObjectG.getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(PixbufC*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets background color to the one given in background.
   * Params:
   *   background = a #GdkRGBA.
   */
  void setBackground(gdk.rgba.RGBA background)
  {
    gtk_source_mark_attributes_set_background(cast(GtkSourceMarkAttributes*)cPtr, background ? cast(const(GdkRGBA)*)background.cPtr(No.Dup) : null);
  }

  /**
   * Sets an icon to be used as a base for rendered icon.
   * Params:
   *   gicon = a #GIcon to be used.
   */
  void setGicon(gio.icon.Icon gicon)
  {
    gtk_source_mark_attributes_set_gicon(cast(GtkSourceMarkAttributes*)cPtr, gicon ? cast(GIcon*)(cast(ObjectG)gicon).cPtr(No.Dup) : null);
  }

  /**
   * Sets a name of an icon to be used as a base for rendered icon.
   * Params:
   *   iconName = name of an icon to be used.
   */
  void setIconName(string iconName)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_source_mark_attributes_set_icon_name(cast(GtkSourceMarkAttributes*)cPtr, _iconName);
  }

  /**
   * Sets a pixbuf to be used as a base for rendered icon.
   * Params:
   *   pixbuf = a #GdkPixbuf to be used.
   */
  void setPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    gtk_source_mark_attributes_set_pixbuf(cast(GtkSourceMarkAttributes*)cPtr, pixbuf ? cast(const(PixbufC)*)pixbuf.cPtr(No.Dup) : null);
  }

  /**
   * The code should connect to this signal to provide a tooltip for given
   * mark. The tooltip can contain a markup.
   * Params
   *   mark = The #GtkSourceMark.
   *   markAttributes = the instance the signal is connected to
   * Returns: A tooltip. The string should be freed with
   *   [glib.global.gfree] when done with it.
   */
  alias QueryTooltipMarkupCallbackDlg = string delegate(gtksource.mark.Mark mark, gtksource.mark_attributes.MarkAttributes markAttributes);
  alias QueryTooltipMarkupCallbackFunc = string function(gtksource.mark.Mark mark, gtksource.mark_attributes.MarkAttributes markAttributes);

  /**
   * Connect to QueryTooltipMarkup signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
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
   * The code should connect to this signal to provide a tooltip for given
   * mark. The tooltip should be just a plain text.
   * Params
   *   mark = The #GtkSourceMark.
   *   markAttributes = the instance the signal is connected to
   * Returns: A tooltip. The string should be freed with
   *   [glib.global.gfree] when done with it.
   */
  alias QueryTooltipTextCallbackDlg = string delegate(gtksource.mark.Mark mark, gtksource.mark_attributes.MarkAttributes markAttributes);
  alias QueryTooltipTextCallbackFunc = string function(gtksource.mark.Mark mark, gtksource.mark_attributes.MarkAttributes markAttributes);

  /**
   * Connect to QueryTooltipText signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
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
