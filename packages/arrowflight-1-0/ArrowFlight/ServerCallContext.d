module ArrowFlight.ServerCallContext;

import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GObject.ObjectG;
import Gid.gid;

class ServerCallContext : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_server_call_context_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Iterates over all incoming headers.
   * Params:
   *   func = The user's callback function.
   */
  void foreachIncomingHeader(HeaderFunc func)
  {
    extern(C) void _funcCallback(const(char)* name, const(char)* value, void* userData)
    {
      auto _dlg = cast(HeaderFunc*)userData;
      string _name = name.fromCString(No.Free);
      string _value = value.fromCString(No.Free);

      (*_dlg)(_name, _value);
    }

    auto _func = cast(void*)&func;
    gaflight_server_call_context_foreach_incoming_header(cast(GAFlightServerCallContext*)cPtr, &_funcCallback, _func);
  }
}
