/// Module for [SqlOperation] class
module gda.sql_operation;

import gda.c.functions;
import gda.c.types;
import gda.sql_any_part;
import gda.types;
import gid.gid;

/**
    This structure represents an operation between one or more operands.
*/
class SqlOperation
{
  GdaSqlOperation cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_operation.SqlOperation");

    cInstance = *cast(GdaSqlOperation*)ptr;

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
    return new gda.sql_any_part.SqlAnyPart(cast(GdaSqlAnyPart*)&(cast(GdaSqlOperation*)this._cPtr).any);
  }

  /** */
  @property gda.types.SqlOperatorType operatorType()
  {
    return cast(gda.types.SqlOperatorType)(cast(GdaSqlOperation*)this._cPtr).operatorType;
  }

  /** */
  @property void operatorType(gda.types.SqlOperatorType propval)
  {
    (cast(GdaSqlOperation*)this._cPtr).operatorType = cast(GdaSqlOperatorType)propval;
  }

  /** */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_operation_serialize(cast(GdaSqlOperation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  static gda.types.SqlOperatorType operatorFromString(string op)
  {
    GdaSqlOperatorType _cretval;
    const(char)* _op = op.toCString(No.Alloc);
    _cretval = gda_sql_operation_operator_from_string(_op);
    gda.types.SqlOperatorType _retval = cast(gda.types.SqlOperatorType)_cretval;
    return _retval;
  }

  /** */
  static string operatorToString(gda.types.SqlOperatorType op)
  {
    const(char)* _cretval;
    _cretval = gda_sql_operation_operator_to_string(op);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
