module arrow.iso8601_timestamp_parser;

import arrow.c.functions;
import arrow.c.types;
import arrow.timestamp_parser;
import arrow.types;
import gid.gid;

class ISO8601TimestampParser : TimestampParser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_iso8601_timestamp_parser_get_type != &gidSymbolNotFound ? garrow_iso8601_timestamp_parser_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowISO8601TimestampParser* _cretval;
    _cretval = garrow_iso8601_timestamp_parser_new();
    this(_cretval, Yes.Take);
  }
}
