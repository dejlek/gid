module gtk.hpaned;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.paned;
import gtk.types;

/**
 * The HPaned widget is a container widget with two
 * children arranged horizontally. The division between
 * the two panes is adjustable by the user by dragging
 * a handle. See #GtkPaned for details.
 * GtkHPaned has been deprecated, use #GtkPaned instead.
 */
class HPaned : gtk.paned.Paned
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_hpaned_get_type != &gidSymbolNotFound ? gtk_hpaned_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Create a new #GtkHPaned
   * Returns: the new #GtkHPaned

   * Deprecated: Use [gtk.paned.Paned.new_] with %GTK_ORIENTATION_HORIZONTAL instead
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_hpaned_new();
    this(_cretval, No.Take);
  }
}
