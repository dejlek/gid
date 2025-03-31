/// Module for [Stream] class
module gst.stream;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.object;
import gst.tag_list;
import gst.types;

/**
    A high-level object representing a single stream. It might be backed, or
    not, by an actual flow of data in a pipeline (#GstPad).
    
    A #GstStream does not care about data changes (such as decoding, encoding,
    parsing,...) as long as the underlying data flow corresponds to the same
    high-level flow (ex: a certain audio track).
    
    A #GstStream contains all the information pertinent to a stream, such as
    stream-id, tags, caps, type, ...
    
    Elements can subclass a #GstStream for internal usage (to contain information
    pertinent to streams of data).
*/
class Stream : gst.object.ObjectGst
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
    return cast(void function())gst_stream_get_type != &gidSymbolNotFound ? gst_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override Stream self()
  {
    return this;
  }

  /**
      Create a new #GstStream for the given stream_id, caps, type
      and flags
  
      Params:
        streamId = the id for the new stream. If null,
          a new one will be automatically generated
        caps = the #GstCaps of the stream
        type = the #GstStreamType of the stream
        flags = the #GstStreamFlags of the stream
      Returns: The new #GstStream
  */
  this(string streamId, gst.caps.Caps caps, gst.types.StreamType type, gst.types.StreamFlags flags)
  {
    GstStream* _cretval;
    const(char)* _streamId = streamId.toCString(No.Alloc);
    _cretval = gst_stream_new(_streamId, caps ? cast(GstCaps*)caps.cPtr(No.Dup) : null, type, flags);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieve the caps for stream, if any
      Returns: The #GstCaps for stream
  */
  gst.caps.Caps getCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_stream_get_caps(cast(GstStream*)cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieve the current stream flags for stream
      Returns: The #GstStreamFlags for stream
  */
  gst.types.StreamFlags getStreamFlags()
  {
    GstStreamFlags _cretval;
    _cretval = gst_stream_get_stream_flags(cast(GstStream*)cPtr);
    gst.types.StreamFlags _retval = cast(gst.types.StreamFlags)_cretval;
    return _retval;
  }

  /**
      Returns the stream ID of stream.
      Returns: the stream ID of stream. Only valid
        during the lifetime of stream.
  */
  string getStreamId()
  {
    const(char)* _cretval;
    _cretval = gst_stream_get_stream_id(cast(GstStream*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieve the stream type for stream
      Returns: The #GstStreamType for stream
  */
  gst.types.StreamType getStreamType()
  {
    GstStreamType _cretval;
    _cretval = gst_stream_get_stream_type(cast(GstStream*)cPtr);
    gst.types.StreamType _retval = cast(gst.types.StreamType)_cretval;
    return _retval;
  }

  /**
      Retrieve the tags for stream, if any
      Returns: The #GstTagList for stream
  */
  gst.tag_list.TagList getTags()
  {
    GstTagList* _cretval;
    _cretval = gst_stream_get_tags(cast(GstStream*)cPtr);
    auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Set the caps for the #GstStream
  
      Params:
        caps = a #GstCaps
  */
  void setCaps(gst.caps.Caps caps = null)
  {
    gst_stream_set_caps(cast(GstStream*)cPtr, caps ? cast(GstCaps*)caps.cPtr(No.Dup) : null);
  }

  /**
      Set the flags for the stream.
  
      Params:
        flags = the flags to set on stream
  */
  void setStreamFlags(gst.types.StreamFlags flags)
  {
    gst_stream_set_stream_flags(cast(GstStream*)cPtr, flags);
  }

  /**
      Set the stream type of stream
  
      Params:
        streamType = the type to set on stream
  */
  void setStreamType(gst.types.StreamType streamType)
  {
    gst_stream_set_stream_type(cast(GstStream*)cPtr, streamType);
  }

  /**
      Set the tags for the #GstStream
  
      Params:
        tags = a #GstTagList
  */
  void setTags(gst.tag_list.TagList tags = null)
  {
    gst_stream_set_tags(cast(GstStream*)cPtr, tags ? cast(GstTagList*)tags.cPtr(No.Dup) : null);
  }
}
