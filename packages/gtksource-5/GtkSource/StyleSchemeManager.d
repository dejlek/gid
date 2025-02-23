module GtkSource.StyleSchemeManager;

import GObject.ObjectG;
import Gid.gid;
import GtkSource.StyleScheme;
import GtkSource.Types;
import GtkSource.c.functions;
import GtkSource.c.types;

/**
 * Provides access to class@StyleSchemes.
 */
class StyleSchemeManager : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_style_scheme_manager_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_manager_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new style manager.
   * If you do not need more than one style manager
   * then use [GtkSource.StyleSchemeManager.getDefault] instead.
   * Returns: a new #GtkSourceStyleSchemeManager.
   */
  this()
  {
    GtkSourceStyleSchemeManager* _cretval;
    _cretval = gtk_source_style_scheme_manager_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Returns the default #GtkSourceStyleSchemeManager instance.
   * Returns: a #GtkSourceStyleSchemeManager. Return value
   *   is owned by GtkSourceView library and must not be unref'ed.
   */
  static StyleSchemeManager getDefault()
  {
    GtkSourceStyleSchemeManager* _cretval;
    _cretval = gtk_source_style_scheme_manager_get_default();
    auto _retval = ObjectG.getDObject!StyleSchemeManager(cast(GtkSourceStyleSchemeManager*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Appends path to the list of directories where the manager looks for
   * style scheme files.
   * See [GtkSource.StyleSchemeManager.setSearchPath] for details.
   * Params:
   *   path = a directory or a filename.
   */
  void appendSearchPath(string path)
  {
    const(char)* _path = path.toCString(No.Alloc);
    gtk_source_style_scheme_manager_append_search_path(cast(GtkSourceStyleSchemeManager*)cPtr, _path);
  }

  /**
   * Mark any currently cached information about the available style schems
   * as invalid.
   * All the available style schemes will be reloaded next time the manager is accessed.
   */
  void forceRescan()
  {
    gtk_source_style_scheme_manager_force_rescan(cast(GtkSourceStyleSchemeManager*)cPtr);
  }

  /**
   * Looks up style scheme by id.
   * Params:
   *   schemeId = style scheme id to find.
   * Returns: a #GtkSourceStyleScheme object.
   *   The returned value is owned by manager and must not be unref'ed.
   */
  StyleScheme getScheme(string schemeId)
  {
    GtkSourceStyleScheme* _cretval;
    const(char)* _schemeId = schemeId.toCString(No.Alloc);
    _cretval = gtk_source_style_scheme_manager_get_scheme(cast(GtkSourceStyleSchemeManager*)cPtr, _schemeId);
    auto _retval = ObjectG.getDObject!StyleScheme(cast(GtkSourceStyleScheme*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Prepends path to the list of directories where the manager looks
   * for style scheme files.
   * See [GtkSource.StyleSchemeManager.setSearchPath] for details.
   * Params:
   *   path = a directory or a filename.
   */
  void prependSearchPath(string path)
  {
    const(char)* _path = path.toCString(No.Alloc);
    gtk_source_style_scheme_manager_prepend_search_path(cast(GtkSourceStyleSchemeManager*)cPtr, _path);
  }
}
