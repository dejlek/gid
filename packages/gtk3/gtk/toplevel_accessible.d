module gtk.toplevel_accessible;

import atk.object;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/** */
class ToplevelAccessible : atk.object.ObjectAtk
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_toplevel_accessible_get_type != &gidSymbolNotFound ? gtk_toplevel_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  gtk.window.Window[] getChildren()
  {
    GList* _cretval;
    _cretval = gtk_toplevel_accessible_get_children(cast(GtkToplevelAccessible*)cPtr);
    auto _retval = gListToD!(gtk.window.Window, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }
}
