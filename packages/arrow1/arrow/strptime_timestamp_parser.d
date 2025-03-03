module arrow.strptime_timestamp_parser;

import arrow.c.functions;
import arrow.c.types;
import arrow.timestamp_parser;
import arrow.types;
import gid.gid;

class StrptimeTimestampParser : arrow.timestamp_parser.TimestampParser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_strptime_timestamp_parser_get_type != &gidSymbolNotFound ? garrow_strptime_timestamp_parser_get_type() : cast(GType)0;
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
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
