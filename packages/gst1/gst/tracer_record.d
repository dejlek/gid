module gst.tracer_record;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.object;
import gst.types;

/**
    Tracing modules will create instances of this class to announce the data they
  will log and create a log formatter.
*/
class TracerRecord : gst.object.ObjectGst
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_tracer_record_get_type != &gidSymbolNotFound ? gst_tracer_record_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }
}
