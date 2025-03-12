module arrow.run_end_encode_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.function_options;
import arrow.types;
import gid.gid;

/** */
class RunEndEncodeOptions : arrow.function_options.FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_run_end_encode_options_get_type != &gidSymbolNotFound ? garrow_run_end_encode_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override RunEndEncodeOptions self()
  {
    return this;
  }

  /** */
  this(arrow.data_type.DataType runEndDataType = null)
  {
    GArrowRunEndEncodeOptions* _cretval;
    _cretval = garrow_run_end_encode_options_new(runEndDataType ? cast(GArrowDataType*)runEndDataType.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
