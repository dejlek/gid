module ArrowFlight.ServerClass;

import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GObject.ObjectClass;
import Gid.gid;

class ServerClass
{
  GAFlightServerClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowFlight.ServerClass");

    cInstance = *cast(GAFlightServerClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GAFlightServerClass*)cPtr).parentClass);
  }

  alias ListFlightsFuncType = extern(C) GList* function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightCriteria* criteria, GError** _err);

  @property ListFlightsFuncType listFlights()
  {
    return (cast(GAFlightServerClass*)cPtr).listFlights;
  }

  alias GetFlightInfoFuncType = extern(C) GAFlightInfo* function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightDescriptor* request, GError** _err);

  @property GetFlightInfoFuncType getFlightInfo()
  {
    return (cast(GAFlightServerClass*)cPtr).getFlightInfo;
  }

  alias DoGetFuncType = extern(C) GAFlightDataStream* function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightTicket* ticket, GError** _err);

  @property DoGetFuncType doGet()
  {
    return (cast(GAFlightServerClass*)cPtr).doGet;
  }

  alias DoPutFuncType = extern(C) bool function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightMessageReader* reader, GAFlightMetadataWriter* writer, GError** _err);

  @property DoPutFuncType doPut()
  {
    return (cast(GAFlightServerClass*)cPtr).doPut;
  }
}
