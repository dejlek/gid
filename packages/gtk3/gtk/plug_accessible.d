module gtk.plug_accessible;

import atk.component;
import atk.component_mixin;
import atk.window;
import atk.window_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window_accessible;

/** */
class PlugAccessible : gtk.window_accessible.WindowAccessible
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_plug_accessible_get_type != &gidSymbolNotFound ? gtk_plug_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  string getId()
  {
    char* _cretval;
    _cretval = gtk_plug_accessible_get_id(cast(GtkPlugAccessible*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
    return _retval;
  }
}
