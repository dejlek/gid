module arrow.decimal64;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.object;

/** */
class Decimal64 : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal64_get_type != &gidSymbolNotFound ? garrow_decimal64_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  static arrow.decimal64.Decimal64 newInteger(long data)
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_new_integer(data);
    auto _retval = ObjectG.getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static arrow.decimal64.Decimal64 newString(string data)
  {
    GArrowDecimal64* _cretval;
    const(char)* _data = data.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_decimal64_new_string(_data, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Computes the absolute value of the decimal destructively.
  */
  void abs()
  {
    garrow_decimal64_abs(cast(GArrowDecimal64*)cPtr);
  }

  /** */
  arrow.decimal64.Decimal64 copy()
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_copy(cast(GArrowDecimal64*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.decimal64.Decimal64 divide(arrow.decimal64.Decimal64 right, out arrow.decimal64.Decimal64 remainder)
  {
    GArrowDecimal64* _cretval;
    GArrowDecimal64* _remainder;
    GError *_err;
    _cretval = garrow_decimal64_divide(cast(GArrowDecimal64*)cPtr, right ? cast(GArrowDecimal64*)right.cPtr(No.Dup) : null, &_remainder, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    remainder = new arrow.decimal64.Decimal64(cast(void*)_remainder, Yes.Take);
    return _retval;
  }

  /** */
  bool equal(arrow.decimal64.Decimal64 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal64_equal(cast(GArrowDecimal64*)cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool greaterThan(arrow.decimal64.Decimal64 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal64_greater_than(cast(GArrowDecimal64*)cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool greaterThanOrEqual(arrow.decimal64.Decimal64 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal64_greater_than_or_equal(cast(GArrowDecimal64*)cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool lessThan(arrow.decimal64.Decimal64 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal64_less_than(cast(GArrowDecimal64*)cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool lessThanOrEqual(arrow.decimal64.Decimal64 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal64_less_than_or_equal(cast(GArrowDecimal64*)cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.decimal64.Decimal64 minus(arrow.decimal64.Decimal64 right)
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_minus(cast(GArrowDecimal64*)cPtr, right ? cast(GArrowDecimal64*)right.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.decimal64.Decimal64 multiply(arrow.decimal64.Decimal64 right)
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_multiply(cast(GArrowDecimal64*)cPtr, right ? cast(GArrowDecimal64*)right.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Negate the current value of the decimal destructively.
  */
  void negate()
  {
    garrow_decimal64_negate(cast(GArrowDecimal64*)cPtr);
  }

  /** */
  bool notEqual(arrow.decimal64.Decimal64 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal64_not_equal(cast(GArrowDecimal64*)cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.decimal64.Decimal64 plus(arrow.decimal64.Decimal64 right)
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_plus(cast(GArrowDecimal64*)cPtr, right ? cast(GArrowDecimal64*)right.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.decimal64.Decimal64 rescale(int originalScale, int newScale)
  {
    GArrowDecimal64* _cretval;
    GError *_err;
    _cretval = garrow_decimal64_rescale(cast(GArrowDecimal64*)cPtr, originalScale, newScale, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  glib.bytes.Bytes toBytes()
  {
    GBytes* _cretval;
    _cretval = garrow_decimal64_to_bytes(cast(GArrowDecimal64*)cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  long toInteger()
  {
    long _retval;
    _retval = garrow_decimal64_to_integer(cast(GArrowDecimal64*)cPtr);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = garrow_decimal64_to_string(cast(GArrowDecimal64*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  string toStringScale(int scale)
  {
    char* _cretval;
    _cretval = garrow_decimal64_to_string_scale(cast(GArrowDecimal64*)cPtr, scale);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
