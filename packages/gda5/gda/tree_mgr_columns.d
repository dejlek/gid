/// Module for [TreeMgrColumns] class
module gda.tree_mgr_columns;

import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.tree_manager;
import gda.types;
import gid.gid;

/** */
class TreeMgrColumns : gda.tree_manager.TreeManager
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
    return cast(void function())gda_tree_mgr_columns_get_type != &gidSymbolNotFound ? gda_tree_mgr_columns_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeMgrColumns self()
  {
    return this;
  }

  /**
      Creates a new #GdaTreeManager object which will add one tree node for each
      column in the table named table_name in the schema schema.
  
      Params:
        cnc = a #GdaConnection object
        schema = a schema name
        tableName = the name of the table
      Returns: a new #GdaTreeManager object
  */
  this(gda.connection.Connection cnc, string schema, string tableName)
  {
    GdaTreeManager* _cretval;
    const(char)* _schema = schema.toCString(No.Alloc);
    const(char)* _tableName = tableName.toCString(No.Alloc);
    _cretval = gda_tree_mgr_columns_new(cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, _schema, _tableName);
    this(_cretval, Yes.Take);
  }
}
