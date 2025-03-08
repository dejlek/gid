module arrow.aggregation;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class Aggregation : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_aggregation_get_type != &gidSymbolNotFound ? garrow_aggregation_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(string function_, arrow.function_options.FunctionOptions options, string input, string output)
  {
    GArrowAggregation* _cretval;
    const(char)* _function_ = function_.toCString(No.alloc);
    const(char)* _input = input.toCString(No.alloc);
    const(char)* _output = output.toCString(No.alloc);
    _cretval = garrow_aggregation_new(_function_, options ? cast(GArrowFunctionOptions*)options.cPtr(No.dup) : null, _input, _output);
    this(_cretval, Yes.take);
  }
}
