/// Module for [UndoManagerIfaceProxy] interface proxy object
module gtksource.undo_manager_iface_proxy;

import gobject.object;
import gtksource.undo_manager;
import gtksource.undo_manager_mixin;

/// Proxy object for [GtkSource.UndoManager] interface when a GObject has no applicable D binding
class UndoManagerIfaceProxy : IfaceProxy, gtksource.undo_manager.UndoManager
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gtksource.undo_manager.UndoManager);
  }

  mixin UndoManagerT!();
}
