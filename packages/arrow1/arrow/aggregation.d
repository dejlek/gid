/// Module for [Aggregation] class
module arrow.aggregation;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class Aggregation : gobject.object.ObjectWrap
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
    return cast(void function())garrow_aggregation_get_type != &gidSymbolNotFound ? garrow_aggregation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Aggregation self()
  {
    return this;
  }

  /** */
  this(string function_, arrow.function_options.FunctionOptions options, string input, string output)
  {
    GArrowAggregation* _cretval;
    const(char)* _function_ = function_.toCString(No.Alloc);
    const(char)* _input = input.toCString(No.Alloc);
    const(char)* _output = output.toCString(No.Alloc);
    _cretval = garrow_aggregation_new(_function_, options ? cast(GArrowFunctionOptions*)options._cPtr(No.Dup) : null, _input, _output);
    this(_cretval, Yes.Take);
  }
}
