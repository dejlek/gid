module gsk.linear_gradient_node;

import gid.global;
import graphene.point;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
 * A render node for a linear gradient.
 */
class LinearGradientNode : RenderNode
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.LinearGradientNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
   * Retrieves the final point of the linear gradient.
   * Returns: the final point
   */
  Point getEnd()
  {
    const(graphene_point_t)* _cretval;
    _cretval = gsk_linear_gradient_node_get_end(cast(GskRenderNode*)cPtr);
    auto _retval = _cretval ? new Point(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Retrieves the number of color stops in the gradient.
   * Returns: the number of color stops
   */
  size_t getNColorStops()
  {
    size_t _retval;
    _retval = gsk_linear_gradient_node_get_n_color_stops(cast(GskRenderNode*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the initial point of the linear gradient.
   * Returns: the initial point
   */
  Point getStart()
  {
    const(graphene_point_t)* _cretval;
    _cretval = gsk_linear_gradient_node_get_start(cast(GskRenderNode*)cPtr);
    auto _retval = _cretval ? new Point(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
