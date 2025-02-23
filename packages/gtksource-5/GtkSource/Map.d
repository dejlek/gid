module GtkSource.Map;

import GObject.ObjectG;
import Gid.gid;
import Gtk.Accessible;
import Gtk.AccessibleT;
import Gtk.AccessibleText;
import Gtk.AccessibleTextT;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.ConstraintTarget;
import Gtk.ConstraintTargetT;
import Gtk.Scrollable;
import Gtk.ScrollableT;
import GtkSource.Types;
import GtkSource.View;
import GtkSource.c.functions;
import GtkSource.c.types;

/**
 * Widget that displays a map for a specific class@View.
 * `GtkSourceMap` is a widget that maps the content of a class@View into
 * a smaller view so the user can have a quick overview of the whole document.
 * This works by connecting a class@View to to the `GtkSourceMap` using
 * the property@Map:view property or [GtkSource.Map.setView].
 * `GtkSourceMap` is a class@View object. This means that you can add a
 * class@GutterRenderer to a gutter in the same way you would for a
 * class@View. One example might be a class@GutterRenderer that shows
 * which lines have changed in the document.
 * Additionally, it is desirable to match the font of the `GtkSourceMap` and
 * the class@View used for editing. Therefore, property@Map:font-desc
 * should be used to set the target font. You will need to adjust this to the
 * desired font size for the map. A 1pt font generally seems to be an
 * appropriate font size. "Monospace 1" is the default. See
 * [Pango.FontDescription.setSize] for how to alter the size of an existing
 * [Pango.FontDescription].
 * When FontConfig is available, `GtkSourceMap` will try to use a bundled
 * "block" font to make the map more legible.
 */
class Map : View
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_map_get_type != &gidSymbolNotFound ? gtk_source_map_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Gets the propertyMap:view property, which is the view this widget is mapping.
   * Returns: a #GtkSourceView or %NULL.
   */
  View getView()
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_map_get_view(cast(GtkSourceMap*)cPtr);
    auto _retval = ObjectG.getDObject!View(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets the view that map will be doing the mapping to.
   * Params:
   *   view = a #GtkSourceView
   */
  void setView(View view)
  {
    gtk_source_map_set_view(cast(GtkSourceMap*)cPtr, view ? cast(GtkSourceView*)view.cPtr(No.Dup) : null);
  }
}
