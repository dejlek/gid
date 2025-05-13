/// Module for [SqlSelectJoin] class
module gda.sql_select_join;

import gda.c.functions;
import gda.c.types;
import gda.sql_any_part;
import gda.sql_expr;
import gda.types;
import gid.gid;

/**
    This structure represents a join between two targets in a SELECT statement.
*/
class SqlSelectJoin
{
  GdaSqlSelectJoin cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_select_join.SqlSelectJoin");

    cInstance = *cast(GdaSqlSelectJoin*)ptr;

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
    return new gda.sql_any_part.SqlAnyPart(cast(GdaSqlAnyPart*)&(cast(GdaSqlSelectJoin*)this._cPtr).any);
  }

  /**
      Get `type` field.
      Returns: type of join
  */
  @property gda.types.SqlSelectJoinType type()
  {
    return cast(gda.types.SqlSelectJoinType)(cast(GdaSqlSelectJoin*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = type of join
  */
  @property void type(gda.types.SqlSelectJoinType propval)
  {
    (cast(GdaSqlSelectJoin*)this._cPtr).type = cast(GdaSqlSelectJoinType)propval;
  }

  /**
      Get `position` field.
      Returns: represents a join between a target at (pos &lt; @position) and the one at @position
  */
  @property int position()
  {
    return (cast(GdaSqlSelectJoin*)this._cPtr).position;
  }

  /**
      Set `position` field.
      Params:
        propval = represents a join between a target at (pos &lt; @position) and the one at @position
  */
  @property void position(int propval)
  {
    (cast(GdaSqlSelectJoin*)this._cPtr).position = propval;
  }

  /**
      Get `expr` field.
      Returns: joining expression, or null
  */
  @property gda.sql_expr.SqlExpr expr()
  {
    return cToD!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlSelectJoin*)this._cPtr).expr);
  }

  /**
      Set `expr` field.
      Params:
        propval = joining expression, or null
  */
  @property void expr(gda.sql_expr.SqlExpr propval)
  {
    cValueFree!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlSelectJoin*)this._cPtr).expr);
    dToC(propval, cast(void*)&(cast(GdaSqlSelectJoin*)this._cPtr).expr);
  }

  /** */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_select_join_serialize(cast(GdaSqlSelectJoin*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  static string typeToString(gda.types.SqlSelectJoinType type)
  {
    const(char)* _cretval;
    _cretval = gda_sql_select_join_type_to_string(type);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
