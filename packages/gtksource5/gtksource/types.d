module gtksource.types;

import gid.gid;
import gtksource.c.functions;
import gtksource.c.types;


// Callbacks

/**
    This function is called incrementally to process additional background work.
  A deadline is provided which can be checked using `funcGLib.get_monotonic_time` so
  that additional work can be processed each frame.
  
  This is useful for situations where you are incrementally performing
  background work such as spell checking or semantic syntax highlighting.

  ## Parameters
  $(LIST
    * $(B deadline)       the time the callback should complete by
  )
  Returns:     true if there is more work to process, otherwise false and the
      handler is unregistered.
*/
alias SchedulerCallback = bool delegate(long deadline);

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
enum CompletionActivation
{
  /** */
  None = 0,

  /** */
  Interactive = 1,

  /** */
  UserRequested = 2,
}

/** */
enum CompletionColumn
{
  /** */
  Icon = 0,

  /** */
  Before = 1,

  /** */
  TypedText = 2,

  /** */
  After = 3,

  /** */
  Comment = 4,

  /** */
  Details = 5,
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
    Flags to define the behavior of a `flags@FileSaverFlags`.
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

/**
    Like [gtksource.global.getMajorVersion], but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum MAJOR_VERSION = 5;

/**
    Like [gtksource.global.getMicroVersion], but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum MICRO_VERSION = 1;

/**
    Like [gtksource.global.getMinorVersion], but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum MINOR_VERSION = 12;
