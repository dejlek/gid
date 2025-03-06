module gsk.types;

import gid.gid;
import glib.error;
import graphene.point;
import gsk.c.functions;
import gsk.c.types;


// Enums

/** */
alias BlendMode = GskBlendMode;

/** */
alias Corner = GskCorner;

/** */
alias FillRule = GskFillRule;

/** */
alias GLUniformType = GskGLUniformType;

/** */
alias LineCap = GskLineCap;

/** */
alias LineJoin = GskLineJoin;

/** */
alias MaskMode = GskMaskMode;

/** */
alias PathDirection = GskPathDirection;

/** */
alias PathForeachFlags = GskPathForeachFlags;

/** */
alias PathOperation = GskPathOperation;

/** */
alias RenderNodeType = GskRenderNodeType;

/** */
alias ScalingFilter = GskScalingFilter;

/** */
alias SerializationError = GskSerializationError;

/** */
alias TransformCategory = GskTransformCategory;

// Structs

/** */
alias ParseLocation = GskParseLocation;

// Callbacks

/**
    Type of callback that is called when an error occurs
  during node deserialization.

  ## Parameters
  $(LIST
    * $(B start)       start of the error location
    * $(B end)       end of the error location
    * $(B error)       the error
  )
*/
alias ParseErrorFunc = void delegate(gsk.types.ParseLocation start, gsk.types.ParseLocation end, glib.error.ErrorG error);

/**
    Prototype of the callback to iterate through the operations of
  a path.
  
  For each operation, the callback is given the op itself, the points
  that the operation is applied to in pts, and a weight for conic
  curves. The n_pts argument is somewhat redundant, since the number
  of points can be inferred from the operation.
  
  Each contour of the path starts with a GSK_PATH_MOVE operation.
  Closed contours end with a GSK_PATH_CLOSE operation.

  ## Parameters
  $(LIST
    * $(B op)       The operation
    * $(B pts)       The points of the operation
    * $(B nPts)       The number of points
    * $(B weight)       The weight for conic curves, or unused if not a conic curve
  )
  Returns:     true to continue iterating the path, false to
      immediately abort and not call the function again.
*/
alias PathForeachFunc = bool delegate(gsk.types.PathOperation op, graphene.point.Point pts, size_t nPts, float weight);
