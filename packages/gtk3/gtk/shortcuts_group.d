module gtk.shortcuts_group;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
    A GtkShortcutsGroup represents a group of related keyboard shortcuts
  or gestures. The group has a title. It may optionally be associated with
  a view of the application, which can be used to show only relevant shortcuts
  depending on the application context.
  
  This widget is only meant to be used with #GtkShortcutsWindow.
*/
class ShortcutsGroup : gtk.box.Box
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcuts_group_get_type != &gidSymbolNotFound ? gtk_shortcuts_group_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ShortcutsGroup self()
  {
    return this;
  }
}
