module arrow.list_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.list_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class ListArrayBuilder : arrow.array_builder.ArrayBuilder
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_list_array_builder_get_type != &gidSymbolNotFound ? garrow_list_array_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.list_data_type.ListDataType dataType)
  {
    GArrowListArrayBuilder* _cretval;
    GError *_err;
    _cretval = garrow_list_array_builder_new(dataType ? cast(GArrowListDataType*)dataType.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.take);
  }

  /** */
  bool append()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_list_array_builder_append(cast(GArrowListArrayBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /** */
  bool appendValue()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_list_array_builder_append_value(cast(GArrowListArrayBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /** */
  arrow.array_builder.ArrayBuilder getValueBuilder()
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_list_array_builder_get_value_builder(cast(GArrowListArrayBuilder*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.array_builder.ArrayBuilder)(cast(GArrowArrayBuilder*)_cretval, No.take);
    return _retval;
  }
}
