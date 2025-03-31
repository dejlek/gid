/// Module for [RTPPayloadInfo] class
module gstrtp.rtppayload_info;

import gid.gid;
import gstrtp.c.functions;
import gstrtp.c.types;
import gstrtp.types;

/**
    Structure holding default payload type information.
*/
class RTPPayloadInfo
{
  GstRTPPayloadInfo cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstRtp.RTPPayloadInfo");

    cInstance = *cast(GstRTPPayloadInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ubyte payloadType()
  {
    return (cast(GstRTPPayloadInfo*)cPtr).payloadType;
  }

  @property void payloadType(ubyte propval)
  {
    (cast(GstRTPPayloadInfo*)cPtr).payloadType = propval;
  }

  @property string media()
  {
    return cToD!(string)(cast(void*)(cast(GstRTPPayloadInfo*)cPtr).media);
  }

  @property void media(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTPPayloadInfo*)cPtr).media);
    dToC(propval, cast(void*)&(cast(GstRTPPayloadInfo*)cPtr).media);
  }

  @property string encodingName()
  {
    return cToD!(string)(cast(void*)(cast(GstRTPPayloadInfo*)cPtr).encodingName);
  }

  @property void encodingName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTPPayloadInfo*)cPtr).encodingName);
    dToC(propval, cast(void*)&(cast(GstRTPPayloadInfo*)cPtr).encodingName);
  }

  @property uint clockRate()
  {
    return (cast(GstRTPPayloadInfo*)cPtr).clockRate;
  }

  @property void clockRate(uint propval)
  {
    (cast(GstRTPPayloadInfo*)cPtr).clockRate = propval;
  }

  @property string encodingParameters()
  {
    return cToD!(string)(cast(void*)(cast(GstRTPPayloadInfo*)cPtr).encodingParameters);
  }

  @property void encodingParameters(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTPPayloadInfo*)cPtr).encodingParameters);
    dToC(propval, cast(void*)&(cast(GstRTPPayloadInfo*)cPtr).encodingParameters);
  }

  @property uint bitrate()
  {
    return (cast(GstRTPPayloadInfo*)cPtr).bitrate;
  }

  @property void bitrate(uint propval)
  {
    (cast(GstRTPPayloadInfo*)cPtr).bitrate = propval;
  }

  /**
      Get the #GstRTPPayloadInfo for media and encoding_name. This function is
      mostly used to get the default clock-rate and bandwidth for dynamic payload
      types specified with media and encoding name.
      
      The search for encoding_name will be performed in a case insensitive way.
  
      Params:
        media = the media to find
        encodingName = the encoding name to find
      Returns: a #GstRTPPayloadInfo or NULL when no info could be found.
  */
  static gstrtp.rtppayload_info.RTPPayloadInfo forName(string media, string encodingName)
  {
    const(GstRTPPayloadInfo)* _cretval;
    const(char)* _media = media.toCString(No.Alloc);
    const(char)* _encodingName = encodingName.toCString(No.Alloc);
    _cretval = gst_rtp_payload_info_for_name(_media, _encodingName);
    auto _retval = _cretval ? new gstrtp.rtppayload_info.RTPPayloadInfo(cast(GstRTPPayloadInfo*)_cretval) : null;
    return _retval;
  }

  /**
      Get the #GstRTPPayloadInfo for payload_type. This function is
      mostly used to get the default clock-rate and bandwidth for static payload
      types specified with payload_type.
  
      Params:
        payloadType = the payload_type to find
      Returns: a #GstRTPPayloadInfo or NULL when no info could be found.
  */
  static gstrtp.rtppayload_info.RTPPayloadInfo forPt(ubyte payloadType)
  {
    const(GstRTPPayloadInfo)* _cretval;
    _cretval = gst_rtp_payload_info_for_pt(payloadType);
    auto _retval = _cretval ? new gstrtp.rtppayload_info.RTPPayloadInfo(cast(GstRTPPayloadInfo*)_cretval) : null;
    return _retval;
  }
}
