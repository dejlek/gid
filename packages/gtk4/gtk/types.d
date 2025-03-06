module gtk.types;

import cairo.context;
import gdk.frame_clock;
import gdk.rectangle;
import gid.gid;
import gio.list_model;
import glib.error;
import glib.variant;
import gobject.object;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_layout;
import gtk.cell_renderer;
import gtk.drawing_area;
import gtk.entry_completion;
import gtk.flow_box;
import gtk.flow_box_child;
import gtk.icon_view;
import gtk.list_box;
import gtk.list_box_row;
import gtk.menu_button;
import gtk.page_setup;
import gtk.print_job;
import gtk.printer;
import gtk.scale;
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

// Structs

/** */
alias AccessibleTextRange = GtkAccessibleTextRange;

/** */
alias BuildableParser = GtkBuildableParser;

/** */
alias CssLocation = GtkCssLocation;

/** */
alias CssStyleChange = GtkCssStyleChange*;

/** */
alias PageRange = GtkPageRange;

/** */
alias PrintBackend = GtkPrintBackend*;

/** */
alias RequestedSize = GtkRequestedSize;

// Callbacks

/**
    Type of callback used to calculate the next page in a [gtk.assistant.Assistant].
  
  It’s called both for computing the next page when the user presses the
  “forward” button and for handling the behavior of the “last” button.
  
  See [gtk.assistant.Assistant.setForwardPageFunc].

  ## Parameters
  $(LIST
    * $(B currentPage)       The page number used to calculate the next page.
  )
  Returns:     The next page number
*/
alias AssistantPageFunc = int delegate(int currentPage);

/**
    The type of the callback functions used for iterating over the
  cell renderers and their allocated areas inside a [gtk.cell_area.CellArea],
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
  the cell renderers of a [gtk.cell_area.CellArea], see [gtk.cell_area.CellArea.foreach_].

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
    * $(B cellLayout)       a [gtk.cell_layout.CellLayout]
    * $(B cell)       the cell renderer whose value is to be set
    * $(B treeModel)       the model
    * $(B iter)       a [gtk.tree_iter.TreeIter] indicating the row to set the value for
  )
*/
alias CellLayoutDataFunc = void delegate(gtk.cell_layout.CellLayout cellLayout, gtk.cell_renderer.CellRenderer cell, gtk.tree_model.TreeModel treeModel, gtk.tree_iter.TreeIter iter);

/**
    A function to be used by [gtk.custom_layout.CustomLayout] to allocate a widget.

  ## Parameters
  $(LIST
    * $(B widget)       the widget to allocate
    * $(B width)       the new width of the widget
    * $(B height)       the new height of the widget
    * $(B baseline)       the new baseline of the widget, or -1
  )
*/
alias CustomAllocateFunc = void delegate(gtk.widget.Widget widget, int width, int height, int baseline);

/**
    User function that is called to determine if the item should be matched.
  
  If the filter matches the item, this function must return true. If the
  item should be filtered out, false must be returned.

  ## Parameters
  $(LIST
    * $(B item)       The item to be matched
  )
  Returns:     true to keep the item around
*/
alias CustomFilterFunc = bool delegate(gobject.object.ObjectG item);

/**
    A function to be used by [gtk.custom_layout.CustomLayout] to measure a widget.

  ## Parameters
  $(LIST
    * $(B widget)       the widget to be measured
    * $(B orientation)       the direction to be measured
    * $(B forSize)       the size to be measured for
    * $(B minimum)       the measured minimum size of the widget
    * $(B natural)       the measured natural size of the widget
    * $(B minimumBaseline)       the measured minimum baseline of the widget
    * $(B naturalBaseline)       the measured natural baseline of the widget
  )
*/
alias CustomMeasureFunc = void delegate(gtk.widget.Widget widget, gtk.types.Orientation orientation, int forSize, out int minimum, out int natural, out int minimumBaseline, out int naturalBaseline);

/**
    Queries a widget for its preferred size request mode.

  ## Parameters
  $(LIST
    * $(B widget)       the widget to be queried
  )
  Returns:     the size request mode
*/
alias CustomRequestModeFunc = gtk.types.SizeRequestMode delegate(gtk.widget.Widget widget);

/**
    Whenever drawing_area needs to redraw, this function will be called.
  
  This function should exclusively redraw the contents of the drawing area
  and must not call any widget functions that cause changes.

  ## Parameters
  $(LIST
    * $(B drawingArea)       the [gtk.drawing_area.DrawingArea] to redraw
    * $(B cr)       the context to draw to
    * $(B width)       the actual width of the contents. This value will be at least
        as wide as GtkDrawingArea:width.
    * $(B height)       the actual height of the contents. This value will be at least
        as wide as GtkDrawingArea:height.
  )
*/
alias DrawingAreaDrawFunc = void delegate(gtk.drawing_area.DrawingArea drawingArea, cairo.context.Context cr, int width, int height);

/**
    A function which decides whether the row indicated by iter matches
  a given key, and should be displayed as a possible completion for key.
  
  Note that key is normalized and case-folded (see [glib.global.utf8Normalize]
  and [glib.global.utf8Casefold]). If this is not appropriate, match functions
  have access to the unmodified key via
  `gtk_editable_get_text (GTK_EDITABLE (gtk_entry_completion_get_entry ()))`.

  ## Parameters
  $(LIST
    * $(B completion)       the [gtk.entry_completion.EntryCompletion]
    * $(B key)       the string to match, normalized and case-folded
    * $(B iter)       a [gtk.tree_iter.TreeIter] indicating the row to match
  )
  Returns:     true if iter should be displayed as a possible completion
      for key
*/
alias EntryCompletionMatchFunc = bool delegate(gtk.entry_completion.EntryCompletion completion, string key, gtk.tree_iter.TreeIter iter);

/**
    Callback called by [gtk.expression.Expression.watch] when the
  expression value changes.
*/
alias ExpressionNotify = void delegate();

/**
    Called for flow boxes that are bound to a [gio.list_model.ListModel].
  
  This function is called for each item that gets added to the model.

  ## Parameters
  $(LIST
    * $(B item)       the item from the model for which to create a widget for
  )
  Returns:     a [gtk.widget.Widget] that represents item
*/
alias FlowBoxCreateWidgetFunc = gtk.widget.Widget delegate(gobject.object.ObjectG item);

/**
    A function that will be called whenever a child changes
  or is added.
  
  It lets you control if the child should be visible or not.

  ## Parameters
  $(LIST
    * $(B child)       a [gtk.flow_box_child.FlowBoxChild] that may be filtered
  )
  Returns:     true if the row should be visible, false otherwise
*/
alias FlowBoxFilterFunc = bool delegate(gtk.flow_box_child.FlowBoxChild child);

/**
    A function used by [gtk.flow_box.FlowBox.selectedForeach].
  
  It will be called on every selected child of the box.

  ## Parameters
  $(LIST
    * $(B box)       a [gtk.flow_box.FlowBox]
    * $(B child)       a [gtk.flow_box_child.FlowBoxChild]
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
      they are equal, and > 0 otherwise
*/
alias FlowBoxSortFunc = int delegate(gtk.flow_box_child.FlowBoxChild child1, gtk.flow_box_child.FlowBoxChild child2);

/**
    The type of function that is used for deciding what fonts get
  shown in a [gtk.font_chooser.FontChooser].
  
  See [gtk.font_chooser.FontChooser.setFilterFunc].

  ## Parameters
  $(LIST
    * $(B family)       a [pango.font_family.FontFamily]
    * $(B face)       a [pango.font_face.FontFace] belonging to family
  )
  Returns:     true if the font should be displayed
*/
alias FontFilterFunc = bool delegate(pango.font_family.FontFamily family, pango.font_face.FontFace face);

/**
    A function used by [gtk.icon_view.IconView.selectedForeach] to map all
  selected rows.
  
  It will be called on every selected row in the view.

  ## Parameters
  $(LIST
    * $(B iconView)       a [gtk.icon_view.IconView]
    * $(B path)       The [gtk.tree_path.TreePath] of a selected row
  )
*/
alias IconViewForeachFunc = void delegate(gtk.icon_view.IconView iconView, gtk.tree_path.TreePath path);

/**
    Called for list boxes that are bound to a [gio.list_model.ListModel] with
  [gtk.list_box.ListBox.bindModel] for each item that gets added to the model.
  
  If the widget returned is not a #GtkListBoxRow widget, then the widget
  will be inserted as the child of an intermediate #GtkListBoxRow.

  ## Parameters
  $(LIST
    * $(B item)       the item from the model for which to create a widget for
  )
  Returns:     a [gtk.widget.Widget] that represents item
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
    * $(B box)       a [gtk.list_box.ListBox]
    * $(B row)       a [gtk.list_box_row.ListBoxRow]
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
  is called, which lets you update the header on row.
  
  You may remove or set a new one via [gtk.list_box_row.ListBoxRow.setHeader]
  or just change the state of the current header widget.

  ## Parameters
  $(LIST
    * $(B row)       the row to update
    * $(B before)       the row before row, or null if it is first
  )
*/
alias ListBoxUpdateHeaderFunc = void delegate(gtk.list_box_row.ListBoxRow row, gtk.list_box_row.ListBoxRow before);

/**
    User function that is called to map an item of the original model to
  an item expected by the map model.
  
  The returned items must conform to the item type of the model they are
  used with.

  ## Parameters
  $(LIST
    * $(B item)       The item to map
  )
  Returns:     The item to map to
*/
alias MapListModelMapFunc = gobject.object.ObjectG delegate(gobject.object.ObjectG item);

/**
    User-provided callback function to create a popup for a
  [gtk.menu_button.MenuButton] on demand.
  
  This function is called when the popup of menu_button is shown,
  but none has been provided via [gtk.menu_button.MenuButton.setPopover]
  or [gtk.menu_button.MenuButton.setMenuModel].

  ## Parameters
  $(LIST
    * $(B menuButton)       the [gtk.menu_button.MenuButton]
  )
*/
alias MenuButtonCreatePopupFunc = void delegate(gtk.menu_button.MenuButton menuButton);

/**
    The type of function that is passed to
  [gtk.global.printRunPageSetupDialogAsync].
  
  This function will be called when the page setup dialog
  is dismissed, and also serves as destroy notify for data.

  ## Parameters
  $(LIST
    * $(B pageSetup)       the [gtk.page_setup.PageSetup] that has been passed to
        [gtk.global.printRunPageSetupDialogAsync]
  )
*/
alias PageSetupDoneFunc = void delegate(gtk.page_setup.PageSetup pageSetup);

/**
    The type of callback that is passed to [gtk.print_job.PrintJob.send].
  
  It is called when the print job has been completely sent.

  ## Parameters
  $(LIST
    * $(B printJob)       the [gtk.print_job.PrintJob]
    * $(B error)       a [glib.error.ErrorG] that contains error information if the sending
        of the print job failed, otherwise null
  )
*/
alias PrintJobCompleteFunc = void delegate(gtk.print_job.PrintJob printJob, glib.error.ErrorG error);

/** */
alias PrintSettingsFunc = void delegate(string key, string value);

/**
    The type of function passed to [gtk.global.enumeratePrinters].
  
  Note that you need to ref printer, if you want to keep
  a reference to it after the function has returned.

  ## Parameters
  $(LIST
    * $(B printer)       a [gtk.printer.Printer]
  )
  Returns:     true to stop the enumeration, false to continue
*/
alias PrinterFunc = bool delegate(gtk.printer.Printer printer);

/** */
alias ScaleFormatValueFunc = string delegate(gtk.scale.Scale scale, double value);

/**
    Prototype for shortcuts based on user callbacks.

  ## Parameters
  $(LIST
    * $(B widget)       The widget passed to the activation
    * $(B args)       The arguments passed to the activation
  )
  Returns:     true if the action was successful.
*/
alias ShortcutFunc = bool delegate(gtk.widget.Widget widget, glib.variant.VariantG args);

/**
    The predicate function used by [gtk.text_iter.TextIter.forwardFindChar] and
  [gtk.text_iter.TextIter.backwardFindChar].

  ## Parameters
  $(LIST
    * $(B ch)       a Unicode code point
  )
  Returns:     true if the predicate is satisfied, and the iteration should
      stop, and false otherwise
*/
alias TextCharPredicate = bool delegate(dchar ch);

/**
    A function used with [gtk.text_tag_table.TextTagTable.foreach_],
  to iterate over every [gtk.text_tag.TextTag] inside a [gtk.text_tag_table.TextTagTable].

  ## Parameters
  $(LIST
    * $(B tag)       the [gtk.text_tag.TextTag]
  )
*/
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
    A function to set the properties of a cell instead of just using the
  straight mapping between the cell and the model.
  
  This function is useful for customizing the cell renderer. For example,
  a function might get an* integer from the tree_model, and render it to
  the “text” attribute of “cell” by converting it to its written equivalent.
  
  See also: [gtk.tree_view_column.TreeViewColumn.setCellDataFunc]

  ## Parameters
  $(LIST
    * $(B treeColumn)       A [gtk.tree_view_column.TreeViewColumn]
    * $(B cell)       The [gtk.cell_renderer.CellRenderer] that is being rendered by tree_column
    * $(B treeModel)       The [gtk.tree_model.TreeModel] being rendered
    * $(B iter)       A [gtk.tree_iter.TreeIter] of the current row rendered
  )
*/
alias TreeCellDataFunc = void delegate(gtk.tree_view_column.TreeViewColumn treeColumn, gtk.cell_renderer.CellRenderer cell, gtk.tree_model.TreeModel treeModel, gtk.tree_iter.TreeIter iter);

/**
    A GtkTreeIterCompareFunc should return a negative integer, zero, or a positive
  integer if a sorts before b, a sorts with b, or a sorts after b
  respectively.
  
  If two iters compare as equal, their order in the sorted model
  is undefined. In order to ensure that the [gtk.tree_sortable.TreeSortable] behaves as
  expected, the GtkTreeIterCompareFunc must define a partial order on
  the model, i.e. it must be reflexive, antisymmetric and transitive.
  
  For example, if model is a product catalogue, then a compare function
  for the “price” column could be one which returns
  `price_of(a) - price_of(b)`.

  ## Parameters
  $(LIST
    * $(B model)       The [gtk.tree_model.TreeModel] the comparison is within
    * $(B a)       A [gtk.tree_iter.TreeIter] in model
    * $(B b)       Another [gtk.tree_iter.TreeIter] in model
  )
  Returns:     a negative integer, zero or a positive integer depending on whether
      a sorts before, with or after b
*/
alias TreeIterCompareFunc = int delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter a, gtk.tree_iter.TreeIter b);

/**
    Prototype of the function called to create new child models when
  [gtk.tree_list_row.TreeListRow.setExpanded] is called.
  
  This function can return null to indicate that item is guaranteed to be
  a leaf node and will never have children. If it does not have children but
  may get children later, it should return an empty model that is filled once
  children arrive.

  ## Parameters
  $(LIST
    * $(B item)       The item that is being expanded
  )
  Returns:     The model tracking the children of
      item or null if item can never have children
*/
alias TreeListModelCreateModelFunc = gio.list_model.ListModel delegate(gobject.object.ObjectG item);

/**
    A function which calculates display values from raw values in the model.
  It must fill value with the display value for the column column in the
  row indicated by iter.
  
  Since this function is called for each data access, it’s not a
  particularly efficient operation.

  ## Parameters
  $(LIST
    * $(B model)       the [gtk.tree_model_filter.TreeModelFilter]
    * $(B iter)       a [gtk.tree_iter.TreeIter] pointing to the row whose display values are determined
    * $(B value)       A [gobject.value.Value] which is already initialized for
       with the correct type for the column column.
    * $(B column)       the column whose display value is determined
  )
*/
alias TreeModelFilterModifyFunc = void delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter, out gobject.value.Value value, int column);

/**
    A function which decides whether the row indicated by iter is visible.

  ## Parameters
  $(LIST
    * $(B model)       the child model of the [gtk.tree_model_filter.TreeModelFilter]
    * $(B iter)       a [gtk.tree_iter.TreeIter] pointing to the row in model whose visibility
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
    * $(B model)       the [gtk.tree_model.TreeModel] being iterated
    * $(B path)       the current [gtk.tree_path.TreePath]
    * $(B iter)       the current [gtk.tree_iter.TreeIter]
  )
  Returns:     true to stop iterating, false to continue
*/
alias TreeModelForeachFunc = bool delegate(gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter);

/**
    A function used by [gtk.tree_selection.TreeSelection.selectedForeach] to map all
  selected rows.  It will be called on every selected row in the view.

  ## Parameters
  $(LIST
    * $(B model)       The [gtk.tree_model.TreeModel] being viewed
    * $(B path)       The [gtk.tree_path.TreePath] of a selected row
    * $(B iter)       A [gtk.tree_iter.TreeIter] pointing to a selected row
  )
*/
alias TreeSelectionForeachFunc = void delegate(gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter);

/**
    A function used by [gtk.tree_selection.TreeSelection.setSelectFunction] to filter
  whether or not a row may be selected. It is called whenever a row's
  state might change.
  
  A return value of true indicates to selection that it is okay to
  change the selection.

  ## Parameters
  $(LIST
    * $(B selection)       A [gtk.tree_selection.TreeSelection]
    * $(B model)       A [gtk.tree_model.TreeModel] being viewed
    * $(B path)       The [gtk.tree_path.TreePath] of the row in question
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
    * $(B treeView)       A [gtk.tree_view.TreeView]
    * $(B column)       The [gtk.tree_view_column.TreeViewColumn] being dragged
    * $(B prevColumn)       A [gtk.tree_view_column.TreeViewColumn] on one side of column
    * $(B nextColumn)       A [gtk.tree_view_column.TreeViewColumn] on the other side of column
  )
  Returns:     true, if column can be dropped in this spot
*/
alias TreeViewColumnDropFunc = bool delegate(gtk.tree_view.TreeView treeView, gtk.tree_view_column.TreeViewColumn column, gtk.tree_view_column.TreeViewColumn prevColumn, gtk.tree_view_column.TreeViewColumn nextColumn);

/**
    Function used for [gtk.tree_view.TreeView.mapExpandedRows].

  ## Parameters
  $(LIST
    * $(B treeView)       A [gtk.tree_view.TreeView]
    * $(B path)       The path that’s expanded
  )
*/
alias TreeViewMappingFunc = void delegate(gtk.tree_view.TreeView treeView, gtk.tree_path.TreePath path);

/**
    Function type for determining whether the row pointed to by iter should
  be rendered as a separator. A common way to implement this is to have a
  boolean column in the model, whose values the [gtk.types.TreeViewRowSeparatorFunc]
  returns.

  ## Parameters
  $(LIST
    * $(B model)       the [gtk.tree_model.TreeModel]
    * $(B iter)       a [gtk.tree_iter.TreeIter] pointing at a row in model
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
    * $(B model)       the [gtk.tree_model.TreeModel] being searched
    * $(B column)       the search column set by [gtk.tree_view.TreeView.setSearchColumn]
    * $(B key)       the key string to compare with
    * $(B iter)       a [gtk.tree_iter.TreeIter] pointing the row of model that should be compared
       with key.
  )
  Returns:     false if the row matches, true otherwise.
*/
alias TreeViewSearchEqualFunc = bool delegate(gtk.tree_model.TreeModel model, int column, string key, gtk.tree_iter.TreeIter iter);

/**
    The type of the callback functions used for activating
  actions installed with [gtk.widget_class.WidgetClass.installAction].
  
  The parameter must match the parameter_type of the action.

  ## Parameters
  $(LIST
    * $(B widget)       the widget to which the action belongs
    * $(B actionName)       the action name
    * $(B parameter)       parameter for activation
  )
*/
alias WidgetActionActivateFunc = void delegate(gtk.widget.Widget widget, string actionName, glib.variant.VariantG parameter);

/**
    The priority of an accessibility announcement.
*/
enum AccessibleAnnouncementPriority
{
  /** */
  Low = 0,

  /** */
  Medium = 1,

  /** */
  High = 2,
}

/**
    The possible values for the [gtk.types.AccessibleProperty.Autocomplete]
  accessible property.
*/
enum AccessibleAutocomplete
{
  /**
      Automatic suggestions are not displayed.
  */
  None = 0,

  /**
      When a user is providing input, text
       suggesting one way to complete the provided input may be dynamically
       inserted after the caret.
  */
  Inline = 1,

  /**
      When a user is providing input, an element
       containing a collection of values that could complete the provided input
       may be displayed.
  */
  List = 2,

  /**
      When a user is providing input, an element
       containing a collection of values that could complete the provided input
       may be displayed. If displayed, one value in the collection is automatically
       selected, and the text needed to complete the automatically selected value
       appears after the caret in the input.
  */
  Both = 3,
}

/**
    The possible values for the [gtk.types.AccessibleState.Invalid]
  accessible state.
  
  Note that the [gtk.types.AccessibleInvalidState.False] and
  [gtk.types.AccessibleInvalidState.True] have the same values
  as false and true.
*/
enum AccessibleInvalidState
{
  /**
      There are no detected errors in the value
  */
  False = 0,

  /**
      The value entered by the user has failed validation
  */
  True = 1,

  /**
      A grammatical error was detected
  */
  Grammar = 2,

  /**
      A spelling error was detected
  */
  Spelling = 3,
}

/**
    The various platform states which can be queried
  using [gtk.accessible.Accessible.getPlatformState].
*/
enum AccessiblePlatformState
{
  /**
      whether the accessible can be focused
  */
  Focusable = 0,

  /**
      whether the accessible has focus
  */
  Focused = 1,

  /**
      whether the accessible is active
  */
  Active = 2,
}

/**
    The possible accessible properties of a `iface@Accessible`.
*/
enum AccessibleProperty
{
  /**
      Indicates whether inputting text
       could trigger display of one or more predictions of the user's intended
       value for a combobox, searchbox, or textbox and specifies how predictions
       would be presented if they were made. Value type: `enum@AccessibleAutocomplete`
  */
  Autocomplete = 0,

  /**
      Defines a string value that describes
       or annotates the current element. Value type: string
  */
  Description = 1,

  /**
      Indicates the availability and type of
       interactive popup element, such as menu or dialog, that can be triggered
       by an element.
  */
  HasPopup = 2,

  /**
      Indicates keyboard shortcuts that an
       author has implemented to activate or give focus to an element. Value type:
       string
  */
  KeyShortcuts = 3,

  /**
      Defines a string value that labels the current
       element. Value type: string
  */
  Label = 4,

  /**
      Defines the hierarchical level of an element
       within a structure. Value type: integer
  */
  Level = 5,

  /**
      Indicates whether an element is modal when
       displayed. Value type: boolean
  */
  Modal = 6,

  /**
      Indicates whether a text box accepts
       multiple lines of input or only a single line. Value type: boolean
  */
  MultiLine = 7,

  /**
      Indicates that the user may select
       more than one item from the current selectable descendants. Value type:
       boolean
  */
  MultiSelectable = 8,

  /**
      Indicates whether the element's
       orientation is horizontal, vertical, or unknown/ambiguous. Value type:
       `enum@Orientation`
  */
  Orientation = 9,

  /**
      Defines a short hint (a word or short
       phrase) intended to aid the user with data entry when the control has no
       value. A hint could be a sample value or a brief description of the expected
       format. Value type: string
  */
  Placeholder = 10,

  /**
      Indicates that the element is not editable,
       but is otherwise operable. Value type: boolean
  */
  ReadOnly = 11,

  /**
      Indicates that user input is required on
       the element before a form may be submitted. Value type: boolean
  */
  Required = 12,

  /**
      Defines a human-readable,
       author-localized description for the role of an element. Value type: string
  */
  RoleDescription = 13,

  /**
      Indicates if items in a table or grid are
       sorted in ascending or descending order. Value type: `enum@AccessibleSort`
  */
  Sort = 14,

  /**
      Defines the maximum allowed value for a
       range widget. Value type: double
  */
  ValueMax = 15,

  /**
      Defines the minimum allowed value for a
       range widget. Value type: double
  */
  ValueMin = 16,

  /**
      Defines the current value for a range widget.
       Value type: double
  */
  ValueNow = 17,

  /**
      Defines the human readable text alternative
       of aria-valuenow for a range widget. Value type: string
  */
  ValueText = 18,
}

/**
    The possible accessible relations of a `iface@Accessible`.
  
  Accessible relations can be references to other widgets,
  integers or strings.
*/
enum AccessibleRelation
{
  /**
      Identifies the currently active
       element when focus is on a composite widget, combobox, textbox, group,
       or application. Value type: reference
  */
  ActiveDescendant = 0,

  /**
      Defines the total number of columns
       in a table, grid, or treegrid. Value type: integer
  */
  ColCount = 1,

  /**
      Defines an element's column index or
       position with respect to the total number of columns within a table,
       grid, or treegrid. Value type: integer
  */
  ColIndex = 2,

  /**
      Defines a human readable text
      alternative of [gtk.types.AccessibleRelation.ColIndex]. Value type: string
  */
  ColIndexText = 3,

  /**
      Defines the number of columns spanned
      by a cell or gridcell within a table, grid, or treegrid. Value type: integer
  */
  ColSpan = 4,

  /**
      Identifies the element (or elements) whose
       contents or presence are controlled by the current element. Value type: reference
  */
  Controls = 5,

  /**
      Identifies the element (or elements)
       that describes the object. Value type: reference
  */
  DescribedBy = 6,

  /**
      Identifies the element (or elements) that
       provide additional information related to the object. Value type: reference
  */
  Details = 7,

  /**
      Identifies the element that provides
       an error message for an object. Value type: reference
  */
  ErrorMessage = 8,

  /**
      Identifies the next element (or elements)
       in an alternate reading order of content which, at the user's discretion,
       allows assistive technology to override the general default of reading in
       document source order. Value type: reference
  */
  FlowTo = 9,

  /**
      Identifies the element (or elements)
       that labels the current element. Value type: reference
  */
  LabelledBy = 10,

  /**
      Identifies an element (or elements) in order
       to define a visual, functional, or contextual parent/child relationship
       between elements where the widget hierarchy cannot be used to represent
       the relationship. Value type: reference
  */
  Owns = 11,

  /**
      Defines an element's number or position
       in the current set of listitems or treeitems. Value type: integer
  */
  PosInSet = 12,

  /**
      Defines the total number of rows in a table,
       grid, or treegrid. Value type: integer
  */
  RowCount = 13,

  /**
      Defines an element's row index or position
       with respect to the total number of rows within a table, grid, or treegrid.
       Value type: integer
  */
  RowIndex = 14,

  /**
      Defines a human readable text
       alternative of aria-rowindex. Value type: string
  */
  RowIndexText = 15,

  /**
      Defines the number of rows spanned by a
       cell or gridcell within a table, grid, or treegrid. Value type: integer
  */
  RowSpan = 16,

  /**
      Defines the number of items in the current
       set of listitems or treeitems. Value type: integer
  */
  SetSize = 17,
}

/**
    The accessible role for a `iface@Accessible` implementation.
  
  Abstract roles are only used as part of the ontology; application
  developers must not use abstract roles in their code.
*/
enum AccessibleRole
{
  /**
      An element with important, and usually
      time-sensitive, information
  */
  Alert = 0,

  /**
      A type of dialog that contains an
      alert message
  */
  AlertDialog = 1,

  /**
      Unused
  */
  Banner = 2,

  /**
      An input element that allows for
      user-triggered actions when clicked or pressed
  */
  Button = 3,

  /**
      Unused
  */
  Caption = 4,

  /**
      Unused
  */
  Cell = 5,

  /**
      A checkable input element that has
      three possible values: `true`, `false`, or `mixed`
  */
  Checkbox = 6,

  /**
      A header in a columned list.
  */
  ColumnHeader = 7,

  /**
      An input that controls another element,
      such as a list or a grid, that can dynamically pop up to help the user
      set the value of the input
  */
  ComboBox = 8,

  /**
      Abstract role.
  */
  Command = 9,

  /**
      Abstract role.
  */
  Composite = 10,

  /**
      A dialog is a window that is designed to interrupt
      the current processing of an application in order to prompt the user to enter
      information or require a response.
  */
  Dialog = 11,

  /**
      Content that assistive technology users may want to
      browse in a reading mode.
  */
  Document = 12,

  /**
      Unused
  */
  Feed = 13,

  /**
      Unused
  */
  Form = 14,

  /**
      A nameless container that has no semantic meaning
      of its own. This is the role that GTK uses by default for widgets.
  */
  Generic = 15,

  /**
      A grid of items.
  */
  Grid = 16,

  /**
      An item in a grid or tree grid.
  */
  GridCell = 17,

  /**
      An element that groups multiple related widgets. GTK uses
      this role for various containers, like [gtk.header_bar.HeaderBar] or [gtk.notebook.Notebook].
  */
  Group = 18,

  /**
      Unused
  */
  Heading = 19,

  /**
      An image.
  */
  Img = 20,

  /**
      Abstract role.
  */
  Input = 21,

  /**
      A visible name or caption for a user interface component.
  */
  Label = 22,

  /**
      Abstract role.
  */
  Landmark = 23,

  /**
      Unused
  */
  Legend = 24,

  /**
      A clickable link.
  */
  Link = 25,

  /**
      A list of items.
  */
  List = 26,

  /**
      Unused.
  */
  ListBox = 27,

  /**
      An item in a list.
  */
  ListItem = 28,

  /**
      Unused
  */
  Log = 29,

  /**
      Unused
  */
  Main = 30,

  /**
      Unused
  */
  Marquee = 31,

  /**
      Unused
  */
  Math = 32,

  /**
      An element that represents a value within a known range.
  */
  Meter = 33,

  /**
      A menu.
  */
  Menu = 34,

  /**
      A menubar.
  */
  MenuBar = 35,

  /**
      An item in a menu.
  */
  MenuItem = 36,

  /**
      A check item in a menu.
  */
  MenuItemCheckbox = 37,

  /**
      A radio item in a menu.
  */
  MenuItemRadio = 38,

  /**
      Unused
  */
  Navigation = 39,

  /**
      An element that is not represented to accessibility technologies.
      This role is synonymous to @GTK_ACCESSIBLE_ROLE_PRESENTATION.
  */
  None = 40,

  /**
      Unused
  */
  Note = 41,

  /**
      Unused
  */
  Option = 42,

  /**
      An element that is not represented to accessibility technologies.
      This role is synonymous to @GTK_ACCESSIBLE_ROLE_NONE.
  */
  Presentation = 43,

  /**
      An element that displays the progress
      status for tasks that take a long time.
  */
  ProgressBar = 44,

  /**
      A checkable input in a group of radio roles,
      only one of which can be checked at a time.
  */
  Radio = 45,

  /**
      Unused
  */
  RadioGroup = 46,

  /**
      Abstract role.
  */
  Range = 47,

  /**
      Unused
  */
  Region = 48,

  /**
      A row in a columned list.
  */
  Row = 49,

  /**
      Unused
  */
  RowGroup = 50,

  /**
      Unused
  */
  RowHeader = 51,

  /**
      A graphical object that controls the scrolling
      of content within a viewing area, regardless of whether the content is fully
      displayed within the viewing area.
  */
  Scrollbar = 52,

  /**
      Unused
  */
  Search = 53,

  /**
      A type of textbox intended for specifying
      search criteria.
  */
  SearchBox = 54,

  /**
      Abstract role.
  */
  Section = 55,

  /**
      Abstract role.
  */
  SectionHead = 56,

  /**
      Abstract role.
  */
  Select = 57,

  /**
      A divider that separates and distinguishes
      sections of content or groups of menuitems.
  */
  Separator = 58,

  /**
      A user input where the user selects a value
      from within a given range.
  */
  Slider = 59,

  /**
      A form of range that expects the user to
      select from among discrete choices.
  */
  SpinButton = 60,

  /**
      Unused
  */
  Status = 61,

  /**
      Abstract role.
  */
  Structure = 62,

  /**
      A type of checkbox that represents on/off values,
      as opposed to checked/unchecked values.
  */
  Switch = 63,

  /**
      An item in a list of tab used for switching pages.
  */
  Tab = 64,

  /**
      Unused
  */
  Table = 65,

  /**
      A list of tabs for switching pages.
  */
  TabList = 66,

  /**
      A page in a notebook or stack.
  */
  TabPanel = 67,

  /**
      A type of input that allows free-form text
      as its value.
  */
  TextBox = 68,

  /**
      Unused
  */
  Time = 69,

  /**
      Unused
  */
  Timer = 70,

  /**
      Unused
  */
  Toolbar = 71,

  /**
      Unused
  */
  Tooltip = 72,

  /**
      Unused
  */
  Tree = 73,

  /**
      A treeview-like, columned list.
  */
  TreeGrid = 74,

  /**
      Unused
  */
  TreeItem = 75,

  /**
      Abstract role for interactive components of a
      graphical user interface
  */
  Widget = 76,

  /**
      Abstract role for windows.
  */
  Window = 77,

  /**
      A type of push button which stays pressed until depressed by a second
    activation.
  */
  ToggleButton = 78,

  /**
      A toplevel element of a graphical user interface.
    
    This is the role that GTK uses by default for windows.
  */
  Application = 79,

  /**
      A paragraph of content.
  */
  Paragraph = 80,

  /**
      A section of content that is quoted from another source.
  */
  BlockQuote = 81,

  /**
      A section of a page that consists of a composition that forms an independent
    part of a document, page, or site.
  */
  Article = 82,

  /**
      A comment contains content expressing reaction to other content.
  */
  Comment = 83,

  /**
      A virtual terminal.
  */
  Terminal = 84,
}

/**
    The possible values for the [gtk.types.AccessibleProperty.Sort]
  accessible property.
*/
enum AccessibleSort
{
  /**
      There is no defined sort applied to the column.
  */
  None = 0,

  /**
      Items are sorted in ascending order by this column.
  */
  Ascending = 1,

  /**
      Items are sorted in descending order by this column.
  */
  Descending = 2,

  /**
      A sort algorithm other than ascending or
       descending has been applied.
  */
  Other = 3,
}

/**
    The possible accessible states of a `iface@Accessible`.
*/
enum AccessibleState
{
  /**
      A “busy” state. This state has boolean values
  */
  Busy = 0,

  /**
      A “checked” state; indicates the current
      state of a `class@CheckButton`. Value type: `enum@AccessibleTristate`
  */
  Checked = 1,

  /**
      A “disabled” state; corresponds to the
      `property@Widget:sensitive` property. It indicates a UI element
      that is perceivable, but not editable or operable. Value type: boolean
  */
  Disabled = 2,

  /**
      An “expanded” state; corresponds to the
      `property@Expander:expanded` property. Value type: boolean
      or undefined
  */
  Expanded = 3,

  /**
      A “hidden” state; corresponds to the
      `property@Widget:visible` property. You can use this state
      explicitly on UI elements that should not be exposed to an assistive
      technology. Value type: boolean
      See also: [gtk.types.AccessibleState.Disabled]
  */
  Hidden = 4,

  /**
      An “invalid” state; set when a widget
      is showing an error. Value type: `enum@AccessibleInvalidState`
  */
  Invalid = 5,

  /**
      A “pressed” state; indicates the current
      state of a `class@ToggleButton`. Value type: `enum@AccessibleTristate`
      enumeration
  */
  Pressed = 6,

  /**
      A “selected” state; set when a widget
      is selected. Value type: boolean or undefined
  */
  Selected = 7,

  /**
      Indicates that a widget with the GTK_ACCESSIBLE_ROLE_LINK has been visited.
    Value type: boolean.
  */
  Visited = 8,
}

/**
    The type of contents change operation.
*/
enum AccessibleTextContentChange
{
  /**
      contents change as the result of
      an insert operation
  */
  Insert = 0,

  /**
      contents change as the result of
      a remove operation
  */
  Remove = 1,
}

/**
    The granularity for queries about the text contents of a [gtk.accessible_text.AccessibleText]
  implementation.
*/
enum AccessibleTextGranularity
{
  /**
      Use the boundary between
      characters (including non-printing characters)
  */
  Character = 0,

  /**
      Use the boundary between words,
      starting from the beginning of the current word and ending at the
      beginning of the next word
  */
  Word = 1,

  /**
      Use the boundary between
      sentences, starting from the beginning of the current sentence and
      ending at the beginning of the next sentence
  */
  Sentence = 2,

  /**
      Use the boundary between lines,
      starting from the beginning of the current line and ending at the
      beginning of the next line
  */
  Line = 3,

  /**
      Use the boundary between
      paragraphs, starting from the beginning of the current paragraph and
      ending at the beginning of the next paragraph
  */
  Paragraph = 4,
}

/**
    The possible values for the [gtk.types.AccessibleState.Pressed]
  accessible state.
  
  Note that the [gtk.types.AccessibleTristate.False] and
  [gtk.types.AccessibleTristate.True] have the same values
  as false and true.
*/
enum AccessibleTristate
{
  /**
      The state is `false`
  */
  False = 0,

  /**
      The state is `true`
  */
  True = 1,

  /**
      The state is `mixed`
  */
  Mixed = 2,
}

/**
    Controls how a widget deals with extra space in a single dimension.
  
  Alignment only matters if the widget receives a “too large” allocation,
  for example if you packed the widget with the [gtk.widget.Widget.gboolean]
  property inside a `class@Box`, then the widget might get extra space.
  If you have for example a 16x16 icon inside a 32x32 space, the icon
  could be scaled and stretched, it could be centered, or it could be
  positioned to one side of the space.
  
  Note that in horizontal context [gtk.types.Align.Start] and [gtk.types.Align.End]
  are interpreted relative to text direction.
  
  Baseline support is optional for containers and widgets, and is only available
  for vertical alignment. `GTK_ALIGN_BASELINE_CENTER and [gtk.types.Align.BaselineFill]
  are treated similar to [gtk.types.Align.Center] and [gtk.types.Align.Fill], except that it
  positions the widget to line up the baselines, where that is supported.
*/
enum Align
{
  /**
      stretch to fill all space if possible, center if
      no meaningful way to stretch
  */
  Fill = 0,

  /**
      snap to left or top side, leaving space on right or bottom
  */
  Start = 1,

  /**
      snap to right or bottom side, leaving space on left or top
  */
  End = 2,

  /**
      center natural width of widget inside the allocation
  */
  Center = 3,

  /**
      a different name for [gtk.types.Align.Baseline].
  */
  BaselineFill = 4,

  /**
      align the widget according to the baseline.
  
    Deprecated:     Use [gtk.types.Align.BaselineFill] instead
  */
  Baseline = 4,

  /**
      stretch to fill all space, but align the baseline.
  */
  BaselineCenter = 5,
}

/**
    Types of user actions that may be blocked by [gtk.application.Application].
  
  See [gtk.application.Application.inhibit].
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
      No arrow.
  */
  None = 4,
}

/**
    Determines the page role inside a [gtk.assistant.Assistant].
  
  The role is used to handle buttons sensitivity and visibility.
  
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
    Baseline position in a row of widgets.
  
  Whenever a container has some form of natural row it may align
  children in that row along a common typographical baseline. If
  the amount of vertical space in the row is taller than the total
  requested height of the baseline-aligned children then it can use a
  [gtk.types.BaselinePosition] to select where to put the baseline inside the
  extra available space.
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
      Same as [gtk.types.BorderStyle.None]
  */
  Hidden = 1,

  /**
      A single line segment
  */
  Solid = 2,

  /**
      Looks as if the content is sunken into the canvas
  */
  Inset = 3,

  /**
      Looks as if the content is coming out of the canvas
  */
  Outset = 4,

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
    The list of flags that can be passed to [gtk.builder.Builder.createClosure].
  
  New values may be added in the future for new features, so external
  implementations of [gtk.builder_scope.BuilderScope] should test the flags
  for unknown values and raise a [gtk.types.BuilderError.InvalidAttribute] error
  when they encounter one.
*/
enum BuilderClosureFlags : uint
{
  /**
      The closure should be created swapped. See
      [gobject.cclosure.CClosure.newSwap] for details.
  */
  Swapped = 1,
}

/**
    Error codes that identify various errors that can occur while using
  [gtk.builder.Builder].
*/
enum BuilderError
{
  /**
      A type-func attribute didn’t name
     a function that returns a [gobject.types.TYPE_FLAG_RESERVED_ID_BIT].
  */
  InvalidTypeFunction = 0,

  /**
      The input contained a tag that [gtk.builder.Builder]
     can’t handle.
  */
  UnhandledTag = 1,

  /**
      An attribute that is required by
     [gtk.builder.Builder] was missing.
  */
  MissingAttribute = 2,

  /**
      [gtk.builder.Builder] found an attribute that
     it doesn’t understand.
  */
  InvalidAttribute = 3,

  /**
      [gtk.builder.Builder] found a tag that
     it doesn’t understand.
  */
  InvalidTag = 4,

  /**
      A required property value was
     missing.
  */
  MissingPropertyValue = 5,

  /**
      [gtk.builder.Builder] couldn’t parse
     some attribute value.
  */
  InvalidValue = 6,

  /**
      The input file requires a newer version
     of GTK.
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
      An object id is unknown.
  */
  InvalidId = 13,

  /**
      A function could not be found. This often happens
      when symbols are set to be kept private. Compiling code with -rdynamic or using the
      `gmodule-export-2.0` pkgconfig module can fix this problem.
  */
  InvalidFunction = 14,
}

/**
    Prebuilt sets of buttons for [gtk.dialog.Dialog].
  
  If none of these choices are appropriate, simply use
  [gtk.types.ButtonsType.None] and call [gtk.dialog.Dialog.addButtons].
  
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
    The available modes for `property@Gtk.CellRendererAccel:accel-mode`.
*/
enum CellRendererAccelMode
{
  /**
      GTK accelerators mode
  */
  Gtk = 0,

  /**
      Other accelerator mode
  */
  Other = 1,
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
      The cell is in a row that can be expanded
  */
  Expandable = 32,

  /**
      The cell is in a row that is expanded
  */
  Expanded = 64,
}

/**
    Describes how a [gtk.string_sorter.StringSorter] turns strings into sort keys to
  compare them.
  
  Note that the result of sorting will in general depend on the current locale
  unless the mode is @GTK_COLLATION_NONE.
*/
enum Collation
{
  /**
      Don't do any collation
  */
  None = 0,

  /**
      Use `func@GLib.utf8_collate_key`
  */
  Unicode = 1,

  /**
      Use `func@GLib.utf8_collate_key_for_filename`
  */
  Filename = 2,
}

/**
    The widget attributes that can be used when creating a `class@Constraint`.
*/
enum ConstraintAttribute
{
  /**
      No attribute, used for constant
      relations
  */
  None = 0,

  /**
      The left edge of a widget, regardless of
      text direction
  */
  Left = 1,

  /**
      The right edge of a widget, regardless
      of text direction
  */
  Right = 2,

  /**
      The top edge of a widget
  */
  Top = 3,

  /**
      The bottom edge of a widget
  */
  Bottom = 4,

  /**
      The leading edge of a widget, depending
      on text direction; equivalent to [gtk.types.ConstraintAttribute.Left] for LTR
      languages, and [gtk.types.ConstraintAttribute.Right] for RTL ones
  */
  Start = 5,

  /**
      The trailing edge of a widget, depending
      on text direction; equivalent to [gtk.types.ConstraintAttribute.Right] for LTR
      languages, and [gtk.types.ConstraintAttribute.Left] for RTL ones
  */
  End = 6,

  /**
      The width of a widget
  */
  Width = 7,

  /**
      The height of a widget
  */
  Height = 8,

  /**
      The center of a widget, on the
      horizontal axis
  */
  CenterX = 9,

  /**
      The center of a widget, on the
      vertical axis
  */
  CenterY = 10,

  /**
      The baseline of a widget
  */
  Baseline = 11,
}

/**
    The relation between two terms of a constraint.
*/
enum ConstraintRelation
{
  /**
      Less than, or equal
  */
  Le = -1,

  /**
      Equal
  */
  Eq = 0,

  /**
      Greater than, or equal
  */
  Ge = 1,
}

/**
    The strength of a constraint, expressed as a symbolic constant.
  
  The strength of a `class@Constraint` can be expressed with any positive
  integer; the values of this enumeration can be used for readability.
*/
enum ConstraintStrength
{
  /**
      The constraint is required towards solving the layout
  */
  Required = 1001001000,

  /**
      A strong constraint
  */
  Strong = 1000000000,

  /**
      A medium constraint
  */
  Medium = 1000,

  /**
      A weak constraint
  */
  Weak = 1,
}

/**
    Domain for VFL parsing errors.
*/
enum ConstraintVflParserError
{
  /**
      Invalid or unknown symbol
  */
  Symbol = 0,

  /**
      Invalid or unknown attribute
  */
  Attribute = 1,

  /**
      Invalid or unknown view
  */
  View = 2,

  /**
      Invalid or unknown metric
  */
  Metric = 3,

  /**
      Invalid or unknown priority
  */
  Priority = 4,

  /**
      Invalid or unknown relation
  */
  Relation = 5,
}

/**
    Controls how a content should be made to fit inside an allocation.
*/
enum ContentFit
{
  /**
      Make the content fill the entire allocation,
      without taking its aspect ratio in consideration. The resulting
      content will appear as stretched if its aspect ratio is different
      from the allocation aspect ratio.
  */
  Fill = 0,

  /**
      Scale the content to fit the allocation,
      while taking its aspect ratio in consideration. The resulting
      content will appear as letterboxed if its aspect ratio is different
      from the allocation aspect ratio.
  */
  Contain = 1,

  /**
      Cover the entire allocation, while taking
      the content aspect ratio in consideration. The resulting content
      will appear as clipped if its aspect ratio is different from the
      allocation aspect ratio.
  */
  Cover = 2,

  /**
      The content is scaled down to fit the
      allocation, if needed, otherwise its original size is used.
  */
  ScaleDown = 3,
}

/**
    Specifies which corner a child widget should be placed in when packed into
  a `GtkScrolledWindow.`
  
  This is effectively the opposite of where the scroll bars are placed.
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
    Errors that can occur while parsing CSS.
  
  These errors are unexpected and will cause parts of the given CSS
  to be ignored.
*/
enum CssParserError
{
  /**
      Unknown failure.
  */
  Failed = 0,

  /**
      The given text does not form valid syntax
  */
  Syntax = 1,

  /**
      Failed to import a resource
  */
  Import = 2,

  /**
      The given name has not been defined
  */
  Name = 3,

  /**
      The given value is not correct
  */
  UnknownValue = 4,
}

/**
    Warnings that can occur while parsing CSS.
  
  Unlike [gtk.types.CssParserError]s, warnings do not cause the parser to
  skip any input, but they indicate issues that should be fixed.
*/
enum CssParserWarning
{
  /**
      The given construct is
      deprecated and will be removed in a future version
  */
  Deprecated = 0,

  /**
      A syntax construct was used
      that should be avoided
  */
  Syntax = 1,

  /**
      A feature is not implemented
  */
  Unimplemented = 2,
}

/**
    Flags to use with [gtk.global.setDebugFlags].
  
  Settings these flags causes GTK to print out different
  types of debugging information. Some of these flags are
  only available when GTK has been configured with `-Ddebug=true`.
*/
enum DebugFlags : uint
{
  /**
      Information about GtkTextView
  */
  Text = 1,

  /**
      Information about GtkTreeView
  */
  Tree = 2,

  /**
      Information about keyboard shortcuts
  */
  Keybindings = 4,

  /**
      Information about modules and extensions
  */
  Modules = 8,

  /**
      Information about size allocation
  */
  Geometry = 16,

  /**
      Information about icon themes
  */
  Icontheme = 32,

  /**
      Information about printing
  */
  Printing = 64,

  /**
      Trace GtkBuilder operation
  */
  Builder = 128,

  /**
      Information about size requests
  */
  SizeRequest = 256,

  /**
      Disable the style property cache
  */
  NoCssCache = 512,

  /**
      Open the GTK inspector
  */
  Interactive = 1024,

  /**
      Information about actions and menu models
  */
  Actions = 4096,

  /**
      Information from layout managers
  */
  Layout = 8192,

  /**
      Include debug render nodes in the generated snapshots
  */
  Snapshot = 16384,

  /**
      Information from the constraints solver
  */
  Constraints = 32768,

  /**
      Log unused GtkBuilder objects
  */
  BuilderObjects = 65536,

  /**
      Information about accessibility state changes
  */
  A11y = 131072,

  /**
      Information about icon fallback.
  */
  Iconfallback = 262144,

  /**
      Inverts the default text-direction.
  */
  InvertTextDir = 524288,
}

/**
    Passed to various keybinding signals for deleting text.
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
      refers to the visible lines, with respect to the current line
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
    Error codes in the `GTK_DIALOG_ERROR` domain that can be returned
  by async dialog functions.
*/
enum DialogError
{
  /**
      Generic error condition for when
      an operation fails and no more specific code is applicable
  */
  Failed = 0,

  /**
      The async function call was cancelled
      via its [gio.cancellable.Cancellable]
  */
  Cancelled = 1,

  /**
      The operation was cancelled
      by the user (via a Cancel or Close button)
  */
  Dismissed = 2,
}

/**
    Flags used to influence dialog construction.
*/
enum DialogFlags : uint
{
  /**
      Make the constructed dialog modal
  */
  Modal = 1,

  /**
      Destroy the dialog when its parent is destroyed
  */
  DestroyWithParent = 2,

  /**
      Create dialog with actions in header
      bar instead of action area
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
    The identifiers for [gtk.editable.Editable] properties.
  
  See [gtk.editable.Editable.installProperties] for details on how to
  implement the [gtk.editable.Editable] interface.
*/
enum EditableProperties
{
  /**
      the property id for [gtk.editable.Editable.utf8]
  */
  PropText = 0,

  /**
      the property id for `property@Gtk.Editable:cursor-position`
  */
  PropCursorPosition = 1,

  /**
      the property id for `property@Gtk.Editable:selection-bound`
  */
  PropSelectionBound = 2,

  /**
      the property id for [gtk.editable.Editable.gboolean]
  */
  PropEditable = 3,

  /**
      the property id for `property@Gtk.Editable:width-chars`
  */
  PropWidthChars = 4,

  /**
      the property id for `property@Gtk.Editable:max-width-chars`
  */
  PropMaxWidthChars = 5,

  /**
      the property id for [gtk.editable.Editable.gfloat]
  */
  PropXalign = 6,

  /**
      the property id for `property@Gtk.Editable:enable-undo`
  */
  PropEnableUndo = 7,

  /**
      the number of properties
  */
  NumProperties = 8,
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
    Describes the behavior of a [gtk.event_controller_scroll.EventControllerScroll].
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
      Emit ::decelerate after continuous scroll finishes.
  */
  Kinetic = 8,

  /**
      Emit scroll on both axes.
  */
  BothAxes = 3,
}

/**
    Describes the state of a [gdk.event_sequence.EventSequence] in a `class@Gesture`.
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
    Describes whether a [gtk.file_chooser.FileChooser] is being used to open existing files
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
}

/**
    These identify the various errors that can occur while calling
  [gtk.file_chooser.FileChooser] functions.
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
      Indicates an incomplete hostname
     (e.g. "http://foo" without a slash after that).
  */
  IncompleteHostname = 3,
}

/**
    Describes changes in a filter in more detail and allows objects
  using the filter to optimize refiltering items.
  
  If you are writing an implementation and are not sure which
  value to pass, [gtk.types.FilterChange.Different] is always a correct
  choice.
*/
enum FilterChange
{
  /**
      The filter change cannot be
      described with any of the other enumeration values.
  */
  Different = 0,

  /**
      The filter is less strict than
      it was before: All items that it used to return true for
      still return true, others now may, too.
  */
  LessStrict = 1,

  /**
      The filter is more strict than
      it was before: All items that it used to return false for
      still return false, others now may, too.
  */
  MoreStrict = 2,
}

/**
    Describes the known strictness of a filter.
  
  Note that for filters where the strictness is not known,
  [gtk.types.FilterMatch.Some] is always an acceptable value,
  even if a filter does match all or no items.
*/
enum FilterMatch
{
  /**
      The filter matches some items,
      [gtk.filter.Filter.match] may return true or false
  */
  Some = 0,

  /**
      The filter does not match any item,
      [gtk.filter.Filter.match] will always return false.
  */
  None = 1,

  /**
      The filter matches all items,
      [gtk.filter.Filter.match] will alays return true.
  */
  All = 2,
}

/**
    Specifies the granularity of font selection
  that is desired in a [gtk.font_chooser.FontChooser].
  
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

  /**
      Allow changing OpenType font variation axes
  */
  Variations = 4,

  /**
      Allow selecting specific OpenType font features
  */
  Features = 8,
}

/**
    The level of granularity for the font selection.
  
  Depending on this value, the [pango.font_description.FontDescription] that
  is returned by [gtk.font_dialog_button.FontDialogButton.getFontDesc]
  will have more or less fields set.
*/
enum FontLevel
{
  /**
      Select a font family
  */
  Family = 0,

  /**
      Select a font face (i.e. a family and a style)
  */
  Face = 1,

  /**
      Select a font (i.e. a face with a size, and possibly font variations)
  */
  Font = 2,

  /**
      Select a font and font features
  */
  Features = 3,
}

/**
    Represents the state of graphics offlodading.
*/
enum GraphicsOffloadEnabled
{
  /**
      Graphics offloading is enabled.
  */
  Enabled = 0,

  /**
      Graphics offloading is disabled.
  */
  Disabled = 1,
}

/**
    Used to specify options for [gtk.icon_theme.IconTheme.lookupIcon].
*/
enum IconLookupFlags : uint
{
  /**
      Try to always load regular icons, even
      when symbolic icon names are given
  */
  ForceRegular = 1,

  /**
      Try to always load symbolic icons, even
      when regular icon names are given
  */
  ForceSymbolic = 2,

  /**
      Starts loading the texture in the background
      so it is ready when later needed.
  */
  Preload = 4,
}

/**
    Built-in icon sizes.
  
  Icon sizes default to being inherited. Where they cannot be
  inherited, text size is the default.
  
  All widgets which use [gtk.types.IconSize] set the normal-icons or
  large-icons style classes correspondingly, and let themes
  determine the actual size to be used with the
  `-gtk-icon-size` CSS property.
*/
enum IconSize
{
  /**
      Keep the size of the parent element
  */
  Inherit = 0,

  /**
      Size similar to text size
  */
  Normal = 1,

  /**
      Large size, for example in an icon view
  */
  Large = 2,
}

/**
    Error codes for [gtk.icon_theme.IconTheme] operations.
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
      dropped item is inserted to the left
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
    Describes the image data representation used by a [gtk.image.Image].
  
  If you want to get the image from the widget, you can only get the
  currently-stored representation; for instance, if the [gtk.image.Image.getStorageType]
  returns [gtk.types.ImageType.Paintable], then you can call [gtk.image.Image.getPaintable].
  
  For empty images, you can request any storage type (call any of the "get"
  functions), but they will all return null values.
*/
enum ImageType
{
  /**
      there is no image displayed by the widget
  */
  Empty = 0,

  /**
      the widget contains a named icon
  */
  IconName = 1,

  /**
      the widget contains a [gio.icon.Icon]
  */
  Gicon = 2,

  /**
      the widget contains a [gdk.paintable.Paintable]
  */
  Paintable = 3,
}

/**
    Describes hints that might be taken into account by input methods
  or applications.
  
  Note that input methods may already tailor their behaviour according
  to the `enum@InputPurpose` of the entry.
  
  Some common sense is expected when using these flags - mixing
  [gtk.types.InputHints.Lowercase] with any of the uppercase hints makes no sense.
  
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
      The text is vertical
  */
  VerticalWriting = 256,

  /**
      Suggest offering Emoji support
  */
  Emoji = 512,

  /**
      Suggest not offering Emoji support
  */
  NoEmoji = 1024,

  /**
      Request that the input method should not
       update personalized data (like typing history)
  */
  Private = 2048,
}

/**
    Describes primary purpose of the input widget.
  
  This information is useful for on-screen keyboards and similar input
  methods to decide which keys should be presented to the user.
  
  Note that the purpose is not meant to impose a totally strict rule
  about allowed characters, and does not replace input validation.
  It is fine for an on-screen keyboard to let the user override the
  character set restriction that is expressed by the purpose. The
  application is expected to validate the entry contents, even if
  it specified a purpose.
  
  The difference between [gtk.types.InputPurpose.Digits] and
  [gtk.types.InputPurpose.Number] is that the former accepts only digits
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
      Like [gtk.types.InputPurpose.FreeForm], but characters are hidden
  */
  Password = 8,

  /**
      Like [gtk.types.InputPurpose.Digits], but characters are hidden
  */
  Pin = 9,

  /**
      Allow any character, in addition to control codes
  */
  Terminal = 10,
}

/**
    The different methods to handle text in #GtkInscription when it doesn't
  fit the available space.
*/
enum InscriptionOverflow
{
  /**
      Clip the remaining text
  */
  Clip = 0,

  /**
      Omit characters at the start of the text
  */
  EllipsizeStart = 1,

  /**
      Omit characters at the middle of the text
  */
  EllipsizeMiddle = 2,

  /**
      Omit characters at the end of the text
  */
  EllipsizeEnd = 3,
}

/**
    Used for justifying the text inside a `class@Label` widget.
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
    Describes how `class@LevelBar` contents should be rendered.
  
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
      The GNU General Public License, version 2.0 only
  */
  Gpl20Only = 9,

  /**
      The GNU General Public License, version 3.0 only
  */
  Gpl30Only = 10,

  /**
      The GNU Lesser General Public License, version 2.1 only
  */
  Lgpl21Only = 11,

  /**
      The GNU Lesser General Public License, version 3.0 only
  */
  Lgpl30Only = 12,

  /**
      The GNU Affero General Public License, version 3.0 or later
  */
  Agpl30 = 13,

  /**
      The GNU Affero General Public License, version 3.0 only
  */
  Agpl30Only = 14,

  /**
      The 3-clause BSD licence
  */
  Bsd3 = 15,

  /**
      The Apache License, version 2.0
  */
  Apache20 = 16,

  /**
      The Mozilla Public License, version 2.0
  */
  Mpl20 = 17,

  /**
      Zero-Clause BSD license
  */
  _0bsd = 18,
}

/**
    List of actions to perform when scrolling to items in
  a list widget.
*/
enum ListScrollFlags : uint
{
  /**
      Don't do anything extra
  */
  None = 0,

  /**
      Focus the target item
  */
  Focus = 1,

  /**
      Select the target item and
      unselect all other items.
  */
  Select = 2,
}

/**
    Used to configure the focus behavior in the [gtk.types.DirectionType.TabForward]
  and [gtk.types.DirectionType.TabBackward] direction, like the <kbd>Tab</kbd> key
  in a [gtk.list_view.ListView].
*/
enum ListTabBehavior
{
  /**
      Cycle through all focusable items of the list
  */
  All = 0,

  /**
      Cycle through a single list element, then move
      focus out of the list. Moving focus between items needs to be
      done with the arrow keys.
  */
  Item = 1,

  /**
      Cycle only through a single cell, then
      move focus out of the list. Moving focus between cells needs to
      be done with the arrow keys. This is only relevant for
      cell-based widgets like #GtkColumnView, otherwise it behaves
      like [gtk.types.ListTabBehavior.Item].
  */
  Cell = 2,
}

/**
    The type of message being displayed in a `class@MessageDialog`.
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

/**
    Passed as argument to various keybinding signals for moving the
  cursor position.
*/
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

/**
    Options for selecting a different wrap mode for natural size
  requests.
  
  See for example the `property@Gtk.Label:natural-wrap-mode` property.
*/
enum NaturalWrapMode
{
  /**
      Inherit the minimum size request.
      In particular, this should be used with [pango.types.WrapMode.Char].
  */
  Inherit = 0,

  /**
      Try not to wrap the text. This mode is the
      closest to GTK3's behavior but can lead to a wide label leaving
      lots of empty space below the text.
  */
  None = 1,

  /**
      Attempt to wrap at word boundaries. This
      is useful in particular when using [pango.types.WrapMode.WordChar] as the
      wrap mode.
  */
  Word = 2,
}

/**
    The parameter used in the action signals of [gtk.notebook.Notebook].
*/
enum NotebookTab
{
  /**
      the first tab in the notebook
  */
  First = 0,

  /**
      the last tab in the notebook
  */
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
    Describes the way two values can be compared.
  
  These values can be used with a [glib.types.CompareFunc]. However,
  a [glib.types.CompareFunc] is allowed to return any integer values.
  For converting such a value to a [gtk.types.Ordering] value, use
  `func@Gtk.Ordering.from_cmpfunc`.
*/
enum Ordering
{
  /**
      the first value is smaller than the second
  */
  Smaller = -1,

  /**
      the two values are equal
  */
  Equal = 0,

  /**
      the first value is larger than the second
  */
  Larger = 1,
}

/**
    Represents the orientation of widgets and other objects.
  
  Typical examples are `class@Box` or `class@GesturePan`.
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
    Defines how content overflowing a given area should be handled.
  
  This is used in [gtk.widget.Widget.setOverflow]. The
  [gtk.widget.Widget.Overflow] property is modeled after the
  CSS overflow property, but implements it only partially.
*/
enum Overflow
{
  /**
      No change is applied. Content is drawn at the specified
      position.
  */
  Visible = 0,

  /**
      Content is clipped to the bounds of the area. Content
      outside the area is not drawn and cannot be interacted with.
  */
  Hidden = 1,
}

/**
    Represents the packing location of a children in its parent.
  
  See `class@WindowControls` for example.
*/
enum PackType
{
  /**
      The child is packed into the start of the widget
  */
  Start = 0,

  /**
      The child is packed into the end of the widget
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
    Describes the panning direction of a `class@GesturePan`.
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
    Flags that influence the behavior of [gtk.widget.Widget.pick].
*/
enum PickFlags : uint
{
  /**
      The default behavior, include widgets that are receiving events
  */
  Default = 0,

  /**
      Include widgets that are insensitive
  */
  Insensitive = 1,

  /**
      Include widgets that are marked as non-targetable. See `property@Widget:can-target`
  */
  NonTargetable = 2,
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
      For example, when all of a [gtk.tree_view.TreeView] can not be seen.
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
      scrolled windows share a scrollbar.
  */
  External = 3,
}

/**
    Flags that affect how [gtk.popover_menu.PopoverMenu] widgets built from
  a [gio.menu_model.MenuModel] are created and displayed.
*/
enum PopoverMenuFlags : uint
{
  /**
      Submenus are presented as sliding submenus that replace the main menu.
  */
  Sliding = 0,

  /**
      Submenus are presented as traditional, nested
      popovers.
  */
  Nested = 1,
}

/**
    Describes which edge of a widget a certain feature is positioned at.
  
  For examples, see the tabs of a `class@Notebook`, or the label
  of a `class@Scale`.
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
    Specifies which features the print dialog should offer.
  
  If neither [gtk.types.PrintCapabilities.GeneratePdf] nor
  [gtk.types.PrintCapabilities.GeneratePs] is specified, GTK assumes that all
  formats are supported.
*/
enum PrintCapabilities : uint
{
  /**
      Print dialog will offer printing even/odd pages.
  */
  PageSet = 1,

  /**
      Print dialog will allow to print multiple copies.
  */
  Copies = 2,

  /**
      Print dialog will allow to collate multiple copies.
  */
  Collate = 4,

  /**
      Print dialog will allow to print pages in reverse order.
  */
  Reverse = 8,

  /**
      Print dialog will allow to scale the output.
  */
  Scale = 16,

  /**
      The program will send the document to
      the printer in PDF format
  */
  GeneratePdf = 32,

  /**
      The program will send the document to
      the printer in Postscript format
  */
  GeneratePs = 64,

  /**
      Print dialog will offer a preview
  */
  Preview = 128,

  /**
      Print dialog will offer printing multiple
      pages per sheet
  */
  NumberUp = 256,

  /**
      Print dialog will allow to rearrange
      pages when printing multiple pages per sheet
  */
  NumberUpLayout = 512,
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
  using the GTK printing support.
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
    Determines what action the print operation should perform.
  
  A parameter of this typs is passed to [gtk.print_operation.PrintOperation.run].
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
    The result of a print operation.
  
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
    Describes limits of a `class@EventController` for handling events
  targeting other widgets.
*/
enum PropagationLimit
{
  /**
      Events are handled regardless of what their
      target is.
  */
  None = 0,

  /**
      Events are only handled if their target
      is in the same `iface@Native` as the event controllers widget. Note
      that some event types have two targets (origin and destination).
  */
  SameNative = 1,
}

/**
    Describes the stage at which events are fed into a `class@EventController`.
*/
enum PropagationPhase
{
  /**
      Events are not delivered.
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
    Error codes for [gtk.recent_manager.RecentManager] operations
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
    Predefined values for use as response ids in [gtk.dialog.Dialog.addButton].
  
  All predefined values are negative; GTK leaves values of 0 or greater for
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
      Generic response id, not used by GTK dialogs
  */
  Reject = -2,

  /**
      Generic response id, not used by GTK dialogs
  */
  Accept = -3,

  /**
      Returned if the dialog is deleted
  */
  DeleteEvent = -4,

  /**
      Returned by OK buttons in GTK dialogs
  */
  Ok = -5,

  /**
      Returned by Cancel buttons in GTK dialogs
  */
  Cancel = -6,

  /**
      Returned by Close buttons in GTK dialogs
  */
  Close = -7,

  /**
      Returned by Yes buttons in GTK dialogs
  */
  Yes = -8,

  /**
      Returned by No buttons in GTK dialogs
  */
  No = -9,

  /**
      Returned by Apply buttons in GTK dialogs
  */
  Apply = -10,

  /**
      Returned by Help buttons in GTK dialogs
  */
  Help = -11,
}

/**
    These enumeration values describe the possible transitions
  when the child of a [gtk.revealer.Revealer] widget is shown or hidden.
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

  /**
      Floop in from the left
  */
  SwingRight = 6,

  /**
      Floop in from the right
  */
  SwingLeft = 7,

  /**
      Floop in from the bottom
  */
  SwingUp = 8,

  /**
      Floop in from the top
  */
  SwingDown = 9,
}

/**
    Passed as argument to various keybinding signals.
*/
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
    Determines how GTK handles the sensitivity of various controls,
  such as combo box buttons.
*/
enum SensitivityType
{
  /**
      The control is made insensitive if no
      action can be triggered
  */
  Auto = 0,

  /**
      The control is always sensitive
  */
  On = 1,

  /**
      The control is always insensitive
  */
  Off = 2,
}

/**
    List of flags that can be passed to action activation.
  
  More flags may be added in the future.
*/
enum ShortcutActionFlags : uint
{
  /**
      The action is the only
      action that can be activated. If this flag is not set,
      a future activation may select a different action.
  */
  Exclusive = 1,
}

/**
    Describes where `class@Shortcut`s added to a
  `class@ShortcutController` get handled.
*/
enum ShortcutScope
{
  /**
      Shortcuts are handled inside
      the widget the controller belongs to.
  */
  Local = 0,

  /**
      Shortcuts are handled by
      the first ancestor that is a `iface@ShortcutManager`
  */
  Managed = 1,

  /**
      Shortcuts are handled by
      the root widget.
  */
  Global = 2,
}

/**
    GtkShortcutType specifies the kind of shortcut that is being described.
  
  More values may be added to this enumeration over time.
*/
enum ShortcutType
{
  /**
      The shortcut is a keyboard accelerator. The GtkShortcutsShortcut:accelerator
      property will be used.
  */
  Accelerator = 0,

  /**
      The shortcut is a pinch gesture. GTK provides an icon and subtitle.
  */
  GesturePinch = 1,

  /**
      The shortcut is a stretch gesture. GTK provides an icon and subtitle.
  */
  GestureStretch = 2,

  /**
      The shortcut is a clockwise rotation gesture. GTK provides an icon and subtitle.
  */
  GestureRotateClockwise = 3,

  /**
      The shortcut is a counterclockwise rotation gesture. GTK provides an icon and subtitle.
  */
  GestureRotateCounterclockwise = 4,

  /**
      The shortcut is a two-finger swipe gesture. GTK provides an icon and subtitle.
  */
  GestureTwoFingerSwipeLeft = 5,

  /**
      The shortcut is a two-finger swipe gesture. GTK provides an icon and subtitle.
  */
  GestureTwoFingerSwipeRight = 6,

  /**
      The shortcut is a gesture. The GtkShortcutsShortcut:icon property will be
      used.
  */
  Gesture = 7,

  /**
      The shortcut is a swipe gesture. GTK provides an icon and subtitle.
  */
  GestureSwipeLeft = 8,

  /**
      The shortcut is a swipe gesture. GTK provides an icon and subtitle.
  */
  GestureSwipeRight = 9,
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
    Describes changes in a sorter in more detail and allows users
  to optimize resorting.
*/
enum SorterChange
{
  /**
      The sorter change cannot be described
      by any of the other enumeration values
  */
  Different = 0,

  /**
      The sort order was inverted. Comparisons
      that returned [gtk.types.Ordering.Smaller] now return [gtk.types.Ordering.Larger]
      and vice versa. Other comparisons return the same values as before.
  */
  Inverted = 1,

  /**
      The sorter is less strict: Comparisons
      may now return [gtk.types.Ordering.Equal] that did not do so before.
  */
  LessStrict = 2,

  /**
      The sorter is more strict: Comparisons
      that did return [gtk.types.Ordering.Equal] may not do so anymore.
  */
  MoreStrict = 3,
}

/**
    Describes the type of order that a [gtk.sorter.Sorter] may produce.
*/
enum SorterOrder
{
  /**
      A partial order. Any [gtk.types.Ordering] is possible.
  */
  Partial = 0,

  /**
      No order, all elements are considered equal.
      [gtk.sorter.Sorter.compare] will only return [gtk.types.Ordering.Equal].
  */
  None = 1,

  /**
      A total order. [gtk.sorter.Sorter.compare] will only
      return [gtk.types.Ordering.Equal] if an item is compared with itself. Two
      different items will never cause this value to be returned.
  */
  Total = 2,
}

/**
    Determines whether the spin button displays values outside the adjustment
  bounds.
  
  See [gtk.spin_button.SpinButton.setUpdatePolicy].
*/
enum SpinButtonUpdatePolicy
{
  /**
      When refreshing your [gtk.spin_button.SpinButton], the value is
      always displayed
  */
  Always = 0,

  /**
      When refreshing your [gtk.spin_button.SpinButton], the value is
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
    Possible transitions between pages in a [gtk.stack.Stack] widget.
  
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
      Cover the old page by sliding up
  */
  OverUp = 8,

  /**
      Cover the old page by sliding down
  */
  OverDown = 9,

  /**
      Cover the old page by sliding to the left
  */
  OverLeft = 10,

  /**
      Cover the old page by sliding to the right
  */
  OverRight = 11,

  /**
      Uncover the new page by sliding up
  */
  UnderUp = 12,

  /**
      Uncover the new page by sliding down
  */
  UnderDown = 13,

  /**
      Uncover the new page by sliding to the left
  */
  UnderLeft = 14,

  /**
      Uncover the new page by sliding to the right
  */
  UnderRight = 15,

  /**
      Cover the old page sliding up or uncover the new page sliding down, according to order
  */
  OverUpDown = 16,

  /**
      Cover the old page sliding down or uncover the new page sliding up, according to order
  */
  OverDownUp = 17,

  /**
      Cover the old page sliding left or uncover the new page sliding right, according to order
  */
  OverLeftRight = 18,

  /**
      Cover the old page sliding right or uncover the new page sliding left, according to order
  */
  OverRightLeft = 19,

  /**
      Pretend the pages are sides of a cube and rotate that cube to the left
  */
  RotateLeft = 20,

  /**
      Pretend the pages are sides of a cube and rotate that cube to the right
  */
  RotateRight = 21,

  /**
      Pretend the pages are sides of a cube and rotate that cube to the left or right according to the children order
  */
  RotateLeftRight = 22,
}

/**
    Describes a widget state.
  
  Widget states are used to match the widget against CSS pseudo-classes.
  Note that GTK extends the regular CSS classes and sometimes uses
  different names.
*/
enum StateFlags : uint
{
  /**
      State during normal operation
  */
  Normal = 0,

  /**
      Widget is active
  */
  Active = 1,

  /**
      Widget has a mouse pointer over it
  */
  Prelight = 2,

  /**
      Widget is selected
  */
  Selected = 4,

  /**
      Widget is insensitive
  */
  Insensitive = 8,

  /**
      Widget is inconsistent
  */
  Inconsistent = 16,

  /**
      Widget has the keyboard focus
  */
  Focused = 32,

  /**
      Widget is in a background toplevel window
  */
  Backdrop = 64,

  /**
      Widget is in left-to-right text direction
  */
  DirLtr = 128,

  /**
      Widget is in right-to-left text direction
  */
  DirRtl = 256,

  /**
      Widget is a link
  */
  Link = 512,

  /**
      The location the widget points to has already been visited
  */
  Visited = 1024,

  /**
      Widget is checked
  */
  Checked = 2048,

  /**
      Widget is highlighted as a drop target for DND
  */
  DropActive = 4096,

  /**
      Widget has the visible focus
  */
  FocusVisible = 8192,

  /**
      Widget contains the keyboard focus
  */
  FocusWithin = 16384,
}

/**
    Specifies how search strings are matched inside text.
*/
enum StringFilterMatchMode
{
  /**
      The search string and
      text must match exactly.
  */
  Exact = 0,

  /**
      The search string
      must be contained as a substring inside the text.
  */
  Substring = 1,

  /**
      The text must begin
      with the search string.
  */
  Prefix = 2,
}

/**
    Flags that modify the behavior of [gtk.style_context.StyleContext.toString_].
  
  New values may be added to this enumeration.
*/
enum StyleContextPrintFlags : uint
{
  /**
      Default value.
  */
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

  /**
      Show information about
      what changes affect the styles
  */
  ShowChange = 4,
}

/**
    The indexes of colors passed to symbolic color rendering, such as
  `vfunc@Gtk.SymbolicPaintable.snapshot_symbolic`.
  
  More values may be added over time.
*/
enum SymbolicColor
{
  /**
      The default foreground color
  */
  Foreground = 0,

  /**
      Indication color for errors
  */
  Error = 1,

  /**
      Indication color for warnings
  */
  Warning = 2,

  /**
      Indication color for success
  */
  Success = 3,
}

/**
    Values that can be passed to the `vfunc@Gtk.Widget.system_setting_changed`
  vfunc.
  
  The values indicate which system setting has changed.
  Widgets may need to drop caches, or react otherwise.
  
  Most of the values correspond to `class@Settings` properties.
  
  More values may be added over time.
*/
enum SystemSetting
{
  /**
      the `property@Gtk.Settings:gtk-xft-dpi` setting has changed
  */
  Dpi = 0,

  /**
      The `property@Gtk.Settings:gtk-font-name` setting has changed
  */
  FontName = 1,

  /**
      The font configuration has changed in a way that
      requires text to be redrawn. This can be any of the
      `property@Gtk.Settings:gtk-xft-antialias`,
      `property@Gtk.Settings:gtk-xft-hinting`,
      `property@Gtk.Settings:gtk-xft-hintstyle`,
      `property@Gtk.Settings:gtk-xft-rgba` or
      `property@Gtk.Settings:gtk-fontconfig-timestamp` settings
  */
  FontConfig = 2,

  /**
      The display has changed
  */
  Display = 3,

  /**
      The icon theme has changed in a way that requires
      icons to be looked up again
  */
  IconTheme = 4,
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
  `GtkTextView::extend-selection` signal to customize the selection.
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
  
  If neither [gtk.types.TextSearchFlags.VisibleOnly] nor [gtk.types.TextSearchFlags.TextOnly] are
  enabled, the match must be exact; the special 0xFFFC character will match
  embedded paintables or child widgets.
*/
enum TextSearchFlags : uint
{
  /**
      Search only visible data. A search match may
    have invisible text interspersed.
  */
  VisibleOnly = 1,

  /**
      Search only text. A match may have paintables or
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
    Used to reference the layers of [gtk.text_view.TextView] for the purpose of customized
  drawing with the ::snapshot_layer vfunc.
*/
enum TextViewLayer
{
  /**
      The layer rendered below the text (but above the background).
  */
  BelowText = 0,

  /**
      The layer rendered above the text.
  */
  AboveText = 1,
}

/**
    Used to reference the parts of [gtk.text_view.TextView].
*/
enum TextWindowType
{
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
    These flags indicate various properties of a [gtk.tree_model.TreeModel].
  
  They are returned by [gtk.tree_model.TreeModel.getFlags], and must be
  static for the lifetime of the object. A more complete description
  of [gtk.types.TreeModelFlags.ItersPersist] can be found in the overview of
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
  that [gtk.types.TreeViewColumnSizing.Autosize] are inefficient for large views, and
  can make columns appear choppy.
*/
enum TreeViewColumnSizing
{
  /**
      Columns only get bigger in reaction to changes in the model
  */
  GrowOnly = 0,

  /**
      Columns resize to be the optimal size every time the model changes.
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
    An attribute for the background color, expressed as an RGB value
  encoded in a string using the format: `{r8},{g8},{b8}`.
*/
enum ACCESSIBLE_ATTRIBUTE_BACKGROUND = "bg-color";

/**
    An attribute for the font family name.
*/
enum ACCESSIBLE_ATTRIBUTE_FAMILY = "family-name";

/**
    An attribute for the foreground color, expressed as an RGB value
  encoded in a string using the format: `{r8},{g8},{b8}`.
*/
enum ACCESSIBLE_ATTRIBUTE_FOREGROUND = "fg-color";

/**
    An attribute for the overline style.
  
  Possible values are:
  
  $(LIST
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE]
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_OVERLINE_SINGLE]
  )
*/
enum ACCESSIBLE_ATTRIBUTE_OVERLINE = "overline";

/**
    The "none" overline value for [gtk.types.ACCESSIBLE_ATTRIBUTE_OVERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE = "none";

/**
    The "single" overline value for [gtk.types.ACCESSIBLE_ATTRIBUTE_OVERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_OVERLINE_SINGLE = "single";

/**
    An attribute for the font size, expressed in points.
*/
enum ACCESSIBLE_ATTRIBUTE_SIZE = "size";

/**
    An attribute for the font stretch type.
  
  Possible values are:
  
  $(LIST
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH_ULTRA_CONDENSED]
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH_EXTRA_CONDENSED]
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH_CONDENSED]
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH_SEMI_CONDENSED]
  )
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH = "stretch";

/**
    The "condensed" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_CONDENSED = "condensed";

/**
    The "expanded" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_EXPANDED = "expanded";

/**
    The "extra condensed" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_EXTRA_CONDENSED = "extra_condensed";

/**
    The "extra expanded" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_EXTRA_EXPANDED = "extra_expanded";

/**
    The "normal" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_NORMAL = "normal";

/**
    The "semi condensed" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_SEMI_CONDENSED = "semi_condensed";

/**
    The "semi expanded" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_SEMI_EXPANDED = "semi_expanded";

/**
    The "ultra condensed" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_ULTRA_CONDENSED = "ultra_condensed";

/**
    The "ultra expanded" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_ULTRA_EXPANDED = "ultra_expanded";

/**
    An attribute for strikethrough text.
  
  Possible values are `true` or `false`.
*/
enum ACCESSIBLE_ATTRIBUTE_STRIKETHROUGH = "strikethrough";

/**
    An attribute for the font style.
  
  Possible values are:
  
  $(LIST
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_STYLE_NORMAL]
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_STYLE_OBLIQUE]
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_STYLE_ITALIC]
  )
*/
enum ACCESSIBLE_ATTRIBUTE_STYLE = "style";

/**
    The "italic" style value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STYLE].
*/
enum ACCESSIBLE_ATTRIBUTE_STYLE_ITALIC = "italic";

/**
    The "normal" style value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STYLE].
*/
enum ACCESSIBLE_ATTRIBUTE_STYLE_NORMAL = "normal";

/**
    The "oblique" style value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STYLE].
*/
enum ACCESSIBLE_ATTRIBUTE_STYLE_OBLIQUE = "oblique";

/**
    An attribute for the underline style.
  
  Possible values are:
  
  $(LIST
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE_NONE]
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE_SINGLE]
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE_DOUBLE]
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE_ERROR]
  )
*/
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE = "underline";

/**
    The "double" underline value for [gtk.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE_DOUBLE = "double";

/**
    The "error" underline value for [gtk.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE_ERROR = "error";

/**
    The "none" underline value for [gtk.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE_NONE = "none";

/**
    The "single" underline value for [gtk.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE_SINGLE = "single";

/**
    An attribute for the font variant.
  
  Possible values are:
  
  $(LIST
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT_SMALL_CAPS]
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT_ALL_SMALL_CAPS]
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT_PETITE_CAPS]
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT_ALL_PETITE_CAPS]
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT_UNICASE]
    * [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT_TITLE_CAPS]
  )
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT = "variant";

/**
    The "all petite caps" variant value for [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_ALL_PETITE_CAPS = "all-petite-caps";

/**
    The "all small caps" variant value for [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_ALL_SMALL_CAPS = "all-small-caps";

/**
    The "petite caps" variant value for [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_PETITE_CAPS = "petite-caps";

/**
    The "small caps" variant value for [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_SMALL_CAPS = "small-caps";

/**
    The "title caps" variant value for [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_TITLE_CAPS = "title-caps";

/**
    The "unicase" variant value for [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_UNICASE = "unicase";

/**
    An attribute for the font weight.
*/
enum ACCESSIBLE_ATTRIBUTE_WEIGHT = "weight";

/**
    An undefined value. The accessible attribute is either unset, or its
  value is undefined.
*/
enum ACCESSIBLE_VALUE_UNDEFINED = -1;

/**
    Like `func@get_binary_age`, but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum BINARY_AGE = 1402;

/** */
enum IM_MODULE_EXTENSION_POINT_NAME = "gtk-im-module";

/**
    Constant to return from a signal handler for the ::input
  signal in case of conversion failure.
  
  See [gtk.spin_button.SpinButton.input].
*/
enum INPUT_ERROR = -1;

/**
    Like `func@get_interface_age`, but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum INTERFACE_AGE = 2;

/**
    The value used to refer to a guaranteed invalid position
  in a [gio.list_model.ListModel].
  
  This value may be returned from some functions, others may
  accept it as input. Its interpretation may differ for different
  functions.
  
  Refer to each function's documentation for if this value is
  allowed and what it does.
*/
enum INVALID_LIST_POSITION = 4294967295;

/**
    The name used for the stock full offset included by [gtk.level_bar.LevelBar].
*/
enum LEVEL_BAR_OFFSET_FULL = "full";

/**
    The name used for the stock high offset included by [gtk.level_bar.LevelBar].
*/
enum LEVEL_BAR_OFFSET_HIGH = "high";

/**
    The name used for the stock low offset included by [gtk.level_bar.LevelBar].
*/
enum LEVEL_BAR_OFFSET_LOW = "low";

/**
    Like `func@get_major_version`, but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum MAJOR_VERSION = 4;

/** */
enum MAX_COMPOSE_LEN = 7;

/** */
enum MEDIA_FILE_EXTENSION_POINT_NAME = "gtk-media-file";

/**
    Like `func@get_micro_version`, but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum MICRO_VERSION = 2;

/**
    Like `func@get_minor_version`, but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum MINOR_VERSION = 14;

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
  to which the output should be written. GTK itself supports
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
    A priority that can be used when adding a [gtk.style_provider.StyleProvider]
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
  via [gtk.settings.Settings].
  
  This priority is higher than `GTK_STYLE_PROVIDER_PRIORITY_THEME`
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
  `$XDG_CONFIG_HOME/gtk-4.0/gtk.css`.
  
  You should not use priorities higher than this, to
  give the user the last word.
*/
enum STYLE_PROVIDER_PRIORITY_USER = 800;

/**
    The priority at which the text view validates onscreen lines
  in an idle job in the background.
*/
enum TEXT_VIEW_PRIORITY_VALIDATE = 125;

/**
    Uses the default sort function in a [gtk.tree_sortable.TreeSortable].
  
  See also: [gtk.tree_sortable.TreeSortable.setSortColumnId]
*/
enum TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID = -1;

/**
    Disables sorting in a [gtk.tree_sortable.TreeSortable].
  
  See also: [gtk.tree_sortable.TreeSortable.setSortColumnId]
*/
enum TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID = -2;
