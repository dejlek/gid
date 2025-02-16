module Arrow.Decimal128;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.Bytes;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class Decimal128 : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal128_get_type != &gidSymbolNotFound ? garrow_decimal128_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  static Decimal128 newInteger(long data)
  {
    GArrowDecimal128* _cretval;
    _cretval = garrow_decimal128_new_integer(data);
    auto _retval = ObjectG.getDObject!Decimal128(cast(GArrowDecimal128*)_cretval, Yes.Take);
    return _retval;
  }

  static Decimal128 newString(string data)
  {
    GArrowDecimal128* _cretval;
    const(char)* _data = data.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_decimal128_new_string(_data, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Decimal128(cast(GArrowDecimal128*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Computes the absolute value of the decimal destructively.
   */
  void abs()
  {
    garrow_decimal128_abs(cast(GArrowDecimal128*)cPtr);
  }

  Decimal128 copy()
  {
    GArrowDecimal128* _cretval;
    _cretval = garrow_decimal128_copy(cast(GArrowDecimal128*)cPtr);
    auto _retval = ObjectG.getDObject!Decimal128(cast(GArrowDecimal128*)_cretval, Yes.Take);
    return _retval;
  }

  Decimal128 divide(Decimal128 right, out Decimal128 remainder)
  {
    GArrowDecimal128* _cretval;
    GArrowDecimal128* _remainder;
    GError *_err;
    _cretval = garrow_decimal128_divide(cast(GArrowDecimal128*)cPtr, right ? cast(GArrowDecimal128*)right.cPtr(No.Dup) : null, &_remainder, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Decimal128(cast(GArrowDecimal128*)_cretval, Yes.Take);
    remainder = new Decimal128(cast(void*)_remainder, Yes.Take);
    return _retval;
  }

  bool equal(Decimal128 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal128_equal(cast(GArrowDecimal128*)cPtr, otherDecimal ? cast(GArrowDecimal128*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  bool greaterThan(Decimal128 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal128_greater_than(cast(GArrowDecimal128*)cPtr, otherDecimal ? cast(GArrowDecimal128*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  bool greaterThanOrEqual(Decimal128 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal128_greater_than_or_equal(cast(GArrowDecimal128*)cPtr, otherDecimal ? cast(GArrowDecimal128*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  bool lessThan(Decimal128 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal128_less_than(cast(GArrowDecimal128*)cPtr, otherDecimal ? cast(GArrowDecimal128*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  bool lessThanOrEqual(Decimal128 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal128_less_than_or_equal(cast(GArrowDecimal128*)cPtr, otherDecimal ? cast(GArrowDecimal128*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  Decimal128 minus(Decimal128 right)
  {
    GArrowDecimal128* _cretval;
    _cretval = garrow_decimal128_minus(cast(GArrowDecimal128*)cPtr, right ? cast(GArrowDecimal128*)right.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!Decimal128(cast(GArrowDecimal128*)_cretval, Yes.Take);
    return _retval;
  }

  Decimal128 multiply(Decimal128 right)
  {
    GArrowDecimal128* _cretval;
    _cretval = garrow_decimal128_multiply(cast(GArrowDecimal128*)cPtr, right ? cast(GArrowDecimal128*)right.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!Decimal128(cast(GArrowDecimal128*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Negate the current value of the decimal destructively.
   */
  void negate()
  {
    garrow_decimal128_negate(cast(GArrowDecimal128*)cPtr);
  }

  bool notEqual(Decimal128 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal128_not_equal(cast(GArrowDecimal128*)cPtr, otherDecimal ? cast(GArrowDecimal128*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  Decimal128 plus(Decimal128 right)
  {
    GArrowDecimal128* _cretval;
    _cretval = garrow_decimal128_plus(cast(GArrowDecimal128*)cPtr, right ? cast(GArrowDecimal128*)right.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!Decimal128(cast(GArrowDecimal128*)_cretval, Yes.Take);
    return _retval;
  }

  Decimal128 rescale(int originalScale, int newScale)
  {
    GArrowDecimal128* _cretval;
    GError *_err;
    _cretval = garrow_decimal128_rescale(cast(GArrowDecimal128*)cPtr, originalScale, newScale, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Decimal128(cast(GArrowDecimal128*)_cretval, Yes.Take);
    return _retval;
  }

  Bytes toBytes()
  {
    GBytes* _cretval;
    _cretval = garrow_decimal128_to_bytes(cast(GArrowDecimal128*)cPtr);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  long toInteger()
  {
    long _retval;
    _retval = garrow_decimal128_to_integer(cast(GArrowDecimal128*)cPtr);
    return _retval;
  }

  string toString_()
  {
    char* _cretval;
    _cretval = garrow_decimal128_to_string(cast(GArrowDecimal128*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  string toStringScale(int scale)
  {
    char* _cretval;
    _cretval = garrow_decimal128_to_string_scale(cast(GArrowDecimal128*)cPtr, scale);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
