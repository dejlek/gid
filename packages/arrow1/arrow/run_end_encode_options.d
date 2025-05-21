/// Module for [RunEndEncodeOptions] class
module arrow.run_end_encode_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class RunEndEncodeOptions : arrow.function_options.FunctionOptions
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_run_end_encode_options_get_type != &gidSymbolNotFound ? garrow_run_end_encode_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RunEndEncodeOptions self()
  {
    return this;
  }

  /**
      Get `runEndDataType` property.
      Returns: The data type for run-end.
  */
  @property arrow.data_type.DataType runEndDataType()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.data_type.DataType)("run-end-data-type");
  }

  /**
      Set `runEndDataType` property.
      Params:
        propval = The data type for run-end.
  */
  @property void runEndDataType(arrow.data_type.DataType propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.data_type.DataType)("run-end-data-type", propval);
  }

  /** */
  this(arrow.data_type.DataType runEndDataType = null)
  {
    GArrowRunEndEncodeOptions* _cretval;
    _cretval = garrow_run_end_encode_options_new(runEndDataType ? cast(GArrowDataType*)runEndDataType._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
