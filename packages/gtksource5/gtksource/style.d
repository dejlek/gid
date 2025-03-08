module gtksource.style;

import gid.gid;
import gobject.object;
import gtk.text_tag;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
    Represents a style.
  
  The [gtksource.style.Style] structure is used to describe text attributes
  which are set when given style is used.
*/
class Style : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_style_get_type != &gidSymbolNotFound ? gtk_source_style_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      This function modifies the [gtk.text_tag.TextTag] properties that are related to the
    #GtkSourceStyle properties. Other [gtk.text_tag.TextTag] properties are left untouched.
    
    If style is non-null, applies style to tag.
    
    If style is null, the related *-set properties of [gtk.text_tag.TextTag] are set to
    false.
    Params:
      tag =       a #GtkTextTag to apply styles to.
  */
  void apply(gtk.text_tag.TextTag tag)
  {
    gtk_source_style_apply(cast(const(GtkSourceStyle)*)cPtr, tag ? cast(GtkTextTag*)tag.cPtr(No.Dup) : null);
  }

  /**
      Creates a copy of style, that is a new #GtkSourceStyle instance which
    has the same attributes set.
    Returns:     copy of style, call [gobject.object.ObjectG.unref]
      when you are done with it.
  */
  gtksource.style.Style copy()
  {
    GtkSourceStyle* _cretval;
    _cretval = gtk_source_style_copy(cast(const(GtkSourceStyle)*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.style.Style)(cast(GtkSourceStyle*)_cretval, Yes.Take);
    return _retval;
  }
}
