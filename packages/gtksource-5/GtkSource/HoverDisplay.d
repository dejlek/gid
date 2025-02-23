module GtkSource.HoverDisplay;

import Gid.gid;
import Gtk.Accessible;
import Gtk.AccessibleT;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.ConstraintTarget;
import Gtk.ConstraintTargetT;
import Gtk.Widget;
import GtkSource.Types;
import GtkSource.c.functions;
import GtkSource.c.types;

/**
 * Display for interactive tooltips.
 * `GtkSourceHoverDisplay` is a [Gtk.Widget] that may be populated with widgets
 * to be displayed to the user in interactive tooltips. The children widgets
 * are packed vertically using a [Gtk.Box].
 * Implement the iface@HoverProvider interface to be notified of when
 * to populate a `GtkSourceHoverDisplay` on behalf of the user.
 */
class HoverDisplay : Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_hover_display_get_type != &gidSymbolNotFound ? gtk_source_hover_display_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  void append(Widget child)
  {
    gtk_source_hover_display_append(cast(GtkSourceHoverDisplay*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  override void insertAfter(Widget child, Widget sibling)
  {
    gtk_source_hover_display_insert_after(cast(GtkSourceHoverDisplay*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, sibling ? cast(GtkWidget*)sibling.cPtr(No.Dup) : null);
  }

  void prepend(Widget child)
  {
    gtk_source_hover_display_prepend(cast(GtkSourceHoverDisplay*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  void remove(Widget child)
  {
    gtk_source_hover_display_remove(cast(GtkSourceHoverDisplay*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }
}
