module arrow.boolean_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.primitive_array;
import arrow.types;
import gid.global;
import glib.error;
import gobject.object;

class BooleanArray : PrimitiveArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_boolean_array_get_type != &gidSymbolNotFound ? garrow_boolean_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long length, Buffer data, Buffer nullBitmap, long nNulls)
  {
    GArrowBooleanArray* _cretval;
    _cretval = garrow_boolean_array_new(length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  BooleanArray and(BooleanArray right)
  {
    GArrowBooleanArray* _cretval;
    GError *_err;
    _cretval = garrow_boolean_array_and(cast(GArrowBooleanArray*)cPtr, right ? cast(GArrowBooleanArray*)right.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!BooleanArray(cast(GArrowBooleanArray*)_cretval, Yes.Take);
    return _retval;
  }

  bool getValue(long i)
  {
    bool _retval;
    _retval = garrow_boolean_array_get_value(cast(GArrowBooleanArray*)cPtr, i);
    return _retval;
  }

  bool[] getValues()
  {
    bool* _cretval;
    long _cretlength;
    _cretval = garrow_boolean_array_get_values(cast(GArrowBooleanArray*)cPtr, &_cretlength);
    bool[] _retval;

    if (_cretval)
    {
      _retval = cast(bool[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  BooleanArray invert()
  {
    GArrowBooleanArray* _cretval;
    GError *_err;
    _cretval = garrow_boolean_array_invert(cast(GArrowBooleanArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!BooleanArray(cast(GArrowBooleanArray*)_cretval, Yes.Take);
    return _retval;
  }

  BooleanArray or(BooleanArray right)
  {
    GArrowBooleanArray* _cretval;
    GError *_err;
    _cretval = garrow_boolean_array_or(cast(GArrowBooleanArray*)cPtr, right ? cast(GArrowBooleanArray*)right.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!BooleanArray(cast(GArrowBooleanArray*)_cretval, Yes.Take);
    return _retval;
  }

  BooleanArray xor(BooleanArray right)
  {
    GArrowBooleanArray* _cretval;
    GError *_err;
    _cretval = garrow_boolean_array_xor(cast(GArrowBooleanArray*)cPtr, right ? cast(GArrowBooleanArray*)right.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!BooleanArray(cast(GArrowBooleanArray*)_cretval, Yes.Take);
    return _retval;
  }
}
