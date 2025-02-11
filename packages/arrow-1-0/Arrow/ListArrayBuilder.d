module Arrow.ListArrayBuilder;

import Arrow.ArrayBuilder;
import Arrow.ListDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class ListArrayBuilder : ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_list_array_builder_get_type();
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
