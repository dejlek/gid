module gtksource.hover_display;

import gid.global;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
 * Display for interactive tooltips.
 * `GtkSourceHoverDisplay` is a [gtk.widget.Widget] that may be populated with widgets
 * to be displayed to the user in interactive tooltips. The children widgets
 * are packed vertically using a [gtk.box.Box].
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
    import gid.loader : gidSymbolNotFound;
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
