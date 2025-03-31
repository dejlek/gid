/// Module for [PushSrc] class
module gstbase.push_src;

import gid.gid;
import gstbase.base_src;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    This class is mostly useful for elements that cannot do
    random access, or at least very slowly. The source usually
    prefers to push out a fixed size buffer.
    
    Subclasses usually operate in a format that is different from the
    default GST_FORMAT_BYTES format of #GstBaseSrc.
    
    Classes extending this base class will usually be scheduled
    in a push based mode. If the peer accepts to operate without
    offsets and within the limits of the allowed block size, this
    class can operate in getrange based mode automatically. To make
    this possible, the subclass should implement and override the
    SCHEDULING query.
    
    The subclass should extend the methods from the baseclass in
    addition to the ::create method.
    
    Seeking, flushing, scheduling and sync is all handled by this
    base class.
*/
class PushSrc : gstbase.base_src.BaseSrc
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
    return cast(void function())gst_push_src_get_type != &gidSymbolNotFound ? gst_push_src_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override PushSrc self()
  {
    return this;
  }
}
