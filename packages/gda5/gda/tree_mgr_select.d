/// Module for [TreeMgrSelect] class
module gda.tree_mgr_select;

import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.set;
import gda.statement;
import gda.tree_manager;
import gda.types;
import gid.gid;

/** */
class TreeMgrSelect : gda.tree_manager.TreeManager
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_tree_mgr_select_get_type != &gidSymbolNotFound ? gda_tree_mgr_select_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeMgrSelect self()
  {
    return this;
  }

  /**
      Creates a new #GdaTreeMgrSelect object which will add one tree node for each row in
      the #GdaDataModel resulting from the execution of stmt.
  
      Params:
        cnc = a #GdaConnection object
        stmt = a #GdaStatement object representing a SELECT statement
        params = a #GdaSet object representing fixed parameters which are to be used when executing stmt
      Returns: a new #GdaTreeManager object
  */
  this(gda.connection.Connection cnc, gda.statement.Statement stmt, gda.set.Set params)
  {
    GdaTreeManager* _cretval;
    _cretval = gda_tree_mgr_select_new(cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, stmt ? cast(GdaStatement*)stmt._cPtr(No.Dup) : null, params ? cast(GdaSet*)params._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
