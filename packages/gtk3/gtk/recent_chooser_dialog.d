module gtk.recent_chooser_dialog;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.dialog;
import gtk.recent_chooser;
import gtk.recent_chooser_mixin;
import gtk.types;

/**
 * #GtkRecentChooserDialog is a dialog box suitable for displaying the recently
 * used documents.  This widgets works by putting a #GtkRecentChooserWidget inside
 * a #GtkDialog.  It exposes the #GtkRecentChooserIface interface, so you can use
 * all the #GtkRecentChooser functions on the recent chooser dialog as well as
 * those for #GtkDialog.
 * Note that #GtkRecentChooserDialog does not have any methods of its own.
 * Instead, you should use the functions that work on a #GtkRecentChooser.
 * ## Typical usage ## {#gtkrecentchooser-typical-usage}
 * In the simplest of cases, you can use the following code to use
 * a #GtkRecentChooserDialog to select a recently used file:
 * |[<!-- language\="C" -->
 * GtkWidget *dialog;
 * gint res;
 * dialog \= gtk_recent_chooser_dialog_new $(LPAREN)"Recent Documents",
 * parent_window,
 * _$(LPAREN)"_Cancel"$(RPAREN),
 * GTK_RESPONSE_CANCEL,
 * _$(LPAREN)"_Open"$(RPAREN),
 * GTK_RESPONSE_ACCEPT,
 * NULL$(RPAREN);
 * res \= gtk_dialog_run $(LPAREN)GTK_DIALOG $(LPAREN)dialog$(RPAREN)$(RPAREN);
 * if $(LPAREN)res \=\= GTK_RESPONSE_ACCEPT$(RPAREN)
 * {
 * GtkRecentInfo *info;
 * GtkRecentChooser *chooser \= GTK_RECENT_CHOOSER $(LPAREN)dialog$(RPAREN);
 * info \= gtk_recent_chooser_get_current_item $(LPAREN)chooser$(RPAREN);
 * open_file $(LPAREN)gtk_recent_info_get_uri $(LPAREN)info$(RPAREN)$(RPAREN);
 * gtk_recent_info_unref $(LPAREN)info$(RPAREN);
 * }
 * gtk_widget_destroy $(LPAREN)dialog$(RPAREN);
 * ]|
 * Recently used files are supported since GTK+ 2.10.
 */
class RecentChooserDialog : gtk.dialog.Dialog, gtk.recent_chooser.RecentChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_recent_chooser_dialog_get_type != &gidSymbolNotFound ? gtk_recent_chooser_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin RecentChooserT!();
}
