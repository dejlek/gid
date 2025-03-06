module vte.c.types;

public import gid.basictypes;
public import gdk.c.types;
public import graphene.c.types;
public import gsk.c.types;
public import gtk.c.types;
public import pango.c.types;
public import cairo.c.types;
import vte.types;


// Enums
alias VteAlign = vte.types.Align;
alias VteCursorBlinkMode = vte.types.CursorBlinkMode;
alias VteCursorShape = vte.types.CursorShape;
alias VteEraseBinding = vte.types.EraseBinding;
alias VteFeatureFlags = vte.types.FeatureFlags;
alias VteFormat = vte.types.Format;
alias VtePtyError = vte.types.PtyError;
alias VtePtyFlags = vte.types.PtyFlags;
alias VteRegexError = vte.types.RegexError;
alias VteTextBlinkMode = vte.types.TextBlinkMode;
alias VteWriteFlags = vte.types.WriteFlags;
/** */
struct VteCharAttributes
{
  /** */
  long row;

  /** */
  long column;

  /** */
  PangoColor fore;

  /** */
  PangoColor back;

  /** */
  uint underline;

  /** */
  uint strikethrough;

  /** */
  uint columns;
}

/**
    Provides context information for a context menu event.
*/
struct VteEventContext;

/** */
struct VtePty;

/** */
struct VtePtyClass;

/** */
struct VteRegex;

/** */
struct VteTerminal
{
  /** */
  GtkWidget widget;
}

/**
    All of these fields should be considered read-only, except for derived classes.
*/
struct VteTerminalClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(VteTerminal* terminal) eof;

  /** */
  extern(C) void function(VteTerminal* terminal, int status) childExited;

  /** */
  extern(C) void function(VteTerminal* terminal) encodingChanged;

  /** */
  extern(C) void function(VteTerminal* terminal, uint charWidth, uint charHeight) charSizeChanged;

  /** */
  extern(C) void function(VteTerminal* terminal) windowTitleChanged;

  /** */
  extern(C) void function(VteTerminal* terminal) iconTitleChanged;

  /** */
  extern(C) void function(VteTerminal* terminal) selectionChanged;

  /** */
  extern(C) void function(VteTerminal* terminal) contentsChanged;

  /** */
  extern(C) void function(VteTerminal* terminal) cursorMoved;

  /** */
  extern(C) void function(VteTerminal* terminal, const(char)* text, uint size) commit;

  /** */
  extern(C) void function(VteTerminal* terminal) deiconifyWindow;

  /** */
  extern(C) void function(VteTerminal* terminal) iconifyWindow;

  /** */
  extern(C) void function(VteTerminal* terminal) raiseWindow;

  /** */
  extern(C) void function(VteTerminal* terminal) lowerWindow;

  /** */
  extern(C) void function(VteTerminal* terminal) refreshWindow;

  /** */
  extern(C) void function(VteTerminal* terminal) restoreWindow;

  /** */
  extern(C) void function(VteTerminal* terminal) maximizeWindow;

  /** */
  extern(C) void function(VteTerminal* terminal, uint width, uint height) resizeWindow;

  /** */
  extern(C) void function(VteTerminal* terminal, uint x, uint y) moveWindow;

  /** */
  extern(C) void function(VteTerminal* terminal) increaseFontSize;

  /** */
  extern(C) void function(VteTerminal* terminal) decreaseFontSize;

  /** */
  extern(C) void function(VteTerminal* terminal) copyClipboard;

  /** */
  extern(C) void function(VteTerminal* terminal) pasteClipboard;

  /** */
  extern(C) void function(VteTerminal* terminal) bell;

  /** */
  extern(C) void function(VteTerminal* terminal, const(VteEventContext)* context) setupContextMenu;

  /** */
  void*[15] Padding;

  /** */
  VteTerminalClassPrivate* priv;
}

/** */
struct VteTerminalClassPrivate;

alias extern(C) bool function(VteTerminal* terminal, glong column, glong row, void* data) VteSelectionFunc;

alias extern(C) void function(VteTerminal* terminal, GPid pid, GError* error, void* userData) VteTerminalSpawnAsyncCallback;

