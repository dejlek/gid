module arrow.call_expression;

import arrow.c.functions;
import arrow.c.types;
import arrow.expression;
import arrow.function_options;
import arrow.types;
import gid.gid;

/** */
class CallExpression : arrow.expression.Expression
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_call_expression_get_type != &gidSymbolNotFound ? garrow_call_expression_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(string function_, arrow.expression.Expression[] arguments, arrow.function_options.FunctionOptions options = null)
  {
    GArrowCallExpression* _cretval;
    const(char)* _function_ = function_.toCString(No.Alloc);
    auto _arguments = gListFromD!(arrow.expression.Expression)(arguments);
    scope(exit) containerFree!(GList*, arrow.expression.Expression, GidOwnership.None)(_arguments);
    _cretval = garrow_call_expression_new(_function_, _arguments, options ? cast(GArrowFunctionOptions*)options.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
