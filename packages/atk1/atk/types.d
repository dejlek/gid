module atk.types;

import atk.c.functions;
import atk.c.types;
import atk.key_event_struct;
import atk.object;
import atk.property_values;
import gid.gid;


// Aliases

/** */
alias State = AtkState;

// Structs

/** */
alias TextRectangle = AtkTextRectangle;

// Callbacks

/**
    A function which is called when an object emits a matching event,
  as used in #atk_add_focus_tracker.
  Currently the only events for which object-specific handlers are
  supported are events of type "focus:".  Most clients of ATK will prefer to
  attach signal handlers for the various ATK signals instead.
  
  see `idatk_add_focus_tracker`

  ## Parameters
  $(LIST
    * $(B obj)       An #AtkObject instance for whom the callback will be called when
      the specified event (e.g. 'focus:') takes place.
  )
*/
alias EventListener = void delegate(atk.object.ObjectAtk obj);

/**
    An #AtkEventListenerInit function is a special function that is
  called in order to initialize the per-object event registration system
  used by #AtkEventListener, if any preparation is required.
  
  see `idatk_focus_tracker_init`
*/
alias EventListenerInit = void delegate();

/**
    The type of callback function used for
  [atk.component.Component.addFocusHandler] and
  [atk.component.Component.removeFocusHandler]

  ## Parameters
  $(LIST
    * $(B object)       the #AtkObject that receives/lose the focus
    * $(B focusIn)       TRUE if the object receives the focus
  )

  Deprecated:     Deprecated with [atk.component.Component.addFocusHandler]
    and [atk.component.Component.removeFocusHandler]. See those
    methods for more information.
*/
alias FocusHandler = void delegate(atk.object.ObjectAtk object, bool focusIn);

/**
    An AtkFunction is a function definition used for padding which has
  been added to class and interface structures to allow for expansion
  in the future.
  Returns:     not used
*/
alias Function = bool delegate();

/**
    An #AtkKeySnoopFunc is a type of callback which is called whenever a key event occurs,
  if registered via atk_add_key_event_listener.  It allows for pre-emptive
  interception of key events via the return code as described below.

  ## Parameters
  $(LIST
    * $(B event)       an AtkKeyEventStruct containing information about the key event for which
      notification is being given.
  )
  Returns:     TRUE (nonzero) if the event emission should be stopped and the event
    discarded without being passed to the normal GUI recipient; FALSE (zero) if the
    event dispatch to the client application should proceed as normal.
    
    see `idatk_add_key_event_listener`
*/
alias KeySnoopFunc = int delegate(atk.key_event_struct.KeyEventStruct event);

/**
    An AtkPropertyChangeHandler is a function which is executed when an
  AtkObject's property changes value. It is specified in a call to
  [atk.object.ObjectAtk.connectPropertyChangeHandler].

  ## Parameters
  $(LIST
    * $(B obj)       atkobject which property changes
    * $(B vals)       values changed
  )

  Deprecated:     Since 2.12.
*/
alias PropertyChangeHandler = void delegate(atk.object.ObjectAtk obj, atk.property_values.PropertyValues vals);

/**
    Specifies how xy coordinates are to be interpreted. Used by functions such
  as [atk.component.Component.getPosition] and [atk.text.Text.getCharacterExtents]
*/
enum CoordType
{
  /**
      specifies xy coordinates relative to the screen
  */
  Screen = 0,

  /**
      specifies xy coordinates relative to the widget's
    top-level window
  */
  Window = 1,

  /**
      specifies xy coordinates relative to the widget's
    immediate parent. Since: 2.30
  */
  Parent = 2,
}

/**
    Describes the type of link
*/
enum HyperlinkStateFlags : uint
{
  /**
      Link is inline
  */
  Inline = 1,
}

/**
    Specifies the type of a keyboard evemt.
*/
enum KeyEventType
{
  /**
      specifies a key press event
  */
  Press = 0,

  /**
      specifies a key release event
  */
  Release = 1,

  /**
      Not a valid value; specifies end of enumeration
  */
  LastDefined = 2,
}

/**
    Describes the layer of a component
  
  These enumerated "layer values" are used when determining which UI
  rendering layer a component is drawn into, which can help in making
  determinations of when components occlude one another.
*/
enum Layer
{
  /**
      The object does not have a layer
  */
  Invalid = 0,

  /**
      This layer is reserved for the desktop background
  */
  Background = 1,

  /**
      This layer is used for Canvas components
  */
  Canvas = 2,

  /**
      This layer is normally used for components
  */
  Widget = 3,

  /**
      This layer is used for layered components
  */
  Mdi = 4,

  /**
      This layer is used for popup components, such as menus
  */
  Popup = 5,

  /**
      This layer is reserved for future use.
  */
  Overlay = 6,

  /**
      This layer is used for toplevel windows.
  */
  Window = 7,
}

/**
    Enumeration used to indicate a type of live region and how assertive it
  should be in terms of speaking notifications. Currently, this is only used
  for "notification" events, but it may be used for additional purposes
  in the future.
*/
enum Live
{
  /**
      No live region.
  */
  None = 0,

  /**
      This live region should be considered polite.
  */
  Polite = 1,

  /**
      This live region should be considered assertive.
  */
  Assertive = 2,
}

/**
    Describes the type of the relation
*/
enum RelationType
{
  /**
      Not used, represens "no relationship" or an error condition.
  */
  Null = 0,

  /**
      Indicates an object controlled by one or more target objects.
  */
  ControlledBy = 1,

  /**
      Indicates an object is an controller for one or more target objects.
  */
  ControllerFor = 2,

  /**
      Indicates an object is a label for one or more target objects.
  */
  LabelFor = 3,

  /**
      Indicates an object is labelled by one or more target objects.
  */
  LabelledBy = 4,

  /**
      Indicates an object is a member of a group of one or more target objects.
  */
  MemberOf = 5,

  /**
      Indicates an object is a cell in a treetable which is displayed because a cell in the same column is expanded and identifies that cell.
  */
  NodeChildOf = 6,

  /**
      Indicates that the object has content that flows logically to another
     AtkObject in a sequential way, (for instance text-flow).
  */
  FlowsTo = 7,

  /**
      Indicates that the object has content that flows logically from
     another AtkObject in a sequential way, (for instance text-flow).
  */
  FlowsFrom = 8,

  /**
      Indicates a subwindow attached to a component but otherwise has no connection in  the UI heirarchy to that component.
  */
  SubwindowOf = 9,

  /**
      Indicates that the object visually embeds
     another object's content, i.e. this object's content flows around
     another's content.
  */
  Embeds = 10,

  /**
      Reciprocal of [atk.types.RelationType.Embeds], indicates that
     this object's content is visualy embedded in another object.
  */
  EmbeddedBy = 11,

  /**
      Indicates that an object is a popup for another object.
  */
  PopupFor = 12,

  /**
      Indicates that an object is a parent window of another object.
  */
  ParentWindowOf = 13,

  /**
      Reciprocal of [atk.types.RelationType.DescriptionFor]. Indicates that one
    or more target objects provide descriptive information about this object. This relation
    type is most appropriate for information that is not essential as its presentation may
    be user-configurable and/or limited to an on-demand mechanism such as an assistive
    technology command. For brief, essential information such as can be found in a widget's
    on-screen label, use [atk.types.RelationType.LabelledBy]. For an on-screen error message, use
    [atk.types.RelationType.ErrorMessage]. For lengthy extended descriptive information contained in
    an on-screen object, consider using [atk.types.RelationType.Details] as assistive technologies may
    provide a means for the user to navigate to objects containing detailed descriptions so
    that their content can be more closely reviewed.
  */
  DescribedBy = 14,

  /**
      Reciprocal of [atk.types.RelationType.DescribedBy]. Indicates that this
    object provides descriptive information about the target object(s). See also
    [atk.types.RelationType.DetailsFor] and [atk.types.RelationType.ErrorFor].
  */
  DescriptionFor = 15,

  /**
      Indicates an object is a cell in a treetable and is expanded to display other cells in the same column.
  */
  NodeParentOf = 16,

  /**
      Reciprocal of [atk.types.RelationType.DetailsFor]. Indicates that this object
    has a detailed or extended description, the contents of which can be found in the target
    object(s). This relation type is most appropriate for information that is sufficiently
    lengthy as to make navigation to the container of that information desirable. For less
    verbose information suitable for announcement only, see [atk.types.RelationType.DescribedBy]. If
    the detailed information describes an error condition, [atk.types.RelationType.ErrorFor] should be
    used instead. @Since: ATK-2.26.
  */
  Details = 17,

  /**
      Reciprocal of [atk.types.RelationType.Details]. Indicates that this object
    provides a detailed or extended description about the target object(s). See also
    [atk.types.RelationType.DescriptionFor] and [atk.types.RelationType.ErrorFor]. @Since: ATK-2.26.
  */
  DetailsFor = 18,

  /**
      Reciprocal of [atk.types.RelationType.ErrorFor]. Indicates that this object
    has one or more errors, the nature of which is described in the contents of the target
    object(s). Objects that have this relation type should also contain [atk.types.StateType.InvalidEntry]
    in their #AtkStateSet. @Since: ATK-2.26.
  */
  ErrorMessage = 19,

  /**
      Reciprocal of [atk.types.RelationType.ErrorMessage]. Indicates that this object
    contains an error message describing an invalid condition in the target object(s). @Since:
    ATK_2.26.
  */
  ErrorFor = 20,

  /**
      Not used, this value indicates the end of the enumeration.
  */
  LastDefined = 21,
}

/**
    Describes the role of an object
  
  These are the built-in enumerated roles that UI components can have
  in ATK.  Other roles may be added at runtime, so an AtkRole >=
  [atk.types.Role.LastDefined] is not necessarily an error.
*/
enum Role
{
  /**
      Invalid role
  */
  Invalid = 0,

  /**
      A label which represents an accelerator
  */
  AcceleratorLabel = 1,

  /**
      An object which is an alert to the user. Assistive Technologies typically respond to ATK_ROLE_ALERT by reading the entire onscreen contents of containers advertising this role.  Should be used for warning dialogs, etc.
  */
  Alert = 2,

  /**
      An object which is an animated image
  */
  Animation = 3,

  /**
      An arrow in one of the four cardinal directions
  */
  Arrow = 4,

  /**
      An object that displays a calendar and allows the user to select a date
  */
  Calendar = 5,

  /**
      An object that can be drawn into and is used to trap events
  */
  Canvas = 6,

  /**
      A choice that can be checked or unchecked and provides a separate indicator for the current state
  */
  CheckBox = 7,

  /**
      A menu item with a check box
  */
  CheckMenuItem = 8,

  /**
      A specialized dialog that lets the user choose a color
  */
  ColorChooser = 9,

  /**
      The header for a column of data
  */
  ColumnHeader = 10,

  /**
      A collapsible list of choices the user can select from
  */
  ComboBox = 11,

  /**
      An object whose purpose is to allow a user to edit a date
  */
  DateEditor = 12,

  /**
      An inconifed internal frame within a DESKTOP_PANE
  */
  DesktopIcon = 13,

  /**
      A pane that supports internal frames and iconified versions of those internal frames
  */
  DesktopFrame = 14,

  /**
      An object whose purpose is to allow a user to set a value
  */
  Dial = 15,

  /**
      A top level window with title bar and a border
  */
  Dialog = 16,

  /**
      A pane that allows the user to navigate through and select the contents of a directory
  */
  DirectoryPane = 17,

  /**
      An object used for drawing custom user interface elements
  */
  DrawingArea = 18,

  /**
      A specialized dialog that lets the user choose a file
  */
  FileChooser = 19,

  /**
      A object that fills up space in a user interface
  */
  Filler = 20,

  /**
      A specialized dialog that lets the user choose a font
  */
  FontChooser = 21,

  /**
      A top level window with a title bar, border, menubar, etc.
  */
  Frame = 22,

  /**
      A pane that is guaranteed to be painted on top of all panes beneath it
  */
  GlassPane = 23,

  /**
      A document container for HTML, whose children represent the document content
  */
  HtmlContainer = 24,

  /**
      A small fixed size picture, typically used to decorate components
  */
  Icon = 25,

  /**
      An object whose primary purpose is to display an image
  */
  Image = 26,

  /**
      A frame-like object that is clipped by a desktop pane
  */
  InternalFrame = 27,

  /**
      An object used to present an icon or short string in an interface
  */
  Label = 28,

  /**
      A specialized pane that allows its children to be drawn in layers, providing a form of stacking order
  */
  LayeredPane = 29,

  /**
      An object that presents a list of objects to the user and allows the user to select one or more of them
  */
  List = 30,

  /**
      An object that represents an element of a list
  */
  ListItem = 31,

  /**
      An object usually found inside a menu bar that contains a list of actions the user can choose from
  */
  Menu = 32,

  /**
      An object usually drawn at the top of the primary dialog box of an application that contains a list of menus the user can choose from
  */
  MenuBar = 33,

  /**
      An object usually contained in a menu that presents an action the user can choose
  */
  MenuItem = 34,

  /**
      A specialized pane whose primary use is inside a DIALOG
  */
  OptionPane = 35,

  /**
      An object that is a child of a page tab list
  */
  PageTab = 36,

  /**
      An object that presents a series of panels (or page tabs), one at a time, through some mechanism provided by the object
  */
  PageTabList = 37,

  /**
      A generic container that is often used to group objects
  */
  Panel = 38,

  /**
      A text object uses for passwords, or other places where the text content is not shown visibly to the user
  */
  PasswordText = 39,

  /**
      A temporary window that is usually used to offer the user a list of choices, and then hides when the user selects one of those choices
  */
  PopupMenu = 40,

  /**
      An object used to indicate how much of a task has been completed
  */
  ProgressBar = 41,

  /**
      An object the user can manipulate to tell the application to do something
  */
  PushButton = 42,

  /**
      A specialized check box that will cause other radio buttons in the same group to become unchecked when this one is checked
  */
  RadioButton = 43,

  /**
      A check menu item which belongs to a group. At each instant exactly one of the radio menu items from a group is selected
  */
  RadioMenuItem = 44,

  /**
      A specialized pane that has a glass pane and a layered pane as its children
  */
  RootPane = 45,

  /**
      The header for a row of data
  */
  RowHeader = 46,

  /**
      An object usually used to allow a user to incrementally view a large amount of data.
  */
  ScrollBar = 47,

  /**
      An object that allows a user to incrementally view a large amount of information
  */
  ScrollPane = 48,

  /**
      An object usually contained in a menu to provide a visible and logical separation of the contents in a menu
  */
  Separator = 49,

  /**
      An object that allows the user to select from a bounded range
  */
  Slider = 50,

  /**
      A specialized panel that presents two other panels at the same time
  */
  SplitPane = 51,

  /**
      An object used to get an integer or floating point number from the user
  */
  SpinButton = 52,

  /**
      An object which reports messages of minor importance to the user
  */
  Statusbar = 53,

  /**
      An object used to represent information in terms of rows and columns
  */
  Table = 54,

  /**
      A cell in a table
  */
  TableCell = 55,

  /**
      The header for a column of a table
  */
  TableColumnHeader = 56,

  /**
      The header for a row of a table
  */
  TableRowHeader = 57,

  /**
      A menu item used to tear off and reattach its menu
  */
  TearOffMenuItem = 58,

  /**
      An object that represents an accessible terminal.  (Since: 0.6)
  */
  Terminal = 59,

  /**
      An interactive widget that supports multiple lines of text and
    optionally accepts user input, but whose purpose is not to solicit user input.
    Thus ATK_ROLE_TEXT is appropriate for the text view in a plain text editor
    but inappropriate for an input field in a dialog box or web form. For widgets
    whose purpose is to solicit input from the user, see ATK_ROLE_ENTRY and
    ATK_ROLE_PASSWORD_TEXT. For generic objects which display a brief amount of
    textual information, see ATK_ROLE_STATIC.
  */
  Text = 60,

  /**
      A specialized push button that can be checked or unchecked, but does not provide a separate indicator for the current state
  */
  ToggleButton = 61,

  /**
      A bar or palette usually composed of push buttons or toggle buttons
  */
  ToolBar = 62,

  /**
      An object that provides information about another object
  */
  ToolTip = 63,

  /**
      An object used to represent hierarchical information to the user
  */
  Tree = 64,

  /**
      An object capable of expanding and collapsing rows as well as showing multiple columns of data.   (Since: 0.7)
  */
  TreeTable = 65,

  /**
      The object contains some Accessible information, but its role is not known
  */
  Unknown = 66,

  /**
      An object usually used in a scroll pane
  */
  Viewport = 67,

  /**
      A top level window with no title or border.
  */
  Window = 68,

  /**
      An object that serves as a document header. (Since: 1.1.1)
  */
  Header = 69,

  /**
      An object that serves as a document footer.  (Since: 1.1.1)
  */
  Footer = 70,

  /**
      An object which is contains a paragraph of text content.   (Since: 1.1.1)
  */
  Paragraph = 71,

  /**
      An object which describes margins and tab stops, etc. for text objects which it controls (should have CONTROLLER_FOR relation to such).   (Since: 1.1.1)
  */
  Ruler = 72,

  /**
      The object is an application object, which may contain @ATK_ROLE_FRAME objects or other types of accessibles.  The root accessible of any application's ATK hierarchy should have ATK_ROLE_APPLICATION.   (Since: 1.1.4)
  */
  Application = 73,

  /**
      The object is a dialog or list containing items for insertion into an entry widget, for instance a list of words for completion of a text entry.   (Since: 1.3)
  */
  Autocomplete = 74,

  /**
      The object is an editable text object in a toolbar.  (Since: 1.5)
  */
  EditBar = 75,

  /**
      The object is an embedded container within a document or panel.  This role is a grouping "hint" indicating that the contained objects share a context.  (Since: 1.7.2)
  */
  Embedded = 76,

  /**
      The object is a component whose textual content may be entered or modified by the user, provided @ATK_STATE_EDITABLE is present.   (Since: 1.11)
  */
  Entry = 77,

  /**
      The object is a graphical depiction of quantitative data. It may contain multiple subelements whose attributes and/or description may be queried to obtain both the quantitative data and information about how the data is being presented. The LABELLED_BY relation is particularly important in interpreting objects of this type, as is the accessible-description property.  (Since: 1.11)
  */
  Chart = 78,

  /**
      The object contains descriptive information, usually textual, about another user interface element such as a table, chart, or image.  (Since: 1.11)
  */
  Caption = 79,

  /**
      The object is a visual frame or container which contains a view of document content. Document frames may occur within another Document instance, in which case the second document may be said to be embedded in the containing instance. HTML frames are often ROLE_DOCUMENT_FRAME. Either this object, or a singleton descendant, should implement the Document interface.  (Since: 1.11)
  */
  DocumentFrame = 80,

  /**
      The object serves as a heading for content which follows it in a document. The 'heading level' of the heading, if availabe, may be obtained by querying the object's attributes.
  */
  Heading = 81,

  /**
      The object is a containing instance which encapsulates a page of information. @ATK_ROLE_PAGE is used in documents and content which support a paginated navigation model.  (Since: 1.11)
  */
  Page = 82,

  /**
      The object is a containing instance of document content which constitutes a particular 'logical' section of the document. The type of content within a section, and the nature of the section division itself, may be obtained by querying the object's attributes. Sections may be nested. (Since: 1.11)
  */
  Section = 83,

  /**
      The object is redundant with another object in the hierarchy, and is exposed for purely technical reasons.  Objects of this role should normally be ignored by clients. (Since: 1.11)
  */
  RedundantObject = 84,

  /**
      The object is a container for form controls, for instance as part of a
    web form or user-input form within a document.  This role is primarily a tag/convenience for
    clients when navigating complex documents, it is not expected that ordinary GUI containers will
    always have ATK_ROLE_FORM. (Since: 1.12.0)
  */
  Form = 85,

  /**
      The object is a hypertext anchor, i.e. a "link" in a
    hypertext document.  Such objects are distinct from 'inline'
    content which may also use the Hypertext/Hyperlink interfaces
    to indicate the range/location within a text object where
    an inline or embedded object lies.  (Since: 1.12.1)
  */
  Link = 86,

  /**
      The object is a window or similar viewport
    which is used to allow composition or input of a 'complex character',
    in other words it is an "input method window." (Since: 1.12.1)
  */
  InputMethodWindow = 87,

  /**
      A row in a table.  (Since: 2.1.0)
  */
  TableRow = 88,

  /**
      An object that represents an element of a tree.  (Since: 2.1.0)
  */
  TreeItem = 89,

  /**
      A document frame which contains a spreadsheet.  (Since: 2.1.0)
  */
  DocumentSpreadsheet = 90,

  /**
      A document frame which contains a presentation or slide content.  (Since: 2.1.0)
  */
  DocumentPresentation = 91,

  /**
      A document frame which contains textual content, such as found in a word processing application.  (Since: 2.1.0)
  */
  DocumentText = 92,

  /**
      A document frame which contains HTML or other markup suitable for display in a web browser.  (Since: 2.1.0)
  */
  DocumentWeb = 93,

  /**
      A document frame which contains email content to be displayed or composed either in plain text or HTML.  (Since: 2.1.0)
  */
  DocumentEmail = 94,

  /**
      An object found within a document and designed to present a comment, note, or other annotation. In some cases, this object might not be visible until activated.  (Since: 2.1.0)
  */
  Comment = 95,

  /**
      A non-collapsible list of choices the user can select from. (Since: 2.1.0)
  */
  ListBox = 96,

  /**
      A group of related widgets. This group typically has a label. (Since: 2.1.0)
  */
  Grouping = 97,

  /**
      An image map object. Usually a graphic with multiple hotspots, where each hotspot can be activated resulting in the loading of another document or section of a document. (Since: 2.1.0)
  */
  ImageMap = 98,

  /**
      A transitory object designed to present a message to the user, typically at the desktop level rather than inside a particular application.  (Since: 2.1.0)
  */
  Notification = 99,

  /**
      An object designed to present a message to the user within an existing window. (Since: 2.1.0)
  */
  InfoBar = 100,

  /**
      A bar that serves as a level indicator to, for instance, show the strength of a password or the state of a battery.  (Since: 2.7.3)
  */
  LevelBar = 101,

  /**
      A bar that serves as the title of a window or a
    dialog. (Since: 2.12)
  */
  TitleBar = 102,

  /**
      An object which contains a text section
    that is quoted from another source. (Since: 2.12)
  */
  BlockQuote = 103,

  /**
      An object which represents an audio element. (Since: 2.12)
  */
  Audio = 104,

  /**
      An object which represents a video element. (Since: 2.12)
  */
  Video = 105,

  /**
      A definition of a term or concept. (Since: 2.12)
  */
  Definition = 106,

  /**
      A section of a page that consists of a
    composition that forms an independent part of a document, page, or
    site. Examples: A blog entry, a news story, a forum post. (Since: 2.12)
  */
  Article = 107,

  /**
      A region of a web page intended as a
    navigational landmark. This is designed to allow Assistive
    Technologies to provide quick navigation among key regions within a
    document. (Since: 2.12)
  */
  Landmark = 108,

  /**
      A text widget or container holding log content, such
    as chat history and error logs. In this role there is a
    relationship between the arrival of new items in the log and the
    reading order. The log contains a meaningful sequence and new
    information is added only to the end of the log, not at arbitrary
    points. (Since: 2.12)
  */
  Log = 109,

  /**
      A container where non-essential information
    changes frequently. Common usages of marquee include stock tickers
    and ad banners. The primary difference between a marquee and a log
    is that logs usually have a meaningful order or sequence of
    important content changes. (Since: 2.12)
  */
  Marquee = 110,

  /**
      A text widget or container that holds a mathematical
    expression. (Since: 2.12)
  */
  Math = 111,

  /**
      A widget whose purpose is to display a rating,
    such as the number of stars associated with a song in a media
    player. Objects of this role should also implement
    AtkValue. (Since: 2.12)
  */
  Rating = 112,

  /**
      An object containing a numerical counter which
    indicates an amount of elapsed time from a start point, or the time
    remaining until an end point. (Since: 2.12)
  */
  Timer = 113,

  /**
      An object that represents a list of
    term-value groups. A term-value group represents a individual
    description and consist of one or more names
    (ATK_ROLE_DESCRIPTION_TERM) followed by one or more values
    (ATK_ROLE_DESCRIPTION_VALUE). For each list, there should not be
    more than one group with the same term name. (Since: 2.12)
  */
  DescriptionList = 114,

  /**
      An object that represents a term or phrase
    with a corresponding definition. (Since: 2.12)
  */
  DescriptionTerm = 115,

  /**
      An object that represents the
    description, definition or value of a term. (Since: 2.12)
  */
  DescriptionValue = 116,

  /**
      A generic non-container object whose purpose is to display a
    brief amount of information to the user and whose role is known by the
    implementor but lacks semantic value for the user. Examples in which
    [atk.types.Role.Static] is appropriate include the message displayed in a message box
    and an image used as an alternative means to display text. [atk.types.Role.Static]
    should not be applied to widgets which are traditionally interactive, objects
    which display a significant amount of content, or any object which has an
    accessible relation pointing to another object. Implementors should expose the
    displayed information through the accessible name of the object. If doing so seems
    inappropriate, it may indicate that a different role should be used. For
    labels which describe another widget, see [atk.types.Role.Label]. For text views, see
    [atk.types.Role.Text]. For generic containers, see [atk.types.Role.Panel]. For objects whose
    role is not known by the implementor, see [atk.types.Role.Unknown]. (Since: 2.16)
  */
  Static = 117,

  /**
      An object that represents a mathematical fraction.
    (Since: 2.16)
  */
  MathFraction = 118,

  /**
      An object that represents a mathematical expression
    displayed with a radical. (Since: 2.16)
  */
  MathRoot = 119,

  /**
      An object that contains text that is displayed as a
    subscript. (Since: 2.16)
  */
  Subscript = 120,

  /**
      An object that contains text that is displayed as a
    superscript. (Since: 2.16)
  */
  Superscript = 121,

  /**
      An object that contains the text of a footnote. (Since: 2.26)
  */
  Footnote = 122,

  /**
      Content previously deleted or proposed to be
    deleted, e.g. in revision history or a content view providing suggestions
    from reviewers. (Since: 2.34)
  */
  ContentDeletion = 123,

  /**
      Content previously inserted or proposed to be
    inserted, e.g. in revision history or a content view providing suggestions
    from reviewers. (Since: 2.34)
  */
  ContentInsertion = 124,

  /**
      A run of content that is marked or highlighted, such as for
    reference purposes, or to call it out as having a special purpose. If the
    marked content has an associated section in the document elaborating on the
    reason for the mark, then [atk.types.RelationType.Details] should be used on the mark
    to point to that associated section. In addition, the reciprocal relation
    [atk.types.RelationType.DetailsFor] should be used on the associated content section
    to point back to the mark. (Since: 2.36)
  */
  Mark = 125,

  /**
      A container for content that is called out as a proposed
    change from the current version of the document, such as by a reviewer of the
    content. This role should include either [atk.types.Role.ContentDeletion] and/or
    [atk.types.Role.ContentInsertion] children, in any order, to indicate what the
    actual change is. (Since: 2.36)
  */
  Suggestion = 126,

  /**
      A specialized push button to open a menu.
    (Since: 2.46)
  */
  PushButtonMenu = 127,

  /**
      not a valid role, used for finding end of the enumeration
  */
  LastDefined = 128,
}

/**
    Specifies where an object should be placed on the screen when using scroll_to.
*/
enum ScrollType
{
  /**
      Scroll the object vertically and horizontally to bring
      its top left corner to the top left corner of the window.
  */
  TopLeft = 0,

  /**
      Scroll the object vertically and horizontally to
      bring its bottom right corner to the bottom right corner of the window.
  */
  BottomRight = 1,

  /**
      Scroll the object vertically to bring its top edge to
      the top edge of the window.
  */
  TopEdge = 2,

  /**
      Scroll the object vertically to bring its bottom
      edge to the bottom edge of the window.
  */
  BottomEdge = 3,

  /**
      Scroll the object vertically and horizontally to bring
      its left edge to the left edge of the window.
  */
  LeftEdge = 4,

  /**
      Scroll the object vertically and horizontally to
      bring its right edge to the right edge of the window.
  */
  RightEdge = 5,

  /**
      Scroll the object vertically and horizontally so that
      as much as possible of the object becomes visible. The exact placement is
      determined by the application.
  */
  Anywhere = 6,
}

/**
    The possible types of states of an object
*/
enum StateType
{
  /**
      Indicates an invalid state - probably an error condition.
  */
  Invalid = 0,

  /**
      Indicates a window is currently the active window, or an object is the active subelement within a container or table. ATK_STATE_ACTIVE should not be used for objects which have ATK_STATE_FOCUSABLE or ATK_STATE_SELECTABLE: Those objects should use ATK_STATE_FOCUSED and ATK_STATE_SELECTED respectively. ATK_STATE_ACTIVE is a means to indicate that an object which is not focusable and not selectable is the currently-active item within its parent container.
  */
  Active = 1,

  /**
      Indicates that the object is 'armed', i.e. will be activated by if a pointer button-release event occurs within its bounds.  Buttons often enter this state when a pointer click occurs within their bounds, as a precursor to activation. ATK_STATE_ARMED has been deprecated since ATK-2.16 and should not be used in newly-written code.
  */
  Armed = 2,

  /**
      Indicates the current object is busy, i.e. onscreen representation is in the process of changing, or the object is temporarily unavailable for interaction due to activity already in progress.  This state may be used by implementors of Document to indicate that content loading is underway.  It also may indicate other 'pending' conditions; clients may wish to interrogate this object when the ATK_STATE_BUSY flag is removed.
  */
  Busy = 3,

  /**
      Indicates this object is currently checked, for instance a checkbox is 'non-empty'.
  */
  Checked = 4,

  /**
      Indicates that this object no longer has a valid backing widget (for instance, if its peer object has been destroyed)
  */
  Defunct = 5,

  /**
      Indicates that this object can contain text, and that the
    user can change the textual contents of this object by editing those contents
    directly. For an object which is expected to be editable due to its type, but
    which cannot be edited due to the application or platform preventing the user
    from doing so, that object's #AtkStateSet should lack ATK_STATE_EDITABLE and
    should contain ATK_STATE_READ_ONLY.
  */
  Editable = 6,

  /**
      Indicates that this object is enabled, i.e. that it currently reflects some application state. Objects that are "greyed out" may lack this state, and may lack the STATE_SENSITIVE if direct user interaction cannot cause them to acquire STATE_ENABLED. See also: ATK_STATE_SENSITIVE
  */
  Enabled = 7,

  /**
      Indicates this object allows progressive disclosure of its children
  */
  Expandable = 8,

  /**
      Indicates this object its expanded - see ATK_STATE_EXPANDABLE above
  */
  Expanded = 9,

  /**
      Indicates this object can accept keyboard focus, which means all events resulting from typing on the keyboard will normally be passed to it when it has focus
  */
  Focusable = 10,

  /**
      Indicates this object currently has the keyboard focus
  */
  Focused = 11,

  /**
      Indicates the orientation of this object is horizontal; used, for instance, by objects of ATK_ROLE_SCROLL_BAR.  For objects where vertical/horizontal orientation is especially meaningful.
  */
  Horizontal = 12,

  /**
      Indicates this object is minimized and is represented only by an icon
  */
  Iconified = 13,

  /**
      Indicates something must be done with this object before the user can interact with an object in a different window
  */
  Modal = 14,

  /**
      Indicates this (text) object can contain multiple lines of text
  */
  MultiLine = 15,

  /**
      Indicates this object allows more than one of its children to be selected at the same time, or in the case of text objects, that the object supports non-contiguous text selections.
  */
  Multiselectable = 16,

  /**
      Indicates this object paints every pixel within its rectangular region.
  */
  Opaque = 17,

  /**
      Indicates this object is currently pressed.
  */
  Pressed = 18,

  /**
      Indicates the size of this object is not fixed
  */
  Resizable = 19,

  /**
      Indicates this object is the child of an object that allows its children to be selected and that this child is one of those children that can be selected
  */
  Selectable = 20,

  /**
      Indicates this object is the child of an object that allows its children to be selected and that this child is one of those children that has been selected
  */
  Selected = 21,

  /**
      Indicates this object is sensitive, e.g. to user interaction.
    STATE_SENSITIVE usually accompanies STATE_ENABLED for user-actionable controls,
    but may be found in the absence of STATE_ENABLED if the current visible state of the
    control is "disconnected" from the application state.  In such cases, direct user interaction
    can often result in the object gaining STATE_SENSITIVE, for instance if a user makes
    an explicit selection using an object whose current state is ambiguous or undefined.
    @see STATE_ENABLED, STATE_INDETERMINATE.
  */
  Sensitive = 22,

  /**
      Indicates this object, the object's parent, the object's parent's parent, and so on,
    are all 'shown' to the end-user, i.e. subject to "exposure" if blocking or obscuring objects do not interpose
    between this object and the top of the window stack.
  */
  Showing = 23,

  /**
      Indicates this (text) object can contain only a single line of text
  */
  SingleLine = 24,

  /**
      Indicates that the information returned for this object may no longer be
    synchronized with the application state.  This is implied if the object has STATE_TRANSIENT,
    and can also occur towards the end of the object peer's lifecycle. It can also be used to indicate that
    the index associated with this object has changed since the user accessed the object (in lieu of
    "index-in-parent-changed" events).
  */
  Stale = 25,

  /**
      Indicates this object is transient, i.e. a snapshot which may not emit events when its
    state changes.  Data from objects with ATK_STATE_TRANSIENT should not be cached, since there may be no
    notification given when the cached data becomes obsolete.
  */
  Transient = 26,

  /**
      Indicates the orientation of this object is vertical
  */
  Vertical = 27,

  /**
      Indicates this object is visible, e.g. has been explicitly marked for exposure to the user.
    **note**: [atk.types.StateType.Visible] is no guarantee that the object is actually unobscured on the screen, only
    that it is 'potentially' visible, barring obstruction, being scrolled or clipped out of the
    field of view, or having an ancestor container that has not yet made visible.
    A widget is potentially onscreen if it has both [atk.types.StateType.Visible] and [atk.types.StateType.Showing].
    The absence of [atk.types.StateType.Visible] and [atk.types.StateType.Showing] is semantically equivalent to saying
    that an object is 'hidden'.  See also [atk.types.StateType.Truncated], which applies if an object with
    [atk.types.StateType.Visible] and [atk.types.StateType.Showing] set lies within a viewport which means that its
    contents are clipped, e.g. a truncated spreadsheet cell or
    an image within a scrolling viewport.  Mostly useful for screen-review and magnification
    algorithms.
  */
  Visible = 28,

  /**
      Indicates that "active-descendant-changed" event
    is sent when children become 'active' (i.e. are selected or navigated to onscreen).
    Used to prevent need to enumerate all children in very large containers, like tables.
    The presence of STATE_MANAGES_DESCENDANTS is an indication to the client.
    that the children should not, and need not, be enumerated by the client.
    Objects implementing this state are expected to provide relevant state
    notifications to listening clients, for instance notifications of visibility
    changes and activation of their contained child objects, without the client
    having previously requested references to those children.
  */
  ManagesDescendants = 29,

  /**
      Indicates that the value, or some other quantifiable
    property, of this AtkObject cannot be fully determined. In the case of a large
    data set in which the total number of items in that set is unknown (e.g. 1 of
    999+), implementors should expose the currently-known set size (999) along
    with this state. In the case of a check box, this state should be used to
    indicate that the check box is a tri-state check box which is currently
    neither checked nor unchecked.
  */
  Indeterminate = 30,

  /**
      Indicates that an object is truncated, e.g. a text value in a speradsheet cell.
  */
  Truncated = 31,

  /**
      Indicates that explicit user interaction with an object is required by the user interface, e.g. a required field in a "web-form" interface.
  */
  Required = 32,

  /**
      Indicates that the object has encountered an error condition due to failure of input validation. For instance, a form control may acquire this state in response to invalid or malformed user input.
  */
  InvalidEntry = 33,

  /**
      Indicates that the object in question implements some form of ¨typeahead¨ or
    pre-selection behavior whereby entering the first character of one or more sub-elements
    causes those elements to scroll into view or become selected.  Subsequent character input
    may narrow the selection further as long as one or more sub-elements match the string.
    This state is normally only useful and encountered on objects that implement Selection.
    In some cases the typeahead behavior may result in full or partial ¨completion¨ of
    the data in the input field, in which case these input events may trigger text-changed
    events from the AtkText interface.  This state supplants @ATK_ROLE_AUTOCOMPLETE.
  */
  SupportsAutocompletion = 34,

  /**
      Indicates that the object in question supports text selection. It should only be exposed on objects which implement the Text interface, in order to distinguish this state from @ATK_STATE_SELECTABLE, which infers that the object in question is a selectable child of an object which implements Selection. While similar, text selection and subelement selection are distinct operations.
  */
  SelectableText = 35,

  /**
      Indicates that the object is the "default" active component, i.e. the object which is activated by an end-user press of the "Enter" or "Return" key.  Typically a "close" or "submit" button.
  */
  Default = 36,

  /**
      Indicates that the object changes its appearance dynamically as an inherent part of its presentation.  This state may come and go if an object is only temporarily animated on the way to a 'final' onscreen presentation.
    **note**: some applications, notably content viewers, may not be able to detect
    all kinds of animated content.  Therefore the absence of this state should not
    be taken as definitive evidence that the object's visual representation is
    static; this state is advisory.
  */
  Animated = 37,

  /**
      Indicates that the object (typically a hyperlink) has already been 'activated', and/or its backing data has already been downloaded, rendered, or otherwise "visited".
  */
  Visited = 38,

  /**
      Indicates this object has the potential to be
     checked, such as a checkbox or toggle-able table cell. @Since:
     ATK-2.12
  */
  Checkable = 39,

  /**
      Indicates that the object has a popup context
    menu or sub-level menu which may or may not be showing. This means
    that activation renders conditional content.  Note that ordinary
    tooltips are not considered popups in this context. @Since: ATK-2.12
  */
  HasPopup = 40,

  /**
      Indicates this object has a tooltip. @Since: ATK-2.16
  */
  HasTooltip = 41,

  /**
      Indicates that a widget which is ENABLED and SENSITIVE
    has a value which can be read, but not modified, by the user. Note that this
    state should only be applied to widget types whose value is normally directly
    user modifiable, such as check boxes, radio buttons, spin buttons, text input
    fields, and combo boxes, as a means to convey that the expected interaction
    with that widget is not possible. When the expected interaction with a
    widget does not include modification by the user, as is the case with
    labels and containers, ATK_STATE_READ_ONLY should not be applied. See also
    ATK_STATE_EDITABLE. @Since: ATK-2-16
  */
  ReadOnly = 42,

  /**
      Indicates this object is collapsed. @Since: ATK-2.38
  */
  Collapsed = 43,

  /**
      Not a valid state, used for finding end of enumeration
  */
  LastDefined = 44,
}

/**
    Describes the text attributes supported
*/
enum TextAttribute
{
  /**
      Invalid attribute, like bad spelling or grammar.
  */
  Invalid = 0,

  /**
      The pixel width of the left margin
  */
  LeftMargin = 1,

  /**
      The pixel width of the right margin
  */
  RightMargin = 2,

  /**
      The number of pixels that the text is indented
  */
  Indent = 3,

  /**
      Either "true" or "false" indicating whether text is visible or not
  */
  Invisible = 4,

  /**
      Either "true" or "false" indicating whether text is editable or not
  */
  Editable = 5,

  /**
      Pixels of blank space to leave above each newline-terminated line.
  */
  PixelsAboveLines = 6,

  /**
      Pixels of blank space to leave below each newline-terminated line.
  */
  PixelsBelowLines = 7,

  /**
      Pixels of blank space to leave between wrapped lines inside the same newline-terminated line (paragraph).
  */
  PixelsInsideWrap = 8,

  /**
      "true" or "false" whether to make the background color for each character the height of the highest font used on the current line, or the height of the font used for the current character.
  */
  BgFullHeight = 9,

  /**
      Number of pixels that the characters are risen above the baseline. See also ATK_TEXT_ATTR_TEXT_POSITION.
  */
  Rise = 10,

  /**
      "none", "single", "double", "low", or "error"
  */
  Underline = 11,

  /**
      "true" or "false" whether the text is strikethrough
  */
  Strikethrough = 12,

  /**
      The size of the characters in points. eg: 10
  */
  Size = 13,

  /**
      The scale of the characters. The value is a string representation of a double
  */
  Scale = 14,

  /**
      The weight of the characters.
  */
  Weight = 15,

  /**
      The language used
  */
  Language = 16,

  /**
      The font family name
  */
  FamilyName = 17,

  /**
      The background color. The value is an RGB value of the format "`u`,`u`,`u`"
  */
  BgColor = 18,

  /**
      The foreground color. The value is an RGB value of the format "`u`,`u`,`u`"
  */
  FgColor = 19,

  /**
      "true" if a #GdkBitmap is set for stippling the background color.
  */
  BgStipple = 20,

  /**
      "true" if a #GdkBitmap is set for stippling the foreground color.
  */
  FgStipple = 21,

  /**
      The wrap mode of the text, if any. Values are "none", "char", "word", or "word_char".
  */
  WrapMode = 22,

  /**
      The direction of the text, if set. Values are "none", "ltr" or "rtl"
  */
  Direction = 23,

  /**
      The justification of the text, if set. Values are "left", "right", "center" or "fill"
  */
  Justification = 24,

  /**
      The stretch of the text, if set. Values are "ultra_condensed", "extra_condensed", "condensed", "semi_condensed", "normal", "semi_expanded", "expanded", "extra_expanded" or "ultra_expanded"
  */
  Stretch = 25,

  /**
      The capitalization variant of the text, if set. Values are "normal" or "small_caps"
  */
  Variant = 26,

  /**
      The slant style of the text, if set. Values are "normal", "oblique" or "italic"
  */
  Style = 27,

  /**
      The vertical position with respect to the baseline. Values are "baseline", "super", or "sub". Note that a super or sub text attribute refers to position with respect to the baseline of the prior character.
  */
  TextPosition = 28,

  /**
      not a valid text attribute, used for finding end of enumeration
  */
  LastDefined = 29,
}

/**
    Text boundary types used for specifying boundaries for regions of text.
  This enumeration is deprecated since 2.9.4 and should not be used. Use
  AtkTextGranularity with #atk_text_get_string_at_offset instead.
*/
enum TextBoundary
{
  /**
      Boundary is the boundary between characters
    (including non-printing characters)
  */
  Char = 0,

  /**
      Boundary is the start (i.e. first character) of a word.
  */
  WordStart = 1,

  /**
      Boundary is the end (i.e. last
    character) of a word.
  */
  WordEnd = 2,

  /**
      Boundary is the first character in a sentence.
  */
  SentenceStart = 3,

  /**
      Boundary is the last (terminal)
    character in a sentence; in languages which use "sentence stop"
    punctuation such as English, the boundary is thus the '.', '?', or
    similar terminal punctuation character.
  */
  SentenceEnd = 4,

  /**
      Boundary is the initial character of the content or a
    character immediately following a newline, linefeed, or return character.
  */
  LineStart = 5,

  /**
      Boundary is the linefeed, or return
    character.
  */
  LineEnd = 6,
}

/**
    Describes the type of clipping required.
*/
enum TextClipType
{
  /**
      No clipping to be done
  */
  None = 0,

  /**
      Text clipped by min coordinate is omitted
  */
  Min = 1,

  /**
      Text clipped by max coordinate is omitted
  */
  Max = 2,

  /**
      Only text fully within mix/max bound is retained
  */
  Both = 3,
}

/**
    Text granularity types used for specifying the granularity of the region of
  text we are interested in.
*/
enum TextGranularity
{
  /**
      Granularity is defined by the boundaries between characters
    (including non-printing characters)
  */
  Char = 0,

  /**
      Granularity is defined by the boundaries of a word,
    starting at the beginning of the current word and finishing at the beginning of
    the following one, if present.
  */
  Word = 1,

  /**
      Granularity is defined by the boundaries of a sentence,
    starting at the beginning of the current sentence and finishing at the beginning of
    the following one, if present.
  */
  Sentence = 2,

  /**
      Granularity is defined by the boundaries of a line,
    starting at the beginning of the current line and finishing at the beginning of
    the following one, if present.
  */
  Line = 3,

  /**
      Granularity is defined by the boundaries of a paragraph,
    starting at the beginning of the current paragraph and finishing at the beginning of
    the following one, if present.
  */
  Paragraph = 4,
}

/**
    Default types for a given value. Those are defined in order to
  easily get localized strings to describe a given value or a given
  subrange, using [atk.global.valueTypeGetLocalizedName].
*/
enum ValueType
{
  /** */
  VeryWeak = 0,

  /** */
  Weak = 1,

  /** */
  Acceptable = 2,

  /** */
  Strong = 3,

  /** */
  VeryStrong = 4,

  /** */
  VeryLow = 5,

  /** */
  Low = 6,

  /** */
  Medium = 7,

  /** */
  High = 8,

  /** */
  VeryHigh = 9,

  /** */
  VeryBad = 10,

  /** */
  Bad = 11,

  /** */
  Good = 12,

  /** */
  VeryGood = 13,

  /** */
  Best = 14,

  /** */
  LastDefined = 15,
}

/**
    Like [atk.global.getBinaryAge], but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum BINARY_AGE = 25210;

/**
    Like [atk.global.getInterfaceAge], but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum INTERFACE_AGE = 1;

/**
    Like [atk.global.getMajorVersion], but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum MAJOR_VERSION = 2;

/**
    Like [atk.global.getMicroVersion], but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum MICRO_VERSION = 0;

/**
    Like [atk.global.getMinorVersion], but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum MINOR_VERSION = 52;

/**
    A macro that should be defined by the user prior to including
  the atk/atk.h header.
  The definition should be one of the predefined ATK version
  macros: `ATK_VERSION_2_12`, `ATK_VERSION_2_14`,...
  
  This macro defines the earliest version of ATK that the package is
  required to be able to compile against.
  
  If the compiler is configured to warn about the use of deprecated
  functions, then using functions that were deprecated in version
  `ATK_VERSION_MIN_REQUIRED` or earlier will cause warnings (but
  using functions deprecated in later releases will not).
*/
enum VERSION_MIN_REQUIRED = 2;
