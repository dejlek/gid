/// Module for [ColumnViewColumn] class
module gtk.column_view_column;

import gid.gid;
import gio.menu_model;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.column_view;
import gtk.list_item_factory;
import gtk.sorter;
import gtk.types;

/**
    [gtk.column_view_column.ColumnViewColumn] represents the columns being added to a [gtk.column_view.ColumnView].
    
    The main ingredient for a [gtk.column_view_column.ColumnViewColumn] is the [gtk.list_item_factory.ListItemFactory]
    that tells the columnview how to create cells for this column from items in
    the model.
    
    Columns have a title, and can optionally have a header menu set
    with [gtk.column_view_column.ColumnViewColumn.setHeaderMenu].
    
    A sorter can be associated with a column using
    [gtk.column_view_column.ColumnViewColumn.setSorter], to let users influence sorting
    by clicking on the column header.
*/
class ColumnViewColumn : gobject.object.ObjectG
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_column_view_column_get_type != &gidSymbolNotFound ? gtk_column_view_column_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override ColumnViewColumn self()
  {
    return this;
  }

  /**
      Creates a new [gtk.column_view_column.ColumnViewColumn] that uses the given factory for
      mapping items to widgets.
      
      You most likely want to call [gtk.column_view.ColumnView.appendColumn] next.
      
      The function takes ownership of the argument, so you can write code like:
      
      ```c
      column = gtk_column_view_column_new (_("Name"),
        gtk_builder_list_item_factory_new_from_resource ("/name.ui"));
      ```
  
      Params:
        title = Title to use for this column
        factory = The factory to populate items with
      Returns: a new [gtk.column_view_column.ColumnViewColumn] using the given factory
  */
  this(string title = null, gtk.list_item_factory.ListItemFactory factory = null)
  {
    GtkColumnViewColumn* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_column_view_column_new(_title, factory ? cast(GtkListItemFactory*)factory.cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the column view that's currently displaying this column.
      
      If self has not been added to a column view yet, null is returned.
      Returns: The column view displaying self.
  */
  gtk.column_view.ColumnView getColumnView()
  {
    GtkColumnView* _cretval;
    _cretval = gtk_column_view_column_get_column_view(cast(GtkColumnViewColumn*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.column_view.ColumnView)(cast(GtkColumnView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether this column should expand.
      Returns: true if this column expands
  */
  bool getExpand()
  {
    bool _retval;
    _retval = gtk_column_view_column_get_expand(cast(GtkColumnViewColumn*)cPtr);
    return _retval;
  }

  /**
      Gets the factory that's currently used to populate list items for
      this column.
      Returns: The factory in use
  */
  gtk.list_item_factory.ListItemFactory getFactory()
  {
    GtkListItemFactory* _cretval;
    _cretval = gtk_column_view_column_get_factory(cast(GtkColumnViewColumn*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the fixed width of the column.
      Returns: the fixed with of the column
  */
  int getFixedWidth()
  {
    int _retval;
    _retval = gtk_column_view_column_get_fixed_width(cast(GtkColumnViewColumn*)cPtr);
    return _retval;
  }

  /**
      Gets the menu model that is used to create the context menu
      for the column header.
      Returns: the [gio.menu_model.MenuModel]
  */
  gio.menu_model.MenuModel getHeaderMenu()
  {
    GMenuModel* _cretval;
    _cretval = gtk_column_view_column_get_header_menu(cast(GtkColumnViewColumn*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the ID set with [gtk.column_view_column.ColumnViewColumn.setId].
      Returns: The column's ID
  */
  string getId()
  {
    const(char)* _cretval;
    _cretval = gtk_column_view_column_get_id(cast(GtkColumnViewColumn*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether this column is resizable.
      Returns: true if this column is resizable
  */
  bool getResizable()
  {
    bool _retval;
    _retval = gtk_column_view_column_get_resizable(cast(GtkColumnViewColumn*)cPtr);
    return _retval;
  }

  /**
      Returns the sorter that is associated with the column.
      Returns: the [gtk.sorter.Sorter] of self
  */
  gtk.sorter.Sorter getSorter()
  {
    GtkSorter* _cretval;
    _cretval = gtk_column_view_column_get_sorter(cast(GtkColumnViewColumn*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.sorter.Sorter)(cast(GtkSorter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the title set with [gtk.column_view_column.ColumnViewColumn.setTitle].
      Returns: The column's title
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_column_view_column_get_title(cast(GtkColumnViewColumn*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether this column is visible.
      Returns: true if this column is visible
  */
  bool getVisible()
  {
    bool _retval;
    _retval = gtk_column_view_column_get_visible(cast(GtkColumnViewColumn*)cPtr);
    return _retval;
  }

  /**
      Sets the column to take available extra space.
      
      The extra space is shared equally amongst all columns that
      have the expand set to true.
  
      Params:
        expand = true if this column should expand to fill available sace
  */
  void setExpand(bool expand)
  {
    gtk_column_view_column_set_expand(cast(GtkColumnViewColumn*)cPtr, expand);
  }

  /**
      Sets the [gtk.list_item_factory.ListItemFactory] to use for populating list items for this
      column.
  
      Params:
        factory = the factory to use
  */
  void setFactory(gtk.list_item_factory.ListItemFactory factory = null)
  {
    gtk_column_view_column_set_factory(cast(GtkColumnViewColumn*)cPtr, factory ? cast(GtkListItemFactory*)factory.cPtr(No.Dup) : null);
  }

  /**
      If fixed_width is not -1, sets the fixed width of column;
      otherwise unsets it.
      
      Setting a fixed width overrides the automatically calculated
      width. Interactive resizing also sets the “fixed-width” property.
  
      Params:
        fixedWidth = the new fixed width, or -1
  */
  void setFixedWidth(int fixedWidth)
  {
    gtk_column_view_column_set_fixed_width(cast(GtkColumnViewColumn*)cPtr, fixedWidth);
  }

  /**
      Sets the menu model that is used to create the context menu
      for the column header.
  
      Params:
        menu = a [gio.menu_model.MenuModel]
  */
  void setHeaderMenu(gio.menu_model.MenuModel menu = null)
  {
    gtk_column_view_column_set_header_menu(cast(GtkColumnViewColumn*)cPtr, menu ? cast(GMenuModel*)menu.cPtr(No.Dup) : null);
  }

  /**
      Sets the id of this column.
      
      GTK makes no use of this, but applications can use it when
      storing column view configuration.
      
      It is up to callers to ensure uniqueness of IDs.
  
      Params:
        id = ID to use for this column
  */
  void setId(string id = null)
  {
    const(char)* _id = id.toCString(No.Alloc);
    gtk_column_view_column_set_id(cast(GtkColumnViewColumn*)cPtr, _id);
  }

  /**
      Sets whether this column should be resizable by dragging.
  
      Params:
        resizable = whether this column should be resizable
  */
  void setResizable(bool resizable)
  {
    gtk_column_view_column_set_resizable(cast(GtkColumnViewColumn*)cPtr, resizable);
  }

  /**
      Associates a sorter with the column.
      
      If sorter is null, the column will not let users change
      the sorting by clicking on its header.
      
      This sorter can be made active by clicking on the column
      header, or by calling [gtk.column_view.ColumnView.sortByColumn].
      
      See [gtk.column_view.ColumnView.getSorter] for the necessary steps
      for setting up customizable sorting for [gtk.column_view.ColumnView].
  
      Params:
        sorter = the [gtk.sorter.Sorter] to associate with column
  */
  void setSorter(gtk.sorter.Sorter sorter = null)
  {
    gtk_column_view_column_set_sorter(cast(GtkColumnViewColumn*)cPtr, sorter ? cast(GtkSorter*)sorter.cPtr(No.Dup) : null);
  }

  /**
      Sets the title of this column.
      
      The title is displayed in the header of a [gtk.column_view.ColumnView]
      for this column and is therefore user-facing text that should
      be translated.
  
      Params:
        title = Title to use for this column
  */
  void setTitle(string title = null)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_column_view_column_set_title(cast(GtkColumnViewColumn*)cPtr, _title);
  }

  /**
      Sets whether this column should be visible in views.
  
      Params:
        visible = whether this column should be visible
  */
  void setVisible(bool visible)
  {
    gtk_column_view_column_set_visible(cast(GtkColumnViewColumn*)cPtr, visible);
  }
}
