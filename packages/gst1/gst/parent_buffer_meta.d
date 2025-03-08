module gst.parent_buffer_meta;

import gid.gid;
import gst.buffer;
import gst.c.functions;
import gst.c.types;
import gst.meta;
import gst.meta_info;
import gst.types;

/**
    The #GstParentBufferMeta is a #GstMeta which can be attached to a #GstBuffer
  to hold a reference to another buffer that is only released when the child
  #GstBuffer is released.
  
  Typically, #GstParentBufferMeta is used when the child buffer is directly
  using the #GstMemory of the parent buffer, and wants to prevent the parent
  buffer from being returned to a buffer pool until the #GstMemory is available
  for re-use.
*/
class ParentBufferMeta
{
  GstParentBufferMeta cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gst.ParentBufferMeta");

    cInstance = *cast(GstParentBufferMeta*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta parent()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstParentBufferMeta*)cPtr).parent);
  }

  @property gst.buffer.Buffer buffer()
  {
    return new gst.buffer.Buffer(cast(GstBuffer*)(cast(GstParentBufferMeta*)cPtr).buffer);
  }

  /**
      Gets the global #GstMetaInfo describing  the #GstParentBufferMeta meta.
    Returns:     The #GstMetaInfo
  */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_parent_buffer_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
