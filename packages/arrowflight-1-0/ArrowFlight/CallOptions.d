module ArrowFlight.CallOptions;

import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GObject.ObjectG;
import Gid.gid;

class CallOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_call_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GAFlightCallOptions* _cretval;
    _cretval = gaflight_call_options_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Add a header.
   * Params:
   *   name = A header name.
   *   value = A header value.
   */
  void addHeader(string name, string value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    gaflight_call_options_add_header(cast(GAFlightCallOptions*)cPtr, _name, _value);
  }

  /**
   * Clear all headers.
   */
  void clearHeaders()
  {
    gaflight_call_options_clear_headers(cast(GAFlightCallOptions*)cPtr);
  }

  /**
   * Iterates over all headers in the options.
   * Params:
   *   func = The user's callback function.
   */
  void foreachHeader(HeaderFunc func)
  {
    extern(C) void _funcCallback(const(char)* name, const(char)* value, void* userData)
    {
      auto _dlg = cast(HeaderFunc*)userData;
      string _name = name.fromCString(No.Free);
      string _value = value.fromCString(No.Free);

      (*_dlg)(_name, _value);
    }

    auto _func = cast(void*)&func;
    gaflight_call_options_foreach_header(cast(GAFlightCallOptions*)cPtr, &_funcCallback, _func);
  }
}
