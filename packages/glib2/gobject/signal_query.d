/// Module for [SignalQuery] class
module gobject.signal_query;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;

/**
    A structure holding in-depth information for a specific signal.
    
    See also: [gobject.global.signalQuery]
*/
class SignalQuery
{
  GSignalQuery cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.SignalQuery");

    cInstance = *cast(GSignalQuery*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property uint signalId()
  {
    return (cast(GSignalQuery*)cPtr).signalId;
  }

  @property void signalId(uint propval)
  {
    (cast(GSignalQuery*)cPtr).signalId = propval;
  }

  @property string signalName()
  {
    return cToD!(string)(cast(void*)(cast(GSignalQuery*)cPtr).signalName);
  }

  @property void signalName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GSignalQuery*)cPtr).signalName);
    dToC(propval, cast(void*)&(cast(GSignalQuery*)cPtr).signalName);
  }

  @property gobject.types.GType itype()
  {
    return (cast(GSignalQuery*)cPtr).itype;
  }

  @property void itype(gobject.types.GType propval)
  {
    (cast(GSignalQuery*)cPtr).itype = propval;
  }

  @property gobject.types.SignalFlags signalFlags()
  {
    return cast(gobject.types.SignalFlags)(cast(GSignalQuery*)cPtr).signalFlags;
  }

  @property void signalFlags(gobject.types.SignalFlags propval)
  {
    (cast(GSignalQuery*)cPtr).signalFlags = cast(GSignalFlags)propval;
  }

  @property gobject.types.GType returnType()
  {
    return (cast(GSignalQuery*)cPtr).returnType;
  }

  @property void returnType(gobject.types.GType propval)
  {
    (cast(GSignalQuery*)cPtr).returnType = propval;
  }

  @property uint nParams()
  {
    return (cast(GSignalQuery*)cPtr).nParams;
  }

  @property void nParams(uint propval)
  {
    (cast(GSignalQuery*)cPtr).nParams = propval;
  }
}
