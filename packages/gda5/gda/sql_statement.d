/// Module for [SqlStatement] class
module gda.sql_statement;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
class SqlStatement
{
  GdaSqlStatement* cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_statement.SqlStatement");

    cInstancePtr = cast(GdaSqlStatement*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)cInstancePtr;
  }

  /** */
  void compoundSetType(gda.types.SqlStatementCompoundType type)
  {
    gda_sql_statement_compound_set_type(cast(GdaSqlStatement*)this._cPtr, type);
  }

  /** */
  void compoundTakeStmt(gda.sql_statement.SqlStatement s)
  {
    gda_sql_statement_compound_take_stmt(cast(GdaSqlStatement*)this._cPtr, s ? cast(GdaSqlStatement*)s._cPtr : null);
  }
}
