module arrow.scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.cast_options;
import arrow.data_type;
import arrow.equal_options;
import arrow.types;
import gid.global;
import glib.error;
import gobject.object;

class Scalar : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_scalar_get_type != &gidSymbolNotFound ? garrow_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  static Scalar parse(DataType dataType, ubyte[] data)
  {
    GArrowScalar* _cretval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    GError *_err;
    _cretval = garrow_scalar_parse(dataType ? cast(GArrowDataType*)dataType.cPtr(No.Dup) : null, _data, _size, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Scalar(cast(GArrowScalar*)_cretval, Yes.Take);
    return _retval;
  }

  Scalar cast_(DataType dataType, CastOptions options)
  {
    GArrowScalar* _cretval;
    GError *_err;
    _cretval = garrow_scalar_cast(cast(GArrowScalar*)cPtr, dataType ? cast(GArrowDataType*)dataType.cPtr(No.Dup) : null, options ? cast(GArrowCastOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Scalar(cast(GArrowScalar*)_cretval, Yes.Take);
    return _retval;
  }

  bool equal(Scalar otherScalar)
  {
    bool _retval;
    _retval = garrow_scalar_equal(cast(GArrowScalar*)cPtr, otherScalar ? cast(GArrowScalar*)otherScalar.cPtr(No.Dup) : null);
    return _retval;
  }

  bool equalOptions(Scalar otherScalar, EqualOptions options)
  {
    bool _retval;
    _retval = garrow_scalar_equal_options(cast(GArrowScalar*)cPtr, otherScalar ? cast(GArrowScalar*)otherScalar.cPtr(No.Dup) : null, options ? cast(GArrowEqualOptions*)options.cPtr(No.Dup) : null);
    return _retval;
  }

  DataType getDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_scalar_get_data_type(cast(GArrowScalar*)cPtr);
    auto _retval = ObjectG.getDObject!DataType(cast(GArrowDataType*)_cretval, No.Take);
    return _retval;
  }

  bool isValid()
  {
    bool _retval;
    _retval = garrow_scalar_is_valid(cast(GArrowScalar*)cPtr);
    return _retval;
  }

  string toString_()
  {
    char* _cretval;
    _cretval = garrow_scalar_to_string(cast(GArrowScalar*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
