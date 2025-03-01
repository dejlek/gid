module gtk.constraint_target;

public import gtk.constraint_target_iface_proxy;
import gid.global;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * The `GtkConstraintTarget` interface is implemented by objects that
 * can be used as source or target in `GtkConstraint`s.
 * Besides `GtkWidget`, it is also implemented by `GtkConstraintGuide`.
 */
interface ConstraintTarget
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_constraint_target_get_type != &gidSymbolNotFound ? gtk_constraint_target_get_type() : cast(GType)0;
  }
}
