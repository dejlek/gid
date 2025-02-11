module Arrow.ISO8601TimestampParser;

import Arrow.TimestampParser;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ISO8601TimestampParser : TimestampParser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_iso8601_timestamp_parser_get_type();
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
