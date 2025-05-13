/// Module for [TreeMgrTables] class
module gda.tree_mgr_tables;

import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.tree_manager;
import gda.types;
import gid.gid;

/** */
class TreeMgrTables : gda.tree_manager.TreeManager
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
    return cast(void function())gda_tree_mgr_tables_get_type != &gidSymbolNotFound ? gda_tree_mgr_tables_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeMgrTables self()
  {
    return this;
  }

  /**
      Creates a new #GdaTreeManager object which will add one tree node for each table found in the
      schema if it is not null, or for each table visible by default in cnc.
  
      Params:
        cnc = a #GdaConnection object
        schema = a schema name or null
      Returns: a new #GdaTreeManager object
  */
  this(gda.connection.Connection cnc, string schema = null)
  {
    GdaTreeManager* _cretval;
    const(char)* _schema = schema.toCString(No.Alloc);
    _cretval = gda_tree_mgr_tables_new(cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, _schema);
    this(_cretval, Yes.Take);
  }
}
