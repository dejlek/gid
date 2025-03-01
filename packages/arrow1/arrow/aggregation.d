module arrow.aggregation;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.global;
import gobject.object;

class Aggregation : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_aggregation_get_type != &gidSymbolNotFound ? garrow_aggregation_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(string function_, FunctionOptions options, string input, string output)
  {
    GArrowAggregation* _cretval;
    const(char)* _function_ = function_.toCString(No.Alloc);
    const(char)* _input = input.toCString(No.Alloc);
    const(char)* _output = output.toCString(No.Alloc);
    _cretval = garrow_aggregation_new(_function_, options ? cast(GArrowFunctionOptions*)options.cPtr(No.Dup) : null, _input, _output);
    this(_cretval, Yes.Take);
  }
}
