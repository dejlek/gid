/// Module for [AudioQuantize] class
module gstaudio.audio_quantize;

import gid.gid;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/** */
class AudioQuantize
{
  GstAudioQuantize* cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstaudio.audio_quantize.AudioQuantize");

    cInstancePtr = cast(GstAudioQuantize*)ptr;

    owned = take;
  }

  /** */
  void* cPtr()
  {
    return cast(void*)cInstancePtr;
  }

  /**
      Reset quant to the state is was when created, clearing any
      history it might have.
  */
  void reset()
  {
    gst_audio_quantize_reset(cast(GstAudioQuantize*)cPtr);
  }
}
