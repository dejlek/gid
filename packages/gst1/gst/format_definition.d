module gst.format_definition;

import gid.gid;
import glib.types;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    A format definition
*/
class FormatDefinition
{
  GstFormatDefinition cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gst.FormatDefinition");

    cInstance = *cast(GstFormatDefinition*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.types.Format value()
  {
    return cast(gst.types.Format)(cast(GstFormatDefinition*)cPtr).value;
  }

  @property void value(gst.types.Format propval)
  {
    (cast(GstFormatDefinition*)cPtr).value = cast(GstFormat)propval;
  }

  @property string nick()
  {
    return (cast(GstFormatDefinition*)cPtr).nick.fromCString(No.Free);
  }

  @property void nick(string propval)
  {
    safeFree(cast(void*)(cast(GstFormatDefinition*)cPtr).nick);
    (cast(GstFormatDefinition*)cPtr).nick = propval.toCString(Yes.Alloc);
  }

  @property string description()
  {
    return (cast(GstFormatDefinition*)cPtr).description.fromCString(No.Free);
  }

  @property void description(string propval)
  {
    safeFree(cast(void*)(cast(GstFormatDefinition*)cPtr).description);
    (cast(GstFormatDefinition*)cPtr).description = propval.toCString(Yes.Alloc);
  }

  @property glib.types.Quark quark()
  {
    return (cast(GstFormatDefinition*)cPtr).quark;
  }

  @property void quark(glib.types.Quark propval)
  {
    (cast(GstFormatDefinition*)cPtr).quark = propval;
  }
}
