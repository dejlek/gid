module gtk.text_attributes;

import gid.gid;
import gobject.boxed;
import gtk.c.functions;
import gtk.c.types;
import gtk.text_appearance;
import gtk.types;
import pango.font_description;
import pango.language;
import pango.tab_array;

/**
    Using #GtkTextAttributes directly should rarely be necessary.
  It’s primarily useful with [gtk.text_iter.TextIter.getAttributes].
  As with most GTK+ structs, the fields in this struct should only
  be read, never modified directly.
*/
class TextAttributes : gobject.boxed.Boxed
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_text_attributes_get_type != &gidSymbolNotFound ? gtk_text_attributes_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override TextAttributes self()
  {
    return this;
  }

  @property gtk.text_appearance.TextAppearance appearance()
  {
    return new gtk.text_appearance.TextAppearance(cast(GtkTextAppearance*)&(cast(GtkTextAttributes*)cPtr).appearance);
  }

  @property gtk.types.Justification justification()
  {
    return cast(gtk.types.Justification)(cast(GtkTextAttributes*)cPtr).justification;
  }

  @property void justification(gtk.types.Justification propval)
  {
    (cast(GtkTextAttributes*)cPtr).justification = cast(GtkJustification)propval;
  }

  @property gtk.types.TextDirection direction()
  {
    return cast(gtk.types.TextDirection)(cast(GtkTextAttributes*)cPtr).direction;
  }

  @property void direction(gtk.types.TextDirection propval)
  {
    (cast(GtkTextAttributes*)cPtr).direction = cast(GtkTextDirection)propval;
  }

  @property pango.font_description.FontDescription font()
  {
    return cToD!(pango.font_description.FontDescription)(cast(void*)(cast(GtkTextAttributes*)cPtr).font);
  }

  @property void font(pango.font_description.FontDescription propval)
  {
    cValueFree!(pango.font_description.FontDescription)(cast(void*)(cast(GtkTextAttributes*)cPtr).font);
    dToC(propval, cast(void*)&(cast(GtkTextAttributes*)cPtr).font);
  }

  @property double fontScale()
  {
    return (cast(GtkTextAttributes*)cPtr).fontScale;
  }

  @property void fontScale(double propval)
  {
    (cast(GtkTextAttributes*)cPtr).fontScale = propval;
  }

  @property int leftMargin()
  {
    return (cast(GtkTextAttributes*)cPtr).leftMargin;
  }

  @property void leftMargin(int propval)
  {
    (cast(GtkTextAttributes*)cPtr).leftMargin = propval;
  }

  @property int rightMargin()
  {
    return (cast(GtkTextAttributes*)cPtr).rightMargin;
  }

  @property void rightMargin(int propval)
  {
    (cast(GtkTextAttributes*)cPtr).rightMargin = propval;
  }

  @property int indent()
  {
    return (cast(GtkTextAttributes*)cPtr).indent;
  }

  @property void indent(int propval)
  {
    (cast(GtkTextAttributes*)cPtr).indent = propval;
  }

  @property int pixelsAboveLines()
  {
    return (cast(GtkTextAttributes*)cPtr).pixelsAboveLines;
  }

  @property void pixelsAboveLines(int propval)
  {
    (cast(GtkTextAttributes*)cPtr).pixelsAboveLines = propval;
  }

  @property int pixelsBelowLines()
  {
    return (cast(GtkTextAttributes*)cPtr).pixelsBelowLines;
  }

  @property void pixelsBelowLines(int propval)
  {
    (cast(GtkTextAttributes*)cPtr).pixelsBelowLines = propval;
  }

  @property int pixelsInsideWrap()
  {
    return (cast(GtkTextAttributes*)cPtr).pixelsInsideWrap;
  }

  @property void pixelsInsideWrap(int propval)
  {
    (cast(GtkTextAttributes*)cPtr).pixelsInsideWrap = propval;
  }

  @property pango.tab_array.TabArray tabs()
  {
    return cToD!(pango.tab_array.TabArray)(cast(void*)(cast(GtkTextAttributes*)cPtr).tabs);
  }

  @property void tabs(pango.tab_array.TabArray propval)
  {
    cValueFree!(pango.tab_array.TabArray)(cast(void*)(cast(GtkTextAttributes*)cPtr).tabs);
    dToC(propval, cast(void*)&(cast(GtkTextAttributes*)cPtr).tabs);
  }

  @property gtk.types.WrapMode wrapMode()
  {
    return cast(gtk.types.WrapMode)(cast(GtkTextAttributes*)cPtr).wrapMode;
  }

  @property void wrapMode(gtk.types.WrapMode propval)
  {
    (cast(GtkTextAttributes*)cPtr).wrapMode = cast(GtkWrapMode)propval;
  }

  @property pango.language.Language language()
  {
    return cToD!(pango.language.Language)(cast(void*)(cast(GtkTextAttributes*)cPtr).language);
  }

  @property void language(pango.language.Language propval)
  {
    cValueFree!(pango.language.Language)(cast(void*)(cast(GtkTextAttributes*)cPtr).language);
    dToC(propval, cast(void*)&(cast(GtkTextAttributes*)cPtr).language);
  }

  @property uint invisible()
  {
    return (cast(GtkTextAttributes*)cPtr).invisible;
  }

  @property void invisible(uint propval)
  {
    (cast(GtkTextAttributes*)cPtr).invisible = propval;
  }

  @property uint bgFullHeight()
  {
    return (cast(GtkTextAttributes*)cPtr).bgFullHeight;
  }

  @property void bgFullHeight(uint propval)
  {
    (cast(GtkTextAttributes*)cPtr).bgFullHeight = propval;
  }

  @property uint editable()
  {
    return (cast(GtkTextAttributes*)cPtr).editable;
  }

  @property void editable(uint propval)
  {
    (cast(GtkTextAttributes*)cPtr).editable = propval;
  }

  @property uint noFallback()
  {
    return (cast(GtkTextAttributes*)cPtr).noFallback;
  }

  @property void noFallback(uint propval)
  {
    (cast(GtkTextAttributes*)cPtr).noFallback = propval;
  }

  @property int letterSpacing()
  {
    return (cast(GtkTextAttributes*)cPtr).letterSpacing;
  }

  @property void letterSpacing(int propval)
  {
    (cast(GtkTextAttributes*)cPtr).letterSpacing = propval;
  }

  /**
      Creates a #GtkTextAttributes, which describes
    a set of properties on some text.
    Returns:     a new #GtkTextAttributes,
          free with [gtk.text_attributes.TextAttributes.unref].
  */
  this()
  {
    GtkTextAttributes* _cretval;
    _cretval = gtk_text_attributes_new();
    this(_cretval, Yes.Take);
  }

  /**
      Copies src and returns a new #GtkTextAttributes.
    Returns:     a copy of src,
          free with [gtk.text_attributes.TextAttributes.unref]
  */
  gtk.text_attributes.TextAttributes copy()
  {
    GtkTextAttributes* _cretval;
    _cretval = gtk_text_attributes_copy(cast(GtkTextAttributes*)cPtr);
    auto _retval = _cretval ? new gtk.text_attributes.TextAttributes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copies the values from src to dest so that dest has
    the same values as src. Frees existing values in dest.
    Params:
      dest =       another #GtkTextAttributes
  */
  void copyValues(gtk.text_attributes.TextAttributes dest)
  {
    gtk_text_attributes_copy_values(cast(GtkTextAttributes*)cPtr, dest ? cast(GtkTextAttributes*)dest.cPtr(No.Dup) : null);
  }
}
