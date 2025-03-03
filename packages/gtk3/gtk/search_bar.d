module gtk.search_bar;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.event;
import gid.gid;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.entry;
import gtk.types;

/**
 * #GtkSearchBar is a container made to have a search entry $(LPAREN)possibly
 * with additional connex widgets, such as drop-down menus, or buttons$(RPAREN)
 * built-in. The search bar would appear when a search is started through
 * typing on the keyboard, or the application’s search mode is toggled on.
 * For keyboard presses to start a search, events will need to be
 * forwarded from the top-level window that contains the search bar.
 * See [gtk.search_bar.SearchBar.handleEvent] for example code. Common shortcuts
 * such as Ctrl+F should be handled as an application action, or through
 * the menu items.
 * You will also need to tell the search bar about which entry you
 * are using as your search entry using [gtk.search_bar.SearchBar.connectEntry].
 * The following example shows you how to create a more complex search
 * entry.
 * # CSS nodes
 * GtkSearchBar has a single CSS node with name searchbar.
 * ## Creating a search bar
 * [A simple example](https://gitlab.gnome.org/GNOME/gtk/blob/gtk-3-24/examples/search-bar.c)
 */
class SearchBar : gtk.bin.Bin
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_search_bar_get_type != &gidSymbolNotFound ? gtk_search_bar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a #GtkSearchBar. You will need to tell it about
   * which widget is going to be your text entry using
   * [gtk.search_bar.SearchBar.connectEntry].
   * Returns: a new #GtkSearchBar
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_search_bar_new();
    this(_cretval, No.Take);
  }

  /**
   * Connects the #GtkEntry widget passed as the one to be used in
   * this search bar. The entry should be a descendant of the search bar.
   * This is only required if the entry isn’t the direct child of the
   * search bar $(LPAREN)as in our main example$(RPAREN).
   * Params:
   *   entry = a #GtkEntry
   */
  void connectEntry(gtk.entry.Entry entry)
  {
    gtk_search_bar_connect_entry(cast(GtkSearchBar*)cPtr, entry ? cast(GtkEntry*)entry.cPtr(No.Dup) : null);
  }

  /**
   * Returns whether the search mode is on or off.
   * Returns: whether search mode is toggled on
   */
  bool getSearchMode()
  {
    bool _retval;
    _retval = gtk_search_bar_get_search_mode(cast(GtkSearchBar*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the close button is shown.
   * Returns: whether the close button is shown
   */
  bool getShowCloseButton()
  {
    bool _retval;
    _retval = gtk_search_bar_get_show_close_button(cast(GtkSearchBar*)cPtr);
    return _retval;
  }

  /**
   * This function should be called when the top-level
   * window which contains the search bar received a key event.
   * If the key event is handled by the search bar, the bar will
   * be shown, the entry populated with the entered text and %GDK_EVENT_STOP
   * will be returned. The caller should ensure that events are
   * not propagated further.
   * If no entry has been connected to the search bar, using
   * [gtk.search_bar.SearchBar.connectEntry], this function will return
   * immediately with a warning.
   * ## Showing the search bar on key presses
   * |[<!-- language\="C" -->
   * static gboolean
   * on_key_press_event $(LPAREN)GtkWidget *widget,
   * GdkEvent  *event,
   * gpointer   user_data$(RPAREN)
   * {
   * GtkSearchBar *bar \= GTK_SEARCH_BAR $(LPAREN)user_data$(RPAREN);
   * return gtk_search_bar_handle_event $(LPAREN)bar, event$(RPAREN);
   * }
   * static void
   * create_toplevel $(LPAREN)void$(RPAREN)
   * {
   * GtkWidget *window \= gtk_window_new $(LPAREN)GTK_WINDOW_TOPLEVEL$(RPAREN);
   * GtkWindow *search_bar \= gtk_search_bar_new $(LPAREN)$(RPAREN);
   * // Add more widgets to the window...
   * g_signal_connect $(LPAREN)window,
   * "key-press-event",
   * G_CALLBACK $(LPAREN)on_key_press_event$(RPAREN),
   * search_bar$(RPAREN);
   * }
   * ]|
   * Params:
   *   event = a #GdkEvent containing key press events
   * Returns: %GDK_EVENT_STOP if the key press event resulted
   *   in text being entered in the search entry $(LPAREN)and revealing
   *   the search bar if necessary$(RPAREN), %GDK_EVENT_PROPAGATE otherwise.
   */
  bool handleEvent(gdk.event.Event event)
  {
    bool _retval;
    _retval = gtk_search_bar_handle_event(cast(GtkSearchBar*)cPtr, event ? cast(GdkEvent*)event.cPtr : null);
    return _retval;
  }

  /**
   * Switches the search mode on or off.
   * Params:
   *   searchMode = the new state of the search mode
   */
  void setSearchMode(bool searchMode)
  {
    gtk_search_bar_set_search_mode(cast(GtkSearchBar*)cPtr, searchMode);
  }

  /**
   * Shows or hides the close button. Applications that
   * already have a “search” toggle button should not show a close
   * button in their search bar, as it duplicates the role of the
   * toggle button.
   * Params:
   *   visible = whether the close button will be shown or not
   */
  void setShowCloseButton(bool visible)
  {
    gtk_search_bar_set_show_close_button(cast(GtkSearchBar*)cPtr, visible);
  }
}
