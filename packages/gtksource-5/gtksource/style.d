module gtksource.style;

import gid.gid;
import gobject.object;
import gtk.text_tag;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
 * Represents a style.
 * The `GtkSourceStyle` structure is used to describe text attributes
 * which are set when given style is used.
 */
class Style : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_style_get_type != &gidSymbolNotFound ? gtk_source_style_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * This function modifies the [Gtk.TextTag] properties that are related to the
   * #GtkSourceStyle properties. Other [Gtk.TextTag] properties are left untouched.
   * If style is non-%NULL, applies style to tag.
   * If style is %NULL, the related *-set properties of [Gtk.TextTag] are set to
   * %FALSE.
   * Params:
   *   tag = a #GtkTextTag to apply styles to.
   */
  void apply(TextTag tag)
  {
    gtk_source_style_apply(cast(GtkSourceStyle*)cPtr, tag ? cast(GtkTextTag*)tag.cPtr(No.Dup) : null);
  }

  /**
   * Creates a copy of style, that is a new #GtkSourceStyle instance which
   * has the same attributes set.
   * Returns: copy of style, call [GObject.ObjectG.unref]
   *   when you are done with it.
   */
  Style copy()
  {
    GtkSourceStyle* _cretval;
    _cretval = gtk_source_style_copy(cast(GtkSourceStyle*)cPtr);
    auto _retval = ObjectG.getDObject!Style(cast(GtkSourceStyle*)_cretval, Yes.Take);
    return _retval;
  }
}
