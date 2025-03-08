module gtksource.c.types;

public import gid.basictypes;
public import gdk.c.types;
public import gtk.c.types;

/** */
enum GtkSourceBackgroundPatternType
{
  /**
      no pattern
  */
  none = 0,

  /**
      grid pattern
  */
  grid = 1,
}

/** */
enum GtkSourceBracketMatchType
{
  /**
      there is no bracket to match.
  */
  none = 0,

  /**
      matching a bracket
     failed because the maximum range was reached.
  */
  outOfRange = 1,

  /**
      a matching bracket was not found.
  */
  notFound = 2,

  /**
      a matching bracket was found.
  */
  found = 3,
}

/** */
enum GtkSourceChangeCaseType
{
  /**
      change case to lowercase.
  */
  lower = 0,

  /**
      change case to uppercase.
  */
  upper = 1,

  /**
      toggle case of each character.
  */
  toggle = 2,

  /**
      capitalize each word.
  */
  title = 3,
}

/** */
enum GtkSourceCompletionActivation : uint
{
  /**
      None.
  */
  none = 0,

  /**
      Interactive activation. By
    default, it occurs on each insertion in the #GtkTextBuffer. This can be
    blocked temporarily with [gtksource.completion.Completion.blockInteractive].
  */
  interactive = 1,

  /**
      User requested activation.
    By default, it occurs when the user presses
    <keycombo><keycap>Control</keycap><keycap>space</keycap></keycombo>.
  */
  userRequested = 2,
}

/**
    An error code used with `GTK_SOURCE_COMPLETION_ERROR` in a #GError returned
  from a completion-related function.
*/
enum GtkSourceCompletionError
{
  /**
      The #GtkSourceCompletionProvider
    is already bound to the #GtkSourceCompletion object.
  */
  alreadyBound = 0,

  /**
      The #GtkSourceCompletionProvider is
    not bound to the #GtkSourceCompletion object.
  */
  notBound = 1,
}

/** */
enum GtkSourceCompressionType
{
  /**
      plain text.
  */
  none = 0,

  /**
      gzip compression.
  */
  gzip = 1,
}

/**
    An error code used with the `GTK_SOURCE_FILE_LOADER_ERROR` domain.
*/
enum GtkSourceFileLoaderError
{
  /**
      The file is too big.
  */
  tooBig = 0,

  /**
      It is not
    possible to detect the encoding automatically.
  */
  encodingAutoDetectionFailed = 1,

  /**
      There was an encoding
    conversion error and it was needed to use a fallback character.
  */
  conversionFallback = 2,
}

/**
    An error code used with the `GTK_SOURCE_FILE_SAVER_ERROR` domain.
*/
enum GtkSourceFileSaverError
{
  /**
      The buffer contains invalid
      characters.
  */
  invalidChars = 0,

  /**
      The file is externally
      modified.
  */
  externallyModified = 1,
}

/**
    Flags to define the behavior of a #GtkSourceFileSaver.
*/
enum GtkSourceFileSaverFlags : uint
{
  /**
      No flags.
  */
  none = 0,

  /**
      Ignore invalid characters.
  */
  ignoreInvalidChars = 1,

  /**
      Save file despite external modifications.
  */
  ignoreModificationTime = 2,

  /**
      Create a backup before saving the file.
  */
  createBackup = 4,
}

/**
    The alignment mode of the renderer, when a cell spans multiple lines (due to
  text wrapping).
*/
enum GtkSourceGutterRendererAlignmentMode
{
  /**
      The full cell.
  */
  cell = 0,

  /**
      The first line.
  */
  first = 1,

  /**
      The last line.
  */
  last = 2,
}

/** */
enum GtkSourceGutterRendererState : uint
{
  /**
      normal state
  */
  normal = 0,

  /**
      area in the renderer represents the
    line on which the insert cursor is currently positioned
  */
  cursor = 1,

  /**
      the mouse pointer is currently
    over the activatable area of the renderer
  */
  prelit = 2,

  /**
      area in the renderer represents
    a line in the buffer which contains part of the selection
  */
  selected = 4,
}

/** */
enum GtkSourceNewlineType
{
  /**
      line feed, used on UNIX.
  */
  lf = 0,

  /**
      carriage return, used on Mac.
  */
  cr = 1,

  /**
      carriage return followed by a line feed, used
      on Windows.
  */
  crLf = 2,
}

/** */
enum GtkSourceSmartHomeEndType
{
  /**
      smart-home-end disabled.
  */
  disabled = 0,

  /**
      move to the first/last
    non-whitespace character on the first press of the HOME/END keys and
    to the beginning/end of the line on the second press.
  */
  before = 1,

  /**
      move to the beginning/end of the
    line on the first press of the HOME/END keys and to the first/last
    non-whitespace character on the second press.
  */
  after = 2,

  /**
      always move to the first/last
    non-whitespace character when the HOME/END keys are pressed.
  */
  always = 3,
}

/** */
enum GtkSourceSortFlags : uint
{
  /**
      no flags specified
  */
  none = 0,

  /**
      case sensitive sort
  */
  caseSensitive = 1,

  /**
      sort in reverse order
  */
  reverseOrder = 2,

  /**
      remove duplicates
  */
  removeDuplicates = 4,
}

/**
    #GtkSourceSpaceLocationFlags contains flags for white space locations.
  
  If a line contains only white spaces (no text), the white spaces match both
  [gtksource.types.SpaceLocationFlags.leading] and [gtksource.types.SpaceLocationFlags.trailing].
*/
enum GtkSourceSpaceLocationFlags : uint
{
  /**
      No flags.
  */
  none = 0,

  /**
      Leading white spaces on a line, i.e. the
      indentation.
  */
  leading = 1,

  /**
      White spaces inside a line of text.
  */
  insideText = 2,

  /**
      Trailing white spaces on a line.
  */
  trailing = 4,

  /**
      White spaces anywhere.
  */
  all = 7,
}

/**
    #GtkSourceSpaceTypeFlags contains flags for white space types.
*/
enum GtkSourceSpaceTypeFlags : uint
{
  /**
      No flags.
  */
  none = 0,

  /**
      Space character.
  */
  space = 1,

  /**
      Tab character.
  */
  tab = 2,

  /**
      Line break character. If the
      #GtkSourceBuffer:implicit-trailing-newline property is true,
      #GtkSourceSpaceDrawer also draws a line break at the end of the buffer.
  */
  newline = 4,

  /**
      Non-breaking space character.
  */
  nbsp = 8,

  /**
      All white spaces.
  */
  all = 15,
}

/** */
enum GtkSourceViewGutterPosition
{
  /**
      the gutter position of the lines
    renderer
  */
  lines = -30,

  /**
      the gutter position of the marks
    renderer
  */
  marks = -20,
}

/** */
struct GtkSourceBuffer
{
  /** */
  GtkTextBuffer parentInstance;

  /** */
  GtkSourceBufferPrivate* priv;
}

/** */
struct GtkSourceBufferClass
{
  /** */
  GtkTextBufferClass parentClass;

  /** */
  extern(C) void function(GtkSourceBuffer* buffer) undo;

  /** */
  extern(C) void function(GtkSourceBuffer* buffer) redo;

  /** */
  extern(C) void function(GtkSourceBuffer* buffer, GtkTextIter* iter, GtkSourceBracketMatchType state) bracketMatched;

  /** */
  void*[20] padding;
}

/** */
struct GtkSourceBufferPrivate;

/** */
struct GtkSourceCompletion
{
  /** */
  ObjectC parentInstance;

  /** */
  GtkSourceCompletionPrivate* priv;
}

/** */
struct GtkSourceCompletionClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) bool function(GtkSourceCompletion* completion, GtkSourceCompletionProvider* provider, GtkSourceCompletionProposal* proposal) proposalActivated;

  /** */
  extern(C) void function(GtkSourceCompletion* completion) show;

  /** */
  extern(C) void function(GtkSourceCompletion* completion) hide;

  /** */
  extern(C) void function(GtkSourceCompletion* completion, GtkSourceCompletionContext* context) populateContext;

  /** */
  extern(C) void function(GtkSourceCompletion* completion, GtkScrollStep step, int num) moveCursor;

  /** */
  extern(C) void function(GtkSourceCompletion* completion, GtkScrollStep step, int num) movePage;

  /** */
  extern(C) void function(GtkSourceCompletion* completion) activateProposal;

  /** */
  void*[20] padding;
}

/** */
struct GtkSourceCompletionContext
{
  /** */
  GInitiallyUnowned parent;

  /** */
  GtkSourceCompletionContextPrivate* priv;
}

/** */
struct GtkSourceCompletionContextClass
{
  /** */
  GInitiallyUnownedClass parentClass;

  /** */
  extern(C) void function(GtkSourceCompletionContext* context) cancelled;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceCompletionContextPrivate;

/** */
struct GtkSourceCompletionInfo
{
  /** */
  GtkWindow parent;

  /** */
  GtkSourceCompletionInfoPrivate* priv;
}

/** */
struct GtkSourceCompletionInfoClass
{
  /** */
  GtkWindowClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceCompletionInfoPrivate;

/** */
struct GtkSourceCompletionItem
{
  /** */
  ObjectC parent;

  /** */
  GtkSourceCompletionItemPrivate* priv;
}

/** */
struct GtkSourceCompletionItemClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceCompletionItemPrivate;

/** */
struct GtkSourceCompletionPrivate;

/** */
struct GtkSourceCompletionProposal;

/**
    The virtual function table for #GtkSourceCompletionProposal.
*/
struct GtkSourceCompletionProposalIface
{
  /**
      The parent interface.
  */
  GTypeInterface parent;

  /** */
  extern(C) char* function(GtkSourceCompletionProposal* proposal) getLabel;

  /** */
  extern(C) char* function(GtkSourceCompletionProposal* proposal) getMarkup;

  /** */
  extern(C) char* function(GtkSourceCompletionProposal* proposal) getText;

  /** */
  extern(C) PixbufC* function(GtkSourceCompletionProposal* proposal) getIcon;

  /** */
  extern(C) const(char)* function(GtkSourceCompletionProposal* proposal) getIconName;

  /** */
  extern(C) GIcon* function(GtkSourceCompletionProposal* proposal) getGicon;

  /** */
  extern(C) char* function(GtkSourceCompletionProposal* proposal) getInfo;

  /** */
  extern(C) uint function(GtkSourceCompletionProposal* proposal) hash;

  /** */
  extern(C) bool function(GtkSourceCompletionProposal* proposal, GtkSourceCompletionProposal* other) equal;

  /** */
  extern(C) void function(GtkSourceCompletionProposal* proposal) changed;
}

/** */
struct GtkSourceCompletionProvider;

/**
    The virtual function table for #GtkSourceCompletionProvider.
*/
struct GtkSourceCompletionProviderIface
{
  /**
      The parent interface.
  */
  GTypeInterface gIface;

  /** */
  extern(C) char* function(GtkSourceCompletionProvider* provider) getName;

  /** */
  extern(C) PixbufC* function(GtkSourceCompletionProvider* provider) getIcon;

  /** */
  extern(C) const(char)* function(GtkSourceCompletionProvider* provider) getIconName;

  /** */
  extern(C) GIcon* function(GtkSourceCompletionProvider* provider) getGicon;

  /** */
  extern(C) void function(GtkSourceCompletionProvider* provider, GtkSourceCompletionContext* context) populate;

  /** */
  extern(C) bool function(GtkSourceCompletionProvider* provider, GtkSourceCompletionContext* context) match;

  /** */
  extern(C) GtkSourceCompletionActivation function(GtkSourceCompletionProvider* provider) getActivation;

  /** */
  extern(C) GtkWidget* function(GtkSourceCompletionProvider* provider, GtkSourceCompletionProposal* proposal) getInfoWidget;

  /** */
  extern(C) void function(GtkSourceCompletionProvider* provider, GtkSourceCompletionProposal* proposal, GtkSourceCompletionInfo* info) updateInfo;

  /** */
  extern(C) bool function(GtkSourceCompletionProvider* provider, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal, GtkTextIter* iter) getStartIter;

  /** */
  extern(C) bool function(GtkSourceCompletionProvider* provider, GtkSourceCompletionProposal* proposal, GtkTextIter* iter) activateProposal;

  /** */
  extern(C) int function(GtkSourceCompletionProvider* provider) getInteractiveDelay;

  /** */
  extern(C) int function(GtkSourceCompletionProvider* provider) getPriority;
}

/** */
struct GtkSourceCompletionWords
{
  /** */
  ObjectC parent;

  /** */
  GtkSourceCompletionWordsPrivate* priv;
}

/** */
struct GtkSourceCompletionWordsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GtkSourceCompletionWordsPrivate;

/** */
struct GtkSourceEncoding;

/** */
struct GtkSourceFile
{
  /** */
  ObjectC parent;

  /** */
  GtkSourceFilePrivate* priv;
}

/** */
struct GtkSourceFileClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceFileLoader
{
  /** */
  ObjectC parent;

  /** */
  GtkSourceFileLoaderPrivate* priv;
}

/** */
struct GtkSourceFileLoaderClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceFileLoaderPrivate;

/** */
struct GtkSourceFilePrivate;

/** */
struct GtkSourceFileSaver
{
  /** */
  ObjectC object;

  /** */
  GtkSourceFileSaverPrivate* priv;
}

/** */
struct GtkSourceFileSaverClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceFileSaverPrivate;

/** */
struct GtkSourceGutter
{
  /** */
  ObjectC parent;

  /** */
  GtkSourceGutterPrivate* priv;
}

/** */
struct GtkSourceGutterClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceGutterPrivate;

/** */
struct GtkSourceGutterRenderer
{
  /** */
  GInitiallyUnowned parent;

  /** */
  GtkSourceGutterRendererPrivate* priv;
}

/** */
struct GtkSourceGutterRendererClass
{
  /** */
  GInitiallyUnownedClass parentClass;

  /** */
  extern(C) void function(GtkSourceGutterRenderer* renderer, cairo_t* cr, GdkRectangle* backgroundArea, GdkRectangle* cellArea, GtkTextIter* start, GtkTextIter* end) begin;

  /** */
  extern(C) void function(GtkSourceGutterRenderer* renderer, cairo_t* cr, GdkRectangle* backgroundArea, GdkRectangle* cellArea, GtkTextIter* start, GtkTextIter* end, GtkSourceGutterRendererState state) draw;

  /** */
  extern(C) void function(GtkSourceGutterRenderer* renderer) end;

  /** */
  extern(C) void function(GtkSourceGutterRenderer* renderer, GtkTextView* oldView) changeView;

  /** */
  extern(C) void function(GtkSourceGutterRenderer* renderer, GtkTextBuffer* oldBuffer) changeBuffer;

  /** */
  extern(C) bool function(GtkSourceGutterRenderer* renderer, GtkTextIter* iter, GdkRectangle* area, GdkEvent* event) queryActivatable;

  /** */
  extern(C) void function(GtkSourceGutterRenderer* renderer, GtkTextIter* iter, GdkRectangle* area, GdkEvent* event) activate;

  /** */
  extern(C) void function(GtkSourceGutterRenderer* renderer) queueDraw;

  /** */
  extern(C) bool function(GtkSourceGutterRenderer* renderer, GtkTextIter* iter, GdkRectangle* area, int x, int y, GtkTooltip* tooltip) queryTooltip;

  /** */
  extern(C) void function(GtkSourceGutterRenderer* renderer, GtkTextIter* start, GtkTextIter* end, GtkSourceGutterRendererState state) queryData;

  /** */
  void*[20] padding;
}

/** */
struct GtkSourceGutterRendererPixbuf
{
  /** */
  GtkSourceGutterRenderer parent;

  /** */
  GtkSourceGutterRendererPixbufPrivate* priv;
}

/** */
struct GtkSourceGutterRendererPixbufClass
{
  /** */
  GtkSourceGutterRendererClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceGutterRendererPixbufPrivate;

/** */
struct GtkSourceGutterRendererPrivate;

/** */
struct GtkSourceGutterRendererText
{
  /** */
  GtkSourceGutterRenderer parent;

  /** */
  GtkSourceGutterRendererTextPrivate* priv;
}

/** */
struct GtkSourceGutterRendererTextClass
{
  /** */
  GtkSourceGutterRendererClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceGutterRendererTextPrivate;

/** */
struct GtkSourceLanguage
{
  /** */
  ObjectC parentInstance;

  /** */
  GtkSourceLanguagePrivate* priv;
}

/** */
struct GtkSourceLanguageClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceLanguageManager
{
  /** */
  ObjectC parentInstance;

  /** */
  GtkSourceLanguageManagerPrivate* priv;
}

/** */
struct GtkSourceLanguageManagerClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceLanguageManagerPrivate;

/** */
struct GtkSourceLanguagePrivate;

/** */
struct GtkSourceMap
{
  /** */
  GtkSourceView parentInstance;
}

/** */
struct GtkSourceMapClass
{
  /** */
  GtkSourceViewClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceMark
{
  /** */
  GtkTextMark parentInstance;

  /** */
  GtkSourceMarkPrivate* priv;
}

/** */
struct GtkSourceMarkAttributes
{
  /** */
  ObjectC parent;

  /** */
  GtkSourceMarkAttributesPrivate* priv;
}

/** */
struct GtkSourceMarkAttributesClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceMarkAttributesPrivate;

/** */
struct GtkSourceMarkClass
{
  /** */
  GtkTextMarkClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceMarkPrivate;

/** */
struct GtkSourcePrintCompositor
{
  /** */
  ObjectC parentInstance;

  /** */
  GtkSourcePrintCompositorPrivate* priv;
}

/** */
struct GtkSourcePrintCompositorClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourcePrintCompositorPrivate;

/** */
struct GtkSourceRegion
{
  /** */
  ObjectC parentInstance;
}

/** */
struct GtkSourceRegionClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] padding;
}

/**
    #GtkSourceRegionIter is an opaque datatype; ignore all its fields.
  Initialize the iter with [gtksource.region.Region.getStartRegionIter].
*/
struct GtkSourceRegionIter
{
  /** */
  void* dummy1;

  /** */
  uint dummy2;

  /** */
  void* dummy3;
}

/** */
struct GtkSourceSearchContext
{
  /** */
  ObjectC parent;

  /** */
  GtkSourceSearchContextPrivate* priv;
}

/** */
struct GtkSourceSearchContextClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceSearchContextPrivate;

/** */
struct GtkSourceSearchSettings
{
  /** */
  ObjectC parent;

  /** */
  GtkSourceSearchSettingsPrivate* priv;
}

/** */
struct GtkSourceSearchSettingsClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceSearchSettingsPrivate;

/** */
struct GtkSourceSpaceDrawer
{
  /** */
  ObjectC parent;

  /** */
  GtkSourceSpaceDrawerPrivate* priv;
}

/** */
struct GtkSourceSpaceDrawerClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[20] padding;
}

/** */
struct GtkSourceSpaceDrawerPrivate;

/** */
struct GtkSourceStyle;

/** */
struct GtkSourceStyleClass;

/** */
struct GtkSourceStyleScheme
{
  /** */
  ObjectC base;

  /** */
  GtkSourceStyleSchemePrivate* priv;
}

/** */
struct GtkSourceStyleSchemeChooser;

/** */
struct GtkSourceStyleSchemeChooserButton
{
  /** */
  GtkButton parent;
}

/** */
struct GtkSourceStyleSchemeChooserButtonClass
{
  /** */
  GtkButtonClass parent;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceStyleSchemeChooserInterface
{
  /** */
  GTypeInterface baseInterface;

  /** */
  extern(C) GtkSourceStyleScheme* function(GtkSourceStyleSchemeChooser* chooser) getStyleScheme;

  /** */
  extern(C) void function(GtkSourceStyleSchemeChooser* chooser, GtkSourceStyleScheme* scheme) setStyleScheme;

  /** */
  void*[12] padding;
}

/** */
struct GtkSourceStyleSchemeChooserWidget
{
  /** */
  GtkBin parent;
}

/** */
struct GtkSourceStyleSchemeChooserWidgetClass
{
  /** */
  GtkBinClass parent;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceStyleSchemeClass
{
  /** */
  GObjectClass baseClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceStyleSchemeManager
{
  /** */
  ObjectC parent;

  /** */
  GtkSourceStyleSchemeManagerPrivate* priv;
}

/** */
struct GtkSourceStyleSchemeManagerClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceStyleSchemeManagerPrivate;

/** */
struct GtkSourceStyleSchemePrivate;

/** */
struct GtkSourceTag
{
  /** */
  GtkTextTag parentInstance;
}

/** */
struct GtkSourceTagClass
{
  /** */
  GtkTextTagClass parentClass;

  /** */
  void*[10] padding;
}

/** */
struct GtkSourceUndoManager;

/** */
struct GtkSourceUndoManagerIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) bool function(GtkSourceUndoManager* manager) canUndo;

  /** */
  extern(C) bool function(GtkSourceUndoManager* manager) canRedo;

  /** */
  extern(C) void function(GtkSourceUndoManager* manager) undo;

  /** */
  extern(C) void function(GtkSourceUndoManager* manager) redo;

  /** */
  extern(C) void function(GtkSourceUndoManager* manager) beginNotUndoableAction;

  /** */
  extern(C) void function(GtkSourceUndoManager* manager) endNotUndoableAction;

  /** */
  extern(C) void function(GtkSourceUndoManager* manager) canUndoChanged;

  /** */
  extern(C) void function(GtkSourceUndoManager* manager) canRedoChanged;
}

/** */
struct GtkSourceView
{
  /** */
  GtkTextView parent;

  /** */
  GtkSourceViewPrivate* priv;
}

/** */
struct GtkSourceViewClass
{
  /** */
  GtkTextViewClass parentClass;

  /** */
  extern(C) void function(GtkSourceView* view) undo;

  /** */
  extern(C) void function(GtkSourceView* view) redo;

  /** */
  extern(C) void function(GtkSourceView* view, GtkTextIter* iter, GdkEvent* event) lineMarkActivated;

  /** */
  extern(C) void function(GtkSourceView* view) showCompletion;

  /** */
  extern(C) void function(GtkSourceView* view, bool down) moveLines;

  /** */
  extern(C) void function(GtkSourceView* view, int step) moveWords;

  /** */
  void*[20] padding;
}

/** */
struct GtkSourceViewPrivate;

alias extern(C) GMountOperation* function(GtkSourceFile* file, void* userdata) GtkSourceMountOperationFactory;

