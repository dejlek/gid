module graphene.c.types;

public import gid.basictypes;
public import gobject.c.types;
import graphene.types;


// Enums
alias graphene_euler_order_t = graphene.types.EulerOrder;
alias graphene_ray_intersection_kind_t = graphene.types.RayIntersectionKind;
/**
    A 3D box, described as the volume between a minimum and
  a maximum vertices.
*/
struct graphene_box_t
{
  /** */
  graphene_vec3_t min;

  /** */
  graphene_vec3_t max;
}

/**
    Describe a rotation using Euler angles.
  
  The contents of the #graphene_euler_t structure are private
  and should never be accessed directly.
*/
struct graphene_euler_t
{
  /** */
  graphene_vec3_t angles;

  /** */
  graphene_euler_order_t order;
}

/**
    A 3D volume delimited by 2D clip planes.
  
  The contents of the [graphene.frustum.Frustum] are private, and should not be
  modified directly.
*/
struct graphene_frustum_t
{
  /** */
  graphene_plane_t[6] planes;
}

/**
    A structure capable of holding a 4x4 matrix.
  
  The contents of the #graphene_matrix_t structure are private and
  should never be accessed directly.
*/
struct graphene_matrix_t
{
  /** */
  graphene_simd4x4f_t value;
}

/**
    A 2D plane that extends infinitely in a 3D volume.
  
  The contents of the [graphene.plane.Plane] are private, and should not be
  modified directly.
*/
struct graphene_plane_t
{
  /** */
  graphene_vec3_t normal;

  /** */
  float constant;
}

/**
    A point with two coordinates.
*/
struct graphene_point_t
{
  /**
      the X coordinate of the point
  */
  float x;

  /**
      the Y coordinate of the point
  */
  float y;
}

/**
    A point with three components: X, Y, and Z.
*/
struct graphene_point3d_t
{
  /**
      the X coordinate
  */
  float x;

  /**
      the Y coordinate
  */
  float y;

  /**
      the Z coordinate
  */
  float z;
}

/**
    A 4 vertex quadrilateral, as represented by four #graphene_point_t.
  
  The contents of a #graphene_quad_t are private and should never be
  accessed directly.
*/
struct graphene_quad_t
{
  /** */
  graphene_point_t[4] points;
}

/**
    A quaternion.
  
  The contents of the #graphene_quaternion_t structure are private
  and should never be accessed directly.
*/
struct graphene_quaternion_t
{
  /** */
  float x;

  /** */
  float y;

  /** */
  float z;

  /** */
  float w;
}

/**
    A ray emitted from an origin in a given direction.
  
  The contents of the [graphene.ray.Ray] structure are private, and should not
  be modified directly.
*/
struct graphene_ray_t
{
  /** */
  graphene_vec3_t origin;

  /** */
  graphene_vec3_t direction;
}

/**
    The location and size of a rectangle region.
  
  The width and height of a #graphene_rect_t can be negative; for instance,
  a #graphene_rect_t with an origin of [ 0, 0 ] and a size of [ 10, 10 ] is
  equivalent to a #graphene_rect_t with an origin of [ 10, 10 ] and a size
  of [ -10, -10 ].
  
  Application code can normalize rectangles using [graphene.rect.Rect.normalize];
  this function will ensure that the width and height of a rectangle are
  positive values. All functions taking a #graphene_rect_t as an argument
  will internally operate on a normalized copy; all functions returning a
  #graphene_rect_t will always return a normalized rectangle.
*/
struct graphene_rect_t
{
  /**
      the coordinates of the origin of the rectangle
  */
  graphene_point_t origin;

  /**
      the size of the rectangle
  */
  graphene_size_t size;
}

/** */
struct graphene_simd4f_t
{
  /** */
  float x;

  /** */
  float y;

  /** */
  float z;

  /** */
  float w;
}

/** */
struct graphene_simd4x4f_t
{
  /** */
  graphene_simd4f_t x;

  /** */
  graphene_simd4f_t y;

  /** */
  graphene_simd4f_t z;

  /** */
  graphene_simd4f_t w;
}

/**
    A size.
*/
struct graphene_size_t
{
  /**
      the width
  */
  float width;

  /**
      the height
  */
  float height;
}

/**
    A sphere, represented by its center and radius.
*/
struct graphene_sphere_t
{
  /** */
  graphene_vec3_t center;

  /** */
  float radius;
}

/**
    A triangle.
*/
struct graphene_triangle_t
{
  /** */
  graphene_vec3_t a;

  /** */
  graphene_vec3_t b;

  /** */
  graphene_vec3_t c;
}

/**
    A structure capable of holding a vector with two dimensions, x and y.
  
  The contents of the #graphene_vec2_t structure are private and should
  never be accessed directly.
*/
struct graphene_vec2_t
{
  /** */
  graphene_simd4f_t value;
}

/**
    A structure capable of holding a vector with three dimensions: x, y, and z.
  
  The contents of the #graphene_vec3_t structure are private and should
  never be accessed directly.
*/
struct graphene_vec3_t
{
  /** */
  graphene_simd4f_t value;
}

/**
    A structure capable of holding a vector with four dimensions: x, y, z, and w.
  
  The contents of the #graphene_vec4_t structure are private and should
  never be accessed directly.
*/
struct graphene_vec4_t
{
  /** */
  graphene_simd4f_t value;
}

