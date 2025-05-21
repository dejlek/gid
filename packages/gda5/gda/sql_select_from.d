/// Module for [SqlSelectFrom] class
module gda.sql_select_from;

import gda.c.functions;
import gda.c.types;
import gda.sql_any_part;
import gda.types;
import gid.gid;

/**
    This structure represents the FROM clause of a SELECT statement, it lists targets and joins
*/
class SqlSelectFrom
{
  GdaSqlSelectFrom cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_select_from.SqlSelectFrom");

    cInstance = *cast(GdaSqlSelectFrom*)ptr;

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
    return new gda.sql_any_part.SqlAnyPart(cast(GdaSqlAnyPart*)&(cast(GdaSqlSelectFrom*)this._cPtr).any, No.Take);
  }

  /** */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_select_from_serialize(cast(GdaSqlSelectFrom*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
