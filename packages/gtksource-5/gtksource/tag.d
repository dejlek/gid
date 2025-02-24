module gtksource.tag;

import gid.gid;
import gtk.text_tag;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
 * A tag that can be applied to text in a class@Buffer.
 * `GtkSourceTag` is a subclass of [Gtk.TextTag] that adds properties useful for
 * the GtkSourceView library.
 * If, for a certain tag, [Gtk.TextTag] is sufficient, it's better that you create
 * a [Gtk.TextTag], not a class@Tag.
 */
class Tag : TextTag
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_tag_get_type != &gidSymbolNotFound ? gtk_source_tag_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
