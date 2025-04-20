/// Module for [DiscovererSubtitleInfo] class
module gstpbutils.discoverer_subtitle_info;

import gid.gid;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.discoverer_stream_info;
import gstpbutils.types;

/**
    #GstDiscovererStreamInfo specific to subtitle streams (this includes text and
    image based ones).
*/
class DiscovererSubtitleInfo : gstpbutils.discoverer_stream_info.DiscovererStreamInfo
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
    return cast(void function())gst_discoverer_subtitle_info_get_type != &gidSymbolNotFound ? gst_discoverer_subtitle_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DiscovererSubtitleInfo self()
  {
    return this;
  }

  /** */
  string getLanguage()
  {
    const(char)* _cretval;
    _cretval = gst_discoverer_subtitle_info_get_language(cast(const(GstDiscovererSubtitleInfo)*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
