module graphene.types;

import gid.gid;
import graphene.c.functions;
import graphene.c.types;


// Structs

/** */
alias Simd4F = graphene_simd4f_t;

/**
    Specify the order of the rotations on each axis.
  
  The `GRAPHENE_EULER_ORDER_DEFAULT` value is special, and is used
  as an alias for one of the other orders.
*/
enum EulerOrder
{
  /**
      Rotate in the default order; the
      default order is one of the following enumeration values
  */
  Default = -1,

  /**
      Rotate in the X, Y, and Z order. Deprecated in
      Graphene 1.10, it's an alias for `GRAPHENE_EULER_ORDER_SXYZ`
  */
  Xyz = 0,

  /**
      Rotate in the Y, Z, and X order. Deprecated in
      Graphene 1.10, it's an alias for `GRAPHENE_EULER_ORDER_SYZX`
  */
  Yzx = 1,

  /**
      Rotate in the Z, X, and Y order. Deprecated in
      Graphene 1.10, it's an alias for `GRAPHENE_EULER_ORDER_SZXY`
  */
  Zxy = 2,

  /**
      Rotate in the X, Z, and Y order. Deprecated in
      Graphene 1.10, it's an alias for `GRAPHENE_EULER_ORDER_SXZY`
  */
  Xzy = 3,

  /**
      Rotate in the Y, X, and Z order. Deprecated in
      Graphene 1.10, it's an alias for `GRAPHENE_EULER_ORDER_SYXZ`
  */
  Yxz = 4,

  /**
      Rotate in the Z, Y, and X order. Deprecated in
      Graphene 1.10, it's an alias for `GRAPHENE_EULER_ORDER_SZYX`
  */
  Zyx = 5,

  /**
      Defines a static rotation along the X, Y, and Z axes (Since: 1.10)
  */
  Sxyz = 6,

  /**
      Defines a static rotation along the X, Y, and X axes (Since: 1.10)
  */
  Sxyx = 7,

  /**
      Defines a static rotation along the X, Z, and Y axes (Since: 1.10)
  */
  Sxzy = 8,

  /**
      Defines a static rotation along the X, Z, and X axes (Since: 1.10)
  */
  Sxzx = 9,

  /**
      Defines a static rotation along the Y, Z, and X axes (Since: 1.10)
  */
  Syzx = 10,

  /**
      Defines a static rotation along the Y, Z, and Y axes (Since: 1.10)
  */
  Syzy = 11,

  /**
      Defines a static rotation along the Y, X, and Z axes (Since: 1.10)
  */
  Syxz = 12,

  /**
      Defines a static rotation along the Y, X, and Y axes (Since: 1.10)
  */
  Syxy = 13,

  /**
      Defines a static rotation along the Z, X, and Y axes (Since: 1.10)
  */
  Szxy = 14,

  /**
      Defines a static rotation along the Z, X, and Z axes (Since: 1.10)
  */
  Szxz = 15,

  /**
      Defines a static rotation along the Z, Y, and X axes (Since: 1.10)
  */
  Szyx = 16,

  /**
      Defines a static rotation along the Z, Y, and Z axes (Since: 1.10)
  */
  Szyz = 17,

  /**
      Defines a relative rotation along the Z, Y, and X axes (Since: 1.10)
  */
  Rzyx = 18,

  /**
      Defines a relative rotation along the X, Y, and X axes (Since: 1.10)
  */
  Rxyx = 19,

  /**
      Defines a relative rotation along the Y, Z, and X axes (Since: 1.10)
  */
  Ryzx = 20,

  /**
      Defines a relative rotation along the X, Z, and X axes (Since: 1.10)
  */
  Rxzx = 21,

  /**
      Defines a relative rotation along the X, Z, and Y axes (Since: 1.10)
  */
  Rxzy = 22,

  /**
      Defines a relative rotation along the Y, Z, and Y axes (Since: 1.10)
  */
  Ryzy = 23,

  /**
      Defines a relative rotation along the Z, X, and Y axes (Since: 1.10)
  */
  Rzxy = 24,

  /**
      Defines a relative rotation along the Y, X, and Y axes (Since: 1.10)
  */
  Ryxy = 25,

  /**
      Defines a relative rotation along the Y, X, and Z axes (Since: 1.10)
  */
  Ryxz = 26,

  /**
      Defines a relative rotation along the Z, X, and Z axes (Since: 1.10)
  */
  Rzxz = 27,

  /**
      Defines a relative rotation along the X, Y, and Z axes (Since: 1.10)
  */
  Rxyz = 28,

  /**
      Defines a relative rotation along the Z, Y, and Z axes (Since: 1.10)
  */
  Rzyz = 29,
}

/**
    The type of intersection.
*/
enum RayIntersectionKind
{
  /**
      No intersection
  */
  None = 0,

  /**
      The ray is entering the intersected
      object
  */
  Enter = 1,

  /**
      The ray is leaving the intersected
      object
  */
  Leave = 2,
}

/** */
enum PI = 3.141593;

/** */
enum PI_2 = 1.570796;

/**
    Evaluates to the number of components of a #graphene_vec2_t.
  
  This symbol is useful when declaring a C array of floating
  point values to be used with [graphene.vec2.Vec2.initFromFloat] and
  [graphene.vec2.Vec2.toFloat], e.g.
  
  ```
    float v[GRAPHENE_VEC2_LEN];
  
    // vec is defined elsewhere
    graphene_vec2_to_float (&vec, v);
  
    for (int i = 0; i < GRAPHENE_VEC2_LEN; i++)
      fprintf (stdout, "component %d: %g\n", i, v[i]);
  ```
*/
enum VEC2_LEN = 2;

/**
    Evaluates to the number of components of a #graphene_vec3_t.
  
  This symbol is useful when declaring a C array of floating
  point values to be used with [graphene.vec3.Vec3.initFromFloat] and
  [graphene.vec3.Vec3.toFloat], e.g.
  
  ```
    float v[GRAPHENE_VEC3_LEN];
  
    // vec is defined elsewhere
    graphene_vec3_to_float (&vec, v);
  
    for (int i = 0; i < GRAPHENE_VEC2_LEN; i++)
      fprintf (stdout, "component %d: %g\n", i, v[i]);
  ```
*/
enum VEC3_LEN = 3;

/**
    Evaluates to the number of components of a #graphene_vec4_t.
  
  This symbol is useful when declaring a C array of floating
  point values to be used with [graphene.vec4.Vec4.initFromFloat] and
  [graphene.vec4.Vec4.toFloat], e.g.
  
  ```
    float v[GRAPHENE_VEC4_LEN];
  
    // vec is defined elsewhere
    graphene_vec4_to_float (&vec, v);
  
    for (int i = 0; i < GRAPHENE_VEC4_LEN; i++)
      fprintf (stdout, "component %d: %g\n", i, v[i]);
  ```
*/
enum VEC4_LEN = 4;
