module gtk.image_menu_item;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.accel_group;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu_item;
import gtk.types;
import gtk.widget;

/**
 * A GtkImageMenuItem is a menu item which has an icon next to the text label.
 * This is functionally equivalent to:
 * |[<!-- language\="C" -->
 * GtkWidget *box \= gtk_box_new $(LPAREN)GTK_ORIENTATION_HORIZONTAL, 6$(RPAREN);
 * GtkWidget *icon \= gtk_image_new_from_icon_name $(LPAREN)"folder-music-symbolic", GTK_ICON_SIZE_MENU$(RPAREN);
 * GtkWidget *label \= gtk_label_new $(LPAREN)"Music"$(RPAREN);
 * GtkWidget *menu_item \= gtk_menu_item_new $(LPAREN)$(RPAREN);
 * gtk_container_add $(LPAREN)GTK_CONTAINER $(LPAREN)box$(RPAREN), icon$(RPAREN);
 * gtk_container_add $(LPAREN)GTK_CONTAINER $(LPAREN)box$(RPAREN), label$(RPAREN);
 * gtk_container_add $(LPAREN)GTK_CONTAINER $(LPAREN)menu_item$(RPAREN), box$(RPAREN);
 * gtk_widget_show_all $(LPAREN)menu_item$(RPAREN);
 * ]|
 * Note that the user may disable display of menu icons using
 * the #GtkSettings:gtk-menu-images setting, so make sure to still
 * fill in the text label. If you want to ensure that your menu items
 * show an icon you are strongly encouraged to use a #GtkMenuItem
 * with a #GtkImage instead.
 * #GtkImageMenuItem has been deprecated since GTK+ 3.10. If you want to
 * display an icon in a menu item, you should use #GtkMenuItem and pack a
 * #GtkBox with a #GtkImage and a #GtkLabel instead. You should also consider
 * using #GtkBuilder and the XML #GMenu description for creating menus, by
 * following the [GMenu guide][https://developer.gnome.org/GMenu/]. You should
 * consider using icons in menu items only sparingly, and for "objects" $(LPAREN)or
 * "nouns"$(RPAREN) elements only, like bookmarks, files, and links; "actions" $(LPAREN)or
 * "verbs"$(RPAREN) should not have icons.
 * Furthermore, if you would like to display keyboard accelerator, you must
 * pack the accel label into the box using [gtk.box.Box.packEnd] and align the
 * label, otherwise the accelerator will not display correctly. The following
 * code snippet adds a keyboard accelerator to the menu item, with a key
 * binding of Ctrl+M:
 * |[<!-- language\="C" -->
 * GtkWidget *box \= gtk_box_new $(LPAREN)GTK_ORIENTATION_HORIZONTAL, 6$(RPAREN);
 * GtkWidget *icon \= gtk_image_new_from_icon_name $(LPAREN)"folder-music-symbolic", GTK_ICON_SIZE_MENU$(RPAREN);
 * GtkWidget *label \= gtk_accel_label_new $(LPAREN)"Music"$(RPAREN);
 * GtkWidget *menu_item \= gtk_menu_item_new $(LPAREN)$(RPAREN);
 * GtkAccelGroup *accel_group \= gtk_accel_group_new $(LPAREN)$(RPAREN);
 * gtk_container_add $(LPAREN)GTK_CONTAINER $(LPAREN)box$(RPAREN), icon$(RPAREN);
 * gtk_label_set_use_underline $(LPAREN)GTK_LABEL $(LPAREN)label$(RPAREN), TRUE$(RPAREN);
 * gtk_label_set_xalign $(LPAREN)GTK_LABEL $(LPAREN)label$(RPAREN), 0.0$(RPAREN);
 * gtk_widget_add_accelerator $(LPAREN)menu_item, "activate", accel_group,
 * GDK_KEY_m, GDK_CONTROL_MASK, GTK_ACCEL_VISIBLE$(RPAREN);
 * gtk_accel_label_set_accel_widget $(LPAREN)GTK_ACCEL_LABEL $(LPAREN)label$(RPAREN), menu_item$(RPAREN);
 * gtk_box_pack_end $(LPAREN)GTK_BOX $(LPAREN)box$(RPAREN), label, TRUE, TRUE, 0$(RPAREN);
 * gtk_container_add $(LPAREN)GTK_CONTAINER $(LPAREN)menu_item$(RPAREN), box$(RPAREN);
 * gtk_widget_show_all $(LPAREN)menu_item$(RPAREN);
 * ]|
 */
class ImageMenuItem : gtk.menu_item.MenuItem
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_image_menu_item_get_type != &gidSymbolNotFound ? gtk_image_menu_item_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new #GtkImageMenuItem with an empty label.
   * Returns: a new #GtkImageMenuItem

   * Deprecated: Use [gtk.menu_item.MenuItem.new_] instead.
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_menu_item_new();
    this(_cretval, No.Take);
  }

  /**
   * Creates a new #GtkImageMenuItem containing the image and text from a
   * stock item. Some stock ids have preprocessor macros like #GTK_STOCK_OK
   * and #GTK_STOCK_APPLY.
   * If you want this menu item to have changeable accelerators, then pass in
   * %NULL for accel_group. Next call [gtk.menu_item.MenuItem.setAccelPath] with an
   * appropriate path for the menu item, use [gtk.global.stockLookup] to look up the
   * standard accelerator for the stock item, and if one is found, call
   * [gtk.accel_map.AccelMap.addEntry] to register it.
   * Params:
   *   stockId = the name of the stock item.
   *   accelGroup = the #GtkAccelGroup to add the menu items
   *     accelerator to, or %NULL.
   * Returns: a new #GtkImageMenuItem.

   * Deprecated: Use [gtk.menu_item.MenuItem.newWithMnemonic] instead.
   */
  static gtk.image_menu_item.ImageMenuItem newFromStock(string stockId, gtk.accel_group.AccelGroup accelGroup = null)
  {
    GtkWidget* _cretval;
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_image_menu_item_new_from_stock(_stockId, accelGroup ? cast(GtkAccelGroup*)accelGroup.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.image_menu_item.ImageMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Creates a new #GtkImageMenuItem containing a label.
   * Params:
   *   label = the text of the menu item.
   * Returns: a new #GtkImageMenuItem.

   * Deprecated: Use [gtk.menu_item.MenuItem.newWithLabel] instead.
   */
  static gtk.image_menu_item.ImageMenuItem newWithLabel(string label)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_image_menu_item_new_with_label(_label);
    auto _retval = ObjectG.getDObject!(gtk.image_menu_item.ImageMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Creates a new #GtkImageMenuItem containing a label. The label
   * will be created using [gtk.label.Label.newWithMnemonic], so underscores
   * in label indicate the mnemonic for the menu item.
   * Params:
   *   label = the text of the menu item, with an underscore in front of the
   *     mnemonic character
   * Returns: a new #GtkImageMenuItem

   * Deprecated: Use [gtk.menu_item.MenuItem.newWithMnemonic] instead.
   */
  static gtk.image_menu_item.ImageMenuItem newWithMnemonic(string label)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_image_menu_item_new_with_mnemonic(_label);
    auto _retval = ObjectG.getDObject!(gtk.image_menu_item.ImageMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns whether the menu item will ignore the #GtkSettings:gtk-menu-images
   * setting and always show the image, if available.
   * Returns: %TRUE if the menu item will always show the image
   */
  bool getAlwaysShowImage()
  {
    bool _retval;
    _retval = gtk_image_menu_item_get_always_show_image(cast(GtkImageMenuItem*)cPtr);
    return _retval;
  }

  /**
   * Gets the widget that is currently set as the image of image_menu_item.
   * See [gtk.image_menu_item.ImageMenuItem.setImage].
   * Returns: the widget set as image of image_menu_item
   */
  gtk.widget.Widget getImage()
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_menu_item_get_image(cast(GtkImageMenuItem*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Checks whether the label set in the menuitem is used as a
   * stock id to select the stock item for the item.
   * Returns: %TRUE if the label set in the menuitem is used as a
   *   stock id to select the stock item for the item
   */
  bool getUseStock()
  {
    bool _retval;
    _retval = gtk_image_menu_item_get_use_stock(cast(GtkImageMenuItem*)cPtr);
    return _retval;
  }

  /**
   * Specifies an accel_group to add the menu items accelerator to
   * $(LPAREN)this only applies to stock items so a stock item must already
   * be set, make sure to call [gtk.image_menu_item.ImageMenuItem.setUseStock]
   * and [gtk.menu_item.MenuItem.setLabel] with a valid stock item first$(RPAREN).
   * If you want this menu item to have changeable accelerators then
   * you shouldnt need this $(LPAREN)see [gtk.image_menu_item.ImageMenuItem.newFromStock]$(RPAREN).
   * Params:
   *   accelGroup = the #GtkAccelGroup
   */
  void setAccelGroup(gtk.accel_group.AccelGroup accelGroup)
  {
    gtk_image_menu_item_set_accel_group(cast(GtkImageMenuItem*)cPtr, accelGroup ? cast(GtkAccelGroup*)accelGroup.cPtr(No.Dup) : null);
  }

  /**
   * If %TRUE, the menu item will ignore the #GtkSettings:gtk-menu-images
   * setting and always show the image, if available.
   * Use this property if the menuitem would be useless or hard to use
   * without the image.
   * Params:
   *   alwaysShow = %TRUE if the menuitem should always show the image
   */
  void setAlwaysShowImage(bool alwaysShow)
  {
    gtk_image_menu_item_set_always_show_image(cast(GtkImageMenuItem*)cPtr, alwaysShow);
  }

  /**
   * Sets the image of image_menu_item to the given widget.
   * Note that it depends on the show-menu-images setting whether
   * the image will be displayed or not.
   * Params:
   *   image = a widget to set as the image for the menu item.
   */
  void setImage(gtk.widget.Widget image = null)
  {
    gtk_image_menu_item_set_image(cast(GtkImageMenuItem*)cPtr, image ? cast(GtkWidget*)image.cPtr(No.Dup) : null);
  }

  /**
   * If %TRUE, the label set in the menuitem is used as a
   * stock id to select the stock item for the item.
   * Params:
   *   useStock = %TRUE if the menuitem should use a stock item
   */
  void setUseStock(bool useStock)
  {
    gtk_image_menu_item_set_use_stock(cast(GtkImageMenuItem*)cPtr, useStock);
  }
}
