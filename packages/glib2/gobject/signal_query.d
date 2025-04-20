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
      throw new GidConstructException("Null instance pointer for gobject.signal_query.SignalQuery");

    cInstance = *cast(GSignalQuery*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `signalId` field.
      Returns: The signal id of the signal being queried, or 0 if the
       signal to be queried was unknown.
  */
  @property uint signalId()
  {
    return (cast(GSignalQuery*)cPtr).signalId;
  }

  /**
      Set `signalId` field.
      Params:
        propval = The signal id of the signal being queried, or 0 if the
         signal to be queried was unknown.
  */
  @property void signalId(uint propval)
  {
    (cast(GSignalQuery*)cPtr).signalId = propval;
  }

  /**
      Get `signalName` field.
      Returns: The signal name.
  */
  @property string signalName()
  {
    return cToD!(string)(cast(void*)(cast(GSignalQuery*)cPtr).signalName);
  }

  /**
      Set `signalName` field.
      Params:
        propval = The signal name.
  */
  @property void signalName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GSignalQuery*)cPtr).signalName);
    dToC(propval, cast(void*)&(cast(GSignalQuery*)cPtr).signalName);
  }

  /**
      Get `itype` field.
      Returns: The interface/instance type that this signal can be emitted for.
  */
  @property gobject.types.GType itype()
  {
    return (cast(GSignalQuery*)cPtr).itype;
  }

  /**
      Set `itype` field.
      Params:
        propval = The interface/instance type that this signal can be emitted for.
  */
  @property void itype(gobject.types.GType propval)
  {
    (cast(GSignalQuery*)cPtr).itype = propval;
  }

  /**
      Get `signalFlags` field.
      Returns: The signal flags as passed in to [gobject.global.signalNew].
  */
  @property gobject.types.SignalFlags signalFlags()
  {
    return cast(gobject.types.SignalFlags)(cast(GSignalQuery*)cPtr).signalFlags;
  }

  /**
      Set `signalFlags` field.
      Params:
        propval = The signal flags as passed in to [gobject.global.signalNew].
  */
  @property void signalFlags(gobject.types.SignalFlags propval)
  {
    (cast(GSignalQuery*)cPtr).signalFlags = cast(GSignalFlags)propval;
  }

  /**
      Get `returnType` field.
      Returns: The return type for user callbacks.
  */
  @property gobject.types.GType returnType()
  {
    return (cast(GSignalQuery*)cPtr).returnType;
  }

  /**
      Set `returnType` field.
      Params:
        propval = The return type for user callbacks.
  */
  @property void returnType(gobject.types.GType propval)
  {
    (cast(GSignalQuery*)cPtr).returnType = propval;
  }

  /**
      Get `nParams` field.
      Returns: The number of parameters that user callbacks take.
  */
  @property uint nParams()
  {
    return (cast(GSignalQuery*)cPtr).nParams;
  }

  /**
      Set `nParams` field.
      Params:
        propval = The number of parameters that user callbacks take.
  */
  @property void nParams(uint propval)
  {
    (cast(GSignalQuery*)cPtr).nParams = propval;
  }
}
