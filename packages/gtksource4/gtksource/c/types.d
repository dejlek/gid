module gtksource.c.types;

public import gid.basictypes;
public import gdk.c.types;
public import gtk.c.types;
import gtksource.types;


// Enums
alias GtkSourceBackgroundPatternType = gtksource.types.BackgroundPatternType;
alias GtkSourceBracketMatchType = gtksource.types.BracketMatchType;
alias GtkSourceChangeCaseType = gtksource.types.ChangeCaseType;
alias GtkSourceCompletionActivation = gtksource.types.CompletionActivation;
alias GtkSourceCompletionError = gtksource.types.CompletionError;
alias GtkSourceCompressionType = gtksource.types.CompressionType;
alias GtkSourceFileLoaderError = gtksource.types.FileLoaderError;
alias GtkSourceFileSaverError = gtksource.types.FileSaverError;
alias GtkSourceFileSaverFlags = gtksource.types.FileSaverFlags;
alias GtkSourceGutterRendererAlignmentMode = gtksource.types.GutterRendererAlignmentMode;
alias GtkSourceGutterRendererState = gtksource.types.GutterRendererState;
alias GtkSourceNewlineType = gtksource.types.NewlineType;
alias GtkSourceSmartHomeEndType = gtksource.types.SmartHomeEndType;
alias GtkSourceSortFlags = gtksource.types.SortFlags;
alias GtkSourceSpaceLocationFlags = gtksource.types.SpaceLocationFlags;
alias GtkSourceSpaceTypeFlags = gtksource.types.SpaceTypeFlags;
alias GtkSourceViewGutterPosition = gtksource.types.ViewGutterPosition;
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

