/// Module for [AudioVisualizer] class
module gstpbutils.audio_visualizer;

import gid.gid;
import gobject.object;
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_visualizer_get_type != &gidSymbolNotFound ? gst_audio_visualizer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioVisualizer self()
  {
    return this;
  }

  /** */
  @property uint shadeAmount()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("shade-amount");
  }

  /** */
  @property void shadeAmount(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("shade-amount", propval);
  }

  /** */
  @property gstpbutils.types.AudioVisualizerShader shader()
  {
    return gobject.object.ObjectWrap.getProperty!(gstpbutils.types.AudioVisualizerShader)("shader");
  }

  /** */
  @property void shader(gstpbutils.types.AudioVisualizerShader propval)
  {
    gobject.object.ObjectWrap.setProperty!(gstpbutils.types.AudioVisualizerShader)("shader", propval);
  }
}
