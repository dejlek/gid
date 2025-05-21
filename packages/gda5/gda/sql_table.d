/// Module for [SqlTable] class
module gda.sql_table;

import gda.c.functions;
import gda.c.types;
import gda.meta_db_object;
import gda.sql_any_part;
import gda.types;
import gid.gid;
import gobject.value;

/**
    This structure represents the name of a table.
*/
class SqlTable
{
  GdaSqlTable cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_table.SqlTable");

    cInstance = *cast(GdaSqlTable*)ptr;

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
    return new gda.sql_any_part.SqlAnyPart(cast(GdaSqlAnyPart*)&(cast(GdaSqlTable*)this._cPtr).any, No.Take);
  }

  /** */
  @property string tableName()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlTable*)this._cPtr).tableName);
  }

  /** */
  @property void tableName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlTable*)this._cPtr).tableName);
    dToC(propval, cast(void*)&(cast(GdaSqlTable*)this._cPtr).tableName);
  }

  /** */
  @property gda.meta_db_object.MetaDbObject validityMetaObject()
  {
    return new gda.meta_db_object.MetaDbObject(cast(GdaMetaDbObject*)(cast(GdaSqlTable*)this._cPtr).validityMetaObject, No.Take);
  }

  /** */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_table_serialize(cast(GdaSqlTable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  void takeName(gobject.value.Value value)
  {
    gda_sql_table_take_name(cast(GdaSqlTable*)this._cPtr, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }
}
