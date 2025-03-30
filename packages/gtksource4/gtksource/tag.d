/// Module for [Tag] class
module gtksource.tag;

import gid.gid;
import gtk.text_tag;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/** */
class Tag : gtk.text_tag.TextTag
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_tag_get_type != &gidSymbolNotFound ? gtk_source_tag_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override Tag self()
  {
    return this;
  }

  /**
      Creates a #GtkSourceTag. Configure the tag using object arguments,
      i.e. using [gobject.object.ObjectG.set].
      
      For usual cases, [gtksource.buffer.Buffer.createSourceTag] is more convenient to
      use.
  
      Params:
        name = tag name, or null.
      Returns: a new #GtkSourceTag.
  */
  this(string name = null)
  {
    GtkTextTag* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_source_tag_new(_name);
    this(_cretval, Yes.Take);
  }
}
