/// Module for [OutputMessage] class
module gio.output_message;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_address;
import gio.types;

/**
    Structure used for scatter/gather data output when sending multiple
    messages or packets in one go. You generally pass in an array of
    #GOutputVectors and the operation will use all the buffers as if they
    were one buffer.
    
    If @address is null then the message is sent to the default receiver
    (as previously set by [gio.socket.Socket.connect]).
*/
class OutputMessage
{
  GOutputMessage cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.OutputMessage");

    cInstance = *cast(GOutputMessage*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gio.socket_address.SocketAddress address()
  {
    return cToD!(gio.socket_address.SocketAddress)(cast(void*)(cast(GOutputMessage*)cPtr).address);
  }

  @property void address(gio.socket_address.SocketAddress propval)
  {
    cValueFree!(gio.socket_address.SocketAddress)(cast(void*)(cast(GOutputMessage*)cPtr).address);
    dToC(propval, cast(void*)&(cast(GOutputMessage*)cPtr).address);
  }

  @property gio.types.OutputVector vectors()
  {
    return cToD!(gio.types.OutputVector)(cast(void*)(cast(GOutputMessage*)cPtr).vectors);
  }

  @property void vectors(gio.types.OutputVector propval)
  {
    (cast(GOutputMessage*)cPtr).vectors = &propval;
  }

  @property uint numVectors()
  {
    return (cast(GOutputMessage*)cPtr).numVectors;
  }

  @property void numVectors(uint propval)
  {
    (cast(GOutputMessage*)cPtr).numVectors = propval;
  }

  @property uint bytesSent()
  {
    return (cast(GOutputMessage*)cPtr).bytesSent;
  }

  @property void bytesSent(uint propval)
  {
    (cast(GOutputMessage*)cPtr).bytesSent = propval;
  }

  @property uint numControlMessages()
  {
    return (cast(GOutputMessage*)cPtr).numControlMessages;
  }

  @property void numControlMessages(uint propval)
  {
    (cast(GOutputMessage*)cPtr).numControlMessages = propval;
  }
}
