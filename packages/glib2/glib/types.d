module glib.types;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.error;
import glib.hook;
import glib.hook_list;
import glib.iochannel;
import glib.match_info;
import glib.node;
import glib.option_context;
import glib.option_group;
import glib.scanner;
import glib.sequence_iter;
import glib.source;
import glib.string_;
import glib.tree_node;


// Aliases

/** */
alias DateDay = GDateDay;

/** */
alias DateYear = GDateYear;

/** */
alias MainContextPusher = GMainContextPusher;

/** */
alias MutexLocker = GMutexLocker;

/** */
alias Pid = GPid;

/** */
alias Quark = GQuark;

/** */
alias RWLockReaderLocker = GRWLockReaderLocker;

/** */
alias RWLockWriterLocker = GRWLockWriterLocker;

/** */
alias RecMutexLocker = GRecMutexLocker;

/** */
alias RefString = GRefString;

/** */
alias Strv = GStrv;

/** */
alias Time = GTime;

/** */
alias TimeSpan = GTimeSpan;

/** */
alias IConv = GIConv;

// Structs

/** */
alias Allocator = GAllocator*;

/** */
alias Data = GData*;

/** */
alias IOFuncs = GIOFuncs;

/** */
alias MarkupParser = GMarkupParser;

/** */
alias MemVTable = GMemVTable;

/** */
alias OptionEntry = GOptionEntry;

/** */
alias PollFD = GPollFD;

/** */
alias SourceCallbackFuncs = GSourceCallbackFuncs;

/** */
alias SourceFuncs = GSourceFuncs;

/** */
alias StatBuf = GStatBuf*;

/** */
alias TestCase = GTestCase*;

/** */
alias TestConfig = GTestConfig;

/** */
alias ThreadFunctions = GThreadFunctions;

/** */
alias UnixPipe = GUnixPipe;

// Callbacks

/**
    Specifies the type of the value_destroy_func and key_destroy_func
  functions passed to [glib.cache.Cache.new_]. The functions are passed a
  pointer to the #GCache key or #GCache value and should free any
  memory and other resources associated with it.

  ## Parameters
  $(LIST
    * $(B value)       the #GCache value to destroy
  )

  Deprecated:     Use a #GHashTable instead
*/
alias CacheDestroyFunc = void delegate(void* value);

/**
    Specifies the type of the key_dup_func function passed to
  [glib.cache.Cache.new_]. The function is passed a key
  (__not__ a value as the prototype implies) and
  should return a duplicate of the key.

  ## Parameters
  $(LIST
    * $(B value)       the #GCache key to destroy (__not__ a
              #GCache value as it seems)
  )
  Returns:     a copy of the #GCache key

  Deprecated:     Use a #GHashTable instead
*/
alias CacheDupFunc = void* delegate(void* value);

/**
    Specifies the type of the value_new_func function passed to
  [glib.cache.Cache.new_]. It is passed a #GCache key and should create the
  value corresponding to the key.

  ## Parameters
  $(LIST
    * $(B key)       a #GCache key
  )
  Returns:     a new #GCache value corresponding to the key.

  Deprecated:     Use a #GHashTable instead
*/
alias CacheNewFunc = void* delegate(void* key);

/**
    Prototype of a #GChildWatchSource callback, called when a child
  process has exited.
  
  To interpret wait_status, see the documentation
  for [glib.global.spawnCheckWaitStatus]. In particular,
  on Unix platforms, note that it is usually not equal
  to the integer passed to `exit()` or returned from `main()`.

  ## Parameters
  $(LIST
    * $(B pid)       the process id of the child process
    * $(B waitStatus)       Status information about the child process, encoded
                    in a platform-specific manner
  )
*/
alias ChildWatchFunc = void delegate(glib.types.Pid pid, int waitStatus);

/**
    Specifies the type of function passed to [glib.global.clearHandleId].
  The implementation is expected to free the resource identified
  by handle_id; for instance, if handle_id is a #GSource ID,
  [glib.source.Source.remove] can be used.

  ## Parameters
  $(LIST
    * $(B handleId)       the handle ID to clear
  )
*/
alias ClearHandleFunc = void delegate(uint handleId);

/**
    Specifies the type of a comparison function used to compare two
  values.  The function should return a negative integer if the first
  value comes before the second, 0 if they are equal, or a positive
  integer if the first value comes after the second.

  ## Parameters
  $(LIST
    * $(B a)       a value
    * $(B b)       a value to compare with
  )
  Returns:     negative value if a < b; zero if a = b; positive
             value if a > b
*/
alias CompareDataFunc = int delegate(const(void)* a, const(void)* b);

/**
    Specifies the type of a comparison function used to compare two
  values.  The function should return a negative integer if the first
  value comes before the second, 0 if they are equal, or a positive
  integer if the first value comes after the second.

  ## Parameters
  $(LIST
    * $(B a)       a value
    * $(B b)       a value to compare with
  )
  Returns:     negative value if a < b; zero if a = b; positive
             value if a > b
*/
alias CompareFunc = int delegate(const(void)* a, const(void)* b);

/**
    Specifies the type of the function passed to [glib.completion.Completion.new_]. It
  should return the string corresponding to the given target item.
  This is used when you use data structures as #GCompletion items.

  ## Parameters
  $(LIST
    * $(B item)       the completion item.
  )
  Returns:     the string corresponding to the item.

  Deprecated:     Rarely used API
*/
alias CompletionFunc = string delegate(void* item);

/**
    Specifies the type of the function passed to
  [glib.completion.Completion.setCompare]. This is used when you use strings as
  #GCompletion items.

  ## Parameters
  $(LIST
    * $(B s1)       string to compare with s2.
    * $(B s2)       string to compare with s1.
    * $(B n)       maximal number of bytes to compare.
  )
  Returns:     an integer less than, equal to, or greater than zero if
             the first n bytes of s1 is found, respectively, to be
             less than, to match, or to be greater than the first n
             bytes of s2.

  Deprecated:     Rarely used API
*/
alias CompletionStrncmpFunc = int delegate(string s1, string s2, size_t n);

/**
    A function of this signature is used to copy the node data
  when doing a deep-copy of a tree.

  ## Parameters
  $(LIST
    * $(B src)       A pointer to the data which should be copied
  )
  Returns:     A pointer to the copy
*/
alias CopyFunc = void* delegate(const(void)* src);

/**
    Specifies the type of function passed to [glib.global.datasetForeach]. It is
  called with each #GQuark id and associated data element, together
  with the user_data parameter supplied to [glib.global.datasetForeach].

  ## Parameters
  $(LIST
    * $(B keyId)       the #GQuark id to identifying the data element.
    * $(B data)       the data element.
  )
*/
alias DataForeachFunc = void delegate(glib.types.Quark keyId, void* data);

/**
    Specifies the type of function which is called when a data element
  is destroyed. It is passed the pointer to the data element and
  should free any memory and resources allocated for it.
*/
alias DestroyNotify = void delegate();

/**
    The type of functions that are used to 'duplicate' an object.
  What this means depends on the context, it could just be
  incrementing the reference count, if data is a ref-counted
  object.

  ## Parameters
  $(LIST
    * $(B data)       the data to duplicate
  )
  Returns:     a duplicate of data
*/
alias DuplicateFunc = void* delegate(void* data);

/**
    Specifies the type of a function used to test two values for
  equality. The function should return true if both values are equal
  and false otherwise.

  ## Parameters
  $(LIST
    * $(B a)       a value
    * $(B b)       a value to compare with
  )
  Returns:     true if a = b; false otherwise
*/
alias EqualFunc = bool delegate(const(void)* a, const(void)* b);

/**
    Specifies the type of a function used to test two values for
  equality. The function should return true if both values are equal
  and false otherwise.
  
  This is a version of #GEqualFunc which provides a user_data closure from
  the caller.

  ## Parameters
  $(LIST
    * $(B a)       a value
    * $(B b)       a value to compare with
  )
  Returns:     true if a = b; false otherwise
*/
alias EqualFuncFull = bool delegate(const(void)* a, const(void)* b);

/**
    Specifies the type of function which is called when an extended
  error instance is freed. It is passed the error pointer about to be
  freed, and should free the error's private data fields.
  
  Normally, it is better to use G_DEFINE_EXTENDED_ERROR(), as it
  already takes care of getting the private data from error.

  ## Parameters
  $(LIST
    * $(B error)       extended error to clear
  )
*/
alias ErrorClearFunc = void delegate(glib.error.ErrorG error);

/**
    Specifies the type of function which is called when an extended
  error instance is copied. It is passed the pointer to the
  destination error and source error, and should copy only the fields
  of the private data from src_error to dest_error.
  
  Normally, it is better to use G_DEFINE_EXTENDED_ERROR(), as it
  already takes care of getting the private data from src_error and
  dest_error.

  ## Parameters
  $(LIST
    * $(B srcError)       source extended error
    * $(B destError)       destination extended error
  )
*/
alias ErrorCopyFunc = void delegate(glib.error.ErrorG srcError, glib.error.ErrorG destError);

/**
    Specifies the type of function which is called just after an
  extended error instance is created and its fields filled. It should
  only initialize the fields in the private data, which can be
  received with the generated `*_get_private()` function.
  
  Normally, it is better to use G_DEFINE_EXTENDED_ERROR(), as it
  already takes care of getting the private data from error.

  ## Parameters
  $(LIST
    * $(B error)       extended error
  )
*/
alias ErrorInitFunc = void delegate(glib.error.ErrorG error);

/**
    Declares a type of function which takes an arbitrary
  data pointer argument and has no return value. It is
  not currently used in GLib or GTK.
*/
alias FreeFunc = void delegate();

/**
    Specifies the type of functions passed to [glib.list.List.foreach_] and
  [glib.slist.SList.foreach_].

  ## Parameters
  $(LIST
    * $(B data)       the element's data
  )
*/
alias Func = void delegate(void* data);

/**
    Specifies the type of the function passed to [glib.hash_table.HashTable.foreach_].
  It is called with each key/value pair, together with the user_data
  parameter which is passed to [glib.hash_table.HashTable.foreach_].

  ## Parameters
  $(LIST
    * $(B key)       a key
    * $(B value)       the value corresponding to the key
  )
*/
alias HFunc = void delegate(void* key, void* value);

/**
    Specifies the type of the function passed to
  [glib.hash_table.HashTable.foreachRemove]. It is called with each key/value
  pair, together with the user_data parameter passed to
  [glib.hash_table.HashTable.foreachRemove]. It should return true if the
  key/value pair should be removed from the #GHashTable.

  ## Parameters
  $(LIST
    * $(B key)       a key
    * $(B value)       the value associated with the key
  )
  Returns:     true if the key/value pair should be removed from the
        #GHashTable
*/
alias HRFunc = bool delegate(void* key, void* value);

/**
    Specifies the type of the hash function which is passed to
  [glib.hash_table.HashTable.new_] when a #GHashTable is created.
  
  The function is passed a key and should return a #guint hash value.
  The functions [glib.global.directHash], [glib.global.intHash] and [glib.global.strHash] provide
  hash functions which can be used when the key is a #gpointer, #gint*,
  and #gchar* respectively.
  
  [glib.global.directHash] is also the appropriate hash function for keys
  of the form `GINT_TO_POINTER (n)` (or similar macros).
  
  A good hash functions should produce
  hash values that are evenly distributed over a fairly large range.
  The modulus is taken with the hash table size (a prime number) to
  find the 'bucket' to place each key into. The function should also
  be very fast, since it is called for each key lookup.
  
  Note that the hash functions provided by GLib have these qualities,
  but are not particularly robust against manufactured keys that
  cause hash collisions. Therefore, you should consider choosing
  a more secure hash function when using a GHashTable with keys
  that originate in untrusted data (such as HTTP requests).
  Using [glib.global.strHash] in that situation might make your application
  vulnerable to
  [Algorithmic Complexity Attacks](https://lwn.net/Articles/474912/).
  
  The key to choosing a good hash is unpredictability.  Even
  cryptographic hashes are very easy to find collisions for when the
  remainder is taken modulo a somewhat predictable prime number.  There
  must be an element of randomness that an attacker is unable to guess.

  ## Parameters
  $(LIST
    * $(B key)       a key
  )
  Returns:     the hash value corresponding to the key
*/
alias HashFunc = uint delegate(const(void)* key);

/**
    Defines the type of a hook function that can be invoked
  by [glib.hook_list.HookList.invokeCheck].
  Returns:     false if the #GHook should be destroyed
*/
alias HookCheckFunc = bool delegate();

/**
    Defines the type of function used by [glib.hook_list.HookList.marshalCheck].

  ## Parameters
  $(LIST
    * $(B hook)       a #GHook
  )
  Returns:     false if hook should be destroyed
*/
alias HookCheckMarshaller = bool delegate(glib.hook.Hook hook);

/**
    Defines the type of function used to compare #GHook elements in
  [glib.hook.Hook.insertSorted].

  ## Parameters
  $(LIST
    * $(B newHook)       the #GHook being inserted
    * $(B sibling)       the #GHook to compare with new_hook
  )
  Returns:     a value <= 0 if new_hook should be before sibling
*/
alias HookCompareFunc = int delegate(glib.hook.Hook newHook, glib.hook.Hook sibling);

/**
    Defines the type of function to be called when a hook in a
  list of hooks gets finalized.

  ## Parameters
  $(LIST
    * $(B hookList)       a #GHookList
    * $(B hook)       the hook in hook_list that gets finalized
  )
*/
alias HookFinalizeFunc = void delegate(glib.hook_list.HookList hookList, glib.hook.Hook hook);

/**
    Defines the type of the function passed to [glib.hook.Hook.find].

  ## Parameters
  $(LIST
    * $(B hook)       a #GHook
  )
  Returns:     true if the required #GHook has been found
*/
alias HookFindFunc = bool delegate(glib.hook.Hook hook);

/**
    Defines the type of a hook function that can be invoked
  by [glib.hook_list.HookList.invoke].
*/
alias HookFunc = void delegate();

/**
    Defines the type of function used by [glib.hook_list.HookList.marshal].

  ## Parameters
  $(LIST
    * $(B hook)       a #GHook
  )
*/
alias HookMarshaller = void delegate(glib.hook.Hook hook);

/**
    Specifies the type of function passed to [glib.global.ioAddWatch] or
  [glib.global.ioAddWatchFull], which is called when the requested condition
  on a #GIOChannel is satisfied.

  ## Parameters
  $(LIST
    * $(B source)       the #GIOChannel event source
    * $(B condition)       the condition which has been satisfied
  )
  Returns:     the function should return false if the event source
             should be removed
*/
alias IOFunc = bool delegate(glib.iochannel.IOChannel source, glib.types.IOCondition condition);

/**
    Specifies the prototype of log handler functions.
  
  The default log handler, `funcGLib.log_default_handler`, automatically appends a
  new-line character to message when printing it. It is advised that any
  custom log handler functions behave similarly, so that logging calls in user
  code do not need modifying to add a new-line character to the message if the
  log handler is changed.
  
  This is not used if structured logging is enabled; see
  [Using Structured Logging](logging.html#using-structured-logging).

  ## Parameters
  $(LIST
    * $(B logDomain)       the log domain of the message
    * $(B logLevel)       the log level of the message (including the
        fatal and recursion flags)
    * $(B message)       the message to process
  )
*/
alias LogFunc = void delegate(string logDomain, glib.types.LogLevelFlags logLevel, string message);

/**
    Specifies the type of function passed to [glib.node.Node.childrenForeach].
  The function is called with each child node, together with the user
  data passed to [glib.node.Node.childrenForeach].

  ## Parameters
  $(LIST
    * $(B node)       a #GNode.
  )
*/
alias NodeForeachFunc = void delegate(glib.node.Node node);

/**
    Specifies the type of function passed to [glib.node.Node.traverse]. The
  function is called with each of the nodes visited, together with the
  user data passed to [glib.node.Node.traverse]. If the function returns
  true, then the traversal is stopped.

  ## Parameters
  $(LIST
    * $(B node)       a #GNode.
  )
  Returns:     true to stop the traversal.
*/
alias NodeTraverseFunc = bool delegate(glib.node.Node node);

/**
    The type of function to be passed as callback for `G_OPTION_ARG_CALLBACK`
  options.

  ## Parameters
  $(LIST
    * $(B optionName)       The name of the option being parsed. This will be either a
       single dash followed by a single letter (for a short name) or two dashes
       followed by a long option name.
    * $(B value)       The value to be parsed.
  )
  Returns:     true if the option was successfully parsed, false if an error
     occurred, in which case error should be set with [glib.global.setError]
*/
alias OptionArgFunc = bool delegate(string optionName, string value, GError **_err);

/**
    The type of function to be used as callback when a parse error occurs.

  ## Parameters
  $(LIST
    * $(B context)       The active #GOptionContext
    * $(B group)       The group to which the function belongs
  )
*/
alias OptionErrorFunc = void delegate(glib.option_context.OptionContext context, glib.option_group.OptionGroup group, GError **_err);

/**
    The type of function that can be called before and after parsing.

  ## Parameters
  $(LIST
    * $(B context)       The active #GOptionContext
    * $(B group)       The group to which the function belongs
  )
  Returns:     true if the function completed successfully, false if an error
     occurred, in which case error should be set with [glib.global.setError]
*/
alias OptionParseFunc = bool delegate(glib.option_context.OptionContext context, glib.option_group.OptionGroup group, GError **_err);

/**
    Specifies the type of function passed to [glib.main_context.MainContext.setPollFunc].
  The semantics of the function should match those of the poll() system call.

  ## Parameters
  $(LIST
    * $(B ufds)       an array of #GPollFD elements
    * $(B nfsd)       the number of elements in ufds
    * $(B timeout)       the maximum time to wait for an event of the file descriptors.
          A negative value indicates an infinite timeout.
  )
  Returns:     the number of #GPollFD elements which have events or errors
        reported, or -1 if an error occurred.
*/
alias PollFunc = int delegate(glib.types.PollFD ufds, uint nfsd, int timeout);

/**
    Specifies the type of the print handler functions.
  These are called with the complete formatted string to output.

  ## Parameters
  $(LIST
    * $(B string_)       the message to output
  )
*/
alias PrintFunc = void delegate(string string_);

/**
    Specifies the type of the function passed to [glib.regex.Regex.replaceEval].
  It is called for each occurrence of the pattern in the string passed
  to [glib.regex.Regex.replaceEval], and it should append the replacement to
  result.

  ## Parameters
  $(LIST
    * $(B matchInfo)       the #GMatchInfo generated by the match.
          Use [glib.match_info.MatchInfo.getRegex] and [glib.match_info.MatchInfo.getString] if you
          need the #GRegex or the matched string.
    * $(B result)       a #GString containing the new string
  )
  Returns:     false to continue the replacement process, true to stop it
*/
alias RegexEvalCallback = bool delegate(glib.match_info.MatchInfo matchInfo, glib.string_.String result);

/**
    Specifies the type of the message handler function.

  ## Parameters
  $(LIST
    * $(B scanner)       a #GScanner
    * $(B message)       the message
    * $(B error)       true if the message signals an error,
          false if it signals a warning.
  )
*/
alias ScannerMsgFunc = void delegate(glib.scanner.Scanner scanner, string message, bool error);

/**
    A #GSequenceIterCompareFunc is a function used to compare iterators.
  It must return zero if the iterators compare equal, a negative value
  if a comes before b, and a positive value if b comes before a.

  ## Parameters
  $(LIST
    * $(B a)       a #GSequenceIter
    * $(B b)       a #GSequenceIter
  )
  Returns:     zero if the iterators are equal, a negative value if a
        comes before b, and a positive value if b comes before a.
*/
alias SequenceIterCompareFunc = int delegate(glib.sequence_iter.SequenceIter a, glib.sequence_iter.SequenceIter b);

/**
    Dispose function for source. See [glib.source.Source.setDisposeFunction] for
  details.

  ## Parameters
  $(LIST
    * $(B source)       #GSource that is currently being disposed
  )
*/
alias SourceDisposeFunc = void delegate(glib.source.Source source);

/**
    This is just a placeholder for #GClosureMarshal,
  which cannot be used here for dependency reasons.
*/
alias SourceDummyMarshal = void delegate();

/**
    Specifies the type of function passed to [glib.global.timeoutAdd],
  [glib.global.timeoutAddFull], [glib.global.idleAdd], and [glib.global.idleAddFull].
  
  When calling [glib.source.Source.setCallback], you may need to cast a function of a
  different type to this type. Use G_SOURCE_FUNC() to avoid warnings about
  incompatible function types.
  Returns:     false if the source should be removed. `G_SOURCE_CONTINUE` and
    `G_SOURCE_REMOVE` are more memorable names for the return value.
*/
alias SourceFunc = bool delegate();

/**
    A source function that is only called once before being removed from the main
  context automatically.
  
  See: [glib.global.idleAddOnce], [glib.global.timeoutAddOnce]
*/
alias SourceOnceFunc = void delegate();

/**
    Specifies the type of the setup function passed to [glib.global.spawnAsync],
  [glib.global.spawnSync] and [glib.global.spawnAsyncWithPipes], which can, in very
  limited ways, be used to affect the child's execution.
  
  On POSIX platforms, the function is called in the child after GLib
  has performed all the setup it plans to perform, but before calling
  exec(). Actions taken in this function will only affect the child,
  not the parent.
  
  On Windows, the function is called in the parent. Its usefulness on
  Windows is thus questionable. In many cases executing the child setup
  function in the parent can have ill effects, and you should be very
  careful when porting software to Windows that uses child setup
  functions.
  
  However, even on POSIX, you are extremely limited in what you can
  safely do from a #GSpawnChildSetupFunc, because any mutexes that were
  held by other threads in the parent process at the time of the fork()
  will still be locked in the child process, and they will never be
  unlocked (since the threads that held them don't exist in the child).
  POSIX allows only async-signal-safe functions (see signal(7)) to be
  called in the child between fork() and exec(), which drastically limits
  the usefulness of child setup functions.
  
  In particular, it is not safe to call any function which may
  call malloc(), which includes POSIX functions such as setenv().
  If you need to set up the child environment differently from
  the parent, you should use [glib.global.getEnviron], [glib.global.environSetenv],
  and [glib.global.environUnsetenv], and then pass the complete environment
  list to the `g_spawn...` function.
*/
alias SpawnChildSetupFunc = void delegate();

/**
    The type used for test case functions that take an extra pointer
  argument.
*/
alias TestDataFunc = void delegate();

/**
    The type used for functions that operate on test fixtures.  This is
  used for the fixture setup and teardown functions as well as for the
  testcases themselves.
  
  user_data is a pointer to the data that was given when registering
  the test case.
  
  fixture will be a pointer to the area of memory allocated by the
  test framework, of the size requested.  If the requested size was
  zero then fixture will be equal to user_data.

  ## Parameters
  $(LIST
    * $(B fixture)       the test fixture
  )
*/
alias TestFixtureFunc = void delegate(void* fixture);

/**
    The type used for test case functions.
*/
alias TestFunc = void delegate();

/**
    Specifies the prototype of fatal log handler functions.

  ## Parameters
  $(LIST
    * $(B logDomain)       the log domain of the message
    * $(B logLevel)       the log level of the message (including the fatal and recursion flags)
    * $(B message)       the message to process
  )
  Returns:     true if the program should abort, false otherwise
*/
alias TestLogFatalFunc = bool delegate(string logDomain, glib.types.LogLevelFlags logLevel, string message);

/**
    Specifies the type of the func functions passed to [glib.thread.Thread.new_]
  or [glib.thread.Thread.tryNew].
  Returns:     the return value of the thread
*/
alias ThreadFunc = void* delegate();

/**
    The type of functions which are used to translate user-visible
  strings, for <option>--help</option> output.

  ## Parameters
  $(LIST
    * $(B str)       the untranslated string
  )
  Returns:     a translation of the string for the current locale.
     The returned string is owned by GLib and must not be freed.
*/
alias TranslateFunc = string delegate(string str);

/**
    Specifies the type of function passed to [glib.tree.Tree.traverse]. It is
  passed the key and value of each node, together with the user_data
  parameter passed to [glib.tree.Tree.traverse]. If the function returns
  true, the traversal is stopped.

  ## Parameters
  $(LIST
    * $(B key)       a key of a #GTree node
    * $(B value)       the value corresponding to the key
  )
  Returns:     true to stop the traversal
*/
alias TraverseFunc = bool delegate(void* key, void* value);

/**
    Specifies the type of function passed to [glib.tree.Tree.foreachNode]. It is
  passed each node, together with the user_data parameter passed to
  [glib.tree.Tree.foreachNode]. If the function returns true, the traversal is
  stopped.

  ## Parameters
  $(LIST
    * $(B node)       a #GTreeNode
  )
  Returns:     true to stop the traversal
*/
alias TraverseNodeFunc = bool delegate(glib.tree_node.TreeNode node);

/**
    The type of functions to be called when a UNIX fd watch source
  triggers.

  ## Parameters
  $(LIST
    * $(B fd)       the fd that triggered the event
    * $(B condition)       the IO conditions reported on fd
  )
  Returns:     false if the source should be removed
*/
alias UnixFDSourceFunc = bool delegate(int fd, glib.types.IOCondition condition);

/**
    Declares a type of function which takes no arguments
  and has no return value. It is used to specify the type
  function passed to [glib.global.atexit].
*/
alias VoidFunc = void delegate();

/** */
enum AsciiType : uint
{
  /** */
  Alnum = 1,

  /** */
  Alpha = 2,

  /** */
  Cntrl = 4,

  /** */
  Digit = 8,

  /** */
  Graph = 16,

  /** */
  Lower = 32,

  /** */
  Print = 64,

  /** */
  Punct = 128,

  /** */
  Space = 256,

  /** */
  Upper = 512,

  /** */
  Xdigit = 1024,
}

/**
    Error codes returned by bookmark file parsing.
*/
enum BookmarkFileError
{
  /**
      URI was ill-formed
  */
  InvalidUri = 0,

  /**
      a requested field was not found
  */
  InvalidValue = 1,

  /**
      a requested application did
        not register a bookmark
  */
  AppNotRegistered = 2,

  /**
      a requested URI was not found
  */
  UriNotFound = 3,

  /**
      document was ill formed
  */
  Read = 4,

  /**
      the text being parsed was
        in an unknown encoding
  */
  UnknownEncoding = 5,

  /**
      an error occurred while writing
  */
  Write = 6,

  /**
      requested file was not found
  */
  FileNotFound = 7,
}

/**
    The hashing algorithm to be used by #GChecksum when performing the
  digest of some data.
  
  Note that the #GChecksumType enumeration may be extended at a later
  date to include new hashing algorithm types.
*/
enum ChecksumType
{
  /**
      Use the MD5 hashing algorithm
  */
  Md5 = 0,

  /**
      Use the SHA-1 hashing algorithm
  */
  Sha1 = 1,

  /**
      Use the SHA-256 hashing algorithm
  */
  Sha256 = 2,

  /**
      Use the SHA-512 hashing algorithm (Since: 2.36)
  */
  Sha512 = 3,

  /**
      Use the SHA-384 hashing algorithm (Since: 2.51)
  */
  Sha384 = 4,
}

/**
    Error codes returned by character set conversion routines.
*/
enum ConvertError
{
  /**
      Conversion between the requested character
        sets is not supported.
  */
  NoConversion = 0,

  /**
      Invalid byte sequence in conversion input;
       or the character sequence could not be represented in the target
       character set.
  */
  IllegalSequence = 1,

  /**
      Conversion failed for some reason.
  */
  Failed = 2,

  /**
      Partial character sequence at end of input.
  */
  PartialInput = 3,

  /**
      URI is invalid.
  */
  BadUri = 4,

  /**
      Pathname is not an absolute path.
  */
  NotAbsolutePath = 5,

  /**
      No memory available. Since: 2.40
  */
  NoMemory = 6,

  /**
      An embedded NUL character is present in
        conversion output where a NUL-terminated string is expected.
        Since: 2.56
  */
  EmbeddedNul = 7,
}

/**
    This enumeration isn't used in the API, but may be useful if you need
  to mark a number as a day, month, or year.
*/
enum DateDMY
{
  /**
      a day
  */
  Day = 0,

  /**
      a month
  */
  Month = 1,

  /**
      a year
  */
  Year = 2,
}

/**
    Enumeration representing a month; values are `G_DATE_JANUARY`,
  `G_DATE_FEBRUARY`, etc. `G_DATE_BAD_MONTH` is the invalid value.
*/
enum DateMonth
{
  /**
      invalid value
  */
  BadMonth = 0,

  /**
      January
  */
  January = 1,

  /**
      February
  */
  February = 2,

  /**
      March
  */
  March = 3,

  /**
      April
  */
  April = 4,

  /**
      May
  */
  May = 5,

  /**
      June
  */
  June = 6,

  /**
      July
  */
  July = 7,

  /**
      August
  */
  August = 8,

  /**
      September
  */
  September = 9,

  /**
      October
  */
  October = 10,

  /**
      November
  */
  November = 11,

  /**
      December
  */
  December = 12,
}

/**
    Enumeration representing a day of the week; `G_DATE_MONDAY`,
  `G_DATE_TUESDAY`, etc. `G_DATE_BAD_WEEKDAY` is an invalid weekday.
*/
enum DateWeekday
{
  /**
      invalid value
  */
  BadWeekday = 0,

  /**
      Monday
  */
  Monday = 1,

  /**
      Tuesday
  */
  Tuesday = 2,

  /**
      Wednesday
  */
  Wednesday = 3,

  /**
      Thursday
  */
  Thursday = 4,

  /**
      Friday
  */
  Friday = 5,

  /**
      Saturday
  */
  Saturday = 6,

  /**
      Sunday
  */
  Sunday = 7,
}

/**
    The possible errors, used in the @v_error field
  of #GTokenValue, when the token is a `G_TOKEN_ERROR`.
*/
enum ErrorType
{
  /**
      unknown error
  */
  Unknown = 0,

  /**
      unexpected end of file
  */
  UnexpEof = 1,

  /**
      unterminated string constant
  */
  UnexpEofInString = 2,

  /**
      unterminated comment
  */
  UnexpEofInComment = 3,

  /**
      non-digit character in a number
  */
  NonDigitInConst = 4,

  /**
      digit beyond radix in a number
  */
  DigitRadix = 5,

  /**
      non-decimal floating point number
  */
  FloatRadix = 6,

  /**
      malformed floating point number
  */
  FloatMalformed = 7,
}

/**
    Values corresponding to @errno codes returned from file operations
  on UNIX. Unlike @errno codes, GFileError values are available on
  all systems, even Windows. The exact meaning of each code depends
  on what sort of file operation you were performing; the UNIX
  documentation gives more details. The following error code descriptions
  come from the GNU C Library manual, and are under the copyright
  of that manual.
  
  It's not very portable to make detailed assumptions about exactly
  which errors will be returned from a given operation. Some errors
  don't occur on some systems, etc., sometimes there are subtle
  differences in when a system will report a given error, etc.
*/
enum FileError
{
  /**
      Operation not permitted; only the owner of
        the file (or other resource) or processes with special privileges
        can perform the operation.
  */
  Exist = 0,

  /**
      File is a directory; you cannot open a directory
        for writing, or create or remove hard links to it.
  */
  Isdir = 1,

  /**
      Permission denied; the file permissions do not
        allow the attempted operation.
  */
  Acces = 2,

  /**
      Filename too long.
  */
  Nametoolong = 3,

  /**
      No such file or directory. This is a "file
        doesn't exist" error for ordinary files that are referenced in
        contexts where they are expected to already exist.
  */
  Noent = 4,

  /**
      A file that isn't a directory was specified when
        a directory is required.
  */
  Notdir = 5,

  /**
      No such device or address. The system tried to
        use the device represented by a file you specified, and it
        couldn't find the device. This can mean that the device file was
        installed incorrectly, or that the physical device is missing or
        not correctly attached to the computer.
  */
  Nxio = 6,

  /**
      The underlying file system of the specified file
        does not support memory mapping.
  */
  Nodev = 7,

  /**
      The directory containing the new link can't be
        modified because it's on a read-only file system.
  */
  Rofs = 8,

  /**
      Text file busy.
  */
  Txtbsy = 9,

  /**
      You passed in a pointer to bad memory.
        (GLib won't reliably return this, don't pass in pointers to bad
        memory.)
  */
  Fault = 10,

  /**
      Too many levels of symbolic links were encountered
        in looking up a file name. This often indicates a cycle of symbolic
        links.
  */
  Loop = 11,

  /**
      No space left on device; write operation on a
        file failed because the disk is full.
  */
  Nospc = 12,

  /**
      No memory available. The system cannot allocate
        more virtual memory because its capacity is full.
  */
  Nomem = 13,

  /**
      The current process has too many files open and
        can't open any more. Duplicate descriptors do count toward this
        limit.
  */
  Mfile = 14,

  /**
      There are too many distinct file openings in the
        entire system.
  */
  Nfile = 15,

  /**
      Bad file descriptor; for example, I/O on a
        descriptor that has been closed or reading from a descriptor open
        only for writing (or vice versa).
  */
  Badf = 16,

  /**
      Invalid argument. This is used to indicate
        various kinds of problems with passing the wrong argument to a
        library function.
  */
  Inval = 17,

  /**
      Broken pipe; there is no process reading from the
        other end of a pipe. Every library function that returns this
        error code also generates a 'SIGPIPE' signal; this signal
        terminates the program if not handled or blocked. Thus, your
        program will never actually see this code unless it has handled
        or blocked 'SIGPIPE'.
  */
  Pipe = 18,

  /**
      Resource temporarily unavailable; the call might
        work if you try again later.
  */
  Again = 19,

  /**
      Interrupted function call; an asynchronous signal
        occurred and prevented completion of the call. When this
        happens, you should try the call again.
  */
  Intr = 20,

  /**
      Input/output error; usually used for physical read
       or write errors. i.e. the disk or other physical device hardware
       is returning errors.
  */
  Io = 21,

  /**
      Operation not permitted; only the owner of the
       file (or other resource) or processes with special privileges can
       perform the operation.
  */
  Perm = 22,

  /**
      Function not implemented; this indicates that
       the system is missing some functionality.
  */
  Nosys = 23,

  /**
      Does not correspond to a UNIX error code; this
       is the standard "failed for unspecified reason" error code present
       in all #GError error code enumerations. Returned if no specific
       code applies.
  */
  Failed = 24,
}

/**
    Flags to pass to [glib.global.fileSetContentsFull] to affect its safety and
  performance.
*/
enum FileSetContentsFlags : uint
{
  /**
      No guarantees about file consistency or durability.
      The most dangerous setting, which is slightly faster than other settings.
  */
  None = 0,

  /**
      Guarantee file consistency: after a crash,
      either the old version of the file or the new version of the file will be
      available, but not a mixture. On Unix systems this equates to an `fsync()`
      on the file and use of an atomic `rename()` of the new version of the file
      over the old.
  */
  Consistent = 1,

  /**
      Guarantee file durability: after a crash, the
      new version of the file will be available. On Unix systems this equates to
      an `fsync()` on the file (if `G_FILE_SET_CONTENTS_CONSISTENT` is unset), or
      the effects of `G_FILE_SET_CONTENTS_CONSISTENT` plus an `fsync()` on the
      directory containing the file after calling `rename()`.
  */
  Durable = 2,

  /**
      Only apply consistency and durability
      guarantees if the file already exists. This may speed up file operations
      if the file doesn’t currently exist, but may result in a corrupted version
      of the new file if the system crashes while writing it.
  */
  OnlyExisting = 4,
}

/**
    A test to perform on a file using [glib.global.fileTest].
*/
enum FileTest : uint
{
  /**
      true if the file is a regular file
        (not a directory). Note that this test will also return true
        if the tested file is a symlink to a regular file.
  */
  IsRegular = 1,

  /**
      true if the file is a symlink.
  */
  IsSymlink = 2,

  /**
      true if the file is a directory.
  */
  IsDir = 4,

  /**
      true if the file is executable.
  */
  IsExecutable = 8,

  /**
      true if the file exists. It may or may not
        be a regular file.
  */
  Exists = 16,
}

/**
    Flags to modify the format of the string returned by [glib.global.formatSizeFull].
*/
enum FormatSizeFlags : uint
{
  /**
      behave the same as [glib.global.formatSize]
  */
  Default = 0,

  /**
      include the exact number of bytes as part
        of the returned string.  For example, "45.6 kB (45,612 bytes)".
  */
  LongFormat = 1,

  /**
      use IEC (base 1024) units with "KiB"-style
        suffixes. IEC units should only be used for reporting things with
        a strong "power of 2" basis, like RAM sizes or RAID stripe sizes.
        Network and storage sizes should be reported in the normal SI units.
  */
  IecUnits = 2,

  /**
      set the size as a quantity in bits, rather than
        bytes, and return units in bits. For example, ‘Mbit’ rather than ‘MB’.
  */
  Bits = 4,

  /**
      return only value, without unit; this should
        not be used together with @G_FORMAT_SIZE_LONG_FORMAT
        nor @G_FORMAT_SIZE_ONLY_UNIT. Since: 2.74
  */
  OnlyValue = 8,

  /**
      return only unit, without value; this should
        not be used together with @G_FORMAT_SIZE_LONG_FORMAT
        nor @G_FORMAT_SIZE_ONLY_VALUE. Since: 2.74
  */
  OnlyUnit = 16,
}

/**
    Flags used internally in the #GHook implementation.
*/
enum HookFlagMask : uint
{
  /**
      set if the hook has not been destroyed
  */
  Active = 1,

  /**
      set if the hook is currently being run
  */
  InCall = 2,

  /**
      A mask covering all bits reserved for
      hook flags; see `G_HOOK_FLAG_USER_SHIFT`
  */
  Mask = 15,
}

/**
    Error codes returned by #GIOChannel operations.
*/
enum IOChannelError
{
  /**
      File too large.
  */
  Fbig = 0,

  /**
      Invalid argument.
  */
  Inval = 1,

  /**
      IO error.
  */
  Io = 2,

  /**
      File is a directory.
  */
  Isdir = 3,

  /**
      No space left on device.
  */
  Nospc = 4,

  /**
      No such device or address.
  */
  Nxio = 5,

  /**
      Value too large for defined datatype.
  */
  Overflow = 6,

  /**
      Broken pipe.
  */
  Pipe = 7,

  /**
      Some other error.
  */
  Failed = 8,
}

/**
    A bitwise combination representing a condition to watch for on an
  event source.
*/
enum IOCondition : uint
{
  /**
      There is data to read.
  */
  In = 1,

  /**
      Data can be written (without blocking).
  */
  Out = 4,

  /**
      There is urgent data to read.
  */
  Pri = 2,

  /**
      Error condition.
  */
  Err = 8,

  /**
      Hung up (the connection has been broken, usually for
               pipes and sockets).
  */
  Hup = 16,

  /**
      Invalid request. The file descriptor is not open.
  */
  Nval = 32,
}

/**
    #GIOError is only used by the deprecated functions
  [glib.iochannel.IOChannel.read], [glib.iochannel.IOChannel.write], and [glib.iochannel.IOChannel.seek].
*/
enum IOError
{
  /**
      no error
  */
  None = 0,

  /**
      an EAGAIN error occurred
  */
  Again = 1,

  /**
      an EINVAL error occurred
  */
  Inval = 2,

  /**
      another error occurred
  */
  Unknown = 3,
}

/**
    Specifies properties of a #GIOChannel. Some of the flags can only be
  read with [glib.iochannel.IOChannel.getFlags], but not changed with
  [glib.iochannel.IOChannel.setFlags].
*/
enum IOFlags : uint
{
  /**
      no special flags set. Since: 2.74
  */
  None = 0,

  /**
      turns on append mode, corresponds to `O_APPEND`
        (see the documentation of the UNIX open() syscall)
  */
  Append = 1,

  /**
      turns on nonblocking mode, corresponds to
        `O_NONBLOCK`/`O_NDELAY` (see the documentation of the UNIX open()
        syscall)
  */
  Nonblock = 2,

  /**
      indicates that the io channel is readable.
        This flag cannot be changed.
  */
  IsReadable = 4,

  /**
      indicates that the io channel is writable.
        This flag cannot be changed.
  */
  IsWritable = 8,

  /**
      a misspelled version of @G_IO_FLAG_IS_WRITABLE
        that existed before the spelling was fixed in GLib 2.30. It is kept
        here for compatibility reasons. Deprecated since 2.30
  */
  IsWriteable = 8,

  /**
      indicates that the io channel is seekable,
        i.e. that [glib.iochannel.IOChannel.seekPosition] can be used on it.
        This flag cannot be changed.
  */
  IsSeekable = 16,

  /**
      the mask that specifies all the valid flags.
  */
  Mask = 31,

  /**
      the mask of the flags that are returned from
        [glib.iochannel.IOChannel.getFlags]
  */
  GetMask = 31,

  /**
      the mask of the flags that the user can modify
        with [glib.iochannel.IOChannel.setFlags]
  */
  SetMask = 3,
}

/**
    Statuses returned by most of the #GIOFuncs functions.
*/
enum IOStatus
{
  /**
      An error occurred.
  */
  Error = 0,

  /**
      Success.
  */
  Normal = 1,

  /**
      End of file.
  */
  Eof = 2,

  /**
      Resource temporarily unavailable.
  */
  Again = 3,
}

/**
    Error codes returned by key file parsing.
*/
enum KeyFileError
{
  /**
      the text being parsed was in
      an unknown encoding
  */
  UnknownEncoding = 0,

  /**
      document was ill-formed
  */
  Parse = 1,

  /**
      the file was not found
  */
  NotFound = 2,

  /**
      a requested key was not found
  */
  KeyNotFound = 3,

  /**
      a requested group was not found
  */
  GroupNotFound = 4,

  /**
      a value could not be parsed
  */
  InvalidValue = 5,
}

/**
    Flags which influence the parsing.
*/
enum KeyFileFlags : uint
{
  /**
      No flags, default behaviour
  */
  None = 0,

  /**
      Use this flag if you plan to write the
      (possibly modified) contents of the key file back to a file;
      otherwise all comments will be lost when the key file is
      written back.
  */
  KeepComments = 1,

  /**
      Use this flag if you plan to write the
      (possibly modified) contents of the key file back to a file;
      otherwise only the translations for the current language will be
      written back.
  */
  KeepTranslations = 2,
}

/**
    Flags specifying the level of log messages.
  
  It is possible to change how GLib treats messages of the various
  levels using `func@GLib.log_set_handler` and `func@GLib.log_set_fatal_mask`.
*/
enum LogLevelFlags : uint
{
  /**
      internal flag
  */
  FlagRecursion = 1,

  /**
      internal flag
  */
  FlagFatal = 2,

  /**
      log level for errors, see `func@GLib.error`.
      This level is also used for messages produced by `func@GLib.assert`.
  */
  LevelError = 4,

  /**
      log level for critical warning messages, see
      `func@GLib.critical`. This level is also used for messages produced by
      `func@GLib.return_if_fail` and `func@GLib.return_val_if_fail`.
  */
  LevelCritical = 8,

  /**
      log level for warnings, see `func@GLib.warning`
  */
  LevelWarning = 16,

  /**
      log level for messages, see `func@GLib.message`
  */
  LevelMessage = 32,

  /**
      log level for informational messages, see `func@GLib.info`
  */
  LevelInfo = 64,

  /**
      log level for debug messages, see `func@GLib.debug`
  */
  LevelDebug = 128,

  /**
      a mask including all log levels
  */
  LevelMask = -4,
}

/**
    Return values from #GLogWriterFuncs to indicate whether the given log entry
  was successfully handled by the writer, or whether there was an error in
  handling it (and hence a fallback writer should be used).
  
  If a #GLogWriterFunc ignores a log entry, it should return
  `G_LOG_WRITER_HANDLED`.
*/
enum LogWriterOutput
{
  /**
      Log writer has handled the log entry.
  */
  Handled = 1,

  /**
      Log writer could not handle the log entry.
  */
  Unhandled = 0,
}

/**
    Flags to pass to [glib.main_context.MainContext.newWithFlags] which affect the behaviour
  of a #GMainContext.
*/
enum MainContextFlags : uint
{
  /**
      Default behaviour.
  */
  None = 0,

  /**
      Assume that polling for events will
    free the thread to process other jobs. That's useful if you're using
    `g_main_context_{prepare,query,check,dispatch}` to integrate GMainContext in
    other event loops.
  */
  OwnerlessPolling = 1,
}

/**
    A mixed enumerated type and flags field. You must specify one type
  (string, strdup, boolean, tristate).  Additionally, you may  optionally
  bitwise OR the type with the flag `G_MARKUP_COLLECT_OPTIONAL`.
  
  It is likely that this enum will be extended in the future to
  support other types.
*/
enum MarkupCollectType : uint
{
  /**
      used to terminate the list of attributes
        to collect
  */
  Invalid = 0,

  /**
      collect the string pointer directly from
        the attribute_values[] array. Expects a parameter of type (const
        char **). If `G_MARKUP_COLLECT_OPTIONAL` is specified and the
        attribute isn't present then the pointer will be set to null
  */
  String = 1,

  /**
      as with `G_MARKUP_COLLECT_STRING`, but
        expects a parameter of type (char **) and [glib.global.strdup]s the
        returned pointer. The pointer must be freed with [glib.global.gfree]
  */
  Strdup = 2,

  /**
      expects a parameter of type (gboolean *)
        and parses the attribute value as a boolean. Sets false if the
        attribute isn't present. Valid boolean values consist of
        (case-insensitive) "false", "f", "no", "n", "0" and "true", "t",
        "yes", "y", "1"
  */
  Boolean = 3,

  /**
      as with `G_MARKUP_COLLECT_BOOLEAN`, but
        in the case of a missing attribute a value is set that compares
        equal to neither false nor true G_MARKUP_COLLECT_OPTIONAL is
        implied
  */
  Tristate = 4,

  /**
      can be bitwise ORed with the other fields.
        If present, allows the attribute not to appear. A default value
        is set depending on what value type is used
  */
  Optional = 65536,
}

/**
    Error codes returned by markup parsing.
*/
enum MarkupError
{
  /**
      text being parsed was not valid UTF-8
  */
  BadUtf8 = 0,

  /**
      document contained nothing, or only whitespace
  */
  Empty = 1,

  /**
      document was ill-formed
  */
  Parse = 2,

  /**
      error should be set by #GMarkupParser
        functions; element wasn't known
  */
  UnknownElement = 3,

  /**
      error should be set by #GMarkupParser
        functions; attribute wasn't known
  */
  UnknownAttribute = 4,

  /**
      error should be set by #GMarkupParser
        functions; content was invalid
  */
  InvalidContent = 5,

  /**
      error should be set by #GMarkupParser
        functions; a required attribute was missing
  */
  MissingAttribute = 6,
}

/**
    Flags that affect the behaviour of the parser.
*/
enum MarkupParseFlags : uint
{
  /**
      No special behaviour. Since: 2.74
  */
  DefaultFlags = 0,

  /**
      flag you should not use
  */
  DoNotUseThisUnsupportedFlag = 1,

  /**
      When this flag is set, CDATA marked
        sections are not passed literally to the @passthrough function of
        the parser. Instead, the content of the section (without the
        `<![CDATA[` and `]]>`) is
        passed to the @text function. This flag was added in GLib 2.12
  */
  TreatCdataAsText = 2,

  /**
      Normally errors caught by GMarkup
        itself have line/column information prefixed to them to let the
        caller know the location of the error. When this flag is set the
        location information is also prefixed to errors generated by the
        #GMarkupParser implementation functions
  */
  PrefixErrorPosition = 4,

  /**
      Ignore (don't report) qualified
        attributes and tags, along with their contents.  A qualified
        attribute or tag is one that contains ':' in its name (ie: is in
        another namespace).  Since: 2.40.
  */
  IgnoreQualified = 8,
}

/**
    Defines how a Unicode string is transformed in a canonical
  form, standardizing such issues as whether a character with
  an accent is represented as a base character and combining
  accent or as a single precomposed character. Unicode strings
  should generally be normalized before comparing them.
*/
enum NormalizeMode
{
  /**
      standardize differences that do not affect the
        text content, such as the above-mentioned accent representation
  */
  Default = 0,

  /**
      another name for [glib.types.NormalizeMode.Default]
  */
  Nfd = 0,

  /**
      like [glib.types.NormalizeMode.Default], but with
        composed forms rather than a maximally decomposed form
  */
  DefaultCompose = 1,

  /**
      another name for [glib.types.NormalizeMode.DefaultCompose]
  */
  Nfc = 1,

  /**
      beyond [glib.types.NormalizeMode.Default] also standardize the
        "compatibility" characters in Unicode, such as SUPERSCRIPT THREE
        to the standard forms (in this case DIGIT THREE). Formatting
        information may be lost but for most text operations such
        characters should be considered the same
  */
  All = 2,

  /**
      another name for [glib.types.NormalizeMode.All]
  */
  Nfkd = 2,

  /**
      like [glib.types.NormalizeMode.All], but with composed
        forms rather than a maximally decomposed form
  */
  AllCompose = 3,

  /**
      another name for [glib.types.NormalizeMode.AllCompose]
  */
  Nfkc = 3,
}

/**
    Error codes returned by functions converting a string to a number.
*/
enum NumberParserError
{
  /**
      string was not a valid number
  */
  Invalid = 0,

  /**
      string was a number, but out of bounds
  */
  OutOfBounds = 1,
}

/**
    The possible statuses of a one-time initialization function
  controlled by a #GOnce struct.
*/
enum OnceStatus
{
  /**
      the function has not been called yet.
  */
  Notcalled = 0,

  /**
      the function call is currently in progress.
  */
  Progress = 1,

  /**
      the function has been called.
  */
  Ready = 2,
}

/**
    The #GOptionArg enum values determine which type of extra argument the
  options expect to find. If an option expects an extra argument, it can
  be specified in several ways; with a short option: `-x arg`, with a long
  option: `--name arg` or combined in a single argument: `--name=arg`.
*/
enum OptionArg
{
  /**
      No extra argument. This is useful for simple flags or booleans.
  */
  None = 0,

  /**
      The option takes a UTF-8 string argument.
  */
  String = 1,

  /**
      The option takes an integer argument.
  */
  Int = 2,

  /**
      The option provides a callback (of type
        #GOptionArgFunc) to parse the extra argument.
  */
  Callback = 3,

  /**
      The option takes a filename as argument, which will
           be in the GLib filename encoding rather than UTF-8.
  */
  Filename = 4,

  /**
      The option takes a string argument, multiple
        uses of the option are collected into an array of strings.
  */
  StringArray = 5,

  /**
      The option takes a filename as argument,
        multiple uses of the option are collected into an array of strings.
  */
  FilenameArray = 6,

  /**
      The option takes a double argument. The argument
        can be formatted either for the user's locale or for the "C" locale.
        Since 2.12
  */
  Double = 7,

  /**
      The option takes a 64-bit integer. Like
        `G_OPTION_ARG_INT` but for larger numbers. The number can be in
        decimal base, or in hexadecimal (when prefixed with `0x`, for
        example, `0xffffffff`). Since 2.12
  */
  Int64 = 8,
}

/**
    Error codes returned by option parsing.
*/
enum OptionError
{
  /**
      An option was not known to the parser.
     This error will only be reported, if the parser hasn't been instructed
     to ignore unknown options, see [glib.option_context.OptionContext.setIgnoreUnknownOptions].
  */
  UnknownOption = 0,

  /**
      A value couldn't be parsed.
  */
  BadValue = 1,

  /**
      A #GOptionArgFunc callback failed.
  */
  Failed = 2,
}

/**
    Flags which modify individual options.
*/
enum OptionFlags : uint
{
  /**
      No flags. Since: 2.42.
  */
  None = 0,

  /**
      The option doesn't appear in `--help` output.
  */
  Hidden = 1,

  /**
      The option appears in the main section of the
        `--help` output, even if it is defined in a group.
  */
  InMain = 2,

  /**
      For options of the `G_OPTION_ARG_NONE` kind, this
        flag indicates that the sense of the option is reversed. i.e. false will
        be stored into the argument rather than true.
  */
  Reverse = 4,

  /**
      For options of the `G_OPTION_ARG_CALLBACK` kind,
        this flag indicates that the callback does not take any argument
        (like a `G_OPTION_ARG_NONE` option). Since 2.8
  */
  NoArg = 8,

  /**
      For options of the `G_OPTION_ARG_CALLBACK`
        kind, this flag indicates that the argument should be passed to the
        callback in the GLib filename encoding rather than UTF-8. Since 2.8
  */
  Filename = 16,

  /**
      For options of the `G_OPTION_ARG_CALLBACK`
        kind, this flag indicates that the argument supply is optional.
        If no argument is given then data of [glib.types.OptionParseFunc] will be
        set to NULL. Since 2.8
  */
  OptionalArg = 32,

  /**
      This flag turns off the automatic conflict
        resolution which prefixes long option names with `groupname-` if
        there is a conflict. This option should only be used in situations
        where aliasing is necessary to model some legacy commandline interface.
        It is not safe to use this option, unless all option groups are under
        your direct control. Since 2.8.
  */
  Noalias = 64,
}

/**
    Flags specifying compile-time options.
*/
enum RegexCompileFlags : uint
{
  /**
      No special options set. Since: 2.74
  */
  Default = 0,

  /**
      Letters in the pattern match both upper- and
        lowercase letters. This option can be changed within a pattern
        by a "(?i)" option setting.
  */
  Caseless = 1,

  /**
      By default, GRegex treats the strings as consisting
        of a single line of characters (even if it actually contains
        newlines). The "start of line" metacharacter ("^") matches only
        at the start of the string, while the "end of line" metacharacter
        ("$") matches only at the end of the string, or before a terminating
        newline (unless `G_REGEX_DOLLAR_ENDONLY` is set). When
        `G_REGEX_MULTILINE` is set, the "start of line" and "end of line"
        constructs match immediately following or immediately before any
        newline in the string, respectively, as well as at the very start
        and end. This can be changed within a pattern by a "(?m)" option
        setting.
  */
  Multiline = 2,

  /**
      A dot metacharacter (".") in the pattern matches all
        characters, including newlines. Without it, newlines are excluded.
        This option can be changed within a pattern by a ("?s") option setting.
  */
  Dotall = 4,

  /**
      Whitespace data characters in the pattern are
        totally ignored except when escaped or inside a character class.
        Whitespace does not include the VT character (code 11). In addition,
        characters between an unescaped "#" outside a character class and
        the next newline character, inclusive, are also ignored. This can
        be changed within a pattern by a "(?x)" option setting.
  */
  Extended = 8,

  /**
      The pattern is forced to be "anchored", that is,
        it is constrained to match only at the first matching point in the
        string that is being searched. This effect can also be achieved by
        appropriate constructs in the pattern itself such as the "^"
        metacharacter.
  */
  Anchored = 16,

  /**
      A dollar metacharacter ("$") in the pattern
        matches only at the end of the string. Without this option, a
        dollar also matches immediately before the final character if
        it is a newline (but not before any other newlines). This option
        is ignored if `G_REGEX_MULTILINE` is set.
  */
  DollarEndonly = 32,

  /**
      Inverts the "greediness" of the quantifiers so that
        they are not greedy by default, but become greedy if followed by "?".
        It can also be set by a "(?U)" option setting within the pattern.
  */
  Ungreedy = 512,

  /**
      Usually strings must be valid UTF-8 strings, using this
        flag they are considered as a raw sequence of bytes.
  */
  Raw = 2048,

  /**
      Disables the use of numbered capturing
        parentheses in the pattern. Any opening parenthesis that is not
        followed by "?" behaves as if it were followed by "?:" but named
        parentheses can still be used for capturing (and they acquire numbers
        in the usual way).
  */
  NoAutoCapture = 4096,

  /**
      Since 2.74 and the port to pcre2, requests JIT
        compilation, which, if the just-in-time compiler is available, further
        processes a compiled pattern into machine code that executes much
        faster. However, it comes at the cost of extra processing before the
        match is performed, so it is most beneficial to use this when the same
        compiled pattern is used for matching many times. Before 2.74 this
        option used the built-in non-JIT optimizations in pcre1.
  */
  Optimize = 8192,

  /**
      Limits an unanchored pattern to match before (or at) the
        first newline. Since: 2.34
  */
  Firstline = 262144,

  /**
      Names used to identify capturing subpatterns need not
        be unique. This can be helpful for certain types of pattern when it
        is known that only one instance of the named subpattern can ever be
        matched.
  */
  Dupnames = 524288,

  /**
      Usually any newline character or character sequence is
        recognized. If this option is set, the only recognized newline character
        is '\r'.
  */
  NewlineCr = 1048576,

  /**
      Usually any newline character or character sequence is
        recognized. If this option is set, the only recognized newline character
        is '\n'.
  */
  NewlineLf = 2097152,

  /**
      Usually any newline character or character sequence is
        recognized. If this option is set, the only recognized newline character
        sequence is '\r\n'.
  */
  NewlineCrlf = 3145728,

  /**
      Usually any newline character or character sequence
        is recognized. If this option is set, the only recognized newline character
        sequences are '\r', '\n', and '\r\n'. Since: 2.34
  */
  NewlineAnycrlf = 5242880,

  /**
      Usually any newline character or character sequence
        is recognised. If this option is set, then "\R" only recognizes the newline
       characters '\r', '\n' and '\r\n'. Since: 2.34
  */
  BsrAnycrlf = 8388608,

  /**
      Changes behaviour so that it is compatible with
        JavaScript rather than PCRE. Since GLib 2.74 this is no longer supported,
        as libpcre2 does not support it. Since: 2.34 Deprecated: 2.74
  */
  JavascriptCompat = 33554432,
}

/**
    Error codes returned by regular expressions functions.
*/
enum RegexError
{
  /**
      Compilation of the regular expression failed.
  */
  Compile = 0,

  /**
      Optimization of the regular expression failed.
  */
  Optimize = 1,

  /**
      Replacement failed due to an ill-formed replacement
        string.
  */
  Replace = 2,

  /**
      The match process failed.
  */
  Match = 3,

  /**
      Internal error of the regular expression engine.
        Since 2.16
  */
  Internal = 4,

  /**
      "\\" at end of pattern. Since 2.16
  */
  StrayBackslash = 101,

  /**
      "\\c" at end of pattern. Since 2.16
  */
  MissingControlChar = 102,

  /**
      Unrecognized character follows "\\".
        Since 2.16
  */
  UnrecognizedEscape = 103,

  /**
      Numbers out of order in "{}"
        quantifier. Since 2.16
  */
  QuantifiersOutOfOrder = 104,

  /**
      Number too big in "{}" quantifier.
        Since 2.16
  */
  QuantifierTooBig = 105,

  /**
      Missing terminating "]" for
        character class. Since 2.16
  */
  UnterminatedCharacterClass = 106,

  /**
      Invalid escape sequence
        in character class. Since 2.16
  */
  InvalidEscapeInCharacterClass = 107,

  /**
      Range out of order in character class.
        Since 2.16
  */
  RangeOutOfOrder = 108,

  /**
      Nothing to repeat. Since 2.16
  */
  NothingToRepeat = 109,

  /**
      Unrecognized character after "(?",
        "(?<" or "(?P". Since 2.16
  */
  UnrecognizedCharacter = 112,

  /**
      POSIX named classes are
        supported only within a class. Since 2.16
  */
  PosixNamedClassOutsideClass = 113,

  /**
      Missing terminating ")" or ")"
        without opening "(". Since 2.16
  */
  UnmatchedParenthesis = 114,

  /**
      Reference to non-existent
        subpattern. Since 2.16
  */
  InexistentSubpatternReference = 115,

  /**
      Missing terminating ")" after comment.
        Since 2.16
  */
  UnterminatedComment = 118,

  /**
      Regular expression too large.
        Since 2.16
  */
  ExpressionTooLarge = 120,

  /**
      Failed to get memory. Since 2.16
  */
  MemoryError = 121,

  /**
      Lookbehind assertion is not
        fixed length. Since 2.16
  */
  VariableLengthLookbehind = 125,

  /**
      Malformed number or name after "(?(".
        Since 2.16
  */
  MalformedCondition = 126,

  /**
      Conditional group contains
        more than two branches. Since 2.16
  */
  TooManyConditionalBranches = 127,

  /**
      Assertion expected after "(?(".
        Since 2.16
  */
  AssertionExpected = 128,

  /**
      Unknown POSIX class name.
        Since 2.16
  */
  UnknownPosixClassName = 130,

  /**
      POSIX collating
        elements are not supported. Since 2.16
  */
  PosixCollatingElementsNotSupported = 131,

  /**
      Character value in "\\x{...}" sequence
        is too large. Since 2.16
  */
  HexCodeTooLarge = 134,

  /**
      Invalid condition "(?(0)". Since 2.16
  */
  InvalidCondition = 135,

  /**
      \\C not allowed in
        lookbehind assertion. Since 2.16
  */
  SingleByteMatchInLookbehind = 136,

  /**
      Recursive call could loop indefinitely.
        Since 2.16
  */
  InfiniteLoop = 140,

  /**
      Missing terminator
        in subpattern name. Since 2.16
  */
  MissingSubpatternNameTerminator = 142,

  /**
      Two named subpatterns have
        the same name. Since 2.16
  */
  DuplicateSubpatternName = 143,

  /**
      Malformed "\\P" or "\\p" sequence.
        Since 2.16
  */
  MalformedProperty = 146,

  /**
      Unknown property name after "\\P" or
        "\\p". Since 2.16
  */
  UnknownProperty = 147,

  /**
      Subpattern name is too long
        (maximum 32 characters). Since 2.16
  */
  SubpatternNameTooLong = 148,

  /**
      Too many named subpatterns (maximum
        10,000). Since 2.16
  */
  TooManySubpatterns = 149,

  /**
      Octal value is greater than "\\377".
        Since 2.16
  */
  InvalidOctalValue = 151,

  /**
      "DEFINE" group contains more
        than one branch. Since 2.16
  */
  TooManyBranchesInDefine = 154,

  /**
      Repeating a "DEFINE" group is not allowed.
        This error is never raised. Since: 2.16 Deprecated: 2.34
  */
  DefineRepetion = 155,

  /**
      Inconsistent newline options.
        Since 2.16
  */
  InconsistentNewlineOptions = 156,

  /**
      "\\g" is not followed by a braced,
         angle-bracketed, or quoted name or number, or by a plain number. Since: 2.16
  */
  MissingBackReference = 157,

  /**
      relative reference must not be zero. Since: 2.34
  */
  InvalidRelativeReference = 158,

  /**
      the backtracing
        control verb used does not allow an argument. Since: 2.34
  */
  BacktrackingControlVerbArgumentForbidden = 159,

  /**
      unknown backtracing
        control verb. Since: 2.34
  */
  UnknownBacktrackingControlVerb = 160,

  /**
      number is too big in escape sequence. Since: 2.34
  */
  NumberTooBig = 161,

  /**
      Missing subpattern name. Since: 2.34
  */
  MissingSubpatternName = 162,

  /**
      Missing digit. Since 2.34
  */
  MissingDigit = 163,

  /**
      In JavaScript compatibility mode,
        "[" is an invalid data character. Since: 2.34
  */
  InvalidDataCharacter = 164,

  /**
      different names for subpatterns of the
        same number are not allowed. Since: 2.34
  */
  ExtraSubpatternName = 165,

  /**
      the backtracing control
        verb requires an argument. Since: 2.34
  */
  BacktrackingControlVerbArgumentRequired = 166,

  /**
      "\\c" must be followed by an ASCII
        character. Since: 2.34
  */
  InvalidControlChar = 168,

  /**
      "\\k" is not followed by a braced, angle-bracketed, or
        quoted name. Since: 2.34
  */
  MissingName = 169,

  /**
      "\\N" is not supported in a class. Since: 2.34
  */
  NotSupportedInClass = 171,

  /**
      too many forward references. Since: 2.34
  */
  TooManyForwardReferences = 172,

  /**
      the name is too long in "(*MARK)", "(*PRUNE)",
        "(*SKIP)", or "(*THEN)". Since: 2.34
  */
  NameTooLong = 175,

  /**
      the character value in the \\u sequence is
        too large. Since: 2.34
  */
  CharacterValueTooLarge = 176,
}

/**
    Flags specifying match-time options.
*/
enum RegexMatchFlags : uint
{
  /**
      No special options set. Since: 2.74
  */
  Default = 0,

  /**
      The pattern is forced to be "anchored", that is,
        it is constrained to match only at the first matching point in the
        string that is being searched. This effect can also be achieved by
        appropriate constructs in the pattern itself such as the "^"
        metacharacter.
  */
  Anchored = 16,

  /**
      Specifies that first character of the string is
        not the beginning of a line, so the circumflex metacharacter should
        not match before it. Setting this without `G_REGEX_MULTILINE` (at
        compile time) causes circumflex never to match. This option affects
        only the behaviour of the circumflex metacharacter, it does not
        affect "\A".
  */
  Notbol = 128,

  /**
      Specifies that the end of the subject string is
        not the end of a line, so the dollar metacharacter should not match
        it nor (except in multiline mode) a newline immediately before it.
        Setting this without `G_REGEX_MULTILINE` (at compile time) causes
        dollar never to match. This option affects only the behaviour of
        the dollar metacharacter, it does not affect "\Z" or "\z".
  */
  Noteol = 256,

  /**
      An empty string is not considered to be a valid
        match if this option is set. If there are alternatives in the pattern,
        they are tried. If all the alternatives match the empty string, the
        entire match fails. For example, if the pattern "a?b?" is applied to
        a string not beginning with "a" or "b", it matches the empty string
        at the start of the string. With this flag set, this match is not
        valid, so GRegex searches further into the string for occurrences
        of "a" or "b".
  */
  Notempty = 1024,

  /**
      Turns on the partial matching feature, for more
        documentation on partial matching see [glib.match_info.MatchInfo.isPartialMatch].
  */
  Partial = 32768,

  /**
      Overrides the newline definition set when
        creating a new #GRegex, setting the '\r' character as line terminator.
  */
  NewlineCr = 1048576,

  /**
      Overrides the newline definition set when
        creating a new #GRegex, setting the '\n' character as line terminator.
  */
  NewlineLf = 2097152,

  /**
      Overrides the newline definition set when
        creating a new #GRegex, setting the '\r\n' characters sequence as line terminator.
  */
  NewlineCrlf = 3145728,

  /**
      Overrides the newline definition set when
        creating a new #GRegex, any Unicode newline sequence
        is recognised as a newline. These are '\r', '\n' and '\rn', and the
        single characters U+000B LINE TABULATION, U+000C FORM FEED (FF),
        U+0085 NEXT LINE (NEL), U+2028 LINE SEPARATOR and
        U+2029 PARAGRAPH SEPARATOR.
  */
  NewlineAny = 4194304,

  /**
      Overrides the newline definition set when
        creating a new #GRegex; any '\r', '\n', or '\r\n' character sequence
        is recognized as a newline. Since: 2.34
  */
  NewlineAnycrlf = 5242880,

  /**
      Overrides the newline definition for "\R" set when
        creating a new #GRegex; only '\r', '\n', or '\r\n' character sequences
        are recognized as a newline by "\R". Since: 2.34
  */
  BsrAnycrlf = 8388608,

  /**
      Overrides the newline definition for "\R" set when
        creating a new #GRegex; any Unicode newline character or character sequence
        are recognized as a newline by "\R". These are '\r', '\n' and '\rn', and the
        single characters U+000B LINE TABULATION, U+000C FORM FEED (FF),
        U+0085 NEXT LINE (NEL), U+2028 LINE SEPARATOR and
        U+2029 PARAGRAPH SEPARATOR. Since: 2.34
  */
  BsrAny = 16777216,

  /**
      An alias for `G_REGEX_MATCH_PARTIAL`. Since: 2.34
  */
  PartialSoft = 32768,

  /**
      Turns on the partial matching feature. In contrast to
        to `G_REGEX_MATCH_PARTIAL_SOFT`, this stops matching as soon as a partial match
        is found, without continuing to search for a possible complete match. See
        [glib.match_info.MatchInfo.isPartialMatch] for more information. Since: 2.34
  */
  PartialHard = 134217728,

  /**
      Like `G_REGEX_MATCH_NOTEMPTY`, but only applied to
        the start of the matched string. For anchored
        patterns this can only happen for pattern containing "\K". Since: 2.34
  */
  NotemptyAtstart = 268435456,
}

/**
    An enumeration specifying the base position for a
  [glib.iochannel.IOChannel.seekPosition] operation.
*/
enum SeekType
{
  /**
      the current position in the file.
  */
  Cur = 0,

  /**
      the start of the file.
  */
  Set = 1,

  /**
      the end of the file.
  */
  End = 2,
}

/**
    Error codes returned by shell functions.
*/
enum ShellError
{
  /**
      Mismatched or otherwise mangled quoting.
  */
  BadQuoting = 0,

  /**
      String to be parsed was empty.
  */
  EmptyString = 1,

  /**
      Some other error.
  */
  Failed = 2,
}

/** */
enum SliceConfig
{
  /** */
  AlwaysMalloc = 1,

  /** */
  BypassMagazines = 2,

  /** */
  WorkingSetMsecs = 3,

  /** */
  ColorIncrement = 4,

  /** */
  ChunkSizes = 5,

  /** */
  ContentionCounter = 6,
}

/**
    Error codes returned by spawning processes.
*/
enum SpawnError
{
  /**
      Fork failed due to lack of memory.
  */
  Fork = 0,

  /**
      Read or select on pipes failed.
  */
  Read = 1,

  /**
      Changing to working directory failed.
  */
  Chdir = 2,

  /**
      execv() returned `EACCES`
  */
  Acces = 3,

  /**
      execv() returned `EPERM`
  */
  Perm = 4,

  /**
      execv() returned `E2BIG`
  */
  TooBig = 5,

  /**
      deprecated alias for `G_SPAWN_ERROR_TOO_BIG` (deprecated since GLib 2.32)
  */
  _2big = 5,

  /**
      execv() returned `ENOEXEC`
  */
  Noexec = 6,

  /**
      execv() returned `ENAMETOOLONG`
  */
  Nametoolong = 7,

  /**
      execv() returned `ENOENT`
  */
  Noent = 8,

  /**
      execv() returned `ENOMEM`
  */
  Nomem = 9,

  /**
      execv() returned `ENOTDIR`
  */
  Notdir = 10,

  /**
      execv() returned `ELOOP`
  */
  Loop = 11,

  /**
      execv() returned `ETXTBUSY`
  */
  Txtbusy = 12,

  /**
      execv() returned `EIO`
  */
  Io = 13,

  /**
      execv() returned `ENFILE`
  */
  Nfile = 14,

  /**
      execv() returned `EMFILE`
  */
  Mfile = 15,

  /**
      execv() returned `EINVAL`
  */
  Inval = 16,

  /**
      execv() returned `EISDIR`
  */
  Isdir = 17,

  /**
      execv() returned `ELIBBAD`
  */
  Libbad = 18,

  /**
      Some other fatal failure,
      `error->message` should explain.
  */
  Failed = 19,
}

/**
    Flags passed to [glib.global.spawnSync], [glib.global.spawnAsync] and [glib.global.spawnAsyncWithPipes].
*/
enum SpawnFlags : uint
{
  /**
      no flags, default behaviour
  */
  Default = 0,

  /**
      the parent's open file descriptors will
        be inherited by the child; otherwise all descriptors except stdin,
        stdout and stderr will be closed before calling exec() in the child.
  */
  LeaveDescriptorsOpen = 1,

  /**
      the child will not be automatically reaped;
        you must use [glib.global.childWatchAdd] yourself (or call waitpid() or handle
        `SIGCHLD` yourself), or the child will become a zombie.
  */
  DoNotReapChild = 2,

  /**
      `argv[0]` need not be an absolute path, it will be
        looked for in the user's `PATH`.
  */
  SearchPath = 4,

  /**
      the child's standard output will be discarded,
        instead of going to the same location as the parent's standard output.
  */
  StdoutToDevNull = 8,

  /**
      the child's standard error will be discarded.
  */
  StderrToDevNull = 16,

  /**
      the child will inherit the parent's standard
        input (by default, the child's standard input is attached to `/dev/null`).
  */
  ChildInheritsStdin = 32,

  /**
      the first element of `argv` is the file to
        execute, while the remaining elements are the actual argument vector
        to pass to the file. Normally [glib.global.spawnAsyncWithPipes] uses `argv[0]`
        as the file to execute, and passes all of `argv` to the child.
  */
  FileAndArgvZero = 64,

  /**
      if `argv[0]` is not an absolute path,
        it will be looked for in the `PATH` from the passed child environment.
        Since: 2.34
  */
  SearchPathFromEnvp = 128,

  /**
      create all pipes with the `O_CLOEXEC` flag set.
        Since: 2.40
  */
  CloexecPipes = 256,

  /**
      The child will inherit the parent's standard output.
  */
  ChildInheritsStdout = 512,

  /**
      The child will inherit the parent's standard error.
  */
  ChildInheritsStderr = 1024,

  /**
      The child's standard input is attached to `/dev/null`.
  */
  StdinFromDevNull = 2048,
}

/**
    The type of file to return the filename for, when used with
  [glib.global.testBuildFilename].
  
  These two options correspond rather directly to the 'dist' and
  'built' terminology that automake uses and are explicitly used to
  distinguish between the 'srcdir' and 'builddir' being separate.  All
  files in your project should either be dist (in the
  `EXTRA_DIST` or `dist_schema_DATA`
  sense, in which case they will always be in the srcdir) or built (in
  the `BUILT_SOURCES` sense, in which case they will
  always be in the builddir).
  
  Note: as a general rule of automake, files that are generated only as
  part of the build-from-git process (but then are distributed with the
  tarball) always go in srcdir (even if doing a srcdir != builddir
  build from git) and are considered as distributed files.
*/
enum TestFileType
{
  /**
      a file that was included in the distribution tarball
  */
  Dist = 0,

  /**
      a file that was built on the compiling machine
  */
  Built = 1,
}

/** */
enum TestLogType
{
  /** */
  None = 0,

  /** */
  Error = 1,

  /** */
  StartBinary = 2,

  /** */
  ListCase = 3,

  /** */
  SkipCase = 4,

  /** */
  StartCase = 5,

  /** */
  StopCase = 6,

  /** */
  MinResult = 7,

  /** */
  MaxResult = 8,

  /** */
  Message = 9,

  /** */
  StartSuite = 10,

  /** */
  StopSuite = 11,
}

/** */
enum TestResult
{
  /** */
  Success = 0,

  /** */
  Skipped = 1,

  /** */
  Failure = 2,

  /** */
  Incomplete = 3,
}

/**
    Flags to pass to [glib.global.testTrapSubprocess] to control input and output.
  
  Note that in contrast with [glib.global.testTrapFork], the default is to
  not show stdout and stderr.
*/
enum TestSubprocessFlags : uint
{
  /**
      Default behaviour. Since: 2.74
  */
  Default = 0,

  /**
      If this flag is given, the child
        process will inherit the parent's stdin. Otherwise, the child's
        stdin is redirected to `/dev/null`.
  */
  InheritStdin = 1,

  /**
      If this flag is given, the child
        process will inherit the parent's stdout. Otherwise, the child's
        stdout will not be visible, but it will be captured to allow
        later tests with g_test_trap_assert_stdout().
  */
  InheritStdout = 2,

  /**
      If this flag is given, the child
        process will inherit the parent's stderr. Otherwise, the child's
        stderr will not be visible, but it will be captured to allow
        later tests with g_test_trap_assert_stderr().
  */
  InheritStderr = 4,
}

/**
    Test traps are guards around forked tests.
  These flags determine what traps to set.

  Deprecated:     #GTestTrapFlags is used only with [glib.global.testTrapFork],
    which is deprecated. [glib.global.testTrapSubprocess] uses
    #GTestSubprocessFlags.
*/
enum TestTrapFlags : uint
{
  /**
      Default behaviour. Since: 2.74
  */
  Default = 0,

  /**
      Redirect stdout of the test child to
        `/dev/null` so it cannot be observed on the console during test
        runs. The actual output is still captured though to allow later
        tests with g_test_trap_assert_stdout().
  */
  SilenceStdout = 128,

  /**
      Redirect stderr of the test child to
        `/dev/null` so it cannot be observed on the console during test
        runs. The actual output is still captured though to allow later
        tests with g_test_trap_assert_stderr().
  */
  SilenceStderr = 256,

  /**
      If this flag is given, stdin of the
        child process is shared with stdin of its parent process.
        It is redirected to `/dev/null` otherwise.
  */
  InheritStdin = 512,
}

/**
    Possible errors of thread related functions.
*/
enum ThreadError
{
  /**
      a thread couldn't be created due to resource
                           shortage. Try again later.
  */
  ThreadErrorAgain = 0,
}

/**
    Thread priorities.

  Deprecated:     Thread priorities no longer have any effect.
*/
enum ThreadPriority
{
  /**
      a priority lower than normal
  */
  Low = 0,

  /**
      the default priority
  */
  Normal = 1,

  /**
      a priority higher than normal
  */
  High = 2,

  /**
      the highest priority
  */
  Urgent = 3,
}

/**
    Disambiguates a given time in two ways.
  
  First, specifies if the given time is in universal or local time.
  
  Second, if the time is in local time, specifies if it is local
  standard time or local daylight time.  This is important for the case
  where the same local time occurs twice (during daylight savings time
  transitions, for example).
*/
enum TimeType
{
  /**
      the time is in local standard time
  */
  Standard = 0,

  /**
      the time is in local daylight time
  */
  Daylight = 1,

  /**
      the time is in UTC
  */
  Universal = 2,
}

/**
    The possible types of token returned from each
  [glib.scanner.Scanner.getNextToken] call.
*/
enum TokenType
{
  /**
      the end of the file
  */
  Eof = 0,

  /**
      a '(' character
  */
  LeftParen = 40,

  /**
      a ')' character
  */
  RightParen = 41,

  /**
      a '{' character
  */
  LeftCurly = 123,

  /**
      a '}' character
  */
  RightCurly = 125,

  /**
      a '[' character
  */
  LeftBrace = 91,

  /**
      a ']' character
  */
  RightBrace = 93,

  /**
      a '=' character
  */
  EqualSign = 61,

  /**
      a ',' character
  */
  Comma = 44,

  /**
      not a token
  */
  None = 256,

  /**
      an error occurred
  */
  Error = 257,

  /**
      a character
  */
  Char = 258,

  /**
      a binary integer
  */
  Binary = 259,

  /**
      an octal integer
  */
  Octal = 260,

  /**
      an integer
  */
  Int = 261,

  /**
      a hex integer
  */
  Hex = 262,

  /**
      a floating point number
  */
  Float = 263,

  /**
      a string
  */
  String = 264,

  /**
      a symbol
  */
  Symbol = 265,

  /**
      an identifier
  */
  Identifier = 266,

  /**
      a null identifier
  */
  IdentifierNull = 267,

  /**
      one line comment
  */
  CommentSingle = 268,

  /**
      multi line comment
  */
  CommentMulti = 269,
}

/**
    Specifies which nodes are visited during several of the tree
  functions, including [glib.node.Node.traverse] and [glib.node.Node.find].
*/
enum TraverseFlags : uint
{
  /**
      only leaf nodes should be visited. This name has
                        been introduced in 2.6, for older version use
                        `G_TRAVERSE_LEAFS`.
  */
  Leaves = 1,

  /**
      only non-leaf nodes should be visited. This
                            name has been introduced in 2.6, for older
                            version use `G_TRAVERSE_NON_LEAFS`.
  */
  NonLeaves = 2,

  /**
      all nodes should be visited.
  */
  All = 3,

  /**
      a mask of all traverse flags.
  */
  Mask = 3,

  /**
      identical to `G_TRAVERSE_LEAVES`.
  */
  Leafs = 1,

  /**
      identical to `G_TRAVERSE_NON_LEAVES`.
  */
  NonLeafs = 2,
}

/**
    Specifies the type of traversal performed by [glib.tree.Tree.traverse],
  [glib.node.Node.traverse] and [glib.node.Node.find]. The different orders are
  illustrated here:
  $(LIST
    * In order: A, B, C, D, E, F, G, H, I
      ![](Sorted_binary_tree_inorder.svg)
    * Pre order: F, B, A, D, C, E, G, I, H
      ![](Sorted_binary_tree_preorder.svg)
    * Post order: A, C, E, D, B, H, I, G, F
      ![](Sorted_binary_tree_postorder.svg)
    * Level order: F, B, G, A, D, I, C, E, H
      ![](Sorted_binary_tree_breadth-first_traversal.svg)
  )
*/
enum TraverseType
{
  /**
      vists a node's left child first, then the node itself,
                 then its right child. This is the one to use if you
                 want the output sorted according to the compare
                 function.
  */
  InOrder = 0,

  /**
      visits a node, then its children.
  */
  PreOrder = 1,

  /**
      visits the node's children, then the node itself.
  */
  PostOrder = 2,

  /**
      is not implemented for
                 [balanced binary trees][glib-Balanced-Binary-Trees].
                 For [n-ary trees][glib-N-ary-Trees], it
                 vists the root node first, then its children, then
                 its grandchildren, and so on. Note that this is less
                 efficient than the other orders.
  */
  LevelOrder = 3,
}

/**
    These are the possible line break classifications.
  
  Since new Unicode versions may add new types here, applications should be ready
  to handle unknown values. They may be regarded as [glib.types.UnicodeBreakType.Unknown].
  
  See [Unicode Line Breaking Algorithm](https://www.unicode.org/reports/tr14/).
*/
enum UnicodeBreakType
{
  /**
      Mandatory Break (BK)
  */
  Mandatory = 0,

  /**
      Carriage Return (CR)
  */
  CarriageReturn = 1,

  /**
      Line Feed (LF)
  */
  LineFeed = 2,

  /**
      Attached Characters and Combining Marks (CM)
  */
  CombiningMark = 3,

  /**
      Surrogates (SG)
  */
  Surrogate = 4,

  /**
      Zero Width Space (ZW)
  */
  ZeroWidthSpace = 5,

  /**
      Inseparable (IN)
  */
  Inseparable = 6,

  /**
      Non-breaking ("Glue") (GL)
  */
  NonBreakingGlue = 7,

  /**
      Contingent Break Opportunity (CB)
  */
  Contingent = 8,

  /**
      Space (SP)
  */
  Space = 9,

  /**
      Break Opportunity After (BA)
  */
  After = 10,

  /**
      Break Opportunity Before (BB)
  */
  Before = 11,

  /**
      Break Opportunity Before and After (B2)
  */
  BeforeAndAfter = 12,

  /**
      Hyphen (HY)
  */
  Hyphen = 13,

  /**
      Nonstarter (NS)
  */
  NonStarter = 14,

  /**
      Opening Punctuation (OP)
  */
  OpenPunctuation = 15,

  /**
      Closing Punctuation (CL)
  */
  ClosePunctuation = 16,

  /**
      Ambiguous Quotation (QU)
  */
  Quotation = 17,

  /**
      Exclamation/Interrogation (EX)
  */
  Exclamation = 18,

  /**
      Ideographic (ID)
  */
  Ideographic = 19,

  /**
      Numeric (NU)
  */
  Numeric = 20,

  /**
      Infix Separator (Numeric) (IS)
  */
  InfixSeparator = 21,

  /**
      Symbols Allowing Break After (SY)
  */
  Symbol = 22,

  /**
      Ordinary Alphabetic and Symbol Characters (AL)
  */
  Alphabetic = 23,

  /**
      Prefix (Numeric) (PR)
  */
  Prefix = 24,

  /**
      Postfix (Numeric) (PO)
  */
  Postfix = 25,

  /**
      Complex Content Dependent (South East Asian) (SA)
  */
  ComplexContext = 26,

  /**
      Ambiguous (Alphabetic or Ideographic) (AI)
  */
  Ambiguous = 27,

  /**
      Unknown (XX)
  */
  Unknown = 28,

  /**
      Next Line (NL)
  */
  NextLine = 29,

  /**
      Word Joiner (WJ)
  */
  WordJoiner = 30,

  /**
      Hangul L Jamo (JL)
  */
  HangulLJamo = 31,

  /**
      Hangul V Jamo (JV)
  */
  HangulVJamo = 32,

  /**
      Hangul T Jamo (JT)
  */
  HangulTJamo = 33,

  /**
      Hangul LV Syllable (H2)
  */
  HangulLvSyllable = 34,

  /**
      Hangul LVT Syllable (H3)
  */
  HangulLvtSyllable = 35,

  /**
      Closing Parenthesis (CP). Since 2.28. Deprecated: 2.70: Use [glib.types.UnicodeBreakType.CloseParenthesis] instead.
  */
  CloseParanthesis = 36,

  /**
      Closing Parenthesis (CP). Since 2.70
  */
  CloseParenthesis = 36,

  /**
      Conditional Japanese Starter (CJ). Since: 2.32
  */
  ConditionalJapaneseStarter = 37,

  /**
      Hebrew Letter (HL). Since: 2.32
  */
  HebrewLetter = 38,

  /**
      Regional Indicator (RI). Since: 2.36
  */
  RegionalIndicator = 39,

  /**
      Emoji Base (EB). Since: 2.50
  */
  EmojiBase = 40,

  /**
      Emoji Modifier (EM). Since: 2.50
  */
  EmojiModifier = 41,

  /**
      Zero Width Joiner (ZWJ). Since: 2.50
  */
  ZeroWidthJoiner = 42,

  /**
      Aksara (AK). Since: 2.80
    @G_UNICODE_BREAK_AKSARA_PRE_BASE (AP). Since: 2.80
    @G_UNICODE_BREAK_AKSARA_START (AS). Since: 2.80
    @G_UNICODE_BREAK_VIRAMA_FINAL (VF). Since: 2.80
    @G_UNICODE_BREAK_VIRAMA (VI). Since: 2.80
  */
  Aksara = 43,

  /** */
  AksaraPreBase = 44,

  /** */
  AksaraStart = 45,

  /** */
  ViramaFinal = 46,

  /** */
  Virama = 47,
}

/**
    The #GUnicodeScript enumeration identifies different writing
  systems. The values correspond to the names as defined in the
  Unicode standard. The enumeration has been added in GLib 2.14,
  and is interchangeable with #PangoScript.
  
  Note that new types may be added in the future. Applications
  should be ready to handle unknown values.
  See [Unicode Standard Annex #24: Script names](http://www.unicode.org/reports/tr24/).
*/
enum UnicodeScript
{
  /**
      a value never returned from [glib.global.unicharGetScript]
  */
  InvalidCode = -1,

  /**
      a character used by multiple different scripts
  */
  Common = 0,

  /**
      a mark glyph that takes its script from the
                                  base glyph to which it is attached
  */
  Inherited = 1,

  /**
      Arabic
  */
  Arabic = 2,

  /**
      Armenian
  */
  Armenian = 3,

  /**
      Bengali
  */
  Bengali = 4,

  /**
      Bopomofo
  */
  Bopomofo = 5,

  /**
      Cherokee
  */
  Cherokee = 6,

  /**
      Coptic
  */
  Coptic = 7,

  /**
      Cyrillic
  */
  Cyrillic = 8,

  /**
      Deseret
  */
  Deseret = 9,

  /**
      Devanagari
  */
  Devanagari = 10,

  /**
      Ethiopic
  */
  Ethiopic = 11,

  /**
      Georgian
  */
  Georgian = 12,

  /**
      Gothic
  */
  Gothic = 13,

  /**
      Greek
  */
  Greek = 14,

  /**
      Gujarati
  */
  Gujarati = 15,

  /**
      Gurmukhi
  */
  Gurmukhi = 16,

  /**
      Han
  */
  Han = 17,

  /**
      Hangul
  */
  Hangul = 18,

  /**
      Hebrew
  */
  Hebrew = 19,

  /**
      Hiragana
  */
  Hiragana = 20,

  /**
      Kannada
  */
  Kannada = 21,

  /**
      Katakana
  */
  Katakana = 22,

  /**
      Khmer
  */
  Khmer = 23,

  /**
      Lao
  */
  Lao = 24,

  /**
      Latin
  */
  Latin = 25,

  /**
      Malayalam
  */
  Malayalam = 26,

  /**
      Mongolian
  */
  Mongolian = 27,

  /**
      Myanmar
  */
  Myanmar = 28,

  /**
      Ogham
  */
  Ogham = 29,

  /**
      Old Italic
  */
  OldItalic = 30,

  /**
      Oriya
  */
  Oriya = 31,

  /**
      Runic
  */
  Runic = 32,

  /**
      Sinhala
  */
  Sinhala = 33,

  /**
      Syriac
  */
  Syriac = 34,

  /**
      Tamil
  */
  Tamil = 35,

  /**
      Telugu
  */
  Telugu = 36,

  /**
      Thaana
  */
  Thaana = 37,

  /**
      Thai
  */
  Thai = 38,

  /**
      Tibetan
  */
  Tibetan = 39,

  /**
      Canadian Aboriginal
  */
  CanadianAboriginal = 40,

  /**
      Yi
  */
  Yi = 41,

  /**
      Tagalog
  */
  Tagalog = 42,

  /**
      Hanunoo
  */
  Hanunoo = 43,

  /**
      Buhid
  */
  Buhid = 44,

  /**
      Tagbanwa
  */
  Tagbanwa = 45,

  /**
      Braille
  */
  Braille = 46,

  /**
      Cypriot
  */
  Cypriot = 47,

  /**
      Limbu
  */
  Limbu = 48,

  /**
      Osmanya
  */
  Osmanya = 49,

  /**
      Shavian
  */
  Shavian = 50,

  /**
      Linear B
  */
  LinearB = 51,

  /**
      Tai Le
  */
  TaiLe = 52,

  /**
      Ugaritic
  */
  Ugaritic = 53,

  /**
      New Tai Lue
  */
  NewTaiLue = 54,

  /**
      Buginese
  */
  Buginese = 55,

  /**
      Glagolitic
  */
  Glagolitic = 56,

  /**
      Tifinagh
  */
  Tifinagh = 57,

  /**
      Syloti Nagri
  */
  SylotiNagri = 58,

  /**
      Old Persian
  */
  OldPersian = 59,

  /**
      Kharoshthi
  */
  Kharoshthi = 60,

  /**
      an unassigned code point
  */
  Unknown = 61,

  /**
      Balinese
  */
  Balinese = 62,

  /**
      Cuneiform
  */
  Cuneiform = 63,

  /**
      Phoenician
  */
  Phoenician = 64,

  /**
      Phags-pa
  */
  PhagsPa = 65,

  /**
      N'Ko
  */
  Nko = 66,

  /**
      Kayah Li. Since 2.16.3
  */
  KayahLi = 67,

  /**
      Lepcha. Since 2.16.3
  */
  Lepcha = 68,

  /**
      Rejang. Since 2.16.3
  */
  Rejang = 69,

  /**
      Sundanese. Since 2.16.3
  */
  Sundanese = 70,

  /**
      Saurashtra. Since 2.16.3
  */
  Saurashtra = 71,

  /**
      Cham. Since 2.16.3
  */
  Cham = 72,

  /**
      Ol Chiki. Since 2.16.3
  */
  OlChiki = 73,

  /**
      Vai. Since 2.16.3
  */
  Vai = 74,

  /**
      Carian. Since 2.16.3
  */
  Carian = 75,

  /**
      Lycian. Since 2.16.3
  */
  Lycian = 76,

  /**
      Lydian. Since 2.16.3
  */
  Lydian = 77,

  /**
      Avestan. Since 2.26
  */
  Avestan = 78,

  /**
      Bamum. Since 2.26
  */
  Bamum = 79,

  /**
      Egyptian Hieroglpyhs. Since 2.26
  */
  EgyptianHieroglyphs = 80,

  /**
      Imperial Aramaic. Since 2.26
  */
  ImperialAramaic = 81,

  /**
      Inscriptional Pahlavi. Since 2.26
  */
  InscriptionalPahlavi = 82,

  /**
      Inscriptional Parthian. Since 2.26
  */
  InscriptionalParthian = 83,

  /**
      Javanese. Since 2.26
  */
  Javanese = 84,

  /**
      Kaithi. Since 2.26
  */
  Kaithi = 85,

  /**
      Lisu. Since 2.26
  */
  Lisu = 86,

  /**
      Meetei Mayek. Since 2.26
  */
  MeeteiMayek = 87,

  /**
      Old South Arabian. Since 2.26
  */
  OldSouthArabian = 88,

  /**
      Old Turkic. Since 2.28
  */
  OldTurkic = 89,

  /**
      Samaritan. Since 2.26
  */
  Samaritan = 90,

  /**
      Tai Tham. Since 2.26
  */
  TaiTham = 91,

  /**
      Tai Viet. Since 2.26
  */
  TaiViet = 92,

  /**
      Batak. Since 2.28
  */
  Batak = 93,

  /**
      Brahmi. Since 2.28
  */
  Brahmi = 94,

  /**
      Mandaic. Since 2.28
  */
  Mandaic = 95,

  /**
      Chakma. Since: 2.32
  */
  Chakma = 96,

  /**
      Meroitic Cursive. Since: 2.32
  */
  MeroiticCursive = 97,

  /**
      Meroitic Hieroglyphs. Since: 2.32
  */
  MeroiticHieroglyphs = 98,

  /**
      Miao. Since: 2.32
  */
  Miao = 99,

  /**
      Sharada. Since: 2.32
  */
  Sharada = 100,

  /**
      Sora Sompeng. Since: 2.32
  */
  SoraSompeng = 101,

  /**
      Takri. Since: 2.32
  */
  Takri = 102,

  /**
      Bassa. Since: 2.42
  */
  BassaVah = 103,

  /**
      Caucasian Albanian. Since: 2.42
  */
  CaucasianAlbanian = 104,

  /**
      Duployan. Since: 2.42
  */
  Duployan = 105,

  /**
      Elbasan. Since: 2.42
  */
  Elbasan = 106,

  /**
      Grantha. Since: 2.42
  */
  Grantha = 107,

  /**
      Kjohki. Since: 2.42
  */
  Khojki = 108,

  /**
      Khudawadi, Sindhi. Since: 2.42
  */
  Khudawadi = 109,

  /**
      Linear A. Since: 2.42
  */
  LinearA = 110,

  /**
      Mahajani. Since: 2.42
  */
  Mahajani = 111,

  /**
      Manichaean. Since: 2.42
  */
  Manichaean = 112,

  /**
      Mende Kikakui. Since: 2.42
  */
  MendeKikakui = 113,

  /**
      Modi. Since: 2.42
  */
  Modi = 114,

  /**
      Mro. Since: 2.42
  */
  Mro = 115,

  /**
      Nabataean. Since: 2.42
  */
  Nabataean = 116,

  /**
      Old North Arabian. Since: 2.42
  */
  OldNorthArabian = 117,

  /**
      Old Permic. Since: 2.42
  */
  OldPermic = 118,

  /**
      Pahawh Hmong. Since: 2.42
  */
  PahawhHmong = 119,

  /**
      Palmyrene. Since: 2.42
  */
  Palmyrene = 120,

  /**
      Pau Cin Hau. Since: 2.42
  */
  PauCinHau = 121,

  /**
      Psalter Pahlavi. Since: 2.42
  */
  PsalterPahlavi = 122,

  /**
      Siddham. Since: 2.42
  */
  Siddham = 123,

  /**
      Tirhuta. Since: 2.42
  */
  Tirhuta = 124,

  /**
      Warang Citi. Since: 2.42
  */
  WarangCiti = 125,

  /**
      Ahom. Since: 2.48
  */
  Ahom = 126,

  /**
      Anatolian Hieroglyphs. Since: 2.48
  */
  AnatolianHieroglyphs = 127,

  /**
      Hatran. Since: 2.48
  */
  Hatran = 128,

  /**
      Multani. Since: 2.48
  */
  Multani = 129,

  /**
      Old Hungarian. Since: 2.48
  */
  OldHungarian = 130,

  /**
      Signwriting. Since: 2.48
  */
  Signwriting = 131,

  /**
      Adlam. Since: 2.50
  */
  Adlam = 132,

  /**
      Bhaiksuki. Since: 2.50
  */
  Bhaiksuki = 133,

  /**
      Marchen. Since: 2.50
  */
  Marchen = 134,

  /**
      Newa. Since: 2.50
  */
  Newa = 135,

  /**
      Osage. Since: 2.50
  */
  Osage = 136,

  /**
      Tangut. Since: 2.50
  */
  Tangut = 137,

  /**
      Masaram Gondi. Since: 2.54
  */
  MasaramGondi = 138,

  /**
      Nushu. Since: 2.54
  */
  Nushu = 139,

  /**
      Soyombo. Since: 2.54
  */
  Soyombo = 140,

  /**
      Zanabazar Square. Since: 2.54
  */
  ZanabazarSquare = 141,

  /**
      Dogra. Since: 2.58
  */
  Dogra = 142,

  /**
      Gunjala Gondi. Since: 2.58
  */
  GunjalaGondi = 143,

  /**
      Hanifi Rohingya. Since: 2.58
  */
  HanifiRohingya = 144,

  /**
      Makasar. Since: 2.58
  */
  Makasar = 145,

  /**
      Medefaidrin. Since: 2.58
  */
  Medefaidrin = 146,

  /**
      Old Sogdian. Since: 2.58
  */
  OldSogdian = 147,

  /**
      Sogdian. Since: 2.58
  */
  Sogdian = 148,

  /**
      Elym. Since: 2.62
  */
  Elymaic = 149,

  /**
      Nand. Since: 2.62
  */
  Nandinagari = 150,

  /**
      Rohg. Since: 2.62
  */
  NyiakengPuachueHmong = 151,

  /**
      Wcho. Since: 2.62
  */
  Wancho = 152,

  /**
      Chorasmian. Since: 2.66
  */
  Chorasmian = 153,

  /**
      Dives Akuru. Since: 2.66
  */
  DivesAkuru = 154,

  /**
      Khitan small script. Since: 2.66
  */
  KhitanSmallScript = 155,

  /**
      Yezidi. Since: 2.66
  */
  Yezidi = 156,

  /**
      Cypro-Minoan. Since: 2.72
  */
  CyproMinoan = 157,

  /**
      Old Uyghur. Since: 2.72
  */
  OldUyghur = 158,

  /**
      Tangsa. Since: 2.72
  */
  Tangsa = 159,

  /**
      Toto. Since: 2.72
  */
  Toto = 160,

  /**
      Vithkuqi. Since: 2.72
  */
  Vithkuqi = 161,

  /**
      Mathematical notation. Since: 2.72
  */
  Math = 162,

  /**
      Kawi. Since 2.74
  */
  Kawi = 163,

  /**
      Nag Mundari. Since 2.74
  */
  NagMundari = 164,
}

/**
    These are the possible character classifications from the
  Unicode specification.
  See [Unicode Character Database](http://www.unicode.org/reports/tr44/#General_Category_Values).
*/
enum UnicodeType
{
  /**
      General category "Other, Control" (Cc)
  */
  Control = 0,

  /**
      General category "Other, Format" (Cf)
  */
  Format = 1,

  /**
      General category "Other, Not Assigned" (Cn)
  */
  Unassigned = 2,

  /**
      General category "Other, Private Use" (Co)
  */
  PrivateUse = 3,

  /**
      General category "Other, Surrogate" (Cs)
  */
  Surrogate = 4,

  /**
      General category "Letter, Lowercase" (Ll)
  */
  LowercaseLetter = 5,

  /**
      General category "Letter, Modifier" (Lm)
  */
  ModifierLetter = 6,

  /**
      General category "Letter, Other" (Lo)
  */
  OtherLetter = 7,

  /**
      General category "Letter, Titlecase" (Lt)
  */
  TitlecaseLetter = 8,

  /**
      General category "Letter, Uppercase" (Lu)
  */
  UppercaseLetter = 9,

  /**
      General category "Mark, Spacing" (Mc)
  */
  SpacingMark = 10,

  /**
      General category "Mark, Enclosing" (Me)
  */
  EnclosingMark = 11,

  /**
      General category "Mark, Nonspacing" (Mn)
  */
  NonSpacingMark = 12,

  /**
      General category "Number, Decimal Digit" (Nd)
  */
  DecimalNumber = 13,

  /**
      General category "Number, Letter" (Nl)
  */
  LetterNumber = 14,

  /**
      General category "Number, Other" (No)
  */
  OtherNumber = 15,

  /**
      General category "Punctuation, Connector" (Pc)
  */
  ConnectPunctuation = 16,

  /**
      General category "Punctuation, Dash" (Pd)
  */
  DashPunctuation = 17,

  /**
      General category "Punctuation, Close" (Pe)
  */
  ClosePunctuation = 18,

  /**
      General category "Punctuation, Final quote" (Pf)
  */
  FinalPunctuation = 19,

  /**
      General category "Punctuation, Initial quote" (Pi)
  */
  InitialPunctuation = 20,

  /**
      General category "Punctuation, Other" (Po)
  */
  OtherPunctuation = 21,

  /**
      General category "Punctuation, Open" (Ps)
  */
  OpenPunctuation = 22,

  /**
      General category "Symbol, Currency" (Sc)
  */
  CurrencySymbol = 23,

  /**
      General category "Symbol, Modifier" (Sk)
  */
  ModifierSymbol = 24,

  /**
      General category "Symbol, Math" (Sm)
  */
  MathSymbol = 25,

  /**
      General category "Symbol, Other" (So)
  */
  OtherSymbol = 26,

  /**
      General category "Separator, Line" (Zl)
  */
  LineSeparator = 27,

  /**
      General category "Separator, Paragraph" (Zp)
  */
  ParagraphSeparator = 28,

  /**
      General category "Separator, Space" (Zs)
  */
  SpaceSeparator = 29,
}

/**
    Mnemonic constants for the ends of a Unix pipe.
*/
enum UnixPipeEnd
{
  /**
      The readable file descriptor 0
  */
  Read = 0,

  /**
      The writable file descriptor 1
  */
  Write = 1,
}

/**
    Error codes returned by #GUri methods.
*/
enum UriError
{
  /**
      Generic error if no more specific error is available.
        See the error message for details.
  */
  Failed = 0,

  /**
      The scheme of a URI could not be parsed.
  */
  BadScheme = 1,

  /**
      The user/userinfo of a URI could not be parsed.
  */
  BadUser = 2,

  /**
      The password of a URI could not be parsed.
  */
  BadPassword = 3,

  /**
      The authentication parameters of a URI could not be parsed.
  */
  BadAuthParams = 4,

  /**
      The host of a URI could not be parsed.
  */
  BadHost = 5,

  /**
      The port of a URI could not be parsed.
  */
  BadPort = 6,

  /**
      The path of a URI could not be parsed.
  */
  BadPath = 7,

  /**
      The query of a URI could not be parsed.
  */
  BadQuery = 8,

  /**
      The fragment of a URI could not be parsed.
  */
  BadFragment = 9,
}

/**
    Flags that describe a URI.
  
  When parsing a URI, if you need to choose different flags based on
  the type of URI, you can use [glib.uri.Uri.peekScheme] on the URI string
  to check the scheme first, and use that to decide what flags to
  parse it with.
*/
enum UriFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Parse the URI more relaxedly than the
        [RFC 3986](https://tools.ietf.org/html/rfc3986) grammar specifies,
        fixing up or ignoring common mistakes in URIs coming from external
        sources. This is also needed for some obscure URI schemes where `;`
        separates the host from the path. Don’t use this flag unless you need to.
  */
  ParseRelaxed = 1,

  /**
      The userinfo field may contain a password,
        which will be separated from the username by `:`.
  */
  HasPassword = 2,

  /**
      The userinfo may contain additional
        authentication-related parameters, which will be separated from
        the username and/or password by `;`.
  */
  HasAuthParams = 4,

  /**
      When parsing a URI, this indicates that `%`-encoded
        characters in the userinfo, path, query, and fragment fields
        should not be decoded. (And likewise the host field if
        `G_URI_FLAGS_NON_DNS` is also set.) When building a URI, it indicates
        that you have already `%`-encoded the components, and so #GUri
        should not do any encoding itself.
  */
  Encoded = 8,

  /**
      The host component should not be assumed to be a
        DNS hostname or IP address (for example, for `smb` URIs with NetBIOS
        hostnames).
  */
  NonDns = 16,

  /**
      Same as `G_URI_FLAGS_ENCODED`, for the query
        field only.
  */
  EncodedQuery = 32,

  /**
      Same as `G_URI_FLAGS_ENCODED`, for the path only.
  */
  EncodedPath = 64,

  /**
      Same as `G_URI_FLAGS_ENCODED`, for the
        fragment only.
  */
  EncodedFragment = 128,

  /**
      A scheme-based normalization will be applied.
        For example, when parsing an HTTP URI changing omitted path to `/` and
        omitted port to `80`; and when building a URI, changing empty path to `/`
        and default port `80`). This only supports a subset of known schemes. (Since: 2.68)
  */
  SchemeNormalize = 256,
}

/**
    Flags describing what parts of the URI to hide in
  [glib.uri.Uri.toStringPartial]. Note that `G_URI_HIDE_PASSWORD` and
  `G_URI_HIDE_AUTH_PARAMS` will only work if the #GUri was parsed with
  the corresponding flags.
*/
enum UriHideFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Hide the userinfo.
  */
  Userinfo = 1,

  /**
      Hide the password.
  */
  Password = 2,

  /**
      Hide the auth_params.
  */
  AuthParams = 4,

  /**
      Hide the query.
  */
  Query = 8,

  /**
      Hide the fragment.
  */
  Fragment = 16,
}

/**
    Flags modifying the way parameters are handled by [glib.uri.Uri.parseParams] and
  #GUriParamsIter.
*/
enum UriParamsFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Parameter names are case insensitive.
  */
  CaseInsensitive = 1,

  /**
      Replace `+` with space character. Only useful for
        URLs on the web, using the `https` or `http` schemas.
  */
  WwwForm = 2,

  /**
      See `G_URI_FLAGS_PARSE_RELAXED`.
  */
  ParseRelaxed = 4,
}

/**
    These are logical ids for special directories which are defined
  depending on the platform used. You should use [glib.global.getUserSpecialDir]
  to retrieve the full path associated to the logical id.
  
  The #GUserDirectory enumeration can be extended at later date. Not
  every platform has a directory for every logical id in this
  enumeration.
*/
enum UserDirectory
{
  /**
      the user's Desktop directory
  */
  DirectoryDesktop = 0,

  /**
      the user's Documents directory
  */
  DirectoryDocuments = 1,

  /**
      the user's Downloads directory
  */
  DirectoryDownload = 2,

  /**
      the user's Music directory
  */
  DirectoryMusic = 3,

  /**
      the user's Pictures directory
  */
  DirectoryPictures = 4,

  /**
      the user's shared directory
  */
  DirectoryPublicShare = 5,

  /**
      the user's Templates directory
  */
  DirectoryTemplates = 6,

  /**
      the user's Movies directory
  */
  DirectoryVideos = 7,

  /**
      the number of enum values
  */
  NDirectories = 8,
}

/**
    The range of possible top-level types of #GVariant instances.
*/
enum VariantClass
{
  /**
      The #GVariant is a boolean.
  */
  Boolean = 98,

  /**
      The #GVariant is a byte.
  */
  Byte = 121,

  /**
      The #GVariant is a signed 16 bit integer.
  */
  Int16 = 110,

  /**
      The #GVariant is an unsigned 16 bit integer.
  */
  Uint16 = 113,

  /**
      The #GVariant is a signed 32 bit integer.
  */
  Int32 = 105,

  /**
      The #GVariant is an unsigned 32 bit integer.
  */
  Uint32 = 117,

  /**
      The #GVariant is a signed 64 bit integer.
  */
  Int64 = 120,

  /**
      The #GVariant is an unsigned 64 bit integer.
  */
  Uint64 = 116,

  /**
      The #GVariant is a file handle index.
  */
  Handle = 104,

  /**
      The #GVariant is a double precision floating
                             point value.
  */
  Double = 100,

  /**
      The #GVariant is a normal string.
  */
  String = 115,

  /**
      The #GVariant is a D-Bus object path
                                  string.
  */
  ObjectPath = 111,

  /**
      The #GVariant is a D-Bus signature string.
  */
  Signature = 103,

  /**
      The #GVariant is a variant.
  */
  Variant = 118,

  /**
      The #GVariant is a maybe-typed value.
  */
  Maybe = 109,

  /**
      The #GVariant is an array.
  */
  Array = 97,

  /**
      The #GVariant is a tuple.
  */
  Tuple = 40,

  /**
      The #GVariant is a dictionary entry.
  */
  DictEntry = 123,
}

/**
    Error codes returned by parsing text-format GVariants.
*/
enum VariantParseError
{
  /**
      generic error (unused)
  */
  Failed = 0,

  /**
      a non-basic #GVariantType was given where a basic type was expected
  */
  BasicTypeExpected = 1,

  /**
      cannot infer the #GVariantType
  */
  CannotInferType = 2,

  /**
      an indefinite #GVariantType was given where a definite type was expected
  */
  DefiniteTypeExpected = 3,

  /**
      extra data after parsing finished
  */
  InputNotAtEnd = 4,

  /**
      invalid character in number or unicode escape
  */
  InvalidCharacter = 5,

  /**
      not a valid #GVariant format string
  */
  InvalidFormatString = 6,

  /**
      not a valid object path
  */
  InvalidObjectPath = 7,

  /**
      not a valid type signature
  */
  InvalidSignature = 8,

  /**
      not a valid #GVariant type string
  */
  InvalidTypeString = 9,

  /**
      could not find a common type for array entries
  */
  NoCommonType = 10,

  /**
      the numerical value is out of range of the given type
  */
  NumberOutOfRange = 11,

  /**
      the numerical value is out of range for any type
  */
  NumberTooBig = 12,

  /**
      cannot parse as variant of the specified type
  */
  TypeError = 13,

  /**
      an unexpected token was encountered
  */
  UnexpectedToken = 14,

  /**
      an unknown keyword was encountered
  */
  UnknownKeyword = 15,

  /**
      unterminated string constant
  */
  UnterminatedStringConstant = 16,

  /**
      no value given
  */
  ValueExpected = 17,

  /**
      variant was too deeply nested; #GVariant is only guaranteed to handle nesting up to 64 levels (Since: 2.64)
  */
  Recursion = 18,
}

/** */
enum ALLOCATOR_LIST = 1;

/** */
enum ALLOCATOR_NODE = 3;

/** */
enum ALLOCATOR_SLIST = 2;

/** */
enum ALLOC_AND_FREE = 2;

/** */
enum ALLOC_ONLY = 1;

/** */
enum ANALYZER_ANALYZING = 1;

/**
    A good size for a buffer to be passed into `func@GLib.ascii_dtostr`.
  It is guaranteed to be enough for all output of that function
  on systems with 64bit IEEE-compatible doubles.
  
  The typical usage would be something like:
  ```C
  char buf[G_ASCII_DTOSTR_BUF_SIZE];
  
  fprintf (out, "value=%s\n", g_ascii_dtostr (buf, sizeof (buf), value));
  ```
*/
enum ASCII_DTOSTR_BUF_SIZE = 39;

/**
    Evaluates to the initial reference count for `gatomicrefcount`.
  
  This macro is useful for initializing `gatomicrefcount` fields inside
  structures, for instance:
  
  ```c
  typedef struct {
    gatomicrefcount ref_count;
    char *name;
    char *address;
  } Person;
  
  static const Person default_person = {
    .ref_count = G_ATOMIC_REF_COUNT_INIT,
    .name = "Default name",
    .address = "Default address",
  };
  ```
*/
enum ATOMIC_REF_COUNT_INIT = 1;

/** */
enum BIG_ENDIAN = 4321;

/**
    The set of uppercase ASCII alphabet characters.
  Used for specifying valid identifier characters
  in #GScannerConfig.
*/
enum CSET_A_2_Z = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

/**
    The set of ASCII digits.
  Used for specifying valid identifier characters
  in #GScannerConfig.
*/
enum CSET_DIGITS = "0123456789";

/**
    The set of lowercase ASCII alphabet characters.
  Used for specifying valid identifier characters
  in #GScannerConfig.
*/
enum CSET_a_2_z = "abcdefghijklmnopqrstuvwxyz";

/** */
enum C_STD_VERSION = 199000;

/**
    A bitmask that restricts the possible flags passed to
  [glib.global.datalistSetFlags]. Passing a flags value where
  flags & ~G_DATALIST_FLAGS_MASK != 0 is an error.
*/
enum DATALIST_FLAGS_MASK = 3;

/**
    Represents an invalid #GDateDay.
*/
enum DATE_BAD_DAY = 0;

/**
    Represents an invalid Julian day number.
*/
enum DATE_BAD_JULIAN = 0;

/**
    Represents an invalid year.
*/
enum DATE_BAD_YEAR = 0;

/** */
enum DIR_SEPARATOR = 47;

/** */
enum DIR_SEPARATOR_S = "/";

/** */
enum E = 2.718282;

/** */
enum GINT16_FORMAT = "hi";

/** */
enum GINT16_MODIFIER = "h";

/** */
enum GINT32_FORMAT = "i";

/** */
enum GINT32_MODIFIER = "";

/** */
enum GINT64_FORMAT = "li";

/** */
enum GINT64_MODIFIER = "l";

/** */
enum GINTPTR_FORMAT = "li";

/** */
enum GINTPTR_MODIFIER = "l";

/**
    Expands to "" on all modern compilers, and to  __FUNCTION__ on gcc
  version 2.x. Don't use it.

  Deprecated:     Use G_STRFUNC() instead
*/
enum GNUC_FUNCTION = "";

/**
    Expands to "" on all modern compilers, and to __PRETTY_FUNCTION__
  on gcc version 2.x. Don't use it.

  Deprecated:     Use G_STRFUNC() instead
*/
enum GNUC_PRETTY_FUNCTION = "";

/** */
enum GSIZE_FORMAT = "lu";

/** */
enum GSIZE_MODIFIER = "l";

/** */
enum GSSIZE_FORMAT = "li";

/** */
enum GSSIZE_MODIFIER = "l";

/** */
enum GUINT16_FORMAT = "hu";

/** */
enum GUINT32_FORMAT = "u";

/** */
enum GUINT64_FORMAT = "lu";

/** */
enum GUINTPTR_FORMAT = "lu";

/** */
enum HAVE_GINT64 = 1;

/** */
enum HAVE_GNUC_VARARGS = 1;

/** */
enum HAVE_GNUC_VISIBILITY = 1;

/** */
enum HAVE_GROWING_STACK = 0;

/** */
enum HAVE_ISO_VARARGS = 1;

/**
    The position of the first bit which is not reserved for internal
  use be the #GHook implementation, i.e.
  `1 << G_HOOK_FLAG_USER_SHIFT` is the first
  bit which can be used for application-defined flags.
*/
enum HOOK_FLAG_USER_SHIFT = 4;

/** */
enum IEEE754_DOUBLE_BIAS = 1023;

/** */
enum IEEE754_FLOAT_BIAS = 127;

/**
    The name of the main group of a desktop entry file, as defined in the
  [Desktop Entry Specification](http://freedesktop.org/Standards/desktop-entry-spec).
  Consult the specification for more
  details about the meanings of the keys below.
*/
enum KEY_FILE_DESKTOP_GROUP = "Desktop Entry";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a string list
  giving the available application actions.
*/
enum KEY_FILE_DESKTOP_KEY_ACTIONS = "Actions";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a list
  of strings giving the categories in which the desktop entry
  should be shown in a menu.
*/
enum KEY_FILE_DESKTOP_KEY_CATEGORIES = "Categories";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a localized
  string giving the tooltip for the desktop entry.
*/
enum KEY_FILE_DESKTOP_KEY_COMMENT = "Comment";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a boolean
  set to true if the application is D-Bus activatable.
*/
enum KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE = "DBusActivatable";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a string
  giving the command line to execute. It is only valid for desktop
  entries with the `Application` type.
*/
enum KEY_FILE_DESKTOP_KEY_EXEC = "Exec";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a localized
  string giving the generic name of the desktop entry.
*/
enum KEY_FILE_DESKTOP_KEY_GENERIC_NAME = "GenericName";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a boolean
  stating whether the desktop entry has been deleted by the user.
*/
enum KEY_FILE_DESKTOP_KEY_HIDDEN = "Hidden";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a localized
  string giving the name of the icon to be displayed for the desktop
  entry.
*/
enum KEY_FILE_DESKTOP_KEY_ICON = "Icon";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a list
  of strings giving the MIME types supported by this desktop entry.
*/
enum KEY_FILE_DESKTOP_KEY_MIME_TYPE = "MimeType";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a localized
  string giving the specific name of the desktop entry.
*/
enum KEY_FILE_DESKTOP_KEY_NAME = "Name";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a list of
  strings identifying the environments that should not display the
  desktop entry.
*/
enum KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN = "NotShowIn";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a boolean
  stating whether the desktop entry should be shown in menus.
*/
enum KEY_FILE_DESKTOP_KEY_NO_DISPLAY = "NoDisplay";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a list of
  strings identifying the environments that should display the
  desktop entry.
*/
enum KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN = "OnlyShowIn";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a string
  containing the working directory to run the program in. It is only
  valid for desktop entries with the `Application` type.
*/
enum KEY_FILE_DESKTOP_KEY_PATH = "Path";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a boolean
  stating whether the application supports the
  [Startup Notification Protocol Specification](http://www.freedesktop.org/Standards/startup-notification-spec).
*/
enum KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY = "StartupNotify";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is string
  identifying the WM class or name hint of a window that the application
  will create, which can be used to emulate Startup Notification with
  older applications.
*/
enum KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS = "StartupWMClass";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a boolean
  stating whether the program should be run in a terminal window.
  
  It is only valid for desktop entries with the `Application` type.
*/
enum KEY_FILE_DESKTOP_KEY_TERMINAL = "Terminal";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a string
  giving the file name of a binary on disk used to determine if the
  program is actually installed. It is only valid for desktop entries
  with the `Application` type.
*/
enum KEY_FILE_DESKTOP_KEY_TRY_EXEC = "TryExec";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a string
  giving the type of the desktop entry.
  
  Usually `G_KEY_FILE_DESKTOP_TYPE_APPLICATION`,
  `G_KEY_FILE_DESKTOP_TYPE_LINK`, or
  `G_KEY_FILE_DESKTOP_TYPE_DIRECTORY`.
*/
enum KEY_FILE_DESKTOP_KEY_TYPE = "Type";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a string
  giving the URL to access. It is only valid for desktop entries
  with the `Link` type.
*/
enum KEY_FILE_DESKTOP_KEY_URL = "URL";

/**
    A key under `G_KEY_FILE_DESKTOP_GROUP`, whose value is a string
  giving the version of the Desktop Entry Specification used for
  the desktop entry file.
*/
enum KEY_FILE_DESKTOP_KEY_VERSION = "Version";

/**
    The value of the `G_KEY_FILE_DESKTOP_KEY_TYPE`, key for desktop
  entries representing applications.
*/
enum KEY_FILE_DESKTOP_TYPE_APPLICATION = "Application";

/**
    The value of the `G_KEY_FILE_DESKTOP_KEY_TYPE`, key for desktop
  entries representing directories.
*/
enum KEY_FILE_DESKTOP_TYPE_DIRECTORY = "Directory";

/**
    The value of the `G_KEY_FILE_DESKTOP_KEY_TYPE`, key for desktop
  entries representing links to documents.
*/
enum KEY_FILE_DESKTOP_TYPE_LINK = "Link";

/** */
enum LITTLE_ENDIAN = 1234;

/** */
enum LN10 = 2.302585;

/** */
enum LN2 = 0.693147;

/** */
enum LOG_2_BASE_10 = 0.301030;

/**
    Defines the log domain. See [Log Domains](#log-domains).
  
  Libraries should define this so that any messages
  which they log can be differentiated from messages from other
  libraries and application code. But be careful not to define
  it in any public header files.
  
  Log domains must be unique, and it is recommended that they are the
  application or library name, optionally followed by a hyphen and a sub-domain
  name. For example, `bloatpad` or `bloatpad-io`.
  
  If undefined, it defaults to the default null (or `""`) log domain; this is
  not advisable, as it cannot be filtered against using the `G_MESSAGES_DEBUG`
  environment variable.
  
  For example, GTK uses this in its `Makefile.am`:
  ```
  AM_CPPFLAGS = -DG_LOG_DOMAIN=\"Gtk\"
  ```
  
  Applications can choose to leave it as the default null (or `""`)
  domain. However, defining the domain offers the same advantages as
  above.
*/
enum LOG_DOMAIN = 0;

/**
    GLib log levels that are considered fatal by default.
  
  This is not used if structured logging is enabled; see
  [Using Structured Logging](logging.html#using-structured-logging).
*/
enum LOG_FATAL_MASK = 5;

/**
    Log levels below `1<<G_LOG_LEVEL_USER_SHIFT` are used by GLib.
  Higher bits can be used for user-defined log levels.
*/
enum LOG_LEVEL_USER_SHIFT = 8;

/**
    The major version number of the GLib library.
  
  Like #glib_major_version, but from the headers used at
  application compile time, rather than from the library
  linked against at application run time.
*/
enum MAJOR_VERSION = 2;

/** */
enum MAXINT16 = 32767;

/** */
enum MAXINT32 = 2147483647;

/** */
enum MAXINT64 = 9223372036854775807;

/** */
enum MAXINT8 = 127;

/** */
enum MAXUINT16 = 65535;

/** */
enum MAXUINT32 = 4294967295;

/** */
enum MAXUINT64 = 18446744073709551615;

/** */
enum MAXUINT8 = 255;

/**
    The micro version number of the GLib library.
  
  Like #gtk_micro_version, but from the headers used at
  application compile time, rather than from the library
  linked against at application run time.
*/
enum MICRO_VERSION = 0;

/**
    The minimum value which can be held in a #gint16.
*/
enum MININT16 = -32768;

/**
    The minimum value which can be held in a #gint32.
*/
enum MININT32 = -2147483648;

/**
    The minimum value which can be held in a #gint64.
*/
enum MININT64 = -9223372036854775808;

/**
    The minimum value which can be held in a #gint8.
*/
enum MININT8 = -128;

/**
    The minor version number of the GLib library.
  
  Like #gtk_minor_version, but from the headers used at
  application compile time, rather than from the library
  linked against at application run time.
*/
enum MINOR_VERSION = 80;

/** */
enum MODULE_SUFFIX = "so";

/**
    If a long option in the main group has this name, it is not treated as a
  regular option. Instead it collects all non-option arguments which would
  otherwise be left in `argv`. The option must be of type
  `G_OPTION_ARG_CALLBACK`, `G_OPTION_ARG_STRING_ARRAY`
  or `G_OPTION_ARG_FILENAME_ARRAY`.
  
  
  Using `G_OPTION_REMAINING` instead of simply scanning `argv`
  for leftover arguments has the advantage that GOption takes care of
  necessary encoding conversions for strings or filenames.
*/
enum OPTION_REMAINING = "";

/** */
enum PDP_ENDIAN = 3412;

/** */
enum PI = 3.141593;

/**
    A format specifier that can be used in printf()-style format strings
  when printing a #GPid.
*/
enum PID_FORMAT = "i";

/** */
enum PI_2 = 1.570796;

/** */
enum PI_4 = 0.785398;

/**
    A format specifier that can be used in printf()-style format strings
  when printing the @fd member of a #GPollFD.
*/
enum POLLFD_FORMAT = "%d";

/**
    Use this for default priority event sources.
  
  In GLib this priority is used when adding timeout functions
  with [glib.global.timeoutAdd]. In GDK this priority is used for events
  from the X server.
*/
enum PRIORITY_DEFAULT = 0;

/**
    Use this for default priority idle functions.
  
  In GLib this priority is used when adding idle functions with
  [glib.global.idleAdd].
*/
enum PRIORITY_DEFAULT_IDLE = 200;

/**
    Use this for high priority event sources.
  
  It is not used within GLib or GTK.
*/
enum PRIORITY_HIGH = -100;

/**
    Use this for high priority idle functions.
  
  GTK uses `G_PRIORITY_HIGH_IDLE` + 10 for resizing operations,
  and `G_PRIORITY_HIGH_IDLE` + 20 for redrawing operations. (This is
  done to ensure that any pending resizes are processed before any
  pending redraws, so that widgets are not redrawn twice unnecessarily.)
*/
enum PRIORITY_HIGH_IDLE = 100;

/**
    Use this for very low priority background tasks.
  
  It is not used within GLib or GTK.
*/
enum PRIORITY_LOW = 300;

/**
    Evaluates to the initial reference count for `grefcount`.
  
  This macro is useful for initializing `grefcount` fields inside
  structures, for instance:
  
  ```c
  typedef struct {
    grefcount ref_count;
    char *name;
    char *address;
  } Person;
  
  static const Person default_person = {
    .ref_count = G_REF_COUNT_INIT,
    .name = "Default name",
    .address = "Default address",
  };
  ```
*/
enum REF_COUNT_INIT = -1;

/** */
enum SEARCHPATH_SEPARATOR = 58;

/** */
enum SEARCHPATH_SEPARATOR_S = ":";

/** */
enum SIZEOF_LONG = 8;

/** */
enum SIZEOF_SIZE_T = 8;

/** */
enum SIZEOF_SSIZE_T = 8;

/** */
enum SIZEOF_VOID_P = 8;

/**
    Use this macro as the return value of a #GSourceFunc to leave
  the #GSource in the main loop.
*/
enum SOURCE_CONTINUE = true;

/**
    Use this macro as the return value of a #GSourceFunc to remove
  the #GSource from the main loop.
*/
enum SOURCE_REMOVE = false;

/** */
enum SQRT2 = 1.414214;

/**
    The standard delimiters, used in `func@GLib.strdelimit`.
*/
enum STR_DELIMITERS = "_-|> <.";

/** */
enum SYSDEF_AF_INET = 2;

/** */
enum SYSDEF_AF_INET6 = 10;

/** */
enum SYSDEF_AF_UNIX = 1;

/** */
enum SYSDEF_MSG_DONTROUTE = 4;

/** */
enum SYSDEF_MSG_OOB = 1;

/** */
enum SYSDEF_MSG_PEEK = 2;

/**
    Creates a unique temporary directory for each unit test and uses
  g_set_user_dirs() to set XDG directories to point into subdirectories of it
  for the duration of the unit test. The directory tree is cleaned up after the
  test finishes successfully. Note that this doesn’t take effect until
  [glib.global.testRun] is called, so calls to (for example) g_get_user_home_dir() will
  return the system-wide value when made in a test program’s main() function.
  
  The following functions will return subdirectories of the temporary directory
  when this option is used. The specific subdirectory paths in use are not
  guaranteed to be stable API — always use a getter function to retrieve them.
  
   $(LIST
      * [glib.global.getHomeDir]
      * [glib.global.getUserCacheDir]
      * [glib.global.getSystemConfigDirs]
      * [glib.global.getUserConfigDir]
      * [glib.global.getSystemDataDirs]
      * [glib.global.getUserDataDir]
      * [glib.global.getUserStateDir]
      * [glib.global.getUserRuntimeDir]
   )
     
  The subdirectories may not be created by the test harness; as with normal
  calls to functions like [glib.global.getUserCacheDir], the caller must be prepared
  to create the directory if it doesn’t exist.
*/
enum TEST_OPTION_ISOLATE_DIRS = "isolate_dirs";

/**
    Evaluates to a time span of one day.
*/
enum TIME_SPAN_DAY = 86400000000;

/**
    Evaluates to a time span of one hour.
*/
enum TIME_SPAN_HOUR = 3600000000;

/**
    Evaluates to a time span of one millisecond.
*/
enum TIME_SPAN_MILLISECOND = 1000;

/**
    Evaluates to a time span of one minute.
*/
enum TIME_SPAN_MINUTE = 60000000;

/**
    Evaluates to a time span of one second.
*/
enum TIME_SPAN_SECOND = 1000000;

/**
    The maximum length (in codepoints) of a compatibility or canonical
  decomposition of a single Unicode character.
  
  This is as defined by Unicode 6.1.
*/
enum UNICHAR_MAX_DECOMPOSITION_LENGTH = 18;

/**
    Generic delimiters characters as defined in
  [RFC 3986](https://tools.ietf.org/html/rfc3986). Includes `:/?#[]@`.
*/
enum URI_RESERVED_CHARS_GENERIC_DELIMITERS = ":/?#[]@";

/**
    Subcomponent delimiter characters as defined in
  [RFC 3986](https://tools.ietf.org/html/rfc3986). Includes `!$&'()*+,;=`.
*/
enum URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = "!$&'()*+,;=";

/**
    Number of microseconds in one second (1 million).
  This macro is provided for code readability.
*/
enum USEC_PER_SEC = 1000000;

/** */
enum VA_COPY_AS_ARRAY = 1;

/**
    A macro that should be defined by the user prior to including
  the glib.h header.
  The definition should be one of the predefined GLib version
  macros: `GLIB_VERSION_2_26`, `GLIB_VERSION_2_28`,...
  
  This macro defines the earliest version of GLib that the package is
  required to be able to compile against.
  
  If the compiler is configured to warn about the use of deprecated
  functions, then using functions that were deprecated in version
  `GLIB_VERSION_MIN_REQUIRED` or earlier will cause warnings (but
  using functions deprecated in later releases will not).
*/
enum VERSION_MIN_REQUIRED = 2;

/** */
enum WIN32_MSG_HANDLE = 19981206;

/** */
enum macro__has_attribute___noreturn__ = 0;
