/// Module for [TreeMgrSchemas] class
module gda.tree_mgr_schemas;

import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.tree_manager;
import gda.types;
import gid.gid;

/** */
class TreeMgrSchemas : gda.tree_manager.TreeManager
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
    return cast(void function())gda_tree_mgr_schemas_get_type != &gidSymbolNotFound ? gda_tree_mgr_schemas_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeMgrSchemas self()
  {
    return this;
  }

  /**
      Creates a new #GdaTreeManager object which will add one tree node for each database schema found
      in cnc.
  
      Params:
        cnc = a #GdaConnection object
      Returns: a new #GdaTreeManager object
  */
  this(gda.connection.Connection cnc)
  {
    GdaTreeManager* _cretval;
    _cretval = gda_tree_mgr_schemas_new(cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
