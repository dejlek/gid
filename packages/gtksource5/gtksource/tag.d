module gtksource.tag;

import gid.gid;
import gtk.text_tag;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
    A tag that can be applied to text in a `class@Buffer`.
  
  [gtksource.tag.Tag] is a subclass of [gtk.text_tag.TextTag] that adds properties useful for
  the GtkSourceView library.
  
  If, for a certain tag, [gtk.text_tag.TextTag] is sufficient, it's better that you create
  a [gtk.text_tag.TextTag], not a `class@Tag`.
*/
class Tag : gtk.text_tag.TextTag
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_tag_get_type != &gidSymbolNotFound ? gtk_source_tag_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Tag self()
  {
    return this;
  }

  /**
      Creates a [gtksource.tag.Tag].
    
    Configure the tag using object arguments, i.e. using [gobject.object.ObjectG.set].
    
    For usual cases, [gtksource.buffer.Buffer.createSourceTag] is more convenient to
    use.
    Params:
      name =       tag name, or null.
    Returns:     a new [gtksource.tag.Tag].
  */
  this(string name = null)
  {
    GtkTextTag* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_source_tag_new(_name);
    this(_cretval, Yes.Take);
  }
}
