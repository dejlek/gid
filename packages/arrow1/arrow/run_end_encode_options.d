module arrow.run_end_encode_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.function_options;
import arrow.types;
import gid.global;

class RunEndEncodeOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_run_end_encode_options_get_type != &gidSymbolNotFound ? garrow_run_end_encode_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(DataType runEndDataType)
  {
    GArrowRunEndEncodeOptions* _cretval;
    _cretval = garrow_run_end_encode_options_new(runEndDataType ? cast(GArrowDataType*)runEndDataType.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
