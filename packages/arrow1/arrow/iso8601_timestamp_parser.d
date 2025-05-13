/// Module for [ISO8601TimestampParser] class
module arrow.iso8601_timestamp_parser;

import arrow.c.functions;
import arrow.c.types;
import arrow.timestamp_parser;
import arrow.types;
import gid.gid;

/** */
class ISO8601TimestampParser : arrow.timestamp_parser.TimestampParser
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
    return cast(void function())garrow_iso8601_timestamp_parser_get_type != &gidSymbolNotFound ? garrow_iso8601_timestamp_parser_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ISO8601TimestampParser self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowISO8601TimestampParser* _cretval;
    _cretval = garrow_iso8601_timestamp_parser_new();
    this(_cretval, Yes.Take);
  }
}
