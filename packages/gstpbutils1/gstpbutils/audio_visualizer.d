module gstpbutils.audio_visualizer;

import gid.gid;
import gst.element;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.types;

/**
    A baseclass for scopes (visualizers). It takes care of re-fitting the
  audio-rate to video-rate and handles renegotiation (downstream video size
  changes).
  
  It also provides several background shading effects. These effects are
  applied to a previous picture before the `render()` implementation can draw a
  new frame.
*/
class AudioVisualizer : gst.element.Element
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_visualizer_get_type != &gidSymbolNotFound ? gst_audio_visualizer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }
}
