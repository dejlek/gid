module Arrow.RunEndEncodeOptions;

import Arrow.DataType;
import Arrow.FunctionOptions;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class RunEndEncodeOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_run_end_encode_options_get_type();
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
