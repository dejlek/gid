module arrow.struct_field_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import glib.error;

class StructFieldOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_struct_field_options_get_type != &gidSymbolNotFound ? garrow_struct_field_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowStructFieldOptions* _cretval;
    _cretval = garrow_struct_field_options_new();
    this(_cretval, Yes.Take);
  }

  void setFieldRef(string fieldRef)
  {
    const(char)* _fieldRef = fieldRef.toCString(No.Alloc);
    GError *_err;
    garrow_struct_field_options_set_field_ref(cast(GArrowStructFieldOptions*)cPtr, _fieldRef, &_err);
    if (_err)
      throw new ErrorG(_err);
  }
}
