module Arrow.ArrayBuilder;

import Arrow.Array;
import Arrow.DataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class ArrayBuilder : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_array_builder_get_type != &gidSymbolNotFound ? garrow_array_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  bool appendEmptyValue()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_array_builder_append_empty_value(cast(GArrowArrayBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Append multiple empty values at once. It's more efficient than multiple
   * [Arrow.ArrayBuilder.appendEmptyValue] calls.
   * Params:
   *   n = The number of null values to be appended.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool appendEmptyValues(long n)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_array_builder_append_empty_values(cast(GArrowArrayBuilder*)cPtr, n, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool appendNull()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_array_builder_append_null(cast(GArrowArrayBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Append multiple nulls at once. It's more efficient than multiple
   * [Arrow.ArrayBuilder.appendNull] calls.
   * Params:
   *   n = The number of null values to be appended.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool appendNulls(long n)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_array_builder_append_nulls(cast(GArrowArrayBuilder*)cPtr, n, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  Array finish()
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_array_builder_finish(cast(GArrowArrayBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Array(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  long getCapacity()
  {
    long _retval;
    _retval = garrow_array_builder_get_capacity(cast(GArrowArrayBuilder*)cPtr);
    return _retval;
  }

  ArrayBuilder getChild(int i)
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_array_builder_get_child(cast(GArrowArrayBuilder*)cPtr, i);
    auto _retval = ObjectG.getDObject!ArrayBuilder(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }

  ArrayBuilder[] getChildren()
  {
    GList* _cretval;
    _cretval = garrow_array_builder_get_children(cast(GArrowArrayBuilder*)cPtr);
    auto _retval = gListToD!(ArrayBuilder, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  long getLength()
  {
    long _retval;
    _retval = garrow_array_builder_get_length(cast(GArrowArrayBuilder*)cPtr);
    return _retval;
  }

  long getNNulls()
  {
    long _retval;
    _retval = garrow_array_builder_get_n_nulls(cast(GArrowArrayBuilder*)cPtr);
    return _retval;
  }

  DataType getValueDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_array_builder_get_value_data_type(cast(GArrowArrayBuilder*)cPtr);
    auto _retval = ObjectG.getDObject!DataType(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  Type getValueType()
  {
    GArrowType _cretval;
    _cretval = garrow_array_builder_get_value_type(cast(GArrowArrayBuilder*)cPtr);
    Type _retval = cast(Type)_cretval;
    return _retval;
  }

  bool reserve(long additionalCapacity)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_array_builder_reserve(cast(GArrowArrayBuilder*)cPtr, additionalCapacity, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  void reset()
  {
    garrow_array_builder_reset(cast(GArrowArrayBuilder*)cPtr);
  }

  bool resize(long capacity)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_array_builder_resize(cast(GArrowArrayBuilder*)cPtr, capacity, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
