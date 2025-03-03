module arrow.project_node_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.execute_node_options;
import arrow.expression;
import arrow.types;
import gid.gid;

class ProjectNodeOptions : arrow.execute_node_options.ExecuteNodeOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_project_node_options_get_type != &gidSymbolNotFound ? garrow_project_node_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(arrow.expression.Expression[] expressions, string[] names)
  {
    GArrowProjectNodeOptions* _cretval;
    auto _expressions = gListFromD!(arrow.expression.Expression)(expressions);
    scope(exit) containerFree!(GList*, arrow.expression.Expression, GidOwnership.None)(_expressions);
    size_t _nNames;
    if (names)
      _nNames = cast(size_t)names.length;

    char*[] _tmpnames;
    foreach (s; names)
      _tmpnames ~= s.toCString(No.Alloc);
    char** _names = _tmpnames.ptr;
    _cretval = garrow_project_node_options_new(_expressions, _names, _nNames);
    this(_cretval, Yes.Take);
  }
}
