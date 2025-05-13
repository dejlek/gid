/// Module for [SqlStatementCompound] class
module gda.sql_statement_compound;

import gda.c.functions;
import gda.c.types;
import gda.sql_any_part;
import gda.types;
import gid.gid;

/** */
class SqlStatementCompound
{
  GdaSqlStatementCompound cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_statement_compound.SqlStatementCompound");

    cInstance = *cast(GdaSqlStatementCompound*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /** */
  @property gda.sql_any_part.SqlAnyPart any()
  {
    return new gda.sql_any_part.SqlAnyPart(cast(GdaSqlAnyPart*)&(cast(GdaSqlStatementCompound*)this._cPtr).any);
  }

  /** */
  @property gda.types.SqlStatementCompoundType compoundType()
  {
    return cast(gda.types.SqlStatementCompoundType)(cast(GdaSqlStatementCompound*)this._cPtr).compoundType;
  }

  /** */
  @property void compoundType(gda.types.SqlStatementCompoundType propval)
  {
    (cast(GdaSqlStatementCompound*)this._cPtr).compoundType = cast(GdaSqlStatementCompoundType)propval;
  }
}
