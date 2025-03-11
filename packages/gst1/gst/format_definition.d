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
      gFree(ptr);
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
    return cToD!(string)(cast(void*)(cast(GstFormatDefinition*)cPtr).nick);
  }

  @property void nick(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstFormatDefinition*)cPtr).nick);
    dToC(propval, cast(void*)&(cast(GstFormatDefinition*)cPtr).nick);
  }

  @property string description()
  {
    return cToD!(string)(cast(void*)(cast(GstFormatDefinition*)cPtr).description);
  }

  @property void description(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstFormatDefinition*)cPtr).description);
    dToC(propval, cast(void*)&(cast(GstFormatDefinition*)cPtr).description);
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
