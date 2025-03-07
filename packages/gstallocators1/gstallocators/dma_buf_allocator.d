module gstallocators.dma_buf_allocator;

import gid.gid;
import gst.allocator;
import gst.memory;
import gstallocators.c.functions;
import gstallocators.c.types;
import gstallocators.fd_allocator;
import gstallocators.types;

/**
    Base class for allocators with dmabuf-backed memory
*/
class DmaBufAllocator : gstallocators.fd_allocator.FdAllocator
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_dmabuf_allocator_get_type != &gidSymbolNotFound ? gst_dmabuf_allocator_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Return a new dmabuf allocator.
    Returns:     a new dmabuf allocator. Use [gst.object.ObjectGst.unref] to
      release the allocator after usage
  */
  this()
  {
    GstAllocator* _cretval;
    _cretval = gst_dmabuf_allocator_new();
    this(_cretval, Yes.Take);
  }

  /**
      Return a [gst.memory.Memory] that wraps a dmabuf file descriptor.
    Params:
      allocator =       allocator to be used for this memory
      fd =       dmabuf file descriptor
      size =       memory size
    Returns:     a GstMemory based on allocator.
      When the buffer will be released dmabuf allocator will close the fd.
      The memory is only mmapped on [gst.buffer.Buffer.map] request.
  */
  static gst.memory.Memory alloc(gst.allocator.Allocator allocator, int fd, size_t size)
  {
    GstMemory* _cretval;
    _cretval = gst_dmabuf_allocator_alloc(allocator ? cast(GstAllocator*)allocator.cPtr(No.Dup) : null, fd, size);
    auto _retval = _cretval ? new gst.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Return a [gst.memory.Memory] that wraps a dmabuf file descriptor.
    Params:
      allocator =       allocator to be used for this memory
      fd =       dmabuf file descriptor
      size =       memory size
      flags =       extra #GstFdMemoryFlags
    Returns:     a GstMemory based on allocator.
      
      When the buffer will be released the allocator will close the fd unless
      the `GST_FD_MEMORY_FLAG_DONT_CLOSE` flag is specified.
      The memory is only mmapped on gst_buffer_mmap() request.
  */
  static gst.memory.Memory allocWithFlags(gst.allocator.Allocator allocator, int fd, size_t size, gstallocators.types.FdMemoryFlags flags)
  {
    GstMemory* _cretval;
    _cretval = gst_dmabuf_allocator_alloc_with_flags(allocator ? cast(GstAllocator*)allocator.cPtr(No.Dup) : null, fd, size, flags);
    auto _retval = _cretval ? new gst.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
