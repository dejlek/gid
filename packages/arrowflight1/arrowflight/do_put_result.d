/// Module for [DoPutResult] class
module arrowflight.do_put_result;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.metadata_reader;
import arrowflight.stream_writer;
import arrowflight.types;
import gid.gid;
import gobject.object;

/** */
class DoPutResult : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_do_put_result_get_type != &gidSymbolNotFound ? gaflight_do_put_result_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DoPutResult self()
  {
    return this;
  }

  /**
      Get `reader` property.
      Returns: A reader for application metadata from the server.
  */
  @property arrowflight.metadata_reader.MetadataReader reader()
  {
    return gobject.object.ObjectWrap.getProperty!(arrowflight.metadata_reader.MetadataReader)("reader");
  }

  /**
      Get `writer` property.
      Returns: A writer to write record batches to.
  */
  @property arrowflight.stream_writer.StreamWriter writer()
  {
    return gobject.object.ObjectWrap.getProperty!(arrowflight.stream_writer.StreamWriter)("writer");
  }
}
