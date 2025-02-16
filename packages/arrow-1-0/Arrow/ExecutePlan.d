module Arrow.ExecutePlan;

import Arrow.AggregateNodeOptions;
import Arrow.ExecuteNode;
import Arrow.ExecuteNodeOptions;
import Arrow.FilterNodeOptions;
import Arrow.HashJoinNodeOptions;
import Arrow.ProjectNodeOptions;
import Arrow.SinkNodeOptions;
import Arrow.SourceNodeOptions;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class ExecutePlan : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_execute_plan_get_type != &gidSymbolNotFound ? garrow_execute_plan_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowExecutePlan* _cretval;
    GError *_err;
    _cretval = garrow_execute_plan_new(&_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /**
   * This is a shortcut of [Arrow.ExecutePlan.buildNode] for aggregate
   * node.
   * Params:
   *   input = A #GArrowExecuteNode.
   *   options = A #GArrowAggregateNodeOptions.
   * Returns: A newly built and added #GArrowExecuteNode
   *   for aggregation on success, %NULL on error.
   */
  ExecuteNode buildAggregateNode(ExecuteNode input, AggregateNodeOptions options)
  {
    GArrowExecuteNode* _cretval;
    GError *_err;
    _cretval = garrow_execute_plan_build_aggregate_node(cast(GArrowExecutePlan*)cPtr, input ? cast(GArrowExecuteNode*)input.cPtr(No.Dup) : null, options ? cast(GArrowAggregateNodeOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!ExecuteNode(cast(GArrowExecuteNode*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * This is a shortcut of [Arrow.ExecutePlan.buildNode] for filter
   * node.
   * Params:
   *   input = A #GArrowExecuteNode.
   *   options = A #GArrowFilterNodeOptions.
   * Returns: A newly built and added #GArrowExecuteNode
   *   for filter on success, %NULL on error.
   */
  ExecuteNode buildFilterNode(ExecuteNode input, FilterNodeOptions options)
  {
    GArrowExecuteNode* _cretval;
    GError *_err;
    _cretval = garrow_execute_plan_build_filter_node(cast(GArrowExecutePlan*)cPtr, input ? cast(GArrowExecuteNode*)input.cPtr(No.Dup) : null, options ? cast(GArrowFilterNodeOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!ExecuteNode(cast(GArrowExecuteNode*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * This is a shortcut of [Arrow.ExecutePlan.buildNode] for hash
   * join node.
   * Params:
   *   left = A left #GArrowExecuteNode.
   *   right = A right #GArrowExecuteNode.
   *   options = A #GArrowHashJoinNodeOptions.
   * Returns: A newly built and added #GArrowExecuteNode
   *   for hash join on success, %NULL on error.
   */
  ExecuteNode buildHashJoinNode(ExecuteNode left, ExecuteNode right, HashJoinNodeOptions options)
  {
    GArrowExecuteNode* _cretval;
    GError *_err;
    _cretval = garrow_execute_plan_build_hash_join_node(cast(GArrowExecutePlan*)cPtr, left ? cast(GArrowExecuteNode*)left.cPtr(No.Dup) : null, right ? cast(GArrowExecuteNode*)right.cPtr(No.Dup) : null, options ? cast(GArrowHashJoinNodeOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!ExecuteNode(cast(GArrowExecuteNode*)_cretval, Yes.Take);
    return _retval;
  }

  ExecuteNode buildNode(string factoryName, ExecuteNode[] inputs, ExecuteNodeOptions options)
  {
    GArrowExecuteNode* _cretval;
    const(char)* _factoryName = factoryName.toCString(No.Alloc);
    auto _inputs = gListFromD!(ExecuteNode)(inputs);
    scope(exit) containerFree!(GList*, ExecuteNode, GidOwnership.None)(_inputs);
    GError *_err;
    _cretval = garrow_execute_plan_build_node(cast(GArrowExecutePlan*)cPtr, _factoryName, _inputs, options ? cast(GArrowExecuteNodeOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!ExecuteNode(cast(GArrowExecuteNode*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * This is a shortcut of [Arrow.ExecutePlan.buildNode] for project
   * node.
   * Params:
   *   input = A #GArrowExecuteNode.
   *   options = A #GArrowProjectNodeOptions.
   * Returns: A newly built and added #GArrowExecuteNode
   *   for project on success, %NULL on error.
   */
  ExecuteNode buildProjectNode(ExecuteNode input, ProjectNodeOptions options)
  {
    GArrowExecuteNode* _cretval;
    GError *_err;
    _cretval = garrow_execute_plan_build_project_node(cast(GArrowExecutePlan*)cPtr, input ? cast(GArrowExecuteNode*)input.cPtr(No.Dup) : null, options ? cast(GArrowProjectNodeOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!ExecuteNode(cast(GArrowExecuteNode*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * This is a shortcut of [Arrow.ExecutePlan.buildNode] for sink
   * node.
   * Params:
   *   input = A #GArrowExecuteNode.
   *   options = A #GArrowSinkNodeOptions.
   * Returns: A newly built and added #GArrowExecuteNode
   *   for sink on success, %NULL on error.
   */
  ExecuteNode buildSinkNode(ExecuteNode input, SinkNodeOptions options)
  {
    GArrowExecuteNode* _cretval;
    GError *_err;
    _cretval = garrow_execute_plan_build_sink_node(cast(GArrowExecutePlan*)cPtr, input ? cast(GArrowExecuteNode*)input.cPtr(No.Dup) : null, options ? cast(GArrowSinkNodeOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!ExecuteNode(cast(GArrowExecuteNode*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * This is a shortcut of [Arrow.ExecutePlan.buildNode] for source
   * node.
   * Params:
   *   options = A #GArrowSourceNodeOptions.
   * Returns: A newly built and added #GArrowExecuteNode
   *   for source on success, %NULL on error.
   */
  ExecuteNode buildSourceNode(SourceNodeOptions options)
  {
    GArrowExecuteNode* _cretval;
    GError *_err;
    _cretval = garrow_execute_plan_build_source_node(cast(GArrowExecutePlan*)cPtr, options ? cast(GArrowSourceNodeOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!ExecuteNode(cast(GArrowExecuteNode*)_cretval, Yes.Take);
    return _retval;
  }

  ExecuteNode[] getNodes()
  {
    GList* _cretval;
    _cretval = garrow_execute_plan_get_nodes(cast(GArrowExecutePlan*)cPtr);
    auto _retval = gListToD!(ExecuteNode, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
   * Starts this plan.
   */
  void start()
  {
    garrow_execute_plan_start(cast(GArrowExecutePlan*)cPtr);
  }

  /**
   * Stops this plan.
   */
  void stop()
  {
    garrow_execute_plan_stop(cast(GArrowExecutePlan*)cPtr);
  }

  bool validate()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_execute_plan_validate(cast(GArrowExecutePlan*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Waits for finishing this plan.
   * Returns: %TRUE on success, %FALSE on error.
   */
  bool wait()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_execute_plan_wait(cast(GArrowExecutePlan*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
