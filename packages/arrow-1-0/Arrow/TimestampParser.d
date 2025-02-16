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
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_timestamp_parser_get_type != &gidSymbolNotFound ? garrow_timestamp_parser_get_type() : cast(GType)0;
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
