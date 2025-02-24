module arrow.decimal256;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.object;

class Decimal256 : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal256_get_type != &gidSymbolNotFound ? garrow_decimal256_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  static Decimal256 newInteger(long data)
  {
    GArrowDecimal256* _cretval;
    _cretval = garrow_decimal256_new_integer(data);
    auto _retval = ObjectG.getDObject!Decimal256(cast(GArrowDecimal256*)_cretval, Yes.Take);
    return _retval;
  }

  static Decimal256 newString(string data)
  {
    GArrowDecimal256* _cretval;
    const(char)* _data = data.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_decimal256_new_string(_data, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Decimal256(cast(GArrowDecimal256*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Computes the absolute value of the decimal destructively.
   */
  void abs()
  {
    garrow_decimal256_abs(cast(GArrowDecimal256*)cPtr);
  }

  Decimal256 copy()
  {
    GArrowDecimal256* _cretval;
    _cretval = garrow_decimal256_copy(cast(GArrowDecimal256*)cPtr);
    auto _retval = ObjectG.getDObject!Decimal256(cast(GArrowDecimal256*)_cretval, Yes.Take);
    return _retval;
  }

  Decimal256 divide(Decimal256 right, out Decimal256 remainder)
  {
    GArrowDecimal256* _cretval;
    GArrowDecimal256* _remainder;
    GError *_err;
    _cretval = garrow_decimal256_divide(cast(GArrowDecimal256*)cPtr, right ? cast(GArrowDecimal256*)right.cPtr(No.Dup) : null, &_remainder, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Decimal256(cast(GArrowDecimal256*)_cretval, Yes.Take);
    remainder = new Decimal256(cast(void*)_remainder, Yes.Take);
    return _retval;
  }

  bool equal(Decimal256 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal256_equal(cast(GArrowDecimal256*)cPtr, otherDecimal ? cast(GArrowDecimal256*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  bool greaterThan(Decimal256 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal256_greater_than(cast(GArrowDecimal256*)cPtr, otherDecimal ? cast(GArrowDecimal256*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  bool greaterThanOrEqual(Decimal256 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal256_greater_than_or_equal(cast(GArrowDecimal256*)cPtr, otherDecimal ? cast(GArrowDecimal256*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  bool lessThan(Decimal256 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal256_less_than(cast(GArrowDecimal256*)cPtr, otherDecimal ? cast(GArrowDecimal256*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  bool lessThanOrEqual(Decimal256 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal256_less_than_or_equal(cast(GArrowDecimal256*)cPtr, otherDecimal ? cast(GArrowDecimal256*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  Decimal256 multiply(Decimal256 right)
  {
    GArrowDecimal256* _cretval;
    _cretval = garrow_decimal256_multiply(cast(GArrowDecimal256*)cPtr, right ? cast(GArrowDecimal256*)right.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!Decimal256(cast(GArrowDecimal256*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Negate the current value of the decimal destructively.
   */
  void negate()
  {
    garrow_decimal256_negate(cast(GArrowDecimal256*)cPtr);
  }

  bool notEqual(Decimal256 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal256_not_equal(cast(GArrowDecimal256*)cPtr, otherDecimal ? cast(GArrowDecimal256*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  Decimal256 plus(Decimal256 right)
  {
    GArrowDecimal256* _cretval;
    _cretval = garrow_decimal256_plus(cast(GArrowDecimal256*)cPtr, right ? cast(GArrowDecimal256*)right.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!Decimal256(cast(GArrowDecimal256*)_cretval, Yes.Take);
    return _retval;
  }

  Decimal256 rescale(int originalScale, int newScale)
  {
    GArrowDecimal256* _cretval;
    GError *_err;
    _cretval = garrow_decimal256_rescale(cast(GArrowDecimal256*)cPtr, originalScale, newScale, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Decimal256(cast(GArrowDecimal256*)_cretval, Yes.Take);
    return _retval;
  }

  Bytes toBytes()
  {
    GBytes* _cretval;
    _cretval = garrow_decimal256_to_bytes(cast(GArrowDecimal256*)cPtr);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  string toString_()
  {
    char* _cretval;
    _cretval = garrow_decimal256_to_string(cast(GArrowDecimal256*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  string toStringScale(int scale)
  {
    char* _cretval;
    _cretval = garrow_decimal256_to_string_scale(cast(GArrowDecimal256*)cPtr, scale);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
