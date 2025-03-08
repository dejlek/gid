module gstgl.glview_convert;

import gid.gid;
import gst.buffer;
import gst.caps;
import gst.object;
import gst.types;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;

/**
    Convert stereoscopic/multiview video using fragment shaders.
*/
class GLViewConvert : gst.object.ObjectGst
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_view_convert_get_type != &gidSymbolNotFound ? gst_gl_view_convert_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this()
  {
    GstGLViewConvert* _cretval;
    _cretval = gst_gl_view_convert_new();
    this(_cretval, Yes.take);
  }

  /**
      Provides an implementation of #GstBaseTransformClass.fixate_caps()
    Params:
      direction =       a #GstPadDirection
      caps =       the #GstCaps of direction
      othercaps =       the #GstCaps to fixate
    Returns:     the fixated #GstCaps
  */
  gst.caps.Caps fixateCaps(gst.types.PadDirection direction, gst.caps.Caps caps, gst.caps.Caps othercaps)
  {
    GstCaps* _cretval;
    _cretval = gst_gl_view_convert_fixate_caps(cast(GstGLViewConvert*)cPtr, direction, caps ? cast(GstCaps*)caps.cPtr(No.dup) : null, othercaps ? cast(GstCaps*)othercaps.cPtr(Yes.dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Retrieve the processed output buffer placing the output in outbuf_ptr.
    Params:
      outbufPtr =       a #GstBuffer
    Returns:     a #GstFlowReturn
  */
  gst.types.FlowReturn getOutput(out gst.buffer.Buffer outbufPtr)
  {
    GstFlowReturn _cretval;
    GstBuffer* _outbufPtr;
    _cretval = gst_gl_view_convert_get_output(cast(GstGLViewConvert*)cPtr, &_outbufPtr);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    outbufPtr = new gst.buffer.Buffer(cast(void*)_outbufPtr, Yes.take);
    return _retval;
  }

  /**
      Converts the data contained by inbuf using the formats specified by the
    #GstCaps passed to [gstgl.glview_convert.GLViewConvert.setCaps]
    Params:
      inbuf =       the #GstGLMemory filled #GstBuffer to convert
    Returns:     a converted #GstBuffer or null
  */
  gst.buffer.Buffer perform(gst.buffer.Buffer inbuf)
  {
    GstBuffer* _cretval;
    _cretval = gst_gl_view_convert_perform(cast(GstGLViewConvert*)cPtr, inbuf ? cast(GstBuffer*)inbuf.cPtr(No.dup) : null);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Reset viewconvert to the default state.  Further operation will require
    setting the caps with [gstgl.glview_convert.GLViewConvert.setCaps].
  */
  void reset()
  {
    gst_gl_view_convert_reset(cast(GstGLViewConvert*)cPtr);
  }

  /**
      Initializes viewconvert with the information required for conversion.
    Params:
      inCaps =       input #GstCaps
      outCaps =       output #GstCaps
    Returns: 
  */
  bool setCaps(gst.caps.Caps inCaps, gst.caps.Caps outCaps)
  {
    bool _retval;
    _retval = gst_gl_view_convert_set_caps(cast(GstGLViewConvert*)cPtr, inCaps ? cast(GstCaps*)inCaps.cPtr(No.dup) : null, outCaps ? cast(GstCaps*)outCaps.cPtr(No.dup) : null);
    return _retval;
  }

  /**
      Set context on viewconvert
    Params:
      context =       the #GstGLContext to set
  */
  void setContext(gstgl.glcontext.GLContext context)
  {
    gst_gl_view_convert_set_context(cast(GstGLViewConvert*)cPtr, context ? cast(GstGLContext*)context.cPtr(No.dup) : null);
  }

  /**
      Submit input to be processed by viewconvert
    Params:
      isDiscont =       true if we have a discontinuity
      input =       a #GstBuffer
    Returns:     a #GstFlowReturn
  */
  gst.types.FlowReturn submitInputBuffer(bool isDiscont, gst.buffer.Buffer input)
  {
    GstFlowReturn _cretval;
    _cretval = gst_gl_view_convert_submit_input_buffer(cast(GstGLViewConvert*)cPtr, isDiscont, input ? cast(GstBuffer*)input.cPtr(Yes.dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Provides an implementation of #GstBaseTransformClass.transform_caps()
    Params:
      direction =       a #GstPadDirection
      caps =       the #GstCaps to transform
      filter =       a set of filter #GstCaps
    Returns:     the converted #GstCaps
  */
  gst.caps.Caps transformCaps(gst.types.PadDirection direction, gst.caps.Caps caps, gst.caps.Caps filter)
  {
    GstCaps* _cretval;
    _cretval = gst_gl_view_convert_transform_caps(cast(GstGLViewConvert*)cPtr, direction, caps ? cast(GstCaps*)caps.cPtr(No.dup) : null, filter ? cast(GstCaps*)filter.cPtr(No.dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }
}
