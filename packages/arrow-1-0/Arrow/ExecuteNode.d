module Arrow.ExecuteNode;

import Arrow.Schema;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class ExecuteNode : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_execute_node_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  string getKindName()
  {
    const(char)* _cretval;
    _cretval = garrow_execute_node_get_kind_name(cast(GArrowExecuteNode*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  Schema getOutputSchema()
  {
    GArrowSchema* _cretval;
    _cretval = garrow_execute_node_get_output_schema(cast(GArrowExecuteNode*)cPtr);
    auto _retval = ObjectG.getDObject!Schema(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }
}
