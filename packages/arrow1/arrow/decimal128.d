/// Module for [Decimal128] class
module arrow.decimal128;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.object;

/** */
class Decimal128 : gobject.object.ObjectG
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal128_get_type != &gidSymbolNotFound ? garrow_decimal128_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override Decimal128 self()
  {
    return this;
  }

  /** */
  static arrow.decimal128.Decimal128 newInteger(long data)
  {
    GArrowDecimal128* _cretval;
    _cretval = garrow_decimal128_new_integer(data);
    auto _retval = ObjectG.getDObject!(arrow.decimal128.Decimal128)(cast(GArrowDecimal128*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static arrow.decimal128.Decimal128 newString(string data)
  {
    GArrowDecimal128* _cretval;
    const(char)* _data = data.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_decimal128_new_string(_data, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.decimal128.Decimal128)(cast(GArrowDecimal128*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Computes the absolute value of the decimal destructively.
  */
  void abs()
  {
    garrow_decimal128_abs(cast(GArrowDecimal128*)cPtr);
  }

  /** */
  arrow.decimal128.Decimal128 copy()
  {
    GArrowDecimal128* _cretval;
    _cretval = garrow_decimal128_copy(cast(GArrowDecimal128*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.decimal128.Decimal128)(cast(GArrowDecimal128*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.decimal128.Decimal128 divide(arrow.decimal128.Decimal128 right, out arrow.decimal128.Decimal128 remainder)
  {
    GArrowDecimal128* _cretval;
    GArrowDecimal128* _remainder;
    GError *_err;
    _cretval = garrow_decimal128_divide(cast(GArrowDecimal128*)cPtr, right ? cast(GArrowDecimal128*)right.cPtr(No.Dup) : null, &_remainder, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.decimal128.Decimal128)(cast(GArrowDecimal128*)_cretval, Yes.Take);
    remainder = new arrow.decimal128.Decimal128(cast(void*)_remainder, Yes.Take);
    return _retval;
  }

  /** */
  bool equal(arrow.decimal128.Decimal128 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal128_equal(cast(GArrowDecimal128*)cPtr, otherDecimal ? cast(GArrowDecimal128*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool greaterThan(arrow.decimal128.Decimal128 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal128_greater_than(cast(GArrowDecimal128*)cPtr, otherDecimal ? cast(GArrowDecimal128*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool greaterThanOrEqual(arrow.decimal128.Decimal128 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal128_greater_than_or_equal(cast(GArrowDecimal128*)cPtr, otherDecimal ? cast(GArrowDecimal128*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool lessThan(arrow.decimal128.Decimal128 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal128_less_than(cast(GArrowDecimal128*)cPtr, otherDecimal ? cast(GArrowDecimal128*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool lessThanOrEqual(arrow.decimal128.Decimal128 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal128_less_than_or_equal(cast(GArrowDecimal128*)cPtr, otherDecimal ? cast(GArrowDecimal128*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.decimal128.Decimal128 minus(arrow.decimal128.Decimal128 right)
  {
    GArrowDecimal128* _cretval;
    _cretval = garrow_decimal128_minus(cast(GArrowDecimal128*)cPtr, right ? cast(GArrowDecimal128*)right.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(arrow.decimal128.Decimal128)(cast(GArrowDecimal128*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.decimal128.Decimal128 multiply(arrow.decimal128.Decimal128 right)
  {
    GArrowDecimal128* _cretval;
    _cretval = garrow_decimal128_multiply(cast(GArrowDecimal128*)cPtr, right ? cast(GArrowDecimal128*)right.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(arrow.decimal128.Decimal128)(cast(GArrowDecimal128*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Negate the current value of the decimal destructively.
  */
  void negate()
  {
    garrow_decimal128_negate(cast(GArrowDecimal128*)cPtr);
  }

  /** */
  bool notEqual(arrow.decimal128.Decimal128 otherDecimal)
  {
    bool _retval;
    _retval = garrow_decimal128_not_equal(cast(GArrowDecimal128*)cPtr, otherDecimal ? cast(GArrowDecimal128*)otherDecimal.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.decimal128.Decimal128 plus(arrow.decimal128.Decimal128 right)
  {
    GArrowDecimal128* _cretval;
    _cretval = garrow_decimal128_plus(cast(GArrowDecimal128*)cPtr, right ? cast(GArrowDecimal128*)right.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(arrow.decimal128.Decimal128)(cast(GArrowDecimal128*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.decimal128.Decimal128 rescale(int originalScale, int newScale)
  {
    GArrowDecimal128* _cretval;
    GError *_err;
    _cretval = garrow_decimal128_rescale(cast(GArrowDecimal128*)cPtr, originalScale, newScale, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.decimal128.Decimal128)(cast(GArrowDecimal128*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  glib.bytes.Bytes toBytes()
  {
    GBytes* _cretval;
    _cretval = garrow_decimal128_to_bytes(cast(GArrowDecimal128*)cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  long toInteger()
  {
    long _retval;
    _retval = garrow_decimal128_to_integer(cast(GArrowDecimal128*)cPtr);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = garrow_decimal128_to_string(cast(GArrowDecimal128*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  string toStringScale(int scale)
  {
    char* _cretval;
    _cretval = garrow_decimal128_to_string_scale(cast(GArrowDecimal128*)cPtr, scale);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
