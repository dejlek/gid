module gst.pad_probe_info;

import gid.gid;
import gst.buffer;
import gst.buffer_list;
import gst.c.functions;
import gst.c.types;
import gst.event;
import gst.query;
import gst.types;

/**
    Info passed in the #GstPadProbeCallback.
*/
class PadProbeInfo
{
  GstPadProbeInfo cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gst.PadProbeInfo");

    cInstance = *cast(GstPadProbeInfo*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.types.PadProbeType type()
  {
    return cast(gst.types.PadProbeType)(cast(GstPadProbeInfo*)cPtr).type;
  }

  @property void type(gst.types.PadProbeType propval)
  {
    (cast(GstPadProbeInfo*)cPtr).type = cast(GstPadProbeType)propval;
  }

  @property gulong id()
  {
    return (cast(GstPadProbeInfo*)cPtr).id;
  }

  @property void id(gulong propval)
  {
    (cast(GstPadProbeInfo*)cPtr).id = propval;
  }

  @property ulong offset()
  {
    return (cast(GstPadProbeInfo*)cPtr).offset;
  }

  @property void offset(ulong propval)
  {
    (cast(GstPadProbeInfo*)cPtr).offset = propval;
  }

  @property uint size()
  {
    return (cast(GstPadProbeInfo*)cPtr).size;
  }

  @property void size(uint propval)
  {
    (cast(GstPadProbeInfo*)cPtr).size = propval;
  }

  /** */
  gst.buffer.Buffer getBuffer()
  {
    GstBuffer* _cretval;
    _cretval = gst_pad_probe_info_get_buffer(cast(GstPadProbeInfo*)cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, No.take) : null;
    return _retval;
  }

  /** */
  gst.buffer_list.BufferList getBufferList()
  {
    GstBufferList* _cretval;
    _cretval = gst_pad_probe_info_get_buffer_list(cast(GstPadProbeInfo*)cPtr);
    auto _retval = _cretval ? new gst.buffer_list.BufferList(cast(void*)_cretval, No.take) : null;
    return _retval;
  }

  /** */
  gst.event.Event getEvent()
  {
    GstEvent* _cretval;
    _cretval = gst_pad_probe_info_get_event(cast(GstPadProbeInfo*)cPtr);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, No.take) : null;
    return _retval;
  }

  /** */
  gst.query.Query getQuery()
  {
    GstQuery* _cretval;
    _cretval = gst_pad_probe_info_get_query(cast(GstPadProbeInfo*)cPtr);
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, No.take) : null;
    return _retval;
  }
}
