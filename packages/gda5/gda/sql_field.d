/// Module for [SqlField] class
module gda.sql_field;

import gda.c.functions;
import gda.c.types;
import gda.meta_table_column;
import gda.sql_any_part;
import gda.types;
import gid.gid;
import gobject.value;

/**
    any:
    This structure represents the name of a table's field.
*/
class SqlField
{
  GdaSqlField cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_field.SqlField");

    cInstance = *cast(GdaSqlField*)ptr;

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
    return new gda.sql_any_part.SqlAnyPart(cast(GdaSqlAnyPart*)&(cast(GdaSqlField*)this._cPtr).any, No.Take);
  }

  /** */
  @property string fieldName()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlField*)this._cPtr).fieldName);
  }

  /** */
  @property void fieldName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlField*)this._cPtr).fieldName);
    dToC(propval, cast(void*)&(cast(GdaSqlField*)this._cPtr).fieldName);
  }

  /** */
  @property gda.meta_table_column.MetaTableColumn validityMetaTableColumn()
  {
    return new gda.meta_table_column.MetaTableColumn(cast(GdaMetaTableColumn*)(cast(GdaSqlField*)this._cPtr).validityMetaTableColumn, No.Take);
  }

  /** */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_field_serialize(cast(GdaSqlField*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  void takeName(gobject.value.Value value)
  {
    gda_sql_field_take_name(cast(GdaSqlField*)this._cPtr, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }
}
