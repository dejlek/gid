module Arrow.HashJoinNodeOptions;

import Arrow.ExecuteNodeOptions;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class HashJoinNodeOptions : ExecuteNodeOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_hash_join_node_options_get_type != &gidSymbolNotFound ? garrow_hash_join_node_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(JoinType type, string[] leftKeys, string[] rightKeys)
  {
    GArrowHashJoinNodeOptions* _cretval;
    size_t _nLeftKeys;
    if (leftKeys)
      _nLeftKeys = cast(size_t)leftKeys.length;

    char*[] _tmpleftKeys;
    foreach (s; leftKeys)
      _tmpleftKeys ~= s.toCString(No.Alloc);
    const(char*)* _leftKeys = _tmpleftKeys.ptr;

    size_t _nRightKeys;
    if (rightKeys)
      _nRightKeys = cast(size_t)rightKeys.length;

    char*[] _tmprightKeys;
    foreach (s; rightKeys)
      _tmprightKeys ~= s.toCString(No.Alloc);
    const(char*)* _rightKeys = _tmprightKeys.ptr;

    GError *_err;
    _cretval = garrow_hash_join_node_options_new(type, _leftKeys, _nLeftKeys, _rightKeys, _nRightKeys, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  bool setLeftOutputs(string[] outputs)
  {
    bool _retval;
    size_t _nOutputs;
    if (outputs)
      _nOutputs = cast(size_t)outputs.length;

    char*[] _tmpoutputs;
    foreach (s; outputs)
      _tmpoutputs ~= s.toCString(No.Alloc);
    const(char*)* _outputs = _tmpoutputs.ptr;

    GError *_err;
    _retval = garrow_hash_join_node_options_set_left_outputs(cast(GArrowHashJoinNodeOptions*)cPtr, _outputs, _nOutputs, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool setRightOutputs(string[] outputs)
  {
    bool _retval;
    size_t _nOutputs;
    if (outputs)
      _nOutputs = cast(size_t)outputs.length;

    char*[] _tmpoutputs;
    foreach (s; outputs)
      _tmpoutputs ~= s.toCString(No.Alloc);
    const(char*)* _outputs = _tmpoutputs.ptr;

    GError *_err;
    _retval = garrow_hash_join_node_options_set_right_outputs(cast(GArrowHashJoinNodeOptions*)cPtr, _outputs, _nOutputs, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
