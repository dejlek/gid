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
alias Allocation = gdk.rectangle.Rectangle;
alias Stock = GtkStock;

// Enums
alias AccelFlags = GtkAccelFlags;
alias Align = GtkAlign;
alias ApplicationInhibitFlags = GtkApplicationInhibitFlags;
alias ArrowPlacement = GtkArrowPlacement;
alias ArrowType = GtkArrowType;
alias AssistantPageType = GtkAssistantPageType;
alias AttachOptions = GtkAttachOptions;
alias BaselinePosition = GtkBaselinePosition;
alias BorderStyle = GtkBorderStyle;
alias BuilderError = GtkBuilderError;
alias ButtonBoxStyle = GtkButtonBoxStyle;
alias ButtonRole = GtkButtonRole;
alias ButtonsType = GtkButtonsType;
alias CalendarDisplayOptions = GtkCalendarDisplayOptions;
alias CellRendererAccelMode = GtkCellRendererAccelMode;
alias CellRendererMode = GtkCellRendererMode;
alias CellRendererState = GtkCellRendererState;
alias CornerType = GtkCornerType;
alias CssProviderError = GtkCssProviderError;
alias CssSectionType = GtkCssSectionType;
alias DebugFlag = GtkDebugFlag;
alias DeleteType = GtkDeleteType;
alias DestDefaults = GtkDestDefaults;
alias DialogFlags = GtkDialogFlags;
alias DirectionType = GtkDirectionType;
alias DragResult = GtkDragResult;
alias EntryIconPosition = GtkEntryIconPosition;
alias EventControllerScrollFlags = GtkEventControllerScrollFlags;
alias EventSequenceState = GtkEventSequenceState;
alias ExpanderStyle = GtkExpanderStyle;
alias FileChooserAction = GtkFileChooserAction;
alias FileChooserConfirmation = GtkFileChooserConfirmation;
alias FileChooserError = GtkFileChooserError;
alias FileFilterFlags = GtkFileFilterFlags;
alias FontChooserLevel = GtkFontChooserLevel;
alias IMPreeditStyle = GtkIMPreeditStyle;
alias IMStatusStyle = GtkIMStatusStyle;
alias IconLookupFlags = GtkIconLookupFlags;
alias IconSize = GtkIconSize;
alias IconThemeError = GtkIconThemeError;
alias IconViewDropPosition = GtkIconViewDropPosition;
alias ImageType = GtkImageType;
alias InputHints = GtkInputHints;
alias InputPurpose = GtkInputPurpose;
alias JunctionSides = GtkJunctionSides;
alias Justification = GtkJustification;
alias LevelBarMode = GtkLevelBarMode;
alias License = GtkLicense;
alias MenuDirectionType = GtkMenuDirectionType;
alias MessageType = GtkMessageType;
alias MovementStep = GtkMovementStep;
alias NotebookTab = GtkNotebookTab;
alias NumberUpLayout = GtkNumberUpLayout;
alias Orientation = GtkOrientation;
alias PackDirection = GtkPackDirection;
alias PackType = GtkPackType;
alias PadActionType = GtkPadActionType;
alias PageOrientation = GtkPageOrientation;
alias PageSet = GtkPageSet;
alias PanDirection = GtkPanDirection;
alias PathPriorityType = GtkPathPriorityType;
alias PathType = GtkPathType;
alias PlacesOpenFlags = GtkPlacesOpenFlags;
alias PolicyType = GtkPolicyType;
alias PopoverConstraint = GtkPopoverConstraint;
alias PositionType = GtkPositionType;
alias PrintDuplex = GtkPrintDuplex;
alias PrintError = GtkPrintError;
alias PrintOperationAction = GtkPrintOperationAction;
alias PrintOperationResult = GtkPrintOperationResult;
alias PrintPages = GtkPrintPages;
alias PrintQuality = GtkPrintQuality;
alias PrintStatus = GtkPrintStatus;
alias PropagationPhase = GtkPropagationPhase;
alias RcFlags = GtkRcFlags;
alias RcTokenType = GtkRcTokenType;
alias RecentChooserError = GtkRecentChooserError;
alias RecentFilterFlags = GtkRecentFilterFlags;
alias RecentManagerError = GtkRecentManagerError;
alias RecentSortType = GtkRecentSortType;
alias RegionFlags = GtkRegionFlags;
alias ReliefStyle = GtkReliefStyle;
alias ResizeMode = GtkResizeMode;
alias ResponseType = GtkResponseType;
alias RevealerTransitionType = GtkRevealerTransitionType;
alias ScrollStep = GtkScrollStep;
alias ScrollType = GtkScrollType;
alias ScrollablePolicy = GtkScrollablePolicy;
alias SelectionMode = GtkSelectionMode;
alias SensitivityType = GtkSensitivityType;
alias ShadowType = GtkShadowType;
alias ShortcutType = GtkShortcutType;
alias SizeGroupMode = GtkSizeGroupMode;
alias SizeRequestMode = GtkSizeRequestMode;
alias SortType = GtkSortType;
alias SpinButtonUpdatePolicy = GtkSpinButtonUpdatePolicy;
alias SpinType = GtkSpinType;
alias StackTransitionType = GtkStackTransitionType;
alias StateFlags = GtkStateFlags;
alias StateType = GtkStateType;
alias StyleContextPrintFlags = GtkStyleContextPrintFlags;
alias TargetFlags = GtkTargetFlags;
alias TextBufferTargetInfo = GtkTextBufferTargetInfo;
alias TextDirection = GtkTextDirection;
alias TextExtendSelection = GtkTextExtendSelection;
alias TextSearchFlags = GtkTextSearchFlags;
alias TextViewLayer = GtkTextViewLayer;
alias TextWindowType = GtkTextWindowType;
alias ToolPaletteDragTargets = GtkToolPaletteDragTargets;
alias ToolbarSpaceStyle = GtkToolbarSpaceStyle;
alias ToolbarStyle = GtkToolbarStyle;
alias TreeModelFlags = GtkTreeModelFlags;
alias TreeViewColumnSizing = GtkTreeViewColumnSizing;
alias TreeViewDropPosition = GtkTreeViewDropPosition;
alias TreeViewGridLines = GtkTreeViewGridLines;
alias UIManagerItemType = GtkUIManagerItemType;
alias Unit = GtkUnit;
alias WidgetHelpType = GtkWidgetHelpType;
alias WindowPosition = GtkWindowPosition;
alias WindowType = GtkWindowType;
alias WrapMode = GtkWrapMode;

// Structs
alias AboutDialogPrivate = GtkAboutDialogPrivate*;
alias AccelGroupPrivate = GtkAccelGroupPrivate*;
alias AccelKey = GtkAccelKey;
alias AccelLabelPrivate = GtkAccelLabelPrivate*;
alias AccessiblePrivate = GtkAccessiblePrivate*;
alias ActionBarPrivate = GtkActionBarPrivate*;
alias ActionGroupPrivate = GtkActionGroupPrivate*;
alias ActionPrivate = GtkActionPrivate*;
alias AdjustmentPrivate = GtkAdjustmentPrivate*;
alias AlignmentPrivate = GtkAlignmentPrivate*;
alias AppChooserButtonPrivate = GtkAppChooserButtonPrivate*;
alias AppChooserDialogPrivate = GtkAppChooserDialogPrivate*;
alias AppChooserWidgetPrivate = GtkAppChooserWidgetPrivate*;
alias ApplicationPrivate = GtkApplicationPrivate*;
alias ApplicationWindowPrivate = GtkApplicationWindowPrivate*;
alias ArrowAccessiblePrivate = GtkArrowAccessiblePrivate*;
alias ArrowPrivate = GtkArrowPrivate*;
alias AspectFramePrivate = GtkAspectFramePrivate*;
alias AssistantPrivate = GtkAssistantPrivate*;
alias BinPrivate = GtkBinPrivate*;
alias BooleanCellAccessiblePrivate = GtkBooleanCellAccessiblePrivate*;
alias BoxPrivate = GtkBoxPrivate*;
alias BuilderPrivate = GtkBuilderPrivate*;
alias ButtonAccessiblePrivate = GtkButtonAccessiblePrivate*;
alias ButtonBoxPrivate = GtkButtonBoxPrivate*;
alias ButtonPrivate = GtkButtonPrivate*;
alias CalendarPrivate = GtkCalendarPrivate*;
alias CellAccessiblePrivate = GtkCellAccessiblePrivate*;
alias CellAreaBoxPrivate = GtkCellAreaBoxPrivate*;
alias CellAreaContextPrivate = GtkCellAreaContextPrivate*;
alias CellAreaPrivate = GtkCellAreaPrivate*;
alias CellRendererAccelPrivate = GtkCellRendererAccelPrivate*;
alias CellRendererClassPrivate = GtkCellRendererClassPrivate*;
alias CellRendererComboPrivate = GtkCellRendererComboPrivate*;
alias CellRendererPixbufPrivate = GtkCellRendererPixbufPrivate*;
alias CellRendererPrivate = GtkCellRendererPrivate*;
alias CellRendererProgressPrivate = GtkCellRendererProgressPrivate*;
alias CellRendererSpinPrivate = GtkCellRendererSpinPrivate*;
alias CellRendererSpinnerPrivate = GtkCellRendererSpinnerPrivate*;
alias CellRendererTextPrivate = GtkCellRendererTextPrivate*;
alias CellRendererTogglePrivate = GtkCellRendererTogglePrivate*;
alias CellViewPrivate = GtkCellViewPrivate*;
alias CheckMenuItemAccessiblePrivate = GtkCheckMenuItemAccessiblePrivate*;
alias CheckMenuItemPrivate = GtkCheckMenuItemPrivate*;
alias ColorButtonPrivate = GtkColorButtonPrivate*;
alias ColorChooserDialogPrivate = GtkColorChooserDialogPrivate*;
alias ColorChooserWidgetPrivate = GtkColorChooserWidgetPrivate*;
alias ColorSelectionDialogPrivate = GtkColorSelectionDialogPrivate*;
alias ColorSelectionPrivate = GtkColorSelectionPrivate*;
alias ComboBoxAccessiblePrivate = GtkComboBoxAccessiblePrivate*;
alias ComboBoxPrivate = GtkComboBoxPrivate*;
alias ComboBoxTextPrivate = GtkComboBoxTextPrivate*;
alias ContainerAccessiblePrivate = GtkContainerAccessiblePrivate*;
alias ContainerCellAccessiblePrivate = GtkContainerCellAccessiblePrivate*;
alias ContainerPrivate = GtkContainerPrivate*;
alias CssProviderPrivate = GtkCssProviderPrivate*;
alias DialogPrivate = GtkDialogPrivate*;
alias EntryAccessiblePrivate = GtkEntryAccessiblePrivate*;
alias EntryBufferPrivate = GtkEntryBufferPrivate*;
alias EntryCompletionPrivate = GtkEntryCompletionPrivate*;
alias EntryPrivate = GtkEntryPrivate*;
alias EventBoxPrivate = GtkEventBoxPrivate*;
alias ExpanderAccessiblePrivate = GtkExpanderAccessiblePrivate*;
alias ExpanderPrivate = GtkExpanderPrivate*;
alias FileChooserButtonPrivate = GtkFileChooserButtonPrivate*;
alias FileChooserDialogPrivate = GtkFileChooserDialogPrivate*;
alias FileChooserWidgetAccessiblePrivate = GtkFileChooserWidgetAccessiblePrivate*;
alias FileChooserWidgetPrivate = GtkFileChooserWidgetPrivate*;
alias FixedPrivate = GtkFixedPrivate*;
alias FlowBoxAccessiblePrivate = GtkFlowBoxAccessiblePrivate*;
alias FontButtonPrivate = GtkFontButtonPrivate*;
alias FontChooserDialogPrivate = GtkFontChooserDialogPrivate*;
alias FontChooserWidgetPrivate = GtkFontChooserWidgetPrivate*;
alias FontSelectionDialogPrivate = GtkFontSelectionDialogPrivate*;
alias FontSelectionPrivate = GtkFontSelectionPrivate*;
alias FrameAccessiblePrivate = GtkFrameAccessiblePrivate*;
alias FramePrivate = GtkFramePrivate*;
alias GridPrivate = GtkGridPrivate*;
alias HSVPrivate = GtkHSVPrivate*;
alias HandleBoxPrivate = GtkHandleBoxPrivate*;
alias HeaderBarAccessiblePrivate = GtkHeaderBarAccessiblePrivate*;
alias HeaderBarPrivate = GtkHeaderBarPrivate*;
alias IMContextSimplePrivate = GtkIMContextSimplePrivate*;
alias IMMulticontextPrivate = GtkIMMulticontextPrivate*;
alias IconFactoryPrivate = GtkIconFactoryPrivate*;
alias IconThemePrivate = GtkIconThemePrivate*;
alias IconViewAccessiblePrivate = GtkIconViewAccessiblePrivate*;
alias IconViewPrivate = GtkIconViewPrivate*;
alias ImageAccessiblePrivate = GtkImageAccessiblePrivate*;
alias ImageCellAccessiblePrivate = GtkImageCellAccessiblePrivate*;
alias ImageMenuItemPrivate = GtkImageMenuItemPrivate*;
alias ImagePrivate = GtkImagePrivate*;
alias InfoBarPrivate = GtkInfoBarPrivate*;
alias InvisiblePrivate = GtkInvisiblePrivate*;
alias LabelAccessiblePrivate = GtkLabelAccessiblePrivate*;
alias LabelPrivate = GtkLabelPrivate*;
alias LabelSelectionInfo = GtkLabelSelectionInfo*;
alias LayoutPrivate = GtkLayoutPrivate*;
alias LevelBarAccessiblePrivate = GtkLevelBarAccessiblePrivate*;
alias LevelBarPrivate = GtkLevelBarPrivate*;
alias LinkButtonAccessiblePrivate = GtkLinkButtonAccessiblePrivate*;
alias LinkButtonPrivate = GtkLinkButtonPrivate*;
alias ListBoxAccessiblePrivate = GtkListBoxAccessiblePrivate*;
alias ListStorePrivate = GtkListStorePrivate*;
alias LockButtonAccessiblePrivate = GtkLockButtonAccessiblePrivate*;
alias LockButtonPrivate = GtkLockButtonPrivate*;
alias MenuAccessiblePrivate = GtkMenuAccessiblePrivate*;
alias MenuBarPrivate = GtkMenuBarPrivate*;
alias MenuButtonAccessiblePrivate = GtkMenuButtonAccessiblePrivate*;
alias MenuButtonPrivate = GtkMenuButtonPrivate*;
alias MenuItemAccessiblePrivate = GtkMenuItemAccessiblePrivate*;
alias MenuItemPrivate = GtkMenuItemPrivate*;
alias MenuPrivate = GtkMenuPrivate*;
alias MenuShellAccessiblePrivate = GtkMenuShellAccessiblePrivate*;
alias MenuShellPrivate = GtkMenuShellPrivate*;
alias MenuToolButtonPrivate = GtkMenuToolButtonPrivate*;
alias MessageDialogPrivate = GtkMessageDialogPrivate*;
alias MiscPrivate = GtkMiscPrivate*;
alias MountOperationPrivate = GtkMountOperationPrivate*;
alias NotebookAccessiblePrivate = GtkNotebookAccessiblePrivate*;
alias NotebookPageAccessiblePrivate = GtkNotebookPageAccessiblePrivate*;
alias NotebookPrivate = GtkNotebookPrivate*;
alias NumerableIconPrivate = GtkNumerableIconPrivate*;
alias OverlayPrivate = GtkOverlayPrivate*;
alias PageRange = GtkPageRange;
alias PanedAccessiblePrivate = GtkPanedAccessiblePrivate*;
alias PanedPrivate = GtkPanedPrivate*;
alias PlugAccessiblePrivate = GtkPlugAccessiblePrivate*;
alias PlugPrivate = GtkPlugPrivate*;
alias PopoverPrivate = GtkPopoverPrivate*;
alias PrintOperationPrivate = GtkPrintOperationPrivate*;
alias ProgressBarAccessiblePrivate = GtkProgressBarAccessiblePrivate*;
alias ProgressBarPrivate = GtkProgressBarPrivate*;
alias RadioActionPrivate = GtkRadioActionPrivate*;
alias RadioButtonAccessiblePrivate = GtkRadioButtonAccessiblePrivate*;
alias RadioButtonPrivate = GtkRadioButtonPrivate*;
alias RadioMenuItemAccessiblePrivate = GtkRadioMenuItemAccessiblePrivate*;
alias RadioMenuItemPrivate = GtkRadioMenuItemPrivate*;
alias RangeAccessiblePrivate = GtkRangeAccessiblePrivate*;
alias RangePrivate = GtkRangePrivate*;
alias RcContext = GtkRcContext*;
alias RecentActionPrivate = GtkRecentActionPrivate*;
alias RecentChooserDialogPrivate = GtkRecentChooserDialogPrivate*;
alias RecentChooserMenuPrivate = GtkRecentChooserMenuPrivate*;
alias RecentChooserWidgetPrivate = GtkRecentChooserWidgetPrivate*;
alias RecentManagerPrivate = GtkRecentManagerPrivate*;
alias RendererCellAccessiblePrivate = GtkRendererCellAccessiblePrivate*;
alias RequestedSize = GtkRequestedSize;
alias ScaleAccessiblePrivate = GtkScaleAccessiblePrivate*;
alias ScaleButtonAccessiblePrivate = GtkScaleButtonAccessiblePrivate*;
alias ScaleButtonPrivate = GtkScaleButtonPrivate*;
alias ScalePrivate = GtkScalePrivate*;
alias ScrolledWindowAccessiblePrivate = GtkScrolledWindowAccessiblePrivate*;
alias ScrolledWindowPrivate = GtkScrolledWindowPrivate*;
alias SeparatorPrivate = GtkSeparatorPrivate*;
alias SeparatorToolItemPrivate = GtkSeparatorToolItemPrivate*;
alias SettingsPrivate = GtkSettingsPrivate*;
alias SizeGroupPrivate = GtkSizeGroupPrivate*;
alias SocketAccessiblePrivate = GtkSocketAccessiblePrivate*;
alias SocketPrivate = GtkSocketPrivate*;
alias SpinButtonAccessiblePrivate = GtkSpinButtonAccessiblePrivate*;
alias SpinButtonPrivate = GtkSpinButtonPrivate*;
alias SpinnerAccessiblePrivate = GtkSpinnerAccessiblePrivate*;
alias SpinnerPrivate = GtkSpinnerPrivate*;
alias StackSidebarPrivate = GtkStackSidebarPrivate*;
alias StatusIconPrivate = GtkStatusIconPrivate*;
alias StatusbarAccessiblePrivate = GtkStatusbarAccessiblePrivate*;
alias StatusbarPrivate = GtkStatusbarPrivate*;
alias StyleContextPrivate = GtkStyleContextPrivate*;
alias StylePropertiesPrivate = GtkStylePropertiesPrivate*;
alias SwitchAccessiblePrivate = GtkSwitchAccessiblePrivate*;
alias SwitchPrivate = GtkSwitchPrivate*;
alias TablePrivate = GtkTablePrivate*;
alias TableRowCol = GtkTableRowCol;
alias TearoffMenuItemPrivate = GtkTearoffMenuItemPrivate*;
alias TextBTree = GtkTextBTree*;
alias TextBufferPrivate = GtkTextBufferPrivate*;
alias TextCellAccessiblePrivate = GtkTextCellAccessiblePrivate*;
alias TextTagPrivate = GtkTextTagPrivate*;
alias TextTagTablePrivate = GtkTextTagTablePrivate*;
alias TextViewAccessiblePrivate = GtkTextViewAccessiblePrivate*;
alias TextViewPrivate = GtkTextViewPrivate*;
alias ThemeEngine = GtkThemeEngine*;
alias ThemingEnginePrivate = GtkThemingEnginePrivate*;
alias ToggleActionPrivate = GtkToggleActionPrivate*;
alias ToggleButtonAccessiblePrivate = GtkToggleButtonAccessiblePrivate*;
alias ToggleButtonPrivate = GtkToggleButtonPrivate*;
alias ToggleToolButtonPrivate = GtkToggleToolButtonPrivate*;
alias ToolButtonPrivate = GtkToolButtonPrivate*;
alias ToolItemGroupPrivate = GtkToolItemGroupPrivate*;
alias ToolItemPrivate = GtkToolItemPrivate*;
alias ToolPalettePrivate = GtkToolPalettePrivate*;
alias ToolbarPrivate = GtkToolbarPrivate*;
alias ToplevelAccessiblePrivate = GtkToplevelAccessiblePrivate*;
alias TreeModelFilterPrivate = GtkTreeModelFilterPrivate*;
alias TreeModelSortPrivate = GtkTreeModelSortPrivate*;
alias TreeSelectionPrivate = GtkTreeSelectionPrivate*;
alias TreeStorePrivate = GtkTreeStorePrivate*;
alias TreeViewAccessiblePrivate = GtkTreeViewAccessiblePrivate*;
alias TreeViewColumnPrivate = GtkTreeViewColumnPrivate*;
alias TreeViewPrivate = GtkTreeViewPrivate*;
alias UIManagerPrivate = GtkUIManagerPrivate*;
alias ViewportPrivate = GtkViewportPrivate*;
alias WidgetAccessiblePrivate = GtkWidgetAccessiblePrivate*;
alias WidgetClassPrivate = GtkWidgetClassPrivate*;
alias WidgetPrivate = GtkWidgetPrivate*;
alias WindowAccessiblePrivate = GtkWindowAccessiblePrivate*;
alias WindowGeometryInfo = GtkWindowGeometryInfo*;
alias WindowGroupPrivate = GtkWindowGroupPrivate*;
alias WindowPrivate = GtkWindowPrivate*;
alias _MountOperationHandler = _GtkMountOperationHandler*;
alias _MountOperationHandlerProxyPrivate = _GtkMountOperationHandlerProxyPrivate*;
alias _MountOperationHandlerSkeletonPrivate = _GtkMountOperationHandlerSkeletonPrivate*;

// Callbacks
alias AccelGroupActivate = bool delegate(gtk.accel_group.AccelGroup accelGroup, gobject.object.ObjectG acceleratable, uint keyval, gdk.types.ModifierType modifier);
alias AccelGroupFindFunc = bool delegate(gtk.types.AccelKey key, gobject.closure.Closure closure);
alias AccelMapForeach = void delegate(string accelPath, uint accelKey, gdk.types.ModifierType accelMods, bool changed);
alias AssistantPageFunc = int delegate(int currentPage);
alias BuilderConnectFunc = void delegate(gtk.builder.Builder builder, gobject.object.ObjectG object, string signalName, string handlerName, gobject.object.ObjectG connectObject, gobject.types.ConnectFlags flags);
alias CalendarDetailFunc = string delegate(gtk.calendar.Calendar calendar, uint year, uint month, uint day);
alias Callback = void delegate(gtk.widget.Widget widget);
alias CellAllocCallback = bool delegate(gtk.cell_renderer.CellRenderer renderer, gdk.rectangle.Rectangle cellArea, gdk.rectangle.Rectangle cellBackground);
alias CellCallback = bool delegate(gtk.cell_renderer.CellRenderer renderer);
alias CellLayoutDataFunc = void delegate(gtk.cell_layout.CellLayout cellLayout, gtk.cell_renderer.CellRenderer cell, gtk.tree_model.TreeModel treeModel, gtk.tree_iter.TreeIter iter);
alias ClipboardClearFunc = void delegate(gtk.clipboard.Clipboard clipboard);
alias ClipboardGetFunc = void delegate(gtk.clipboard.Clipboard clipboard, gtk.selection_data.SelectionData selectionData, uint info);
alias ClipboardImageReceivedFunc = void delegate(gtk.clipboard.Clipboard clipboard, gdkpixbuf.pixbuf.Pixbuf pixbuf);
alias ClipboardReceivedFunc = void delegate(gtk.clipboard.Clipboard clipboard, gtk.selection_data.SelectionData selectionData);
alias ClipboardRichTextReceivedFunc = void delegate(gtk.clipboard.Clipboard clipboard, gdk.atom.Atom format, char[] text);
alias ClipboardTextReceivedFunc = void delegate(gtk.clipboard.Clipboard clipboard, string text);
alias ClipboardURIReceivedFunc = void delegate(gtk.clipboard.Clipboard clipboard, string[] uris);
alias ColorSelectionChangePaletteFunc = void delegate(gdk.color.Color[] colors);
alias ColorSelectionChangePaletteWithScreenFunc = void delegate(gdk.screen.Screen screen, gdk.color.Color[] colors);
alias EntryCompletionMatchFunc = bool delegate(gtk.entry_completion.EntryCompletion completion, string key, gtk.tree_iter.TreeIter iter);
alias FileFilterFunc = bool delegate(gtk.file_filter_info.FileFilterInfo filterInfo);
alias FlowBoxCreateWidgetFunc = gtk.widget.Widget delegate(gobject.object.ObjectG item);
alias FlowBoxFilterFunc = bool delegate(gtk.flow_box_child.FlowBoxChild child);
alias FlowBoxForeachFunc = void delegate(gtk.flow_box.FlowBox box, gtk.flow_box_child.FlowBoxChild child);
alias FlowBoxSortFunc = int delegate(gtk.flow_box_child.FlowBoxChild child1, gtk.flow_box_child.FlowBoxChild child2);
alias FontFilterFunc = bool delegate(pango.font_family.FontFamily family, pango.font_face.FontFace face);
alias IconViewForeachFunc = void delegate(gtk.icon_view.IconView iconView, gtk.tree_path.TreePath path);
alias KeySnoopFunc = int delegate(gtk.widget.Widget grabWidget, gdk.event_key.EventKey event);
alias ListBoxCreateWidgetFunc = gtk.widget.Widget delegate(gobject.object.ObjectG item);
alias ListBoxFilterFunc = bool delegate(gtk.list_box_row.ListBoxRow row);
alias ListBoxForeachFunc = void delegate(gtk.list_box.ListBox box, gtk.list_box_row.ListBoxRow row);
alias ListBoxSortFunc = int delegate(gtk.list_box_row.ListBoxRow row1, gtk.list_box_row.ListBoxRow row2);
alias ListBoxUpdateHeaderFunc = void delegate(gtk.list_box_row.ListBoxRow row, gtk.list_box_row.ListBoxRow before);
alias MenuDetachFunc = void delegate(gtk.widget.Widget attachWidget, gtk.menu.Menu menu);
alias MenuPositionFunc = void delegate(gtk.menu.Menu menu, ref int x, ref int y, out bool pushIn);
alias ModuleDisplayInitFunc = void delegate(gdk.display.Display display);
alias PageSetupDoneFunc = void delegate(gtk.page_setup.PageSetup pageSetup);
alias PrintSettingsFunc = void delegate(string key, string value);
alias RcPropertyParser = bool delegate(gobject.param_spec.ParamSpec pspec, glib.string_.String rcString, gobject.value.Value propertyValue);
alias RecentFilterFunc = bool delegate(gtk.recent_filter_info.RecentFilterInfo filterInfo);
alias RecentSortFunc = int delegate(gtk.recent_info.RecentInfo a, gtk.recent_info.RecentInfo b);
alias StylePropertyParser = bool delegate(string string_, gobject.value.Value value, GError **_err);
alias TextBufferDeserializeFunc = bool delegate(gtk.text_buffer.TextBuffer registerBuffer, gtk.text_buffer.TextBuffer contentBuffer, gtk.text_iter.TextIter iter, ubyte[] data, bool createTags, GError **_err);
alias TextCharPredicate = bool delegate(dchar ch);
alias TextTagTableForeach = void delegate(gtk.text_tag.TextTag tag);
alias TickCallback = bool delegate(gtk.widget.Widget widget, gdk.frame_clock.FrameClock frameClock);
alias TranslateFunc = string delegate(string path);
alias TreeCellDataFunc = void delegate(gtk.tree_view_column.TreeViewColumn treeColumn, gtk.cell_renderer.CellRenderer cell, gtk.tree_model.TreeModel treeModel, gtk.tree_iter.TreeIter iter);
alias TreeDestroyCountFunc = void delegate(gtk.tree_view.TreeView treeView, gtk.tree_path.TreePath path, int children);
alias TreeIterCompareFunc = int delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter a, gtk.tree_iter.TreeIter b);
alias TreeModelFilterModifyFunc = void delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter, out gobject.value.Value value, int column);
alias TreeModelFilterVisibleFunc = bool delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter);
alias TreeModelForeachFunc = bool delegate(gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter);
alias TreeSelectionForeachFunc = void delegate(gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter);
alias TreeSelectionFunc = bool delegate(gtk.tree_selection.TreeSelection selection, gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path, bool pathCurrentlySelected);
alias TreeViewColumnDropFunc = bool delegate(gtk.tree_view.TreeView treeView, gtk.tree_view_column.TreeViewColumn column, gtk.tree_view_column.TreeViewColumn prevColumn, gtk.tree_view_column.TreeViewColumn nextColumn);
alias TreeViewMappingFunc = void delegate(gtk.tree_view.TreeView treeView, gtk.tree_path.TreePath path);
alias TreeViewRowSeparatorFunc = bool delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter);
alias TreeViewSearchEqualFunc = bool delegate(gtk.tree_model.TreeModel model, int column, string key, gtk.tree_iter.TreeIter iter);
alias TreeViewSearchPositionFunc = void delegate(gtk.tree_view.TreeView treeView, gtk.widget.Widget searchDialog);

/**
 * Like [gtk.global.getBinaryAge], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum BINARY_AGE = 2443;


/**
 * Constant to return from a signal handler for the #GtkSpinButton::input
 * signal in case of conversion failure.
 */
enum INPUT_ERROR = -1;


/**
 * Like [gtk.global.getInterfaceAge], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum INTERFACE_AGE = 32;


/**
 * The name used for the stock full offset included by #GtkLevelBar.
 */
enum LEVEL_BAR_OFFSET_FULL = "full";


/**
 * The name used for the stock high offset included by #GtkLevelBar.
 */
enum LEVEL_BAR_OFFSET_HIGH = "high";


/**
 * The name used for the stock low offset included by #GtkLevelBar.
 */
enum LEVEL_BAR_OFFSET_LOW = "low";


/**
 * Like [gtk.global.getMajorVersion], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum MAJOR_VERSION = 3;


/**
 * The maximum length of sequences in compose tables.
 */
enum MAX_COMPOSE_LEN = 7;


/**
 * Like [gtk.global.getMicroVersion], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum MICRO_VERSION = 43;


/**
 * Like [gtk.global.getMinorVersion], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum MINOR_VERSION = 24;


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


enum PATH_PRIO_MASK = 15;


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
 * to which the output should be written. GTK+ itself supports
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
 * The “About” item.
 * ![](help-about.png)

 * Deprecated: Use named icon &quot;help-about&quot; or the label &quot;_About&quot;.
 */
enum STOCK_ABOUT = "gtk-about";


/**
 * The “Add” item and icon.

 * Deprecated: Use named icon &quot;list-add&quot; or the label &quot;_Add&quot;.
 */
enum STOCK_ADD = "gtk-add";


/**
 * The “Apply” item and icon.

 * Deprecated: Do not use an icon. Use label &quot;_Apply&quot;.
 */
enum STOCK_APPLY = "gtk-apply";


/**
 * The “Bold” item and icon.

 * Deprecated: Use named icon &quot;format-text-bold&quot;.
 */
enum STOCK_BOLD = "gtk-bold";


/**
 * The “Cancel” item and icon.

 * Deprecated: Do not use an icon. Use label &quot;_Cancel&quot;.
 */
enum STOCK_CANCEL = "gtk-cancel";


/**
 * The “Caps Lock Warning” icon.

 * Deprecated: Use named icon &quot;dialog-warning-symbolic&quot;.
 */
enum STOCK_CAPS_LOCK_WARNING = "gtk-caps-lock-warning";


/**
 * The “CD-Rom” item and icon.

 * Deprecated: Use named icon &quot;media-optical&quot;.
 */
enum STOCK_CDROM = "gtk-cdrom";


/**
 * The “Clear” item and icon.

 * Deprecated: Use named icon &quot;edit-clear&quot;.
 */
enum STOCK_CLEAR = "gtk-clear";


/**
 * The “Close” item and icon.

 * Deprecated: Use named icon &quot;window-close&quot; or the label &quot;_Close&quot;.
 */
enum STOCK_CLOSE = "gtk-close";


/**
 * The “Color Picker” item and icon.
 */
enum STOCK_COLOR_PICKER = "gtk-color-picker";


/**
 * The “Connect” icon.
 */
enum STOCK_CONNECT = "gtk-connect";


/**
 * The “Convert” item and icon.
 */
enum STOCK_CONVERT = "gtk-convert";


/**
 * The “Copy” item and icon.

 * Deprecated: Use the named icon &quot;edit-copy&quot; or the label &quot;_Copy&quot;.
 */
enum STOCK_COPY = "gtk-copy";


/**
 * The “Cut” item and icon.

 * Deprecated: Use the named icon &quot;edit-cut&quot; or the label &quot;Cu_t&quot;.
 */
enum STOCK_CUT = "gtk-cut";


/**
 * The “Delete” item and icon.

 * Deprecated: Use the named icon &quot;edit-delete&quot; or the label &quot;_Delete&quot;.
 */
enum STOCK_DELETE = "gtk-delete";


/**
 * The “Authentication” item and icon.

 * Deprecated: Use named icon &quot;dialog-password&quot;.
 */
enum STOCK_DIALOG_AUTHENTICATION = "gtk-dialog-authentication";


/**
 * The “Error” item and icon.

 * Deprecated: Use named icon &quot;dialog-error&quot;.
 */
enum STOCK_DIALOG_ERROR = "gtk-dialog-error";


/**
 * The “Information” item and icon.

 * Deprecated: Use named icon &quot;dialog-information&quot;.
 */
enum STOCK_DIALOG_INFO = "gtk-dialog-info";


/**
 * The “Question” item and icon.

 * Deprecated: Use named icon &quot;dialog-question&quot;.
 */
enum STOCK_DIALOG_QUESTION = "gtk-dialog-question";


/**
 * The “Warning” item and icon.

 * Deprecated: Use named icon &quot;dialog-warning&quot;.
 */
enum STOCK_DIALOG_WARNING = "gtk-dialog-warning";


/**
 * The “Directory” icon.

 * Deprecated: Use named icon &quot;folder&quot;.
 */
enum STOCK_DIRECTORY = "gtk-directory";


/**
 * The “Discard” item.
 */
enum STOCK_DISCARD = "gtk-discard";


/**
 * The “Disconnect” icon.
 */
enum STOCK_DISCONNECT = "gtk-disconnect";


/**
 * The “Drag-And-Drop” icon.
 */
enum STOCK_DND = "gtk-dnd";


/**
 * The “Drag-And-Drop multiple” icon.
 */
enum STOCK_DND_MULTIPLE = "gtk-dnd-multiple";


/**
 * The “Edit” item and icon.
 */
enum STOCK_EDIT = "gtk-edit";


/**
 * The “Execute” item and icon.

 * Deprecated: Use named icon &quot;system-run&quot;.
 */
enum STOCK_EXECUTE = "gtk-execute";


/**
 * The “File” item and icon.
 * Since 3.0, this item has a label, before it only had an icon.

 * Deprecated: Use named icon &quot;text-x-generic&quot;.
 */
enum STOCK_FILE = "gtk-file";


/**
 * The “Find” item and icon.

 * Deprecated: Use named icon &quot;edit-find&quot;.
 */
enum STOCK_FIND = "gtk-find";


/**
 * The “Find and Replace” item and icon.

 * Deprecated: Use named icon &quot;edit-find-replace&quot;.
 */
enum STOCK_FIND_AND_REPLACE = "gtk-find-and-replace";


/**
 * The “Floppy” item and icon.
 */
enum STOCK_FLOPPY = "gtk-floppy";


/**
 * The “Fullscreen” item and icon.

 * Deprecated: Use named icon &quot;view-fullscreen&quot;.
 */
enum STOCK_FULLSCREEN = "gtk-fullscreen";


/**
 * The “Bottom” item and icon.

 * Deprecated: Use named icon &quot;go-bottom&quot;.
 */
enum STOCK_GOTO_BOTTOM = "gtk-goto-bottom";


/**
 * The “First” item and icon. The icon has an RTL variant.

 * Deprecated: Use named icon &quot;go-first&quot;.
 */
enum STOCK_GOTO_FIRST = "gtk-goto-first";


/**
 * The “Last” item and icon. The icon has an RTL variant.

 * Deprecated: Use named icon &quot;go-last&quot;.
 */
enum STOCK_GOTO_LAST = "gtk-goto-last";


/**
 * The “Top” item and icon.

 * Deprecated: Use named icon &quot;go-top&quot;.
 */
enum STOCK_GOTO_TOP = "gtk-goto-top";


/**
 * The “Back” item and icon. The icon has an RTL variant.

 * Deprecated: Use named icon &quot;go-previous&quot;.
 */
enum STOCK_GO_BACK = "gtk-go-back";


/**
 * The “Down” item and icon.

 * Deprecated: Use named icon &quot;go-down&quot;.
 */
enum STOCK_GO_DOWN = "gtk-go-down";


/**
 * The “Forward” item and icon. The icon has an RTL variant.

 * Deprecated: Use named icon &quot;go-next&quot;.
 */
enum STOCK_GO_FORWARD = "gtk-go-forward";


/**
 * The “Up” item and icon.

 * Deprecated: Use named icon &quot;go-up&quot;.
 */
enum STOCK_GO_UP = "gtk-go-up";


/**
 * The “Harddisk” item and icon.

 * Deprecated: Use named icon &quot;drive-harddisk&quot;.
 */
enum STOCK_HARDDISK = "gtk-harddisk";


/**
 * The “Help” item and icon.

 * Deprecated: Use named icon &quot;help-browser&quot;.
 */
enum STOCK_HELP = "gtk-help";


/**
 * The “Home” item and icon.

 * Deprecated: Use named icon &quot;go-home&quot;.
 */
enum STOCK_HOME = "gtk-home";


/**
 * The “Indent” item and icon. The icon has an RTL variant.

 * Deprecated: Use named icon &quot;format-indent-more&quot;.
 */
enum STOCK_INDENT = "gtk-indent";


/**
 * The “Index” item and icon.
 */
enum STOCK_INDEX = "gtk-index";


/**
 * The “Info” item and icon.

 * Deprecated: Use named icon &quot;dialog-information&quot;.
 */
enum STOCK_INFO = "gtk-info";


/**
 * The “Italic” item and icon.

 * Deprecated: Use named icon &quot;format-text-italic&quot;.
 */
enum STOCK_ITALIC = "gtk-italic";


/**
 * The “Jump to” item and icon. The icon has an RTL variant.

 * Deprecated: Use named icon &quot;go-jump&quot;.
 */
enum STOCK_JUMP_TO = "gtk-jump-to";


/**
 * The “Center” item and icon.

 * Deprecated: Use named icon &quot;format-justify-center&quot;.
 */
enum STOCK_JUSTIFY_CENTER = "gtk-justify-center";


/**
 * The “Fill” item and icon.

 * Deprecated: Use named icon &quot;format-justify-fill&quot;.
 */
enum STOCK_JUSTIFY_FILL = "gtk-justify-fill";


/**
 * The “Left” item and icon.

 * Deprecated: Use named icon &quot;format-justify-left&quot;.
 */
enum STOCK_JUSTIFY_LEFT = "gtk-justify-left";


/**
 * The “Right” item and icon.

 * Deprecated: Use named icon &quot;format-justify-right&quot;.
 */
enum STOCK_JUSTIFY_RIGHT = "gtk-justify-right";


/**
 * The “Leave Fullscreen” item and icon.

 * Deprecated: Use named icon &quot;view-restore&quot;.
 */
enum STOCK_LEAVE_FULLSCREEN = "gtk-leave-fullscreen";


/**
 * The “Media Forward” item and icon. The icon has an RTL variant.

 * Deprecated: Use named icon &quot;media-seek-forward&quot; or the label &quot;_Forward&quot;.
 */
enum STOCK_MEDIA_FORWARD = "gtk-media-forward";


/**
 * The “Media Next” item and icon. The icon has an RTL variant.

 * Deprecated: Use named icon &quot;media-skip-forward&quot; or the label &quot;_Next&quot;.
 */
enum STOCK_MEDIA_NEXT = "gtk-media-next";


/**
 * The “Media Pause” item and icon.

 * Deprecated: Use named icon &quot;media-playback-pause&quot; or the label &quot;P_ause&quot;.
 */
enum STOCK_MEDIA_PAUSE = "gtk-media-pause";


/**
 * The “Media Play” item and icon. The icon has an RTL variant.

 * Deprecated: Use named icon &quot;media-playback-start&quot; or the label &quot;_Play&quot;.
 */
enum STOCK_MEDIA_PLAY = "gtk-media-play";


/**
 * The “Media Previous” item and icon. The icon has an RTL variant.

 * Deprecated: Use named icon &quot;media-skip-backward&quot; or the label &quot;Pre_vious&quot;.
 */
enum STOCK_MEDIA_PREVIOUS = "gtk-media-previous";


/**
 * The “Media Record” item and icon.

 * Deprecated: Use named icon &quot;media-record&quot; or the label &quot;_Record&quot;.
 */
enum STOCK_MEDIA_RECORD = "gtk-media-record";


/**
 * The “Media Rewind” item and icon. The icon has an RTL variant.

 * Deprecated: Use named icon &quot;media-seek-backward&quot; or the label &quot;R_ewind&quot;.
 */
enum STOCK_MEDIA_REWIND = "gtk-media-rewind";


/**
 * The “Media Stop” item and icon.

 * Deprecated: Use named icon &quot;media-playback-stop&quot; or the label &quot;_Stop&quot;.
 */
enum STOCK_MEDIA_STOP = "gtk-media-stop";


/**
 * The “Missing image” icon.

 * Deprecated: Use named icon &quot;image-missing&quot;.
 */
enum STOCK_MISSING_IMAGE = "gtk-missing-image";


/**
 * The “Network” item and icon.

 * Deprecated: Use named icon &quot;network-workgroup&quot;.
 */
enum STOCK_NETWORK = "gtk-network";


/**
 * The “New” item and icon.

 * Deprecated: Use named icon &quot;document-new&quot; or the label &quot;_New&quot;.
 */
enum STOCK_NEW = "gtk-new";


/**
 * The “No” item and icon.
 */
enum STOCK_NO = "gtk-no";


/**
 * The “OK” item and icon.

 * Deprecated: Do not use an icon. Use label &quot;_OK&quot;.
 */
enum STOCK_OK = "gtk-ok";


/**
 * The “Open” item and icon.

 * Deprecated: Use named icon &quot;document-open&quot; or the label &quot;_Open&quot;.
 */
enum STOCK_OPEN = "gtk-open";


/**
 * The “Landscape Orientation” item and icon.
 */
enum STOCK_ORIENTATION_LANDSCAPE = "gtk-orientation-landscape";


/**
 * The “Portrait Orientation” item and icon.
 */
enum STOCK_ORIENTATION_PORTRAIT = "gtk-orientation-portrait";


/**
 * The “Reverse Landscape Orientation” item and icon.
 */
enum STOCK_ORIENTATION_REVERSE_LANDSCAPE = "gtk-orientation-reverse-landscape";


/**
 * The “Reverse Portrait Orientation” item and icon.
 */
enum STOCK_ORIENTATION_REVERSE_PORTRAIT = "gtk-orientation-reverse-portrait";


/**
 * The “Page Setup” item and icon.

 * Deprecated: Use named icon &quot;document-page-setup&quot; or the label &quot;Page Set_up&quot;.
 */
enum STOCK_PAGE_SETUP = "gtk-page-setup";


/**
 * The “Paste” item and icon.

 * Deprecated: Use named icon &quot;edit-paste&quot; or the label &quot;_Paste&quot;.
 */
enum STOCK_PASTE = "gtk-paste";


/**
 * The “Preferences” item and icon.

 * Deprecated: Use named icon &quot;preferences-system&quot; or the label &quot;_Preferences&quot;.
 */
enum STOCK_PREFERENCES = "gtk-preferences";


/**
 * The “Print” item and icon.

 * Deprecated: Use named icon &quot;document-print&quot; or the label &quot;_Print&quot;.
 */
enum STOCK_PRINT = "gtk-print";


/**
 * The “Print Error” icon.

 * Deprecated: Use named icon &quot;printer-error&quot;.
 */
enum STOCK_PRINT_ERROR = "gtk-print-error";


/**
 * The “Print Paused” icon.
 */
enum STOCK_PRINT_PAUSED = "gtk-print-paused";


/**
 * The “Print Preview” item and icon.

 * Deprecated: Use label &quot;Pre_view&quot;.
 */
enum STOCK_PRINT_PREVIEW = "gtk-print-preview";


/**
 * The “Print Report” icon.
 */
enum STOCK_PRINT_REPORT = "gtk-print-report";


/**
 * The “Print Warning” icon.
 */
enum STOCK_PRINT_WARNING = "gtk-print-warning";


/**
 * The “Properties” item and icon.

 * Deprecated: Use named icon &quot;document-properties&quot; or the label &quot;_Properties&quot;.
 */
enum STOCK_PROPERTIES = "gtk-properties";


/**
 * The “Quit” item and icon.

 * Deprecated: Use named icon &quot;application-exit&quot; or the label &quot;_Quit&quot;.
 */
enum STOCK_QUIT = "gtk-quit";


/**
 * The “Redo” item and icon. The icon has an RTL variant.

 * Deprecated: Use named icon &quot;edit-redo&quot; or the label &quot;_Redo&quot;.
 */
enum STOCK_REDO = "gtk-redo";


/**
 * The “Refresh” item and icon.

 * Deprecated: Use named icon &quot;view-refresh&quot; or the label &quot;_Refresh&quot;.
 */
enum STOCK_REFRESH = "gtk-refresh";


/**
 * The “Remove” item and icon.

 * Deprecated: Use named icon &quot;list-remove&quot; or the label &quot;_Remove&quot;.
 */
enum STOCK_REMOVE = "gtk-remove";


/**
 * The “Revert” item and icon. The icon has an RTL variant.

 * Deprecated: Use named icon &quot;document-revert&quot; or the label &quot;_Revert&quot;.
 */
enum STOCK_REVERT_TO_SAVED = "gtk-revert-to-saved";


/**
 * The “Save” item and icon.

 * Deprecated: Use named icon &quot;document-save&quot; or the label &quot;_Save&quot;.
 */
enum STOCK_SAVE = "gtk-save";


/**
 * The “Save As” item and icon.

 * Deprecated: Use named icon &quot;document-save-as&quot; or the label &quot;Save _As&quot;.
 */
enum STOCK_SAVE_AS = "gtk-save-as";


/**
 * The “Select All” item and icon.

 * Deprecated: Use named icon &quot;edit-select-all&quot; or the label &quot;Select _All&quot;.
 */
enum STOCK_SELECT_ALL = "gtk-select-all";


/**
 * The “Color” item and icon.
 */
enum STOCK_SELECT_COLOR = "gtk-select-color";


/**
 * The “Font” item and icon.
 */
enum STOCK_SELECT_FONT = "gtk-select-font";


/**
 * The “Ascending” item and icon.

 * Deprecated: Use named icon &quot;view-sort-ascending&quot;.
 */
enum STOCK_SORT_ASCENDING = "gtk-sort-ascending";


/**
 * The “Descending” item and icon.

 * Deprecated: Use named icon &quot;view-sort-descending&quot;.
 */
enum STOCK_SORT_DESCENDING = "gtk-sort-descending";


/**
 * The “Spell Check” item and icon.

 * Deprecated: Use named icon &quot;tools-check-spelling&quot;.
 */
enum STOCK_SPELL_CHECK = "gtk-spell-check";


/**
 * The “Stop” item and icon.

 * Deprecated: Use named icon &quot;process-stop&quot; or the label &quot;_Stop&quot;.
 */
enum STOCK_STOP = "gtk-stop";


/**
 * The “Strikethrough” item and icon.

 * Deprecated: Use named icon &quot;format-text-strikethrough&quot; or the label &quot;_Strikethrough&quot;.
 */
enum STOCK_STRIKETHROUGH = "gtk-strikethrough";


/**
 * The “Undelete” item and icon. The icon has an RTL variant.
 */
enum STOCK_UNDELETE = "gtk-undelete";


/**
 * The “Underline” item and icon.

 * Deprecated: Use named icon &quot;format-text-underline&quot; or the label &quot;_Underline&quot;.
 */
enum STOCK_UNDERLINE = "gtk-underline";


/**
 * The “Undo” item and icon. The icon has an RTL variant.

 * Deprecated: Use named icon &quot;edit-undo&quot; or the label &quot;_Undo&quot;.
 */
enum STOCK_UNDO = "gtk-undo";


/**
 * The “Unindent” item and icon. The icon has an RTL variant.

 * Deprecated: Use named icon &quot;format-indent-less&quot;.
 */
enum STOCK_UNINDENT = "gtk-unindent";


/**
 * The “Yes” item and icon.
 */
enum STOCK_YES = "gtk-yes";


/**
 * The “Zoom 100%” item and icon.

 * Deprecated: Use named icon &quot;zoom-original&quot; or the label &quot;_Normal Size&quot;.
 */
enum STOCK_ZOOM_100 = "gtk-zoom-100";


/**
 * The “Zoom to Fit” item and icon.

 * Deprecated: Use named icon &quot;zoom-fit-best&quot; or the label &quot;Best _Fit&quot;.
 */
enum STOCK_ZOOM_FIT = "gtk-zoom-fit";


/**
 * The “Zoom In” item and icon.

 * Deprecated: Use named icon &quot;zoom-in&quot; or the label &quot;Zoom _In&quot;.
 */
enum STOCK_ZOOM_IN = "gtk-zoom-in";


/**
 * The “Zoom Out” item and icon.

 * Deprecated: Use named icon &quot;zoom-out&quot; or the label &quot;Zoom _Out&quot;.
 */
enum STOCK_ZOOM_OUT = "gtk-zoom-out";


/**
 * A CSS class to match an accelerator.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_ACCELERATOR = "accelerator";


/**
 * A CSS class used when rendering an arrow element.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_ARROW = "arrow";


/**
 * A CSS class to match the window background.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_BACKGROUND = "background";


/**
 * A CSS class to indicate an area at the bottom of a widget.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_BOTTOM = "bottom";


/**
 * A CSS class to match buttons.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_BUTTON = "button";


/**
 * A CSS class to match calendars.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_CALENDAR = "calendar";


/**
 * A CSS class to match content rendered in cell views.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_CELL = "cell";


/**
 * A CSS class to match check boxes.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_CHECK = "check";


/**
 * A CSS class to match combobox entries.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_COMBOBOX_ENTRY = "combobox-entry";


/**
 * A CSS class to match context menus.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_CONTEXT_MENU = "context-menu";


/**
 * A CSS class that gets added to windows which have client-side decorations.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_CSD = "csd";


/**
 * A CSS class used when rendering a drag handle for
 * text selection.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_CURSOR_HANDLE = "cursor-handle";


/**
 * A CSS class to match the default widget.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_DEFAULT = "default";


/**
 * A CSS class used when an action $(LPAREN)usually a button$(RPAREN) is
 * one that is expected to remove or destroy something visible
 * to the user.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_DESTRUCTIVE_ACTION = "destructive-action";


/**
 * A CSS class to match dimmed labels.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_DIM_LABEL = "dim-label";


/**
 * A CSS class for a drag-and-drop indicator.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_DND = "dnd";


/**
 * A CSS class defining a dock area.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_DOCK = "dock";


/**
 * A CSS class to match text entries.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_ENTRY = "entry";


/**
 * A CSS class for an area displaying an error message,
 * such as those in infobars.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_ERROR = "error";


/**
 * A CSS class defining an expander, such as those in treeviews.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_EXPANDER = "expander";


/**
 * A CSS class that is added when widgets that usually have
 * a frame or border $(LPAREN)like buttons or entries$(RPAREN) should appear
 * without it.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_FLAT = "flat";


/**
 * A CSS class defining a frame delimiting content, such as
 * #GtkFrame or the scrolled window frame around the
 * scrollable area.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_FRAME = "frame";


/**
 * A CSS class defining a resize grip.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_GRIP = "grip";


/**
 * A CSS class to match a header element.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_HEADER = "header";


/**
 * A CSS class defining a highlighted area, such as headings in
 * assistants and calendars.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_HIGHLIGHT = "highlight";


/**
 * A CSS class for horizontally layered widgets.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_HORIZONTAL = "horizontal";


/**
 * A CSS class defining an image, such as the icon in an entry.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_IMAGE = "image";


/**
 * A CSS class for an area displaying an informational message,
 * such as those in infobars.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_INFO = "info";


/**
 * A CSS class to match inline toolbars.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_INLINE_TOOLBAR = "inline-toolbar";


/**
 * A CSS class used when rendering a drag handle for
 * the insertion cursor position.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_INSERTION_CURSOR = "insertion-cursor";


/**
 * A CSS class to match labels.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_LABEL = "label";


/**
 * A CSS class to indicate an area at the left of a widget.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_LEFT = "left";


/**
 * A CSS class used when rendering a level indicator, such
 * as a battery charge level, or a password strength.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_LEVEL_BAR = "level-bar";


/**
 * A CSS class to match a linked area, such as a box containing buttons
 * belonging to the same control.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_LINKED = "linked";


/**
 * A CSS class to match lists.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_LIST = "list";


/**
 * A CSS class to match list rows.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_LIST_ROW = "list-row";


/**
 * A CSS class defining marks in a widget, such as in scales.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_MARK = "mark";


/**
 * A CSS class to match menus.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_MENU = "menu";


/**
 * A CSS class to menubars.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_MENUBAR = "menubar";


/**
 * A CSS class to match menu items.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_MENUITEM = "menuitem";


/**
 * A CSS class that is added to message dialogs.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_MESSAGE_DIALOG = "message-dialog";


/**
 * A CSS class that is added to text view that should use
 * a monospace font.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_MONOSPACE = "monospace";


/**
 * A CSS class used when an element needs the user attention,
 * for instance a button in a stack switcher corresponding to
 * a hidden page that changed state.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_NEEDS_ATTENTION = "needs-attention";


/**
 * A CSS class defining a notebook.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_NOTEBOOK = "notebook";


/**
 * A CSS class used when rendering an OSD $(LPAREN)On Screen Display$(RPAREN) element,
 * on top of another container.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_OSD = "osd";


/**
 * A CSS class that is added on the visual hints that happen
 * when scrolling is attempted past the limits of a scrollable
 * area.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_OVERSHOOT = "overshoot";


/**
 * A CSS class for a pane separator, such as those in #GtkPaned.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_PANE_SEPARATOR = "pane-separator";


/**
 * A CSS class that is added to areas that should look like paper.
 * This is used in print previews and themes are encouraged to
 * style it as black text on white background.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_PAPER = "paper";


/**
 * A CSS class that matches popovers.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_POPOVER = "popover";


/**
 * A CSS class that is added to the toplevel windows used for menus.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_POPUP = "popup";


/**
 * A CSS class to match primary toolbars.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_PRIMARY_TOOLBAR = "primary-toolbar";


/**
 * A CSS class to use when rendering activity as a progressbar.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_PROGRESSBAR = "progressbar";


/**
 * A CSS class to use when rendering a pulse in an indeterminate progress bar.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_PULSE = "pulse";


/**
 * A CSS class for an area displaying a question to the user,
 * such as those in infobars.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_QUESTION = "question";


/**
 * A CSS class to match radio buttons.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_RADIO = "radio";


/**
 * A CSS class to match a raised control, such as a raised
 * button on a toolbar.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_RAISED = "raised";


/**
 * A CSS class used to indicate a read-only state.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_READ_ONLY = "read-only";


/**
 * A CSS class to indicate an area at the right of a widget.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_RIGHT = "right";


/**
 * A CSS class to match the rubberband selection rectangle.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_RUBBERBAND = "rubberband";


/**
 * A CSS class to match scale widgets.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_SCALE = "scale";


/**
 * A CSS class to match scale widgets with marks attached,
 * all the marks are above for horizontal #GtkScale.
 * left for vertical #GtkScale.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_SCALE_HAS_MARKS_ABOVE = "scale-has-marks-above";


/**
 * A CSS class to match scale widgets with marks attached,
 * all the marks are below for horizontal #GtkScale,
 * right for vertical #GtkScale.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_SCALE_HAS_MARKS_BELOW = "scale-has-marks-below";


/**
 * A CSS class to match scrollbars.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_SCROLLBAR = "scrollbar";


/**
 * A CSS class to match the junction area between an horizontal
 * and vertical scrollbar, when they’re both shown.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_SCROLLBARS_JUNCTION = "scrollbars-junction";


/**
 * A CSS class for a separator.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_SEPARATOR = "separator";


/**
 * A CSS class defining a sidebar, such as the left side in
 * a file chooser.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_SIDEBAR = "sidebar";


/**
 * A CSS class to match sliders.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_SLIDER = "slider";


/**
 * A CSS class defining an spinbutton.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_SPINBUTTON = "spinbutton";


/**
 * A CSS class to use when rendering activity as a “spinner”.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_SPINNER = "spinner";


/**
 * A CSS class to match statusbars.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_STATUSBAR = "statusbar";


/**
 * A CSS class used for the subtitle label in a titlebar in
 * a toplevel window.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_SUBTITLE = "subtitle";


/**
 * A CSS class used when an action $(LPAREN)usually a button$(RPAREN) is the
 * primary suggested action in a specific context.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_SUGGESTED_ACTION = "suggested-action";


/**
 * A CSS class used for the title label in a titlebar in
 * a toplevel window.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_TITLE = "title";


/**
 * A CSS class used when rendering a titlebar in a toplevel window.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_TITLEBAR = "titlebar";


/**
 * A CSS class to match toolbars.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_TOOLBAR = "toolbar";


/**
 * A CSS class to match tooltip windows.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_TOOLTIP = "tooltip";


/**
 * A CSS class to indicate an area at the top of a widget.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_TOP = "top";


/**
 * A CSS class for touch selection popups on entries
 * and text views.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_TOUCH_SELECTION = "touch-selection";


/**
 * A CSS class to match troughs, as in scrollbars and progressbars.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_TROUGH = "trough";


/**
 * A CSS class that is added on the visual hints that happen
 * where content is 'scrolled off' and can be made visible
 * by scrolling.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_UNDERSHOOT = "undershoot";


/**
 * A CSS class for vertically layered widgets.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_VERTICAL = "vertical";


/**
 * A CSS class defining a view, such as iconviews or treeviews.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_VIEW = "view";


/**
 * A CSS class for an area displaying a warning message,
 * such as those in infobars.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_WARNING = "warning";


/**
 * A CSS class to indicate that a UI element should be 'wide'.
 * Used by #GtkPaned.
 * Refer to individual widget documentation for used style classes.
 */
enum STYLE_CLASS_WIDE = "wide";


/**
 * A property holding the background color of rendered elements as a #GdkRGBA.
 */
enum STYLE_PROPERTY_BACKGROUND_COLOR = "background-color";


/**
 * A property holding the element’s background as a #cairo_pattern_t.
 */
enum STYLE_PROPERTY_BACKGROUND_IMAGE = "background-image";


/**
 * A property holding the element’s border color as a #GdkRGBA.
 */
enum STYLE_PROPERTY_BORDER_COLOR = "border-color";


/**
 * A property holding the rendered element’s border radius in pixels as a #gint.
 */
enum STYLE_PROPERTY_BORDER_RADIUS = "border-radius";


/**
 * A property holding the element’s border style as a #GtkBorderStyle.
 */
enum STYLE_PROPERTY_BORDER_STYLE = "border-style";


/**
 * A property holding the rendered element’s border width in pixels as
 * a #GtkBorder. The border is the intermediary spacing property of the
 * padding/border/margin series.
 * [gtk.global.renderFrame] uses this property to find out the frame line width,
 * so #GtkWidgets rendering frames may need to add up this padding when
 * requesting size
 */
enum STYLE_PROPERTY_BORDER_WIDTH = "border-width";


/**
 * A property holding the foreground color of rendered elements as a #GdkRGBA.
 */
enum STYLE_PROPERTY_COLOR = "color";


/**
 * A property holding the font properties used when rendering text
 * as a #PangoFontDescription.
 */
enum STYLE_PROPERTY_FONT = "font";


/**
 * A property holding the rendered element’s margin as a #GtkBorder. The
 * margin is defined as the spacing between the border of the element
 * and its surrounding elements. It is external to #GtkWidget's
 * size allocations, and the most external spacing property of the
 * padding/border/margin series.
 */
enum STYLE_PROPERTY_MARGIN = "margin";


/**
 * A property holding the rendered element’s padding as a #GtkBorder. The
 * padding is defined as the spacing between the inner part of the element border
 * and its child. It’s the innermost spacing property of the padding/border/margin
 * series.
 */
enum STYLE_PROPERTY_PADDING = "padding";


/**
 * A priority that can be used when adding a #GtkStyleProvider
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
 * via #GtkSettings.
 * This priority is higher than #GTK_STYLE_PROVIDER_PRIORITY_THEME
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
 * `XDG_CONFIG_HOME/gtk-3.0/gtk.css`.
 * You should not use priorities higher than this, to
 * give the user the last word.
 */
enum STYLE_PROVIDER_PRIORITY_USER = 800;


/**
 * A widget region name to define a treeview column.

 * Deprecated: Don't use regions.
 */
enum STYLE_REGION_COLUMN = "column";


/**
 * A widget region name to define a treeview column header.

 * Deprecated: Don't use regions.
 */
enum STYLE_REGION_COLUMN_HEADER = "column-header";


/**
 * A widget region name to define a treeview row.

 * Deprecated: Don't use regions.
 */
enum STYLE_REGION_ROW = "row";


/**
 * A widget region name to define a notebook tab.

 * Deprecated: Don't use regions.
 */
enum STYLE_REGION_TAB = "tab";


/**
 * The priority at which the text view validates onscreen lines
 * in an idle job in the background.
 */
enum TEXT_VIEW_PRIORITY_VALIDATE = 125;


/**
 * The GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID can be used to make a
 * #GtkTreeSortable use the default sort function.
 * See also [gtk.tree_sortable.TreeSortable.setSortColumnId]
 */
enum TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID = -1;


/**
 * The GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID can be used to make a
 * #GtkTreeSortable use no sorting.
 * See also [gtk.tree_sortable.TreeSortable.setSortColumnId]
 */
enum TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID = -2;

