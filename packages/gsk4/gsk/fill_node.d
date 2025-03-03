module gsk.fill_node;

import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.path;
import gsk.render_node;
import gsk.types;

/**
 * A render node filling the area given by [gsk.path.Path]
 * and [gsk.types.FillRule] with the child node.
 */
class FillNode : gsk.render_node.RenderNode
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.FillNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
   * Creates a `GskRenderNode` that will fill the child in the area
   * given by path and fill_rule.
   * Params:
   *   child = The node to fill the area with
   *   path = The path describing the area to fill
   *   fillRule = The fill rule to use
   * Returns: A new `GskRenderNode`
   */
  this(gsk.render_node.RenderNode child, gsk.path.Path path, gsk.types.FillRule fillRule)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_fill_node_new(child ? cast(GskRenderNode*)child.cPtr(No.Dup) : null, path ? cast(GskPath*)path.cPtr(No.Dup) : null, fillRule);
    this(_cretval, No.Take);
  }

  /**
   * Gets the child node that is getting drawn by the given node.
   * Returns: The child that is getting drawn
   */
  gsk.render_node.RenderNode getChild()
  {
    GskRenderNode* _cretval;
    _cretval = gsk_fill_node_get_child(cast(const(GskRenderNode)*)cPtr);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Retrieves the fill rule used to determine how the path is filled.
   * Returns: a `GskFillRule`
   */
  gsk.types.FillRule getFillRule()
  {
    GskFillRule _cretval;
    _cretval = gsk_fill_node_get_fill_rule(cast(const(GskRenderNode)*)cPtr);
    gsk.types.FillRule _retval = cast(gsk.types.FillRule)_cretval;
    return _retval;
  }

  /**
   * Retrieves the path used to describe the area filled with the contents of
   * the node.
   * Returns: a `GskPath`
   */
  gsk.path.Path getPath()
  {
    GskPath* _cretval;
    _cretval = gsk_fill_node_get_path(cast(const(GskRenderNode)*)cPtr);
    auto _retval = _cretval ? new gsk.path.Path(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
