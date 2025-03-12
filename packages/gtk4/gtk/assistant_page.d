module gtk.assistant_page;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    [gtk.assistant_page.AssistantPage] is an auxiliary object used by `GtkAssistant.

  Deprecated:     This object will be removed in GTK 5
*/
class AssistantPage : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_assistant_page_get_type != &gidSymbolNotFound ? gtk_assistant_page_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override AssistantPage self()
  {
    return this;
  }

  /**
      Returns the child to which page belongs.
    Returns:     the child to which page belongs
  
    Deprecated:     This widget will be removed in GTK 5
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_assistant_page_get_child(cast(GtkAssistantPage*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}
