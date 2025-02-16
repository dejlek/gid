module ArrowFlight.DataStream;

import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GObject.ObjectG;
import Gid.gid;

class DataStream : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_data_stream_get_type != &gidSymbolNotFound ? gaflight_data_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
