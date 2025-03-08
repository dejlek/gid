module graphene.size;

import gid.gid;
import gobject.boxed;
import graphene.c.functions;
import graphene.c.types;
import graphene.types;

/**
    A size.
*/
class Size : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(graphene_size_t.sizeof), Yes.take);
  }

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"dup" dup = No.dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())graphene_size_get_type != &gidSymbolNotFound ? graphene_size_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property float width()
  {
    return (cast(graphene_size_t*)cPtr).width;
  }

  @property void width(float propval)
  {
    (cast(graphene_size_t*)cPtr).width = propval;
  }

  @property float height()
  {
    return (cast(graphene_size_t*)cPtr).height;
  }

  @property void height(float propval)
  {
    (cast(graphene_size_t*)cPtr).height = propval;
  }

  /**
      Allocates a new #graphene_size_t.
    
    The contents of the returned value are undefined.
    Returns:     the newly allocated #graphene_size_t
  */
  static graphene.size.Size alloc()
  {
    graphene_size_t* _cretval;
    _cretval = graphene_size_alloc();
    auto _retval = _cretval ? new graphene.size.Size(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Checks whether the two give #graphene_size_t are equal.
    Params:
      b =       a #graphene_size_t
    Returns:     `true` if the sizes are equal
  */
  bool equal(graphene.size.Size b)
  {
    bool _retval;
    _retval = graphene_size_equal(cast(const(graphene_size_t)*)cPtr, b ? cast(const(graphene_size_t)*)b.cPtr(No.dup) : null);
    return _retval;
  }

  /**
      Initializes a #graphene_size_t using the given width and height.
    Params:
      width =       the width
      height =       the height
    Returns:     the initialized #graphene_size_t
  */
  graphene.size.Size init_(float width, float height)
  {
    graphene_size_t* _cretval;
    _cretval = graphene_size_init(cast(graphene_size_t*)cPtr, width, height);
    auto _retval = _cretval ? new graphene.size.Size(cast(void*)_cretval, No.take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_size_t using the width and height of
    the given src.
    Params:
      src =       a #graphene_size_t
    Returns:     the initialized #graphene_size_t
  */
  graphene.size.Size initFromSize(graphene.size.Size src)
  {
    graphene_size_t* _cretval;
    _cretval = graphene_size_init_from_size(cast(graphene_size_t*)cPtr, src ? cast(const(graphene_size_t)*)src.cPtr(No.dup) : null);
    auto _retval = _cretval ? new graphene.size.Size(cast(void*)_cretval, No.take) : null;
    return _retval;
  }

  /**
      Linearly interpolates the two given #graphene_size_t using the given
    interpolation factor.
    Params:
      b =       a #graphene_size_t
      factor =       the linear interpolation factor
      res =       return location for the interpolated size
  */
  void interpolate(graphene.size.Size b, double factor, out graphene.size.Size res)
  {
    graphene_size_t _res;
    graphene_size_interpolate(cast(const(graphene_size_t)*)cPtr, b ? cast(const(graphene_size_t)*)b.cPtr(No.dup) : null, factor, &_res);
    res = new graphene.size.Size(cast(void*)&_res, No.take);
  }

  /**
      Scales the components of a #graphene_size_t using the given factor.
    Params:
      factor =       the scaling factor
      res =       return location for the scaled size
  */
  void scale(float factor, out graphene.size.Size res)
  {
    graphene_size_t _res;
    graphene_size_scale(cast(const(graphene_size_t)*)cPtr, factor, &_res);
    res = new graphene.size.Size(cast(void*)&_res, No.take);
  }

  /**
      A constant pointer to a zero #graphene_size_t, useful for
    equality checks and interpolations.
    Returns:     a constant size
  */
  static graphene.size.Size zero()
  {
    const(graphene_size_t)* _cretval;
    _cretval = graphene_size_zero();
    auto _retval = _cretval ? new graphene.size.Size(cast(void*)_cretval, No.take) : null;
    return _retval;
  }
}
