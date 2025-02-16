module Arrow.Decimal64;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.Bytes;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class Decimal64 : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal64_get_type != &gidSymbolNotFound ? garrow_decimal64_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  static Decimal64 newInteger(long data)
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_new_integer(data);
    auto _retval = ObjectG.getDObject!Decimal64(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  static Decimal64 newString(string data)
  {
    GArrowDecimal64* _cretval;
    const(char)* _data = data.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_decimal64_new_string(_data, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Decimal64(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Computes the absolute value of the decimal destructively.
   */
  void abs()
  {
    garrow_decimal64_abs(cast(GArrowDecimal64*)cPtr);
  }

  Decimal64 copy()
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_copy(cast(GArrowDecimal64*)cPtr);
    auto _retval = ObjectG.getDObject!Decimal64(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  Decimal64 divide(Decimal64 right, out Decimal64 remainder)
  {
    GArrowDecimal64* _cretval;
    GArrowDecimal64* _remainder;
    GError *_err;
    _cretval = garrow_decimal64_divide(cast(GArrowDecimal64*)cPtr, right ? cast(GArrowDecimal64*)right.cPtr(No.Dup) : null, &_remainder, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Decimal64(cast(GArrowDecimal64*)_cretval, Yes.Take);
    remainder = new Decimal64(cast(void*)_remainder, Yes.Take);
    return _retval;
  }

  bool equal(Decimal64 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal64_equal(cast(GArrowDecimal64*)cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  bool greaterThan(Decimal64 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal64_greater_than(cast(GArrowDecimal64*)cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  bool greaterThanOrEqual(Decimal64 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal64_greater_than_or_equal(cast(GArrowDecimal64*)cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  bool lessThan(Decimal64 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal64_less_than(cast(GArrowDecimal64*)cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  bool lessThanOrEqual(Decimal64 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal64_less_than_or_equal(cast(GArrowDecimal64*)cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  Decimal64 minus(Decimal64 right)
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_minus(cast(GArrowDecimal64*)cPtr, right ? cast(GArrowDecimal64*)right.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!Decimal64(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  Decimal64 multiply(Decimal64 right)
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_multiply(cast(GArrowDecimal64*)cPtr, right ? cast(GArrowDecimal64*)right.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!Decimal64(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Negate the current value of the decimal destructively.
   */
  void negate()
  {
    garrow_decimal64_negate(cast(GArrowDecimal64*)cPtr);
  }

  bool notEqual(Decimal64 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal64_not_equal(cast(GArrowDecimal64*)cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  Decimal64 plus(Decimal64 right)
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_plus(cast(GArrowDecimal64*)cPtr, right ? cast(GArrowDecimal64*)right.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!Decimal64(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  Decimal64 rescale(int originalScale, int newScale)
  {
    GArrowDecimal64* _cretval;
    GError *_err;
    _cretval = garrow_decimal64_rescale(cast(GArrowDecimal64*)cPtr, originalScale, newScale, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Decimal64(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  Bytes toBytes()
  {
    GBytes* _cretval;
    _cretval = garrow_decimal64_to_bytes(cast(GArrowDecimal64*)cPtr);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  long toInteger()
  {
    long _retval;
    _retval = garrow_decimal64_to_integer(cast(GArrowDecimal64*)cPtr);
    return _retval;
  }

  string toString_()
  {
    char* _cretval;
    _cretval = garrow_decimal64_to_string(cast(GArrowDecimal64*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  string toStringScale(int scale)
  {
    char* _cretval;
    _cretval = garrow_decimal64_to_string_scale(cast(GArrowDecimal64*)cPtr, scale);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
