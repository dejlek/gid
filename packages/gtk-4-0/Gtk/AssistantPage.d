module Gtk.AssistantPage;

import GObject.ObjectG;
import Gid.gid;
import Gtk.Types;
import Gtk.Widget;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkAssistantPage` is an auxiliary object used by `GtkAssistant.

 * Deprecated: This object will be removed in GTK 5
 */
class AssistantPage : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_assistant_page_get_type != &gidSymbolNotFound ? gtk_assistant_page_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Returns the child to which page belongs.
   * Returns: the child to which page belongs

   * Deprecated: This widget will be removed in GTK 5
   */
  Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_assistant_page_get_child(cast(GtkAssistantPage*)cPtr);
    auto _retval = ObjectG.getDObject!Widget(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}
