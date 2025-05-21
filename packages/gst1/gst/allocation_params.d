/// Module for [AllocationParams] class
module gst.allocation_params;

import gid.gid;
import gobject.boxed;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    Parameters to control the allocation of memory
*/
class AllocationParams : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_allocation_params_get_type != &gidSymbolNotFound ? gst_allocation_params_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AllocationParams self()
  {
    return this;
  }

  /**
      Get `flags` field.
      Returns: flags to control allocation
  */
  @property gst.types.MemoryFlags flags()
  {
    return cast(gst.types.MemoryFlags)(cast(GstAllocationParams*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = flags to control allocation
  */
  @property void flags(gst.types.MemoryFlags propval)
  {
    (cast(GstAllocationParams*)this._cPtr).flags = cast(GstMemoryFlags)propval;
  }

  /**
      Get `align_` field.
      Returns: the desired alignment of the memory
  */
  @property size_t align_()
  {
    return (cast(GstAllocationParams*)this._cPtr).align_;
  }

  /**
      Set `align_` field.
      Params:
        propval = the desired alignment of the memory
  */
  @property void align_(size_t propval)
  {
    (cast(GstAllocationParams*)this._cPtr).align_ = propval;
  }

  /**
      Get `prefix` field.
      Returns: the desired prefix
  */
  @property size_t prefix()
  {
    return (cast(GstAllocationParams*)this._cPtr).prefix;
  }

  /**
      Set `prefix` field.
      Params:
        propval = the desired prefix
  */
  @property void prefix(size_t propval)
  {
    (cast(GstAllocationParams*)this._cPtr).prefix = propval;
  }

  /**
      Get `padding` field.
      Returns: the desired padding
  */
  @property size_t padding()
  {
    return (cast(GstAllocationParams*)this._cPtr).padding;
  }

  /**
      Set `padding` field.
      Params:
        propval = the desired padding
  */
  @property void padding(size_t propval)
  {
    (cast(GstAllocationParams*)this._cPtr).padding = propval;
  }

  /**
      Create a new #GstAllocationParams on the heap.  This function is for
      use in GStreamer language bindings.  In your own code, you can just
      declare a #GstAllocationParams on the stack or in a struct, and
      call [gst.allocation_params.AllocationParams.init_] to initialize it.
      
      You do not need to call [gst.allocation_params.AllocationParams.init_] on the instance
      returned by this function.
      Returns: a new #GstAllocationParams
  */
  this()
  {
    GstAllocationParams* _cretval;
    _cretval = gst_allocation_params_new();
    this(_cretval, Yes.Take);
  }

  /**
      Create a copy of params.
      Returns: a new #GstAllocationParams.
  */
  gst.allocation_params.AllocationParams copy()
  {
    GstAllocationParams* _cretval;
    _cretval = gst_allocation_params_copy(cast(const(GstAllocationParams)*)this._cPtr);
    auto _retval = _cretval ? new gst.allocation_params.AllocationParams(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Initialize params to its default values
  */
  void init_()
  {
    gst_allocation_params_init(cast(GstAllocationParams*)this._cPtr);
  }
}
