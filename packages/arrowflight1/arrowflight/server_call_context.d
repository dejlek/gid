module arrowflight.server_call_context;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import gobject.object;

/** */
class ServerCallContext : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_server_call_context_get_type != &gidSymbolNotFound ? gaflight_server_call_context_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
      Iterates over all incoming headers.
    Params:
      func =       The user's callback function.
  */
  void foreachIncomingHeader(arrowflight.types.HeaderFunc func)
  {
    extern(C) void _funcCallback(const(char)* name, const(char)* value, void* userData)
    {
      auto _dlg = cast(arrowflight.types.HeaderFunc*)userData;
      string _name = name.fromCString(No.Free);
      string _value = value.fromCString(No.Free);

      (*_dlg)(_name, _value);
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    gaflight_server_call_context_foreach_incoming_header(cast(GAFlightServerCallContext*)cPtr, _funcCB, _func);
  }
}
