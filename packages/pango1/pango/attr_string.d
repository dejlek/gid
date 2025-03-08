module pango.attr_string;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    The [pango.attr_string.AttrString] structure is used to represent attributes with
  a string value.
*/
class AttrString
{
  PangoAttrString cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Pango.AttrString");

    cInstance = *cast(PangoAttrString*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property pango.attribute.Attribute attr()
  {
    return new pango.attribute.Attribute(cast(PangoAttribute*)&(cast(PangoAttrString*)cPtr).attr);
  }

  @property string value()
  {
    return (cast(PangoAttrString*)cPtr).value.fromCString(No.free);
  }

  @property void value(string propval)
  {
    safeFree(cast(void*)(cast(PangoAttrString*)cPtr).value);
    (cast(PangoAttrString*)cPtr).value = propval.toCString(Yes.alloc);
  }
}
