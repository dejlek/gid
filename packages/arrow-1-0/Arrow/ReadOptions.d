module Arrow.ReadOptions;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class ReadOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_read_options_get_type();
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
