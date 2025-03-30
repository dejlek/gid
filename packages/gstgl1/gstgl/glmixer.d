/// Module for [GLMixer] class
module gstgl.glmixer;

import gid.gid;
import gobject.object;
import gst.buffer;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glbase_mixer;
import gstgl.glframebuffer;
import gstgl.types;

/**
    #GstGLMixer helps implement an element that operates on RGBA textures.
*/
class GLMixer : gstgl.glbase_mixer.GLBaseMixer
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
    return cast(void function())gst_gl_mixer_get_type != &gidSymbolNotFound ? gst_gl_mixer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override GLMixer self()
  {
    return this;
  }

  /** */
  gstgl.glframebuffer.GLFramebuffer getFramebuffer()
  {
    GstGLFramebuffer* _cretval;
    _cretval = gst_gl_mixer_get_framebuffer(cast(GstGLMixer*)cPtr);
    auto _retval = ObjectG.getDObject!(gstgl.glframebuffer.GLFramebuffer)(cast(GstGLFramebuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Perform processing required and call #GstGLMixerClass::process_textures().
      Intended for use within implementations of
      #GstGLMixerClass::process_buffers().
  
      Params:
        outbuf = output GstBuffer
      Returns: whether processing of textures succeeded
  */
  bool processTextures(gst.buffer.Buffer outbuf)
  {
    bool _retval;
    _retval = gst_gl_mixer_process_textures(cast(GstGLMixer*)cPtr, outbuf ? cast(GstBuffer*)outbuf.cPtr(No.Dup) : null);
    return _retval;
  }
}
