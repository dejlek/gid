module gsk.c.types;

public import gid.basictypes;
public import gdk.c.types;
public import graphene.c.types;
import gsk.types;


// Enums
alias GskBlendMode = gsk.types.BlendMode;
alias GskCorner = gsk.types.Corner;
alias GskFillRule = gsk.types.FillRule;
alias GskGLUniformType = gsk.types.GLUniformType;
alias GskLineCap = gsk.types.LineCap;
alias GskLineJoin = gsk.types.LineJoin;
alias GskMaskMode = gsk.types.MaskMode;
alias GskPathDirection = gsk.types.PathDirection;
alias GskPathForeachFlags = gsk.types.PathForeachFlags;
alias GskPathOperation = gsk.types.PathOperation;
alias GskRenderNodeType = gsk.types.RenderNodeType;
alias GskScalingFilter = gsk.types.ScalingFilter;
alias GskSerializationError = gsk.types.SerializationError;
alias GskTransformCategory = gsk.types.TransformCategory;
/**
    A render node applying a blending function between its two child nodes.
*/
struct GskBlendNode;

/**
    A render node applying a blur effect to its single child.
*/
struct GskBlurNode;

/**
    A render node for a border.
*/
struct GskBorderNode;

/** */
struct GskBroadwayRenderer;

/** */
struct GskBroadwayRendererClass;

/**
    A render node for a Cairo surface.
*/
struct GskCairoNode;

/**
    A GSK renderer that is using cairo.
  
  Since it is using cairo, this renderer cannot support
  3D transformations.
*/
struct GskCairoRenderer;

/** */
struct GskCairoRendererClass;

/**
    A render node applying a rectangular clip to its single child node.
*/
struct GskClipNode;

/**
    A render node controlling the color matrix of its single child node.
*/
struct GskColorMatrixNode;

/**
    A render node for a solid color.
*/
struct GskColorNode;

/**
    A color stop in a gradient node.
*/
struct GskColorStop
{
  /**
      the offset of the color stop
  */
  float offset;

  /**
      the color at the given offset
  */
  GdkRGBA color;
}

/**
    A render node for a conic gradient.
*/
struct GskConicGradientNode;

/**
    A render node that can contain other render nodes.
*/
struct GskContainerNode;

/**
    A render node cross fading between two child nodes.
*/
struct GskCrossFadeNode;

/**
    A render node that emits a debugging message when drawing its
  child node.
*/
struct GskDebugNode;

/**
    A render node filling the area given by [gsk.path.Path]
  and [gsk.types.FillRule] with the child node.
*/
struct GskFillNode;

/** */
struct GskGLRenderer;

/** */
struct GskGLRendererClass;

/**
    A [gsk.glshader.GLShader] is a snippet of GLSL that is meant to run in the
  fragment shader of the rendering pipeline.
  
  A fragment shader gets the coordinates being rendered as input and
  produces the pixel values for that particular pixel. Additionally,
  the shader can declare a set of other input arguments, called
  uniforms (as they are uniform over all the calls to your shader in
  each instance of use). A shader can also receive up to 4
  textures that it can use as input when producing the pixel data.
  
  [gsk.glshader.GLShader] is usually used with [gtk.snapshot.Snapshot.pushGlShader]
  to produce a [gsk.glshader_node.GLShaderNode] in the rendering hierarchy,
  and then its input textures are constructed by rendering the child
  nodes to textures before rendering the shader node itself. (You can
  pass texture nodes as children if you want to directly use a texture
  as input).
  
  The actual shader code is GLSL code that gets combined with
  some other code into the fragment shader. Since the exact
  capabilities of the GPU driver differs between different OpenGL
  drivers and hardware, GTK adds some defines that you can use
  to ensure your GLSL code runs on as many drivers as it can.
  
  If the OpenGL driver is GLES, then the shader language version
  is set to 100, and GSK_GLES will be defined in the shader.
  
  Otherwise, if the OpenGL driver does not support the 3.2 core profile,
  then the shader will run with language version 110 for GL2 and 130 for GL3,
  and GSK_LEGACY will be defined in the shader.
  
  If the OpenGL driver supports the 3.2 code profile, it will be used,
  the shader language version is set to 150, and GSK_GL3 will be defined
  in the shader.
  
  The main function the shader must implement is:
  
  ```glsl
   void mainImage(out vec4 fragColor,
                  in vec2 fragCoord,
                  in vec2 resolution,
                  in vec2 uv)
  ```
  
  Where the input @fragCoord is the coordinate of the pixel we're
  currently rendering, relative to the boundary rectangle that was
  specified in the [gsk.glshader_node.GLShaderNode], and @resolution is the width and
  height of that rectangle. This is in the typical GTK coordinate
  system with the origin in the top left. @uv contains the u and v
  coordinates that can be used to index a texture at the
  corresponding point. These coordinates are in the [0..1]x[0..1]
  region, with 0, 0 being in the lower left corder (which is typical
  for OpenGL).
  
  The output @fragColor should be a RGBA color (with
  premultiplied alpha) that will be used as the output for the
  specified pixel location. Note that this output will be
  automatically clipped to the clip region of the glshader node.
  
  In addition to the function arguments the shader can define
  up to 4 uniforms for textures which must be called u_textureN
  (i.e. u_texture1 to u_texture4) as well as any custom uniforms
  you want of types int, uint, bool, float, vec2, vec3 or vec4.
  
  All textures sources contain premultiplied alpha colors, but if some
  there are outer sources of colors there is a gsk_premultiply() helper
  to compute premultiplication when needed.
  
  Note that GTK parses the uniform declarations, so each uniform has to
  be on a line by itself with no other code, like so:
  
  ```glsl
  uniform float u_time;
  uniform vec3 u_color;
  uniform sampler2D u_texture1;
  uniform sampler2D u_texture2;
  ```
  
  GTK uses the "gsk" namespace in the symbols it uses in the
  shader, so your code should not use any symbols with the prefix gsk
  or GSK. There are some helper functions declared that you can use:
  
  ```glsl
  vec4 GskTexture(sampler2D sampler, vec2 texCoords);
  ```
  
  This samples a texture (e.g. u_texture1) at the specified
  coordinates, and contains some helper ifdefs to ensure that
  it works on all OpenGL versions.
  
  You can compile the shader yourself using [gsk.glshader.GLShader.compile],
  otherwise the GSK renderer will do it when it handling the glshader
  node. If errors occurs, the returned @error will include the glsl
  sources, so you can see what GSK was passing to the compiler. You
  can also set GSK_DEBUG=shaders in the environment to see the sources
  and other relevant information about all shaders that GSK is handling.
  
  # An example shader
  
  ```glsl
  uniform float position;
  uniform sampler2D u_texture1;
  uniform sampler2D u_texture2;
  
  void mainImage(out vec4 fragColor,
                 in vec2 fragCoord,
                 in vec2 resolution,
                 in vec2 uv) {
    vec4 source1 = GskTexture(u_texture1, uv);
    vec4 source2 = GskTexture(u_texture2, uv);
  
    fragColor = position * source1 + (1.0 - position) * source2;
  }
  ```
*/
struct GskGLShader;

/** */
struct GskGLShaderClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A render node using a GL shader when drawing its children nodes.
*/
struct GskGLShaderNode;

/**
    A render node for an inset shadow.
*/
struct GskInsetShadowNode;

/**
    A render node for a linear gradient.
*/
struct GskLinearGradientNode;

/**
    A render node masking one child node with another.
*/
struct GskMaskNode;

/**
    A render node controlling the opacity of its single child node.
*/
struct GskOpacityNode;

/**
    A render node for an outset shadow.
*/
struct GskOutsetShadowNode;

/**
    A location in a parse buffer.
*/
struct GskParseLocation
{
  /**
      the offset of the location in the parse buffer, as bytes
  */
  size_t bytes;

  /**
      the offset of the location in the parse buffer, as characters
  */
  size_t chars;

  /**
      the line of the location in the parse buffer
  */
  size_t lines;

  /**
      the position in the line, as bytes
  */
  size_t lineBytes;

  /**
      the position in the line, as characters
  */
  size_t lineChars;
}

/**
    A [gsk.path.Path] describes lines and curves that are more complex
  than simple rectangles.
  
  Paths can used for rendering (filling or stroking) and for animations
  (e.g. as trajectories).
  
  [gsk.path.Path] is an immutable, opaque, reference-counted struct.
  After creation, you cannot change the types it represents. Instead,
  new [gsk.path.Path] objects have to be created. The [gsk.path_builder.PathBuilder]
  structure is meant to help in this endeavor.
  
  Conceptually, a path consists of zero or more contours (continuous, connected
  curves), each of which may or may not be closed. Contours are typically
  constructed from Bézier segments.
  
  <picture>
    <source srcset="path-dark.png" media="(prefers-color-scheme: dark)">
    <img alt="A Path" src="path-light.png">
  </picture>
*/
struct GskPath;

/**
    [gsk.path_builder.PathBuilder] is an auxiliary object for constructing
  [gsk.path.Path] objects.
  
  A path is constructed like this:
  
  ```c
  GskPath *
  construct_path (void)
  {
    GskPathBuilder *builder;
  
    builder = gsk_path_builder_new ();
  
    // add contours to the path here
  
    return gsk_path_builder_free_to_path (builder);
  ```
  
  Adding contours to the path can be done in two ways.
  The easiest option is to use the `gsk_path_builder_add_*` group
  of functions that add predefined contours to the current path,
  either common shapes like [gsk.path_builder.PathBuilder.addCircle]
  or by adding from other paths like [gsk.path_builder.PathBuilder.addPath].
  
  The `gsk_path_builder_add_*` methods always add complete contours,
  and do not use or modify the current point.
  
  The other option is to define each line and curve manually with
  the `gsk_path_builder_*_to` group of functions. You start with
  a call to [gsk.path_builder.PathBuilder.moveTo] to set the starting point
  and then use multiple calls to any of the drawing functions to
  move the pen along the plane. Once you are done, you can call
  [gsk.path_builder.PathBuilder.close] to close the path by connecting it
  back with a line to the starting point.
  
  This is similar to how paths are drawn in Cairo.
  
  Note that [gsk.path_builder.PathBuilder] will reduce the degree of added Bézier
  curves as much as possible, to simplify rendering.
*/
struct GskPathBuilder;

/**
    [gsk.path_measure.PathMeasure] is an object that allows measurements
  on [gsk.path.Path]s such as determining the length of the path.
  
  Many measuring operations require sampling the path length
  at intermediate points. Therefore, a [gsk.path_measure.PathMeasure] has
  a tolerance that determines what precision is required
  for such approximations.
  
  A [gsk.path_measure.PathMeasure] struct is a reference counted struct
  and should be treated as opaque.
*/
struct GskPathMeasure;

/**
    [gsk.path_point.PathPoint] is an opaque type representing a point on a path.
  
  It can be queried for properties of the path at that point, such as
  its tangent or its curvature.
  
  To obtain a [gsk.path_point.PathPoint], use [gsk.path.Path.getClosestPoint],
  [gsk.path.Path.getStartPoint], [gsk.path.Path.getEndPoint]
  or [gsk.path_measure.PathMeasure.getPoint].
  
  Note that [gsk.path_point.PathPoint] structs are meant to be stack-allocated,
  and don't hold a reference to the path object they are obtained from.
  It is the callers responsibility to keep a reference to the path
  as long as the [gsk.path_point.PathPoint] is used.
*/
struct GskPathPoint;

/**
    A render node for a radial gradient.
*/
struct GskRadialGradientNode;

/**
    [gsk.render_node.RenderNode] is the basic block in a scene graph to be
  rendered using [gsk.renderer.Renderer].
  
  Each node has a parent, except the top-level node; each node may have
  children nodes.
  
  Each node has an associated drawing surface, which has the size of
  the rectangle set when creating it.
  
  Render nodes are meant to be transient; once they have been associated
  to a [gsk.renderer.Renderer] it's safe to release any reference you have on
  them. All [gsk.render_node.RenderNode]s are immutable, you can only specify their
  properties during construction.
*/
struct GskRenderNode;

/**
    [gsk.renderer.Renderer] is a class that renders a scene graph defined via a
  tree of [gsk.render_node.RenderNode] instances.
  
  Typically you will use a [gsk.renderer.Renderer] instance to repeatedly call
  [gsk.renderer.Renderer.render] to update the contents of its associated
  [gdk.surface.Surface].
  
  It is necessary to realize a [gsk.renderer.Renderer] instance using
  [gsk.renderer.Renderer.realize] before calling [gsk.renderer.Renderer.render],
  in order to create the appropriate windowing system resources needed
  to render the scene.
*/
struct GskRenderer;

/** */
struct GskRendererClass;

/**
    A render node repeating its single child node.
*/
struct GskRepeatNode;

/**
    A render node for a repeating linear gradient.
*/
struct GskRepeatingLinearGradientNode;

/**
    A render node for a repeating radial gradient.
*/
struct GskRepeatingRadialGradientNode;

/**
    A render node applying a rounded rectangle clip to its single child.
*/
struct GskRoundedClipNode;

/**
    A rectangular region with rounded corners.
  
  Application code should normalize rectangles using
  [gsk.rounded_rect.RoundedRect.normalize]; this function will ensure that
  the bounds of the rectangle are normalized and ensure that the corner
  values are positive and the corners do not overlap.
  
  All functions taking a [gsk.rounded_rect.RoundedRect] as an argument will internally
  operate on a normalized copy; all functions returning a [gsk.rounded_rect.RoundedRect]
  will always return a normalized one.
  
  The algorithm used for normalizing corner sizes is described in
  [the CSS specification](https://drafts.csswg.org/css-backgrounds-3/#border-radius).
*/
struct GskRoundedRect
{
  /**
      the bounds of the rectangle
  */
  graphene_rect_t bounds;

  /**
      the size of the 4 rounded corners
  */
  graphene_size_t[4] corner;
}

/**
    An object to build the uniforms data for a [gsk.glshader.GLShader].
*/
struct GskShaderArgsBuilder;

/**
    The shadow parameters in a shadow node.
*/
struct GskShadow
{
  /**
      the color of the shadow
  */
  GdkRGBA color;

  /**
      the horizontal offset of the shadow
  */
  float dx;

  /**
      the vertical offset of the shadow
  */
  float dy;

  /**
      the radius of the shadow
  */
  float radius;
}

/**
    A render node drawing one or more shadows behind its single child node.
*/
struct GskShadowNode;

/**
    A [gsk.stroke.Stroke] struct collects the parameters that influence
  the operation of stroking a path.
*/
struct GskStroke;

/**
    A render node that will fill the area determined by stroking the the given
  [gsk.path.Path] using the [gsk.stroke.Stroke] attributes.
*/
struct GskStrokeNode;

/**
    A render node that potentially diverts a part of the scene graph to a subsurface.
*/
struct GskSubsurfaceNode;

/**
    A render node drawing a set of glyphs.
*/
struct GskTextNode;

/**
    A render node for a [gdk.texture.Texture].
*/
struct GskTextureNode;

/**
    A render node for a [gdk.texture.Texture].
*/
struct GskTextureScaleNode;

/**
    [gsk.transform.Transform] is an object to describe transform matrices.
  
  Unlike [graphene.matrix.Matrix], [gsk.transform.Transform] retains the steps in how
  a transform was constructed, and allows inspecting them. It is modeled
  after the way CSS describes transforms.
  
  [gsk.transform.Transform] objects are immutable and cannot be changed after creation.
  This means code can safely expose them as properties of objects without
  having to worry about others changing them.
*/
struct GskTransform;

/**
    A render node applying a [gsk.transform.Transform] to its single child node.
*/
struct GskTransformNode;

/**
    A GSK renderer that is using Vulkan.
  
  This renderer will fail to realize if Vulkan is not supported.
*/
struct GskVulkanRenderer;

/** */
struct GskVulkanRendererClass;

alias extern(C) void function(const(GskParseLocation)* start, const(GskParseLocation)* end, const(GError)* error, void* userData) GskParseErrorFunc;

alias extern(C) bool function(GskPathOperation op, const(graphene_point_t)* pts, size_t nPts, float weight, void* userData) GskPathForeachFunc;

