module Gtk.ConstraintTarget;

public import Gtk.ConstraintTargetIfaceProxy;
import Gid.gid;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * The `GtkConstraintTarget` interface is implemented by objects that
 * can be used as source or target in `GtkConstraint`s.
 * Besides `GtkWidget`, it is also implemented by `GtkConstraintGuide`.
 */
interface ConstraintTarget
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_constraint_target_get_type != &gidSymbolNotFound ? gtk_constraint_target_get_type() : cast(GType)0;
  }
}
