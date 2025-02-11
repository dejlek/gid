module Arrow.LargeListArrayBuilder;

import Arrow.ArrayBuilder;
import Arrow.LargeListDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class LargeListArrayBuilder : ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_large_list_array_builder_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(LargeListDataType dataType)
  {
    GArrowLargeListArrayBuilder* _cretval;
    GError *_err;
    _cretval = garrow_large_list_array_builder_new(dataType ? cast(GArrowLargeListDataType*)dataType.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  bool appendValue()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_large_list_array_builder_append_value(cast(GArrowLargeListArrayBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  ArrayBuilder getValueBuilder()
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_large_list_array_builder_get_value_builder(cast(GArrowLargeListArrayBuilder*)cPtr);
    auto _retval = ObjectG.getDObject!ArrayBuilder(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }
}
