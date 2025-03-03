module gtk.socket_accessible;

import atk.component;
import atk.component_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

class SocketAccessible : gtk.container_accessible.ContainerAccessible
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_socket_accessible_get_type != &gidSymbolNotFound ? gtk_socket_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  void embed(string path)
  {
    char* _path = path.toCString(No.Alloc);
    gtk_socket_accessible_embed(cast(GtkSocketAccessible*)cPtr, _path);
  }
}
