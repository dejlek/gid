/// Module for [SqlFunction] class
module gda.sql_function;

import gda.c.functions;
import gda.c.types;
import gda.sql_any_part;
import gda.types;
import gid.gid;
import gobject.value;

/**
    This structure represents a function or an aggregate with zero or more arguments.
*/
class SqlFunction
{
  GdaSqlFunction cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_function.SqlFunction");

    cInstance = *cast(GdaSqlFunction*)ptr;

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
    return new gda.sql_any_part.SqlAnyPart(cast(GdaSqlAnyPart*)&(cast(GdaSqlFunction*)this._cPtr).any, No.Take);
  }

  /**
      Get `functionName` field.
      Returns: name of the function , in the form [[catalog.]schema.]function_name
  */
  @property string functionName()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlFunction*)this._cPtr).functionName);
  }

  /**
      Set `functionName` field.
      Params:
        propval = name of the function , in the form [[catalog.]schema.]function_name
  */
  @property void functionName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlFunction*)this._cPtr).functionName);
    dToC(propval, cast(void*)&(cast(GdaSqlFunction*)this._cPtr).functionName);
  }

  /** */
  void checkClean()
  {
    gda_sql_function_check_clean(cast(GdaSqlFunction*)this._cPtr);
  }

  /** */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_function_serialize(cast(GdaSqlFunction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  void takeArgsList(void*[] args)
  {
    auto _args = gSListFromD!(void*)(args);
    scope(exit) containerFree!(GSList*, void*, GidOwnership.None)(_args);
    gda_sql_function_take_args_list(cast(GdaSqlFunction*)this._cPtr, _args);
  }

  /** */
  void takeName(gobject.value.Value value)
  {
    gda_sql_function_take_name(cast(GdaSqlFunction*)this._cPtr, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }
}
