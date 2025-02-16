module Arrow.ChunkedArrayDatum;

import Arrow.ChunkedArray;
import Arrow.Datum;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ChunkedArrayDatum : Datum
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_chunked_array_datum_get_type != &gidSymbolNotFound ? garrow_chunked_array_datum_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(ChunkedArray value)
  {
    GArrowChunkedArrayDatum* _cretval;
    _cretval = garrow_chunked_array_datum_new(value ? cast(GArrowChunkedArray*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
