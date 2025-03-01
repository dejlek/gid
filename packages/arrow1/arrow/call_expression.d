module arrow.call_expression;

import arrow.c.functions;
import arrow.c.types;
import arrow.expression;
import arrow.function_options;
import arrow.types;
import gid.global;

class CallExpression : Expression
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_call_expression_get_type != &gidSymbolNotFound ? garrow_call_expression_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(string function_, Expression[] arguments, FunctionOptions options)
  {
    GArrowCallExpression* _cretval;
    const(char)* _function_ = function_.toCString(No.Alloc);
    auto _arguments = gListFromD!(Expression)(arguments);
    scope(exit) containerFree!(GList*, Expression, GidOwnership.None)(_arguments);
    _cretval = garrow_call_expression_new(_function_, _arguments, options ? cast(GArrowFunctionOptions*)options.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
