module Arrow.MemoryPool;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class MemoryPool : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_memory_pool_get_type != &gidSymbolNotFound ? garrow_memory_pool_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  static MemoryPool default_()
  {
    GArrowMemoryPool* _cretval;
    _cretval = garrow_memory_pool_default();
    auto _retval = ObjectG.getDObject!MemoryPool(cast(GArrowMemoryPool*)_cretval, Yes.Take);
    return _retval;
  }

  string getBackendName()
  {
    char* _cretval;
    _cretval = garrow_memory_pool_get_backend_name(cast(GArrowMemoryPool*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  long getBytesAllocated()
  {
    long _retval;
    _retval = garrow_memory_pool_get_bytes_allocated(cast(GArrowMemoryPool*)cPtr);
    return _retval;
  }

  /**
   * Return peak memory allocation in this memory pool.
   * Returns: Maximum bytes allocated. If not known $(LPAREN)or not implemented$(RPAREN),
   *   returns -1.
   */
  long getMaxMemory()
  {
    long _retval;
    _retval = garrow_memory_pool_get_max_memory(cast(GArrowMemoryPool*)cPtr);
    return _retval;
  }
}
