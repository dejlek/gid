module gtksource.types;

import gid.gid;
import gtksource.c.functions;
import gtksource.c.types;


/** */
enum BackgroundPatternType
{
  /**
      no pattern
  */
  None = 0,

  /**
      grid pattern
  */
  Grid = 1,
}

/** */
enum BracketMatchType
{
  /**
      there is no bracket to match.
  */
  None = 0,

  /**
      matching a bracket
     failed because the maximum range was reached.
  */
  OutOfRange = 1,

  /**
      a matching bracket was not found.
  */
  NotFound = 2,

  /**
      a matching bracket was found.
  */
  Found = 3,
}

/** */
enum ChangeCaseType
{
  /**
      change case to lowercase.
  */
  Lower = 0,

  /**
      change case to uppercase.
  */
  Upper = 1,

  /**
      toggle case of each character.
  */
  Toggle = 2,

  /**
      capitalize each word.
  */
  Title = 3,
}

/** */
enum CompletionActivation : uint
{
  /**
      None.
  */
  None = 0,

  /**
      Interactive activation. By
    default, it occurs on each insertion in the #GtkTextBuffer. This can be
    blocked temporarily with [gtksource.completion.Completion.blockInteractive].
  */
  Interactive = 1,

  /**
      User requested activation.
    By default, it occurs when the user presses
    <keycombo><keycap>Control</keycap><keycap>space</keycap></keycombo>.
  */
  UserRequested = 2,
}

/**
    An error code used with `GTK_SOURCE_COMPLETION_ERROR` in a #GError returned
  from a completion-related function.
*/
enum CompletionError
{
  /**
      The #GtkSourceCompletionProvider
    is already bound to the #GtkSourceCompletion object.
  */
  AlreadyBound = 0,

  /**
      The #GtkSourceCompletionProvider is
    not bound to the #GtkSourceCompletion object.
  */
  NotBound = 1,
}

/** */
enum CompressionType
{
  /**
      plain text.
  */
  None = 0,

  /**
      gzip compression.
  */
  Gzip = 1,
}

/**
    An error code used with the `GTK_SOURCE_FILE_LOADER_ERROR` domain.
*/
enum FileLoaderError
{
  /**
      The file is too big.
  */
  TooBig = 0,

  /**
      It is not
    possible to detect the encoding automatically.
  */
  EncodingAutoDetectionFailed = 1,

  /**
      There was an encoding
    conversion error and it was needed to use a fallback character.
  */
  ConversionFallback = 2,
}

/**
    An error code used with the `GTK_SOURCE_FILE_SAVER_ERROR` domain.
*/
enum FileSaverError
{
  /**
      The buffer contains invalid
      characters.
  */
  InvalidChars = 0,

  /**
      The file is externally
      modified.
  */
  ExternallyModified = 1,
}

/**
    Flags to define the behavior of a #GtkSourceFileSaver.
*/
enum FileSaverFlags : uint
{
  /**
      No flags.
  */
  None = 0,

  /**
      Ignore invalid characters.
  */
  IgnoreInvalidChars = 1,

  /**
      Save file despite external modifications.
  */
  IgnoreModificationTime = 2,

  /**
      Create a backup before saving the file.
  */
  CreateBackup = 4,
}

/**
    The alignment mode of the renderer, when a cell spans multiple lines (due to
  text wrapping).
*/
enum GutterRendererAlignmentMode
{
  /**
      The full cell.
  */
  Cell = 0,

  /**
      The first line.
  */
  First = 1,

  /**
      The last line.
  */
  Last = 2,
}

/** */
enum GutterRendererState : uint
{
  /**
      normal state
  */
  Normal = 0,

  /**
      area in the renderer represents the
    line on which the insert cursor is currently positioned
  */
  Cursor = 1,

  /**
      the mouse pointer is currently
    over the activatable area of the renderer
  */
  Prelit = 2,

  /**
      area in the renderer represents
    a line in the buffer which contains part of the selection
  */
  Selected = 4,
}

/** */
enum NewlineType
{
  /**
      line feed, used on UNIX.
  */
  Lf = 0,

  /**
      carriage return, used on Mac.
  */
  Cr = 1,

  /**
      carriage return followed by a line feed, used
      on Windows.
  */
  CrLf = 2,
}

/** */
enum SmartHomeEndType
{
  /**
      smart-home-end disabled.
  */
  Disabled = 0,

  /**
      move to the first/last
    non-whitespace character on the first press of the HOME/END keys and
    to the beginning/end of the line on the second press.
  */
  Before = 1,

  /**
      move to the beginning/end of the
    line on the first press of the HOME/END keys and to the first/last
    non-whitespace character on the second press.
  */
  After = 2,

  /**
      always move to the first/last
    non-whitespace character when the HOME/END keys are pressed.
  */
  Always = 3,
}

/** */
enum SortFlags : uint
{
  /**
      no flags specified
  */
  None = 0,

  /**
      case sensitive sort
  */
  CaseSensitive = 1,

  /**
      sort in reverse order
  */
  ReverseOrder = 2,

  /**
      remove duplicates
  */
  RemoveDuplicates = 4,
}

/**
    #GtkSourceSpaceLocationFlags contains flags for white space locations.
  
  If a line contains only white spaces (no text), the white spaces match both
  [gtksource.types.SpaceLocationFlags.Leading] and [gtksource.types.SpaceLocationFlags.Trailing].
*/
enum SpaceLocationFlags : uint
{
  /**
      No flags.
  */
  None = 0,

  /**
      Leading white spaces on a line, i.e. the
      indentation.
  */
  Leading = 1,

  /**
      White spaces inside a line of text.
  */
  InsideText = 2,

  /**
      Trailing white spaces on a line.
  */
  Trailing = 4,

  /**
      White spaces anywhere.
  */
  All = 7,
}

/**
    #GtkSourceSpaceTypeFlags contains flags for white space types.
*/
enum SpaceTypeFlags : uint
{
  /**
      No flags.
  */
  None = 0,

  /**
      Space character.
  */
  Space = 1,

  /**
      Tab character.
  */
  Tab = 2,

  /**
      Line break character. If the
      #GtkSourceBuffer:implicit-trailing-newline property is true,
      #GtkSourceSpaceDrawer also draws a line break at the end of the buffer.
  */
  Newline = 4,

  /**
      Non-breaking space character.
  */
  Nbsp = 8,

  /**
      All white spaces.
  */
  All = 15,
}

/** */
enum ViewGutterPosition
{
  /**
      the gutter position of the lines
    renderer
  */
  Lines = -30,

  /**
      the gutter position of the marks
    renderer
  */
  Marks = -20,
}
