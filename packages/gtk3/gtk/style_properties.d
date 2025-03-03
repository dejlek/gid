module gtk.style_properties;

import gid.gid;
import gobject.object;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.style_provider;
import gtk.style_provider_mixin;
import gtk.symbolic_color;
import gtk.types;

/**
 * GtkStyleProperties provides the storage for style information
 * that is used by #GtkStyleContext and other #GtkStyleProvider
 * implementations.
 * Before style properties can be stored in GtkStyleProperties, they
 * must be registered with [gtk.style_properties.StyleProperties.registerProperty].
 * Unless you are writing a #GtkStyleProvider implementation, you
 * are unlikely to use this API directly, as [gtk.style_context.StyleContext.get]
 * and its variants are the preferred way to access styling information
 * from widget implementations and theming engine implementations
 * should use the APIs provided by #GtkThemingEngine instead.
 * #GtkStyleProperties has been deprecated in GTK 3.16. The CSS
 * machinery does not use it anymore and all users of this object
 * have been deprecated.
 */
class StyleProperties : gobject.object.ObjectG, gtk.style_provider.StyleProvider
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_style_properties_get_type != &gidSymbolNotFound ? gtk_style_properties_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin StyleProviderT!();

  /**
   * Returns a newly created #GtkStyleProperties
   * Returns: a new #GtkStyleProperties

   * Deprecated: #GtkStyleProperties are deprecated.
   */
  this()
  {
    GtkStyleProperties* _cretval;
    _cretval = gtk_style_properties_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Clears all style information from props.

   * Deprecated: #GtkStyleProperties are deprecated.
   */
  void clear()
  {
    gtk_style_properties_clear(cast(GtkStyleProperties*)cPtr);
  }

  alias getProperty = gobject.object.ObjectG.getProperty;

  /**
   * Gets a style property from props for the given state. When done with value,
   * [gobject.value.Value.unset] needs to be called to free any allocated memory.
   * Params:
   *   property = style property name
   *   state = state to retrieve the property value for
   *   value = return location for the style property value.
   * Returns: %TRUE if the property exists in props, %FALSE otherwise

   * Deprecated: #GtkStyleProperties are deprecated.
   */
  bool getProperty(string property, gtk.types.StateFlags state, out gobject.value.Value value)
  {
    bool _retval;
    const(char)* _property = property.toCString(No.Alloc);
    GValue _value;
    _retval = gtk_style_properties_get_property(cast(GtkStyleProperties*)cPtr, _property, state, &_value);
    value = new gobject.value.Value(cast(void*)&_value, Yes.Take);
    return _retval;
  }

  /**
   * Returns the symbolic color that is mapped
   * to name.
   * Params:
   *   name = color name to lookup
   * Returns: The mapped color

   * Deprecated: #GtkSymbolicColor is deprecated.
   */
  gtk.symbolic_color.SymbolicColor lookupColor(string name)
  {
    GtkSymbolicColor* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_style_properties_lookup_color(cast(GtkStyleProperties*)cPtr, _name);
    auto _retval = _cretval ? new gtk.symbolic_color.SymbolicColor(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Maps color so it can be referenced by name. See
   * [gtk.style_properties.StyleProperties.lookupColor]
   * Params:
   *   name = color name
   *   color = #GtkSymbolicColor to map name to

   * Deprecated: #GtkSymbolicColor is deprecated.
   */
  void mapColor(string name, gtk.symbolic_color.SymbolicColor color)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_style_properties_map_color(cast(GtkStyleProperties*)cPtr, _name, color ? cast(GtkSymbolicColor*)color.cPtr(No.Dup) : null);
  }

  /**
   * Merges into props all the style information contained
   * in props_to_merge. If replace is %TRUE, the values
   * will be overwritten, if it is %FALSE, the older values
   * will prevail.
   * Params:
   *   propsToMerge = a second #GtkStyleProperties
   *   replace = whether to replace values or not

   * Deprecated: #GtkStyleProperties are deprecated.
   */
  void merge(gtk.style_properties.StyleProperties propsToMerge, bool replace)
  {
    gtk_style_properties_merge(cast(GtkStyleProperties*)cPtr, propsToMerge ? cast(const(GtkStyleProperties)*)propsToMerge.cPtr(No.Dup) : null, replace);
  }

  alias setProperty = gobject.object.ObjectG.setProperty;

  /**
   * Sets a styling property in props.
   * Params:
   *   property = styling property to set
   *   state = state to set the value for
   *   value = new value for the property

   * Deprecated: #GtkStyleProperties are deprecated.
   */
  void setProperty(string property, gtk.types.StateFlags state, gobject.value.Value value)
  {
    const(char)* _property = property.toCString(No.Alloc);
    gtk_style_properties_set_property(cast(GtkStyleProperties*)cPtr, _property, state, value ? cast(const(GValue)*)value.cPtr(No.Dup) : null);
  }

  /**
   * Unsets a style property in props.
   * Params:
   *   property = property to unset
   *   state = state to unset

   * Deprecated: #GtkStyleProperties are deprecated.
   */
  void unsetProperty(string property, gtk.types.StateFlags state)
  {
    const(char)* _property = property.toCString(No.Alloc);
    gtk_style_properties_unset_property(cast(GtkStyleProperties*)cPtr, _property, state);
  }
}
