/// Module for [VideoCodecFrame] class
module gstvideo.video_codec_frame;

import gid.gid;
import glib.types;
import gobject.boxed;
import gst.buffer;
import gst.types;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    A #GstVideoCodecFrame represents a video frame both in raw and
    encoded form.
*/
class VideoCodecFrame : gobject.boxed.Boxed
{

  /** */
  this()
  {
    super(gMalloc(GstVideoCodecFrame.sizeof), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_video_codec_frame_get_type != &gidSymbolNotFound ? gst_video_codec_frame_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override VideoCodecFrame self()
  {
    return this;
  }

  @property uint systemFrameNumber()
  {
    return (cast(GstVideoCodecFrame*)cPtr).systemFrameNumber;
  }

  @property void systemFrameNumber(uint propval)
  {
    (cast(GstVideoCodecFrame*)cPtr).systemFrameNumber = propval;
  }

  @property gst.types.ClockTime dts()
  {
    return (cast(GstVideoCodecFrame*)cPtr).dts;
  }

  @property void dts(gst.types.ClockTime propval)
  {
    (cast(GstVideoCodecFrame*)cPtr).dts = propval;
  }

  @property gst.types.ClockTime pts()
  {
    return (cast(GstVideoCodecFrame*)cPtr).pts;
  }

  @property void pts(gst.types.ClockTime propval)
  {
    (cast(GstVideoCodecFrame*)cPtr).pts = propval;
  }

  @property gst.types.ClockTime duration()
  {
    return (cast(GstVideoCodecFrame*)cPtr).duration;
  }

  @property void duration(gst.types.ClockTime propval)
  {
    (cast(GstVideoCodecFrame*)cPtr).duration = propval;
  }

  @property int distanceFromSync()
  {
    return (cast(GstVideoCodecFrame*)cPtr).distanceFromSync;
  }

  @property void distanceFromSync(int propval)
  {
    (cast(GstVideoCodecFrame*)cPtr).distanceFromSync = propval;
  }

  @property gst.buffer.Buffer inputBuffer()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoCodecFrame*)cPtr).inputBuffer);
  }

  @property void inputBuffer(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoCodecFrame*)cPtr).inputBuffer);
    dToC(propval, cast(void*)&(cast(GstVideoCodecFrame*)cPtr).inputBuffer);
  }

  @property gst.buffer.Buffer outputBuffer()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoCodecFrame*)cPtr).outputBuffer);
  }

  @property void outputBuffer(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoCodecFrame*)cPtr).outputBuffer);
    dToC(propval, cast(void*)&(cast(GstVideoCodecFrame*)cPtr).outputBuffer);
  }

  @property gst.types.ClockTime deadline()
  {
    return (cast(GstVideoCodecFrame*)cPtr).deadline;
  }

  @property void deadline(gst.types.ClockTime propval)
  {
    (cast(GstVideoCodecFrame*)cPtr).deadline = propval;
  }

  /**
      Gets private data set on the frame by the subclass via
      [gstvideo.video_codec_frame.VideoCodecFrame.setUserData] previously.
      Returns: The previously set user_data
  */
  void* getUserData()
  {
    auto _retval = gst_video_codec_frame_get_user_data(cast(GstVideoCodecFrame*)cPtr);
    return _retval;
  }

  /**
      Sets user_data on the frame and the #GDestroyNotify that will be called when
      the frame is freed. Allows to attach private data by the subclass to frames.
      
      If a user_data was previously set, then the previous set notify will be called
      before the user_data is replaced.
  
      Params:
        notify = a #GDestroyNotify
  */
  void setUserData(glib.types.DestroyNotify notify)
  {
    extern(C) void _notifyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _notifyCB = notify ? &_notifyCallback : null;

    auto _notify = notify ? freezeDelegate(cast(void*)&notify) : null;
    gst_video_codec_frame_set_user_data(cast(GstVideoCodecFrame*)cPtr, _notify, _notifyCB);
  }
}
