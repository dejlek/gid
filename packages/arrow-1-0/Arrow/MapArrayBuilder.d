module Arrow.MapArrayBuilder;

import Arrow.ArrayBuilder;
import Arrow.MapDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class MapArrayBuilder : ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_map_array_builder_get_type != &gidSymbolNotFound ? garrow_map_array_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(MapDataType dataType)
  {
    GArrowMapArrayBuilder* _cretval;
    GError *_err;
    _cretval = garrow_map_array_builder_new(dataType ? cast(GArrowMapDataType*)dataType.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  bool appendValue()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_map_array_builder_append_value(cast(GArrowMapArrayBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Append multiple values at once. It's more efficient than multiple
   * `append` and `append_null` calls.
   * Params:
   *   offsets = The array of signed int.
   *   isValids = The array of
   *     boolean that shows whether the Nth value is valid or not. If the
   *     Nth `is_valids` is %TRUE, the Nth `values` is valid value. Otherwise
   *     the Nth value is null value.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool appendValues(int[] offsets, bool[] isValids)
  {
    bool _retval;
    long _offsetsLength;
    if (offsets)
      _offsetsLength = cast(long)offsets.length;

    auto _offsets = cast(const(int)*)offsets.ptr;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(bool)*)isValids.ptr;
    GError *_err;
    _retval = garrow_map_array_builder_append_values(cast(GArrowMapArrayBuilder*)cPtr, _offsets, _offsetsLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  ArrayBuilder getItemBuilder()
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_map_array_builder_get_item_builder(cast(GArrowMapArrayBuilder*)cPtr);
    auto _retval = ObjectG.getDObject!ArrayBuilder(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }

  ArrayBuilder getKeyBuilder()
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_map_array_builder_get_key_builder(cast(GArrowMapArrayBuilder*)cPtr);
    auto _retval = ObjectG.getDObject!ArrayBuilder(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }

  ArrayBuilder getValueBuilder()
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_map_array_builder_get_value_builder(cast(GArrowMapArrayBuilder*)cPtr);
    auto _retval = ObjectG.getDObject!ArrayBuilder(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }
}
