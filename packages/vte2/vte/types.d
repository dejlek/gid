module vte.types;

import gid.gid;
import glib.error;
import glib.types;
import vte.c.functions;
import vte.c.types;
import vte.terminal;


// Enums

/** */
alias Align = VteAlign;

/** */
alias CursorBlinkMode = VteCursorBlinkMode;

/** */
alias CursorShape = VteCursorShape;

/** */
alias EraseBinding = VteEraseBinding;

/** */
alias FeatureFlags = VteFeatureFlags;

/** */
alias Format = VteFormat;

/** */
alias PtyError = VtePtyError;

/** */
alias PtyFlags = VtePtyFlags;

/** */
alias RegexError = VteRegexError;

/** */
alias TextBlinkMode = VteTextBlinkMode;

/** */
alias WriteFlags = VteWriteFlags;

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
