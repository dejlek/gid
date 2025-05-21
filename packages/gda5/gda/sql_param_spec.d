/// Module for [SqlParamSpec] class
module gda.sql_param_spec;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import gobject.types;
import gobject.value;

/** */
class SqlParamSpec
{
  GdaSqlParamSpec cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_param_spec.SqlParamSpec");

    cInstance = *cast(GdaSqlParamSpec*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /** */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlParamSpec*)this._cPtr).name);
  }

  /** */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlParamSpec*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GdaSqlParamSpec*)this._cPtr).name);
  }

  /** */
  @property string descr()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlParamSpec*)this._cPtr).descr);
  }

  /** */
  @property void descr(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlParamSpec*)this._cPtr).descr);
    dToC(propval, cast(void*)&(cast(GdaSqlParamSpec*)this._cPtr).descr);
  }

  /** */
  @property bool isParam()
  {
    return (cast(GdaSqlParamSpec*)this._cPtr).isParam;
  }

  /** */
  @property void isParam(bool propval)
  {
    (cast(GdaSqlParamSpec*)this._cPtr).isParam = propval;
  }

  /** */
  @property bool nullok()
  {
    return (cast(GdaSqlParamSpec*)this._cPtr).nullok;
  }

  /** */
  @property void nullok(bool propval)
  {
    (cast(GdaSqlParamSpec*)this._cPtr).nullok = propval;
  }

  /** */
  @property gobject.types.GType gType()
  {
    return (cast(GdaSqlParamSpec*)this._cPtr).gType;
  }

  /** */
  @property void gType(gobject.types.GType propval)
  {
    (cast(GdaSqlParamSpec*)this._cPtr).gType = propval;
  }

  /** */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_param_spec_serialize(cast(GdaSqlParamSpec*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  void takeDescr(gobject.value.Value value)
  {
    gda_sql_param_spec_take_descr(cast(GdaSqlParamSpec*)this._cPtr, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }

  /** */
  void takeName(gobject.value.Value value)
  {
    gda_sql_param_spec_take_name(cast(GdaSqlParamSpec*)this._cPtr, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }

  /** */
  void takeNullok(gobject.value.Value value)
  {
    gda_sql_param_spec_take_nullok(cast(GdaSqlParamSpec*)this._cPtr, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }

  /** */
  void takeType(gobject.value.Value value)
  {
    gda_sql_param_spec_take_type(cast(GdaSqlParamSpec*)this._cPtr, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }
}
