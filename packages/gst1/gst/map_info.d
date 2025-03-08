module gst.map_info;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.memory;
import gst.types;

/**
    A structure containing the result of a map operation such as
  [gst.memory.Memory.map]. It contains the data and size.
  
  #GstMapInfo cannot be used with g_auto() because it is ambiguous whether it
  needs to be unmapped using [gst.buffer.Buffer.unmap] or [gst.memory.Memory.unmap]. Instead,
  #GstBufferMapInfo and #GstMemoryMapInfo can be used in that case.
*/
class MapInfo
{
  GstMapInfo cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gst.MapInfo");

    cInstance = *cast(GstMapInfo*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.memory.Memory memory()
  {
    return new gst.memory.Memory(cast(GstMemory*)(cast(GstMapInfo*)cPtr).memory);
  }

  @property gst.types.MapFlags flags()
  {
    return cast(gst.types.MapFlags)(cast(GstMapInfo*)cPtr).flags;
  }

  @property void flags(gst.types.MapFlags propval)
  {
    (cast(GstMapInfo*)cPtr).flags = cast(GstMapFlags)propval;
  }

  @property size_t size()
  {
    return (cast(GstMapInfo*)cPtr).size;
  }

  @property void size(size_t propval)
  {
    (cast(GstMapInfo*)cPtr).size = propval;
  }

  @property size_t maxsize()
  {
    return (cast(GstMapInfo*)cPtr).maxsize;
  }

  @property void maxsize(size_t propval)
  {
    (cast(GstMapInfo*)cPtr).maxsize = propval;
  }
}
