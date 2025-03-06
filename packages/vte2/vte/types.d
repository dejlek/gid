module vte.types;

import gid.gid;
import glib.error;
import glib.types;
import vte.c.functions;
import vte.c.types;
import vte.terminal;


// Callbacks

/**
    Specifies the type of a selection function used to check whether
  a cell has to be selected or not.

  ## Parameters
  $(LIST
    * $(B terminal)       terminal in which the cell is.
    * $(B column)       column in which the cell is.
    * $(B row)       row in which the cell is.
  )
  Returns:     true if cell has to be selected; false if otherwise.
*/
alias SelectionFunc = bool delegate(vte.terminal.Terminal terminal, glong column, glong row);

/**
    Callback for [vte.terminal.Terminal.spawnAsync].
  
  On success, pid contains the PID of the spawned process, and error
  is null.
  On failure, pid is -1 and error contains the error information.

  ## Parameters
  $(LIST
    * $(B terminal)       the #VteTerminal
    * $(B pid)       a #GPid
    * $(B error)       a #GError, or null
  )
*/
alias TerminalSpawnAsyncCallback = void delegate(vte.terminal.Terminal terminal, glib.types.Pid pid, glib.error.ErrorG error);

/**
    An enumeration type that can be used to specify how the terminal
  uses extra allocated space.
*/
enum Align
{
  /**
      align to left/top
  */
  Start = 0,

  /**
      align to centre
  */
  Center = 1,

  /**
      align to right/bottom
  */
  End = 2,
}

/**
    An enumerated type which can be used to indicate the cursor blink mode
  for the terminal.
*/
enum CursorBlinkMode
{
  /**
      Follow GTK+ settings for cursor blinking.
  */
  System = 0,

  /**
      Cursor blinks.
  */
  On = 1,

  /**
      Cursor does not blink.
  */
  Off = 2,
}

/**
    An enumerated type which can be used to indicate what should the terminal
  draw at the cursor position.
*/
enum CursorShape
{
  /**
      Draw a block cursor.  This is the default.
  */
  Block = 0,

  /**
      Draw a vertical bar on the left side of character.
    This is similar to the default cursor for other GTK+ widgets.
  */
  Ibeam = 1,

  /**
      Draw a horizontal bar below the character.
  */
  Underline = 2,
}

/**
    An enumerated type which can be used to indicate which string the terminal
  should send to an application when the user presses the Delete or Backspace
  keys.
*/
enum EraseBinding
{
  /**
      For backspace, attempt to determine the right value from the terminal's IO settings.  For delete, use the control sequence.
  */
  Auto = 0,

  /**
      Send an ASCII backspace character (0x08).
  */
  AsciiBackspace = 1,

  /**
      Send an ASCII delete character (0x7F).
  */
  AsciiDelete = 2,

  /**
      Send the "@@7" control sequence.
  */
  DeleteSequence = 3,

  /**
      Send terminal's "erase" setting.
  */
  Tty = 4,
}

/**
    An enumeration type for features.
*/
enum FeatureFlags : uint
{
  /**
      whether VTE was built with bidirectional text support
  */
  FlagBidi = 1,

  /**
      whether VTE was built with ICU support
  */
  FlagIcu = 2,

  /**
      whether VTE was built with systemd support
  */
  FlagSystemd = 4,

  /**
      whether VTE was built with SIXEL support
  */
  FlagSixel = 8,

  /**
      mask of all feature flags
  */
  FlagsMask = -1,
}

/**
    An enumeration type that can be used to specify the format the selection
  should be copied to the clipboard in.
*/
enum Format
{
  /**
      Export as plain text
  */
  Text = 1,

  /**
      Export as HTML formatted text
  */
  Html = 2,
}

/** */
enum PtyError
{
  /**
      Obsolete. Deprecated: 0.42
  */
  PtyHelperFailed = 0,

  /**
      failure when using PTY98 to allocate the PTY
  */
  Pty98Failed = 1,
}

/** */
enum PtyFlags : uint
{
  /**
      Unused. Deprecated: 0.38
  */
  NoLastlog = 1,

  /**
      Unused. Deprecated: 0.38
  */
  NoUtmp = 2,

  /**
      Unused. Deprecated: 0.38
  */
  NoWtmp = 4,

  /**
      Unused. Deprecated: 0.38
  */
  NoHelper = 8,

  /**
      Unused. Deprecated: 0.38
  */
  NoFallback = 16,

  /**
      Do not start a new session for the child in
      [vte.pty.Pty.childSetup]. See man:setsid(2) for more information. Since: 0.58
  */
  NoSession = 32,

  /**
      Do not set the PTY as the controlling TTY for the child
      in [vte.pty.Pty.childSetup]. See man:tty_ioctl(4) for more information. Since: 0.58
  */
  NoCtty = 64,

  /**
      the default flags
  */
  Default = 0,
}

/**
    An enum type for regex errors. In addition to the values listed above,
  any PCRE2 error values may occur.
*/
enum RegexError
{
  /**
      The PCRE2 library was built without
      Unicode support which is required for VTE
  */
  Incompatible = 2147483646,

  /**
      Regexes are not supported because VTE was
      built without PCRE2 support
  */
  NotSupported = 2147483647,
}

/**
    An enumerated type which can be used to indicate whether the terminal allows
  the text contents to be blinked.
*/
enum TextBlinkMode
{
  /**
      Do not blink the text.
  */
  Never = 0,

  /**
      Allow blinking text only if the terminal is focused.
  */
  Focused = 1,

  /**
      Allow blinking text only if the terminal is unfocused.
  */
  Unfocused = 2,

  /**
      Allow blinking text. This is the default.
  */
  Always = 3,
}

/**
    A flag type to determine how terminal contents should be written
  to an output stream.
*/
enum WriteFlags
{
  /**
      Write contents as UTF-8 text.  This is the default.
  */
  Default = 0,
}

/**
    The major version number of the VTE library
  (e.g. in version 3.1.4 this is 3).
*/
enum MAJOR_VERSION = 0;

/**
    The micro version number of the VTE library
  (e.g. in version 3.1.4 this is 4).
*/
enum MICRO_VERSION = 4;

/**
    The minor version number of the VTE library
  (e.g. in version 3.1.4 this is 1).
*/
enum MINOR_VERSION = 76;

/** */
enum REGEX_FLAGS_DEFAULT = 1075314688;

/**
    Use this as a spawn flag (together with flags from #GSpawnFlags) in
  [vte.pty.Pty.spawnAsync].
  
  Normally, the spawned process inherits the environment from the parent
  process; when this flag is used, only the environment variables passed
  to [vte.pty.Pty.spawnAsync] etc. are passed to the child process.
*/
enum SPAWN_NO_PARENT_ENVV = 33554432;

/**
    Use this as a spawn flag (together with flags from #GSpawnFlags) in
  [vte.pty.Pty.spawnAsync].
  
  Prevents [vte.pty.Pty.spawnAsync] etc. from moving the newly created child
  process to a systemd user scope.
*/
enum SPAWN_NO_SYSTEMD_SCOPE = 67108864;

/**
    Use this as a spawn flag (together with flags from #GSpawnFlags) in
  [vte.pty.Pty.spawnAsync].
  
  Requires [vte.pty.Pty.spawnAsync] etc. to move the newly created child
  process to a systemd user scope; if that fails, the whole spawn fails.
  
  This is supported on Linux only.
*/
enum SPAWN_REQUIRE_SYSTEMD_SCOPE = 134217728;

/** */
enum TEST_FLAGS_ALL = 18446744073709551615;

/** */
enum TEST_FLAGS_NONE = 0;
