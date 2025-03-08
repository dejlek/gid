module gstallocators.phys_memory_allocator_iface_proxy;

import gobject.object;
import gstallocators.phys_memory_allocator;
import gstallocators.phys_memory_allocator_mixin;

/// Proxy object for GstAllocators.PhysMemoryAllocator interface when a GObject has no applicable D binding
class PhysMemoryAllocatorIfaceProxy : IfaceProxy, gstallocators.phys_memory_allocator.PhysMemoryAllocator
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gstallocators.phys_memory_allocator.PhysMemoryAllocator);
  }

  mixin PhysMemoryAllocatorT!();
}
