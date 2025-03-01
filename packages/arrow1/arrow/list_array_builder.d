module arrow.list_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.list_data_type;
import arrow.types;
import gid.global;
import glib.error;
import gobject.object;

class ListArrayBuilder : ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_list_array_builder_get_type != &gidSymbolNotFound ? garrow_list_array_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(ListDataType dataType)
  {
    GArrowListArrayBuilder* _cretval;
    GError *_err;
    _cretval = garrow_list_array_builder_new(dataType ? cast(GArrowListDataType*)dataType.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  bool append()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_list_array_builder_append(cast(GArrowListArrayBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool appendValue()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_list_array_builder_append_value(cast(GArrowListArrayBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  ArrayBuilder getValueBuilder()
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_list_array_builder_get_value_builder(cast(GArrowListArrayBuilder*)cPtr);
    auto _retval = ObjectG.getDObject!ArrayBuilder(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }
}
