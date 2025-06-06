/// Module for [ReferenceTimestampMeta] class
module gst.reference_timestamp_meta;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.meta;
import gst.meta_info;
import gst.types;

/**
    #GstReferenceTimestampMeta can be used to attach alternative timestamps and
    possibly durations to a #GstBuffer. These are generally not according to
    the pipeline clock and could be e.g. the NTP timestamp when the media was
    captured.
    
    The reference is stored as a #GstCaps in @reference. Examples of valid
    references would be
    
     $(LIST
        * `timestamp/x-drivername-stream`: for timestamps that are locally
          generated by some driver named `drivername` when generating the stream,
          e.g. based on a frame counter
        * `timestamp/x-ntp, host=pool.ntp.org, port=123`: for timestamps based on a
          specific NTP server. Note that the host/port parameters might not always
          be given.
        * `timestamp/x-ptp, version=IEEE1588-2008, domain=1`: for timestamps based
          on a given PTP clock.
        * `timestamp/x-unix`: for timestamps based on the UNIX epoch according to
          the local clock.
     )
       
    Since 1.24 it can be serialized using [gst.meta.Meta.serialize] and
    [gst.meta.Meta.deserialize].
*/
class ReferenceTimestampMeta
{
  GstReferenceTimestampMeta cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gst.reference_timestamp_meta.ReferenceTimestampMeta");

    cInstance = *cast(GstReferenceTimestampMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `parent` field.
      Returns: the parent #GstMeta structure
  */
  @property gst.meta.Meta parent()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstReferenceTimestampMeta*)this._cPtr).parent, No.Take);
  }

  /**
      Get `reference` field.
      Returns: identifier for the timestamp reference.
  */
  @property gst.caps.Caps reference()
  {
    return cToD!(gst.caps.Caps)(cast(void*)(cast(GstReferenceTimestampMeta*)this._cPtr).reference);
  }

  /**
      Set `reference` field.
      Params:
        propval = identifier for the timestamp reference.
  */
  @property void reference(gst.caps.Caps propval)
  {
    cValueFree!(gst.caps.Caps)(cast(void*)(cast(GstReferenceTimestampMeta*)this._cPtr).reference);
    dToC(propval, cast(void*)&(cast(GstReferenceTimestampMeta*)this._cPtr).reference);
  }

  /**
      Get `timestamp` field.
      Returns: timestamp
  */
  @property gst.types.ClockTime timestamp()
  {
    return (cast(GstReferenceTimestampMeta*)this._cPtr).timestamp;
  }

  /**
      Set `timestamp` field.
      Params:
        propval = timestamp
  */
  @property void timestamp(gst.types.ClockTime propval)
  {
    (cast(GstReferenceTimestampMeta*)this._cPtr).timestamp = propval;
  }

  /**
      Get `duration` field.
      Returns: duration, or `GST_CLOCK_TIME_NONE`
  */
  @property gst.types.ClockTime duration()
  {
    return (cast(GstReferenceTimestampMeta*)this._cPtr).duration;
  }

  /**
      Set `duration` field.
      Params:
        propval = duration, or `GST_CLOCK_TIME_NONE`
  */
  @property void duration(gst.types.ClockTime propval)
  {
    (cast(GstReferenceTimestampMeta*)this._cPtr).duration = propval;
  }

  /**
      Gets the global #GstMetaInfo describing the #GstReferenceTimestampMeta meta.
      Returns: The #GstMetaInfo
  */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_reference_timestamp_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval, No.Take) : null;
    return _retval;
  }
}
