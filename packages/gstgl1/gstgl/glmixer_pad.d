/// Module for [GLMixerPad] class
module gstgl.glmixer_pad;

import gid.gid;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glbase_mixer_pad;
import gstgl.types;

/** */
class GLMixerPad : gstgl.glbase_mixer_pad.GLBaseMixerPad
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_mixer_pad_get_type != &gidSymbolNotFound ? gst_gl_mixer_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLMixerPad self()
  {
    return this;
  }
}
