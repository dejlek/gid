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
alias Allocation = gdk.rectangle.Rectangle;

// Enums
alias AccessibleAnnouncementPriority = GtkAccessibleAnnouncementPriority;
alias AccessibleAutocomplete = GtkAccessibleAutocomplete;
alias AccessibleInvalidState = GtkAccessibleInvalidState;
alias AccessiblePlatformState = GtkAccessiblePlatformState;
alias AccessibleProperty = GtkAccessibleProperty;
alias AccessibleRelation = GtkAccessibleRelation;
alias AccessibleRole = GtkAccessibleRole;
alias AccessibleSort = GtkAccessibleSort;
alias AccessibleState = GtkAccessibleState;
alias AccessibleTextContentChange = GtkAccessibleTextContentChange;
alias AccessibleTextGranularity = GtkAccessibleTextGranularity;
alias AccessibleTristate = GtkAccessibleTristate;
alias Align = GtkAlign;
alias ApplicationInhibitFlags = GtkApplicationInhibitFlags;
alias ArrowType = GtkArrowType;
alias AssistantPageType = GtkAssistantPageType;
alias BaselinePosition = GtkBaselinePosition;
alias BorderStyle = GtkBorderStyle;
alias BuilderClosureFlags = GtkBuilderClosureFlags;
alias BuilderError = GtkBuilderError;
alias ButtonsType = GtkButtonsType;
alias CellRendererAccelMode = GtkCellRendererAccelMode;
alias CellRendererMode = GtkCellRendererMode;
alias CellRendererState = GtkCellRendererState;
alias Collation = GtkCollation;
alias ConstraintAttribute = GtkConstraintAttribute;
alias ConstraintRelation = GtkConstraintRelation;
alias ConstraintStrength = GtkConstraintStrength;
alias ConstraintVflParserError = GtkConstraintVflParserError;
alias ContentFit = GtkContentFit;
alias CornerType = GtkCornerType;
alias CssParserError = GtkCssParserError;
alias CssParserWarning = GtkCssParserWarning;
alias DebugFlags = GtkDebugFlags;
alias DeleteType = GtkDeleteType;
alias DialogError = GtkDialogError;
alias DialogFlags = GtkDialogFlags;
alias DirectionType = GtkDirectionType;
alias EditableProperties = GtkEditableProperties;
alias EntryIconPosition = GtkEntryIconPosition;
alias EventControllerScrollFlags = GtkEventControllerScrollFlags;
alias EventSequenceState = GtkEventSequenceState;
alias FileChooserAction = GtkFileChooserAction;
alias FileChooserError = GtkFileChooserError;
alias FilterChange = GtkFilterChange;
alias FilterMatch = GtkFilterMatch;
alias FontChooserLevel = GtkFontChooserLevel;
alias FontLevel = GtkFontLevel;
alias GraphicsOffloadEnabled = GtkGraphicsOffloadEnabled;
alias IconLookupFlags = GtkIconLookupFlags;
alias IconSize = GtkIconSize;
alias IconThemeError = GtkIconThemeError;
alias IconViewDropPosition = GtkIconViewDropPosition;
alias ImageType = GtkImageType;
alias InputHints = GtkInputHints;
alias InputPurpose = GtkInputPurpose;
alias InscriptionOverflow = GtkInscriptionOverflow;
alias Justification = GtkJustification;
alias LevelBarMode = GtkLevelBarMode;
alias License = GtkLicense;
alias ListScrollFlags = GtkListScrollFlags;
alias ListTabBehavior = GtkListTabBehavior;
alias MessageType = GtkMessageType;
alias MovementStep = GtkMovementStep;
alias NaturalWrapMode = GtkNaturalWrapMode;
alias NotebookTab = GtkNotebookTab;
alias NumberUpLayout = GtkNumberUpLayout;
alias Ordering = GtkOrdering;
alias Orientation = GtkOrientation;
alias Overflow = GtkOverflow;
alias PackType = GtkPackType;
alias PadActionType = GtkPadActionType;
alias PageOrientation = GtkPageOrientation;
alias PageSet = GtkPageSet;
alias PanDirection = GtkPanDirection;
alias PickFlags = GtkPickFlags;
alias PolicyType = GtkPolicyType;
alias PopoverMenuFlags = GtkPopoverMenuFlags;
alias PositionType = GtkPositionType;
alias PrintCapabilities = GtkPrintCapabilities;
alias PrintDuplex = GtkPrintDuplex;
alias PrintError = GtkPrintError;
alias PrintOperationAction = GtkPrintOperationAction;
alias PrintOperationResult = GtkPrintOperationResult;
alias PrintPages = GtkPrintPages;
alias PrintQuality = GtkPrintQuality;
alias PrintStatus = GtkPrintStatus;
alias PropagationLimit = GtkPropagationLimit;
alias PropagationPhase = GtkPropagationPhase;
alias RecentManagerError = GtkRecentManagerError;
alias ResponseType = GtkResponseType;
alias RevealerTransitionType = GtkRevealerTransitionType;
alias ScrollStep = GtkScrollStep;
alias ScrollType = GtkScrollType;
alias ScrollablePolicy = GtkScrollablePolicy;
alias SelectionMode = GtkSelectionMode;
alias SensitivityType = GtkSensitivityType;
alias ShortcutActionFlags = GtkShortcutActionFlags;
alias ShortcutScope = GtkShortcutScope;
alias ShortcutType = GtkShortcutType;
alias SizeGroupMode = GtkSizeGroupMode;
alias SizeRequestMode = GtkSizeRequestMode;
alias SortType = GtkSortType;
alias SorterChange = GtkSorterChange;
alias SorterOrder = GtkSorterOrder;
alias SpinButtonUpdatePolicy = GtkSpinButtonUpdatePolicy;
alias SpinType = GtkSpinType;
alias StackTransitionType = GtkStackTransitionType;
alias StateFlags = GtkStateFlags;
alias StringFilterMatchMode = GtkStringFilterMatchMode;
alias StyleContextPrintFlags = GtkStyleContextPrintFlags;
alias SymbolicColor = GtkSymbolicColor;
alias SystemSetting = GtkSystemSetting;
alias TextDirection = GtkTextDirection;
alias TextExtendSelection = GtkTextExtendSelection;
alias TextSearchFlags = GtkTextSearchFlags;
alias TextViewLayer = GtkTextViewLayer;
alias TextWindowType = GtkTextWindowType;
alias TreeModelFlags = GtkTreeModelFlags;
alias TreeViewColumnSizing = GtkTreeViewColumnSizing;
alias TreeViewDropPosition = GtkTreeViewDropPosition;
alias TreeViewGridLines = GtkTreeViewGridLines;
alias Unit = GtkUnit;
alias WrapMode = GtkWrapMode;

// Structs
alias AccessibleTextRange = GtkAccessibleTextRange;
alias BuildableParser = GtkBuildableParser;
alias ButtonPrivate = GtkButtonPrivate*;
alias CellAreaContextPrivate = GtkCellAreaContextPrivate*;
alias CellRendererClassPrivate = GtkCellRendererClassPrivate*;
alias CellRendererPrivate = GtkCellRendererPrivate*;
alias CssLocation = GtkCssLocation;
alias CssProviderPrivate = GtkCssProviderPrivate*;
alias CssStyleChange = GtkCssStyleChange*;
alias IMContextSimplePrivate = GtkIMContextSimplePrivate*;
alias IMMulticontextPrivate = GtkIMMulticontextPrivate*;
alias ListStorePrivate = GtkListStorePrivate*;
alias MountOperationPrivate = GtkMountOperationPrivate*;
alias PageRange = GtkPageRange;
alias PrintBackend = GtkPrintBackend*;
alias PrintOperationPrivate = GtkPrintOperationPrivate*;
alias RecentManagerPrivate = GtkRecentManagerPrivate*;
alias RequestedSize = GtkRequestedSize;
alias TextBufferPrivate = GtkTextBufferPrivate*;
alias TextTagPrivate = GtkTextTagPrivate*;
alias TextViewPrivate = GtkTextViewPrivate*;
alias TreeModelFilterPrivate = GtkTreeModelFilterPrivate*;
alias TreeModelSortPrivate = GtkTreeModelSortPrivate*;
alias TreeStorePrivate = GtkTreeStorePrivate*;
alias WidgetClassPrivate = GtkWidgetClassPrivate*;
alias WidgetPrivate = GtkWidgetPrivate*;
alias WindowGroupPrivate = GtkWindowGroupPrivate*;

// Callbacks
alias AssistantPageFunc = int delegate(int currentPage);
alias CellAllocCallback = bool delegate(gtk.cell_renderer.CellRenderer renderer, gdk.rectangle.Rectangle cellArea, gdk.rectangle.Rectangle cellBackground);
alias CellCallback = bool delegate(gtk.cell_renderer.CellRenderer renderer);
alias CellLayoutDataFunc = void delegate(gtk.cell_layout.CellLayout cellLayout, gtk.cell_renderer.CellRenderer cell, gtk.tree_model.TreeModel treeModel, gtk.tree_iter.TreeIter iter);
alias CustomAllocateFunc = void delegate(gtk.widget.Widget widget, int width, int height, int baseline);
alias CustomFilterFunc = bool delegate(gobject.object.ObjectG item);
alias CustomMeasureFunc = void delegate(gtk.widget.Widget widget, gtk.types.Orientation orientation, int forSize, out int minimum, out int natural, out int minimumBaseline, out int naturalBaseline);
alias CustomRequestModeFunc = gtk.types.SizeRequestMode delegate(gtk.widget.Widget widget);
alias DrawingAreaDrawFunc = void delegate(gtk.drawing_area.DrawingArea drawingArea, cairo.context.Context cr, int width, int height);
alias EntryCompletionMatchFunc = bool delegate(gtk.entry_completion.EntryCompletion completion, string key, gtk.tree_iter.TreeIter iter);
alias ExpressionNotify = void delegate();
alias FlowBoxCreateWidgetFunc = gtk.widget.Widget delegate(gobject.object.ObjectG item);
alias FlowBoxFilterFunc = bool delegate(gtk.flow_box_child.FlowBoxChild child);
alias FlowBoxForeachFunc = void delegate(gtk.flow_box.FlowBox box, gtk.flow_box_child.FlowBoxChild child);
alias FlowBoxSortFunc = int delegate(gtk.flow_box_child.FlowBoxChild child1, gtk.flow_box_child.FlowBoxChild child2);
alias FontFilterFunc = bool delegate(pango.font_family.FontFamily family, pango.font_face.FontFace face);
alias IconViewForeachFunc = void delegate(gtk.icon_view.IconView iconView, gtk.tree_path.TreePath path);
alias ListBoxCreateWidgetFunc = gtk.widget.Widget delegate(gobject.object.ObjectG item);
alias ListBoxFilterFunc = bool delegate(gtk.list_box_row.ListBoxRow row);
alias ListBoxForeachFunc = void delegate(gtk.list_box.ListBox box, gtk.list_box_row.ListBoxRow row);
alias ListBoxSortFunc = int delegate(gtk.list_box_row.ListBoxRow row1, gtk.list_box_row.ListBoxRow row2);
alias ListBoxUpdateHeaderFunc = void delegate(gtk.list_box_row.ListBoxRow row, gtk.list_box_row.ListBoxRow before);
alias MapListModelMapFunc = gobject.object.ObjectG delegate(gobject.object.ObjectG item);
alias MenuButtonCreatePopupFunc = void delegate(gtk.menu_button.MenuButton menuButton);
alias PageSetupDoneFunc = void delegate(gtk.page_setup.PageSetup pageSetup);
alias PrintJobCompleteFunc = void delegate(gtk.print_job.PrintJob printJob, glib.error.ErrorG error);
alias PrintSettingsFunc = void delegate(string key, string value);
alias PrinterFunc = bool delegate(gtk.printer.Printer printer);
alias ScaleFormatValueFunc = string delegate(gtk.scale.Scale scale, double value);
alias ShortcutFunc = bool delegate(gtk.widget.Widget widget, glib.variant.VariantG args);
alias TextCharPredicate = bool delegate(dchar ch);
alias TextTagTableForeach = void delegate(gtk.text_tag.TextTag tag);
alias TickCallback = bool delegate(gtk.widget.Widget widget, gdk.frame_clock.FrameClock frameClock);
alias TreeCellDataFunc = void delegate(gtk.tree_view_column.TreeViewColumn treeColumn, gtk.cell_renderer.CellRenderer cell, gtk.tree_model.TreeModel treeModel, gtk.tree_iter.TreeIter iter);
alias TreeIterCompareFunc = int delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter a, gtk.tree_iter.TreeIter b);
alias TreeListModelCreateModelFunc = gio.list_model.ListModel delegate(gobject.object.ObjectG item);
alias TreeModelFilterModifyFunc = void delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter, out gobject.value.Value value, int column);
alias TreeModelFilterVisibleFunc = bool delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter);
alias TreeModelForeachFunc = bool delegate(gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter);
alias TreeSelectionForeachFunc = void delegate(gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter);
alias TreeSelectionFunc = bool delegate(gtk.tree_selection.TreeSelection selection, gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path, bool pathCurrentlySelected);
alias TreeViewColumnDropFunc = bool delegate(gtk.tree_view.TreeView treeView, gtk.tree_view_column.TreeViewColumn column, gtk.tree_view_column.TreeViewColumn prevColumn, gtk.tree_view_column.TreeViewColumn nextColumn);
alias TreeViewMappingFunc = void delegate(gtk.tree_view.TreeView treeView, gtk.tree_path.TreePath path);
alias TreeViewRowSeparatorFunc = bool delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter);
alias TreeViewSearchEqualFunc = bool delegate(gtk.tree_model.TreeModel model, int column, string key, gtk.tree_iter.TreeIter iter);
alias WidgetActionActivateFunc = void delegate(gtk.widget.Widget widget, string actionName, glib.variant.VariantG parameter);

/**
 * An attribute for the background color, expressed as an RGB value
 * encoded in a string using the format: `{r8},{g8},{b8}`.
 */
enum ACCESSIBLE_ATTRIBUTE_BACKGROUND = "bg-color";


/**
 * An attribute for the font family name.
 */
enum ACCESSIBLE_ATTRIBUTE_FAMILY = "family-name";


/**
 * An attribute for the foreground color, expressed as an RGB value
 * encoded in a string using the format: `{r8},{g8},{b8}`.
 */
enum ACCESSIBLE_ATTRIBUTE_FOREGROUND = "fg-color";


/**
 * An attribute for the overline style.
 * Possible values are:
 * - [gtk.types.string]
 * - [gtk.types.string]
 */
enum ACCESSIBLE_ATTRIBUTE_OVERLINE = "overline";


/**
 * The "none" overline value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE = "none";


/**
 * The "single" overline value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_OVERLINE_SINGLE = "single";


/**
 * An attribute for the font size, expressed in points.
 */
enum ACCESSIBLE_ATTRIBUTE_SIZE = "size";


/**
 * An attribute for the font stretch type.
 * Possible values are:
 * - [gtk.types.string]
 * - [gtk.types.string]
 * - [gtk.types.string]
 * - [gtk.types.string]
 */
enum ACCESSIBLE_ATTRIBUTE_STRETCH = "stretch";


/**
 * The "condensed" stretch value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_STRETCH_CONDENSED = "condensed";


/**
 * The "expanded" stretch value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_STRETCH_EXPANDED = "expanded";


/**
 * The "extra condensed" stretch value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_STRETCH_EXTRA_CONDENSED = "extra_condensed";


/**
 * The "extra expanded" stretch value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_STRETCH_EXTRA_EXPANDED = "extra_expanded";


/**
 * The "normal" stretch value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_STRETCH_NORMAL = "normal";


/**
 * The "semi condensed" stretch value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_STRETCH_SEMI_CONDENSED = "semi_condensed";


/**
 * The "semi expanded" stretch value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_STRETCH_SEMI_EXPANDED = "semi_expanded";


/**
 * The "ultra condensed" stretch value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_STRETCH_ULTRA_CONDENSED = "ultra_condensed";


/**
 * The "ultra expanded" stretch value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_STRETCH_ULTRA_EXPANDED = "ultra_expanded";


/**
 * An attribute for strikethrough text.
 * Possible values are `true` or `false`.
 */
enum ACCESSIBLE_ATTRIBUTE_STRIKETHROUGH = "strikethrough";


/**
 * An attribute for the font style.
 * Possible values are:
 * - [gtk.types.string]
 * - [gtk.types.string]
 * - [gtk.types.string]
 */
enum ACCESSIBLE_ATTRIBUTE_STYLE = "style";


/**
 * The "italic" style value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_STYLE_ITALIC = "italic";


/**
 * The "normal" style value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_STYLE_NORMAL = "normal";


/**
 * The "oblique" style value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_STYLE_OBLIQUE = "oblique";


/**
 * An attribute for the underline style.
 * Possible values are:
 * - [gtk.types.string]
 * - [gtk.types.string]
 * - [gtk.types.string]
 * - [gtk.types.string]
 */
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE = "underline";


/**
 * The "double" underline value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE_DOUBLE = "double";


/**
 * The "error" underline value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE_ERROR = "error";


/**
 * The "none" underline value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE_NONE = "none";


/**
 * The "single" underline value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE_SINGLE = "single";


/**
 * An attribute for the font variant.
 * Possible values are:
 * - [gtk.types.string]
 * - [gtk.types.string]
 * - [gtk.types.string]
 * - [gtk.types.string]
 * - [gtk.types.string]
 * - [gtk.types.string]
 */
enum ACCESSIBLE_ATTRIBUTE_VARIANT = "variant";


/**
 * The "all petite caps" variant value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_VARIANT_ALL_PETITE_CAPS = "all-petite-caps";


/**
 * The "all small caps" variant value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_VARIANT_ALL_SMALL_CAPS = "all-small-caps";


/**
 * The "petite caps" variant value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_VARIANT_PETITE_CAPS = "petite-caps";


/**
 * The "small caps" variant value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_VARIANT_SMALL_CAPS = "small-caps";


/**
 * The "title caps" variant value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_VARIANT_TITLE_CAPS = "title-caps";


/**
 * The "unicase" variant value for [gtk.types.string].
 */
enum ACCESSIBLE_ATTRIBUTE_VARIANT_UNICASE = "unicase";


/**
 * An attribute for the font weight.
 */
enum ACCESSIBLE_ATTRIBUTE_WEIGHT = "weight";


/**
 * An undefined value. The accessible attribute is either unset, or its
 * value is undefined.
 */
enum ACCESSIBLE_VALUE_UNDEFINED = -1;


/**
 * Like func@get_binary_age, but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum BINARY_AGE = 1402;


enum IM_MODULE_EXTENSION_POINT_NAME = "gtk-im-module";


/**
 * Constant to return from a signal handler for the ::input
 * signal in case of conversion failure.
 * See [gtk.spin_button.SpinButton.input].
 */
enum INPUT_ERROR = -1;


/**
 * Like func@get_interface_age, but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum INTERFACE_AGE = 2;


/**
 * The value used to refer to a guaranteed invalid position
 * in a `GListModel`.
 * This value may be returned from some functions, others may
 * accept it as input. Its interpretation may differ for different
 * functions.
 * Refer to each function's documentation for if this value is
 * allowed and what it does.
 */
enum INVALID_LIST_POSITION = 4294967295;


/**
 * The name used for the stock full offset included by `GtkLevelBar`.
 */
enum LEVEL_BAR_OFFSET_FULL = "full";


/**
 * The name used for the stock high offset included by `GtkLevelBar`.
 */
enum LEVEL_BAR_OFFSET_HIGH = "high";


/**
 * The name used for the stock low offset included by `GtkLevelBar`.
 */
enum LEVEL_BAR_OFFSET_LOW = "low";


/**
 * Like func@get_major_version, but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum MAJOR_VERSION = 4;


enum MAX_COMPOSE_LEN = 7;


enum MEDIA_FILE_EXTENSION_POINT_NAME = "gtk-media-file";


/**
 * Like func@get_micro_version, but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum MICRO_VERSION = 2;


/**
 * Like func@get_minor_version, but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum MINOR_VERSION = 14;


/**
 * Name for the A3 paper size.
 */
enum PAPER_NAME_A3 = "iso_a3";


/**
 * Name for the A4 paper size.
 */
enum PAPER_NAME_A4 = "iso_a4";


/**
 * Name for the A5 paper size.
 */
enum PAPER_NAME_A5 = "iso_a5";


/**
 * Name for the B5 paper size.
 */
enum PAPER_NAME_B5 = "iso_b5";


/**
 * Name for the Executive paper size.
 */
enum PAPER_NAME_EXECUTIVE = "na_executive";


/**
 * Name for the Legal paper size.
 */
enum PAPER_NAME_LEGAL = "na_legal";


/**
 * Name for the Letter paper size.
 */
enum PAPER_NAME_LETTER = "na_letter";


enum PRINT_SETTINGS_COLLATE = "collate";


enum PRINT_SETTINGS_DEFAULT_SOURCE = "default-source";


enum PRINT_SETTINGS_DITHER = "dither";


enum PRINT_SETTINGS_DUPLEX = "duplex";


enum PRINT_SETTINGS_FINISHINGS = "finishings";


enum PRINT_SETTINGS_MEDIA_TYPE = "media-type";


enum PRINT_SETTINGS_NUMBER_UP = "number-up";


enum PRINT_SETTINGS_NUMBER_UP_LAYOUT = "number-up-layout";


enum PRINT_SETTINGS_N_COPIES = "n-copies";


enum PRINT_SETTINGS_ORIENTATION = "orientation";


/**
 * The key used by the “Print to file” printer to store the file
 * name of the output without the path to the directory and the
 * file extension.
 */
enum PRINT_SETTINGS_OUTPUT_BASENAME = "output-basename";


enum PRINT_SETTINGS_OUTPUT_BIN = "output-bin";


/**
 * The key used by the “Print to file” printer to store the
 * directory to which the output should be written.
 */
enum PRINT_SETTINGS_OUTPUT_DIR = "output-dir";


/**
 * The key used by the “Print to file” printer to store the format
 * of the output. The supported values are “PS” and “PDF”.
 */
enum PRINT_SETTINGS_OUTPUT_FILE_FORMAT = "output-file-format";


/**
 * The key used by the “Print to file” printer to store the URI
 * to which the output should be written. GTK itself supports
 * only “file://” URIs.
 */
enum PRINT_SETTINGS_OUTPUT_URI = "output-uri";


enum PRINT_SETTINGS_PAGE_RANGES = "page-ranges";


enum PRINT_SETTINGS_PAGE_SET = "page-set";


enum PRINT_SETTINGS_PAPER_FORMAT = "paper-format";


enum PRINT_SETTINGS_PAPER_HEIGHT = "paper-height";


enum PRINT_SETTINGS_PAPER_WIDTH = "paper-width";


enum PRINT_SETTINGS_PRINTER = "printer";


enum PRINT_SETTINGS_PRINTER_LPI = "printer-lpi";


enum PRINT_SETTINGS_PRINT_PAGES = "print-pages";


enum PRINT_SETTINGS_QUALITY = "quality";


enum PRINT_SETTINGS_RESOLUTION = "resolution";


enum PRINT_SETTINGS_RESOLUTION_X = "resolution-x";


enum PRINT_SETTINGS_RESOLUTION_Y = "resolution-y";


enum PRINT_SETTINGS_REVERSE = "reverse";


enum PRINT_SETTINGS_SCALE = "scale";


enum PRINT_SETTINGS_USE_COLOR = "use-color";


enum PRINT_SETTINGS_WIN32_DRIVER_EXTRA = "win32-driver-extra";


enum PRINT_SETTINGS_WIN32_DRIVER_VERSION = "win32-driver-version";


/**
 * Use this priority for functionality related to size allocation.
 * It is used internally by GTK+ to compute the sizes of widgets.
 * This priority is higher than %GDK_PRIORITY_REDRAW to avoid
 * resizing a widget which was just redrawn.
 */
enum PRIORITY_RESIZE = 110;


/**
 * A priority that can be used when adding a `GtkStyleProvider`
 * for application-specific style information.
 */
enum STYLE_PROVIDER_PRIORITY_APPLICATION = 600;


/**
 * The priority used for default style information
 * that is used in the absence of themes.
 * Note that this is not very useful for providing default
 * styling for custom style classes - themes are likely to
 * override styling provided at this priority with
 * catch-all `* {...}` rules.
 */
enum STYLE_PROVIDER_PRIORITY_FALLBACK = 1;


/**
 * The priority used for style information provided
 * via `GtkSettings`.
 * This priority is higher than %GTK_STYLE_PROVIDER_PRIORITY_THEME
 * to let settings override themes.
 */
enum STYLE_PROVIDER_PRIORITY_SETTINGS = 400;


/**
 * The priority used for style information provided
 * by themes.
 */
enum STYLE_PROVIDER_PRIORITY_THEME = 200;


/**
 * The priority used for the style information from
 * `\$XDG_CONFIG_HOME/gtk-4.0/gtk.css`.
 * You should not use priorities higher than this, to
 * give the user the last word.
 */
enum STYLE_PROVIDER_PRIORITY_USER = 800;


/**
 * The priority at which the text view validates onscreen lines
 * in an idle job in the background.
 */
enum TEXT_VIEW_PRIORITY_VALIDATE = 125;


/**
 * Uses the default sort function in a [gtk.tree_sortable.TreeSortable].
 * See also: [gtk.tree_sortable.TreeSortable.setSortColumnId]
 */
enum TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID = -1;


/**
 * Disables sorting in a [gtk.tree_sortable.TreeSortable].
 * See also: [gtk.tree_sortable.TreeSortable.setSortColumnId]
 */
enum TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID = -2;

