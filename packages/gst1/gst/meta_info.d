module gst.meta_info;

import gid.gid;
import gobject.types;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    The #GstMetaInfo provides information about a specific metadata
  structure.
*/
class MetaInfo
{
  GstMetaInfo cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gst.MetaInfo");

    cInstance = *cast(GstMetaInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gobject.types.GType api()
  {
    return (cast(GstMetaInfo*)cPtr).api;
  }

  @property void api(gobject.types.GType propval)
  {
    (cast(GstMetaInfo*)cPtr).api = propval;
  }

  @property gobject.types.GType type()
  {
    return (cast(GstMetaInfo*)cPtr).type;
  }

  @property void type(gobject.types.GType propval)
  {
    (cast(GstMetaInfo*)cPtr).type = propval;
  }

  @property size_t size()
  {
    return (cast(GstMetaInfo*)cPtr).size;
  }

  @property void size(size_t propval)
  {
    (cast(GstMetaInfo*)cPtr).size = propval;
  }

  @property GstMetaInitFunction initFunc()
  {
    return (cast(GstMetaInfo*)cPtr).initFunc;
  }

  @property void initFunc(GstMetaInitFunction propval)
  {
    (cast(GstMetaInfo*)cPtr).initFunc = propval;
  }

  @property GstMetaFreeFunction freeFunc()
  {
    return (cast(GstMetaInfo*)cPtr).freeFunc;
  }

  @property void freeFunc(GstMetaFreeFunction propval)
  {
    (cast(GstMetaInfo*)cPtr).freeFunc = propval;
  }

  @property GstMetaTransformFunction transformFunc()
  {
    return (cast(GstMetaInfo*)cPtr).transformFunc;
  }

  @property void transformFunc(GstMetaTransformFunction propval)
  {
    (cast(GstMetaInfo*)cPtr).transformFunc = propval;
  }

  @property GstMetaDeserializeFunction deserializeFunc()
  {
    return (cast(GstMetaInfo*)cPtr).deserializeFunc;
  }

  @property void deserializeFunc(GstMetaDeserializeFunction propval)
  {
    (cast(GstMetaInfo*)cPtr).deserializeFunc = propval;
  }

  @property GstMetaClearFunction clearFunc()
  {
    return (cast(GstMetaInfo*)cPtr).clearFunc;
  }

  @property void clearFunc(GstMetaClearFunction propval)
  {
    (cast(GstMetaInfo*)cPtr).clearFunc = propval;
  }

  /** */
  bool isCustom()
  {
    bool _retval;
    _retval = gst_meta_info_is_custom(cast(const(GstMetaInfo)*)cPtr);
    return _retval;
  }

  /**
      Registers a new meta.
    
    Use the structure returned by [gst.meta_info.MetaInfo.new_], it consumes it and the
    structure shouldnt be used after. The one returned by the function can be
    kept.
    Returns:     the registered meta
  */
  gst.meta_info.MetaInfo register()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_meta_info_register(cast(GstMetaInfo*)cPtr);
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
