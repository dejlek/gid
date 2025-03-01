module gio.menu;

import gid.global;
import gio.c.functions;
import gio.c.types;
import gio.menu_item;
import gio.menu_model;
import gio.types;

/**
 * `GMenu` is a simple implementation of [gio.menu_model.MenuModel].
 * You populate a `GMenu` by adding [gio.menu_item.MenuItem] instances to it.
 * There are some convenience functions to allow you to directly
 * add items $(LPAREN)avoiding [gio.menu_item.MenuItem]$(RPAREN) for the common cases. To add
 * a regular item, use [gio.menu.Menu.insert]. To add a section, use
 * [gio.menu.Menu.insertSection]. To add a submenu, use
 * [gio.menu.Menu.insertSubmenu].
 */
class Menu : MenuModel
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_menu_get_type != &gidSymbolNotFound ? g_menu_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new #GMenu.
   * The new menu has no items.
   * Returns: a new #GMenu
   */
  this()
  {
    GMenu* _cretval;
    _cretval = g_menu_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Convenience function for appending a normal menu item to the end of
   * menu.  Combine [gio.menu_item.MenuItem.new_] and [gio.menu.Menu.insertItem] for a more
   * flexible alternative.
   * Params:
   *   label = the section label, or %NULL
   *   detailedAction = the detailed action string, or %NULL
   */
  void append(string label, string detailedAction)
  {
    const(char)* _label = label.toCString(No.Alloc);
    const(char)* _detailedAction = detailedAction.toCString(No.Alloc);
    g_menu_append(cast(GMenu*)cPtr, _label, _detailedAction);
  }

  /**
   * Appends item to the end of menu.
   * See [gio.menu.Menu.insertItem] for more information.
   * Params:
   *   item = a #GMenuItem to append
   */
  void appendItem(MenuItem item)
  {
    g_menu_append_item(cast(GMenu*)cPtr, item ? cast(GMenuItem*)item.cPtr(No.Dup) : null);
  }

  /**
   * Convenience function for appending a section menu item to the end of
   * menu.  Combine [gio.menu_item.MenuItem.newSection] and [gio.menu.Menu.insertItem] for a
   * more flexible alternative.
   * Params:
   *   label = the section label, or %NULL
   *   section = a #GMenuModel with the items of the section
   */
  void appendSection(string label, MenuModel section)
  {
    const(char)* _label = label.toCString(No.Alloc);
    g_menu_append_section(cast(GMenu*)cPtr, _label, section ? cast(GMenuModel*)section.cPtr(No.Dup) : null);
  }

  /**
   * Convenience function for appending a submenu menu item to the end of
   * menu.  Combine [gio.menu_item.MenuItem.newSubmenu] and [gio.menu.Menu.insertItem] for a
   * more flexible alternative.
   * Params:
   *   label = the section label, or %NULL
   *   submenu = a #GMenuModel with the items of the submenu
   */
  void appendSubmenu(string label, MenuModel submenu)
  {
    const(char)* _label = label.toCString(No.Alloc);
    g_menu_append_submenu(cast(GMenu*)cPtr, _label, submenu ? cast(GMenuModel*)submenu.cPtr(No.Dup) : null);
  }

  /**
   * Marks menu as frozen.
   * After the menu is frozen, it is an error to attempt to make any
   * changes to it.  In effect this means that the #GMenu API must no
   * longer be used.
   * This function causes [gio.menu_model.MenuModel.isMutable] to begin returning
   * %FALSE, which has some positive performance implications.
   */
  void freeze()
  {
    g_menu_freeze(cast(GMenu*)cPtr);
  }

  /**
   * Convenience function for inserting a normal menu item into menu.
   * Combine [gio.menu_item.MenuItem.new_] and [gio.menu.Menu.insertItem] for a more flexible
   * alternative.
   * Params:
   *   position = the position at which to insert the item
   *   label = the section label, or %NULL
   *   detailedAction = the detailed action string, or %NULL
   */
  void insert(int position, string label, string detailedAction)
  {
    const(char)* _label = label.toCString(No.Alloc);
    const(char)* _detailedAction = detailedAction.toCString(No.Alloc);
    g_menu_insert(cast(GMenu*)cPtr, position, _label, _detailedAction);
  }

  /**
   * Inserts item into menu.
   * The "insertion" is actually done by copying all of the attribute and
   * link values of item and using them to form a new item within menu.
   * As such, item itself is not really inserted, but rather, a menu item
   * that is exactly the same as the one presently described by item.
   * This means that item is essentially useless after the insertion
   * occurs.  Any changes you make to it are ignored unless it is inserted
   * again $(LPAREN)at which point its updated values will be copied$(RPAREN).
   * You should probably just free item once you're done.
   * There are many convenience functions to take care of common cases.
   * See [gio.menu.Menu.insert], [gio.menu.Menu.insertSection] and
   * [gio.menu.Menu.insertSubmenu] as well as "prepend" and "append" variants of
   * each of these functions.
   * Params:
   *   position = the position at which to insert the item
   *   item = the #GMenuItem to insert
   */
  void insertItem(int position, MenuItem item)
  {
    g_menu_insert_item(cast(GMenu*)cPtr, position, item ? cast(GMenuItem*)item.cPtr(No.Dup) : null);
  }

  /**
   * Convenience function for inserting a section menu item into menu.
   * Combine [gio.menu_item.MenuItem.newSection] and [gio.menu.Menu.insertItem] for a more
   * flexible alternative.
   * Params:
   *   position = the position at which to insert the item
   *   label = the section label, or %NULL
   *   section = a #GMenuModel with the items of the section
   */
  void insertSection(int position, string label, MenuModel section)
  {
    const(char)* _label = label.toCString(No.Alloc);
    g_menu_insert_section(cast(GMenu*)cPtr, position, _label, section ? cast(GMenuModel*)section.cPtr(No.Dup) : null);
  }

  /**
   * Convenience function for inserting a submenu menu item into menu.
   * Combine [gio.menu_item.MenuItem.newSubmenu] and [gio.menu.Menu.insertItem] for a more
   * flexible alternative.
   * Params:
   *   position = the position at which to insert the item
   *   label = the section label, or %NULL
   *   submenu = a #GMenuModel with the items of the submenu
   */
  void insertSubmenu(int position, string label, MenuModel submenu)
  {
    const(char)* _label = label.toCString(No.Alloc);
    g_menu_insert_submenu(cast(GMenu*)cPtr, position, _label, submenu ? cast(GMenuModel*)submenu.cPtr(No.Dup) : null);
  }

  /**
   * Convenience function for prepending a normal menu item to the start
   * of menu.  Combine [gio.menu_item.MenuItem.new_] and [gio.menu.Menu.insertItem] for a more
   * flexible alternative.
   * Params:
   *   label = the section label, or %NULL
   *   detailedAction = the detailed action string, or %NULL
   */
  void prepend(string label, string detailedAction)
  {
    const(char)* _label = label.toCString(No.Alloc);
    const(char)* _detailedAction = detailedAction.toCString(No.Alloc);
    g_menu_prepend(cast(GMenu*)cPtr, _label, _detailedAction);
  }

  /**
   * Prepends item to the start of menu.
   * See [gio.menu.Menu.insertItem] for more information.
   * Params:
   *   item = a #GMenuItem to prepend
   */
  void prependItem(MenuItem item)
  {
    g_menu_prepend_item(cast(GMenu*)cPtr, item ? cast(GMenuItem*)item.cPtr(No.Dup) : null);
  }

  /**
   * Convenience function for prepending a section menu item to the start
   * of menu.  Combine [gio.menu_item.MenuItem.newSection] and [gio.menu.Menu.insertItem] for
   * a more flexible alternative.
   * Params:
   *   label = the section label, or %NULL
   *   section = a #GMenuModel with the items of the section
   */
  void prependSection(string label, MenuModel section)
  {
    const(char)* _label = label.toCString(No.Alloc);
    g_menu_prepend_section(cast(GMenu*)cPtr, _label, section ? cast(GMenuModel*)section.cPtr(No.Dup) : null);
  }

  /**
   * Convenience function for prepending a submenu menu item to the start
   * of menu.  Combine [gio.menu_item.MenuItem.newSubmenu] and [gio.menu.Menu.insertItem] for
   * a more flexible alternative.
   * Params:
   *   label = the section label, or %NULL
   *   submenu = a #GMenuModel with the items of the submenu
   */
  void prependSubmenu(string label, MenuModel submenu)
  {
    const(char)* _label = label.toCString(No.Alloc);
    g_menu_prepend_submenu(cast(GMenu*)cPtr, _label, submenu ? cast(GMenuModel*)submenu.cPtr(No.Dup) : null);
  }

  /**
   * Removes an item from the menu.
   * position gives the index of the item to remove.
   * It is an error if position is not in range the range from 0 to one
   * less than the number of items in the menu.
   * It is not possible to remove items by identity since items are added
   * to the menu simply by copying their links and attributes $(LPAREN)ie:
   * identity of the item itself is not preserved$(RPAREN).
   * Params:
   *   position = the position of the item to remove
   */
  void remove(int position)
  {
    g_menu_remove(cast(GMenu*)cPtr, position);
  }

  /**
   * Removes all items in the menu.
   */
  void removeAll()
  {
    g_menu_remove_all(cast(GMenu*)cPtr);
  }
}
