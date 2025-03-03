module gtksource.space_drawer;

import gid.gid;
import gio.settings;
import gio.types;
import glib.variant;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
 * Represent white space characters with symbols.
 * #GtkSourceSpaceDrawer provides a way to visualize white spaces, by drawing
 * symbols.
 * Call [gtksource.view.View.getSpaceDrawer] to get the `GtkSourceSpaceDrawer`
 * instance of a certain class@View.
 * By default, no white spaces are drawn because the
 * property@SpaceDrawer:enable-matrix is %FALSE.
 * To draw white spaces, [gtksource.space_drawer.SpaceDrawer.setTypesForLocations] can
 * be called to set the property@SpaceDrawer:matrix property $(LPAREN)by default all
 * space types are enabled at all locations$(RPAREN). Then call
 * [gtksource.space_drawer.SpaceDrawer.setEnableMatrix].
 * For a finer-grained method, there is also the class@Tag's
 * property@Tag:draw-spaces property.
 * # Example
 * To draw non-breaking spaces everywhere and draw all types of trailing spaces
 * except newlines:
 * ```c
 * gtk_source_space_drawer_set_types_for_locations $(LPAREN)space_drawer,
 * GTK_SOURCE_SPACE_LOCATION_ALL,
 * GTK_SOURCE_SPACE_TYPE_NBSP$(RPAREN);
 * gtk_source_space_drawer_set_types_for_locations $(LPAREN)space_drawer,
 * GTK_SOURCE_SPACE_LOCATION_TRAILING,
 * GTK_SOURCE_SPACE_TYPE_ALL &
 * ~GTK_SOURCE_SPACE_TYPE_NEWLINE$(RPAREN);
 * gtk_source_space_drawer_set_enable_matrix $(LPAREN)space_drawer, TRUE$(RPAREN);
 * ```
 * # Use-case: draw unwanted white spaces
 * A possible use-case is to draw only unwanted white spaces. Examples:
 * - Draw all trailing spaces.
 * - If the indentation and alignment must be done with spaces, draw tabs.
 * And non-breaking spaces can always be drawn, everywhere, to distinguish them
 * from normal spaces.
 */
class SpaceDrawer : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_space_drawer_get_type != &gidSymbolNotFound ? gtk_source_space_drawer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new #GtkSourceSpaceDrawer object.
   * Useful for storing space drawing settings independently of a classView.
   * Returns: a new #GtkSourceSpaceDrawer.
   */
  this()
  {
    GtkSourceSpaceDrawer* _cretval;
    _cretval = gtk_source_space_drawer_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Binds the propertySpaceDrawer:matrix property to a [gio.settings.Settings] key.
   * The [gio.settings.Settings] key must be of the same type as the
   * propertySpaceDrawer:matrix property, that is, `"au"`.
   * The [gio.settings.Settings.bind] function cannot be used, because the default GIO
   * mapping functions don't support [glib.variant.VariantG] properties $(LPAREN)maybe it will be
   * supported by a future GIO version, in which case this function can be
   * deprecated$(RPAREN).
   * Params:
   *   settings = a #GSettings object.
   *   key = the settings key to bind.
   *   flags = flags for the binding.
   */
  void bindMatrixSetting(gio.settings.Settings settings, string key, gio.types.SettingsBindFlags flags)
  {
    const(char)* _key = key.toCString(No.Alloc);
    gtk_source_space_drawer_bind_matrix_setting(cast(GtkSourceSpaceDrawer*)cPtr, settings ? cast(GSettings*)settings.cPtr(No.Dup) : null, _key, flags);
  }

  bool getEnableMatrix()
  {
    bool _retval;
    _retval = gtk_source_space_drawer_get_enable_matrix(cast(GtkSourceSpaceDrawer*)cPtr);
    return _retval;
  }

  /**
   * Gets the value of the propertySpaceDrawer:matrix property, as a [glib.variant.VariantG].
   * An empty array can be returned in case the matrix is a zero matrix.
   * The [gtksource.space_drawer.SpaceDrawer.getTypesForLocations] function may be more
   * convenient to use.
   * Returns: the #GtkSourceSpaceDrawer:matrix value as a new floating #GVariant
   *   instance.
   */
  glib.variant.VariantG getMatrix()
  {
    VariantC* _cretval;
    _cretval = gtk_source_space_drawer_get_matrix(cast(GtkSourceSpaceDrawer*)cPtr);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * If only one location is specified, this function returns what kind of
   * white spaces are drawn at that location.
   * The value is retrieved from the propertySpaceDrawer:matrix property.
   * If several locations are specified, this function returns the logical AND for
   * those locations. Which means that if a certain kind of white space is present
   * in the return value, then that kind of white space is drawn at all the
   * specified locations.
   * Params:
   *   locations = one or several #GtkSourceSpaceLocationFlags.
   * Returns: a combination of #GtkSourceSpaceTypeFlags.
   */
  gtksource.types.SpaceTypeFlags getTypesForLocations(gtksource.types.SpaceLocationFlags locations)
  {
    GtkSourceSpaceTypeFlags _cretval;
    _cretval = gtk_source_space_drawer_get_types_for_locations(cast(GtkSourceSpaceDrawer*)cPtr, locations);
    gtksource.types.SpaceTypeFlags _retval = cast(gtksource.types.SpaceTypeFlags)_cretval;
    return _retval;
  }

  /**
   * Sets whether the propertySpaceDrawer:matrix property is enabled.
   * Params:
   *   enableMatrix = the new value.
   */
  void setEnableMatrix(bool enableMatrix)
  {
    gtk_source_space_drawer_set_enable_matrix(cast(GtkSourceSpaceDrawer*)cPtr, enableMatrix);
  }

  /**
   * Sets a new value to the propertySpaceDrawer:matrix property, as a [glib.variant.VariantG].
   * If matrix is %NULL, then an empty array is set.
   * If matrix is floating, it is consumed.
   * The [gtksource.space_drawer.SpaceDrawer.setTypesForLocations] function may be more
   * convenient to use.
   * Params:
   *   matrix = the new matrix value, or %NULL.
   */
  void setMatrix(glib.variant.VariantG matrix)
  {
    gtk_source_space_drawer_set_matrix(cast(GtkSourceSpaceDrawer*)cPtr, matrix ? cast(VariantC*)matrix.cPtr(No.Dup) : null);
  }

  /**
   * Modifies the propertySpaceDrawer:matrix property at the specified
   * locations.
   * Params:
   *   locations = one or several #GtkSourceSpaceLocationFlags.
   *   types = a combination of #GtkSourceSpaceTypeFlags.
   */
  void setTypesForLocations(gtksource.types.SpaceLocationFlags locations, gtksource.types.SpaceTypeFlags types)
  {
    gtk_source_space_drawer_set_types_for_locations(cast(GtkSourceSpaceDrawer*)cPtr, locations, types);
  }
}
