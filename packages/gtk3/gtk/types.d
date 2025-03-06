module gtk.types;

import gdk.atom;
import gdk.color;
import gdk.display;
import gdk.event_key;
import gdk.frame_clock;
import gdk.rectangle;
import gdk.screen;
import gdk.types;
import gdkpixbuf.pixbuf;
import gid.gid;
import glib.string_;
import gobject.closure;
import gobject.object;
import gobject.param_spec;
import gobject.types;
import gobject.value;
import gtk.accel_group;
import gtk.builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.calendar;
import gtk.cell_layout;
import gtk.cell_renderer;
import gtk.clipboard;
import gtk.entry_completion;
import gtk.file_filter_info;
import gtk.flow_box;
import gtk.flow_box_child;
import gtk.icon_view;
import gtk.list_box;
import gtk.list_box_row;
import gtk.menu;
import gtk.page_setup;
import gtk.recent_filter_info;
import gtk.recent_info;
import gtk.selection_data;
import gtk.text_buffer;
import gtk.text_iter;
import gtk.text_tag;
import gtk.tree_iter;
import gtk.tree_model;
import gtk.tree_path;
import gtk.tree_selection;
import gtk.tree_view;
import gtk.tree_view_column;
import gtk.widget;
import pango.font_face;
import pango.font_family;


// Aliases

/** */
alias Allocation = gdk.rectangle.Rectangle;

/** */
alias Stock = GtkStock;

// Structs

/** */
alias AccelKey = GtkAccelKey;

/** */
alias LabelSelectionInfo = GtkLabelSelectionInfo*;

/** */
alias PageRange = GtkPageRange;

/** */
alias RcContext = GtkRcContext*;

/** */
alias RequestedSize = GtkRequestedSize;

/** */
alias TableRowCol = GtkTableRowCol;

/** */
alias TextBTree = GtkTextBTree*;

/** */
alias ThemeEngine = GtkThemeEngine*;

/** */
alias WindowGeometryInfo = GtkWindowGeometryInfo*;

/** */
alias _MountOperationHandler = _GtkMountOperationHandler*;

// Callbacks

/** */
alias AccelGroupActivate = bool delegate(gtk.accel_group.AccelGroup accelGroup, gobject.object.ObjectG acceleratable, uint keyval, gdk.types.ModifierType modifier);

/** */
alias AccelGroupFindFunc = bool delegate(gtk.types.AccelKey key, gobject.closure.Closure closure);

/** */
alias AccelMapForeach = void delegate(string accelPath, uint accelKey, gdk.types.ModifierType accelMods, bool changed);

/**
    A function used by [gtk.assistant.Assistant.setForwardPageFunc] to know which
  is the next page given a current one. It’s called both for computing the
  next page when the user presses the “forward” button and for handling
  the behavior of the “last” button.

  ## Parameters
  $(LIST
    * $(B currentPage)       The page number used to calculate the next page.
  )
  Returns:     The next page number.
*/
alias AssistantPageFunc = int delegate(int currentPage);

/**
    This is the signature of a function used to connect signals.  It is used
  by the [gtk.builder.Builder.connectSignals] and [gtk.builder.Builder.connectSignalsFull]
  methods.  It is mainly intended for interpreted language bindings, but
  could be useful where the programmer wants more control over the signal
  connection process. Note that this function can only be called once,
  subsequent calls will do nothing.

  ## Parameters
  $(LIST
    * $(B builder)       a #GtkBuilder
    * $(B object)       object to connect a signal to
    * $(B signalName)       name of the signal
    * $(B handlerName)       name of the handler
    * $(B connectObject)       a #GObject, if non-null, use [gobject.global.signalConnectObject]
    * $(B flags)       #GConnectFlags to use
  )
*/
alias BuilderConnectFunc = void delegate(gtk.builder.Builder builder, gobject.object.ObjectG object, string signalName, string handlerName, gobject.object.ObjectG connectObject, gobject.types.ConnectFlags flags);

/**
    This kind of functions provide Pango markup with detail information for the
  specified day. Examples for such details are holidays or appointments. The
  function returns null when no information is available.

  ## Parameters
  $(LIST
    * $(B calendar)       a #GtkCalendar.
    * $(B year)       the year for which details are needed.
    * $(B month)       the month for which details are needed.
    * $(B day)       the day of month for which details are needed.
  )
  Returns:     Newly allocated string with Pango markup
        with details for the specified day or null.
*/
alias CalendarDetailFunc = string delegate(gtk.calendar.Calendar calendar, uint year, uint month, uint day);

/**
    The type of the callback functions used for e.g. iterating over
  the children of a container, see [gtk.container.Container.foreach_].

  ## Parameters
  $(LIST
    * $(B widget)       the widget to operate on
  )
*/
alias Callback = void delegate(gtk.widget.Widget widget);

/**
    The type of the callback functions used for iterating over the
  cell renderers and their allocated areas inside a #GtkCellArea,
  see [gtk.cell_area.CellArea.foreachAlloc].

  ## Parameters
  $(LIST
    * $(B renderer)       the cell renderer to operate on
    * $(B cellArea)       the area allocated to renderer inside the rectangle
          provided to [gtk.cell_area.CellArea.foreachAlloc].
    * $(B cellBackground)       the background area for renderer inside the
          background area provided to [gtk.cell_area.CellArea.foreachAlloc].
  )
  Returns:     true to stop iterating over cells.
*/
alias CellAllocCallback = bool delegate(gtk.cell_renderer.CellRenderer renderer, gdk.rectangle.Rectangle cellArea, gdk.rectangle.Rectangle cellBackground);

/**
    The type of the callback functions used for iterating over
  the cell renderers of a #GtkCellArea, see [gtk.cell_area.CellArea.foreach_].

  ## Parameters
  $(LIST
    * $(B renderer)       the cell renderer to operate on
  )
  Returns:     true to stop iterating over cells.
*/
alias CellCallback = bool delegate(gtk.cell_renderer.CellRenderer renderer);

/**
    A function which should set the value of cell_layout’s cell renderer(s)
  as appropriate.

  ## Parameters
  $(LIST
    * $(B cellLayout)       a #GtkCellLayout
    * $(B cell)       the cell renderer whose value is to be set
    * $(B treeModel)       the model
    * $(B iter)       a #GtkTreeIter indicating the row to set the value for
  )
*/
alias CellLayoutDataFunc = void delegate(gtk.cell_layout.CellLayout cellLayout, gtk.cell_renderer.CellRenderer cell, gtk.tree_model.TreeModel treeModel, gtk.tree_iter.TreeIter iter);

/**
    A function that will be called when the contents of the clipboard are changed
  or cleared. Once this has called, the user_data_or_owner argument
  will not be used again.

  ## Parameters
  $(LIST
    * $(B clipboard)       the #GtkClipboard
  )
*/
alias ClipboardClearFunc = void delegate(gtk.clipboard.Clipboard clipboard);

/**
    A function that will be called to provide the contents of the selection.
  If multiple types of data were advertised, the requested type can
  be determined from the info parameter or by checking the target field
  of selection_data. If the data could successfully be converted into
  then it should be stored into the selection_data object by
  calling [gtk.selection_data.SelectionData.set] (or related functions such
  as [gtk.selection_data.SelectionData.setText]). If no data is set, the requestor
  will be informed that the attempt to get the data failed.

  ## Parameters
  $(LIST
    * $(B clipboard)       the #GtkClipboard
    * $(B selectionData)       a #GtkSelectionData argument in which the requested
        data should be stored.
    * $(B info)       the info field corresponding to the requested target from the
        #GtkTargetEntry array passed to [gtk.clipboard.Clipboard.setWithData] or
        [gtk.clipboard.Clipboard.setWithOwner].
  )
*/
alias ClipboardGetFunc = void delegate(gtk.clipboard.Clipboard clipboard, gtk.selection_data.SelectionData selectionData, uint info);

/**
    A function to be called when the results of [gtk.clipboard.Clipboard.requestImage]
  are received, or when the request fails.

  ## Parameters
  $(LIST
    * $(B clipboard)       the #GtkClipboard
    * $(B pixbuf)       the received image
  )
*/
alias ClipboardImageReceivedFunc = void delegate(gtk.clipboard.Clipboard clipboard, gdkpixbuf.pixbuf.Pixbuf pixbuf);

/**
    A function to be called when the results of [gtk.clipboard.Clipboard.requestContents]
  are received, or when the request fails.

  ## Parameters
  $(LIST
    * $(B clipboard)       the #GtkClipboard
    * $(B selectionData)       a #GtkSelectionData containing the data was received.
        If retrieving the data failed, then then length field
        of selection_data will be negative.
  )
*/
alias ClipboardReceivedFunc = void delegate(gtk.clipboard.Clipboard clipboard, gtk.selection_data.SelectionData selectionData);

/**
    A function to be called when the results of
  [gtk.clipboard.Clipboard.requestRichText] are received, or when the request
  fails.

  ## Parameters
  $(LIST
    * $(B clipboard)       the #GtkClipboard
    * $(B format)       The format of the rich text
    * $(B text)       the rich text received, as
        a UTF-8 encoded string, or null if retrieving the data failed.
  )
*/
alias ClipboardRichTextReceivedFunc = void delegate(gtk.clipboard.Clipboard clipboard, gdk.atom.Atom format, char[] text);

/**
    A function to be called when the results of [gtk.clipboard.Clipboard.requestText]
  are received, or when the request fails.

  ## Parameters
  $(LIST
    * $(B clipboard)       the #GtkClipboard
    * $(B text)       the text received, as a UTF-8 encoded string, or
        null if retrieving the data failed.
  )
*/
alias ClipboardTextReceivedFunc = void delegate(gtk.clipboard.Clipboard clipboard, string text);

/**
    A function to be called when the results of
  [gtk.clipboard.Clipboard.requestUris] are received, or when the request
  fails.

  ## Parameters
  $(LIST
    * $(B clipboard)       the #GtkClipboard
    * $(B uris)       the received URIs
  )
*/
alias ClipboardURIReceivedFunc = void delegate(gtk.clipboard.Clipboard clipboard, string[] uris);

/** */
alias ColorSelectionChangePaletteFunc = void delegate(gdk.color.Color[] colors);

/** */
alias ColorSelectionChangePaletteWithScreenFunc = void delegate(gdk.screen.Screen screen, gdk.color.Color[] colors);

/**
    A function which decides whether the row indicated by iter matches
  a given key, and should be displayed as a possible completion for key.
  Note that key is normalized and case-folded (see [glib.global.utf8Normalize]
  and [glib.global.utf8Casefold]). If this is not appropriate, match functions
  have access to the unmodified key via
  `gtk_entry_get_text (GTK_ENTRY (gtk_entry_completion_get_entry ()))`.

  ## Parameters
  $(LIST
    * $(B completion)       the #GtkEntryCompletion
    * $(B key)       the string to match, normalized and case-folded
    * $(B iter)       a #GtkTreeIter indicating the row to match
  )
  Returns:     true if iter should be displayed as a possible completion
        for key
*/
alias EntryCompletionMatchFunc = bool delegate(gtk.entry_completion.EntryCompletion completion, string key, gtk.tree_iter.TreeIter iter);

/**
    The type of function that is used with custom filters, see
  [gtk.file_filter.FileFilter.addCustom].

  ## Parameters
  $(LIST
    * $(B filterInfo)       a #GtkFileFilterInfo that is filled according
        to the needed flags passed to [gtk.file_filter.FileFilter.addCustom]
  )
  Returns:     true if the file should be displayed
*/
alias FileFilterFunc = bool delegate(gtk.file_filter_info.FileFilterInfo filterInfo);

/**
    Called for flow boxes that are bound to a #GListModel with
  [gtk.flow_box.FlowBox.bindModel] for each item that gets added to the model.

  ## Parameters
  $(LIST
    * $(B item)       the item from the model for which to create a widget for
  )
  Returns:     a #GtkWidget that represents item
*/
alias FlowBoxCreateWidgetFunc = gtk.widget.Widget delegate(gobject.object.ObjectG item);

/**
    A function that will be called whenrever a child changes
  or is added. It lets you control if the child should be
  visible or not.

  ## Parameters
  $(LIST
    * $(B child)       a #GtkFlowBoxChild that may be filtered
  )
  Returns:     true if the row should be visible, false otherwise
*/
alias FlowBoxFilterFunc = bool delegate(gtk.flow_box_child.FlowBoxChild child);

/**
    A function used by [gtk.flow_box.FlowBox.selectedForeach].
  It will be called on every selected child of the box.

  ## Parameters
  $(LIST
    * $(B box)       a #GtkFlowBox
    * $(B child)       a #GtkFlowBoxChild
  )
*/
alias FlowBoxForeachFunc = void delegate(gtk.flow_box.FlowBox box, gtk.flow_box_child.FlowBoxChild child);

/**
    A function to compare two children to determine which
  should come first.

  ## Parameters
  $(LIST
    * $(B child1)       the first child
    * $(B child2)       the second child
  )
  Returns:     < 0 if child1 should be before child2, 0 if
        the are equal, and > 0 otherwise
*/
alias FlowBoxSortFunc = int delegate(gtk.flow_box_child.FlowBoxChild child1, gtk.flow_box_child.FlowBoxChild child2);

/**
    The type of function that is used for deciding what fonts get
  shown in a #GtkFontChooser. See [gtk.font_chooser.FontChooser.setFilterFunc].

  ## Parameters
  $(LIST
    * $(B family)       a #PangoFontFamily
    * $(B face)       a #PangoFontFace belonging to family
  )
  Returns:     true if the font should be displayed
*/
alias FontFilterFunc = bool delegate(pango.font_family.FontFamily family, pango.font_face.FontFace face);

/**
    A function used by [gtk.icon_view.IconView.selectedForeach] to map all
  selected rows.  It will be called on every selected row in the view.

  ## Parameters
  $(LIST
    * $(B iconView)       a #GtkIconView
    * $(B path)       The #GtkTreePath of a selected row
  )
*/
alias IconViewForeachFunc = void delegate(gtk.icon_view.IconView iconView, gtk.tree_path.TreePath path);

/**
    Key snooper functions are called before normal event delivery.
  They can be used to implement custom key event handling.

  ## Parameters
  $(LIST
    * $(B grabWidget)       the widget to which the event will be delivered
    * $(B event)       the key event
  )
  Returns:     true to stop further processing of event, false to continue.
*/
alias KeySnoopFunc = int delegate(gtk.widget.Widget grabWidget, gdk.event_key.EventKey event);

/**
    Called for list boxes that are bound to a #GListModel with
  [gtk.list_box.ListBox.bindModel] for each item that gets added to the model.
  
  Versions of GTK+ prior to 3.18 called [gtk.widget.Widget.showAll] on the rows
  created by the GtkListBoxCreateWidgetFunc, but this forced all widgets
  inside the row to be shown, and is no longer the case. Applications should
  be updated to show the desired row widgets.

  ## Parameters
  $(LIST
    * $(B item)       the item from the model for which to create a widget for
  )
  Returns:     a #GtkWidget that represents item
*/
alias ListBoxCreateWidgetFunc = gtk.widget.Widget delegate(gobject.object.ObjectG item);

/**
    Will be called whenever the row changes or is added and lets you control
  if the row should be visible or not.

  ## Parameters
  $(LIST
    * $(B row)       the row that may be filtered
  )
  Returns:     true if the row should be visible, false otherwise
*/
alias ListBoxFilterFunc = bool delegate(gtk.list_box_row.ListBoxRow row);

/**
    A function used by [gtk.list_box.ListBox.selectedForeach].
  It will be called on every selected child of the box.

  ## Parameters
  $(LIST
    * $(B box)       a #GtkListBox
    * $(B row)       a #GtkListBoxRow
  )
*/
alias ListBoxForeachFunc = void delegate(gtk.list_box.ListBox box, gtk.list_box_row.ListBoxRow row);

/**
    Compare two rows to determine which should be first.

  ## Parameters
  $(LIST
    * $(B row1)       the first row
    * $(B row2)       the second row
  )
  Returns:     < 0 if row1 should be before row2, 0 if they are
        equal and > 0 otherwise
*/
alias ListBoxSortFunc = int delegate(gtk.list_box_row.ListBoxRow row1, gtk.list_box_row.ListBoxRow row2);

/**
    Whenever row changes or which row is before row changes this
  is called, which lets you update the header on row. You may
  remove or set a new one via [gtk.list_box_row.ListBoxRow.setHeader] or
  just change the state of the current header widget.

  ## Parameters
  $(LIST
    * $(B row)       the row to update
    * $(B before)       the row before row, or null if it is first
  )
*/
alias ListBoxUpdateHeaderFunc = void delegate(gtk.list_box_row.ListBoxRow row, gtk.list_box_row.ListBoxRow before);

/**
    A user function supplied when calling [gtk.menu.Menu.attachToWidget] which
  will be called when the menu is later detached from the widget.

  ## Parameters
  $(LIST
    * $(B attachWidget)       the #GtkWidget that the menu is being detached from.
    * $(B menu)       the #GtkMenu being detached.
  )
*/
alias MenuDetachFunc = void delegate(gtk.widget.Widget attachWidget, gtk.menu.Menu menu);

/**
    A user function supplied when calling [gtk.menu.Menu.popup] which
  controls the positioning of the menu when it is displayed.  The
  function sets the x and y parameters to the coordinates where the
  menu is to be drawn.  To make the menu appear on a different
  monitor than the mouse pointer, [gtk.menu.Menu.setMonitor] must be
  called.

  ## Parameters
  $(LIST
    * $(B menu)       a #GtkMenu.
    * $(B x)       address of the #gint representing the horizontal
          position where the menu shall be drawn.
    * $(B y)       address of the #gint representing the vertical position
          where the menu shall be drawn.  This is an output parameter.
    * $(B pushIn)       This parameter controls how menus placed outside
          the monitor are handled.  If this is set to true and part of
          the menu is outside the monitor then GTK+ pushes the window
          into the visible area, effectively modifying the popup
          position.  Note that moving and possibly resizing the menu
          around will alter the scroll position to keep the menu items
          “in place”, i.e. at the same monitor position they would have
          been without resizing.  In practice, this behavior is only
          useful for combobox popups or option menus and cannot be used
          to simply confine a menu to monitor boundaries.  In that case,
          changing the scroll offset is not desirable.
  )
*/
alias MenuPositionFunc = void delegate(gtk.menu.Menu menu, ref int x, ref int y, out bool pushIn);

/**
    A multihead-aware GTK+ module may have a gtk_module_display_init() function
  with this prototype. GTK+ calls this function for each opened display.

  ## Parameters
  $(LIST
    * $(B display)       an open #GdkDisplay
  )
*/
alias ModuleDisplayInitFunc = void delegate(gdk.display.Display display);

/**
    The type of function that is passed to
  [gtk.global.printRunPageSetupDialogAsync].
  
  This function will be called when the page setup dialog
  is dismissed, and also serves as destroy notify for data.

  ## Parameters
  $(LIST
    * $(B pageSetup)       the #GtkPageSetup that has been
  )
*/
alias PageSetupDoneFunc = void delegate(gtk.page_setup.PageSetup pageSetup);

/** */
alias PrintSettingsFunc = void delegate(string key, string value);

/** */
alias RcPropertyParser = bool delegate(gobject.param_spec.ParamSpec pspec, glib.string_.String rcString, gobject.value.Value propertyValue);

/**
    The type of function that is used with custom filters,
  see [gtk.recent_filter.RecentFilter.addCustom].

  ## Parameters
  $(LIST
    * $(B filterInfo)       a #GtkRecentFilterInfo that is filled according
       to the needed flags passed to [gtk.recent_filter.RecentFilter.addCustom]
  )
  Returns:     true if the file should be displayed
*/
alias RecentFilterFunc = bool delegate(gtk.recent_filter_info.RecentFilterInfo filterInfo);

/** */
alias RecentSortFunc = int delegate(gtk.recent_info.RecentInfo a, gtk.recent_info.RecentInfo b);

/** */
alias StylePropertyParser = bool delegate(string string_, gobject.value.Value value, GError **_err);

/**
    A function that is called to deserialize rich text that has been
  serialized with [gtk.text_buffer.TextBuffer.serialize], and insert it at iter.

  ## Parameters
  $(LIST
    * $(B registerBuffer)       the #GtkTextBuffer the format is registered with
    * $(B contentBuffer)       the #GtkTextBuffer to deserialize into
    * $(B iter)       insertion point for the deserialized text
    * $(B data)       data to deserialize
    * $(B createTags)       true if deserializing may create tags
  )
  Returns:     true on success, false otherwise
*/
alias TextBufferDeserializeFunc = bool delegate(gtk.text_buffer.TextBuffer registerBuffer, gtk.text_buffer.TextBuffer contentBuffer, gtk.text_iter.TextIter iter, ubyte[] data, bool createTags, GError **_err);

/** */
alias TextCharPredicate = bool delegate(dchar ch);

/** */
alias TextTagTableForeach = void delegate(gtk.text_tag.TextTag tag);

/**
    Callback type for adding a function to update animations. See [gtk.widget.Widget.addTickCallback].

  ## Parameters
  $(LIST
    * $(B widget)       the widget
    * $(B frameClock)       the frame clock for the widget (same as calling [gtk.widget.Widget.getFrameClock])
  )
  Returns:     `G_SOURCE_CONTINUE` if the tick callback should continue to be called,
     `G_SOURCE_REMOVE` if the tick callback should be removed.
*/
alias TickCallback = bool delegate(gtk.widget.Widget widget, gdk.frame_clock.FrameClock frameClock);

/**
    The function used to translate messages in e.g. #GtkIconFactory
  and #GtkActionGroup.

  ## Parameters
  $(LIST
    * $(B path)       The id of the message. In #GtkActionGroup this will be a label
        or tooltip from a #GtkActionEntry.
  )
  Returns:     the translated message
*/
alias TranslateFunc = string delegate(string path);

/**
    A function to set the properties of a cell instead of just using the
  straight mapping between the cell and the model.  This is useful for
  customizing the cell renderer.  For example, a function might get an
  integer from the tree_model, and render it to the “text” attribute of
  “cell” by converting it to its written equivalent.  This is set by
  calling [gtk.tree_view_column.TreeViewColumn.setCellDataFunc]

  ## Parameters
  $(LIST
    * $(B treeColumn)       A #GtkTreeViewColumn
    * $(B cell)       The #GtkCellRenderer that is being rendered by tree_column
    * $(B treeModel)       The #GtkTreeModel being rendered
    * $(B iter)       A #GtkTreeIter of the current row rendered
  )
*/
alias TreeCellDataFunc = void delegate(gtk.tree_view_column.TreeViewColumn treeColumn, gtk.cell_renderer.CellRenderer cell, gtk.tree_model.TreeModel treeModel, gtk.tree_iter.TreeIter iter);

/** */
alias TreeDestroyCountFunc = void delegate(gtk.tree_view.TreeView treeView, gtk.tree_path.TreePath path, int children);

/**
    A GtkTreeIterCompareFunc should return a negative integer, zero, or a positive
  integer if a sorts before b, a sorts with b, or a sorts after b
  respectively. If two iters compare as equal, their order in the sorted model
  is undefined. In order to ensure that the #GtkTreeSortable behaves as
  expected, the GtkTreeIterCompareFunc must define a partial order on
  the model, i.e. it must be reflexive, antisymmetric and transitive.
  
  For example, if model is a product catalogue, then a compare function
  for the “price” column could be one which returns
  `price_of(a) - price_of(b)`.

  ## Parameters
  $(LIST
    * $(B model)       The #GtkTreeModel the comparison is within
    * $(B a)       A #GtkTreeIter in model
    * $(B b)       Another #GtkTreeIter in model
  )
  Returns:     a negative integer, zero or a positive integer depending on whether
      a sorts before, with or after b
*/
alias TreeIterCompareFunc = int delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter a, gtk.tree_iter.TreeIter b);

/**
    A function which calculates display values from raw values in the model.
  It must fill value with the display value for the column column in the
  row indicated by iter.
  
  Since this function is called for each data access, it’s not a
  particularly efficient operation.

  ## Parameters
  $(LIST
    * $(B model)       the #GtkTreeModelFilter
    * $(B iter)       a #GtkTreeIter pointing to the row whose display values are determined
    * $(B value)       A #GValue which is already initialized for
       with the correct type for the column column.
    * $(B column)       the column whose display value is determined
  )
*/
alias TreeModelFilterModifyFunc = void delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter, out gobject.value.Value value, int column);

/**
    A function which decides whether the row indicated by iter is visible.

  ## Parameters
  $(LIST
    * $(B model)       the child model of the #GtkTreeModelFilter
    * $(B iter)       a #GtkTreeIter pointing to the row in model whose visibility
        is determined
  )
  Returns:     Whether the row indicated by iter is visible.
*/
alias TreeModelFilterVisibleFunc = bool delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter);

/**
    Type of the callback passed to [gtk.tree_model.TreeModel.foreach_] to
  iterate over the rows in a tree model.

  ## Parameters
  $(LIST
    * $(B model)       the #GtkTreeModel being iterated
    * $(B path)       the current #GtkTreePath
    * $(B iter)       the current #GtkTreeIter
  )
  Returns:     true to stop iterating, false to continue
*/
alias TreeModelForeachFunc = bool delegate(gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter);

/**
    A function used by [gtk.tree_selection.TreeSelection.selectedForeach] to map all
  selected rows.  It will be called on every selected row in the view.

  ## Parameters
  $(LIST
    * $(B model)       The #GtkTreeModel being viewed
    * $(B path)       The #GtkTreePath of a selected row
    * $(B iter)       A #GtkTreeIter pointing to a selected row
  )
*/
alias TreeSelectionForeachFunc = void delegate(gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter);

/**
    A function used by [gtk.tree_selection.TreeSelection.setSelectFunction] to filter
  whether or not a row may be selected.  It is called whenever a row's
  state might change.  A return value of true indicates to selection
  that it is okay to change the selection.

  ## Parameters
  $(LIST
    * $(B selection)       A #GtkTreeSelection
    * $(B model)       A #GtkTreeModel being viewed
    * $(B path)       The #GtkTreePath of the row in question
    * $(B pathCurrentlySelected)       true, if the path is currently selected
  )
  Returns:     true, if the selection state of the row can be toggled
*/
alias TreeSelectionFunc = bool delegate(gtk.tree_selection.TreeSelection selection, gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path, bool pathCurrentlySelected);

/**
    Function type for determining whether column can be dropped in a
  particular spot (as determined by prev_column and next_column).  In
  left to right locales, prev_column is on the left of the potential drop
  spot, and next_column is on the right.  In right to left mode, this is
  reversed.  This function should return true if the spot is a valid drop
  spot.  Please note that returning true does not actually indicate that
  the column drop was made, but is meant only to indicate a possible drop
  spot to the user.

  ## Parameters
  $(LIST
    * $(B treeView)       A #GtkTreeView
    * $(B column)       The #GtkTreeViewColumn being dragged
    * $(B prevColumn)       A #GtkTreeViewColumn on one side of column
    * $(B nextColumn)       A #GtkTreeViewColumn on the other side of column
  )
  Returns:     true, if column can be dropped in this spot
*/
alias TreeViewColumnDropFunc = bool delegate(gtk.tree_view.TreeView treeView, gtk.tree_view_column.TreeViewColumn column, gtk.tree_view_column.TreeViewColumn prevColumn, gtk.tree_view_column.TreeViewColumn nextColumn);

/**
    Function used for [gtk.tree_view.TreeView.mapExpandedRows].

  ## Parameters
  $(LIST
    * $(B treeView)       A #GtkTreeView
    * $(B path)       The path that’s expanded
  )
*/
alias TreeViewMappingFunc = void delegate(gtk.tree_view.TreeView treeView, gtk.tree_path.TreePath path);

/**
    Function type for determining whether the row pointed to by iter should
  be rendered as a separator. A common way to implement this is to have a
  boolean column in the model, whose values the #GtkTreeViewRowSeparatorFunc
  returns.

  ## Parameters
  $(LIST
    * $(B model)       the #GtkTreeModel
    * $(B iter)       a #GtkTreeIter pointing at a row in model
  )
  Returns:     true if the row is a separator
*/
alias TreeViewRowSeparatorFunc = bool delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter);

/**
    A function used for checking whether a row in model matches
  a search key string entered by the user. Note the return value
  is reversed from what you would normally expect, though it
  has some similarity to strcmp() returning 0 for equal strings.

  ## Parameters
  $(LIST
    * $(B model)       the #GtkTreeModel being searched
    * $(B column)       the search column set by [gtk.tree_view.TreeView.setSearchColumn]
    * $(B key)       the key string to compare with
    * $(B iter)       a #GtkTreeIter pointing the row of model that should be compared
       with key.
  )
  Returns:     false if the row matches, true otherwise.
*/
alias TreeViewSearchEqualFunc = bool delegate(gtk.tree_model.TreeModel model, int column, string key, gtk.tree_iter.TreeIter iter);

/** */
alias TreeViewSearchPositionFunc = void delegate(gtk.tree_view.TreeView treeView, gtk.widget.Widget searchDialog);

/**
    Accelerator flags used with [gtk.accel_group.AccelGroup.connect].
*/
enum AccelFlags : uint
{
  /**
      Accelerator is visible
  */
  Visible = 1,

  /**
      Accelerator not removable
  */
  Locked = 2,

  /**
      Mask
  */
  Mask = 7,
}

/**
    Controls how a widget deals with extra space in a single (x or y)
  dimension.
  
  Alignment only matters if the widget receives a “too large” allocation,
  for example if you packed the widget with the #GtkWidget:expand
  flag inside a #GtkBox, then the widget might get extra space.  If
  you have for example a 16x16 icon inside a 32x32 space, the icon
  could be scaled and stretched, it could be centered, or it could be
  positioned to one side of the space.
  
  Note that in horizontal context @GTK_ALIGN_START and @GTK_ALIGN_END
  are interpreted relative to text direction.
  
  GTK_ALIGN_BASELINE support for it is optional for containers and widgets, and
  it is only supported for vertical alignment.  When its not supported by
  a child or a container it is treated as @GTK_ALIGN_FILL.
*/
enum Align
{
  /**
      stretch to fill all space if possible, center if
        no meaningful way to stretch
  */
  Fill = 0,

  /**
      snap to left or top side, leaving space on right
        or bottom
  */
  Start = 1,

  /**
      snap to right or bottom side, leaving space on left
        or top
  */
  End = 2,

  /**
      center natural width of widget inside the
        allocation
  */
  Center = 3,

  /**
      align the widget according to the baseline. Since 3.10.
  */
  Baseline = 4,
}

/**
    Types of user actions that may be blocked by [gtk.application.Application.inhibit].
*/
enum ApplicationInhibitFlags : uint
{
  /**
      Inhibit ending the user session
        by logging out or by shutting down the computer
  */
  Logout = 1,

  /**
      Inhibit user switching
  */
  Switch = 2,

  /**
      Inhibit suspending the
        session or computer
  */
  Suspend = 4,

  /**
      Inhibit the session being
        marked as idle (and possibly locked)
  */
  Idle = 8,
}

/**
    Used to specify the placement of scroll arrows in scrolling menus.
*/
enum ArrowPlacement
{
  /**
      Place one arrow on each end of the menu.
  */
  Both = 0,

  /**
      Place both arrows at the top of the menu.
  */
  Start = 1,

  /**
      Place both arrows at the bottom of the menu.
  */
  End = 2,
}

/**
    Used to indicate the direction in which an arrow should point.
*/
enum ArrowType
{
  /**
      Represents an upward pointing arrow.
  */
  Up = 0,

  /**
      Represents a downward pointing arrow.
  */
  Down = 1,

  /**
      Represents a left pointing arrow.
  */
  Left = 2,

  /**
      Represents a right pointing arrow.
  */
  Right = 3,

  /**
      No arrow. Since 2.10.
  */
  None = 4,
}

/**
    An enum for determining the page role inside the #GtkAssistant. It's
  used to handle buttons sensitivity and visibility.
  
  Note that an assistant needs to end its page flow with a page of type
  [gtk.types.AssistantPageType.Confirm], [gtk.types.AssistantPageType.Summary] or
  [gtk.types.AssistantPageType.Progress] to be correct.
  
  The Cancel button will only be shown if the page isn’t “committed”.
  See [gtk.assistant.Assistant.commit] for details.
*/
enum AssistantPageType
{
  /**
      The page has regular contents. Both the
     Back and forward buttons will be shown.
  */
  Content = 0,

  /**
      The page contains an introduction to the
     assistant task. Only the Forward button will be shown if there is a
      next page.
  */
  Intro = 1,

  /**
      The page lets the user confirm or deny the
     changes. The Back and Apply buttons will be shown.
  */
  Confirm = 2,

  /**
      The page informs the user of the changes
     done. Only the Close button will be shown.
  */
  Summary = 3,

  /**
      Used for tasks that take a long time to
     complete, blocks the assistant until the page is marked as complete.
      Only the back button will be shown.
  */
  Progress = 4,

  /**
      Used for when other page types are not
     appropriate. No buttons will be shown, and the application must
     add its own buttons through [gtk.assistant.Assistant.addActionWidget].
  */
  Custom = 5,
}

/**
    Denotes the expansion properties that a widget will have when it (or its
  parent) is resized.
*/
enum AttachOptions : uint
{
  /**
      the widget should expand to take up any extra space in its
    container that has been allocated.
  */
  Expand = 1,

  /**
      the widget should shrink as and when possible.
  */
  Shrink = 2,

  /**
      the widget should fill the space allocated to it.
  */
  Fill = 4,
}

/**
    Whenever a container has some form of natural row it may align
  children in that row along a common typographical baseline. If
  the amount of verical space in the row is taller than the total
  requested height of the baseline-aligned children then it can use a
  #GtkBaselinePosition to select where to put the baseline inside the
  extra availible space.
*/
enum BaselinePosition
{
  /**
      Align the baseline at the top
  */
  Top = 0,

  /**
      Center the baseline
  */
  Center = 1,

  /**
      Align the baseline at the bottom
  */
  Bottom = 2,
}

/**
    Describes how the border of a UI element should be rendered.
*/
enum BorderStyle
{
  /**
      No visible border
  */
  None = 0,

  /**
      A single line segment
  */
  Solid = 1,

  /**
      Looks as if the content is sunken into the canvas
  */
  Inset = 2,

  /**
      Looks as if the content is coming out of the canvas
  */
  Outset = 3,

  /**
      Same as @GTK_BORDER_STYLE_NONE
  */
  Hidden = 4,

  /**
      A series of round dots
  */
  Dotted = 5,

  /**
      A series of square-ended dashes
  */
  Dashed = 6,

  /**
      Two parallel lines with some space between them
  */
  Double = 7,

  /**
      Looks as if it were carved in the canvas
  */
  Groove = 8,

  /**
      Looks as if it were coming out of the canvas
  */
  Ridge = 9,
}

/**
    Error codes that identify various errors that can occur while using
  #GtkBuilder.
*/
enum BuilderError
{
  /**
      A type-func attribute didn’t name
     a function that returns a #GType.
  */
  InvalidTypeFunction = 0,

  /**
      The input contained a tag that #GtkBuilder
     can’t handle.
  */
  UnhandledTag = 1,

  /**
      An attribute that is required by
     #GtkBuilder was missing.
  */
  MissingAttribute = 2,

  /**
      #GtkBuilder found an attribute that
     it doesn’t understand.
  */
  InvalidAttribute = 3,

  /**
      #GtkBuilder found a tag that
     it doesn’t understand.
  */
  InvalidTag = 4,

  /**
      A required property value was
     missing.
  */
  MissingPropertyValue = 5,

  /**
      #GtkBuilder couldn’t parse
     some attribute value.
  */
  InvalidValue = 6,

  /**
      The input file requires a newer version
     of GTK+.
  */
  VersionMismatch = 7,

  /**
      An object id occurred twice.
  */
  DuplicateId = 8,

  /**
      A specified object type is of the same type or
     derived from the type of the composite class being extended with builder XML.
  */
  ObjectTypeRefused = 9,

  /**
      The wrong type was specified in a composite class’s template XML
  */
  TemplateMismatch = 10,

  /**
      The specified property is unknown for the object class.
  */
  InvalidProperty = 11,

  /**
      The specified signal is unknown for the object class.
  */
  InvalidSignal = 12,

  /**
      An object id is unknown
  */
  InvalidId = 13,
}

/**
    Used to dictate the style that a #GtkButtonBox uses to layout the buttons it
  contains.
*/
enum ButtonBoxStyle
{
  /**
      Buttons are evenly spread across the box.
  */
  Spread = 1,

  /**
      Buttons are placed at the edges of the box.
  */
  Edge = 2,

  /**
      Buttons are grouped towards the start of the box,
      (on the left for a HBox, or the top for a VBox).
  */
  Start = 3,

  /**
      Buttons are grouped towards the end of the box,
      (on the right for a HBox, or the bottom for a VBox).
  */
  End = 4,

  /**
      Buttons are centered in the box. Since 2.12.
  */
  Center = 5,

  /**
      Buttons expand to fill the box. This entails giving
      buttons a "linked" appearance, making button sizes homogeneous, and
      setting spacing to 0 (same as calling [gtk.box.Box.setHomogeneous] and
      [gtk.box.Box.setSpacing] manually). Since 3.12.
  */
  Expand = 6,
}

/**
    The role specifies the desired appearance of a #GtkModelButton.
*/
enum ButtonRole
{
  /**
      A plain button
  */
  Normal = 0,

  /**
      A check button
  */
  Check = 1,

  /**
      A radio button
  */
  Radio = 2,
}

/**
    Prebuilt sets of buttons for the dialog. If
  none of these choices are appropriate, simply use [gtk.types.ButtonsType.None]
  then call [gtk.dialog.Dialog.addButtons].
  
  > Please note that [gtk.types.ButtonsType.Ok], [gtk.types.ButtonsType.YesNo]
  > and [gtk.types.ButtonsType.OkCancel] are discouraged by the
  > [GNOME Human Interface Guidelines](http://library.gnome.org/devel/hig-book/stable/).
*/
enum ButtonsType
{
  /**
      no buttons at all
  */
  None = 0,

  /**
      an OK button
  */
  Ok = 1,

  /**
      a Close button
  */
  Close = 2,

  /**
      a Cancel button
  */
  Cancel = 3,

  /**
      Yes and No buttons
  */
  YesNo = 4,

  /**
      OK and Cancel buttons
  */
  OkCancel = 5,
}

/**
    These options can be used to influence the display and behaviour of a #GtkCalendar.
*/
enum CalendarDisplayOptions : uint
{
  /**
      Specifies that the month and year should be displayed.
  */
  ShowHeading = 1,

  /**
      Specifies that three letter day descriptions should be present.
  */
  ShowDayNames = 2,

  /**
      Prevents the user from switching months with the calendar.
  */
  NoMonthChange = 4,

  /**
      Displays each week numbers of the current year, down the
    left side of the calendar.
  */
  ShowWeekNumbers = 8,

  /**
      Just show an indicator, not the full details
    text when details are provided. See [gtk.calendar.Calendar.setDetailFunc].
  */
  ShowDetails = 32,
}

/**
    Determines if the edited accelerators are GTK+ accelerators. If
  they are, consumed modifiers are suppressed, only accelerators
  accepted by GTK+ are allowed, and the accelerators are rendered
  in the same way as they are in menus.
*/
enum CellRendererAccelMode
{
  /**
      GTK+ accelerators mode
  */
  Gtk = 0,

  /**
      Other accelerator mode
    GTK_CELL_RENDERER_ACCEL_MODE_MODIFIER_TAP: Bare modifiers mode
  */
  Other = 1,

  /** */
  ModifierTap = 2,
}

/**
    Identifies how the user can interact with a particular cell.
*/
enum CellRendererMode
{
  /**
      The cell is just for display
     and cannot be interacted with.  Note that this doesn’t mean that eg. the
     row being drawn can’t be selected -- just that a particular element of
     it cannot be individually modified.
  */
  Inert = 0,

  /**
      The cell can be clicked.
  */
  Activatable = 1,

  /**
      The cell can be edited or otherwise modified.
  */
  Editable = 2,
}

/**
    Tells how a cell is to be rendered.
*/
enum CellRendererState : uint
{
  /**
      The cell is currently selected, and
     probably has a selection colored background to render to.
  */
  Selected = 1,

  /**
      The mouse is hovering over the cell.
  */
  Prelit = 2,

  /**
      The cell is drawn in an insensitive manner
  */
  Insensitive = 4,

  /**
      The cell is in a sorted row
  */
  Sorted = 8,

  /**
      The cell is in the focus row.
  */
  Focused = 16,

  /**
      The cell is in a row that can be expanded. Since 3.4
  */
  Expandable = 32,

  /**
      The cell is in a row that is expanded. Since 3.4
  */
  Expanded = 64,
}

/**
    Specifies which corner a child widget should be placed in when packed into
  a #GtkScrolledWindow. This is effectively the opposite of where the scroll
  bars are placed.
*/
enum CornerType
{
  /**
      Place the scrollbars on the right and bottom of the
     widget (default behaviour).
  */
  TopLeft = 0,

  /**
      Place the scrollbars on the top and right of the
     widget.
  */
  BottomLeft = 1,

  /**
      Place the scrollbars on the left and bottom of the
     widget.
  */
  TopRight = 2,

  /**
      Place the scrollbars on the top and left of the
     widget.
  */
  BottomRight = 3,
}

/**
    Error codes for `GTK_CSS_PROVIDER_ERROR`.
*/
enum CssProviderError
{
  /**
      Failed.
  */
  Failed = 0,

  /**
      Syntax error.
  */
  Syntax = 1,

  /**
      Import error.
  */
  Import = 2,

  /**
      Name error.
  */
  Name = 3,

  /**
      Deprecation error.
  */
  Deprecated = 4,

  /**
      Unknown value.
  */
  UnknownValue = 5,
}

/**
    The different types of sections indicate parts of a CSS document as
  parsed by GTK’s CSS parser. They are oriented towards the
  [CSS Grammar](http://www.w3.org/TR/CSS21/grammar.html),
  but may contain extensions.
  
  More types might be added in the future as the parser incorporates
  more features.
*/
enum CssSectionType
{
  /**
      The section describes a complete document.
      This section time is the only one where [gtk.css_section.CssSection.getParent]
      might return null.
  */
  Document = 0,

  /**
      The section defines an import rule.
  */
  Import = 1,

  /**
      The section defines a color. This
      is a GTK extension to CSS.
  */
  ColorDefinition = 2,

  /**
      The section defines a binding set. This
      is a GTK extension to CSS.
  */
  BindingSet = 3,

  /**
      The section defines a CSS ruleset.
  */
  Ruleset = 4,

  /**
      The section defines a CSS selector.
  */
  Selector = 5,

  /**
      The section defines the declaration of
      a CSS variable.
  */
  Declaration = 6,

  /**
      The section defines the value of a CSS declaration.
  */
  Value = 7,

  /**
      The section defines keyframes. See [CSS
      Animations](http://dev.w3.org/csswg/css3-animations/#keyframes) for details. Since 3.6
  */
  Keyframes = 8,
}

/** */
enum DebugFlag : uint
{
  /** */
  Misc = 1,

  /** */
  Plugsocket = 2,

  /** */
  Text = 4,

  /** */
  Tree = 8,

  /** */
  Updates = 16,

  /** */
  Keybindings = 32,

  /** */
  Multihead = 64,

  /** */
  Modules = 128,

  /** */
  Geometry = 256,

  /** */
  Icontheme = 512,

  /** */
  Printing = 1024,

  /** */
  Builder = 2048,

  /** */
  SizeRequest = 4096,

  /** */
  NoCssCache = 8192,

  /** */
  Baselines = 16384,

  /** */
  PixelCache = 32768,

  /** */
  NoPixelCache = 65536,

  /** */
  Interactive = 131072,

  /** */
  Touchscreen = 262144,

  /** */
  Actions = 524288,

  /** */
  Resize = 1048576,

  /** */
  Layout = 2097152,
}

/**
    See also: #GtkEntry::delete-from-cursor.
*/
enum DeleteType
{
  /**
      Delete characters.
  */
  Chars = 0,

  /**
      Delete only the portion of the word to the
      left/right of cursor if we’re in the middle of a word.
  */
  WordEnds = 1,

  /**
      Delete words.
  */
  Words = 2,

  /**
      Delete display-lines. Display-lines
      refers to the visible lines, with respect to to the current line
      breaks. As opposed to paragraphs, which are defined by line
      breaks in the input.
  */
  DisplayLines = 3,

  /**
      Delete only the portion of the
      display-line to the left/right of cursor.
  */
  DisplayLineEnds = 4,

  /**
      Delete to the end of the
      paragraph. Like C-k in Emacs (or its reverse).
  */
  ParagraphEnds = 5,

  /**
      Delete entire line. Like C-k in pico.
  */
  Paragraphs = 6,

  /**
      Delete only whitespace. Like M-\ in Emacs.
  */
  Whitespace = 7,
}

/**
    The #GtkDestDefaults enumeration specifies the various
  types of action that will be taken on behalf
  of the user for a drag destination site.
*/
enum DestDefaults : uint
{
  /**
      If set for a widget, GTK+, during a drag over this
      widget will check if the drag matches this widget’s list of possible targets
      and actions.
      GTK+ will then call [gdk.global.dragStatus] as appropriate.
  */
  Motion = 1,

  /**
      If set for a widget, GTK+ will draw a highlight on
      this widget as long as a drag is over this widget and the widget drag format
      and action are acceptable.
  */
  Highlight = 2,

  /**
      If set for a widget, when a drop occurs, GTK+ will
      will check if the drag matches this widget’s list of possible targets and
      actions. If so, GTK+ will call [gtk.widget.Widget.dragGetData] on behalf of the widget.
      Whether or not the drop is successful, GTK+ will call [gtk.global.dragFinish]. If
      the action was a move, then if the drag was successful, then true will be
      passed for the @delete parameter to [gtk.global.dragFinish].
  */
  Drop = 4,

  /**
      If set, specifies that all default actions should
      be taken.
  */
  All = 7,
}

/**
    Flags used to influence dialog construction.
*/
enum DialogFlags : uint
{
  /**
      Make the constructed dialog modal,
        see [gtk.window.Window.setModal]
  */
  Modal = 1,

  /**
      Destroy the dialog when its
        parent is destroyed, see [gtk.window.Window.setDestroyWithParent]
  */
  DestroyWithParent = 2,

  /**
      Create dialog with actions in header
        bar instead of action area. Since 3.12.
  */
  UseHeaderBar = 4,
}

/**
    Focus movement types.
*/
enum DirectionType
{
  /**
      Move forward.
  */
  TabForward = 0,

  /**
      Move backward.
  */
  TabBackward = 1,

  /**
      Move up.
  */
  Up = 2,

  /**
      Move down.
  */
  Down = 3,

  /**
      Move left.
  */
  Left = 4,

  /**
      Move right.
  */
  Right = 5,
}

/**
    Gives an indication why a drag operation failed.
  The value can by obtained by connecting to the
  #GtkWidget::drag-failed signal.
*/
enum DragResult
{
  /**
      The drag operation was successful.
  */
  Success = 0,

  /**
      No suitable drag target.
  */
  NoTarget = 1,

  /**
      The user cancelled the drag operation.
  */
  UserCancelled = 2,

  /**
      The drag operation timed out.
  */
  TimeoutExpired = 3,

  /**
      The pointer or keyboard grab used
     for the drag operation was broken.
  */
  GrabBroken = 4,

  /**
      The drag operation failed due to some
     unspecified error.
  */
  Error = 5,
}

/**
    Specifies the side of the entry at which an icon is placed.
*/
enum EntryIconPosition
{
  /**
      At the beginning of the entry (depending on the text direction).
  */
  Primary = 0,

  /**
      At the end of the entry (depending on the text direction).
  */
  Secondary = 1,
}

/**
    Describes the behavior of a #GtkEventControllerScroll.
*/
enum EventControllerScrollFlags : uint
{
  /**
      Don't emit scroll.
  */
  None = 0,

  /**
      Emit scroll with vertical deltas.
  */
  Vertical = 1,

  /**
      Emit scroll with horizontal deltas.
  */
  Horizontal = 2,

  /**
      Only emit deltas that are multiples of 1.
  */
  Discrete = 4,

  /**
      Emit #GtkEventControllerScroll::decelerate
      after continuous scroll finishes.
  */
  Kinetic = 8,

  /**
      Emit scroll on both axes.
  */
  BothAxes = 3,
}

/**
    Describes the state of a #GdkEventSequence in a #GtkGesture.
*/
enum EventSequenceState
{
  /**
      The sequence is handled, but not grabbed.
  */
  None = 0,

  /**
      The sequence is handled and grabbed.
  */
  Claimed = 1,

  /**
      The sequence is denied.
  */
  Denied = 2,
}

/**
    Used to specify the style of the expanders drawn by a #GtkTreeView.
*/
enum ExpanderStyle
{
  /**
      The style used for a collapsed subtree.
  */
  Collapsed = 0,

  /**
      Intermediate style used during animation.
  */
  SemiCollapsed = 1,

  /**
      Intermediate style used during animation.
  */
  SemiExpanded = 2,

  /**
      The style used for an expanded subtree.
  */
  Expanded = 3,
}

/**
    Describes whether a #GtkFileChooser is being used to open existing files
  or to save to a possibly new file.
*/
enum FileChooserAction
{
  /**
      Indicates open mode.  The file chooser
     will only let the user pick an existing file.
  */
  Open = 0,

  /**
      Indicates save mode.  The file chooser
     will let the user pick an existing file, or type in a new
     filename.
  */
  Save = 1,

  /**
      Indicates an Open mode for
     selecting folders.  The file chooser will let the user pick an
     existing folder.
  */
  SelectFolder = 2,

  /**
      Indicates a mode for creating a
     new folder.  The file chooser will let the user name an existing or
     new folder.
  */
  CreateFolder = 3,
}

/**
    Used as a return value of handlers for the
  #GtkFileChooser::confirm-overwrite signal of a #GtkFileChooser. This
  value determines whether the file chooser will present the stock
  confirmation dialog, accept the user’s choice of a filename, or
  let the user choose another filename.
*/
enum FileChooserConfirmation
{
  /**
      The file chooser will present
     its stock dialog to confirm about overwriting an existing file.
  */
  Confirm = 0,

  /**
      The file chooser will
     terminate and accept the user’s choice of a file name.
  */
  AcceptFilename = 1,

  /**
      The file chooser will
     continue running, so as to let the user select another file name.
  */
  SelectAgain = 2,
}

/**
    These identify the various errors that can occur while calling
  #GtkFileChooser functions.
*/
enum FileChooserError
{
  /**
      Indicates that a file does not exist.
  */
  Nonexistent = 0,

  /**
      Indicates a malformed filename.
  */
  BadFilename = 1,

  /**
      Indicates a duplicate path (e.g. when
     adding a bookmark).
  */
  AlreadyExists = 2,

  /**
      Indicates an incomplete hostname (e.g. "http://foo" without a slash after that).
  */
  IncompleteHostname = 3,
}

/**
    These flags indicate what parts of a #GtkFileFilterInfo struct
  are filled or need to be filled.
*/
enum FileFilterFlags : uint
{
  /**
      the filename of the file being tested
  */
  Filename = 1,

  /**
      the URI for the file being tested
  */
  Uri = 2,

  /**
      the string that will be used to
      display the file in the file chooser
  */
  DisplayName = 4,

  /**
      the mime type of the file
  */
  MimeType = 8,
}

/**
    This enumeration specifies the granularity of font selection
  that is desired in a font chooser.
  
  This enumeration may be extended in the future; applications should
  ignore unknown values.
*/
enum FontChooserLevel : uint
{
  /**
      Allow selecting a font family
  */
  Family = 0,

  /**
      Allow selecting a specific font face
  */
  Style = 1,

  /**
      Allow selecting a specific font size
  */
  Size = 2,

  /** */
  Variations = 4,

  /**
      Allow selecting specific OpenType font features
  */
  Features = 8,
}

/**
    Style for input method preedit. See also
  #GtkSettings:gtk-im-preedit-style
*/
enum IMPreeditStyle
{
  /**
      Deprecated
  */
  Nothing = 0,

  /**
      Deprecated
  */
  Callback = 1,

  /**
      Deprecated
  */
  None = 2,
}

/**
    Style for input method status. See also
  #GtkSettings:gtk-im-status-style
*/
enum IMStatusStyle
{
  /**
      Deprecated
  */
  Nothing = 0,

  /**
      Deprecated
  */
  Callback = 1,

  /**
      Deprecated
  */
  None = 2,
}

/**
    Used to specify options for [gtk.icon_theme.IconTheme.lookupIcon]
*/
enum IconLookupFlags : uint
{
  /**
      Never get SVG icons, even if gdk-pixbuf
      supports them. Cannot be used together with [gtk.types.IconLookupFlags.ForceSvg].
  */
  NoSvg = 1,

  /**
      Get SVG icons, even if gdk-pixbuf
      doesn’t support them.
      Cannot be used together with [gtk.types.IconLookupFlags.NoSvg].
  */
  ForceSvg = 2,

  /**
      When passed to
      [gtk.icon_theme.IconTheme.lookupIcon] includes builtin icons
      as well as files. For a builtin icon, [gtk.icon_info.IconInfo.getFilename]
      is null and you need to call [gtk.icon_info.IconInfo.getBuiltinPixbuf].
  */
  UseBuiltin = 4,

  /**
      Try to shorten icon name at '-'
      characters before looking at inherited themes. This flag is only
      supported in functions that take a single icon name. For more general
      fallback, see [gtk.icon_theme.IconTheme.chooseIcon]. Since 2.12.
  */
  GenericFallback = 8,

  /**
      Always get the icon scaled to the
      requested size. Since 2.14.
  */
  ForceSize = 16,

  /**
      Try to always load regular icons, even
      when symbolic icon names are given. Since 3.14.
  */
  ForceRegular = 32,

  /**
      Try to always load symbolic icons, even
      when regular icon names are given. Since 3.14.
  */
  ForceSymbolic = 64,

  /**
      Try to load a variant of the icon for left-to-right
      text direction. Since 3.14.
  */
  DirLtr = 128,

  /**
      Try to load a variant of the icon for right-to-left
      text direction. Since 3.14.
  */
  DirRtl = 256,
}

/**
    Built-in stock icon sizes.
*/
enum IconSize
{
  /**
      Invalid size.
  */
  Invalid = 0,

  /**
      Size appropriate for menus (16px).
  */
  Menu = 1,

  /**
      Size appropriate for small toolbars (16px).
  */
  SmallToolbar = 2,

  /**
      Size appropriate for large toolbars (24px)
  */
  LargeToolbar = 3,

  /**
      Size appropriate for buttons (16px)
  */
  Button = 4,

  /**
      Size appropriate for drag and drop (32px)
  */
  Dnd = 5,

  /**
      Size appropriate for dialogs (48px)
  */
  Dialog = 6,
}

/**
    Error codes for GtkIconTheme operations.
*/
enum IconThemeError
{
  /**
      The icon specified does not exist in the theme
  */
  NotFound = 0,

  /**
      An unspecified error occurred.
  */
  Failed = 1,
}

/**
    An enum for determining where a dropped item goes.
*/
enum IconViewDropPosition
{
  /**
      no drop possible
  */
  NoDrop = 0,

  /**
      dropped item replaces the item
  */
  DropInto = 1,

  /**
      droppped item is inserted to the left
  */
  DropLeft = 2,

  /**
      dropped item is inserted to the right
  */
  DropRight = 3,

  /**
      dropped item is inserted above
  */
  DropAbove = 4,

  /**
      dropped item is inserted below
  */
  DropBelow = 5,
}

/**
    Describes the image data representation used by a #GtkImage. If you
  want to get the image from the widget, you can only get the
  currently-stored representation. e.g.  if the
  [gtk.image.Image.getStorageType] returns #GTK_IMAGE_PIXBUF, then you can
  call [gtk.image.Image.getPixbuf] but not [gtk.image.Image.getStock].  For empty
  images, you can request any storage type (call any of the "get"
  functions), but they will all return null values.
*/
enum ImageType
{
  /**
      there is no image displayed by the widget
  */
  Empty = 0,

  /**
      the widget contains a #GdkPixbuf
  */
  Pixbuf = 1,

  /**
      the widget contains a [stock item name][gtkstock]
  */
  Stock = 2,

  /**
      the widget contains a #GtkIconSet
  */
  IconSet = 3,

  /**
      the widget contains a #GdkPixbufAnimation
  */
  Animation = 4,

  /**
      the widget contains a named icon.
     This image type was added in GTK+ 2.6
  */
  IconName = 5,

  /**
      the widget contains a #GIcon.
     This image type was added in GTK+ 2.14
  */
  Gicon = 6,

  /**
      the widget contains a #cairo_surface_t.
     This image type was added in GTK+ 3.10
  */
  Surface = 7,
}

/**
    Describes hints that might be taken into account by input methods
  or applications. Note that input methods may already tailor their
  behaviour according to the #GtkInputPurpose of the entry.
  
  Some common sense is expected when using these flags - mixing
  @GTK_INPUT_HINT_LOWERCASE with any of the uppercase hints makes no sense.
  
  This enumeration may be extended in the future; input methods should
  ignore unknown values.
*/
enum InputHints : uint
{
  /**
      No special behaviour suggested
  */
  None = 0,

  /**
      Suggest checking for typos
  */
  Spellcheck = 1,

  /**
      Suggest not checking for typos
  */
  NoSpellcheck = 2,

  /**
      Suggest word completion
  */
  WordCompletion = 4,

  /**
      Suggest to convert all text to lowercase
  */
  Lowercase = 8,

  /**
      Suggest to capitalize all text
  */
  UppercaseChars = 16,

  /**
      Suggest to capitalize the first
        character of each word
  */
  UppercaseWords = 32,

  /**
      Suggest to capitalize the
        first word of each sentence
  */
  UppercaseSentences = 64,

  /**
      Suggest to not show an onscreen keyboard
        (e.g for a calculator that already has all the keys).
  */
  InhibitOsk = 128,

  /**
      The text is vertical. Since 3.18
  */
  VerticalWriting = 256,

  /**
      Suggest offering Emoji support. Since 3.22.20
  */
  Emoji = 512,

  /**
      Suggest not offering Emoji support. Since 3.22.20
  */
  NoEmoji = 1024,
}

/**
    Describes primary purpose of the input widget. This information is
  useful for on-screen keyboards and similar input methods to decide
  which keys should be presented to the user.
  
  Note that the purpose is not meant to impose a totally strict rule
  about allowed characters, and does not replace input validation.
  It is fine for an on-screen keyboard to let the user override the
  character set restriction that is expressed by the purpose. The
  application is expected to validate the entry contents, even if
  it specified a purpose.
  
  The difference between @GTK_INPUT_PURPOSE_DIGITS and
  @GTK_INPUT_PURPOSE_NUMBER is that the former accepts only digits
  while the latter also some punctuation (like commas or points, plus,
  minus) and “e” or “E” as in 3.14E+000.
  
  This enumeration may be extended in the future; input methods should
  interpret unknown values as “free form”.
*/
enum InputPurpose
{
  /**
      Allow any character
  */
  FreeForm = 0,

  /**
      Allow only alphabetic characters
  */
  Alpha = 1,

  /**
      Allow only digits
  */
  Digits = 2,

  /**
      Edited field expects numbers
  */
  Number = 3,

  /**
      Edited field expects phone number
  */
  Phone = 4,

  /**
      Edited field expects URL
  */
  Url = 5,

  /**
      Edited field expects email address
  */
  Email = 6,

  /**
      Edited field expects the name of a person
  */
  Name = 7,

  /**
      Like @GTK_INPUT_PURPOSE_FREE_FORM, but characters are hidden
  */
  Password = 8,

  /**
      Like @GTK_INPUT_PURPOSE_DIGITS, but characters are hidden
  */
  Pin = 9,

  /**
      Allow any character, in addition to control codes
  */
  Terminal = 10,
}

/**
    Describes how a rendered element connects to adjacent elements.
*/
enum JunctionSides : uint
{
  /**
      No junctions.
  */
  None = 0,

  /**
      Element connects on the top-left corner.
  */
  CornerTopleft = 1,

  /**
      Element connects on the top-right corner.
  */
  CornerTopright = 2,

  /**
      Element connects on the bottom-left corner.
  */
  CornerBottomleft = 4,

  /**
      Element connects on the bottom-right corner.
  */
  CornerBottomright = 8,

  /**
      Element connects on the top side.
  */
  Top = 3,

  /**
      Element connects on the bottom side.
  */
  Bottom = 12,

  /**
      Element connects on the left side.
  */
  Left = 5,

  /**
      Element connects on the right side.
  */
  Right = 10,
}

/**
    Used for justifying the text inside a #GtkLabel widget. (See also
  #GtkAlignment).
*/
enum Justification
{
  /**
      The text is placed at the left edge of the label.
  */
  Left = 0,

  /**
      The text is placed at the right edge of the label.
  */
  Right = 1,

  /**
      The text is placed in the center of the label.
  */
  Center = 2,

  /**
      The text is placed is distributed across the label.
  */
  Fill = 3,
}

/**
    Describes how #GtkLevelBar contents should be rendered.
  Note that this enumeration could be extended with additional modes
  in the future.
*/
enum LevelBarMode
{
  /**
      the bar has a continuous mode
  */
  Continuous = 0,

  /**
      the bar has a discrete mode
  */
  Discrete = 1,
}

/**
    The type of license for an application.
  
  This enumeration can be expanded at later date.
*/
enum License
{
  /**
      No license specified
  */
  Unknown = 0,

  /**
      A license text is going to be specified by the
      developer
  */
  Custom = 1,

  /**
      The GNU General Public License, version 2.0 or later
  */
  Gpl20 = 2,

  /**
      The GNU General Public License, version 3.0 or later
  */
  Gpl30 = 3,

  /**
      The GNU Lesser General Public License, version 2.1 or later
  */
  Lgpl21 = 4,

  /**
      The GNU Lesser General Public License, version 3.0 or later
  */
  Lgpl30 = 5,

  /**
      The BSD standard license
  */
  Bsd = 6,

  /**
      The MIT/X11 standard license
  */
  MitX11 = 7,

  /**
      The Artistic License, version 2.0
  */
  Artistic = 8,

  /**
      The GNU General Public License, version 2.0 only. Since 3.12.
  */
  Gpl20Only = 9,

  /**
      The GNU General Public License, version 3.0 only. Since 3.12.
  */
  Gpl30Only = 10,

  /**
      The GNU Lesser General Public License, version 2.1 only. Since 3.12.
  */
  Lgpl21Only = 11,

  /**
      The GNU Lesser General Public License, version 3.0 only. Since 3.12.
  */
  Lgpl30Only = 12,

  /**
      The GNU Affero General Public License, version 3.0 or later. Since: 3.22.
  */
  Agpl30 = 13,

  /**
      The GNU Affero General Public License, version 3.0 only. Since: 3.22.27.
  */
  Agpl30Only = 14,

  /**
      The 3-clause BSD licence. Since: 3.24.20.
  */
  Bsd3 = 15,

  /**
      The Apache License, version 2.0. Since: 3.24.20.
  */
  Apache20 = 16,

  /**
      The Mozilla Public License, version 2.0. Since: 3.24.20.
  */
  Mpl20 = 17,
}

/**
    An enumeration representing directional movements within a menu.
*/
enum MenuDirectionType
{
  /**
      To the parent menu shell
  */
  Parent = 0,

  /**
      To the submenu, if any, associated with the item
  */
  Child = 1,

  /**
      To the next menu item
  */
  Next = 2,

  /**
      To the previous menu item
  */
  Prev = 3,
}

/**
    The type of message being displayed in the dialog.
*/
enum MessageType
{
  /**
      Informational message
  */
  Info = 0,

  /**
      Non-fatal warning message
  */
  Warning = 1,

  /**
      Question requiring a choice
  */
  Question = 2,

  /**
      Fatal error message
  */
  Error = 3,

  /**
      None of the above
  */
  Other = 4,
}

/** */
enum MovementStep
{
  /**
      Move forward or back by graphemes
  */
  LogicalPositions = 0,

  /**
      Move left or right by graphemes
  */
  VisualPositions = 1,

  /**
      Move forward or back by words
  */
  Words = 2,

  /**
      Move up or down lines (wrapped lines)
  */
  DisplayLines = 3,

  /**
      Move to either end of a line
  */
  DisplayLineEnds = 4,

  /**
      Move up or down paragraphs (newline-ended lines)
  */
  Paragraphs = 5,

  /**
      Move to either end of a paragraph
  */
  ParagraphEnds = 6,

  /**
      Move by pages
  */
  Pages = 7,

  /**
      Move to ends of the buffer
  */
  BufferEnds = 8,

  /**
      Move horizontally by pages
  */
  HorizontalPages = 9,
}

/** */
enum NotebookTab
{
  /** */
  First = 0,

  /** */
  Last = 1,
}

/**
    Used to determine the layout of pages on a sheet when printing
  multiple pages per sheet.
*/
enum NumberUpLayout
{
  /**
      ![](layout-lrtb.png)
  */
  Lrtb = 0,

  /**
      ![](layout-lrbt.png)
  */
  Lrbt = 1,

  /**
      ![](layout-rltb.png)
  */
  Rltb = 2,

  /**
      ![](layout-rlbt.png)
  */
  Rlbt = 3,

  /**
      ![](layout-tblr.png)
  */
  Tblr = 4,

  /**
      ![](layout-tbrl.png)
  */
  Tbrl = 5,

  /**
      ![](layout-btlr.png)
  */
  Btlr = 6,

  /**
      ![](layout-btrl.png)
  */
  Btrl = 7,
}

/**
    Represents the orientation of widgets and other objects which can be switched
  between horizontal and vertical orientation on the fly, like #GtkToolbar or
  #GtkGesturePan.
*/
enum Orientation
{
  /**
      The element is in horizontal orientation.
  */
  Horizontal = 0,

  /**
      The element is in vertical orientation.
  */
  Vertical = 1,
}

/**
    Determines how widgets should be packed inside menubars
  and menuitems contained in menubars.
*/
enum PackDirection
{
  /**
      Widgets are packed left-to-right
  */
  Ltr = 0,

  /**
      Widgets are packed right-to-left
  */
  Rtl = 1,

  /**
      Widgets are packed top-to-bottom
  */
  Ttb = 2,

  /**
      Widgets are packed bottom-to-top
  */
  Btt = 3,
}

/**
    Represents the packing location #GtkBox children. (See: #GtkVBox,
  #GtkHBox, and #GtkButtonBox).
*/
enum PackType
{
  /**
      The child is packed into the start of the box
  */
  Start = 0,

  /**
      The child is packed into the end of the box
  */
  End = 1,
}

/**
    The type of a pad action.
*/
enum PadActionType
{
  /**
      Action is triggered by a pad button
  */
  Button = 0,

  /**
      Action is triggered by a pad ring
  */
  Ring = 1,

  /**
      Action is triggered by a pad strip
  */
  Strip = 2,
}

/**
    See also [gtk.print_settings.PrintSettings.setOrientation].
*/
enum PageOrientation
{
  /**
      Portrait mode.
  */
  Portrait = 0,

  /**
      Landscape mode.
  */
  Landscape = 1,

  /**
      Reverse portrait mode.
  */
  ReversePortrait = 2,

  /**
      Reverse landscape mode.
  */
  ReverseLandscape = 3,
}

/**
    See also [gtk.print_job.PrintJob.setPageSet].
*/
enum PageSet
{
  /**
      All pages.
  */
  All = 0,

  /**
      Even pages.
  */
  Even = 1,

  /**
      Odd pages.
  */
  Odd = 2,
}

/**
    Describes the panning direction of a #GtkGesturePan
*/
enum PanDirection
{
  /**
      panned towards the left
  */
  Left = 0,

  /**
      panned towards the right
  */
  Right = 1,

  /**
      panned upwards
  */
  Up = 2,

  /**
      panned downwards
  */
  Down = 3,
}

/**
    Priorities for path lookups.
  See also [gtk.binding_set.BindingSet.addPath].
*/
enum PathPriorityType
{
  /**
      Deprecated
  */
  Lowest = 0,

  /**
      Deprecated
  */
  Gtk = 4,

  /**
      Deprecated
  */
  Application = 8,

  /**
      Deprecated
  */
  Theme = 10,

  /**
      Deprecated
  */
  Rc = 12,

  /**
      Deprecated
  */
  Highest = 15,
}

/**
    Widget path types.
  See also [gtk.binding_set.BindingSet.addPath].
*/
enum PathType
{
  /**
      Deprecated
  */
  Widget = 0,

  /**
      Deprecated
  */
  WidgetClass = 1,

  /**
      Deprecated
  */
  Class = 2,
}

/**
    These flags serve two purposes.  First, the application can call [gtk.places_sidebar.PlacesSidebar.setOpenFlags]
  using these flags as a bitmask.  This tells the sidebar that the application is able to open
  folders selected from the sidebar in various ways, for example, in new tabs or in new windows in
  addition to the normal mode.
  
  Second, when one of these values gets passed back to the application in the
  #GtkPlacesSidebar::open-location signal, it means that the application should
  open the selected location in the normal way, in a new tab, or in a new
  window.  The sidebar takes care of determining the desired way to open the location,
  based on the modifier keys that the user is pressing at the time the selection is made.
  
  If the application never calls [gtk.places_sidebar.PlacesSidebar.setOpenFlags], then the sidebar will only
  use #GTK_PLACES_OPEN_NORMAL in the #GtkPlacesSidebar::open-location signal.  This is the
  default mode of operation.
*/
enum PlacesOpenFlags : uint
{
  /**
      This is the default mode that #GtkPlacesSidebar uses if no other flags
     are specified.  It indicates that the calling application should open the selected location
     in the normal way, for example, in the folder view beside the sidebar.
  */
  Normal = 1,

  /**
      When passed to [gtk.places_sidebar.PlacesSidebar.setOpenFlags], this indicates
     that the application can open folders selected from the sidebar in new tabs.  This value
     will be passed to the #GtkPlacesSidebar::open-location signal when the user selects
     that a location be opened in a new tab instead of in the standard fashion.
  */
  NewTab = 2,

  /**
      Similar to @GTK_PLACES_OPEN_NEW_TAB, but indicates that the application
     can open folders in new windows.
  */
  NewWindow = 4,
}

/**
    Determines how the size should be computed to achieve the one of the
  visibility mode for the scrollbars.
*/
enum PolicyType
{
  /**
      The scrollbar is always visible. The view size is
     independent of the content.
  */
  Always = 0,

  /**
      The scrollbar will appear and disappear as necessary.
     For example, when all of a #GtkTreeView can not be seen.
  */
  Automatic = 1,

  /**
      The scrollbar should never appear. In this mode the
     content determines the size.
  */
  Never = 2,

  /**
      Don't show a scrollbar, but don't force the
     size to follow the content. This can be used e.g. to make multiple
     scrolled windows share a scrollbar. Since: 3.16
  */
  External = 3,
}

/**
    Describes constraints to positioning of popovers. More values
  may be added to this enumeration in the future.
*/
enum PopoverConstraint
{
  /**
      Don't constrain the popover position
      beyond what is imposed by the implementation
  */
  None = 0,

  /**
      Constrain the popover to the boundaries
      of the window that it is attached to
  */
  Window = 1,
}

/**
    Describes which edge of a widget a certain feature is positioned at, e.g. the
  tabs of a #GtkNotebook, the handle of a #GtkHandleBox or the label of a
  #GtkScale.
*/
enum PositionType
{
  /**
      The feature is at the left edge.
  */
  Left = 0,

  /**
      The feature is at the right edge.
  */
  Right = 1,

  /**
      The feature is at the top edge.
  */
  Top = 2,

  /**
      The feature is at the bottom edge.
  */
  Bottom = 3,
}

/**
    See also [gtk.print_settings.PrintSettings.setDuplex].
*/
enum PrintDuplex
{
  /**
      No duplex.
  */
  Simplex = 0,

  /**
      Horizontal duplex.
  */
  Horizontal = 1,

  /**
      Vertical duplex.
  */
  Vertical = 2,
}

/**
    Error codes that identify various errors that can occur while
  using the GTK+ printing support.
*/
enum PrintError
{
  /**
      An unspecified error occurred.
  */
  General = 0,

  /**
      An internal error occurred.
  */
  InternalError = 1,

  /**
      A memory allocation failed.
  */
  Nomem = 2,

  /**
      An error occurred while loading a page setup
        or paper size from a key file.
  */
  InvalidFile = 3,
}

/**
    The @action parameter to [gtk.print_operation.PrintOperation.run]
  determines what action the print operation should perform.
*/
enum PrintOperationAction
{
  /**
      Show the print dialog.
  */
  PrintDialog = 0,

  /**
      Start to print without showing
        the print dialog, based on the current print settings.
  */
  Print = 1,

  /**
      Show the print preview.
  */
  Preview = 2,

  /**
      Export to a file. This requires
        the export-filename property to be set.
  */
  Export = 3,
}

/**
    A value of this type is returned by [gtk.print_operation.PrintOperation.run].
*/
enum PrintOperationResult
{
  /**
      An error has occurred.
  */
  Error = 0,

  /**
      The print settings should be stored.
  */
  Apply = 1,

  /**
      The print operation has been canceled,
        the print settings should not be stored.
  */
  Cancel = 2,

  /**
      The print operation is not complete
        yet. This value will only be returned when running asynchronously.
  */
  InProgress = 3,
}

/**
    See also [gtk.print_job.PrintJob.setPages]
*/
enum PrintPages
{
  /**
      All pages.
  */
  All = 0,

  /**
      Current page.
  */
  Current = 1,

  /**
      Range of pages.
  */
  Ranges = 2,

  /**
      Selected pages.
  */
  Selection = 3,
}

/**
    See also [gtk.print_settings.PrintSettings.setQuality].
*/
enum PrintQuality
{
  /**
      Low quality.
  */
  Low = 0,

  /**
      Normal quality.
  */
  Normal = 1,

  /**
      High quality.
  */
  High = 2,

  /**
      Draft quality.
  */
  Draft = 3,
}

/**
    The status gives a rough indication of the completion of a running
  print operation.
*/
enum PrintStatus
{
  /**
      The printing has not started yet; this
        status is set initially, and while the print dialog is shown.
  */
  Initial = 0,

  /**
      This status is set while the begin-print
        signal is emitted and during pagination.
  */
  Preparing = 1,

  /**
      This status is set while the
        pages are being rendered.
  */
  GeneratingData = 2,

  /**
      The print job is being sent off to the
        printer.
  */
  SendingData = 3,

  /**
      The print job has been sent to the printer,
        but is not printed for some reason, e.g. the printer may be stopped.
  */
  Pending = 4,

  /**
      Some problem has occurred during
        printing, e.g. a paper jam.
  */
  PendingIssue = 5,

  /**
      The printer is processing the print job.
  */
  Printing = 6,

  /**
      The printing has been completed successfully.
  */
  Finished = 7,

  /**
      The printing has been aborted.
  */
  FinishedAborted = 8,
}

/**
    Describes the stage at which events are fed into a #GtkEventController.
*/
enum PropagationPhase
{
  /**
      Events are not delivered automatically. Those can be
      manually fed through [gtk.event_controller.EventController.handleEvent]. This should
      only be used when full control about when, or whether the controller
      handles the event is needed.
  */
  None = 0,

  /**
      Events are delivered in the capture phase. The
      capture phase happens before the bubble phase, runs from the toplevel down
      to the event widget. This option should only be used on containers that
      might possibly handle events before their children do.
  */
  Capture = 1,

  /**
      Events are delivered in the bubble phase. The bubble
      phase happens after the capture phase, and before the default handlers
      are run. This phase runs from the event widget, up to the toplevel.
  */
  Bubble = 2,

  /**
      Events are delivered in the default widget event handlers,
      note that widget implementations must chain up on button, motion, touch and
      grab broken handlers for controllers in this phase to be run.
  */
  Target = 3,
}

/**
    Deprecated
*/
enum RcFlags : uint
{
  /**
      Deprecated
  */
  Fg = 1,

  /**
      Deprecated
  */
  Bg = 2,

  /**
      Deprecated
  */
  Text = 4,

  /**
      Deprecated
  */
  Base = 8,
}

/**
    The #GtkRcTokenType enumeration represents the tokens
  in the RC file. It is exposed so that theme engines
  can reuse these tokens when parsing the theme-engine
  specific portions of a RC file.

  Deprecated:     Use #GtkCssProvider instead.
*/
enum RcTokenType
{
  /**
      Deprecated
  */
  Invalid = 270,

  /**
      Deprecated
  */
  Include = 271,

  /**
      Deprecated
  */
  Normal = 272,

  /**
      Deprecated
  */
  Active = 273,

  /**
      Deprecated
  */
  Prelight = 274,

  /**
      Deprecated
  */
  Selected = 275,

  /**
      Deprecated
  */
  Insensitive = 276,

  /**
      Deprecated
  */
  Fg = 277,

  /**
      Deprecated
  */
  Bg = 278,

  /**
      Deprecated
  */
  Text = 279,

  /**
      Deprecated
  */
  Base = 280,

  /**
      Deprecated
  */
  Xthickness = 281,

  /**
      Deprecated
  */
  Ythickness = 282,

  /**
      Deprecated
  */
  Font = 283,

  /**
      Deprecated
  */
  Fontset = 284,

  /**
      Deprecated
  */
  FontName = 285,

  /**
      Deprecated
  */
  BgPixmap = 286,

  /**
      Deprecated
  */
  PixmapPath = 287,

  /**
      Deprecated
  */
  Style = 288,

  /**
      Deprecated
  */
  Binding = 289,

  /**
      Deprecated
  */
  Bind = 290,

  /**
      Deprecated
  */
  Widget = 291,

  /**
      Deprecated
  */
  WidgetClass = 292,

  /**
      Deprecated
  */
  Class = 293,

  /**
      Deprecated
  */
  Lowest = 294,

  /**
      Deprecated
  */
  Gtk = 295,

  /**
      Deprecated
  */
  Application = 296,

  /**
      Deprecated
  */
  Theme = 297,

  /**
      Deprecated
  */
  Rc = 298,

  /**
      Deprecated
  */
  Highest = 299,

  /**
      Deprecated
  */
  Engine = 300,

  /**
      Deprecated
  */
  ModulePath = 301,

  /**
      Deprecated
  */
  ImModulePath = 302,

  /**
      Deprecated
  */
  ImModuleFile = 303,

  /**
      Deprecated
  */
  Stock = 304,

  /**
      Deprecated
  */
  Ltr = 305,

  /**
      Deprecated
  */
  Rtl = 306,

  /**
      Deprecated
  */
  Color = 307,

  /**
      Deprecated
  */
  Unbind = 308,

  /**
      Deprecated
  */
  Last = 309,
}

/**
    These identify the various errors that can occur while calling
  #GtkRecentChooser functions.
*/
enum RecentChooserError
{
  /**
      Indicates that a file does not exist
  */
  NotFound = 0,

  /**
      Indicates a malformed URI
  */
  InvalidUri = 1,
}

/**
    These flags indicate what parts of a #GtkRecentFilterInfo struct
  are filled or need to be filled.
*/
enum RecentFilterFlags : uint
{
  /**
      the URI of the file being tested
  */
  Uri = 1,

  /**
      the string that will be used to
     display the file in the recent chooser
  */
  DisplayName = 2,

  /**
      the mime type of the file
  */
  MimeType = 4,

  /**
      the list of applications that have
     registered the file
  */
  Application = 8,

  /**
      the groups to which the file belongs to
  */
  Group = 16,

  /**
      the number of days elapsed since the file
     has been registered
  */
  Age = 32,
}

/**
    Error codes for #GtkRecentManager operations
*/
enum RecentManagerError
{
  /**
      the URI specified does not exists in
      the recently used resources list.
  */
  NotFound = 0,

  /**
      the URI specified is not valid.
  */
  InvalidUri = 1,

  /**
      the supplied string is not
      UTF-8 encoded.
  */
  InvalidEncoding = 2,

  /**
      no application has registered
      the specified item.
  */
  NotRegistered = 3,

  /**
      failure while reading the recently used
      resources file.
  */
  Read = 4,

  /**
      failure while writing the recently used
      resources file.
  */
  Write = 5,

  /**
      unspecified error.
  */
  Unknown = 6,
}

/**
    Used to specify the sorting method to be applyed to the recently
  used resource list.
*/
enum RecentSortType
{
  /**
      Do not sort the returned list of recently used
      resources.
  */
  None = 0,

  /**
      Sort the returned list with the most recently used
      items first.
  */
  Mru = 1,

  /**
      Sort the returned list with the least recently used
      items first.
  */
  Lru = 2,

  /**
      Sort the returned list using a custom sorting
      function passed using [gtk.recent_chooser.RecentChooser.setSortFunc].
  */
  Custom = 3,
}

/**
    Describes a region within a widget.
*/
enum RegionFlags : uint
{
  /**
      Region has an even number within a set.
  */
  Even = 1,

  /**
      Region has an odd number within a set.
  */
  Odd = 2,

  /**
      Region is the first one within a set.
  */
  First = 4,

  /**
      Region is the last one within a set.
  */
  Last = 8,

  /**
      Region is the only one within a set.
  */
  Only = 16,

  /**
      Region is part of a sorted area.
  */
  Sorted = 32,
}

/**
    Indicated the relief to be drawn around a #GtkButton.
*/
enum ReliefStyle
{
  /**
      Draw a normal relief.
  */
  Normal = 0,

  /**
      A half relief. Deprecated in 3.14, does the same as @GTK_RELIEF_NORMAL
  */
  Half = 1,

  /**
      No relief.
  */
  None = 2,
}

/** */
enum ResizeMode
{
  /**
      Pass resize request to the parent
  */
  Parent = 0,

  /**
      Queue resizes on this widget
  */
  Queue = 1,

  /**
      Resize immediately. Deprecated.
  */
  Immediate = 2,
}

/**
    Predefined values for use as response ids in [gtk.dialog.Dialog.addButton].
  All predefined values are negative; GTK+ leaves values of 0 or greater for
  application-defined response ids.
*/
enum ResponseType
{
  /**
      Returned if an action widget has no response id,
        or if the dialog gets programmatically hidden or destroyed
  */
  None = -1,

  /**
      Generic response id, not used by GTK+ dialogs
  */
  Reject = -2,

  /**
      Generic response id, not used by GTK+ dialogs
  */
  Accept = -3,

  /**
      Returned if the dialog is deleted
  */
  DeleteEvent = -4,

  /**
      Returned by OK buttons in GTK+ dialogs
  */
  Ok = -5,

  /**
      Returned by Cancel buttons in GTK+ dialogs
  */
  Cancel = -6,

  /**
      Returned by Close buttons in GTK+ dialogs
  */
  Close = -7,

  /**
      Returned by Yes buttons in GTK+ dialogs
  */
  Yes = -8,

  /**
      Returned by No buttons in GTK+ dialogs
  */
  No = -9,

  /**
      Returned by Apply buttons in GTK+ dialogs
  */
  Apply = -10,

  /**
      Returned by Help buttons in GTK+ dialogs
  */
  Help = -11,
}

/**
    These enumeration values describe the possible transitions
  when the child of a #GtkRevealer widget is shown or hidden.
*/
enum RevealerTransitionType
{
  /**
      No transition
  */
  None = 0,

  /**
      Fade in
  */
  Crossfade = 1,

  /**
      Slide in from the left
  */
  SlideRight = 2,

  /**
      Slide in from the right
  */
  SlideLeft = 3,

  /**
      Slide in from the bottom
  */
  SlideUp = 4,

  /**
      Slide in from the top
  */
  SlideDown = 5,
}

/** */
enum ScrollStep
{
  /**
      Scroll in steps.
  */
  Steps = 0,

  /**
      Scroll by pages.
  */
  Pages = 1,

  /**
      Scroll to ends.
  */
  Ends = 2,

  /**
      Scroll in horizontal steps.
  */
  HorizontalSteps = 3,

  /**
      Scroll by horizontal pages.
  */
  HorizontalPages = 4,

  /**
      Scroll to the horizontal ends.
  */
  HorizontalEnds = 5,
}

/**
    Scrolling types.
*/
enum ScrollType
{
  /**
      No scrolling.
  */
  None = 0,

  /**
      Jump to new location.
  */
  Jump = 1,

  /**
      Step backward.
  */
  StepBackward = 2,

  /**
      Step forward.
  */
  StepForward = 3,

  /**
      Page backward.
  */
  PageBackward = 4,

  /**
      Page forward.
  */
  PageForward = 5,

  /**
      Step up.
  */
  StepUp = 6,

  /**
      Step down.
  */
  StepDown = 7,

  /**
      Page up.
  */
  PageUp = 8,

  /**
      Page down.
  */
  PageDown = 9,

  /**
      Step to the left.
  */
  StepLeft = 10,

  /**
      Step to the right.
  */
  StepRight = 11,

  /**
      Page to the left.
  */
  PageLeft = 12,

  /**
      Page to the right.
  */
  PageRight = 13,

  /**
      Scroll to start.
  */
  Start = 14,

  /**
      Scroll to end.
  */
  End = 15,
}

/**
    Defines the policy to be used in a scrollable widget when updating
  the scrolled window adjustments in a given orientation.
*/
enum ScrollablePolicy
{
  /**
      Scrollable adjustments are based on the minimum size
  */
  Minimum = 0,

  /**
      Scrollable adjustments are based on the natural size
  */
  Natural = 1,
}

/**
    Used to control what selections users are allowed to make.
*/
enum SelectionMode
{
  /**
      No selection is possible.
  */
  None = 0,

  /**
      Zero or one element may be selected.
  */
  Single = 1,

  /**
      Exactly one element is selected.
        In some circumstances, such as initially or during a search
        operation, it’s possible for no element to be selected with
        [gtk.types.SelectionMode.Browse]. What is really enforced is that the user
        can’t deselect a currently selected element except by selecting
        another element.
  */
  Browse = 2,

  /**
      Any number of elements may be selected.
         The Ctrl key may be used to enlarge the selection, and Shift
         key to select between the focus and the child pointed to.
         Some widgets may also allow Click-drag to select a range of elements.
  */
  Multiple = 3,
}

/**
    Determines how GTK+ handles the sensitivity of stepper arrows
  at the end of range widgets.
*/
enum SensitivityType
{
  /**
      The arrow is made insensitive if the
      thumb is at the end
  */
  Auto = 0,

  /**
      The arrow is always sensitive
  */
  On = 1,

  /**
      The arrow is always insensitive
  */
  Off = 2,
}

/**
    Used to change the appearance of an outline typically provided by a #GtkFrame.
  
  Note that many themes do not differentiate the appearance of the
  various shadow types: Either their is no visible shadow (@GTK_SHADOW_NONE),
  or there is (any other value).
*/
enum ShadowType
{
  /**
      No outline.
  */
  None = 0,

  /**
      The outline is bevelled inwards.
  */
  In = 1,

  /**
      The outline is bevelled outwards like a button.
  */
  Out = 2,

  /**
      The outline has a sunken 3d appearance.
  */
  EtchedIn = 3,

  /**
      The outline has a raised 3d appearance.
  */
  EtchedOut = 4,
}

/**
    GtkShortcutType specifies the kind of shortcut that is being described.
  More values may be added to this enumeration over time.
*/
enum ShortcutType
{
  /**
      The shortcut is a keyboard accelerator. The #GtkShortcutsShortcut:accelerator
      property will be used.
  */
  Accelerator = 0,

  /**
      The shortcut is a pinch gesture. GTK+ provides an icon and subtitle.
  */
  GesturePinch = 1,

  /**
      The shortcut is a stretch gesture. GTK+ provides an icon and subtitle.
  */
  GestureStretch = 2,

  /**
      The shortcut is a clockwise rotation gesture. GTK+ provides an icon and subtitle.
  */
  GestureRotateClockwise = 3,

  /**
      The shortcut is a counterclockwise rotation gesture. GTK+ provides an icon and subtitle.
  */
  GestureRotateCounterclockwise = 4,

  /**
      The shortcut is a two-finger swipe gesture. GTK+ provides an icon and subtitle.
  */
  GestureTwoFingerSwipeLeft = 5,

  /**
      The shortcut is a two-finger swipe gesture. GTK+ provides an icon and subtitle.
  */
  GestureTwoFingerSwipeRight = 6,

  /**
      The shortcut is a gesture. The #GtkShortcutsShortcut:icon property will be
      used.
  */
  Gesture = 7,
}

/**
    The mode of the size group determines the directions in which the size
  group affects the requested sizes of its component widgets.
*/
enum SizeGroupMode
{
  /**
      group has no effect
  */
  None = 0,

  /**
      group affects horizontal requisition
  */
  Horizontal = 1,

  /**
      group affects vertical requisition
  */
  Vertical = 2,

  /**
      group affects both horizontal and vertical requisition
  */
  Both = 3,
}

/**
    Specifies a preference for height-for-width or
  width-for-height geometry management.
*/
enum SizeRequestMode
{
  /**
      Prefer height-for-width geometry management
  */
  HeightForWidth = 0,

  /**
      Prefer width-for-height geometry management
  */
  WidthForHeight = 1,

  /**
      Don’t trade height-for-width or width-for-height
  */
  ConstantSize = 2,
}

/**
    Determines the direction of a sort.
*/
enum SortType
{
  /**
      Sorting is in ascending order.
  */
  Ascending = 0,

  /**
      Sorting is in descending order.
  */
  Descending = 1,
}

/**
    The spin button update policy determines whether the spin button displays
  values even if they are outside the bounds of its adjustment.
  See [gtk.spin_button.SpinButton.setUpdatePolicy].
*/
enum SpinButtonUpdatePolicy
{
  /**
      When refreshing your #GtkSpinButton, the value is
        always displayed
  */
  Always = 0,

  /**
      When refreshing your #GtkSpinButton, the value is
        only displayed if it is valid within the bounds of the spin button's
        adjustment
  */
  IfValid = 1,
}

/**
    The values of the GtkSpinType enumeration are used to specify the
  change to make in [gtk.spin_button.SpinButton.spin].
*/
enum SpinType
{
  /**
      Increment by the adjustments step increment.
  */
  StepForward = 0,

  /**
      Decrement by the adjustments step increment.
  */
  StepBackward = 1,

  /**
      Increment by the adjustments page increment.
  */
  PageForward = 2,

  /**
      Decrement by the adjustments page increment.
  */
  PageBackward = 3,

  /**
      Go to the adjustments lower bound.
  */
  Home = 4,

  /**
      Go to the adjustments upper bound.
  */
  End = 5,

  /**
      Change by a specified amount.
  */
  UserDefined = 6,
}

/**
    These enumeration values describe the possible transitions
  between pages in a #GtkStack widget.
  
  New values may be added to this enumeration over time.
*/
enum StackTransitionType
{
  /**
      No transition
  */
  None = 0,

  /**
      A cross-fade
  */
  Crossfade = 1,

  /**
      Slide from left to right
  */
  SlideRight = 2,

  /**
      Slide from right to left
  */
  SlideLeft = 3,

  /**
      Slide from bottom up
  */
  SlideUp = 4,

  /**
      Slide from top down
  */
  SlideDown = 5,

  /**
      Slide from left or right according to the children order
  */
  SlideLeftRight = 6,

  /**
      Slide from top down or bottom up according to the order
  */
  SlideUpDown = 7,

  /**
      Cover the old page by sliding up. Since 3.12
  */
  OverUp = 8,

  /**
      Cover the old page by sliding down. Since: 3.12
  */
  OverDown = 9,

  /**
      Cover the old page by sliding to the left. Since: 3.12
  */
  OverLeft = 10,

  /**
      Cover the old page by sliding to the right. Since: 3.12
  */
  OverRight = 11,

  /**
      Uncover the new page by sliding up. Since 3.12
  */
  UnderUp = 12,

  /**
      Uncover the new page by sliding down. Since: 3.12
  */
  UnderDown = 13,

  /**
      Uncover the new page by sliding to the left. Since: 3.12
  */
  UnderLeft = 14,

  /**
      Uncover the new page by sliding to the right. Since: 3.12
  */
  UnderRight = 15,

  /**
      Cover the old page sliding up or uncover the new page sliding down, according to order. Since: 3.12
  */
  OverUpDown = 16,

  /**
      Cover the old page sliding down or uncover the new page sliding up, according to order. Since: 3.14
  */
  OverDownUp = 17,

  /**
      Cover the old page sliding left or uncover the new page sliding right, according to order. Since: 3.14
  */
  OverLeftRight = 18,

  /**
      Cover the old page sliding right or uncover the new page sliding left, according to order. Since: 3.14
  */
  OverRightLeft = 19,
}

/**
    Describes a widget state. Widget states are used to match the widget
  against CSS pseudo-classes. Note that GTK extends the regular CSS
  classes and sometimes uses different names.
*/
enum StateFlags : uint
{
  /**
      State during normal operation.
  */
  Normal = 0,

  /**
      Widget is active.
  */
  Active = 1,

  /**
      Widget has a mouse pointer over it.
  */
  Prelight = 2,

  /**
      Widget is selected.
  */
  Selected = 4,

  /**
      Widget is insensitive.
  */
  Insensitive = 8,

  /**
      Widget is inconsistent.
  */
  Inconsistent = 16,

  /**
      Widget has the keyboard focus.
  */
  Focused = 32,

  /**
      Widget is in a background toplevel window.
  */
  Backdrop = 64,

  /**
      Widget is in left-to-right text direction. Since 3.8
  */
  DirLtr = 128,

  /**
      Widget is in right-to-left text direction. Since 3.8
  */
  DirRtl = 256,

  /**
      Widget is a link. Since 3.12
  */
  Link = 512,

  /**
      The location the widget points to has already been visited. Since 3.12
  */
  Visited = 1024,

  /**
      Widget is checked. Since 3.14
  */
  Checked = 2048,

  /**
      Widget is highlighted as a drop target for DND. Since 3.20
  */
  DropActive = 4096,
}

/**
    This type indicates the current state of a widget; the state determines how
  the widget is drawn. The #GtkStateType enumeration is also used to
  identify different colors in a #GtkStyle for drawing, so states can be
  used for subparts of a widget as well as entire widgets.

  Deprecated:     All APIs that are using this enumeration have been deprecated
        in favor of alternatives using #GtkStateFlags.
*/
enum StateType
{
  /**
      State during normal operation.
  */
  Normal = 0,

  /**
      State of a currently active widget, such as a depressed button.
  */
  Active = 1,

  /**
      State indicating that the mouse pointer is over
                         the widget and the widget will respond to mouse clicks.
  */
  Prelight = 2,

  /**
      State of a selected item, such the selected row in a list.
  */
  Selected = 3,

  /**
      State indicating that the widget is
                            unresponsive to user actions.
  */
  Insensitive = 4,

  /**
      The widget is inconsistent, such as checkbuttons
                             or radiobuttons that aren’t either set to true nor false,
                             or buttons requiring the user attention.
  */
  Inconsistent = 5,

  /**
      The widget has the keyboard focus.
  */
  Focused = 6,
}

/**
    Flags that modify the behavior of [gtk.style_context.StyleContext.toString_].
  New values may be added to this enumeration.
*/
enum StyleContextPrintFlags : uint
{
  /** */
  None = 0,

  /**
      Print the entire tree of
        CSS nodes starting at the style context's node
  */
  Recurse = 1,

  /**
      Show the values of the
        CSS properties for each node
  */
  ShowStyle = 2,
}

/**
    The #GtkTargetFlags enumeration is used to specify
  constraints on a #GtkTargetEntry.
*/
enum TargetFlags : uint
{
  /**
      If this is set, the target will only be selected
      for drags within a single application.
  */
  SameApp = 1,

  /**
      If this is set, the target will only be selected
      for drags within a single widget.
  */
  SameWidget = 2,

  /**
      If this is set, the target will not be selected
      for drags within a single application.
  */
  OtherApp = 4,

  /**
      If this is set, the target will not be selected
      for drags withing a single widget.
  */
  OtherWidget = 8,
}

/**
    These values are used as “info” for the targets contained in the
  lists returned by [gtk.text_buffer.TextBuffer.getCopyTargetList] and
  [gtk.text_buffer.TextBuffer.getPasteTargetList].
  
  The values counts down from `-1` to avoid clashes
  with application added drag destinations which usually start at 0.
*/
enum TextBufferTargetInfo
{
  /**
      Buffer contents
  */
  BufferContents = -1,

  /**
      Rich text
  */
  RichText = -2,

  /**
      Text
  */
  Text = -3,
}

/**
    Reading directions for text.
*/
enum TextDirection
{
  /**
      No direction.
  */
  None = 0,

  /**
      Left to right text direction.
  */
  Ltr = 1,

  /**
      Right to left text direction.
  */
  Rtl = 2,
}

/**
    Granularity types that extend the text selection. Use the
  #GtkTextView::extend-selection signal to customize the selection.
*/
enum TextExtendSelection
{
  /**
      Selects the current word. It is triggered by
      a double-click for example.
  */
  Word = 0,

  /**
      Selects the current line. It is triggered by
      a triple-click for example.
  */
  Line = 1,
}

/**
    Flags affecting how a search is done.
  
  If neither #GTK_TEXT_SEARCH_VISIBLE_ONLY nor #GTK_TEXT_SEARCH_TEXT_ONLY are
  enabled, the match must be exact; the special 0xFFFC character will match
  embedded pixbufs or child widgets.
*/
enum TextSearchFlags : uint
{
  /**
      Search only visible data. A search match may
    have invisible text interspersed.
  */
  VisibleOnly = 1,

  /**
      Search only text. A match may have pixbufs or
    child widgets mixed inside the matched range.
  */
  TextOnly = 2,

  /**
      The text will be matched regardless of
    what case it is in.
  */
  CaseInsensitive = 4,
}

/**
    Used to reference the layers of #GtkTextView for the purpose of customized
  drawing with the ::draw_layer vfunc.
*/
enum TextViewLayer
{
  /**
      Old deprecated layer, use [gtk.types.TextViewLayer.BelowText] instead
  */
  Below = 0,

  /**
      Old deprecated layer, use [gtk.types.TextViewLayer.AboveText] instead
  */
  Above = 1,

  /**
      The layer rendered below the text (but above the background).  Since: 3.20
  */
  BelowText = 2,

  /**
      The layer rendered above the text.  Since: 3.20
  */
  AboveText = 3,
}

/**
    Used to reference the parts of #GtkTextView.
*/
enum TextWindowType
{
  /**
      Invalid value, used as a marker
  */
  Private = 0,

  /**
      Window that floats over scrolling areas.
  */
  Widget = 1,

  /**
      Scrollable text window.
  */
  Text = 2,

  /**
      Left side border window.
  */
  Left = 3,

  /**
      Right side border window.
  */
  Right = 4,

  /**
      Top border window.
  */
  Top = 5,

  /**
      Bottom border window.
  */
  Bottom = 6,
}

/**
    Flags used to specify the supported drag targets.
*/
enum ToolPaletteDragTargets : uint
{
  /**
      Support drag of items.
  */
  Items = 1,

  /**
      Support drag of groups.
  */
  Groups = 2,
}

/**
    Whether spacers are vertical lines or just blank.
*/
enum ToolbarSpaceStyle
{
  /**
      Use blank spacers.
  */
  Empty = 0,

  /**
      Use vertical lines for spacers.
  */
  Line = 1,
}

/**
    Used to customize the appearance of a #GtkToolbar. Note that
  setting the toolbar style overrides the user’s preferences
  for the default toolbar style.  Note that if the button has only
  a label set and GTK_TOOLBAR_ICONS is used, the label will be
  visible, and vice versa.
*/
enum ToolbarStyle
{
  /**
      Buttons display only icons in the toolbar.
  */
  Icons = 0,

  /**
      Buttons display only text labels in the toolbar.
  */
  Text = 1,

  /**
      Buttons display text and icons in the toolbar.
  */
  Both = 2,

  /**
      Buttons display icons and text alongside each
     other, rather than vertically stacked
  */
  BothHoriz = 3,
}

/**
    These flags indicate various properties of a #GtkTreeModel.
  
  They are returned by [gtk.tree_model.TreeModel.getFlags], and must be
  static for the lifetime of the object. A more complete description
  of #GTK_TREE_MODEL_ITERS_PERSIST can be found in the overview of
  this section.
*/
enum TreeModelFlags : uint
{
  /**
      iterators survive all signals
        emitted by the tree
  */
  ItersPersist = 1,

  /**
      the model is a list only, and never
        has children
  */
  ListOnly = 2,
}

/**
    The sizing method the column uses to determine its width.  Please note
  that @GTK_TREE_VIEW_COLUMN_AUTOSIZE are inefficient for large views, and
  can make columns appear choppy.
*/
enum TreeViewColumnSizing
{
  /**
      Columns only get bigger in reaction to changes in the model
  */
  GrowOnly = 0,

  /**
      Columns resize to be the optimal size everytime the model changes.
  */
  Autosize = 1,

  /**
      Columns are a fixed numbers of pixels wide.
  */
  Fixed = 2,
}

/**
    An enum for determining where a dropped row goes.
*/
enum TreeViewDropPosition
{
  /**
      dropped row is inserted before
  */
  Before = 0,

  /**
      dropped row is inserted after
  */
  After = 1,

  /**
      dropped row becomes a child or is inserted before
  */
  IntoOrBefore = 2,

  /**
      dropped row becomes a child or is inserted after
  */
  IntoOrAfter = 3,
}

/**
    Used to indicate which grid lines to draw in a tree view.
*/
enum TreeViewGridLines
{
  /**
      No grid lines.
  */
  None = 0,

  /**
      Horizontal grid lines.
  */
  Horizontal = 1,

  /**
      Vertical grid lines.
  */
  Vertical = 2,

  /**
      Horizontal and vertical grid lines.
  */
  Both = 3,
}

/**
    These enumeration values are used by [gtk.uimanager.UIManager.addUi] to determine
  what UI element to create.
*/
enum UIManagerItemType : uint
{
  /**
      Pick the type of the UI element according to context.
  */
  Auto = 0,

  /**
      Create a menubar.
  */
  Menubar = 1,

  /**
      Create a menu.
  */
  Menu = 2,

  /**
      Create a toolbar.
  */
  Toolbar = 4,

  /**
      Insert a placeholder.
  */
  Placeholder = 8,

  /**
      Create a popup menu.
  */
  Popup = 16,

  /**
      Create a menuitem.
  */
  Menuitem = 32,

  /**
      Create a toolitem.
  */
  Toolitem = 64,

  /**
      Create a separator.
  */
  Separator = 128,

  /**
      Install an accelerator.
  */
  Accelerator = 256,

  /**
      Same as [gtk.types.UIManagerItemType.Popup], but the
      actions’ accelerators are shown.
  */
  PopupWithAccels = 512,
}

/**
    See also [gtk.print_settings.PrintSettings.setPaperWidth].
*/
enum Unit
{
  /**
      No units.
  */
  None = 0,

  /**
      Dimensions in points.
  */
  Points = 1,

  /**
      Dimensions in inches.
  */
  Inch = 2,

  /**
      Dimensions in millimeters
  */
  Mm = 3,
}

/**
    Kinds of widget-specific help. Used by the ::show-help signal.
*/
enum WidgetHelpType
{
  /**
      Tooltip.
  */
  Tooltip = 0,

  /**
      What’s this.
  */
  WhatsThis = 1,
}

/**
    Window placement can be influenced using this enumeration. Note that
  using #GTK_WIN_POS_CENTER_ALWAYS is almost always a bad idea.
  It won’t necessarily work well with all window managers or on all windowing systems.
*/
enum WindowPosition
{
  /**
      No influence is made on placement.
  */
  None = 0,

  /**
      Windows should be placed in the center of the screen.
  */
  Center = 1,

  /**
      Windows should be placed at the current mouse position.
  */
  Mouse = 2,

  /**
      Keep window centered as it changes size, etc.
  */
  CenterAlways = 3,

  /**
      Center the window on its transient
     parent (see [gtk.window.Window.setTransientFor]).
  */
  CenterOnParent = 4,
}

/**
    A #GtkWindow can be one of these types. Most things you’d consider a
  “window” should have type #GTK_WINDOW_TOPLEVEL; windows with this type
  are managed by the window manager and have a frame by default (call
  [gtk.window.Window.setDecorated] to toggle the frame).  Windows with type
  #GTK_WINDOW_POPUP are ignored by the window manager; window manager
  keybindings won’t work on them, the window manager won’t decorate the
  window with a frame, many GTK+ features that rely on the window
  manager will not work (e.g. resize grips and
  maximization/minimization). #GTK_WINDOW_POPUP is used to implement
  widgets such as #GtkMenu or tooltips that you normally don’t think of
  as windows per se. Nearly all windows should be #GTK_WINDOW_TOPLEVEL.
  In particular, do not use #GTK_WINDOW_POPUP just to turn off
  the window borders; use [gtk.window.Window.setDecorated] for that.
*/
enum WindowType
{
  /**
      A regular window, such as a dialog.
  */
  Toplevel = 0,

  /**
      A special window such as a tooltip.
  */
  Popup = 1,
}

/**
    Describes a type of line wrapping.
*/
enum WrapMode
{
  /**
      do not wrap lines; just make the text area wider
  */
  None = 0,

  /**
      wrap text, breaking lines anywhere the cursor can
        appear (between characters, usually - if you want to be technical,
        between graphemes, see [pango.global.getLogAttrs])
  */
  Char = 1,

  /**
      wrap text, breaking lines in between words
  */
  Word = 2,

  /**
      wrap text, breaking lines in between words, or if
        that is not enough, also between graphemes
  */
  WordChar = 3,
}

/**
    Like [gtk.global.getBinaryAge], but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum BINARY_AGE = 2443;

/**
    Constant to return from a signal handler for the #GtkSpinButton::input
  signal in case of conversion failure.
*/
enum INPUT_ERROR = -1;

/**
    Like [gtk.global.getInterfaceAge], but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum INTERFACE_AGE = 32;

/**
    The name used for the stock full offset included by #GtkLevelBar.
*/
enum LEVEL_BAR_OFFSET_FULL = "full";

/**
    The name used for the stock high offset included by #GtkLevelBar.
*/
enum LEVEL_BAR_OFFSET_HIGH = "high";

/**
    The name used for the stock low offset included by #GtkLevelBar.
*/
enum LEVEL_BAR_OFFSET_LOW = "low";

/**
    Like [gtk.global.getMajorVersion], but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum MAJOR_VERSION = 3;

/**
    The maximum length of sequences in compose tables.
*/
enum MAX_COMPOSE_LEN = 7;

/**
    Like [gtk.global.getMicroVersion], but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum MICRO_VERSION = 43;

/**
    Like [gtk.global.getMinorVersion], but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum MINOR_VERSION = 24;

/**
    Name for the A3 paper size.
*/
enum PAPER_NAME_A3 = "iso_a3";

/**
    Name for the A4 paper size.
*/
enum PAPER_NAME_A4 = "iso_a4";

/**
    Name for the A5 paper size.
*/
enum PAPER_NAME_A5 = "iso_a5";

/**
    Name for the B5 paper size.
*/
enum PAPER_NAME_B5 = "iso_b5";

/**
    Name for the Executive paper size.
*/
enum PAPER_NAME_EXECUTIVE = "na_executive";

/**
    Name for the Legal paper size.
*/
enum PAPER_NAME_LEGAL = "na_legal";

/**
    Name for the Letter paper size.
*/
enum PAPER_NAME_LETTER = "na_letter";

/** */
enum PATH_PRIO_MASK = 15;

/** */
enum PRINT_SETTINGS_COLLATE = "collate";

/** */
enum PRINT_SETTINGS_DEFAULT_SOURCE = "default-source";

/** */
enum PRINT_SETTINGS_DITHER = "dither";

/** */
enum PRINT_SETTINGS_DUPLEX = "duplex";

/** */
enum PRINT_SETTINGS_FINISHINGS = "finishings";

/** */
enum PRINT_SETTINGS_MEDIA_TYPE = "media-type";

/** */
enum PRINT_SETTINGS_NUMBER_UP = "number-up";

/** */
enum PRINT_SETTINGS_NUMBER_UP_LAYOUT = "number-up-layout";

/** */
enum PRINT_SETTINGS_N_COPIES = "n-copies";

/** */
enum PRINT_SETTINGS_ORIENTATION = "orientation";

/**
    The key used by the “Print to file” printer to store the file
  name of the output without the path to the directory and the
  file extension.
*/
enum PRINT_SETTINGS_OUTPUT_BASENAME = "output-basename";

/** */
enum PRINT_SETTINGS_OUTPUT_BIN = "output-bin";

/**
    The key used by the “Print to file” printer to store the
  directory to which the output should be written.
*/
enum PRINT_SETTINGS_OUTPUT_DIR = "output-dir";

/**
    The key used by the “Print to file” printer to store the format
  of the output. The supported values are “PS” and “PDF”.
*/
enum PRINT_SETTINGS_OUTPUT_FILE_FORMAT = "output-file-format";

/**
    The key used by the “Print to file” printer to store the URI
  to which the output should be written. GTK+ itself supports
  only “file://” URIs.
*/
enum PRINT_SETTINGS_OUTPUT_URI = "output-uri";

/** */
enum PRINT_SETTINGS_PAGE_RANGES = "page-ranges";

/** */
enum PRINT_SETTINGS_PAGE_SET = "page-set";

/** */
enum PRINT_SETTINGS_PAPER_FORMAT = "paper-format";

/** */
enum PRINT_SETTINGS_PAPER_HEIGHT = "paper-height";

/** */
enum PRINT_SETTINGS_PAPER_WIDTH = "paper-width";

/** */
enum PRINT_SETTINGS_PRINTER = "printer";

/** */
enum PRINT_SETTINGS_PRINTER_LPI = "printer-lpi";

/** */
enum PRINT_SETTINGS_PRINT_PAGES = "print-pages";

/** */
enum PRINT_SETTINGS_QUALITY = "quality";

/** */
enum PRINT_SETTINGS_RESOLUTION = "resolution";

/** */
enum PRINT_SETTINGS_RESOLUTION_X = "resolution-x";

/** */
enum PRINT_SETTINGS_RESOLUTION_Y = "resolution-y";

/** */
enum PRINT_SETTINGS_REVERSE = "reverse";

/** */
enum PRINT_SETTINGS_SCALE = "scale";

/** */
enum PRINT_SETTINGS_USE_COLOR = "use-color";

/** */
enum PRINT_SETTINGS_WIN32_DRIVER_EXTRA = "win32-driver-extra";

/** */
enum PRINT_SETTINGS_WIN32_DRIVER_VERSION = "win32-driver-version";

/**
    Use this priority for functionality related to size allocation.
  
  It is used internally by GTK+ to compute the sizes of widgets.
  This priority is higher than `GDK_PRIORITY_REDRAW` to avoid
  resizing a widget which was just redrawn.
*/
enum PRIORITY_RESIZE = 110;

/**
    The “About” item.
  ![](help-about.png)

  Deprecated:     Use named icon &quot;help-about&quot; or the label &quot;_About&quot;.
*/
enum STOCK_ABOUT = "gtk-about";

/**
    The “Add” item and icon.

  Deprecated:     Use named icon &quot;list-add&quot; or the label &quot;_Add&quot;.
*/
enum STOCK_ADD = "gtk-add";

/**
    The “Apply” item and icon.

  Deprecated:     Do not use an icon. Use label &quot;_Apply&quot;.
*/
enum STOCK_APPLY = "gtk-apply";

/**
    The “Bold” item and icon.

  Deprecated:     Use named icon &quot;format-text-bold&quot;.
*/
enum STOCK_BOLD = "gtk-bold";

/**
    The “Cancel” item and icon.

  Deprecated:     Do not use an icon. Use label &quot;_Cancel&quot;.
*/
enum STOCK_CANCEL = "gtk-cancel";

/**
    The “Caps Lock Warning” icon.

  Deprecated:     Use named icon &quot;dialog-warning-symbolic&quot;.
*/
enum STOCK_CAPS_LOCK_WARNING = "gtk-caps-lock-warning";

/**
    The “CD-Rom” item and icon.

  Deprecated:     Use named icon &quot;media-optical&quot;.
*/
enum STOCK_CDROM = "gtk-cdrom";

/**
    The “Clear” item and icon.

  Deprecated:     Use named icon &quot;edit-clear&quot;.
*/
enum STOCK_CLEAR = "gtk-clear";

/**
    The “Close” item and icon.

  Deprecated:     Use named icon &quot;window-close&quot; or the label &quot;_Close&quot;.
*/
enum STOCK_CLOSE = "gtk-close";

/**
    The “Color Picker” item and icon.
*/
enum STOCK_COLOR_PICKER = "gtk-color-picker";

/**
    The “Connect” icon.
*/
enum STOCK_CONNECT = "gtk-connect";

/**
    The “Convert” item and icon.
*/
enum STOCK_CONVERT = "gtk-convert";

/**
    The “Copy” item and icon.

  Deprecated:     Use the named icon &quot;edit-copy&quot; or the label &quot;_Copy&quot;.
*/
enum STOCK_COPY = "gtk-copy";

/**
    The “Cut” item and icon.

  Deprecated:     Use the named icon &quot;edit-cut&quot; or the label &quot;Cu_t&quot;.
*/
enum STOCK_CUT = "gtk-cut";

/**
    The “Delete” item and icon.

  Deprecated:     Use the named icon &quot;edit-delete&quot; or the label &quot;_Delete&quot;.
*/
enum STOCK_DELETE = "gtk-delete";

/**
    The “Authentication” item and icon.

  Deprecated:     Use named icon &quot;dialog-password&quot;.
*/
enum STOCK_DIALOG_AUTHENTICATION = "gtk-dialog-authentication";

/**
    The “Error” item and icon.

  Deprecated:     Use named icon &quot;dialog-error&quot;.
*/
enum STOCK_DIALOG_ERROR = "gtk-dialog-error";

/**
    The “Information” item and icon.

  Deprecated:     Use named icon &quot;dialog-information&quot;.
*/
enum STOCK_DIALOG_INFO = "gtk-dialog-info";

/**
    The “Question” item and icon.

  Deprecated:     Use named icon &quot;dialog-question&quot;.
*/
enum STOCK_DIALOG_QUESTION = "gtk-dialog-question";

/**
    The “Warning” item and icon.

  Deprecated:     Use named icon &quot;dialog-warning&quot;.
*/
enum STOCK_DIALOG_WARNING = "gtk-dialog-warning";

/**
    The “Directory” icon.

  Deprecated:     Use named icon &quot;folder&quot;.
*/
enum STOCK_DIRECTORY = "gtk-directory";

/**
    The “Discard” item.
*/
enum STOCK_DISCARD = "gtk-discard";

/**
    The “Disconnect” icon.
*/
enum STOCK_DISCONNECT = "gtk-disconnect";

/**
    The “Drag-And-Drop” icon.
*/
enum STOCK_DND = "gtk-dnd";

/**
    The “Drag-And-Drop multiple” icon.
*/
enum STOCK_DND_MULTIPLE = "gtk-dnd-multiple";

/**
    The “Edit” item and icon.
*/
enum STOCK_EDIT = "gtk-edit";

/**
    The “Execute” item and icon.

  Deprecated:     Use named icon &quot;system-run&quot;.
*/
enum STOCK_EXECUTE = "gtk-execute";

/**
    The “File” item and icon.
  
  Since 3.0, this item has a label, before it only had an icon.

  Deprecated:     Use named icon &quot;text-x-generic&quot;.
*/
enum STOCK_FILE = "gtk-file";

/**
    The “Find” item and icon.

  Deprecated:     Use named icon &quot;edit-find&quot;.
*/
enum STOCK_FIND = "gtk-find";

/**
    The “Find and Replace” item and icon.

  Deprecated:     Use named icon &quot;edit-find-replace&quot;.
*/
enum STOCK_FIND_AND_REPLACE = "gtk-find-and-replace";

/**
    The “Floppy” item and icon.
*/
enum STOCK_FLOPPY = "gtk-floppy";

/**
    The “Fullscreen” item and icon.

  Deprecated:     Use named icon &quot;view-fullscreen&quot;.
*/
enum STOCK_FULLSCREEN = "gtk-fullscreen";

/**
    The “Bottom” item and icon.

  Deprecated:     Use named icon &quot;go-bottom&quot;.
*/
enum STOCK_GOTO_BOTTOM = "gtk-goto-bottom";

/**
    The “First” item and icon. The icon has an RTL variant.

  Deprecated:     Use named icon &quot;go-first&quot;.
*/
enum STOCK_GOTO_FIRST = "gtk-goto-first";

/**
    The “Last” item and icon. The icon has an RTL variant.

  Deprecated:     Use named icon &quot;go-last&quot;.
*/
enum STOCK_GOTO_LAST = "gtk-goto-last";

/**
    The “Top” item and icon.

  Deprecated:     Use named icon &quot;go-top&quot;.
*/
enum STOCK_GOTO_TOP = "gtk-goto-top";

/**
    The “Back” item and icon. The icon has an RTL variant.

  Deprecated:     Use named icon &quot;go-previous&quot;.
*/
enum STOCK_GO_BACK = "gtk-go-back";

/**
    The “Down” item and icon.

  Deprecated:     Use named icon &quot;go-down&quot;.
*/
enum STOCK_GO_DOWN = "gtk-go-down";

/**
    The “Forward” item and icon. The icon has an RTL variant.

  Deprecated:     Use named icon &quot;go-next&quot;.
*/
enum STOCK_GO_FORWARD = "gtk-go-forward";

/**
    The “Up” item and icon.

  Deprecated:     Use named icon &quot;go-up&quot;.
*/
enum STOCK_GO_UP = "gtk-go-up";

/**
    The “Harddisk” item and icon.

  Deprecated:     Use named icon &quot;drive-harddisk&quot;.
*/
enum STOCK_HARDDISK = "gtk-harddisk";

/**
    The “Help” item and icon.

  Deprecated:     Use named icon &quot;help-browser&quot;.
*/
enum STOCK_HELP = "gtk-help";

/**
    The “Home” item and icon.

  Deprecated:     Use named icon &quot;go-home&quot;.
*/
enum STOCK_HOME = "gtk-home";

/**
    The “Indent” item and icon. The icon has an RTL variant.

  Deprecated:     Use named icon &quot;format-indent-more&quot;.
*/
enum STOCK_INDENT = "gtk-indent";

/**
    The “Index” item and icon.
*/
enum STOCK_INDEX = "gtk-index";

/**
    The “Info” item and icon.

  Deprecated:     Use named icon &quot;dialog-information&quot;.
*/
enum STOCK_INFO = "gtk-info";

/**
    The “Italic” item and icon.

  Deprecated:     Use named icon &quot;format-text-italic&quot;.
*/
enum STOCK_ITALIC = "gtk-italic";

/**
    The “Jump to” item and icon. The icon has an RTL variant.

  Deprecated:     Use named icon &quot;go-jump&quot;.
*/
enum STOCK_JUMP_TO = "gtk-jump-to";

/**
    The “Center” item and icon.

  Deprecated:     Use named icon &quot;format-justify-center&quot;.
*/
enum STOCK_JUSTIFY_CENTER = "gtk-justify-center";

/**
    The “Fill” item and icon.

  Deprecated:     Use named icon &quot;format-justify-fill&quot;.
*/
enum STOCK_JUSTIFY_FILL = "gtk-justify-fill";

/**
    The “Left” item and icon.

  Deprecated:     Use named icon &quot;format-justify-left&quot;.
*/
enum STOCK_JUSTIFY_LEFT = "gtk-justify-left";

/**
    The “Right” item and icon.

  Deprecated:     Use named icon &quot;format-justify-right&quot;.
*/
enum STOCK_JUSTIFY_RIGHT = "gtk-justify-right";

/**
    The “Leave Fullscreen” item and icon.

  Deprecated:     Use named icon &quot;view-restore&quot;.
*/
enum STOCK_LEAVE_FULLSCREEN = "gtk-leave-fullscreen";

/**
    The “Media Forward” item and icon. The icon has an RTL variant.

  Deprecated:     Use named icon &quot;media-seek-forward&quot; or the label &quot;_Forward&quot;.
*/
enum STOCK_MEDIA_FORWARD = "gtk-media-forward";

/**
    The “Media Next” item and icon. The icon has an RTL variant.

  Deprecated:     Use named icon &quot;media-skip-forward&quot; or the label &quot;_Next&quot;.
*/
enum STOCK_MEDIA_NEXT = "gtk-media-next";

/**
    The “Media Pause” item and icon.

  Deprecated:     Use named icon &quot;media-playback-pause&quot; or the label &quot;P_ause&quot;.
*/
enum STOCK_MEDIA_PAUSE = "gtk-media-pause";

/**
    The “Media Play” item and icon. The icon has an RTL variant.

  Deprecated:     Use named icon &quot;media-playback-start&quot; or the label &quot;_Play&quot;.
*/
enum STOCK_MEDIA_PLAY = "gtk-media-play";

/**
    The “Media Previous” item and icon. The icon has an RTL variant.

  Deprecated:     Use named icon &quot;media-skip-backward&quot; or the label &quot;Pre_vious&quot;.
*/
enum STOCK_MEDIA_PREVIOUS = "gtk-media-previous";

/**
    The “Media Record” item and icon.

  Deprecated:     Use named icon &quot;media-record&quot; or the label &quot;_Record&quot;.
*/
enum STOCK_MEDIA_RECORD = "gtk-media-record";

/**
    The “Media Rewind” item and icon. The icon has an RTL variant.

  Deprecated:     Use named icon &quot;media-seek-backward&quot; or the label &quot;R_ewind&quot;.
*/
enum STOCK_MEDIA_REWIND = "gtk-media-rewind";

/**
    The “Media Stop” item and icon.

  Deprecated:     Use named icon &quot;media-playback-stop&quot; or the label &quot;_Stop&quot;.
*/
enum STOCK_MEDIA_STOP = "gtk-media-stop";

/**
    The “Missing image” icon.

  Deprecated:     Use named icon &quot;image-missing&quot;.
*/
enum STOCK_MISSING_IMAGE = "gtk-missing-image";

/**
    The “Network” item and icon.

  Deprecated:     Use named icon &quot;network-workgroup&quot;.
*/
enum STOCK_NETWORK = "gtk-network";

/**
    The “New” item and icon.

  Deprecated:     Use named icon &quot;document-new&quot; or the label &quot;_New&quot;.
*/
enum STOCK_NEW = "gtk-new";

/**
    The “No” item and icon.
*/
enum STOCK_NO = "gtk-no";

/**
    The “OK” item and icon.

  Deprecated:     Do not use an icon. Use label &quot;_OK&quot;.
*/
enum STOCK_OK = "gtk-ok";

/**
    The “Open” item and icon.

  Deprecated:     Use named icon &quot;document-open&quot; or the label &quot;_Open&quot;.
*/
enum STOCK_OPEN = "gtk-open";

/**
    The “Landscape Orientation” item and icon.
*/
enum STOCK_ORIENTATION_LANDSCAPE = "gtk-orientation-landscape";

/**
    The “Portrait Orientation” item and icon.
*/
enum STOCK_ORIENTATION_PORTRAIT = "gtk-orientation-portrait";

/**
    The “Reverse Landscape Orientation” item and icon.
*/
enum STOCK_ORIENTATION_REVERSE_LANDSCAPE = "gtk-orientation-reverse-landscape";

/**
    The “Reverse Portrait Orientation” item and icon.
*/
enum STOCK_ORIENTATION_REVERSE_PORTRAIT = "gtk-orientation-reverse-portrait";

/**
    The “Page Setup” item and icon.

  Deprecated:     Use named icon &quot;document-page-setup&quot; or the label &quot;Page Set_up&quot;.
*/
enum STOCK_PAGE_SETUP = "gtk-page-setup";

/**
    The “Paste” item and icon.

  Deprecated:     Use named icon &quot;edit-paste&quot; or the label &quot;_Paste&quot;.
*/
enum STOCK_PASTE = "gtk-paste";

/**
    The “Preferences” item and icon.

  Deprecated:     Use named icon &quot;preferences-system&quot; or the label &quot;_Preferences&quot;.
*/
enum STOCK_PREFERENCES = "gtk-preferences";

/**
    The “Print” item and icon.

  Deprecated:     Use named icon &quot;document-print&quot; or the label &quot;_Print&quot;.
*/
enum STOCK_PRINT = "gtk-print";

/**
    The “Print Error” icon.

  Deprecated:     Use named icon &quot;printer-error&quot;.
*/
enum STOCK_PRINT_ERROR = "gtk-print-error";

/**
    The “Print Paused” icon.
*/
enum STOCK_PRINT_PAUSED = "gtk-print-paused";

/**
    The “Print Preview” item and icon.

  Deprecated:     Use label &quot;Pre_view&quot;.
*/
enum STOCK_PRINT_PREVIEW = "gtk-print-preview";

/**
    The “Print Report” icon.
*/
enum STOCK_PRINT_REPORT = "gtk-print-report";

/**
    The “Print Warning” icon.
*/
enum STOCK_PRINT_WARNING = "gtk-print-warning";

/**
    The “Properties” item and icon.

  Deprecated:     Use named icon &quot;document-properties&quot; or the label &quot;_Properties&quot;.
*/
enum STOCK_PROPERTIES = "gtk-properties";

/**
    The “Quit” item and icon.

  Deprecated:     Use named icon &quot;application-exit&quot; or the label &quot;_Quit&quot;.
*/
enum STOCK_QUIT = "gtk-quit";

/**
    The “Redo” item and icon. The icon has an RTL variant.

  Deprecated:     Use named icon &quot;edit-redo&quot; or the label &quot;_Redo&quot;.
*/
enum STOCK_REDO = "gtk-redo";

/**
    The “Refresh” item and icon.

  Deprecated:     Use named icon &quot;view-refresh&quot; or the label &quot;_Refresh&quot;.
*/
enum STOCK_REFRESH = "gtk-refresh";

/**
    The “Remove” item and icon.

  Deprecated:     Use named icon &quot;list-remove&quot; or the label &quot;_Remove&quot;.
*/
enum STOCK_REMOVE = "gtk-remove";

/**
    The “Revert” item and icon. The icon has an RTL variant.

  Deprecated:     Use named icon &quot;document-revert&quot; or the label &quot;_Revert&quot;.
*/
enum STOCK_REVERT_TO_SAVED = "gtk-revert-to-saved";

/**
    The “Save” item and icon.

  Deprecated:     Use named icon &quot;document-save&quot; or the label &quot;_Save&quot;.
*/
enum STOCK_SAVE = "gtk-save";

/**
    The “Save As” item and icon.

  Deprecated:     Use named icon &quot;document-save-as&quot; or the label &quot;Save _As&quot;.
*/
enum STOCK_SAVE_AS = "gtk-save-as";

/**
    The “Select All” item and icon.

  Deprecated:     Use named icon &quot;edit-select-all&quot; or the label &quot;Select _All&quot;.
*/
enum STOCK_SELECT_ALL = "gtk-select-all";

/**
    The “Color” item and icon.
*/
enum STOCK_SELECT_COLOR = "gtk-select-color";

/**
    The “Font” item and icon.
*/
enum STOCK_SELECT_FONT = "gtk-select-font";

/**
    The “Ascending” item and icon.

  Deprecated:     Use named icon &quot;view-sort-ascending&quot;.
*/
enum STOCK_SORT_ASCENDING = "gtk-sort-ascending";

/**
    The “Descending” item and icon.

  Deprecated:     Use named icon &quot;view-sort-descending&quot;.
*/
enum STOCK_SORT_DESCENDING = "gtk-sort-descending";

/**
    The “Spell Check” item and icon.

  Deprecated:     Use named icon &quot;tools-check-spelling&quot;.
*/
enum STOCK_SPELL_CHECK = "gtk-spell-check";

/**
    The “Stop” item and icon.

  Deprecated:     Use named icon &quot;process-stop&quot; or the label &quot;_Stop&quot;.
*/
enum STOCK_STOP = "gtk-stop";

/**
    The “Strikethrough” item and icon.

  Deprecated:     Use named icon &quot;format-text-strikethrough&quot; or the label &quot;_Strikethrough&quot;.
*/
enum STOCK_STRIKETHROUGH = "gtk-strikethrough";

/**
    The “Undelete” item and icon. The icon has an RTL variant.
*/
enum STOCK_UNDELETE = "gtk-undelete";

/**
    The “Underline” item and icon.

  Deprecated:     Use named icon &quot;format-text-underline&quot; or the label &quot;_Underline&quot;.
*/
enum STOCK_UNDERLINE = "gtk-underline";

/**
    The “Undo” item and icon. The icon has an RTL variant.

  Deprecated:     Use named icon &quot;edit-undo&quot; or the label &quot;_Undo&quot;.
*/
enum STOCK_UNDO = "gtk-undo";

/**
    The “Unindent” item and icon. The icon has an RTL variant.

  Deprecated:     Use named icon &quot;format-indent-less&quot;.
*/
enum STOCK_UNINDENT = "gtk-unindent";

/**
    The “Yes” item and icon.
*/
enum STOCK_YES = "gtk-yes";

/**
    The “Zoom 100%” item and icon.

  Deprecated:     Use named icon &quot;zoom-original&quot; or the label &quot;_Normal Size&quot;.
*/
enum STOCK_ZOOM_100 = "gtk-zoom-100";

/**
    The “Zoom to Fit” item and icon.

  Deprecated:     Use named icon &quot;zoom-fit-best&quot; or the label &quot;Best _Fit&quot;.
*/
enum STOCK_ZOOM_FIT = "gtk-zoom-fit";

/**
    The “Zoom In” item and icon.

  Deprecated:     Use named icon &quot;zoom-in&quot; or the label &quot;Zoom _In&quot;.
*/
enum STOCK_ZOOM_IN = "gtk-zoom-in";

/**
    The “Zoom Out” item and icon.

  Deprecated:     Use named icon &quot;zoom-out&quot; or the label &quot;Zoom _Out&quot;.
*/
enum STOCK_ZOOM_OUT = "gtk-zoom-out";

/**
    A CSS class to match an accelerator.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_ACCELERATOR = "accelerator";

/**
    A CSS class used when rendering an arrow element.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_ARROW = "arrow";

/**
    A CSS class to match the window background.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_BACKGROUND = "background";

/**
    A CSS class to indicate an area at the bottom of a widget.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_BOTTOM = "bottom";

/**
    A CSS class to match buttons.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_BUTTON = "button";

/**
    A CSS class to match calendars.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_CALENDAR = "calendar";

/**
    A CSS class to match content rendered in cell views.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_CELL = "cell";

/**
    A CSS class to match check boxes.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_CHECK = "check";

/**
    A CSS class to match combobox entries.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_COMBOBOX_ENTRY = "combobox-entry";

/**
    A CSS class to match context menus.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_CONTEXT_MENU = "context-menu";

/**
    A CSS class that gets added to windows which have client-side decorations.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_CSD = "csd";

/**
    A CSS class used when rendering a drag handle for
  text selection.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_CURSOR_HANDLE = "cursor-handle";

/**
    A CSS class to match the default widget.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_DEFAULT = "default";

/**
    A CSS class used when an action (usually a button) is
  one that is expected to remove or destroy something visible
  to the user.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_DESTRUCTIVE_ACTION = "destructive-action";

/**
    A CSS class to match dimmed labels.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_DIM_LABEL = "dim-label";

/**
    A CSS class for a drag-and-drop indicator.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_DND = "dnd";

/**
    A CSS class defining a dock area.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_DOCK = "dock";

/**
    A CSS class to match text entries.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_ENTRY = "entry";

/**
    A CSS class for an area displaying an error message,
  such as those in infobars.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_ERROR = "error";

/**
    A CSS class defining an expander, such as those in treeviews.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_EXPANDER = "expander";

/**
    A CSS class that is added when widgets that usually have
  a frame or border (like buttons or entries) should appear
  without it.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_FLAT = "flat";

/**
    A CSS class defining a frame delimiting content, such as
  #GtkFrame or the scrolled window frame around the
  scrollable area.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_FRAME = "frame";

/**
    A CSS class defining a resize grip.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_GRIP = "grip";

/**
    A CSS class to match a header element.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_HEADER = "header";

/**
    A CSS class defining a highlighted area, such as headings in
  assistants and calendars.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_HIGHLIGHT = "highlight";

/**
    A CSS class for horizontally layered widgets.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_HORIZONTAL = "horizontal";

/**
    A CSS class defining an image, such as the icon in an entry.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_IMAGE = "image";

/**
    A CSS class for an area displaying an informational message,
  such as those in infobars.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_INFO = "info";

/**
    A CSS class to match inline toolbars.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_INLINE_TOOLBAR = "inline-toolbar";

/**
    A CSS class used when rendering a drag handle for
  the insertion cursor position.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_INSERTION_CURSOR = "insertion-cursor";

/**
    A CSS class to match labels.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_LABEL = "label";

/**
    A CSS class to indicate an area at the left of a widget.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_LEFT = "left";

/**
    A CSS class used when rendering a level indicator, such
  as a battery charge level, or a password strength.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_LEVEL_BAR = "level-bar";

/**
    A CSS class to match a linked area, such as a box containing buttons
  belonging to the same control.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_LINKED = "linked";

/**
    A CSS class to match lists.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_LIST = "list";

/**
    A CSS class to match list rows.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_LIST_ROW = "list-row";

/**
    A CSS class defining marks in a widget, such as in scales.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_MARK = "mark";

/**
    A CSS class to match menus.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_MENU = "menu";

/**
    A CSS class to menubars.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_MENUBAR = "menubar";

/**
    A CSS class to match menu items.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_MENUITEM = "menuitem";

/**
    A CSS class that is added to message dialogs.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_MESSAGE_DIALOG = "message-dialog";

/**
    A CSS class that is added to text view that should use
  a monospace font.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_MONOSPACE = "monospace";

/**
    A CSS class used when an element needs the user attention,
  for instance a button in a stack switcher corresponding to
  a hidden page that changed state.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_NEEDS_ATTENTION = "needs-attention";

/**
    A CSS class defining a notebook.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_NOTEBOOK = "notebook";

/**
    A CSS class used when rendering an OSD (On Screen Display) element,
  on top of another container.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_OSD = "osd";

/**
    A CSS class that is added on the visual hints that happen
  when scrolling is attempted past the limits of a scrollable
  area.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_OVERSHOOT = "overshoot";

/**
    A CSS class for a pane separator, such as those in #GtkPaned.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_PANE_SEPARATOR = "pane-separator";

/**
    A CSS class that is added to areas that should look like paper.
  
  This is used in print previews and themes are encouraged to
  style it as black text on white background.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_PAPER = "paper";

/**
    A CSS class that matches popovers.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_POPOVER = "popover";

/**
    A CSS class that is added to the toplevel windows used for menus.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_POPUP = "popup";

/**
    A CSS class to match primary toolbars.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_PRIMARY_TOOLBAR = "primary-toolbar";

/**
    A CSS class to use when rendering activity as a progressbar.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_PROGRESSBAR = "progressbar";

/**
    A CSS class to use when rendering a pulse in an indeterminate progress bar.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_PULSE = "pulse";

/**
    A CSS class for an area displaying a question to the user,
  such as those in infobars.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_QUESTION = "question";

/**
    A CSS class to match radio buttons.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_RADIO = "radio";

/**
    A CSS class to match a raised control, such as a raised
  button on a toolbar.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_RAISED = "raised";

/**
    A CSS class used to indicate a read-only state.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_READ_ONLY = "read-only";

/**
    A CSS class to indicate an area at the right of a widget.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_RIGHT = "right";

/**
    A CSS class to match the rubberband selection rectangle.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_RUBBERBAND = "rubberband";

/**
    A CSS class to match scale widgets.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SCALE = "scale";

/**
    A CSS class to match scale widgets with marks attached,
  all the marks are above for horizontal #GtkScale.
  left for vertical #GtkScale.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SCALE_HAS_MARKS_ABOVE = "scale-has-marks-above";

/**
    A CSS class to match scale widgets with marks attached,
  all the marks are below for horizontal #GtkScale,
  right for vertical #GtkScale.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SCALE_HAS_MARKS_BELOW = "scale-has-marks-below";

/**
    A CSS class to match scrollbars.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SCROLLBAR = "scrollbar";

/**
    A CSS class to match the junction area between an horizontal
  and vertical scrollbar, when they’re both shown.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SCROLLBARS_JUNCTION = "scrollbars-junction";

/**
    A CSS class for a separator.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SEPARATOR = "separator";

/**
    A CSS class defining a sidebar, such as the left side in
  a file chooser.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SIDEBAR = "sidebar";

/**
    A CSS class to match sliders.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SLIDER = "slider";

/**
    A CSS class defining an spinbutton.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SPINBUTTON = "spinbutton";

/**
    A CSS class to use when rendering activity as a “spinner”.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SPINNER = "spinner";

/**
    A CSS class to match statusbars.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_STATUSBAR = "statusbar";

/**
    A CSS class used for the subtitle label in a titlebar in
  a toplevel window.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SUBTITLE = "subtitle";

/**
    A CSS class used when an action (usually a button) is the
  primary suggested action in a specific context.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SUGGESTED_ACTION = "suggested-action";

/**
    A CSS class used for the title label in a titlebar in
  a toplevel window.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_TITLE = "title";

/**
    A CSS class used when rendering a titlebar in a toplevel window.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_TITLEBAR = "titlebar";

/**
    A CSS class to match toolbars.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_TOOLBAR = "toolbar";

/**
    A CSS class to match tooltip windows.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_TOOLTIP = "tooltip";

/**
    A CSS class to indicate an area at the top of a widget.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_TOP = "top";

/**
    A CSS class for touch selection popups on entries
  and text views.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_TOUCH_SELECTION = "touch-selection";

/**
    A CSS class to match troughs, as in scrollbars and progressbars.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_TROUGH = "trough";

/**
    A CSS class that is added on the visual hints that happen
  where content is 'scrolled off' and can be made visible
  by scrolling.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_UNDERSHOOT = "undershoot";

/**
    A CSS class for vertically layered widgets.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_VERTICAL = "vertical";

/**
    A CSS class defining a view, such as iconviews or treeviews.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_VIEW = "view";

/**
    A CSS class for an area displaying a warning message,
  such as those in infobars.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_WARNING = "warning";

/**
    A CSS class to indicate that a UI element should be 'wide'.
  Used by #GtkPaned.
  
  Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_WIDE = "wide";

/**
    A property holding the background color of rendered elements as a #GdkRGBA.
*/
enum STYLE_PROPERTY_BACKGROUND_COLOR = "background-color";

/**
    A property holding the element’s background as a #cairo_pattern_t.
*/
enum STYLE_PROPERTY_BACKGROUND_IMAGE = "background-image";

/**
    A property holding the element’s border color as a #GdkRGBA.
*/
enum STYLE_PROPERTY_BORDER_COLOR = "border-color";

/**
    A property holding the rendered element’s border radius in pixels as a #gint.
*/
enum STYLE_PROPERTY_BORDER_RADIUS = "border-radius";

/**
    A property holding the element’s border style as a #GtkBorderStyle.
*/
enum STYLE_PROPERTY_BORDER_STYLE = "border-style";

/**
    A property holding the rendered element’s border width in pixels as
  a #GtkBorder. The border is the intermediary spacing property of the
  padding/border/margin series.
  
  [gtk.global.renderFrame] uses this property to find out the frame line width,
  so #GtkWidgets rendering frames may need to add up this padding when
  requesting size
*/
enum STYLE_PROPERTY_BORDER_WIDTH = "border-width";

/**
    A property holding the foreground color of rendered elements as a #GdkRGBA.
*/
enum STYLE_PROPERTY_COLOR = "color";

/**
    A property holding the font properties used when rendering text
  as a #PangoFontDescription.
*/
enum STYLE_PROPERTY_FONT = "font";

/**
    A property holding the rendered element’s margin as a #GtkBorder. The
  margin is defined as the spacing between the border of the element
  and its surrounding elements. It is external to #GtkWidget's
  size allocations, and the most external spacing property of the
  padding/border/margin series.
*/
enum STYLE_PROPERTY_MARGIN = "margin";

/**
    A property holding the rendered element’s padding as a #GtkBorder. The
  padding is defined as the spacing between the inner part of the element border
  and its child. It’s the innermost spacing property of the padding/border/margin
  series.
*/
enum STYLE_PROPERTY_PADDING = "padding";

/**
    A priority that can be used when adding a #GtkStyleProvider
  for application-specific style information.
*/
enum STYLE_PROVIDER_PRIORITY_APPLICATION = 600;

/**
    The priority used for default style information
  that is used in the absence of themes.
  
  Note that this is not very useful for providing default
  styling for custom style classes - themes are likely to
  override styling provided at this priority with
  catch-all `* {...}` rules.
*/
enum STYLE_PROVIDER_PRIORITY_FALLBACK = 1;

/**
    The priority used for style information provided
  via #GtkSettings.
  
  This priority is higher than #GTK_STYLE_PROVIDER_PRIORITY_THEME
  to let settings override themes.
*/
enum STYLE_PROVIDER_PRIORITY_SETTINGS = 400;

/**
    The priority used for style information provided
  by themes.
*/
enum STYLE_PROVIDER_PRIORITY_THEME = 200;

/**
    The priority used for the style information from
  `XDG_CONFIG_HOME/gtk-3.0/gtk.css`.
  
  You should not use priorities higher than this, to
  give the user the last word.
*/
enum STYLE_PROVIDER_PRIORITY_USER = 800;

/**
    A widget region name to define a treeview column.

  Deprecated:     Don't use regions.
*/
enum STYLE_REGION_COLUMN = "column";

/**
    A widget region name to define a treeview column header.

  Deprecated:     Don't use regions.
*/
enum STYLE_REGION_COLUMN_HEADER = "column-header";

/**
    A widget region name to define a treeview row.

  Deprecated:     Don't use regions.
*/
enum STYLE_REGION_ROW = "row";

/**
    A widget region name to define a notebook tab.

  Deprecated:     Don't use regions.
*/
enum STYLE_REGION_TAB = "tab";

/**
    The priority at which the text view validates onscreen lines
  in an idle job in the background.
*/
enum TEXT_VIEW_PRIORITY_VALIDATE = 125;

/**
    The GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID can be used to make a
  #GtkTreeSortable use the default sort function.
  
  See also [gtk.tree_sortable.TreeSortable.setSortColumnId]
*/
enum TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID = -1;

/**
    The GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID can be used to make a
  #GtkTreeSortable use no sorting.
  
  See also [gtk.tree_sortable.TreeSortable.setSortColumnId]
*/
enum TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID = -2;
