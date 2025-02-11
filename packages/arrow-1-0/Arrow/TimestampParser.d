module Arrow.TimestampParser;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class TimestampParser : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_timestamp_parser_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  string getKind()
  {
    const(char)* _cretval;
    _cretval = garrow_timestamp_parser_get_kind(cast(GArrowTimestampParser*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }
}
