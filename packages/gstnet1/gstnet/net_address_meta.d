module gstnet.net_address_meta;

import gid.gid;
import gio.socket_address;
import gobject.object;
import gst.meta;
import gst.meta_info;
import gstnet.c.functions;
import gstnet.c.types;
import gstnet.types;

/**
    #GstNetAddressMeta can be used to store a network address (a #GSocketAddress)
  in a #GstBuffer so that it network elements can track the to and from address
  of the buffer.
*/
class NetAddressMeta
{
  GstNetAddressMeta cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstNet.NetAddressMeta");

    cInstance = *cast(GstNetAddressMeta*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstNetAddressMeta*)cPtr).meta);
  }

  @property gio.socket_address.SocketAddress addr()
  {
    return ObjectG.getDObject!(gio.socket_address.SocketAddress)((cast(GstNetAddressMeta*)cPtr).addr, No.take);
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_net_address_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
