module gobject.binding_group;

import gid.global;
import gobject.c.functions;
import gobject.c.types;
import gobject.closure;
import gobject.object;
import gobject.types;

/**
 * `GBindingGroup` can be used to bind multiple properties
 * from an object collectively.
 * Use the various methods to bind properties from a single source
 * object to multiple destination objects. Properties can be bound
 * bidirectionally and are connected when the source object is set
 * with [gobject.binding_group.BindingGroup.setSource].
 */
class BindingGroup : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_binding_group_get_type != &gidSymbolNotFound ? g_binding_group_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new #GBindingGroup.
   * Returns: a new #GBindingGroup
   */
  this()
  {
    GBindingGroup* _cretval;
    _cretval = g_binding_group_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Creates a binding between source_property on the source object
   * and target_property on target. Whenever the source_property
   * is changed the target_property is updated using the same value.
   * The binding flag %G_BINDING_SYNC_CREATE is automatically specified.
   * See [gobject.object.ObjectG.bindProperty] for more information.
   * Params:
   *   sourceProperty = the property on the source to bind
   *   target = the target #GObject
   *   targetProperty = the property on target to bind
   *   flags = the flags used to create the #GBinding
   */
  void bind(string sourceProperty, ObjectG target, string targetProperty, BindingFlags flags)
  {
    const(char)* _sourceProperty = sourceProperty.toCString(No.Alloc);
    const(char)* _targetProperty = targetProperty.toCString(No.Alloc);
    g_binding_group_bind(cast(GBindingGroup*)cPtr, _sourceProperty, target ? cast(ObjectC*)target.cPtr(No.Dup) : null, _targetProperty, flags);
  }

  /**
   * Creates a binding between source_property on the source object and
   * target_property on target, allowing you to set the transformation
   * functions to be used by the binding. The binding flag
   * %G_BINDING_SYNC_CREATE is automatically specified.
   * This function is the language bindings friendly version of
   * g_binding_group_bind_property_full$(LPAREN)$(RPAREN), using #GClosures
   * instead of function pointers.
   * See [gobject.object.ObjectG.bindPropertyWithClosures] for more information.
   * Params:
   *   sourceProperty = the property on the source to bind
   *   target = the target #GObject
   *   targetProperty = the property on target to bind
   *   flags = the flags used to create the #GBinding
   *   transformTo = a #GClosure wrapping the
   *     transformation function from the source object to the target,
   *     or %NULL to use the default
   *   transformFrom = a #GClosure wrapping the
   *     transformation function from the target to the source object,
   *     or %NULL to use the default
   */
  void bindFull(string sourceProperty, ObjectG target, string targetProperty, BindingFlags flags, Closure transformTo, Closure transformFrom)
  {
    const(char)* _sourceProperty = sourceProperty.toCString(No.Alloc);
    const(char)* _targetProperty = targetProperty.toCString(No.Alloc);
    g_binding_group_bind_with_closures(cast(GBindingGroup*)cPtr, _sourceProperty, target ? cast(ObjectC*)target.cPtr(No.Dup) : null, _targetProperty, flags, transformTo ? cast(GClosure*)transformTo.cPtr(No.Dup) : null, transformFrom ? cast(GClosure*)transformFrom.cPtr(No.Dup) : null);
  }

  /**
   * Gets the source object used for binding properties.
   * Returns: a #GObject or %NULL.
   */
  ObjectG dupSource()
  {
    ObjectC* _cretval;
    _cretval = g_binding_group_dup_source(cast(GBindingGroup*)cPtr);
    auto _retval = ObjectG.getDObject!ObjectG(cast(ObjectC*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets source as the source object used for creating property
   * bindings. If there is already a source object all bindings from it
   * will be removed.
   * Note that all properties that have been bound must exist on source.
   * Params:
   *   source = the source #GObject,
   *     or %NULL to clear it
   */
  void setSource(ObjectG source)
  {
    g_binding_group_set_source(cast(GBindingGroup*)cPtr, source ? cast(ObjectC*)source.cPtr(No.Dup) : null);
  }
}
