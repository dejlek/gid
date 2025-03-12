module gtk.list_header;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    [gtk.list_header.ListHeader] is used by list widgets to represent the headers they
  display.
  
  [gtk.list_header.ListHeader] objects are managed just like [gtk.list_item.ListItem]
  objects via their factory, but provide a different set of properties suitable
  for managing the header instead of individual items.
*/
class ListHeader : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_list_header_get_type != &gidSymbolNotFound ? gtk_list_header_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ListHeader self()
  {
    return this;
  }

  /**
      Gets the child previously set via [gtk.list_header.ListHeader.setChild] or
    null if none was set.
    Returns:     The child
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_list_header_get_child(cast(GtkListHeader*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the end position in the model of the section that self is
    currently the header for.
    
    If self is unbound, `GTK_INVALID_LIST_POSITION` is returned.
    Returns:     The end position of the section
  */
  uint getEnd()
  {
    uint _retval;
    _retval = gtk_list_header_get_end(cast(GtkListHeader*)cPtr);
    return _retval;
  }

  /**
      Gets the model item at the start of the section.
    This is the item that occupies the list model at position
    [gtk.list_header.ListHeader.guint].
    
    If self is unbound, this function returns null.
    Returns:     The item displayed
  */
  gobject.object.ObjectG getItem()
  {
    ObjectC* _cretval;
    _cretval = gtk_list_header_get_item(cast(GtkListHeader*)cPtr);
    auto _retval = ObjectG.getDObject!(gobject.object.ObjectG)(cast(ObjectC*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the the number of items in the section.
    
    If self is unbound, 0 is returned.
    Returns:     The number of items in the section
  */
  uint getNItems()
  {
    uint _retval;
    _retval = gtk_list_header_get_n_items(cast(GtkListHeader*)cPtr);
    return _retval;
  }

  /**
      Gets the start position in the model of the section that self is
    currently the header for.
    
    If self is unbound, `GTK_INVALID_LIST_POSITION` is returned.
    Returns:     The start position of the section
  */
  uint getStart()
  {
    uint _retval;
    _retval = gtk_list_header_get_start(cast(GtkListHeader*)cPtr);
    return _retval;
  }

  /**
      Sets the child to be used for this listitem.
    
    This function is typically called by applications when
    setting up a header so that the widget can be reused when
    binding it multiple times.
    Params:
      child =       The list item's child or null to unset
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_list_header_set_child(cast(GtkListHeader*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }
}
