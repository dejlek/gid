module gstnet.net_control_message_meta;

import gid.gid;
import gio.socket_control_message;
import gobject.object;
import gst.meta;
import gst.meta_info;
import gstnet.c.functions;
import gstnet.c.types;
import gstnet.types;

/**
    #GstNetControlMessageMeta can be used to store control messages (ancillary
  data) which was received with or is to be sent alongside the buffer data.
  When used with socket sinks and sources which understand this meta it allows
  sending and receiving ancillary data such as unix credentials (See
  #GUnixCredentialsMessage) and Unix file descriptions (See #GUnixFDMessage).
*/
class NetControlMessageMeta
{
  GstNetControlMessageMeta cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstNet.NetControlMessageMeta");

    cInstance = *cast(GstNetControlMessageMeta*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstNetControlMessageMeta*)cPtr).meta);
  }

  @property gio.socket_control_message.SocketControlMessage message()
  {
    return ObjectG.getDObject!(gio.socket_control_message.SocketControlMessage)((cast(GstNetControlMessageMeta*)cPtr).message, No.take);
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_net_control_message_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
