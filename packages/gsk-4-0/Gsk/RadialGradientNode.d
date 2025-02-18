module Gsk.RadialGradientNode;

import Gid.gid;
import Graphene.Point;
import Gsk.RenderNode;
import Gsk.Types;
import Gsk.c.functions;
import Gsk.c.types;

/**
 * A render node for a radial gradient.
 */
class RadialGradientNode : RenderNode
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.RadialGradientNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
   * Retrieves the center pointer for the gradient.
   * Returns: the center point for the gradient
   */
  Point getCenter()
  {
    const(graphene_point_t)* _cretval;
    _cretval = gsk_radial_gradient_node_get_center(cast(GskRenderNode*)cPtr);
    auto _retval = _cretval ? new Point(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Retrieves the end value for the gradient.
   * Returns: the end value for the gradient
   */
  float getEnd()
  {
    float _retval;
    _retval = gsk_radial_gradient_node_get_end(cast(GskRenderNode*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the horizontal radius for the gradient.
   * Returns: the horizontal radius for the gradient
   */
  float getHradius()
  {
    float _retval;
    _retval = gsk_radial_gradient_node_get_hradius(cast(GskRenderNode*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the number of color stops in the gradient.
   * Returns: the number of color stops
   */
  size_t getNColorStops()
  {
    size_t _retval;
    _retval = gsk_radial_gradient_node_get_n_color_stops(cast(GskRenderNode*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the start value for the gradient.
   * Returns: the start value for the gradient
   */
  float getStart()
  {
    float _retval;
    _retval = gsk_radial_gradient_node_get_start(cast(GskRenderNode*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the vertical radius for the gradient.
   * Returns: the vertical radius for the gradient
   */
  float getVradius()
  {
    float _retval;
    _retval = gsk_radial_gradient_node_get_vradius(cast(GskRenderNode*)cPtr);
    return _retval;
  }
}
