/// Module for [SqlCase] class
module gda.sql_case;

import gda.c.functions;
import gda.c.types;
import gda.sql_any_part;
import gda.sql_expr;
import gda.types;
import gid.gid;

/**
    This structure represents a CASE WHEN... construct
*/
class SqlCase
{
  GdaSqlCase cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_case.SqlCase");

    cInstance = *cast(GdaSqlCase*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `any` field.
      Returns: inheritance structure
  */
  @property gda.sql_any_part.SqlAnyPart any()
  {
    return new gda.sql_any_part.SqlAnyPart(cast(GdaSqlAnyPart*)&(cast(GdaSqlCase*)this._cPtr).any);
  }

  /**
      Get `baseExpr` field.
      Returns: expression to test
  */
  @property gda.sql_expr.SqlExpr baseExpr()
  {
    return cToD!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlCase*)this._cPtr).baseExpr);
  }

  /**
      Set `baseExpr` field.
      Params:
        propval = expression to test
  */
  @property void baseExpr(gda.sql_expr.SqlExpr propval)
  {
    cValueFree!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlCase*)this._cPtr).baseExpr);
    dToC(propval, cast(void*)&(cast(GdaSqlCase*)this._cPtr).baseExpr);
  }

  /**
      Get `elseExpr` field.
      Returns: default expression for the CASE
  */
  @property gda.sql_expr.SqlExpr elseExpr()
  {
    return cToD!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlCase*)this._cPtr).elseExpr);
  }

  /**
      Set `elseExpr` field.
      Params:
        propval = default expression for the CASE
  */
  @property void elseExpr(gda.sql_expr.SqlExpr propval)
  {
    cValueFree!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlCase*)this._cPtr).elseExpr);
    dToC(propval, cast(void*)&(cast(GdaSqlCase*)this._cPtr).elseExpr);
  }

  /** */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_case_serialize(cast(GdaSqlCase*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
