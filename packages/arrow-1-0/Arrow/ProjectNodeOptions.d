module Arrow.ProjectNodeOptions;

import Arrow.ExecuteNodeOptions;
import Arrow.Expression;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ProjectNodeOptions : ExecuteNodeOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_project_node_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Expression[] expressions, string[] names)
  {
    GArrowProjectNodeOptions* _cretval;
    auto _expressions = gListFromD!(Expression)(expressions);
    scope(exit) containerFree!(GList*, Expression, GidOwnership.None)(_expressions);
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
