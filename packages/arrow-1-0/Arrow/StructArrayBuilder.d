module Arrow.StructArrayBuilder;

import Arrow.ArrayBuilder;
import Arrow.StructDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class StructArrayBuilder : ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_struct_array_builder_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(StructDataType dataType)
  {
    GArrowStructArrayBuilder* _cretval;
    GError *_err;
    _cretval = garrow_struct_array_builder_new(dataType ? cast(GArrowStructDataType*)dataType.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  bool append()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_struct_array_builder_append(cast(GArrowStructArrayBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool appendValue()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_struct_array_builder_append_value(cast(GArrowStructArrayBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  ArrayBuilder getFieldBuilder(int i)
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_struct_array_builder_get_field_builder(cast(GArrowStructArrayBuilder*)cPtr, i);
    auto _retval = ObjectG.getDObject!ArrayBuilder(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }

  ArrayBuilder[] getFieldBuilders()
  {
    GList* _cretval;
    _cretval = garrow_struct_array_builder_get_field_builders(cast(GArrowStructArrayBuilder*)cPtr);
    auto _retval = gListToD!(ArrayBuilder, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }
}
