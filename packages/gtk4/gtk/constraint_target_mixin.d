module gtk.constraint_target_mixin;

public import gtk.constraint_target_iface_proxy;
public import gid.global;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
 * The `GtkConstraintTarget` interface is implemented by objects that
 * can be used as source or target in `GtkConstraint`s.
 * Besides `GtkWidget`, it is also implemented by `GtkConstraintGuide`.
 */
template ConstraintTargetT()
{
}
