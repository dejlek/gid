module ArrowFlight.ServerCustomAuthHandlerClass;

import ArrowFlight.ServerAuthHandlerClass;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import Gid.gid;

class ServerCustomAuthHandlerClass
{
  GAFlightServerCustomAuthHandlerClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowFlight.ServerCustomAuthHandlerClass");

    cInstance = *cast(GAFlightServerCustomAuthHandlerClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ServerAuthHandlerClass parentClass()
  {
    return new ServerAuthHandlerClass(cast(GAFlightServerAuthHandlerClass*)&(cast(GAFlightServerCustomAuthHandlerClass*)cPtr).parentClass);
  }

  alias AuthenticateFuncType = extern(C) void function(GAFlightServerCustomAuthHandler* handler, GAFlightServerCallContext* context, GAFlightServerAuthSender* sender, GAFlightServerAuthReader* reader, GError** _err);

  @property AuthenticateFuncType authenticate()
  {
    return (cast(GAFlightServerCustomAuthHandlerClass*)cPtr).authenticate;
  }

  alias IsValidFuncType = extern(C) GBytes* function(GAFlightServerCustomAuthHandler* handler, GAFlightServerCallContext* context, GBytes* token, GError** _err);

  @property IsValidFuncType isValid()
  {
    return (cast(GAFlightServerCustomAuthHandlerClass*)cPtr).isValid;
  }
}
