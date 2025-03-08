module gstpbutils.discoverer_container_info;

import gid.gid;
import gst.tag_list;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.discoverer_stream_info;
import gstpbutils.types;

/**
    #GstDiscovererStreamInfo specific to container streams.
*/
class DiscovererContainerInfo : gstpbutils.discoverer_stream_info.DiscovererStreamInfo
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_discoverer_container_info_get_type != &gidSymbolNotFound ? gst_discoverer_container_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  gstpbutils.discoverer_stream_info.DiscovererStreamInfo[] getStreams()
  {
    GList* _cretval;
    _cretval = gst_discoverer_container_info_get_streams(cast(GstDiscovererContainerInfo*)cPtr);
    auto _retval = gListToD!(gstpbutils.discoverer_stream_info.DiscovererStreamInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  override gst.tag_list.TagList getTags()
  {
    const(GstTagList)* _cretval;
    _cretval = gst_discoverer_container_info_get_tags(cast(const(GstDiscovererContainerInfo)*)cPtr);
    auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, No.take) : null;
    return _retval;
  }
}
