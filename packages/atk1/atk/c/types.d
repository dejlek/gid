module atk.c.types;

public import gid.basictypes;
public import gobject.c.types;
import atk.types;

/**
    This is a singly-linked list (a #GSList) of #AtkAttribute. It is
  used by [atk.text.Text.getRunAttributes],
  [atk.text.Text.getDefaultAttributes],
  [atk.editable_text.EditableText.setRunAttributes],
  [atk.document.Document.getAttributes] and [atk.object.ObjectAtk.getAttributes]
*/
alias AtkAttributeSet = GSList;

/**
    An AtkState describes a single state of an object.
  
  An AtkState describes a single state of an object. The full set of states
  that apply to an object at a given time are contained in its #AtkStateSet.
  
  See `id@atk_object_ref_state_set` and `id@atk_object_notify_state_change`
*/
alias AtkState = ulong;


// Enums
alias AtkCoordType = atk.types.CoordType;
alias AtkHyperlinkStateFlags = atk.types.HyperlinkStateFlags;
alias AtkKeyEventType = atk.types.KeyEventType;
alias AtkLayer = atk.types.Layer;
alias AtkLive = atk.types.Live;
alias AtkRelationType = atk.types.RelationType;
alias AtkRole = atk.types.Role;
alias AtkScrollType = atk.types.ScrollType;
alias AtkStateType = atk.types.StateType;
alias AtkTextAttribute = atk.types.TextAttribute;
alias AtkTextBoundary = atk.types.TextBoundary;
alias AtkTextClipType = atk.types.TextClipType;
alias AtkTextGranularity = atk.types.TextGranularity;
alias AtkValueType = atk.types.ValueType;
/**
    The ATK interface provided by UI components
  which the user can activate/interact with.
  
  #AtkAction should be implemented by instances of #AtkObject classes
  with which the user can interact directly, i.e. buttons,
  checkboxes, scrollbars, e.g. components which are not "passive"
  providers of UI information.
  
  Exceptions: when the user interaction is already covered by another
  appropriate interface such as #AtkEditableText (insert/delete text,
  etc.) or #AtkValue (set value) then these actions should not be
  exposed by #AtkAction as well.
  
  Though most UI interactions on components should be invocable via
  keyboard as well as mouse, there will generally be a close mapping
  between "mouse actions" that are possible on a component and the
  AtkActions.  Where mouse and keyboard actions are redundant in
  effect, #AtkAction should expose only one action rather than
  exposing redundant actions if possible.  By convention we have been
  using "mouse centric" terminology for #AtkAction names.
*/
struct AtkAction;

/**
    The #AtkAction interface should be supported by any object that can
  perform one or more actions. The interface provides the standard
  mechanism for an assistive technology to determine what those actions
  are as well as tell the object to perform them. Any object that can
  be manipulated should support this interface.
*/
struct AtkActionIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) bool function(AtkAction* action, int i) doAction;

  /** */
  extern(C) int function(AtkAction* action) getNActions;

  /** */
  extern(C) const(char)* function(AtkAction* action, int i) getDescription;

  /** */
  extern(C) const(char)* function(AtkAction* action, int i) getName;

  /** */
  extern(C) const(char)* function(AtkAction* action, int i) getKeybinding;

  /** */
  extern(C) bool function(AtkAction* action, int i, const(char)* desc) setDescription;

  /** */
  extern(C) const(char)* function(AtkAction* action, int i) getLocalizedName;
}

/**
    AtkAttribute is a string name/value pair representing a generic
  attribute. This can be used to expose additional information from
  an accessible object as a whole (see [atk.object.ObjectAtk.getAttributes])
  or an document (see [atk.document.Document.getAttributes]). In the case of
  text attributes (see [atk.text.Text.getDefaultAttributes]),
  #AtkTextAttribute enum defines all the possible text attribute
  names. You can use [atk.global.textAttributeGetName] to get the string
  name from the enum value. See also [atk.global.textAttributeForName]
  and [atk.global.textAttributeGetValue] for more information.
  
  A string name/value pair representing a generic attribute.
*/
struct AtkAttribute
{
  /**
      The attribute name.
  */
  char* name;

  /**
      the value of the attribute, represented as a string.
  */
  char* value;
}

/**
    The ATK interface provided by UI components
  which occupy a physical area on the screen.
  which the user can activate/interact with.
  
  #AtkComponent should be implemented by most if not all UI elements
  with an actual on-screen presence, i.e. components which can be
  said to have a screen-coordinate bounding box.  Virtually all
  widgets will need to have #AtkComponent implementations provided
  for their corresponding #AtkObject class.  In short, only UI
  elements which are *not* GUI elements will omit this ATK interface.
  
  A possible exception might be textual information with a
  transparent background, in which case text glyph bounding box
  information is provided by #AtkText.
*/
struct AtkComponent;

/**
    The AtkComponent interface should be supported by any object that is
  rendered on the screen. The interface provides the standard mechanism
  for an assistive technology to determine and set the graphical
  representation of an object.
*/
struct AtkComponentIface
{
  /** */
  GTypeInterface parent;

  /**
      This virtual function is deprecated since 2.9.4
      and it should not be overriden. See [atk.component.Component.addFocusHandler]
      for more information.
  */
  extern(C) uint function(AtkComponent* component, AtkFocusHandler handler) addFocusHandler;

  /** */
  extern(C) bool function(AtkComponent* component, int x, int y, AtkCoordType coordType) contains;

  /** */
  extern(C) AtkObject* function(AtkComponent* component, int x, int y, AtkCoordType coordType) refAccessibleAtPoint;

  /** */
  extern(C) void function(AtkComponent* component, int* x, int* y, int* width, int* height, AtkCoordType coordType) getExtents;

  /**
      This virtual function is deprecated since 2.12 and
      it should not be overriden. Use @AtkComponentIface.get_extents instead.
  */
  extern(C) void function(AtkComponent* component, int* x, int* y, AtkCoordType coordType) getPosition;

  /**
      This virtual function is deprecated since 2.12 and it
      should not be overriden. Use @AtkComponentIface.get_extents instead.
  */
  extern(C) void function(AtkComponent* component, int* width, int* height) getSize;

  /** */
  extern(C) bool function(AtkComponent* component) grabFocus;

  /**
      This virtual function is deprecated since
      2.9.4 and it should not be overriden. See [atk.component.Component.removeFocusHandler]
      for more information.
  */
  extern(C) void function(AtkComponent* component, uint handlerId) removeFocusHandler;

  /** */
  extern(C) bool function(AtkComponent* component, int x, int y, int width, int height, AtkCoordType coordType) setExtents;

  /** */
  extern(C) bool function(AtkComponent* component, int x, int y, AtkCoordType coordType) setPosition;

  /** */
  extern(C) bool function(AtkComponent* component, int width, int height) setSize;

  /** */
  extern(C) AtkLayer function(AtkComponent* component) getLayer;

  /** */
  extern(C) int function(AtkComponent* component) getMdiZorder;

  /** */
  extern(C) void function(AtkComponent* component, AtkRectangle* bounds) boundsChanged;

  /** */
  extern(C) double function(AtkComponent* component) getAlpha;

  /** */
  extern(C) bool function(AtkComponent* component, AtkScrollType type) scrollTo;

  /** */
  extern(C) bool function(AtkComponent* component, AtkCoordType coords, int x, int y) scrollToPoint;
}

/**
    The ATK interface which represents the toplevel
   container for document content.
  
  The AtkDocument interface should be supported by any object whose
  content is a representation or view of a document.  The AtkDocument
  interface should appear on the toplevel container for the document
  content; however AtkDocument instances may be nested (i.e. an
  AtkDocument may be a descendant of another AtkDocument) in those
  cases where one document contains "embedded content" which can
  reasonably be considered a document in its own right.
*/
struct AtkDocument;

/** */
struct AtkDocumentIface
{
  /** */
  GTypeInterface parent;

  /**
      gets a string indicating the document
      type. This virtual function is deprecated since 2.12 and it
      should not be overriden.
  */
  extern(C) const(char)* function(AtkDocument* document) getDocumentType;

  /**
      a #GObject instance that implements
      AtkDocumentIface. This virtual method is deprecated since 2.12
      and it should not be overriden.
  */
  extern(C) void* function(AtkDocument* document) getDocument;

  /**
      gets locale. This virtual function is
      deprecated since 2.7.90 and it should not be overriden.
  */
  extern(C) const(char)* function(AtkDocument* document) getDocumentLocale;

  /**
      gets an AtkAttributeSet which describes
      document-wide attributes as name-value pairs.
  */
  extern(C) AtkAttributeSet* function(AtkDocument* document) getDocumentAttributes;

  /**
      returns a string value assocciated
      with the named attribute for this document, or NULL
  */
  extern(C) const(char)* function(AtkDocument* document, const(char)* attributeName) getDocumentAttributeValue;

  /**
      sets the value of an attribute. Returns
      TRUE on success, FALSE otherwise
  */
  extern(C) bool function(AtkDocument* document, const(char)* attributeName, const(char)* attributeValue) setDocumentAttribute;

  /**
      gets the current page number. Since 2.12
  */
  extern(C) int function(AtkDocument* document) getCurrentPageNumber;

  /**
      gets the page count of the document. Since 2.12
  */
  extern(C) int function(AtkDocument* document) getPageCount;

  /** */
  extern(C) GArray* function(AtkDocument* document) getTextSelections;

  /** */
  extern(C) bool function(AtkDocument* document, GArray* selections) setTextSelections;
}

/**
    The ATK interface implemented by components containing user-editable text content.
  
  #AtkEditableText should be implemented by UI components which
  contain text which the user can edit, via the #AtkObject
  corresponding to that component (see #AtkObject).
  
  #AtkEditableText is a subclass of #AtkText, and as such, an object
  which implements #AtkEditableText is by definition an #AtkText
  implementor as well.
  
  See `iface@AtkText`
*/
struct AtkEditableText;

/** */
struct AtkEditableTextIface
{
  /** */
  GTypeInterface parentInterface;

  /** */
  extern(C) bool function(AtkEditableText* text, AtkAttributeSet* attribSet, int startOffset, int endOffset) setRunAttributes;

  /** */
  extern(C) void function(AtkEditableText* text, const(char)* string_) setTextContents;

  /** */
  extern(C) void function(AtkEditableText* text, const(char)* string_, int length, int* position) insertText;

  /** */
  extern(C) void function(AtkEditableText* text, int startPos, int endPos) copyText;

  /** */
  extern(C) void function(AtkEditableText* text, int startPos, int endPos) cutText;

  /** */
  extern(C) void function(AtkEditableText* text, int startPos, int endPos) deleteText;

  /** */
  extern(C) void function(AtkEditableText* text, int position) pasteText;
}

/**
    This object class is derived from AtkObject and can be used as a basis implementing accessible objects.
  
  This object class is derived from AtkObject. It can be used as a
  basis for implementing accessible objects for GObjects which are
  not derived from GtkWidget. One example of its use is in providing
  an accessible object for GnomeCanvasItem in the GAIL library.
*/
struct AtkGObjectAccessible
{
  /** */
  AtkObject parent;
}

/** */
struct AtkGObjectAccessibleClass
{
  /** */
  AtkObjectClass parentClass;

  /** */
  AtkFunction pad1;

  /** */
  AtkFunction pad2;
}

/**
    An ATK object which encapsulates a link or set of links in a hypertext document.
  
  An ATK object which encapsulates a link or set of links (for
  instance in the case of client-side image maps) in a hypertext
  document.  It may implement the AtkAction interface.  AtkHyperlink
  may also be used to refer to inline embedded content, since it
  allows specification of a start and end offset within the host
  AtkHypertext object.
*/
struct AtkHyperlink
{
  /** */
  ObjectC parent;
}

/** */
struct AtkHyperlinkClass
{
  /** */
  GObjectClass parent;

  /** */
  extern(C) char* function(AtkHyperlink* link, int i) getUri;

  /** */
  extern(C) AtkObject* function(AtkHyperlink* link, int i) getObject;

  /** */
  extern(C) int function(AtkHyperlink* link) getEndIndex;

  /** */
  extern(C) int function(AtkHyperlink* link) getStartIndex;

  /** */
  extern(C) bool function(AtkHyperlink* link) isValid;

  /** */
  extern(C) int function(AtkHyperlink* link) getNAnchors;

  /** */
  extern(C) uint function(AtkHyperlink* link) linkState;

  /** */
  extern(C) bool function(AtkHyperlink* link) isSelectedLink;

  /** */
  extern(C) void function(AtkHyperlink* link) linkActivated;

  /** */
  AtkFunction pad1;
}

/**
    A queryable interface which allows AtkHyperlink instances
  associated with an AtkObject to be obtained.  AtkHyperlinkImpl
  corresponds to AT-SPI's Hyperlink interface, and differs from
  AtkHyperlink in that AtkHyperlink is an object type, rather than an
  interface, and thus cannot be directly queried. FTW
*/
struct AtkHyperlinkImpl;

/** */
struct AtkHyperlinkImplIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) AtkHyperlink* function(AtkHyperlinkImpl* impl) getHyperlink;
}

/**
    The ATK interface which provides standard mechanism for manipulating hyperlinks.
  
  An interface used for objects which implement linking between
  multiple resource or content locations, or multiple 'markers'
  within a single document.  A Hypertext instance is associated with
  one or more Hyperlinks, which are associated with particular
  offsets within the Hypertext's included content.  While this
  interface is derived from Text, there is no requirement that
  Hypertext instances have textual content; they may implement Image
  as well, and Hyperlinks need not have non-zero text offsets.
*/
struct AtkHypertext;

/** */
struct AtkHypertextIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) AtkHyperlink* function(AtkHypertext* hypertext, int linkIndex) getLink;

  /** */
  extern(C) int function(AtkHypertext* hypertext) getNLinks;

  /** */
  extern(C) int function(AtkHypertext* hypertext, int charIndex) getLinkIndex;

  /** */
  extern(C) void function(AtkHypertext* hypertext, int linkIndex) linkSelected;
}

/**
    The ATK Interface implemented by components
   which expose image or pixmap content on-screen.
  
  #AtkImage should be implemented by #AtkObject subtypes on behalf of
  components which display image/pixmap information onscreen, and
  which provide information (other than just widget borders, etc.)
  via that image content.  For instance, icons, buttons with icons,
  toolbar elements, and image viewing panes typically should
  implement #AtkImage.
  
  #AtkImage primarily provides two types of information: coordinate
  information (useful for screen review mode of screenreaders, and
  for use by onscreen magnifiers), and descriptive information.  The
  descriptive information is provided for alternative, text-only
  presentation of the most significant information present in the
  image.
*/
struct AtkImage;

/** */
struct AtkImageIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) void function(AtkImage* image, int* x, int* y, AtkCoordType coordType) getImagePosition;

  /** */
  extern(C) const(char)* function(AtkImage* image) getImageDescription;

  /** */
  extern(C) void function(AtkImage* image, int* width, int* height) getImageSize;

  /** */
  extern(C) bool function(AtkImage* image, const(char)* description) setImageDescription;

  /** */
  extern(C) const(char)* function(AtkImage* image) getImageLocale;
}

/** */
struct AtkImplementor;

/**
    The AtkImplementor interface is implemented by objects for which
  AtkObject peers may be obtained via calls to
  iface->(ref_accessible)(implementor);
*/
struct AtkImplementorIface;

/**
    Encapsulates information about a key event.
*/
struct AtkKeyEventStruct
{
  /**
      An AtkKeyEventType, generally one of ATK_KEY_EVENT_PRESS or ATK_KEY_EVENT_RELEASE
  */
  int type;

  /**
      A bitmask representing the state of the modifier keys immediately after the event takes place.
    The meaning of the bits is currently defined to match the bitmask used by GDK in
    GdkEventType.state, see
    http://developer.gnome.org/doc/API/2.0/gdk/gdk-Event-Structures.html#GdkEventKey
  */
  uint state;

  /**
      A guint representing a keysym value corresponding to those used by GDK and X11: see
    /usr/X11/include/keysymdef.h.
  */
  uint keyval;

  /**
      The length of member #string.
  */
  int length;

  /**
      A string containing one of the following: either a string approximating the text that would
    result from this keypress, if the key is a control or graphic character, or a symbolic name for this keypress.
    Alphanumeric and printable keys will have the symbolic key name in this string member, for instance "A". "0",
    "semicolon", "aacute".  Keypad keys have the prefix "KP".
  */
  char* string_;

  /**
      The raw hardware code that generated the key event.  This field is raraly useful.
  */
  ushort keycode;

  /**
      A timestamp in milliseconds indicating when the event occurred.
    These timestamps are relative to a starting point which should be considered arbitrary,
    and only used to compare the dispatch times of events to one another.
  */
  uint timestamp;
}

/**
    A set of ATK utility functions for thread locking
  
  A set of utility functions for thread locking. This interface and
  all his related methods are deprecated since 2.12.
*/
struct AtkMisc
{
  /** */
  ObjectC parent;
}

/**
    Usage of AtkMisc is deprecated since 2.12 and heavily discouraged.
*/
struct AtkMiscClass
{
  /** */
  GObjectClass parent;

  /**
      This virtual function is deprecated since 2.12 and
      it should not be overriden.
  */
  extern(C) void function(AtkMisc* misc) threadsEnter;

  /**
      This virtual function is deprecated sice 2.12 and
      it should not be overriden.
  */
  extern(C) void function(AtkMisc* misc) threadsLeave;

  /** */
  void*[32] vfuncs;
}

/**
    An AtkObject which purports to implement all ATK interfaces.
  
  An AtkNoOpObject is an AtkObject which purports to implement all
  ATK interfaces. It is the type of AtkObject which is created if an
  accessible object is requested for an object type for which no
  factory type is specified.
*/
struct AtkNoOpObject
{
  /** */
  AtkObject parent;
}

/** */
struct AtkNoOpObjectClass
{
  /** */
  AtkObjectClass parentClass;
}

/**
    The AtkObjectFactory which creates an AtkNoOpObject.
  
  The AtkObjectFactory which creates an AtkNoOpObject. An instance of
  this is created by an AtkRegistry if no factory type has not been
  specified to create an accessible object of a particular type.
*/
struct AtkNoOpObjectFactory
{
  /** */
  AtkObjectFactory parent;
}

/** */
struct AtkNoOpObjectFactoryClass
{
  /** */
  AtkObjectFactoryClass parentClass;
}

/**
    The base object class for the Accessibility Toolkit API.
  
  This class is the primary class for accessibility support via the
  Accessibility ToolKit (ATK).  Objects which are instances of
  #AtkObject (or instances of AtkObject-derived types) are queried
  for properties which relate basic (and generic) properties of a UI
  component such as name and description.  Instances of #AtkObject
  may also be queried as to whether they implement other ATK
  interfaces (e.g. #AtkAction, #AtkComponent, etc.), as appropriate
  to the role which a given UI component plays in a user interface.
  
  All UI components in an application which provide useful
  information or services to the user must provide corresponding
  #AtkObject instances on request (in GTK+, for instance, usually on
  a call to #gtk_widget_get_accessible ()), either via ATK support
  built into the toolkit for the widget class or ancestor class, or
  in the case of custom widgets, if the inherited #AtkObject
  implementation is insufficient, via instances of a new #AtkObject
  subclass.
  
  See `class@AtkObjectFactory`, `class@AtkRegistry`.  (GTK+ users see also
  #GtkAccessible).
*/
struct AtkObject
{
  /** */
  ObjectC parent;

  /** */
  char* description;

  /** */
  char* name;

  /** */
  AtkObject* accessibleParent;

  /** */
  AtkRole role;

  /** */
  AtkRelationSet* relationSet;

  /** */
  AtkLayer layer;
}

/** */
struct AtkObjectClass
{
  /** */
  GObjectClass parent;

  /** */
  extern(C) const(char)* function(AtkObject* accessible) getName;

  /** */
  extern(C) const(char)* function(AtkObject* accessible) getDescription;

  /** */
  extern(C) AtkObject* function(AtkObject* accessible) getParent;

  /** */
  extern(C) int function(AtkObject* accessible) getNChildren;

  /** */
  extern(C) AtkObject* function(AtkObject* accessible, int i) refChild;

  /** */
  extern(C) int function(AtkObject* accessible) getIndexInParent;

  /** */
  extern(C) AtkRelationSet* function(AtkObject* accessible) refRelationSet;

  /** */
  extern(C) AtkRole function(AtkObject* accessible) getRole;

  /** */
  extern(C) AtkLayer function(AtkObject* accessible) getLayer;

  /** */
  extern(C) int function(AtkObject* accessible) getMdiZorder;

  /** */
  extern(C) AtkStateSet* function(AtkObject* accessible) refStateSet;

  /** */
  extern(C) void function(AtkObject* accessible, const(char)* name) setName;

  /** */
  extern(C) void function(AtkObject* accessible, const(char)* description) setDescription;

  /** */
  extern(C) void function(AtkObject* accessible, AtkObject* parent) setParent;

  /** */
  extern(C) void function(AtkObject* accessible, AtkRole role) setRole;

  /**
      specifies a function to be called
      when a property changes value. This virtual function is
      deprecated since 2.12 and it should not be overriden. Connect
      directly to property-change or notify signal instead.
  */
  extern(C) uint function(AtkObject* accessible, AtkPropertyChangeHandler* handler) connectPropertyChangeHandler;

  /**
      removes a property changed handler
      as returned by @connect_property_change_handler. This virtual
      function is deprecated sice 2.12 and it should not be overriden.
  */
  extern(C) void function(AtkObject* accessible, uint handlerId) removePropertyChangeHandler;

  /** */
  extern(C) void function(AtkObject* accessible, void* data) initialize;

  /** */
  extern(C) void function(AtkObject* accessible, uint changeIndex, void* changedChild) childrenChanged;

  /**
      The signal handler which is executed when there is a
      focus event for an object. This virtual function is deprecated
      since 2.9.4 and it should not be overriden. Use
      the #AtkObject::state-change "focused" signal instead.
  */
  extern(C) void function(AtkObject* accessible, bool focusIn) focusEvent;

  /** */
  extern(C) void function(AtkObject* accessible, AtkPropertyValues* values) propertyChange;

  /** */
  extern(C) void function(AtkObject* accessible, const(char)* name, bool stateSet) stateChange;

  /** */
  extern(C) void function(AtkObject* accessible) visibleDataChanged;

  /** */
  extern(C) void function(AtkObject* accessible, void** child) activeDescendantChanged;

  /** */
  extern(C) AtkAttributeSet* function(AtkObject* accessible) getAttributes;

  /** */
  extern(C) const(char)* function(AtkObject* accessible) getObjectLocale;

  /** */
  AtkFunction pad1;
}

/**
    The base object class for a factory used to
   create accessible objects for objects of a specific GType.
  
  This class is the base object class for a factory used to create an
  accessible object for a specific GType. The function
  [atk.registry.Registry.setFactoryType] is normally called to store in the
  registry the factory type to be used to create an accessible of a
  particular GType.
*/
struct AtkObjectFactory
{
  /** */
  ObjectC parent;
}

/** */
struct AtkObjectFactoryClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) AtkObject* function(ObjectC* obj) createAccessible;

  /** */
  extern(C) void function(AtkObjectFactory* factory) invalidate;

  /** */
  extern(C) GType function() getAccessibleType;

  /** */
  AtkFunction pad1;

  /** */
  AtkFunction pad2;
}

/**
    Toplevel for embedding into other processes
  
  See `class@AtkSocket`
*/
struct AtkPlug
{
  /** */
  AtkObject parent;
}

/** */
struct AtkPlugClass
{
  /** */
  AtkObjectClass parentClass;

  /** */
  extern(C) char* function(AtkPlug* obj) getObjectId;
}

/**
    Note: @old_value field of #AtkPropertyValues will not contain a
  valid value. This is a field defined with the purpose of contain
  the previous value of the property, but is not used anymore.
*/
struct AtkPropertyValues
{
  /**
      The name of the ATK property which has changed.
  */
  const(char)* propertyName;

  /**
      NULL. This field is not used anymore.
  */
  GValue oldValue;

  /**
      The new value of the named property.
  */
  GValue newValue;
}

/**
    A given range or subrange, to be used with #AtkValue
  
  #AtkRange are used on #AtkValue, in order to represent the full
  range of a given component (for example an slider or a range
  control), or to define each individual subrange this full range is
  splitted if available. See #AtkValue documentation for further
  details.
*/
struct AtkRange;

/**
    A data structure for holding a rectangle. Those coordinates are
  relative to the component top-level parent.
*/
struct AtkRectangle
{
  /**
      X coordinate of the left side of the rectangle.
  */
  int x;

  /**
      Y coordinate of the top side of the rectangle.
  */
  int y;

  /**
      width of the rectangle.
  */
  int width;

  /**
      height of the rectangle.
  */
  int height;
}

/**
    An object used to store the GType of the
  factories used to create an accessible object for an object of a
  particular GType.
  
  The AtkRegistry is normally used to create appropriate ATK "peers"
  for user interface components.  Application developers usually need
  only interact with the AtkRegistry by associating appropriate ATK
  implementation classes with GObject classes via the
  atk_registry_set_factory_type call, passing the appropriate GType
  for application custom widget classes.
*/
struct AtkRegistry
{
  /** */
  ObjectC parent;

  /** */
  GHashTable* factoryTypeRegistry;

  /** */
  GHashTable* factorySingletonCache;
}

/** */
struct AtkRegistryClass
{
  /** */
  GObjectClass parentClass;
}

/**
    An object used to describe a relation between a
   object and one or more other objects.
  
  An AtkRelation describes a relation between an object and one or
  more other objects. The actual relations that an object has with
  other objects are defined as an AtkRelationSet, which is a set of
  AtkRelations.
*/
struct AtkRelation
{
  /** */
  ObjectC parent;

  /** */
  GPtrArray* target;

  /** */
  AtkRelationType relationship;
}

/** */
struct AtkRelationClass
{
  /** */
  GObjectClass parent;
}

/**
    A set of AtkRelations, normally the set of
   AtkRelations which an AtkObject has.
  
  The AtkRelationSet held by an object establishes its relationships
  with objects beyond the normal "parent/child" hierarchical
  relationships that all user interface objects have.
  AtkRelationSets establish whether objects are labelled or
  controlled by other components, share group membership with other
  components (for instance within a radio-button group), or share
  content which "flows" between them, among other types of possible
  relationships.
*/
struct AtkRelationSet
{
  /** */
  ObjectC parent;

  /** */
  GPtrArray* relations;
}

/** */
struct AtkRelationSetClass
{
  /** */
  GObjectClass parent;

  /** */
  AtkFunction pad1;

  /** */
  AtkFunction pad2;
}

/**
    The ATK interface implemented by container objects whose #AtkObject children can be selected.
  
  #AtkSelection should be implemented by UI components with children
  which are exposed by #atk_object_ref_child and
  #atk_object_get_n_children, if the use of the parent UI component
  ordinarily involves selection of one or more of the objects
  corresponding to those #AtkObject children - for example,
  selectable lists.
  
  Note that other types of "selection" (for instance text selection)
  are accomplished a other ATK interfaces - #AtkSelection is limited
  to the selection/deselection of children.
*/
struct AtkSelection;

/** */
struct AtkSelectionIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) bool function(AtkSelection* selection, int i) addSelection;

  /** */
  extern(C) bool function(AtkSelection* selection) clearSelection;

  /** */
  extern(C) AtkObject* function(AtkSelection* selection, int i) refSelection;

  /** */
  extern(C) int function(AtkSelection* selection) getSelectionCount;

  /** */
  extern(C) bool function(AtkSelection* selection, int i) isChildSelected;

  /** */
  extern(C) bool function(AtkSelection* selection, int i) removeSelection;

  /** */
  extern(C) bool function(AtkSelection* selection) selectAllSelection;

  /** */
  extern(C) void function(AtkSelection* selection) selectionChanged;
}

/**
    Container for AtkPlug objects from other processes
  
  Together with #AtkPlug, #AtkSocket provides the ability to embed
  accessibles from one process into another in a fashion that is
  transparent to assistive technologies. #AtkSocket works as the
  container of #AtkPlug, embedding it using the method
  [atk.socket.Socket.embed]. Any accessible contained in the #AtkPlug will
  appear to the assistive technologies as being inside the
  application that created the #AtkSocket.
  
  The communication between a #AtkSocket and a #AtkPlug is done by
  the IPC layer of the accessibility framework, normally implemented
  by the D-Bus based implementation of AT-SPI (at-spi2). If that is
  the case, at-spi-atk2 is the responsible to implement the abstract
  methods [atk.plug.Plug.getId] and [atk.socket.Socket.embed], so an ATK
  implementor shouldn't reimplement them. The process that contains
  the #AtkPlug is responsible to send the ID returned by
  atk_plug_id() to the process that contains the #AtkSocket, so it
  could call the method [atk.socket.Socket.embed] in order to embed it.
  
  For the same reasons, an implementor doesn't need to implement
  [atk.object.ObjectAtk.getNAccessibleChildren] and
  [atk.object.ObjectAtk.refAccessibleChild]. All the logic related to those
  functions will be implemented by the IPC layer.
  
  See `class@AtkPlug`
*/
struct AtkSocket
{
  /** */
  AtkObject parent;

  /** */
  char* embeddedPlugId;
}

/** */
struct AtkSocketClass
{
  /** */
  AtkObjectClass parentClass;

  /** */
  extern(C) void function(AtkSocket* obj, const(char)* plugId) embed;
}

/**
    An AtkStateSet contains the states of an object.
  
  An AtkStateSet is a read-only representation of the full set of #AtkStates
  that apply to an object at a given time. This set is not meant to be
  modified, but rather created when #[atk.object.ObjectAtk.refStateSet] is called.
*/
struct AtkStateSet
{
  /** */
  ObjectC parent;
}

/** */
struct AtkStateSetClass
{
  /** */
  GObjectClass parent;
}

/**
    The ATK interface which provides access to streamable content.
  
  An interface whereby an object allows its backing content to be
  streamed to clients.  Typical implementors would be images or
  icons, HTML content, or multimedia display/rendering widgets.
  
  Negotiation of content type is allowed. Clients may examine the
  backing data and transform, convert, or parse the content in order
  to present it in an alternate form to end-users.
  
  The AtkStreamableContent interface is particularly useful for
  saving, printing, or post-processing entire documents, or for
  persisting alternate views of a document. If document content
  itself is being serialized, stored, or converted, then use of the
  AtkStreamableContent interface can help address performance
  issues. Unlike most ATK interfaces, this interface is not strongly
  tied to the current user-agent view of the a particular document,
  but may in some cases give access to the underlying model data.
*/
struct AtkStreamableContent;

/** */
struct AtkStreamableContentIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) int function(AtkStreamableContent* streamable) getNMimeTypes;

  /** */
  extern(C) const(char)* function(AtkStreamableContent* streamable, int i) getMimeType;

  /** */
  extern(C) GIOChannel* function(AtkStreamableContent* streamable, const(char)* mimeType) getStream;

  /** */
  extern(C) const(char)* function(AtkStreamableContent* streamable, const(char)* mimeType) getUri;

  /** */
  AtkFunction pad1;

  /** */
  AtkFunction pad2;

  /** */
  AtkFunction pad3;
}

/**
    The ATK interface implemented for UI components which contain tabular or row/column information.
  
  #AtkTable should be implemented by components which present
  elements ordered via rows and columns.  It may also be used to
  present tree-structured information if the nodes of the trees can
  be said to contain multiple "columns".  Individual elements of an
  #AtkTable are typically referred to as "cells". Those cells should
  implement the interface #AtkTableCell, but #Atk doesn't require
  them to be direct children of the current #AtkTable. They can be
  grand-children, grand-grand-children etc. #AtkTable provides the
  API needed to get a individual cell based on the row and column
  numbers.
  
  Children of #AtkTable are frequently "lightweight" objects, that
  is, they may not have backing widgets in the host UI toolkit.  They
  are therefore often transient.
  
  Since tables are often very complex, #AtkTable includes provision
  for offering simplified summary information, as well as row and
  column headers and captions.  Headers and captions are #AtkObjects
  which may implement other interfaces (#AtkText, #AtkImage, etc.) as
  appropriate.  #AtkTable summaries may themselves be (simplified)
  #AtkTables, etc.
  
  Note for implementors: in the past, #AtkTable required that all the
  cells should be direct children of #AtkTable, and provided some
  index based methods to request the cells. The practice showed that
  that forcing made #AtkTable implementation complex, and hard to
  expose other kind of children, like rows or captions. Right now,
  index-based methods are deprecated.
*/
struct AtkTable;

/**
    The ATK interface implemented for a cell inside a two-dimentional #AtkTable
  
  Being #AtkTable a component which present elements ordered via rows
  and columns, an #AtkTableCell is the interface which each of those
  elements, so "cells" should implement.
  
  See `iface@AtkTable`
*/
struct AtkTableCell;

/**
    AtkTableCell is an interface for cells inside an #AtkTable.
*/
struct AtkTableCellIface
{
  /** */
  GTypeInterface parent;

  /**
      virtual function that returns the number of
      columns occupied by this cell accessible
  */
  extern(C) int function(AtkTableCell* cell) getColumnSpan;

  /**
      virtual function that returns the column
      headers as an array of cell accessibles
  */
  extern(C) GPtrArray* function(AtkTableCell* cell) getColumnHeaderCells;

  /**
      virtual function that retrieves the tabular position
      of this cell
  */
  extern(C) bool function(AtkTableCell* cell, int* row, int* column) getPosition;

  /**
      virtual function that returns the number of rows
      occupied by this cell
  */
  extern(C) int function(AtkTableCell* cell) getRowSpan;

  /**
      virtual function that returns the row
      headers as an array of cell accessibles
  */
  extern(C) GPtrArray* function(AtkTableCell* cell) getRowHeaderCells;

  /**
      virtual function that get the row an column
      indexes and span of this cell
  */
  extern(C) bool function(AtkTableCell* cell, int* row, int* column, int* rowSpan, int* columnSpan) getRowColumnSpan;

  /**
      virtual function that returns a reference to the
      accessible of the containing table
  */
  extern(C) AtkObject* function(AtkTableCell* cell) getTable;
}

/** */
struct AtkTableIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) AtkObject* function(AtkTable* table, int row, int column) refAt;

  /** */
  extern(C) int function(AtkTable* table, int row, int column) getIndexAt;

  /** */
  extern(C) int function(AtkTable* table, int index) getColumnAtIndex;

  /** */
  extern(C) int function(AtkTable* table, int index) getRowAtIndex;

  /** */
  extern(C) int function(AtkTable* table) getNColumns;

  /** */
  extern(C) int function(AtkTable* table) getNRows;

  /** */
  extern(C) int function(AtkTable* table, int row, int column) getColumnExtentAt;

  /** */
  extern(C) int function(AtkTable* table, int row, int column) getRowExtentAt;

  /** */
  extern(C) AtkObject* function(AtkTable* table) getCaption;

  /** */
  extern(C) const(char)* function(AtkTable* table, int column) getColumnDescription;

  /** */
  extern(C) AtkObject* function(AtkTable* table, int column) getColumnHeader;

  /** */
  extern(C) const(char)* function(AtkTable* table, int row) getRowDescription;

  /** */
  extern(C) AtkObject* function(AtkTable* table, int row) getRowHeader;

  /** */
  extern(C) AtkObject* function(AtkTable* table) getSummary;

  /** */
  extern(C) void function(AtkTable* table, AtkObject* caption) setCaption;

  /** */
  extern(C) void function(AtkTable* table, int column, const(char)* description) setColumnDescription;

  /** */
  extern(C) void function(AtkTable* table, int column, AtkObject* header) setColumnHeader;

  /** */
  extern(C) void function(AtkTable* table, int row, const(char)* description) setRowDescription;

  /** */
  extern(C) void function(AtkTable* table, int row, AtkObject* header) setRowHeader;

  /** */
  extern(C) void function(AtkTable* table, AtkObject* accessible) setSummary;

  /** */
  extern(C) int function(AtkTable* table, int** selected) getSelectedColumns;

  /** */
  extern(C) int function(AtkTable* table, int** selected) getSelectedRows;

  /** */
  extern(C) bool function(AtkTable* table, int column) isColumnSelected;

  /** */
  extern(C) bool function(AtkTable* table, int row) isRowSelected;

  /** */
  extern(C) bool function(AtkTable* table, int row, int column) isSelected;

  /** */
  extern(C) bool function(AtkTable* table, int row) addRowSelection;

  /** */
  extern(C) bool function(AtkTable* table, int row) removeRowSelection;

  /** */
  extern(C) bool function(AtkTable* table, int column) addColumnSelection;

  /** */
  extern(C) bool function(AtkTable* table, int column) removeColumnSelection;

  /** */
  extern(C) void function(AtkTable* table, int row, int numInserted) rowInserted;

  /** */
  extern(C) void function(AtkTable* table, int column, int numInserted) columnInserted;

  /** */
  extern(C) void function(AtkTable* table, int row, int numDeleted) rowDeleted;

  /** */
  extern(C) void function(AtkTable* table, int column, int numDeleted) columnDeleted;

  /** */
  extern(C) void function(AtkTable* table) rowReordered;

  /** */
  extern(C) void function(AtkTable* table) columnReordered;

  /** */
  extern(C) void function(AtkTable* table) modelChanged;
}

/**
    The ATK interface implemented by components with text content.
  
  #AtkText should be implemented by #AtkObjects on behalf of widgets
  that have text content which is either attributed or otherwise
  non-trivial.  #AtkObjects whose text content is simple,
  unattributed, and very brief may expose that content via
  #atk_object_get_name instead; however if the text is editable,
  multi-line, typically longer than three or four words, attributed,
  selectable, or if the object already uses the 'name' ATK property
  for other information, the #AtkText interface should be used to
  expose the text content.  In the case of editable text content,
  #AtkEditableText (a subtype of the #AtkText interface) should be
  implemented instead.
  
   #AtkText provides not only traversal facilities and change
  notification for text content, but also caret tracking and glyph
  bounding box calculations.  Note that the text strings are exposed
  as UTF-8, and are therefore potentially multi-byte, and
  caret-to-byte offset mapping makes no assumptions about the
  character length; also bounding box glyph-to-offset mapping may be
  complex for languages which use ligatures.
*/
struct AtkText;

/** */
struct AtkTextIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) char* function(AtkText* text, int startOffset, int endOffset) getText;

  /**
      Gets specified text. This virtual function
      is deprecated and it should not be overridden.
  */
  extern(C) char* function(AtkText* text, int offset, AtkTextBoundary boundaryType, int* startOffset, int* endOffset) getTextAfterOffset;

  /**
      Gets specified text. This virtual function
      is deprecated and it should not be overridden.
  */
  extern(C) char* function(AtkText* text, int offset, AtkTextBoundary boundaryType, int* startOffset, int* endOffset) getTextAtOffset;

  /** */
  extern(C) dchar function(AtkText* text, int offset) getCharacterAtOffset;

  /**
      Gets specified text. This virtual function
      is deprecated and it should not be overridden.
  */
  extern(C) char* function(AtkText* text, int offset, AtkTextBoundary boundaryType, int* startOffset, int* endOffset) getTextBeforeOffset;

  /** */
  extern(C) int function(AtkText* text) getCaretOffset;

  /** */
  extern(C) AtkAttributeSet* function(AtkText* text, int offset, int* startOffset, int* endOffset) getRunAttributes;

  /** */
  extern(C) AtkAttributeSet* function(AtkText* text) getDefaultAttributes;

  /** */
  extern(C) void function(AtkText* text, int offset, int* x, int* y, int* width, int* height, AtkCoordType coords) getCharacterExtents;

  /** */
  extern(C) int function(AtkText* text) getCharacterCount;

  /** */
  extern(C) int function(AtkText* text, int x, int y, AtkCoordType coords) getOffsetAtPoint;

  /** */
  extern(C) int function(AtkText* text) getNSelections;

  /** */
  extern(C) char* function(AtkText* text, int selectionNum, int* startOffset, int* endOffset) getSelection;

  /** */
  extern(C) bool function(AtkText* text, int startOffset, int endOffset) addSelection;

  /** */
  extern(C) bool function(AtkText* text, int selectionNum) removeSelection;

  /** */
  extern(C) bool function(AtkText* text, int selectionNum, int startOffset, int endOffset) setSelection;

  /** */
  extern(C) bool function(AtkText* text, int offset) setCaretOffset;

  /**
      the signal handler which is executed when there is a
      text change. This virtual function is deprecated sice 2.9.4 and
      it should not be overriden.
  */
  extern(C) void function(AtkText* text, int position, int length) textChanged;

  /** */
  extern(C) void function(AtkText* text, int location) textCaretMoved;

  /** */
  extern(C) void function(AtkText* text) textSelectionChanged;

  /** */
  extern(C) void function(AtkText* text) textAttributesChanged;

  /** */
  extern(C) void function(AtkText* text, int startOffset, int endOffset, AtkCoordType coordType, AtkTextRectangle* rect) getRangeExtents;

  /** */
  extern(C) AtkTextRange** function(AtkText* text, AtkTextRectangle* rect, AtkCoordType coordType, AtkTextClipType xClipType, AtkTextClipType yClipType) getBoundedRanges;

  /**
      Gets a portion of the text exposed through
      an AtkText according to a given offset and a specific
      granularity, along with the start and end offsets defining the
      boundaries of such a portion of text.
  */
  extern(C) char* function(AtkText* text, int offset, AtkTextGranularity granularity, int* startOffset, int* endOffset) getStringAtOffset;

  /** */
  extern(C) bool function(AtkText* text, int startOffset, int endOffset, AtkScrollType type) scrollSubstringTo;

  /** */
  extern(C) bool function(AtkText* text, int startOffset, int endOffset, AtkCoordType coords, int x, int y) scrollSubstringToPoint;
}

/**
    A structure used to describe a text range.
*/
struct AtkTextRange
{
  /**
      A rectangle giving the bounds of the text range
  */
  AtkTextRectangle bounds;

  /**
      The start offset of a AtkTextRange
  */
  int startOffset;

  /**
      The end offset of a AtkTextRange
  */
  int endOffset;

  /**
      The text in the text range
  */
  char* content;
}

/**
    A structure used to store a rectangle used by AtkText.
*/
struct AtkTextRectangle
{
  /**
      The horizontal coordinate of a rectangle
  */
  int x;

  /**
      The vertical coordinate of a rectangle
  */
  int y;

  /**
      The width of a rectangle
  */
  int width;

  /**
      The height of a rectangle
  */
  int height;
}

/**
    This structure represents a single  text selection within a document. This
  selection is defined by two points in the content, where each one is defined
  by an AtkObject supporting the AtkText interface and a character offset
  relative to it.
  
  The end object must appear after the start object in the accessibility tree,
  i.e. the end object must be reachable from the start object by navigating
  forward (next, first child etc).
  
  This struct also contains a @start_is_active boolean, to communicate if the
  start of the selection is the active point or not.
  
  The active point corresponds to the user's focus or point of interest. The
  user moves the active point to expand or collapse the range. The anchor
  point is the other point of the range and typically remains constant. In
  most cases, anchor is the start of the range and active is the end. However,
  when selecting backwards (e.g. pressing shift+left arrow in a text field),
  the start of the range is the active point, as the user moves this to
  manipulate the selection.
*/
struct AtkTextSelection
{
  /**
      the AtkText containing the start of the selection.
  */
  AtkObject* startObject;

  /**
      the text offset of the beginning of the selection within
                   @start_object.
  */
  int startOffset;

  /**
      the AtkText containing the end of the selection.
  */
  AtkObject* endObject;

  /**
      the text offset of the end of the selection within @end_object.
  */
  int endOffset;

  /**
      a gboolean indicating whether the start of the selection
                     is the active point.
  */
  bool startIsActive;
}

/**
    A set of ATK utility functions for event and toolkit support.
  
  A set of ATK utility functions which are used to support event
  registration of various types, and obtaining the 'root' accessible
  of a process and information about the current ATK implementation
  and toolkit version.
*/
struct AtkUtil
{
  /** */
  ObjectC parent;
}

/** */
struct AtkUtilClass
{
  /** */
  GObjectClass parent;

  /**
      adds the specified function to the list
     of functions to be called when an ATK event occurs. ATK
     implementors are discouraged from reimplementing this method.
  */
  extern(C) uint function(GSignalEmissionHook listener, const(char)* eventType) addGlobalEventListener;

  /**
      removes the specified function to
     the list of functions to be called when an ATK event occurs. ATK
     implementors are discouraged from reimplementing this method.
  */
  extern(C) void function(uint listenerId) removeGlobalEventListener;

  /**
      adds the specified function to the list of
     functions to be called when a key event occurs.
  */
  extern(C) uint function(AtkKeySnoopFunc listener, void* data) addKeyEventListener;

  /**
      remove the specified function to the
     list of functions to be called when a key event occurs.
  */
  extern(C) void function(uint listenerId) removeKeyEventListener;

  /**
      gets the root accessible container for the current
     application.
  */
  extern(C) AtkObject* function() getRoot;

  /**
      gets name string for the GUI toolkit
     implementing ATK for this application.
  */
  extern(C) const(char)* function() getToolkitName;

  /**
      gets version string for the GUI toolkit
     implementing ATK for this application.
  */
  extern(C) const(char)* function() getToolkitVersion;
}

/**
    The ATK interface implemented by valuators and components which display or select a value from a bounded range of values.
  
  #AtkValue should be implemented for components which either display
  a value from a bounded range, or which allow the user to specify a
  value from a bounded range, or both. For instance, most sliders and
  range controls, as well as dials, should have #AtkObject
  representations which implement #AtkValue on the component's
  behalf. #AtKValues may be read-only, in which case attempts to
  alter the value return would fail.
  
  <refsect1 id="current-value-text">
  <title>On the subject of current value text</title>
  <para>
  In addition to providing the current value, implementors can
  optionally provide an end-user-consumable textual description
  associated with this value. This description should be included
  when the numeric value fails to convey the full, on-screen
  representation seen by users.
  </para>
  
  <example>
  <title>Password strength</title>
  A password strength meter whose value changes as the user types
  their new password. Red is used for values less than 4.0, yellow
  for values between 4.0 and 7.0, and green for values greater than
  7.0. In this instance, value text should be provided by the
  implementor. Appropriate value text would be "weak", "acceptable,"
  and "strong" respectively.
  </example>
  
  A level bar whose value changes to reflect the battery charge. The
  color remains the same regardless of the charge and there is no
  on-screen text reflecting the fullness of the battery. In this
  case, because the position within the bar is the only indication
  the user has of the current charge, value text should not be
  provided by the implementor.
  
  <refsect2 id="implementor-notes">
  <title>Implementor Notes</title>
  <para>
  Implementors should bear in mind that assistive technologies will
  likely prefer the value text provided over the numeric value when
  presenting a widget's value. As a result, strings not intended for
  end users should not be exposed in the value text, and strings
  which are exposed should be localized. In the case of widgets which
  display value text on screen, for instance through a separate label
  in close proximity to the value-displaying widget, it is still
  expected that implementors will expose the value text using the
  above API.
  </para>
  
  <para>
  #AtkValue should NOT be implemented for widgets whose displayed
  value is not reflective of a meaningful amount. For instance, a
  progress pulse indicator whose value alternates between 0.0 and 1.0
  to indicate that some process is still taking place should not
  implement #AtkValue because the current value does not reflect
  progress towards completion.
  </para>
  </refsect2>
  </refsect1>
  
  <refsect1 id="ranges">
  <title>On the subject of ranges</title>
  <para>
  In addition to providing the minimum and maximum values,
  implementors can optionally provide details about subranges
  associated with the widget. These details should be provided by the
  implementor when both of the following are communicated visually to
  the end user:
  </para>
  <itemizedlist>
    <listitem>The existence of distinct ranges such as "weak",
    "acceptable", and "strong" indicated by color, bar tick marks,
    and/or on-screen text.</listitem>
    <listitem>Where the current value stands within a given subrange,
    for instance illustrating progression from very "weak" towards
    nearly "acceptable" through changes in shade and/or position on
    the bar within the "weak" subrange.</listitem>
  </itemizedlist>
  <para>
  If both of the above do not apply to the widget, it should be
  sufficient to expose the numeric value, along with the value text
  if appropriate, to make the widget accessible.
  </para>
  
  <refsect2 id="ranges-implementor-notes">
  <title>Implementor Notes</title>
  <para>
  If providing subrange details is deemed necessary, all possible
  values of the widget are expected to fall within one of the
  subranges defined by the implementor.
  </para>
  </refsect2>
  </refsect1>
  
  <refsect1 id="localization">
  <title>On the subject of localization of end-user-consumable text
  values</title>
  <para>
  Because value text and subrange descriptors are human-consumable,
  implementors are expected to provide localized strings which can be
  directly presented to end users via their assistive technology. In
  order to simplify this for implementors, implementors can use
  [atk.global.valueTypeGetLocalizedName] with the following
  already-localized constants for commonly-needed values can be used:
  </para>
  
  <itemizedlist>
    <listitem>ATK_VALUE_VERY_WEAK</listitem>
    <listitem>ATK_VALUE_WEAK</listitem>
    <listitem>ATK_VALUE_ACCEPTABLE</listitem>
    <listitem>ATK_VALUE_STRONG</listitem>
    <listitem>ATK_VALUE_VERY_STRONG</listitem>
    <listitem>ATK_VALUE_VERY_LOW</listitem>
    <listitem>ATK_VALUE_LOW</listitem>
    <listitem>ATK_VALUE_MEDIUM</listitem>
    <listitem>ATK_VALUE_HIGH</listitem>
    <listitem>ATK_VALUE_VERY_HIGH</listitem>
    <listitem>ATK_VALUE_VERY_BAD</listitem>
    <listitem>ATK_VALUE_BAD</listitem>
    <listitem>ATK_VALUE_GOOD</listitem>
    <listitem>ATK_VALUE_VERY_GOOD</listitem>
    <listitem>ATK_VALUE_BEST</listitem>
    <listitem>ATK_VALUE_SUBSUBOPTIMAL</listitem>
    <listitem>ATK_VALUE_SUBOPTIMAL</listitem>
    <listitem>ATK_VALUE_OPTIMAL</listitem>
  </itemizedlist>
  <para>
  Proposals for additional constants, along with their use cases,
  should be submitted to the GNOME Accessibility Team.
  </para>
  </refsect1>
  
  <refsect1 id="changes">
  <title>On the subject of changes</title>
  <para>
  Note that if there is a textual description associated with the new
  numeric value, that description should be included regardless of
  whether or not it has also changed.
  </para>
  </refsect1>
*/
struct AtkValue;

/** */
struct AtkValueIface
{
  /** */
  GTypeInterface parent;

  /**
      This virtual function is deprecated since 2.12
     and it should not be overriden.
  */
  extern(C) void function(AtkValue* obj, GValue* value) getCurrentValue;

  /**
      This virtual function is deprecated since 2.12
     and it should not be overriden.
  */
  extern(C) void function(AtkValue* obj, GValue* value) getMaximumValue;

  /**
      This virtual function is deprecated since 2.12
     and it should not be overriden.
  */
  extern(C) void function(AtkValue* obj, GValue* value) getMinimumValue;

  /**
      This virtual function is deprecated since 2.12
     and it should not be overriden.
  */
  extern(C) bool function(AtkValue* obj, const(GValue)* value) setCurrentValue;

  /**
      This virtual function is deprecated since
     2.12 and it should not be overriden.
  */
  extern(C) void function(AtkValue* obj, GValue* value) getMinimumIncrement;

  /**
      gets the current value and the human readable
    text alternative (if available) of this object. Since 2.12.
  */
  extern(C) void function(AtkValue* obj, double* value, char** text) getValueAndText;

  /**
      gets the range that defines the minimum and maximum
     value of this object. Returns NULL if there is no range
     defined. Since 2.12.
  */
  extern(C) AtkRange* function(AtkValue* obj) getRange;

  /**
      gets the minimum increment by which the value of
     this object may be changed. If zero it is undefined. Since 2.12.
  */
  extern(C) double function(AtkValue* obj) getIncrement;

  /**
      returns a list of different subranges, and their
     description (if available) of this object. Returns NULL if there
     is not subranges defined. Since 2.12.
  */
  extern(C) GSList* function(AtkValue* obj) getSubRanges;

  /**
      sets the value of this object. Since 2.12.
  */
  extern(C) void function(AtkValue* obj, double newValue) setValue;
}

/**
    The ATK Interface provided by UI components that represent a top-level window.
  
  #AtkWindow should be implemented by the UI elements that represent
  a top-level window, such as the main window of an application or
  dialog.
  
  See `class@AtkObject`
*/
struct AtkWindow;

/** */
struct AtkWindowIface
{
  /** */
  GTypeInterface parent;
}

alias extern(C) void function(AtkObject* obj) AtkEventListener;

alias extern(C) void function() AtkEventListenerInit;

alias extern(C) void function(AtkObject* object, bool focusIn) AtkFocusHandler;

alias extern(C) bool function(void* userData) AtkFunction;

alias extern(C) int function(AtkKeyEventStruct* event, void* userData) AtkKeySnoopFunc;

alias extern(C) void function(AtkObject* obj, AtkPropertyValues* vals) AtkPropertyChangeHandler;

