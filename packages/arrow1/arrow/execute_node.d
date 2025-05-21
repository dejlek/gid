/// Module for [ExecuteNode] class
module arrow.execute_node;

import arrow.c.functions;
import arrow.c.types;
import arrow.schema;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class ExecuteNode : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_execute_node_get_type != &gidSymbolNotFound ? garrow_execute_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ExecuteNode self()
  {
    return this;
  }

  /** */
  string getKindName()
  {
    const(char)* _cretval;
    _cretval = garrow_execute_node_get_kind_name(cast(GArrowExecuteNode*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  arrow.schema.Schema getOutputSchema()
  {
    GArrowSchema* _cretval;
    _cretval = garrow_execute_node_get_output_schema(cast(GArrowExecuteNode*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }
}
