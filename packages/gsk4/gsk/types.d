module gsk.types;

import gid.gid;
import glib.error;
import graphene.point;
import gsk.c.functions;
import gsk.c.types;


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

/**
    The blend modes available for render nodes.
  
  The implementation of each blend mode is deferred to the
  rendering pipeline.
  
  See <https://www.w3.org/TR/compositing-1/#blending> for more information
  on blending and blend modes.
*/
enum BlendMode
{
  /**
      The default blend mode, which specifies no blending
  */
  Default = 0,

  /**
      The source color is multiplied by the destination
      and replaces the destination
  */
  Multiply = 1,

  /**
      Multiplies the complements of the destination and source
      color values, then complements the result.
  */
  Screen = 2,

  /**
      Multiplies or screens the colors, depending on the
      destination color value. This is the inverse of hard-list
  */
  Overlay = 3,

  /**
      Selects the darker of the destination and source colors
  */
  Darken = 4,

  /**
      Selects the lighter of the destination and source colors
  */
  Lighten = 5,

  /**
      Brightens the destination color to reflect the source color
  */
  ColorDodge = 6,

  /**
      Darkens the destination color to reflect the source color
  */
  ColorBurn = 7,

  /**
      Multiplies or screens the colors, depending on the source color value
  */
  HardLight = 8,

  /**
      Darkens or lightens the colors, depending on the source color value
  */
  SoftLight = 9,

  /**
      Subtracts the darker of the two constituent colors from the lighter color
  */
  Difference = 10,

  /**
      Produces an effect similar to that of the difference mode but lower in contrast
  */
  Exclusion = 11,

  /**
      Creates a color with the hue and saturation of the source color and the luminosity of the destination color
  */
  Color = 12,

  /**
      Creates a color with the hue of the source color and the saturation and luminosity of the destination color
  */
  Hue = 13,

  /**
      Creates a color with the saturation of the source color and the hue and luminosity of the destination color
  */
  Saturation = 14,

  /**
      Creates a color with the luminosity of the source color and the hue and saturation of the destination color
  */
  Luminosity = 15,
}

/**
    The corner indices used by [gsk.rounded_rect.RoundedRect].
*/
enum Corner
{
  /**
      The top left corner
  */
  TopLeft = 0,

  /**
      The top right corner
  */
  TopRight = 1,

  /**
      The bottom right corner
  */
  BottomRight = 2,

  /**
      The bottom left corner
  */
  BottomLeft = 3,
}

/**
    [gsk.types.FillRule] is used to select how paths are filled.
  
  Whether or not a point is included in the fill is determined by taking
  a ray from that point to infinity and looking at intersections with the
  path. The ray can be in any direction, as long as it doesn't pass through
  the end point of a segment or have a tricky intersection such as
  intersecting tangent to the path.
  
  (Note that filling is not actually implemented in this way. This
  is just a description of the rule that is applied.)
  
  New entries may be added in future versions.
*/
enum FillRule
{
  /**
      If the path crosses the ray from
      left-to-right, counts +1. If the path crosses the ray
      from right to left, counts -1. (Left and right are determined
      from the perspective of looking along the ray from the starting
      point.) If the total count is non-zero, the point will be filled.
  */
  Winding = 0,

  /**
      Counts the total number of
      intersections, without regard to the orientation of the contour. If
      the total number of intersections is odd, the point will be
      filled.
  */
  EvenOdd = 1,
}

/**
    This defines the types of the uniforms that `GskGLShaders`
  declare.
  
  It defines both what the type is called in the GLSL shader
  code, and what the corresponding C type is on the Gtk side.
*/
enum GLUniformType
{
  /**
      No type, used for uninitialized or unspecified values.
  */
  None = 0,

  /**
      A float uniform
  */
  Float = 1,

  /**
      A GLSL int / gint32 uniform
  */
  Int = 2,

  /**
      A GLSL uint / guint32 uniform
  */
  Uint = 3,

  /**
      A GLSL bool / gboolean uniform
  */
  Bool = 4,

  /**
      A GLSL vec2 / graphene_vec2_t uniform
  */
  Vec2 = 5,

  /**
      A GLSL vec3 / graphene_vec3_t uniform
  */
  Vec3 = 6,

  /**
      A GLSL vec4 / graphene_vec4_t uniform
  */
  Vec4 = 7,
}

/**
    Specifies how to render the start and end points of contours or
  dashes when stroking.
  
  The default line cap style is [gsk.types.LineCap.Butt].
  
  New entries may be added in future versions.
  
  <figure>
    <picture>
      <source srcset="caps-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="Line Cap Styles" src="caps-light.png">
    </picture>
    <figcaption>GSK_LINE_CAP_BUTT, GSK_LINE_CAP_ROUND, GSK_LINE_CAP_SQUARE</figcaption>
  </figure>
*/
enum LineCap
{
  /**
      Start and stop the line exactly at the start
      and end point
  */
  Butt = 0,

  /**
      Use a round ending, the center of the circle
      is the start or end point
  */
  Round = 1,

  /**
      use squared ending, the center of the square
      is the start or end point
  */
  Square = 2,
}

/**
    Specifies how to render the junction of two lines when stroking.
  
  The default line join style is [gsk.types.LineJoin.Miter].
  
  New entries may be added in future versions.
  
  <figure>
    <picture>
      <source srcset="join-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="Line Join Styles" src="join-light.png">
    </picture>
    <figcaption>GSK_LINE_JOINT_MITER, GSK_LINE_JOINT_ROUND, GSK_LINE_JOIN_BEVEL</figcaption>
  </figure>
*/
enum LineJoin
{
  /**
      Use a sharp angled corner
  */
  Miter = 0,

  /**
      Use a round join, the center of the circle is
      the join point
  */
  Round = 1,

  /**
      use a cut-off join, the join is cut off at half
      the line width from the joint point
  */
  Bevel = 2,
}

/**
    The mask modes available for mask nodes.
*/
enum MaskMode
{
  /**
      Use the alpha channel of the mask
  */
  Alpha = 0,

  /**
      Use the inverted alpha channel of the mask
  */
  InvertedAlpha = 1,

  /**
      Use the luminance of the mask,
        multiplied by mask alpha
  */
  Luminance = 2,

  /**
      Use the inverted luminance of the mask,
        multiplied by mask alpha
  */
  InvertedLuminance = 3,
}

/**
    The values of the [gsk.types.PathDirection] enum are used to pick one
  of the four tangents at a given point on the path.
  
  Note that the directions for @GSK_PATH_FROM_START/@GSK_PATH_TO_END and
  @GSK_PATH_TO_START/@GSK_PATH_FROM_END will coincide for smooth points.
  Only sharp turns will exhibit four different directions.
  
  <picture>
    <source srcset="directions-dark.png" media="(prefers-color-scheme: dark)">
    <img alt="Path Tangents" src="directions-light.png">
  </picture>
*/
enum PathDirection
{
  /**
      The tangent in path direction of the incoming side
      of the path
  */
  FromStart = 0,

  /**
      The tangent against path direction of the incoming side
      of the path
  */
  ToStart = 1,

  /**
      The tangent in path direction of the outgoing side
      of the path
  */
  ToEnd = 2,

  /**
      The tangent against path direction of the outgoing
      side of the path
  */
  FromEnd = 3,
}

/**
    Flags that can be passed to [gsk.path.Path.foreach_] to influence what
  kinds of operations the path is decomposed into.
  
  By default, [gsk.path.Path.foreach_] will only emit a path with all
  operations flattened to straight lines to allow for maximum compatibility.
  The only operations emitted will be [gsk.types.PathOperation.Move], [gsk.types.PathOperation.Line] and
  [gsk.types.PathOperation.Close].
*/
enum PathForeachFlags : uint
{
  /**
      The default behavior, only allow lines.
  */
  OnlyLines = 0,

  /**
      Allow emission of [gsk.types.PathOperation.Quad] operations
  */
  Quad = 1,

  /**
      Allow emission of [gsk.types.PathOperation.Cubic] operations.
  */
  Cubic = 2,

  /**
      Allow emission of [gsk.types.PathOperation.Conic] operations.
  */
  Conic = 4,
}

/**
    Path operations are used to describe the segments of a [gsk.path.Path].
  
  More values may be added in the future.
*/
enum PathOperation
{
  /**
      A move-to operation, with 1 point describing the target point.
  */
  Move = 0,

  /**
      A close operation ending the current contour with a line back
      to the starting point. Two points describe the start and end of the line.
  */
  Close = 1,

  /**
      A line-to operation, with 2 points describing the start and
      end point of a straight line.
  */
  Line = 2,

  /**
      A curve-to operation describing a quadratic Bézier curve
      with 3 points describing the start point, the control point and the end
      point of the curve.
  */
  Quad = 3,

  /**
      A curve-to operation describing a cubic Bézier curve with 4
      points describing the start point, the two control points and the end point
      of the curve.
  */
  Cubic = 4,

  /**
      A rational quadratic Bézier curve with 3 points describing
      the start point, control point and end point of the curve. A weight for the
      curve will be passed, too.
  */
  Conic = 5,
}

/**
    The type of a node determines what the node is rendering.
*/
enum RenderNodeType
{
  /**
      Error type. No node will ever have this type.
  */
  NotARenderNode = 0,

  /**
      A node containing a stack of children
  */
  ContainerNode = 1,

  /**
      A node drawing a [cairo.surface.Surface]
  */
  CairoNode = 2,

  /**
      A node drawing a single color rectangle
  */
  ColorNode = 3,

  /**
      A node drawing a linear gradient
  */
  LinearGradientNode = 4,

  /**
      A node drawing a repeating linear gradient
  */
  RepeatingLinearGradientNode = 5,

  /**
      A node drawing a radial gradient
  */
  RadialGradientNode = 6,

  /**
      A node drawing a repeating radial gradient
  */
  RepeatingRadialGradientNode = 7,

  /**
      A node drawing a conic gradient
  */
  ConicGradientNode = 8,

  /**
      A node stroking a border around an area
  */
  BorderNode = 9,

  /**
      A node drawing a [gdk.texture.Texture]
  */
  TextureNode = 10,

  /**
      A node drawing an inset shadow
  */
  InsetShadowNode = 11,

  /**
      A node drawing an outset shadow
  */
  OutsetShadowNode = 12,

  /**
      A node that renders its child after applying a matrix transform
  */
  TransformNode = 13,

  /**
      A node that changes the opacity of its child
  */
  OpacityNode = 14,

  /**
      A node that applies a color matrix to every pixel
  */
  ColorMatrixNode = 15,

  /**
      A node that repeats the child's contents
  */
  RepeatNode = 16,

  /**
      A node that clips its child to a rectangular area
  */
  ClipNode = 17,

  /**
      A node that clips its child to a rounded rectangle
  */
  RoundedClipNode = 18,

  /**
      A node that draws a shadow below its child
  */
  ShadowNode = 19,

  /**
      A node that blends two children together
  */
  BlendNode = 20,

  /**
      A node that cross-fades between two children
  */
  CrossFadeNode = 21,

  /**
      A node containing a glyph string
  */
  TextNode = 22,

  /**
      A node that applies a blur
  */
  BlurNode = 23,

  /**
      Debug information that does not affect the rendering
  */
  DebugNode = 24,

  /**
      A node that uses OpenGL fragment shaders to render
  */
  GlShaderNode = 25,

  /**
      A node drawing a [gdk.texture.Texture] scaled and filtered.
  */
  TextureScaleNode = 26,

  /**
      A node that masks one child with another.
  */
  MaskNode = 27,

  /**
      A node that fills a path.
  */
  FillNode = 28,

  /**
      A node that strokes a path.
  */
  StrokeNode = 29,

  /**
      A node that possibly redirects part of the scene graph to a subsurface.
  */
  SubsurfaceNode = 30,
}

/**
    The filters used when scaling texture data.
  
  The actual implementation of each filter is deferred to the
  rendering pipeline.
*/
enum ScalingFilter
{
  /**
      linear interpolation filter
  */
  Linear = 0,

  /**
      nearest neighbor interpolation filter
  */
  Nearest = 1,

  /**
      linear interpolation along each axis,
      plus mipmap generation, with linear interpolation along the mipmap
      levels
  */
  Trilinear = 2,
}

/**
    Errors that can happen during (de)serialization.
*/
enum SerializationError
{
  /**
      The format can not be identified
  */
  UnsupportedFormat = 0,

  /**
      The version of the data is not
      understood
  */
  UnsupportedVersion = 1,

  /**
      The given data may not exist in
      a proper serialization
  */
  InvalidData = 2,
}

/**
    The categories of matrices relevant for GSK and GTK.
  
  Note that any category includes matrices of all later categories.
  So if you want to for example check if a matrix is a 2D matrix,
  `category >= GSK_TRANSFORM_CATEGORY_2D` is the way to do this.
  
  Also keep in mind that rounding errors may cause matrices to not
  conform to their categories. Otherwise, matrix operations done via
  multiplication will not worsen categories. So for the matrix
  multiplication `C = A * B`, `category(C) = MIN (category(A), category(B))`.
*/
enum TransformCategory
{
  /**
      The category of the matrix has not been
      determined.
  */
  Unknown = 0,

  /**
      Analyzing the matrix concluded that it does
      not fit in any other category.
  */
  Any = 1,

  /**
      The matrix is a 3D matrix. This means that
      the w column (the last column) has the values (0, 0, 0, 1).
  */
  _3d = 2,

  /**
      The matrix is a 2D matrix. This is equivalent
      to [graphene.matrix.Matrix.is2d] returning true. In particular, this
      means that Cairo can deal with the matrix.
  */
  _2d = 3,

  /**
      The matrix is a combination of 2D scale
      and 2D translation operations. In particular, this means that any
      rectangle can be transformed exactly using this matrix.
  */
  _2dAffine = 4,

  /**
      The matrix is a 2D translation.
  */
  _2dTranslate = 5,

  /**
      The matrix is the identity matrix.
  */
  Identity = 6,
}
