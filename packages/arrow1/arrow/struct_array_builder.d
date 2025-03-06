module arrow.struct_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.struct_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class StructArrayBuilder : arrow.array_builder.ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_struct_array_builder_get_type != &gidSymbolNotFound ? garrow_struct_array_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  this(arrow.struct_data_type.StructDataType dataType)
  {
    GArrowStructArrayBuilder* _cretval;
    GError *_err;
    _cretval = garrow_struct_array_builder_new(dataType ? cast(GArrowStructDataType*)dataType.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  bool append()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_struct_array_builder_append(cast(GArrowStructArrayBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /** */
  bool appendValue()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_struct_array_builder_append_value(cast(GArrowStructArrayBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /** */
  arrow.array_builder.ArrayBuilder getFieldBuilder(int i)
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_struct_array_builder_get_field_builder(cast(GArrowStructArrayBuilder*)cPtr, i);
    auto _retval = ObjectG.getDObject!(arrow.array_builder.ArrayBuilder)(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }

  /** */
  arrow.array_builder.ArrayBuilder[] getFieldBuilders()
  {
    GList* _cretval;
    _cretval = garrow_struct_array_builder_get_field_builders(cast(GArrowStructArrayBuilder*)cPtr);
    auto _retval = gListToD!(arrow.array_builder.ArrayBuilder, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }
}
