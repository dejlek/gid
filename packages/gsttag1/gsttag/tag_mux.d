/// Module for [TagMux] class
module gsttag.tag_mux;

import gid.gid;
import gst.element;
import gst.tag_setter;
import gst.tag_setter_mixin;
import gsttag.c.functions;
import gsttag.c.types;
import gsttag.types;

/**
    Provides a base class for adding tags at the beginning or end of a
    stream.
    
    ## Deriving from GstTagMux
    
    Subclasses have to do the following things:
    
     $(LIST
        * In their base init function, they must add pad templates for the sink
          pad and the source pad to the element class, describing the media type
          they accept and output in the caps of the pad template.
        * In their class init function, they must override the
          GST_TAG_MUX_CLASS(mux_klass)->render_start_tag and/or
          GST_TAG_MUX_CLASS(mux_klass)->render_end_tag vfuncs and set up a render
          function.
     )
*/
class TagMux : gst.element.Element, gst.tag_setter.TagSetter
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
    return cast(void function())gst_tag_mux_get_type != &gidSymbolNotFound ? gst_tag_mux_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override TagMux self()
  {
    return this;
  }

  mixin TagSetterT!();
}
