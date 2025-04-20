/// Module for [NetControlMessageMeta] class
module gstnet.net_control_message_meta;

import gid.gid;
import gio.socket_control_message;
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstnet.net_control_message_meta.NetControlMessageMeta");

    cInstance = *cast(GstNetControlMessageMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `meta` field.
      Returns: the parent type
  */
  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstNetControlMessageMeta*)cPtr).meta);
  }

  /**
      Get `message` field.
      Returns: a #GSocketControlMessage stored as metadata
  */
  @property gio.socket_control_message.SocketControlMessage message()
  {
    return cToD!(gio.socket_control_message.SocketControlMessage)(cast(void*)(cast(GstNetControlMessageMeta*)cPtr).message);
  }

  /**
      Set `message` field.
      Params:
        propval = a #GSocketControlMessage stored as metadata
  */
  @property void message(gio.socket_control_message.SocketControlMessage propval)
  {
    cValueFree!(gio.socket_control_message.SocketControlMessage)(cast(void*)(cast(GstNetControlMessageMeta*)cPtr).message);
    dToC(propval, cast(void*)&(cast(GstNetControlMessageMeta*)cPtr).message);
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
