module arrow.read_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.global;
import gobject.object;

class ReadOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_read_options_get_type != &gidSymbolNotFound ? garrow_read_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowReadOptions* _cretval;
    _cretval = garrow_read_options_new();
    this(_cretval, Yes.Take);
  }

  int[] getIncludedFields()
  {
    int* _cretval;
    size_t _cretlength;
    _cretval = garrow_read_options_get_included_fields(cast(GArrowReadOptions*)cPtr, &_cretlength);
    int[] _retval;

    if (_cretval)
    {
      _retval = cast(int[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  void setIncludedFields(int[] fields)
  {
    size_t _nFields;
    if (fields)
      _nFields = cast(size_t)fields.length;

    auto _fields = cast(int*)fields.ptr;
    garrow_read_options_set_included_fields(cast(GArrowReadOptions*)cPtr, _fields, _nFields);
  }
}
