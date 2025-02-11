module Arrow.StrptimeTimestampParser;

import Arrow.TimestampParser;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class StrptimeTimestampParser : TimestampParser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_strptime_timestamp_parser_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(string format)
  {
    GArrowStrptimeTimestampParser* _cretval;
    const(char)* _format = format.toCString(No.Alloc);
    _cretval = garrow_strptime_timestamp_parser_new(_format);
    this(_cretval, Yes.Take);
  }

  string getFormat()
  {
    const(char)* _cretval;
    _cretval = garrow_strptime_timestamp_parser_get_format(cast(GArrowStrptimeTimestampParser*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }
}
