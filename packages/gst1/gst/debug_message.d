module gst.debug_message;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

/** */
class DebugMessage
{
  GstDebugMessage* cInstancePtr;
  bool owned;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gst.DebugMessage");

    cInstancePtr = cast(GstDebugMessage*)ptr;

    owned = take;
  }

  void* cPtr()
  {
    return cast(void*)cInstancePtr;
  }

  /**
      Gets the string representation of a #GstDebugMessage. This function is used
    in debug handlers to extract the message.
    Returns:     the string representation of a #GstDebugMessage.
  */
  string get()
  {
    const(char)* _cretval;
    _cretval = gst_debug_message_get(cast(GstDebugMessage*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the id of the object that emitted this message. This function is used in
    debug handlers. Can be empty.
    Returns:     The emitter of a #GstDebugMessage.
  */
  string getId()
  {
    const(char)* _cretval;
    _cretval = gst_debug_message_get_id(cast(GstDebugMessage*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
