/// Module for [TimestampParser] class
module arrow.timestamp_parser;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class TimestampParser : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_timestamp_parser_get_type != &gidSymbolNotFound ? garrow_timestamp_parser_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TimestampParser self()
  {
    return this;
  }

  /** */
  string getKind()
  {
    const(char)* _cretval;
    _cretval = garrow_timestamp_parser_get_kind(cast(GArrowTimestampParser*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
