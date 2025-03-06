module gio.types;

import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.datagram_based;
import gio.dbus_connection;
import gio.dbus_interface_info;
import gio.dbus_message;
import gio.dbus_method_invocation;
import gio.dbus_object_manager_client;
import gio.desktop_app_info;
import gio.file;
import gio.ioscheduler_job;
import gio.simple_async_result;
import gio.socket;
import gio.task;
import gio.vfs;
import glib.error;
import glib.types;
import glib.variant;
import glib.variant_type;
import gobject.object;
import gobject.types;
import gobject.value;


// Structs

/** */
alias DBusInterfaceVTable = GDBusInterfaceVTable;

/** */
alias DBusSubtreeVTable = GDBusSubtreeVTable;

/** */
alias IOStreamAdapter = GIOStreamAdapter*;

/** */
alias InputVector = GInputVector;

/** */
alias OutputVector = GOutputVector;

// Callbacks

/**
    Type definition for a function that will be called back when an asynchronous
  operation within GIO has been completed. #GAsyncReadyCallback
  callbacks from #GTask are guaranteed to be invoked in a later
  iteration of the
  [thread-default main context][g-main-context-push-thread-default]
  where the #GTask was created. All other users of
  #GAsyncReadyCallback must likewise call it asynchronously in a
  later iteration of the main context.
  
  The asynchronous operation is guaranteed to have held a reference to
  source_object from the time when the `*_async()` function was called, until
  after this callback returns.

  ## Parameters
  $(LIST
    * $(B sourceObject)       the object the asynchronous operation was started with.
    * $(B res)       a #GAsyncResult.
  )
*/
alias AsyncReadyCallback = void delegate(gobject.object.ObjectG sourceObject, gio.async_result.AsyncResult res);

/**
    Invoked when a connection to a message bus has been obtained.

  ## Parameters
  $(LIST
    * $(B connection)       The #GDBusConnection to a message bus.
    * $(B name)       The name that is requested to be owned.
  )
*/
alias BusAcquiredCallback = void delegate(gio.dbus_connection.DBusConnection connection, string name);

/**
    Invoked when the name is acquired.

  ## Parameters
  $(LIST
    * $(B connection)       The #GDBusConnection on which to acquired the name.
    * $(B name)       The name being owned.
  )
*/
alias BusNameAcquiredCallback = void delegate(gio.dbus_connection.DBusConnection connection, string name);

/**
    Invoked when the name being watched is known to have to have an owner.

  ## Parameters
  $(LIST
    * $(B connection)       The #GDBusConnection the name is being watched on.
    * $(B name)       The name being watched.
    * $(B nameOwner)       Unique name of the owner of the name being watched.
  )
*/
alias BusNameAppearedCallback = void delegate(gio.dbus_connection.DBusConnection connection, string name, string nameOwner);

/**
    Invoked when the name is lost or connection has been closed.

  ## Parameters
  $(LIST
    * $(B connection)       The #GDBusConnection on which to acquire the name or null if
      the connection was disconnected.
    * $(B name)       The name being owned.
  )
*/
alias BusNameLostCallback = void delegate(gio.dbus_connection.DBusConnection connection, string name);

/**
    Invoked when the name being watched is known not to have to have an owner.
  
  This is also invoked when the #GDBusConnection on which the watch was
  established has been closed.  In that case, connection will be
  null.

  ## Parameters
  $(LIST
    * $(B connection)       The #GDBusConnection the name is being watched on, or
          null.
    * $(B name)       The name being watched.
  )
*/
alias BusNameVanishedCallback = void delegate(gio.dbus_connection.DBusConnection connection, string name);

/**
    This is the function type of the callback used for the #GSource
  returned by [gio.cancellable.Cancellable.sourceNew].

  ## Parameters
  $(LIST
    * $(B cancellable)       the #GCancellable
  )
  Returns:     it should return false if the source should be removed.
*/
alias CancellableSourceFunc = bool delegate(gio.cancellable.Cancellable cancellable);

/**
    The type of the get_property function in #GDBusInterfaceVTable.

  ## Parameters
  $(LIST
    * $(B connection)       A #GDBusConnection.
    * $(B sender)       The unique bus name of the remote caller.
    * $(B objectPath)       The object path that the method was invoked on.
    * $(B interfaceName)       The D-Bus interface name for the property.
    * $(B propertyName)       The name of the property to get the value of.
    * $(B error)       Return location for error.
  )
  Returns:     A #GVariant with the value for property_name or null if
        error is set. If the returned #GVariant is floating, it is
        consumed - otherwise its reference count is decreased by one.
*/
alias DBusInterfaceGetPropertyFunc = glib.variant.VariantG delegate(gio.dbus_connection.DBusConnection connection, string sender, string objectPath, string interfaceName, string propertyName, glib.error.ErrorG error);

/**
    The type of the method_call function in #GDBusInterfaceVTable.

  ## Parameters
  $(LIST
    * $(B connection)       A #GDBusConnection.
    * $(B sender)       The unique bus name of the remote caller.
    * $(B objectPath)       The object path that the method was invoked on.
    * $(B interfaceName)       The D-Bus interface name the method was invoked on.
    * $(B methodName)       The name of the method that was invoked.
    * $(B parameters)       A #GVariant tuple with parameters.
    * $(B invocation)       A #GDBusMethodInvocation object that must be used to return a value or error.
  )
*/
alias DBusInterfaceMethodCallFunc = void delegate(gio.dbus_connection.DBusConnection connection, string sender, string objectPath, string interfaceName, string methodName, glib.variant.VariantG parameters, gio.dbus_method_invocation.DBusMethodInvocation invocation);

/**
    The type of the set_property function in #GDBusInterfaceVTable.

  ## Parameters
  $(LIST
    * $(B connection)       A #GDBusConnection.
    * $(B sender)       The unique bus name of the remote caller.
    * $(B objectPath)       The object path that the method was invoked on.
    * $(B interfaceName)       The D-Bus interface name for the property.
    * $(B propertyName)       The name of the property to get the value of.
    * $(B value)       The value to set the property to.
    * $(B error)       Return location for error.
  )
  Returns:     true if the property was set to value, false if error is set.
*/
alias DBusInterfaceSetPropertyFunc = bool delegate(gio.dbus_connection.DBusConnection connection, string sender, string objectPath, string interfaceName, string propertyName, glib.variant.VariantG value, glib.error.ErrorG error);

/**
    Signature for function used in [gio.dbus_connection.DBusConnection.addFilter].
  
  A filter function is passed a #GDBusMessage and expected to return
  a #GDBusMessage too. Passive filter functions that don't modify the
  message can simply return the message object:
  ```
  static GDBusMessage *
  passive_filter (GDBusConnection *connection
                  GDBusMessage    *message,
                  gboolean         incoming,
                  gpointer         user_data)
  {
    // inspect message
    return message;
  }
  ```
  Filter functions that wants to drop a message can simply return null:
  ```
  static GDBusMessage *
  drop_filter (GDBusConnection *connection
               GDBusMessage    *message,
               gboolean         incoming,
               gpointer         user_data)
  {
    if (should_drop_message)
      {
        g_object_unref (message);
        message = NULL;
      }
    return message;
  }
  ```
  Finally, a filter function may modify a message by copying it:
  ```
  static GDBusMessage *
  modifying_filter (GDBusConnection *connection
                    GDBusMessage    *message,
                    gboolean         incoming,
                    gpointer         user_data)
  {
    GDBusMessage *copy;
    GError *error;
  
    error = NULL;
    copy = g_dbus_message_copy (message, &error);
    // handle error being set
    g_object_unref (message);
  
    // modify copy
  
    return copy;
  }
  ```
  If the returned #GDBusMessage is different from message and cannot
  be sent on connection (it could use features, such as file
  descriptors, not compatible with connection), then a warning is
  logged to standard error. Applications can
  check this ahead of time using [gio.dbus_message.DBusMessage.toBlob] passing a
  #GDBusCapabilityFlags value obtained from connection.

  ## Parameters
  $(LIST
    * $(B connection)       A #GDBusConnection.
    * $(B message)       A locked #GDBusMessage that the filter function takes ownership of.
    * $(B incoming)       true if it is a message received from the other peer, false if it is
      a message to be sent to the other peer.
  )
  Returns:     A #GDBusMessage that will be freed with
    [gobject.object.ObjectG.unref] or null to drop the message. Passive filter
    functions can simply return the passed message object.
*/
alias DBusMessageFilterFunction = gio.dbus_message.DBusMessage delegate(gio.dbus_connection.DBusConnection connection, gio.dbus_message.DBusMessage message, bool incoming);

/**
    Function signature for a function used to determine the #GType to
  use for an interface proxy (if interface_name is not null) or
  object proxy (if interface_name is null).
  
  This function is called in the
  [thread-default main loop][g-main-context-push-thread-default]
  that manager was constructed in.

  ## Parameters
  $(LIST
    * $(B manager)       A #GDBusObjectManagerClient.
    * $(B objectPath)       The object path of the remote object.
    * $(B interfaceName)       The interface name of the remote object or null if a #GDBusObjectProxy #GType is requested.
  )
  Returns:     A #GType to use for the remote object. The returned type
      must be a #GDBusProxy or #GDBusObjectProxy -derived
      type.
*/
alias DBusProxyTypeFunc = gobject.types.GType delegate(gio.dbus_object_manager_client.DBusObjectManagerClient manager, string objectPath, string interfaceName);

/**
    Signature for callback function used in [gio.dbus_connection.DBusConnection.signalSubscribe].

  ## Parameters
  $(LIST
    * $(B connection)       A #GDBusConnection.
    * $(B senderName)       The unique bus name of the sender of the signal,
         or null on a peer-to-peer D-Bus connection.
    * $(B objectPath)       The object path that the signal was emitted on.
    * $(B interfaceName)       The name of the interface.
    * $(B signalName)       The name of the signal.
    * $(B parameters)       A #GVariant tuple with parameters for the signal.
  )
*/
alias DBusSignalCallback = void delegate(gio.dbus_connection.DBusConnection connection, string senderName, string objectPath, string interfaceName, string signalName, glib.variant.VariantG parameters);

/**
    The type of the dispatch function in #GDBusSubtreeVTable.
  
  Subtrees are flat.  node, if non-null, is always exactly one
  segment of the object path (ie: it never contains a slash).

  ## Parameters
  $(LIST
    * $(B connection)       A #GDBusConnection.
    * $(B sender)       The unique bus name of the remote caller.
    * $(B objectPath)       The object path that was registered with [gio.dbus_connection.DBusConnection.registerSubtree].
    * $(B interfaceName)       The D-Bus interface name that the method call or property access is for.
    * $(B node)       A node that is a child of object_path (relative to object_path) or null for the root of the subtree.
    * $(B outUserData)       Return location for user data to pass to functions in the returned #GDBusInterfaceVTable.
  )
  Returns:     A #GDBusInterfaceVTable or null if you don't want to handle the methods.
*/
alias DBusSubtreeDispatchFunc = gio.types.DBusInterfaceVTable delegate(gio.dbus_connection.DBusConnection connection, string sender, string objectPath, string interfaceName, string node, out void* outUserData);

/**
    The type of the enumerate function in #GDBusSubtreeVTable.
  
  This function is called when generating introspection data and also
  when preparing to dispatch incoming messages in the event that the
  [gio.types.DBusSubtreeFlags.DispatchToUnenumeratedNodes] flag is not
  specified (ie: to verify that the object path is valid).
  
  Hierarchies are not supported; the items that you return should not
  contain the `/` character.
  
  The return value will be freed with [glib.global.strfreev].

  ## Parameters
  $(LIST
    * $(B connection)       A #GDBusConnection.
    * $(B sender)       The unique bus name of the remote caller.
    * $(B objectPath)       The object path that was registered with [gio.dbus_connection.DBusConnection.registerSubtree].
  )
  Returns:     A newly allocated array of strings for node names that are children of object_path.
*/
alias DBusSubtreeEnumerateFunc = string[] delegate(gio.dbus_connection.DBusConnection connection, string sender, string objectPath);

/**
    The type of the introspect function in #GDBusSubtreeVTable.
  
  Subtrees are flat.  node, if non-null, is always exactly one
  segment of the object path (ie: it never contains a slash).
  
  This function should return null to indicate that there is no object
  at this node.
  
  If this function returns non-null, the return value is expected to
  be a null-terminated array of pointers to #GDBusInterfaceInfo
  structures describing the interfaces implemented by node.  This
  array will have [gio.dbus_interface_info.DBusInterfaceInfo.unref] called on each item
  before being freed with [glib.global.gfree].
  
  The difference between returning null and an array containing zero
  items is that the standard DBus interfaces will returned to the
  remote introspector in the empty array case, but not in the null
  case.

  ## Parameters
  $(LIST
    * $(B connection)       A #GDBusConnection.
    * $(B sender)       The unique bus name of the remote caller.
    * $(B objectPath)       The object path that was registered with [gio.dbus_connection.DBusConnection.registerSubtree].
    * $(B node)       A node that is a child of object_path (relative to object_path) or null for the root of the subtree.
  )
  Returns:     A null-terminated array of pointers to #GDBusInterfaceInfo, or null.
*/
alias DBusSubtreeIntrospectFunc = gio.dbus_interface_info.DBusInterfaceInfo[] delegate(gio.dbus_connection.DBusConnection connection, string sender, string objectPath, string node);

/**
    This is the function type of the callback used for the #GSource
  returned by [gio.datagram_based.DatagramBased.createSource].

  ## Parameters
  $(LIST
    * $(B datagramBased)       the #GDatagramBased
    * $(B condition)       the current condition at the source fired
  )
  Returns:     `G_SOURCE_REMOVE` if the source should be removed,
      `G_SOURCE_CONTINUE` otherwise
*/
alias DatagramBasedSourceFunc = bool delegate(gio.datagram_based.DatagramBased datagramBased, glib.types.IOCondition condition);

/**
    During invocation, [gio.desktop_app_info.DesktopAppInfo.launchUrisAsManager] may
  create one or more child processes.  This callback is invoked once
  for each, providing the process ID.

  ## Parameters
  $(LIST
    * $(B appinfo)       a #GDesktopAppInfo
    * $(B pid)       Process identifier
  )
*/
alias DesktopAppLaunchCallback = void delegate(gio.desktop_app_info.DesktopAppInfo appinfo, glib.types.Pid pid);

/**
    This callback type is used by [gio.file.File.measureDiskUsage] to make
  periodic progress reports when measuring the amount of disk spaced
  used by a directory.
  
  These calls are made on a best-effort basis and not all types of
  #GFile will support them.  At the minimum, however, one call will
  always be made immediately.
  
  In the case that there is no support, reporting will be set to
  false (and the other values undefined) and no further calls will be
  made.  Otherwise, the reporting will be true and the other values
  all-zeros during the first (immediate) call.  In this way, you can
  know which type of progress UI to show without a delay.
  
  For [gio.file.File.measureDiskUsage] the callback is made directly.  For
  [gio.file.File.measureDiskUsageAsync] the callback is made via the
  default main context of the calling thread (ie: the same way that the
  final async result would be reported).
  
  current_size is in the same units as requested by the operation (see
  [gio.types.FileMeasureFlags.ApparentSize]).
  
  The frequency of the updates is implementation defined, but is
  ideally about once every 200ms.
  
  The last progress callback may or may not be equal to the final
  result.  Always check the async result to get the final value.

  ## Parameters
  $(LIST
    * $(B reporting)       true if more reports will come
    * $(B currentSize)       the current cumulative size measurement
    * $(B numDirs)       the number of directories visited so far
    * $(B numFiles)       the number of non-directory files encountered
  )
*/
alias FileMeasureProgressCallback = void delegate(bool reporting, ulong currentSize, ulong numDirs, ulong numFiles);

/**
    When doing file operations that may take a while, such as moving
  a file or copying a file, a progress callback is used to pass how
  far along that operation is to the application.

  ## Parameters
  $(LIST
    * $(B currentNumBytes)       the current number of bytes in the operation.
    * $(B totalNumBytes)       the total number of bytes in the operation.
  )
*/
alias FileProgressCallback = void delegate(long currentNumBytes, long totalNumBytes);

/**
    When loading the partial contents of a file with [gio.file.File.loadPartialContentsAsync],
  it may become necessary to determine if any more data from the file should be loaded.
  A #GFileReadMoreCallback function facilitates this by returning true if more data
  should be read, or false otherwise.

  ## Parameters
  $(LIST
    * $(B fileContents)       the data as currently read.
    * $(B fileSize)       the size of the data currently read.
  )
  Returns:     true if more data should be read back. false otherwise.
*/
alias FileReadMoreCallback = bool delegate(string fileContents, long fileSize);

/**
    I/O Job function.
  
  Long-running jobs should periodically check the cancellable
  to see if they have been cancelled.

  ## Parameters
  $(LIST
    * $(B job)       a #GIOSchedulerJob.
    * $(B cancellable)       optional #GCancellable object, null to ignore.
  )
  Returns:     true if this function should be called again to
       complete the job, false if the job is complete (or cancelled)

  Deprecated:     Use [glib.thread_pool.ThreadPool] or
      [gio.task.Task.runInThread]
*/
alias IOSchedulerJobFunc = bool delegate(gio.ioscheduler_job.IOSchedulerJob job, gio.cancellable.Cancellable cancellable);

/**
    This is the function type of the callback used for the #GSource
  returned by [gio.pollable_input_stream.PollableInputStream.createSource] and
  [gio.pollable_output_stream.PollableOutputStream.createSource].

  ## Parameters
  $(LIST
    * $(B pollableStream)       the #GPollableInputStream or #GPollableOutputStream
  )
  Returns:     it should return false if the source should be removed.
*/
alias PollableSourceFunc = bool delegate(gobject.object.ObjectG pollableStream);

/**
    Changes the size of the memory block pointed to by data to
  size bytes.
  
  The function should have the same semantics as realloc().

  ## Parameters
  $(LIST
    * $(B size)       size to reallocate data to
  )
  Returns:     a pointer to the reallocated memory
*/
alias ReallocFunc = void* delegate(size_t size);

/**
    The type for the function that is used to convert from #GSettings to
  an object property. The value is already initialized to hold values
  of the appropriate type.

  ## Parameters
  $(LIST
    * $(B value)       return location for the property value
    * $(B variant)       the #GVariant
  )
  Returns:     true if the conversion succeeded, false in case of an error
*/
alias SettingsBindGetMapping = bool delegate(gobject.value.Value value, glib.variant.VariantG variant);

/**
    The type for the function that is used to convert an object property
  value to a #GVariant for storing it in #GSettings.

  ## Parameters
  $(LIST
    * $(B value)       a #GValue containing the property value to map
    * $(B expectedType)       the #GVariantType to create
  )
  Returns:     a new #GVariant holding the data from value,
        or null in case of an error
*/
alias SettingsBindSetMapping = glib.variant.VariantG delegate(gobject.value.Value value, glib.variant_type.VariantType expectedType);

/**
    The type of the function that is used to convert from a value stored
  in a #GSettings to a value that is useful to the application.
  
  If the value is successfully mapped, the result should be stored at
  result and true returned.  If mapping fails (for example, if value
  is not in the right format) then false should be returned.
  
  If value is null then it means that the mapping function is being
  given a "last chance" to successfully return a valid value.  true
  must be returned in this case.

  ## Parameters
  $(LIST
    * $(B value)       the #GVariant to map, or null
    * $(B result)       the result of the mapping
  )
  Returns:     true if the conversion succeeded, false in case of an error
*/
alias SettingsGetMapping = bool delegate(glib.variant.VariantG value, out void* result);

/**
    Simple thread function that runs an asynchronous operation and
  checks for cancellation.

  ## Parameters
  $(LIST
    * $(B res)       a #GSimpleAsyncResult.
    * $(B object)       a #GObject.
    * $(B cancellable)       optional #GCancellable object, null to ignore.
  )
*/
alias SimpleAsyncThreadFunc = void delegate(gio.simple_async_result.SimpleAsyncResult res, gobject.object.ObjectG object, gio.cancellable.Cancellable cancellable);

/**
    This is the function type of the callback used for the #GSource
  returned by [gio.socket.Socket.createSource].

  ## Parameters
  $(LIST
    * $(B socket)       the #GSocket
    * $(B condition)       the current condition at the source fired.
  )
  Returns:     it should return false if the source should be removed.
*/
alias SocketSourceFunc = bool delegate(gio.socket.Socket socket, glib.types.IOCondition condition);

/**
    The prototype for a task function to be run in a thread via
  [gio.task.Task.runInThread] or [gio.task.Task.runInThreadSync].
  
  If the return-on-cancel flag is set on task, and cancellable gets
  cancelled, then the #GTask will be completed immediately (as though
  [gio.task.Task.returnErrorIfCancelled] had been called), without
  waiting for the task function to complete. However, the task
  function will continue running in its thread in the background. The
  function therefore needs to be careful about how it uses
  externally-visible state in this case. See
  [gio.task.Task.setReturnOnCancel] for more details.
  
  Other than in that case, task will be completed when the
  #GTaskThreadFunc returns, not when it calls a
  `g_task_return_` function.

  ## Parameters
  $(LIST
    * $(B task)       the #GTask
    * $(B sourceObject)       task's source object
    * $(B cancellable)       task's #GCancellable, or null
  )
*/
alias TaskThreadFunc = void delegate(gio.task.Task task, gobject.object.ObjectG sourceObject, gio.cancellable.Cancellable cancellable);

/**
    This function type is used by [gio.vfs.Vfs.registerUriScheme] to make it
  possible for a client to associate an URI scheme to a different #GFile
  implementation.
  
  The client should return a reference to the new file that has been
  created for uri, or null to continue with the default implementation.

  ## Parameters
  $(LIST
    * $(B vfs)       a #GVfs
    * $(B identifier)       the identifier to look up a #GFile for. This can either
          be an URI or a parse name as returned by [gio.file.File.getParseName]
  )
  Returns:     a #GFile for identifier.
*/
alias VfsFileLookupFunc = gio.file.File delegate(gio.vfs.Vfs vfs, string identifier);

/**
    Flags used when creating a #GAppInfo.
*/
enum AppInfoCreateFlags : uint
{
  /**
      No flags.
  */
  None = 0,

  /**
      Application opens in a terminal window.
  */
  NeedsTerminal = 1,

  /**
      Application supports URI arguments.
  */
  SupportsUris = 2,

  /**
      Application supports startup notification. Since 2.26
  */
  SupportsStartupNotification = 4,
}

/**
    Flags used to define the behaviour of a #GApplication.
*/
enum ApplicationFlags : uint
{
  /**
      Default. Deprecated in 2.74, use
      [gio.types.ApplicationFlags.DefaultFlags] instead
  */
  FlagsNone = 0,

  /**
      Default flags. Since: 2.74
  */
  DefaultFlags = 0,

  /**
      Run as a service. In this mode, registration
         fails if the service is already running, and the application
         will initially wait up to 10 seconds for an initial activation
         message to arrive.
  */
  IsService = 1,

  /**
      Don't try to become the primary instance.
  */
  IsLauncher = 2,

  /**
      This application handles opening files (in
        the primary instance). Note that this flag only affects the default
        implementation of local_command_line(), and has no effect if
        [gio.types.ApplicationFlags.HandlesCommandLine] is given.
        See [gio.application.Application.run] for details.
  */
  HandlesOpen = 4,

  /**
      This application handles command line
        arguments (in the primary instance). Note that this flag only affect
        the default implementation of local_command_line().
        See [gio.application.Application.run] for details.
  */
  HandlesCommandLine = 8,

  /**
      Send the environment of the
        launching process to the primary instance. Set this flag if your
        application is expected to behave differently depending on certain
        environment variables. For instance, an editor might be expected
        to use the `GIT_COMMITTER_NAME` environment variable
        when editing a git commit message. The environment is available
        to the #GApplication::command-line signal handler, via
        [gio.application_command_line.ApplicationCommandLine.getenv].
  */
  SendEnvironment = 16,

  /**
      Make no attempts to do any of the typical
        single-instance application negotiation, even if the application
        ID is given.  The application neither attempts to become the
        owner of the application ID nor does it check if an existing
        owner already exists.  Everything occurs in the local process.
        Since: 2.30.
  */
  NonUnique = 32,

  /**
      Allow users to override the
        application ID from the command line with `--gapplication-app-id`.
        Since: 2.48
  */
  CanOverrideAppId = 64,

  /**
      Allow another instance to take over
        the bus name. Since: 2.60
  */
  AllowReplacement = 128,

  /**
      Take over from another instance. This flag is
        usually set by passing `--gapplication-replace` on the commandline.
        Since: 2.60
  */
  Replace = 256,
}

/**
    #GAskPasswordFlags are used to request specific information from the
  user, or to notify the user of their choices in an authentication
  situation.
*/
enum AskPasswordFlags : uint
{
  /**
      operation requires a password.
  */
  NeedPassword = 1,

  /**
      operation requires a username.
  */
  NeedUsername = 2,

  /**
      operation requires a domain.
  */
  NeedDomain = 4,

  /**
      operation supports saving settings.
  */
  SavingSupported = 8,

  /**
      operation supports anonymous users.
  */
  AnonymousSupported = 16,

  /**
      operation takes TCRYPT parameters (Since: 2.58)
  */
  Tcrypt = 32,
}

/**
    Flags used in [gio.global.busOwnName].
*/
enum BusNameOwnerFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Allow another message bus connection to claim the name.
  */
  AllowReplacement = 1,

  /**
      If another message bus connection owns the name and have
    specified [gio.types.BusNameOwnerFlags.AllowReplacement], then take the name from the other connection.
  */
  Replace = 2,

  /**
      If another message bus connection owns the name, immediately
    return an error from [gio.global.busOwnName] rather than entering the waiting queue for that name. (Since 2.54)
  */
  DoNotQueue = 4,
}

/**
    Flags used in [gio.global.busWatchName].
*/
enum BusNameWatcherFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      If no-one owns the name when
    beginning to watch the name, ask the bus to launch an owner for the
    name.
  */
  AutoStart = 1,
}

/**
    An enumeration for well-known message buses.
*/
enum BusType
{
  /**
      An alias for the message bus that activated the process, if any.
  */
  Starter = -1,

  /**
      Not a message bus.
  */
  None = 0,

  /**
      The system-wide message bus.
  */
  System = 1,

  /**
      The login session message bus.
  */
  Session = 2,
}

/**
    Flags used when calling a [gio.converter.Converter.convert].
*/
enum ConverterFlags : uint
{
  /**
      No flags.
  */
  None = 0,

  /**
      At end of input data
  */
  InputAtEnd = 1,

  /**
      Flush data
  */
  Flush = 2,
}

/**
    Results returned from [gio.converter.Converter.convert].
*/
enum ConverterResult
{
  /**
      There was an error during conversion.
  */
  Error = 0,

  /**
      Some data was consumed or produced
  */
  Converted = 1,

  /**
      The conversion is finished
  */
  Finished = 2,

  /**
      Flushing is finished
  */
  Flushed = 3,
}

/**
    Enumeration describing different kinds of native credential types.
*/
enum CredentialsType
{
  /**
      Indicates an invalid native credential type.
  */
  Invalid = 0,

  /**
      The native credentials type is a `struct ucred`.
  */
  LinuxUcred = 1,

  /**
      The native credentials type is a `struct cmsgcred`.
  */
  FreebsdCmsgcred = 2,

  /**
      The native credentials type is a `struct sockpeercred`. Added in 2.30.
  */
  OpenbsdSockpeercred = 3,

  /**
      The native credentials type is a `ucred_t`. Added in 2.40.
  */
  SolarisUcred = 4,

  /**
      The native credentials type is a `struct unpcbid`. Added in 2.42.
  */
  NetbsdUnpcbid = 5,

  /**
      The native credentials type is a `struct xucred`. Added in 2.66.
  */
  AppleXucred = 6,

  /**
      The native credentials type is a PID `DWORD`. Added in 2.72.
  */
  Win32Pid = 7,
}

/**
    Flags used in [gio.dbus_connection.DBusConnection.call] and similar APIs.
*/
enum DBusCallFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      The bus must not launch
    an owner for the destination name in response to this method
    invocation.
  */
  NoAutoStart = 1,

  /**
      the caller is prepared to
    wait for interactive authorization. Since 2.46.
  */
  AllowInteractiveAuthorization = 2,
}

/**
    Capabilities negotiated with the remote peer.
*/
enum DBusCapabilityFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      The connection
    supports exchanging UNIX file descriptors with the remote peer.
  */
  UnixFdPassing = 1,
}

/**
    Flags used when creating a new #GDBusConnection.
*/
enum DBusConnectionFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Perform authentication against server.
  */
  AuthenticationClient = 1,

  /**
      Perform authentication against client.
  */
  AuthenticationServer = 2,

  /**
      When
    authenticating as a server, allow the anonymous authentication
    method.
  */
  AuthenticationAllowAnonymous = 4,

  /**
      Pass this flag if connecting to a peer that is a
    message bus. This means that the Hello() method will be invoked as part of the connection setup.
  */
  MessageBusConnection = 8,

  /**
      If set, processing of D-Bus messages is
    delayed until [gio.dbus_connection.DBusConnection.startMessageProcessing] is called.
  */
  DelayMessageProcessing = 16,

  /**
      When authenticating
    as a server, require the UID of the peer to be the same as the UID of the server. (Since: 2.68)
  */
  AuthenticationRequireSameUser = 32,

  /**
      When authenticating, try to use
     protocols that work across a Linux user namespace boundary, even if this
     reduces interoperability with older D-Bus implementations. This currently
     affects client-side `EXTERNAL` authentication, for which this flag makes
     connections to a server in another user namespace succeed, but causes
     a deadlock when connecting to a GDBus server older than 2.73.3. Since: 2.74
  */
  CrossNamespace = 64,
}

/**
    Error codes for the `G_DBUS_ERROR` error domain.
*/
enum DBusError
{
  /**
      A generic error; "something went wrong" - see the error message for
    more.
  */
  Failed = 0,

  /**
      There was not enough memory to complete an operation.
  */
  NoMemory = 1,

  /**
      The bus doesn't know how to launch a service to supply the bus name
    you wanted.
  */
  ServiceUnknown = 2,

  /**
      The bus name you referenced doesn't exist (i.e. no application owns
    it).
  */
  NameHasNoOwner = 3,

  /**
      No reply to a message expecting one, usually means a timeout occurred.
  */
  NoReply = 4,

  /**
      Something went wrong reading or writing to a socket, for example.
  */
  IoError = 5,

  /**
      A D-Bus bus address was malformed.
  */
  BadAddress = 6,

  /**
      Requested operation isn't supported (like ENOSYS on UNIX).
  */
  NotSupported = 7,

  /**
      Some limited resource is exhausted.
  */
  LimitsExceeded = 8,

  /**
      Security restrictions don't allow doing what you're trying to do.
  */
  AccessDenied = 9,

  /**
      Authentication didn't work.
  */
  AuthFailed = 10,

  /**
      Unable to connect to server (probably caused by ECONNREFUSED on a
    socket).
  */
  NoServer = 11,

  /**
      Certain timeout errors, possibly ETIMEDOUT on a socket.  Note that
    [gio.types.DBusError.NoReply] is used for message reply timeouts. Warning:
    this is confusingly-named given that [gio.types.DBusError.TimedOut] also
    exists. We can't fix it for compatibility reasons so just be
    careful.
  */
  Timeout = 12,

  /**
      No network access (probably ENETUNREACH on a socket).
  */
  NoNetwork = 13,

  /**
      Can't bind a socket since its address is in use (i.e. EADDRINUSE).
  */
  AddressInUse = 14,

  /**
      The connection is disconnected and you're trying to use it.
  */
  Disconnected = 15,

  /**
      Invalid arguments passed to a method call.
  */
  InvalidArgs = 16,

  /**
      Missing file.
  */
  FileNotFound = 17,

  /**
      Existing file and the operation you're using does not silently overwrite.
  */
  FileExists = 18,

  /**
      Method name you invoked isn't known by the object you invoked it on.
  */
  UnknownMethod = 19,

  /**
      Certain timeout errors, e.g. while starting a service. Warning: this is
    confusingly-named given that [gio.types.DBusError.Timeout] also exists. We
    can't fix it for compatibility reasons so just be careful.
  */
  TimedOut = 20,

  /**
      Tried to remove or modify a match rule that didn't exist.
  */
  MatchRuleNotFound = 21,

  /**
      The match rule isn't syntactically valid.
  */
  MatchRuleInvalid = 22,

  /**
      While starting a new process, the exec() call failed.
  */
  SpawnExecFailed = 23,

  /**
      While starting a new process, the fork() call failed.
  */
  SpawnForkFailed = 24,

  /**
      While starting a new process, the child exited with a status code.
  */
  SpawnChildExited = 25,

  /**
      While starting a new process, the child exited on a signal.
  */
  SpawnChildSignaled = 26,

  /**
      While starting a new process, something went wrong.
  */
  SpawnFailed = 27,

  /**
      We failed to setup the environment correctly.
  */
  SpawnSetupFailed = 28,

  /**
      We failed to setup the config parser correctly.
  */
  SpawnConfigInvalid = 29,

  /**
      Bus name was not valid.
  */
  SpawnServiceInvalid = 30,

  /**
      Service file not found in system-services directory.
  */
  SpawnServiceNotFound = 31,

  /**
      Permissions are incorrect on the setuid helper.
  */
  SpawnPermissionsInvalid = 32,

  /**
      Service file invalid (Name, User or Exec missing).
  */
  SpawnFileInvalid = 33,

  /**
      Tried to get a UNIX process ID and it wasn't available.
  */
  SpawnNoMemory = 34,

  /**
      Tried to get a UNIX process ID and it wasn't available.
  */
  UnixProcessIdUnknown = 35,

  /**
      A type signature is not valid.
  */
  InvalidSignature = 36,

  /**
      A file contains invalid syntax or is otherwise broken.
  */
  InvalidFileContent = 37,

  /**
      Asked for SELinux security context and it wasn't available.
  */
  SelinuxSecurityContextUnknown = 38,

  /**
      Asked for ADT audit data and it wasn't available.
  */
  AdtAuditDataUnknown = 39,

  /**
      There's already an object with the requested object path.
  */
  ObjectPathInUse = 40,

  /**
      Object you invoked a method on isn't known. Since 2.42
  */
  UnknownObject = 41,

  /**
      Interface you invoked a method on isn't known by the object. Since 2.42
  */
  UnknownInterface = 42,

  /**
      Property you tried to access isn't known by the object. Since 2.42
  */
  UnknownProperty = 43,

  /**
      Property you tried to set is read-only. Since 2.42
  */
  PropertyReadOnly = 44,
}

/**
    Flags describing the behavior of a #GDBusInterfaceSkeleton instance.
*/
enum DBusInterfaceSkeletonFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Each method invocation is handled in
      a thread dedicated to the invocation. This means that the method implementation can use blocking IO
      without blocking any other part of the process. It also means that the method implementation must
      use locking to access data structures used by other threads.
  */
  HandleMethodInvocationsInThread = 1,
}

/**
    Enumeration used to describe the byte order of a D-Bus message.
*/
enum DBusMessageByteOrder
{
  /**
      The byte order is big endian.
  */
  BigEndian = 66,

  /**
      The byte order is little endian.
  */
  LittleEndian = 108,
}

/**
    Message flags used in #GDBusMessage.
*/
enum DBusMessageFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      A reply is not expected.
  */
  NoReplyExpected = 1,

  /**
      The bus must not launch an
    owner for the destination name in response to this message.
  */
  NoAutoStart = 2,

  /**
      If set on a method
    call, this flag means that the caller is prepared to wait for interactive
    authorization. Since 2.46.
  */
  AllowInteractiveAuthorization = 4,
}

/**
    Header fields used in #GDBusMessage.
*/
enum DBusMessageHeaderField
{
  /**
      Not a valid header field.
  */
  Invalid = 0,

  /**
      The object path.
  */
  Path = 1,

  /**
      The interface name.
  */
  Interface = 2,

  /**
      The method or signal name.
  */
  Member = 3,

  /**
      The name of the error that occurred.
  */
  ErrorName = 4,

  /**
      The serial number the message is a reply to.
  */
  ReplySerial = 5,

  /**
      The name the message is intended for.
  */
  Destination = 6,

  /**
      Unique name of the sender of the message (filled in by the bus).
  */
  Sender = 7,

  /**
      The signature of the message body.
  */
  Signature = 8,

  /**
      The number of UNIX file descriptors that accompany the message.
  */
  NumUnixFds = 9,
}

/**
    Message types used in #GDBusMessage.
*/
enum DBusMessageType
{
  /**
      Message is of invalid type.
  */
  Invalid = 0,

  /**
      Method call.
  */
  MethodCall = 1,

  /**
      Method reply.
  */
  MethodReturn = 2,

  /**
      Error reply.
  */
  Error = 3,

  /**
      Signal emission.
  */
  Signal = 4,
}

/**
    Flags used when constructing a #GDBusObjectManagerClient.
*/
enum DBusObjectManagerClientFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      If not set and the
      manager is for a well-known name, then request the bus to launch
      an owner for the name if no-one owns the name. This flag can only
      be used in managers for well-known names.
  */
  DoNotAutoStart = 1,
}

/**
    Flags describing the access control of a D-Bus property.
*/
enum DBusPropertyInfoFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Property is readable.
  */
  Readable = 1,

  /**
      Property is writable.
  */
  Writable = 2,
}

/**
    Flags used when constructing an instance of a #GDBusProxy derived class.
*/
enum DBusProxyFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Don't load properties.
  */
  DoNotLoadProperties = 1,

  /**
      Don't connect to signals on the remote object.
  */
  DoNotConnectSignals = 2,

  /**
      If the proxy is for a well-known name,
    do not ask the bus to launch an owner during proxy initialization or a method call.
    This flag is only meaningful in proxies for well-known names.
  */
  DoNotAutoStart = 4,

  /**
      If set, the property value for any __invalidated property__ will be (asynchronously) retrieved upon receiving the [`PropertiesChanged`](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-properties) D-Bus signal and the property will not cause emission of the #GDBusProxy::g-properties-changed signal. When the value is received the #GDBusProxy::g-properties-changed signal is emitted for the property along with the retrieved value. Since 2.32.
  */
  GetInvalidatedProperties = 8,

  /**
      If the proxy is for a well-known name,
    do not ask the bus to launch an owner during proxy initialization, but allow it to be
    autostarted by a method call. This flag is only meaningful in proxies for well-known names,
    and only if [gio.types.DBusProxyFlags.DoNotAutoStart] is not also specified.
  */
  DoNotAutoStartAtConstruction = 16,

  /**
      Don't actually send the AddMatch D-Bus
       call for this signal subscription. This gives you more control
       over which match rules you add (but you must add them manually). (Since: 2.72)
  */
  NoMatchRule = 32,
}

/**
    Flags used when sending #GDBusMessages on a #GDBusConnection.
*/
enum DBusSendMessageFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Do not automatically
    assign a serial number from the #GDBusConnection object when
    sending a message.
  */
  PreserveSerial = 1,
}

/**
    Flags used when creating a #GDBusServer.
*/
enum DBusServerFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      All #GDBusServer::new-connection
    signals will run in separated dedicated threads (see signal for
    details).
  */
  RunInThread = 1,

  /**
      Allow the anonymous
    authentication method.
  */
  AuthenticationAllowAnonymous = 2,

  /**
      Require the UID of the
    peer to be the same as the UID of the server when authenticating. (Since: 2.68)
  */
  AuthenticationRequireSameUser = 4,
}

/**
    Flags used when subscribing to signals via [gio.dbus_connection.DBusConnection.signalSubscribe].
*/
enum DBusSignalFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Don't actually send the AddMatch
    D-Bus call for this signal subscription.  This gives you more control
    over which match rules you add (but you must add them manually).
  */
  NoMatchRule = 1,

  /**
      Match first arguments that
    contain a bus or interface name with the given namespace.
  */
  MatchArg0Namespace = 2,

  /**
      Match first arguments that
    contain an object path that is either equivalent to the given path,
    or one of the paths is a subpath of the other.
  */
  MatchArg0Path = 4,
}

/**
    Flags passed to [gio.dbus_connection.DBusConnection.registerSubtree].
*/
enum DBusSubtreeFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Method calls to objects not in the enumerated range
                                                          will still be dispatched. This is useful if you want
                                                          to dynamically spawn objects in the subtree.
  */
  DispatchToUnenumeratedNodes = 1,
}

/**
    #GDataStreamByteOrder is used to ensure proper endianness of streaming data sources
  across various machine architectures.
*/
enum DataStreamByteOrder
{
  /**
      Selects Big Endian byte order.
  */
  BigEndian = 0,

  /**
      Selects Little Endian byte order.
  */
  LittleEndian = 1,

  /**
      Selects endianness based on host machine's architecture.
  */
  HostEndian = 2,
}

/**
    #GDataStreamNewlineType is used when checking for or setting the line endings for a given file.
*/
enum DataStreamNewlineType
{
  /**
      Selects "LF" line endings, common on most modern UNIX platforms.
  */
  Lf = 0,

  /**
      Selects "CR" line endings.
  */
  Cr = 1,

  /**
      Selects "CR, LF" line ending, common on Microsoft Windows.
  */
  CrLf = 2,

  /**
      Automatically try to handle any line ending type.
  */
  Any = 3,
}

/**
    Flags used when starting a drive.
*/
enum DriveStartFlags : uint
{
  /**
      No flags set.
  */
  None = 0,
}

/**
    Enumeration describing how a drive can be started/stopped.
*/
enum DriveStartStopType
{
  /**
      Unknown or drive doesn't support
       start/stop.
  */
  Unknown = 0,

  /**
      The stop method will physically
       shut down the drive and e.g. power down the port the drive is
       attached to.
  */
  Shutdown = 1,

  /**
      The start/stop methods are used
       for connecting/disconnect to the drive over the network.
  */
  Network = 2,

  /**
      The start/stop methods will
       assemble/disassemble a virtual drive from several physical
       drives.
  */
  Multidisk = 3,

  /**
      The start/stop methods will
       unlock/lock the disk (for example using the ATA <quote>SECURITY
       UNLOCK DEVICE</quote> command)
  */
  Password = 4,
}

/**
    GEmblemOrigin is used to add information about the origin of the emblem
  to #GEmblem.
*/
enum EmblemOrigin
{
  /**
      Emblem of unknown origin
  */
  Unknown = 0,

  /**
      Emblem adds device-specific information
  */
  Device = 1,

  /**
      Emblem depicts live metadata, such as "readonly"
  */
  Livemetadata = 2,

  /**
      Emblem comes from a user-defined tag, e.g. set by nautilus (in the future)
  */
  Tag = 3,
}

/**
    Flags specifying the behaviour of an attribute.
*/
enum FileAttributeInfoFlags : uint
{
  /**
      no flags set.
  */
  None = 0,

  /**
      copy the attribute values when the file is copied.
  */
  CopyWithFile = 1,

  /**
      copy the attribute values when the file is moved.
  */
  CopyWhenMoved = 2,
}

/**
    Used by [gio.file.File.setAttributesFromInfo] when setting file attributes.
*/
enum FileAttributeStatus
{
  /**
      Attribute value is unset (empty).
  */
  Unset = 0,

  /**
      Attribute value is set.
  */
  Set = 1,

  /**
      Indicates an error in setting the value.
  */
  ErrorSetting = 2,
}

/**
    The data types for file attributes.
*/
enum FileAttributeType
{
  /**
      indicates an invalid or uninitialized type.
  */
  Invalid = 0,

  /**
      a null terminated UTF8 string.
  */
  String = 1,

  /**
      a zero terminated string of non-zero bytes.
  */
  ByteString = 2,

  /**
      a boolean value.
  */
  Boolean = 3,

  /**
      an unsigned 4-byte/32-bit integer.
  */
  Uint32 = 4,

  /**
      a signed 4-byte/32-bit integer.
  */
  Int32 = 5,

  /**
      an unsigned 8-byte/64-bit integer.
  */
  Uint64 = 6,

  /**
      a signed 8-byte/64-bit integer.
  */
  Int64 = 7,

  /**
      a #GObject.
  */
  Object = 8,

  /**
      a null terminated char **. Since 2.22
  */
  Stringv = 9,
}

/**
    Flags used when copying or moving files.
*/
enum FileCopyFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Overwrite any existing files
  */
  Overwrite = 1,

  /**
      Make a backup of any existing files.
  */
  Backup = 2,

  /**
      Don't follow symlinks.
  */
  NofollowSymlinks = 4,

  /**
      Copy all file metadata instead of just default set used for copy (see #GFileInfo).
  */
  AllMetadata = 8,

  /**
      Don't use copy and delete fallback if native move not supported.
  */
  NoFallbackForMove = 16,

  /**
      Leaves target file with default perms, instead of setting the source file perms.
  */
  TargetDefaultPerms = 32,

  /**
      Use default modification
        timestamps instead of copying them from the source file. Since 2.80
  */
  TargetDefaultModifiedTime = 64,
}

/**
    Flags used when an operation may create a file.
*/
enum FileCreateFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Create a file that can only be
       accessed by the current user.
  */
  Private = 1,

  /**
      Replace the destination
       as if it didn't exist before. Don't try to keep any old
       permissions, replace instead of following links. This
       is generally useful if you're doing a "copy over"
       rather than a "save new version of" replace operation.
       You can think of it as "unlink destination" before
       writing to it, although the implementation may not
       be exactly like that. This flag can only be used with
       [gio.file.File.replace] and its variants, including [gio.file.File.replaceContents].
       Since 2.20
  */
  ReplaceDestination = 2,
}

/**
    Flags that can be used with [gio.file.File.measureDiskUsage].
*/
enum FileMeasureFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Report any error encountered
      while traversing the directory tree.  Normally errors are only
      reported for the toplevel file.
  */
  ReportAnyError = 2,

  /**
      Tally usage based on apparent file
      sizes.  Normally, the block-size is used, if available, as this is a
      more accurate representation of disk space used.
      Compare with `du --apparent-size`.
      Since GLib 2.78. and similarly to `du` since GNU Coreutils 9.2, this will
      ignore the sizes of file types other than regular files and links, as the
      sizes of other file types are not specified in a standard way.
  */
  ApparentSize = 4,

  /**
      Do not cross mount point boundaries.
      Compare with `du -x`.
  */
  NoXdev = 8,
}

/**
    Specifies what type of event a monitor event is.
*/
enum FileMonitorEvent
{
  /**
      a file changed.
  */
  Changed = 0,

  /**
      a hint that this was probably the last change in a set of changes.
  */
  ChangesDoneHint = 1,

  /**
      a file was deleted.
  */
  Deleted = 2,

  /**
      a file was created.
  */
  Created = 3,

  /**
      a file attribute was changed.
  */
  AttributeChanged = 4,

  /**
      the file location will soon be unmounted.
  */
  PreUnmount = 5,

  /**
      the file location was unmounted.
  */
  Unmounted = 6,

  /**
      the file was moved -- only sent if the
      (deprecated) [gio.types.FileMonitorFlags.SendMoved] flag is set
  */
  Moved = 7,

  /**
      the file was renamed within the
      current directory -- only sent if the [gio.types.FileMonitorFlags.WatchMoves]
      flag is set.  Since: 2.46.
  */
  Renamed = 8,

  /**
      the file was moved into the
      monitored directory from another location -- only sent if the
      [gio.types.FileMonitorFlags.WatchMoves] flag is set.  Since: 2.46.
  */
  MovedIn = 9,

  /**
      the file was moved out of the
      monitored directory to another location -- only sent if the
      [gio.types.FileMonitorFlags.WatchMoves] flag is set.  Since: 2.46
  */
  MovedOut = 10,
}

/**
    Flags used to set what a #GFileMonitor will watch for.
*/
enum FileMonitorFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Watch for mount events.
  */
  WatchMounts = 1,

  /**
      Pair DELETED and CREATED events caused
      by file renames (moves) and send a single G_FILE_MONITOR_EVENT_MOVED
      event instead (NB: not supported on all backends; the default
      behaviour -without specifying this flag- is to send single DELETED
      and CREATED events).  Deprecated since 2.46: use
      [gio.types.FileMonitorFlags.WatchMoves] instead.
  */
  SendMoved = 2,

  /**
      Watch for changes to the file made
      via another hard link. Since 2.36.
  */
  WatchHardLinks = 4,

  /**
      Watch for rename operations on a
      monitored directory.  This causes [gio.types.FileMonitorEvent.Renamed],
      [gio.types.FileMonitorEvent.MovedIn] and [gio.types.FileMonitorEvent.MovedOut]
      events to be emitted when possible.  Since: 2.46.
  */
  WatchMoves = 8,
}

/**
    Flags used when querying a #GFileInfo.
*/
enum FileQueryInfoFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Don't follow symlinks.
  */
  NofollowSymlinks = 1,
}

/**
    Indicates the file's on-disk type.
  
  On Windows systems a file will never have [gio.types.FileType.SymbolicLink] type;
  use #GFileInfo and `G_FILE_ATTRIBUTE_STANDARD_IS_SYMLINK` to determine
  whether a file is a symlink or not. This is due to the fact that NTFS does
  not have a single filesystem object type for symbolic links - it has
  files that symlink to files, and directories that symlink to directories.
  #GFileType enumeration cannot precisely represent this important distinction,
  which is why all Windows symlinks will continue to be reported as
  [gio.types.FileType.Regular] or [gio.types.FileType.Directory].
*/
enum FileType
{
  /**
      File's type is unknown.
  */
  Unknown = 0,

  /**
      File handle represents a regular file.
  */
  Regular = 1,

  /**
      File handle represents a directory.
  */
  Directory = 2,

  /**
      File handle represents a symbolic link
       (Unix systems).
  */
  SymbolicLink = 3,

  /**
      File is a "special" file, such as a socket, fifo,
       block device, or character device.
  */
  Special = 4,

  /**
      File is a shortcut (Windows systems).
  */
  Shortcut = 5,

  /**
      File is a mountable location.
  */
  Mountable = 6,
}

/**
    Indicates a hint from the file system whether files should be
  previewed in a file manager. Returned as the value of the key
  `G_FILE_ATTRIBUTE_FILESYSTEM_USE_PREVIEW`.
*/
enum FilesystemPreviewType
{
  /**
      Only preview files if user has explicitly requested it.
  */
  IfAlways = 0,

  /**
      Preview files if user has requested preview of "local" files.
  */
  IfLocal = 1,

  /**
      Never preview files.
  */
  Never = 2,
}

/**
    Error codes returned by GIO functions.
  
  Note that this domain may be extended in future GLib releases. In
  general, new error codes either only apply to new APIs, or else
  replace [gio.types.IOErrorEnum.Failed] in cases that were not explicitly
  distinguished before. You should therefore avoid writing code like
  ```c
  if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_FAILED))
    {
      // Assume that this is EPRINTERONFIRE
      ...
    }
  ```
  but should instead treat all unrecognized error codes the same as
  [gio.types.IOErrorEnum.Failed].
  
  See also #GPollableReturn for a cheaper way of returning
  [gio.types.IOErrorEnum.WouldBlock] to callers without allocating a #GError.
*/
enum IOErrorEnum
{
  /**
      Generic error condition for when an operation fails
        and no more specific #GIOErrorEnum value is defined.
  */
  Failed = 0,

  /**
      File not found.
  */
  NotFound = 1,

  /**
      File already exists.
  */
  Exists = 2,

  /**
      File is a directory.
  */
  IsDirectory = 3,

  /**
      File is not a directory.
  */
  NotDirectory = 4,

  /**
      File is a directory that isn't empty.
  */
  NotEmpty = 5,

  /**
      File is not a regular file.
  */
  NotRegularFile = 6,

  /**
      File is not a symbolic link.
  */
  NotSymbolicLink = 7,

  /**
      File cannot be mounted.
  */
  NotMountableFile = 8,

  /**
      Filename is too many characters.
  */
  FilenameTooLong = 9,

  /**
      Filename is invalid or contains invalid characters.
  */
  InvalidFilename = 10,

  /**
      File contains too many symbolic links.
  */
  TooManyLinks = 11,

  /**
      No space left on drive.
  */
  NoSpace = 12,

  /**
      Invalid argument.
  */
  InvalidArgument = 13,

  /**
      Permission denied.
  */
  PermissionDenied = 14,

  /**
      Operation (or one of its parameters) not supported
  */
  NotSupported = 15,

  /**
      File isn't mounted.
  */
  NotMounted = 16,

  /**
      File is already mounted.
  */
  AlreadyMounted = 17,

  /**
      File was closed.
  */
  Closed = 18,

  /**
      Operation was cancelled. See #GCancellable.
  */
  Cancelled = 19,

  /**
      Operations are still pending.
  */
  Pending = 20,

  /**
      File is read only.
  */
  ReadOnly = 21,

  /**
      Backup couldn't be created.
  */
  CantCreateBackup = 22,

  /**
      File's Entity Tag was incorrect.
  */
  WrongEtag = 23,

  /**
      Operation timed out.
  */
  TimedOut = 24,

  /**
      Operation would be recursive.
  */
  WouldRecurse = 25,

  /**
      File is busy.
  */
  Busy = 26,

  /**
      Operation would block.
  */
  WouldBlock = 27,

  /**
      Host couldn't be found (remote operations).
  */
  HostNotFound = 28,

  /**
      Operation would merge files.
  */
  WouldMerge = 29,

  /**
      Operation failed and a helper program has
        already interacted with the user. Do not display any error dialog.
  */
  FailedHandled = 30,

  /**
      The current process has too many files
        open and can't open any more. Duplicate descriptors do count toward
        this limit. Since 2.20
  */
  TooManyOpenFiles = 31,

  /**
      The object has not been initialized. Since 2.22
  */
  NotInitialized = 32,

  /**
      The requested address is already in use. Since 2.22
  */
  AddressInUse = 33,

  /**
      Need more input to finish operation. Since 2.24
  */
  PartialInput = 34,

  /**
      The input data was invalid. Since 2.24
  */
  InvalidData = 35,

  /**
      A remote object generated an error that
        doesn't correspond to a locally registered #GError error
        domain. Use [gio.global.dbusErrorGetRemoteError] to extract the D-Bus
        error name and [gio.global.dbusErrorStripRemoteError] to fix up the
        message so it matches what was received on the wire. Since 2.26.
  */
  DbusError = 36,

  /**
      Host unreachable. Since 2.26
  */
  HostUnreachable = 37,

  /**
      Network unreachable. Since 2.26
  */
  NetworkUnreachable = 38,

  /**
      Connection refused. Since 2.26
  */
  ConnectionRefused = 39,

  /**
      Connection to proxy server failed. Since 2.26
  */
  ProxyFailed = 40,

  /**
      Proxy authentication failed. Since 2.26
  */
  ProxyAuthFailed = 41,

  /**
      Proxy server needs authentication. Since 2.26
  */
  ProxyNeedAuth = 42,

  /**
      Proxy connection is not allowed by ruleset.
        Since 2.26
  */
  ProxyNotAllowed = 43,

  /**
      Broken pipe. Since 2.36
  */
  BrokenPipe = 44,

  /**
      Connection closed by peer. Note that this
        is the same code as [gio.types.IOErrorEnum.BrokenPipe]; before 2.44 some
        "connection closed" errors returned [gio.types.IOErrorEnum.BrokenPipe], but others
        returned [gio.types.IOErrorEnum.Failed]. Now they should all return the same
        value, which has this more logical name. Since 2.44.
  */
  ConnectionClosed = 44,

  /**
      Transport endpoint is not connected. Since 2.44
  */
  NotConnected = 45,

  /**
      Message too large. Since 2.48.
  */
  MessageTooLarge = 46,

  /**
      No such device found. Since 2.74
  */
  NoSuchDevice = 47,

  /**
      Destination address unset. Since 2.80
  */
  DestinationUnset = 48,
}

/**
    Flags for use with [gio.iomodule_scope.IOModuleScope.new_].
*/
enum IOModuleScopeFlags
{
  /**
      No module scan flags
  */
  None = 0,

  /**
      When using this scope to load or
        scan modules, automatically block a modules which has the same base
        basename as previously loaded module.
  */
  BlockDuplicates = 1,
}

/**
    GIOStreamSpliceFlags determine how streams should be spliced.
*/
enum IOStreamSpliceFlags : uint
{
  /**
      Do not close either stream.
  */
  None = 0,

  /**
      Close the first stream after
        the splice.
  */
  CloseStream1 = 1,

  /**
      Close the second stream after
        the splice.
  */
  CloseStream2 = 2,

  /**
      Wait for both splice operations to finish
        before calling the callback.
  */
  WaitForBoth = 4,
}

/**
    Memory availability warning levels.
  
  Note that because new values might be added, it is recommended that applications check
  #GMemoryMonitorWarningLevel as ranges, for example:
  ```c
  if (warning_level > G_MEMORY_MONITOR_WARNING_LEVEL_LOW)
    drop_caches ();
  ```
*/
enum MemoryMonitorWarningLevel
{
  /**
      Memory on the device is low, processes
      should free up unneeded resources (for example, in-memory caches) so they can
      be used elsewhere.
  */
  Low = 50,

  /**
      Same as @G_MEMORY_MONITOR_WARNING_LEVEL_LOW
      but the device has even less free memory, so processes should try harder to free
      up unneeded resources. If your process does not need to stay running, it is a
      good time for it to quit.
  */
  Medium = 100,

  /**
      The system will soon start terminating
      processes to reclaim memory, including background processes.
  */
  Critical = 255,
}

/**
    Flags used when mounting a mount.
*/
enum MountMountFlags : uint
{
  /**
      No flags set.
  */
  None = 0,
}

/**
    #GMountOperationResult is returned as a result when a request for
  information is send by the mounting operation.
*/
enum MountOperationResult
{
  /**
      The request was fulfilled and the
        user specified data is now available
  */
  Handled = 0,

  /**
      The user requested the mount operation
        to be aborted
  */
  Aborted = 1,

  /**
      The request was unhandled (i.e. not
        implemented)
  */
  Unhandled = 2,
}

/**
    Flags used when an unmounting a mount.
*/
enum MountUnmountFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Unmount even if there are outstanding
     file operations on the mount.
  */
  Force = 1,
}

/**
    The host's network connectivity state, as reported by #GNetworkMonitor.
*/
enum NetworkConnectivity
{
  /**
      The host is not configured with a
      route to the Internet; it may or may not be connected to a local
      network.
  */
  Local = 1,

  /**
      The host is connected to a network, but
      does not appear to be able to reach the full Internet, perhaps
      due to upstream network problems.
  */
  Limited = 2,

  /**
      The host is behind a captive portal and
      cannot reach the full Internet.
  */
  Portal = 3,

  /**
      The host is connected to a network, and
      appears to be able to reach the full Internet.
  */
  Full = 4,
}

/**
    Priority levels for #GNotifications.
*/
enum NotificationPriority
{
  /**
      the default priority, to be used for the
      majority of notifications (for example email messages, software updates,
      completed download/sync operations)
  */
  Normal = 0,

  /**
      for notifications that do not require
      immediate attention - typically used for contextual background
      information, such as contact birthdays or local weather
  */
  Low = 1,

  /**
      for events that require more attention,
      usually because responses are time-sensitive (for example chat and SMS
      messages or alarms)
  */
  High = 2,

  /**
      for urgent notifications, or notifications
      that require a response in a short space of time (for example phone calls
      or emergency warnings)
  */
  Urgent = 3,
}

/**
    GOutputStreamSpliceFlags determine how streams should be spliced.
*/
enum OutputStreamSpliceFlags : uint
{
  /**
      Do not close either stream.
  */
  None = 0,

  /**
      Close the source stream after
        the splice.
  */
  CloseSource = 1,

  /**
      Close the target stream after
        the splice.
  */
  CloseTarget = 2,
}

/**
    #GPasswordSave is used to indicate the lifespan of a saved password.
  
  #Gvfs stores passwords in the Gnome keyring when this flag allows it
  to, and later retrieves it again from there.
*/
enum PasswordSave
{
  /**
      never save a password.
  */
  Never = 0,

  /**
      save a password for the session.
  */
  ForSession = 1,

  /**
      save a password permanently.
  */
  Permanently = 2,
}

/**
    Return value for various IO operations that signal errors via the
  return value and not necessarily via a #GError.
  
  This enum exists to be able to return errors to callers without having to
  allocate a #GError. Allocating #GErrors can be quite expensive for
  regularly happening errors like [gio.types.IOErrorEnum.WouldBlock].
  
  In case of [gio.types.PollableReturn.Failed] a #GError should be set for the
  operation to give details about the error that happened.
*/
enum PollableReturn
{
  /**
      Generic error condition for when an operation fails.
  */
  Failed = 0,

  /**
      The operation was successfully finished.
  */
  Ok = 1,

  /**
      The operation would block.
  */
  WouldBlock = -27,
}

/**
    An error code used with `G_RESOLVER_ERROR` in a #GError returned
  from a #GResolver routine.
*/
enum ResolverError
{
  /**
      the requested name/address/service was not
        found
  */
  NotFound = 0,

  /**
      the requested information could not
        be looked up due to a network error or similar problem
  */
  TemporaryFailure = 1,

  /**
      unknown error
  */
  Internal = 2,
}

/**
    Flags to modify lookup behavior.
*/
enum ResolverNameLookupFlags : uint
{
  /**
      default behavior (same as [gio.resolver.Resolver.lookupByName])
  */
  Default = 0,

  /**
      only resolve ipv4 addresses
  */
  Ipv4Only = 1,

  /**
      only resolve ipv6 addresses
  */
  Ipv6Only = 2,
}

/**
    The type of record that [gio.resolver.Resolver.lookupRecords] or
  [gio.resolver.Resolver.lookupRecordsAsync] should retrieve. The records are returned
  as lists of #GVariant tuples. Each record type has different values in
  the variant tuples returned.
  
  [gio.types.ResolverRecordType.Srv] records are returned as variants with the signature
  `(qqqs)`, containing a [glib.types.MAXUINT16] with the priority, a [glib.types.MAXUINT16] with the
  weight, a [glib.types.MAXUINT16] with the port, and a string of the hostname.
  
  [gio.types.ResolverRecordType.Mx] records are returned as variants with the signature
  `(qs)`, representing a [glib.types.MAXUINT16] with the preference, and a string containing
  the mail exchanger hostname.
  
  [gio.types.ResolverRecordType.Txt] records are returned as variants with the signature
  `(as)`, representing an array of the strings in the text record. Note: Most TXT
  records only contain a single string, but
  [RFC 1035](https://tools.ietf.org/html/rfc1035#section-3.3.14) does allow a
  record to contain multiple strings. The RFC which defines the interpretation
  of a specific TXT record will likely require concatenation of multiple
  strings if they are present, as with
  [RFC 7208](https://tools.ietf.org/html/rfc7208#section-3.3).
  
  [gio.types.ResolverRecordType.Soa] records are returned as variants with the signature
  `(ssuuuuu)`, representing a string containing the primary name server, a
  string containing the administrator, the serial as a [pango.types.uint], the refresh
  interval as a [pango.types.uint], the retry interval as a [pango.types.uint], the expire timeout
  as a [pango.types.uint], and the TTL as a [pango.types.uint].
  
  [gio.types.ResolverRecordType.Ns] records are returned as variants with the signature
  `(s)`, representing a string of the hostname of the name server.
*/
enum ResolverRecordType
{
  /**
      look up DNS SRV records for a domain
  */
  Srv = 1,

  /**
      look up DNS MX records for a domain
  */
  Mx = 2,

  /**
      look up DNS TXT records for a name
  */
  Txt = 3,

  /**
      look up DNS SOA records for a zone
  */
  Soa = 4,

  /**
      look up DNS NS records for a domain
  */
  Ns = 5,
}

/**
    An error code used with `G_RESOURCE_ERROR` in a #GError returned
  from a #GResource routine.
*/
enum ResourceError
{
  /**
      no file was found at the requested path
  */
  NotFound = 0,

  /**
      unknown error
  */
  Internal = 1,
}

/**
    GResourceFlags give information about a particular file inside a resource
  bundle.
*/
enum ResourceFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      The file is compressed.
  */
  Compressed = 1,
}

/**
    GResourceLookupFlags determine how resource path lookups are handled.
*/
enum ResourceLookupFlags : uint
{
  /**
      No flags set.
  */
  None = 0,
}

/**
    Flags used when creating a binding. These flags determine in which
  direction the binding works. The default is to synchronize in both
  directions.
*/
enum SettingsBindFlags : uint
{
  /**
      Equivalent to `G_SETTINGS_BIND_GET|G_SETTINGS_BIND_SET`
  */
  Default = 0,

  /**
      Update the #GObject property when the setting changes.
        It is an error to use this flag if the property is not writable.
  */
  Get = 1,

  /**
      Update the setting when the #GObject property changes.
        It is an error to use this flag if the property is not readable.
  */
  Set = 2,

  /**
      Do not try to bind a "sensitivity" property to the writability of the setting
  */
  NoSensitivity = 4,

  /**
      When set in addition to [gio.types.SettingsBindFlags.Get], set the #GObject property
        value initially from the setting, but do not listen for changes of the setting
  */
  GetNoChanges = 8,

  /**
      When passed to [gio.settings.Settings.bind], uses a pair of mapping functions that invert
        the boolean value when mapping between the setting and the property.  The setting and property must both
        be booleans.  You cannot pass this flag to [gio.settings.Settings.bindWithMapping].
  */
  InvertBoolean = 16,
}

/**
    Describes an event occurring on a #GSocketClient. See the
  #GSocketClient::event signal for more details.
  
  Additional values may be added to this type in the future.
*/
enum SocketClientEvent
{
  /**
      The client is doing a DNS lookup.
  */
  Resolving = 0,

  /**
      The client has completed a DNS lookup.
  */
  Resolved = 1,

  /**
      The client is connecting to a remote
      host (either a proxy or the destination server).
  */
  Connecting = 2,

  /**
      The client has connected to a remote
      host.
  */
  Connected = 3,

  /**
      The client is negotiating
      with a proxy to connect to the destination server.
  */
  ProxyNegotiating = 4,

  /**
      The client has negotiated
      with the proxy server.
  */
  ProxyNegotiated = 5,

  /**
      The client is performing a
      TLS handshake.
  */
  TlsHandshaking = 6,

  /**
      The client has performed a
      TLS handshake.
  */
  TlsHandshaked = 7,

  /**
      The client is done with a particular
      #GSocketConnectable.
  */
  Complete = 8,
}

/**
    The protocol family of a #GSocketAddress. (These values are
  identical to the system defines `AF_INET`, `AF_INET6` and `AF_UNIX`,
  if available.)
*/
enum SocketFamily
{
  /**
      no address family
  */
  Invalid = 0,

  /**
      the UNIX domain family
  */
  Unix = 1,

  /**
      the IPv4 family
  */
  Ipv4 = 2,

  /**
      the IPv6 family
  */
  Ipv6 = 10,
}

/**
    Describes an event occurring on a #GSocketListener. See the
  #GSocketListener::event signal for more details.
  
  Additional values may be added to this type in the future.
*/
enum SocketListenerEvent
{
  /**
      The listener is about to bind a socket.
  */
  Binding = 0,

  /**
      The listener has bound a socket.
  */
  Bound = 1,

  /**
      The listener is about to start
       listening on this socket.
  */
  Listening = 2,

  /**
      The listener is now listening on
      this socket.
  */
  Listened = 3,
}

/**
    Flags used in [gio.socket.Socket.receiveMessage] and [gio.socket.Socket.sendMessage].
  The flags listed in the enum are some commonly available flags, but the
  values used for them are the same as on the platform, and any other flags
  are passed in/out as is. So to use a platform specific flag, just include
  the right system header and pass in the flag.
*/
enum SocketMsgFlags : uint
{
  /**
      No flags.
  */
  None = 0,

  /**
      Request to send/receive out of band data.
  */
  Oob = 1,

  /**
      Read data from the socket without removing it from
        the queue.
  */
  Peek = 2,

  /**
      Don't use a gateway to send out the packet,
        only send to hosts on directly connected networks.
  */
  Dontroute = 4,
}

/**
    A protocol identifier is specified when creating a #GSocket, which is a
  family/type specific identifier, where 0 means the default protocol for
  the particular family/type.
  
  This enum contains a set of commonly available and used protocols. You
  can also pass any other identifiers handled by the platform in order to
  use protocols not listed here.
*/
enum SocketProtocol
{
  /**
      The protocol type is unknown
  */
  Unknown = -1,

  /**
      The default protocol for the family/type
  */
  Default = 0,

  /**
      TCP over IP
  */
  Tcp = 6,

  /**
      UDP over IP
  */
  Udp = 17,

  /**
      SCTP over IP
  */
  Sctp = 132,
}

/**
    Flags used when creating a #GSocket. Some protocols may not implement
  all the socket types.
*/
enum SocketType
{
  /**
      Type unknown or wrong
  */
  Invalid = 0,

  /**
      Reliable connection-based byte streams (e.g. TCP).
  */
  Stream = 1,

  /**
      Connectionless, unreliable datagram passing.
        (e.g. UDP)
  */
  Datagram = 2,

  /**
      Reliable connection-based passing of datagrams
        of fixed maximum length (e.g. SCTP).
  */
  Seqpacket = 3,
}

/**
    Flags to define the behaviour of a #GSubprocess.
  
  Note that the default for stdin is to redirect from `/dev/null`.  For
  stdout and stderr the default are for them to inherit the
  corresponding descriptor from the calling process.
  
  Note that it is a programmer error to mix 'incompatible' flags.  For
  example, you may not request both [gio.types.SubprocessFlags.StdoutPipe] and
  [gio.types.SubprocessFlags.StdoutSilence].
*/
enum SubprocessFlags : uint
{
  /**
      No flags.
  */
  None = 0,

  /**
      create a pipe for the stdin of the
      spawned process that can be accessed with
      [gio.subprocess.Subprocess.getStdinPipe].
  */
  StdinPipe = 1,

  /**
      stdin is inherited from the
      calling process.
  */
  StdinInherit = 2,

  /**
      create a pipe for the stdout of the
      spawned process that can be accessed with
      [gio.subprocess.Subprocess.getStdoutPipe].
  */
  StdoutPipe = 4,

  /**
      silence the stdout of the spawned
      process (ie: redirect to `/dev/null`).
  */
  StdoutSilence = 8,

  /**
      create a pipe for the stderr of the
      spawned process that can be accessed with
      [gio.subprocess.Subprocess.getStderrPipe].
  */
  StderrPipe = 16,

  /**
      silence the stderr of the spawned
      process (ie: redirect to `/dev/null`).
  */
  StderrSilence = 32,

  /**
      merge the stderr of the spawned
      process with whatever the stdout happens to be.  This is a good way
      of directing both streams to a common log file, for example.
  */
  StderrMerge = 64,

  /**
      spawned processes will inherit the
      file descriptors of their parent, unless those descriptors have
      been explicitly marked as close-on-exec.  This flag has no effect
      over the "standard" file descriptors (stdin, stdout, stderr).
  */
  InheritFds = 128,

  /**
      if path searching is
      needed when spawning the subprocess, use the `PATH` in the launcher
      environment. (Since: 2.72)
  */
  SearchPathFromEnvp = 256,
}

/**
    Flags to define future #GTestDBus behaviour.
*/
enum TestDBusFlags : uint
{
  /**
      No flags.
  */
  None = 0,
}

/**
    The client authentication mode for a #GTlsServerConnection.
*/
enum TlsAuthenticationMode
{
  /**
      client authentication not required
  */
  None = 0,

  /**
      client authentication is requested
  */
  Requested = 1,

  /**
      client authentication is required
  */
  Required = 2,
}

/**
    A set of flags describing TLS certification validation. This can be
  used to describe why a particular certificate was rejected (for
  example, in #GTlsConnection::accept-certificate).
  
  GLib guarantees that if certificate verification fails, at least one
  flag will be set, but it does not guarantee that all possible flags
  will be set. Accordingly, you may not safely decide to ignore any
  particular type of error. For example, it would be incorrect to mask
  [gio.types.TlsCertificateFlags.Expired] if you want to allow expired certificates,
  because this could potentially be the only error flag set even if
  other problems exist with the certificate.
*/
enum TlsCertificateFlags : uint
{
  /**
      No flags set. Since: 2.74
  */
  NoFlags = 0,

  /**
      The signing certificate authority is
      not known.
  */
  UnknownCa = 1,

  /**
      The certificate does not match the
      expected identity of the site that it was retrieved from.
  */
  BadIdentity = 2,

  /**
      The certificate's activation time
      is still in the future
  */
  NotActivated = 4,

  /**
      The certificate has expired
  */
  Expired = 8,

  /**
      The certificate has been revoked
      according to the #GTlsConnection's certificate revocation list.
  */
  Revoked = 16,

  /**
      The certificate's algorithm is
      considered insecure.
  */
  Insecure = 32,

  /**
      Some other error occurred validating
      the certificate
  */
  GenericError = 64,

  /**
      the combination of all of the above
      flags
  */
  ValidateAll = 127,
}

/**
    Flags for [gio.tls_interaction.TlsInteraction.requestCertificate],
  [gio.tls_interaction.TlsInteraction.requestCertificateAsync], and
  [gio.tls_interaction.TlsInteraction.invokeRequestCertificate].
*/
enum TlsCertificateRequestFlags
{
  /**
      No flags
  */
  None = 0,
}

/**
    An error code used with `G_TLS_CHANNEL_BINDING_ERROR` in a #GError to
  indicate a TLS channel binding retrieval error.
*/
enum TlsChannelBindingError
{
  /**
      Either entire binding
       retrieval facility or specific binding type is not implemented in the
       TLS backend.
  */
  NotImplemented = 0,

  /**
      The handshake is not yet
       complete on the connection which is a strong requirement for any existing
       binding type.
  */
  InvalidState = 1,

  /**
      Handshake is complete but
       binding data is not available. That normally indicates the TLS
       implementation failed to provide the binding data. For example, some
       implementations do not provide a peer certificate for resumed connections.
  */
  NotAvailable = 2,

  /**
      Binding type is not supported
       on the current connection. This error could be triggered when requesting
       `tls-server-end-point` binding data for a certificate which has no hash
       function or uses multiple hash functions.
  */
  NotSupported = 3,

  /**
      Any other backend error
       preventing binding data retrieval.
  */
  GeneralError = 4,
}

/**
    The type of TLS channel binding data to retrieve from #GTlsConnection
  or #GDtlsConnection, as documented by RFC 5929 or RFC 9266. The
  [`tls-unique-for-telnet`](https://tools.ietf.org/html/rfc5929#section-5)
  binding type is not currently implemented.
*/
enum TlsChannelBindingType
{
  /**
      [`tls-unique`](https://tools.ietf.org/html/rfc5929#section-3) binding
       type
  */
  Unique = 0,

  /**
      [`tls-server-end-point`](https://tools.ietf.org/html/rfc5929#section-4)
       binding type
  */
  ServerEndPoint = 1,

  /**
      [`tls-exporter`](https://www.rfc-editor.org/rfc/rfc9266.html) binding
       type. Since: 2.74
  */
  Exporter = 2,
}

/**
    Flags for [gio.tls_database.TlsDatabase.lookupCertificateForHandle],
  [gio.tls_database.TlsDatabase.lookupCertificateIssuer],
  and [gio.tls_database.TlsDatabase.lookupCertificatesIssuedBy].
*/
enum TlsDatabaseLookupFlags
{
  /**
      No lookup flags
  */
  None = 0,

  /**
      Restrict lookup to certificates that have
        a private key.
  */
  Keypair = 1,
}

/**
    Flags for [gio.tls_database.TlsDatabase.verifyChain].
*/
enum TlsDatabaseVerifyFlags : uint
{
  /**
      No verification flags
  */
  None = 0,
}

/**
    An error code used with `G_TLS_ERROR` in a #GError returned from a
  TLS-related routine.
*/
enum TlsError
{
  /**
      No TLS provider is available
  */
  Unavailable = 0,

  /**
      Miscellaneous TLS error
  */
  Misc = 1,

  /**
      The certificate presented could not
      be parsed or failed validation.
  */
  BadCertificate = 2,

  /**
      The TLS handshake failed because the
      peer does not seem to be a TLS server.
  */
  NotTls = 3,

  /**
      The TLS handshake failed because the
      peer's certificate was not acceptable.
  */
  Handshake = 4,

  /**
      The TLS handshake failed because
      the server requested a client-side certificate, but none was
      provided. See [gio.tls_connection.TlsConnection.setCertificate].
  */
  CertificateRequired = 5,

  /**
      The TLS connection was closed without proper
      notice, which may indicate an attack. See
      [gio.tls_connection.TlsConnection.setRequireCloseNotify].
  */
  Eof = 6,

  /**
      The TLS handshake failed
      because the client sent the fallback SCSV, indicating a protocol
      downgrade attack. Since: 2.60
  */
  InappropriateFallback = 7,

  /**
      The certificate failed
      to load because a password was incorrect. Since: 2.72
  */
  BadCertificatePassword = 8,
}

/**
    #GTlsInteractionResult is returned by various functions in #GTlsInteraction
  when finishing an interaction request.
*/
enum TlsInteractionResult
{
  /**
      The interaction was unhandled (i.e. not
        implemented).
  */
  Unhandled = 0,

  /**
      The interaction completed, and resulting data
        is available.
  */
  Handled = 1,

  /**
      The interaction has failed, or was cancelled.
        and the operation should be aborted.
  */
  Failed = 2,
}

/**
    Various flags for the password.
*/
enum TlsPasswordFlags : uint
{
  /**
      No flags
  */
  None = 0,

  /**
      The password was wrong, and the user should retry.
  */
  Retry = 2,

  /**
      Hint to the user that the password has been
       wrong many times, and the user may not have many chances left.
  */
  ManyTries = 4,

  /**
      Hint to the user that this is the last try to get
       this password right.
  */
  FinalTry = 8,

  /**
      For PKCS #11, the user PIN is required.
       Since: 2.70.
  */
  Pkcs11User = 16,

  /**
      For PKCS #11, the security officer
       PIN is required. Since: 2.70.
  */
  Pkcs11SecurityOfficer = 32,

  /**
      For PKCS #11, the context-specific
       PIN is required. Since: 2.70.
  */
  Pkcs11ContextSpecific = 64,
}

/**
    The TLS or DTLS protocol version used by a #GTlsConnection or
  #GDtlsConnection. The integer values of these versions are sequential
  to ensure newer known protocol versions compare greater than older
  known versions. Any known DTLS protocol version will compare greater
  than any SSL or TLS protocol version. The protocol version may be
  [gio.types.TlsProtocolVersion.Unknown] if the TLS backend supports a newer
  protocol version that GLib does not yet know about. This means that
  it's possible for an unknown DTLS protocol version to compare less
  than the TLS protocol versions.
*/
enum TlsProtocolVersion
{
  /**
      No protocol version or unknown protocol version
  */
  Unknown = 0,

  /**
      SSL 3.0, which is insecure and should not be used
  */
  Ssl30 = 1,

  /**
      TLS 1.0, which is insecure and should not be used
  */
  Tls10 = 2,

  /**
      TLS 1.1, which is insecure and should not be used
  */
  Tls11 = 3,

  /**
      TLS 1.2, defined by [RFC 5246](https://datatracker.ietf.org/doc/html/rfc5246)
  */
  Tls12 = 4,

  /**
      TLS 1.3, defined by [RFC 8446](https://datatracker.ietf.org/doc/html/rfc8446)
  */
  Tls13 = 5,

  /**
      DTLS 1.0, which is insecure and should not be used
  */
  Dtls10 = 201,

  /**
      DTLS 1.2, defined by [RFC 6347](https://datatracker.ietf.org/doc/html/rfc6347)
  */
  Dtls12 = 202,
}

/**
    When to allow rehandshaking. See
  [gio.tls_connection.TlsConnection.setRehandshakeMode].

  Deprecated:     Changing the rehandshake mode is no longer
      required for compatibility. Also, rehandshaking has been removed
      from the TLS protocol in TLS 1.3.
*/
enum TlsRehandshakeMode
{
  /**
      Never allow rehandshaking
  */
  Never = 0,

  /**
      Allow safe rehandshaking only
  */
  Safely = 1,

  /**
      Allow unsafe rehandshaking
  */
  Unsafely = 2,
}

/**
    The type of name used by a #GUnixSocketAddress.
  [gio.types.UnixSocketAddressType.Path] indicates a traditional unix domain
  socket bound to a filesystem path. [gio.types.UnixSocketAddressType.Anonymous]
  indicates a socket not bound to any name (eg, a client-side socket,
  or a socket created with socketpair()).
  
  For abstract sockets, there are two incompatible ways of naming
  them; the man pages suggest using the entire `struct sockaddr_un`
  as the name, padding the unused parts of the `sun_path` field with
  zeroes; this corresponds to [gio.types.UnixSocketAddressType.AbstractPadded].
  However, many programs instead just use a portion of `sun_path`, and
  pass an appropriate smaller length to bind() or connect(). This is
  [gio.types.UnixSocketAddressType.Abstract].
*/
enum UnixSocketAddressType
{
  /**
      invalid
  */
  Invalid = 0,

  /**
      anonymous
  */
  Anonymous = 1,

  /**
      a filesystem path
  */
  Path = 2,

  /**
      an abstract name
  */
  Abstract = 3,

  /**
      an abstract name, 0-padded
      to the full length of a unix socket name
  */
  AbstractPadded = 4,
}

/**
    Used to select the type of data format to use for #GZlibDecompressor
  and #GZlibCompressor.
*/
enum ZlibCompressorFormat
{
  /**
      deflate compression with zlib header
  */
  Zlib = 0,

  /**
      gzip file format
  */
  Gzip = 1,

  /**
      deflate compression with no header
  */
  Raw = 2,
}

/**
    The value returned by handlers of the signals generated by
  the `gdbus-codegen` tool to indicate that a method call has been
  handled by an implementation. It is equal to true, but using
  this macro is sometimes more readable.
  
  In code that needs to be backwards-compatible with older GLib,
  use true instead, often written like this:
  
  ```
    g_dbus_method_invocation_return_error (invocation, ...);
    return TRUE;    // handled
  ```
*/
enum DBUS_METHOD_INVOCATION_HANDLED = true;

/**
    The value returned by handlers of the signals generated by
  the `gdbus-codegen` tool to indicate that a method call has not been
  handled by an implementation. It is equal to false, but using
  this macro is sometimes more readable.
  
  In code that needs to be backwards-compatible with older GLib,
  use false instead.
*/
enum DBUS_METHOD_INVOCATION_UNHANDLED = false;

/**
    Extension point for debug control functionality.
  See [Extending GIO][extending-gio].
*/
enum DEBUG_CONTROLLER_EXTENSION_POINT_NAME = "gio-debug-controller";

/**
    Extension point for default handler to URI association. See
  [Extending GIO][extending-gio].

  Deprecated:     The #GDesktopAppInfoLookup interface is deprecated and
       unused by GIO.
*/
enum DESKTOP_APP_INFO_LOOKUP_EXTENSION_POINT_NAME = "gio-desktop-app-info-lookup";

/**
    The string used to obtain a Unix device path with [gio.drive.Drive.getIdentifier].
*/
enum DRIVE_IDENTIFIER_KIND_UNIX_DEVICE = "unix-device";

/**
    A key in the "access" namespace for checking deletion privileges.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
  
  This attribute will be true if the user is able to delete the file.
*/
enum FILE_ATTRIBUTE_ACCESS_CAN_DELETE = "access::can-delete";

/**
    A key in the "access" namespace for getting execution privileges.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
  
  This attribute will be true if the user is able to execute the file.
*/
enum FILE_ATTRIBUTE_ACCESS_CAN_EXECUTE = "access::can-execute";

/**
    A key in the "access" namespace for getting read privileges.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
  
  This attribute will be true if the user is able to read the file.
*/
enum FILE_ATTRIBUTE_ACCESS_CAN_READ = "access::can-read";

/**
    A key in the "access" namespace for checking renaming privileges.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
  
  This attribute will be true if the user is able to rename the file.
*/
enum FILE_ATTRIBUTE_ACCESS_CAN_RENAME = "access::can-rename";

/**
    A key in the "access" namespace for checking trashing privileges.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
  
  This attribute will be true if the user is able to move the file to
  the trash.
*/
enum FILE_ATTRIBUTE_ACCESS_CAN_TRASH = "access::can-trash";

/**
    A key in the "access" namespace for getting write privileges.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
  
  This attribute will be true if the user is able to write to the file.
*/
enum FILE_ATTRIBUTE_ACCESS_CAN_WRITE = "access::can-write";

/**
    A key in the "dos" namespace for checking if the file's archive flag
  is set.
  
  This attribute is true if the archive flag is set.
  
  This attribute is only available for DOS file systems.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_DOS_IS_ARCHIVE = "dos::is-archive";

/**
    A key in the "dos" namespace for checking if the file is a NTFS mount point
  (a volume mount or a junction point).
  
  This attribute is true if file is a reparse point of type
  [IO_REPARSE_TAG_MOUNT_POINT](https://msdn.microsoft.com/en-us/library/dd541667.aspx).
  
  This attribute is only available for DOS file systems.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_DOS_IS_MOUNTPOINT = "dos::is-mountpoint";

/**
    A key in the "dos" namespace for checking if the file's backup flag
  is set.
  
  This attribute is true if the backup flag is set.
  
  This attribute is only available for DOS file systems.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_DOS_IS_SYSTEM = "dos::is-system";

/**
    A key in the "dos" namespace for getting the file NTFS reparse tag.
  
  This value is 0 for files that are not reparse points.
  
  See the [Reparse Tags](https://msdn.microsoft.com/en-us/library/dd541667.aspx)
  page for possible reparse tag values.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_DOS_REPARSE_POINT_TAG = "dos::reparse-point-tag";

/**
    A key in the "etag" namespace for getting the value of the file's
  entity tag.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_ETAG_VALUE = "etag::value";

/**
    A key in the "filesystem" namespace for getting the number of bytes
  of free space left on the file system.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64].
*/
enum FILE_ATTRIBUTE_FILESYSTEM_FREE = "filesystem::free";

/**
    A key in the "filesystem" namespace for checking if the file system
  is read only.
  
  Is set to true if the file system is read only.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_FILESYSTEM_READONLY = "filesystem::readonly";

/**
    A key in the "filesystem" namespace for checking if the file system
  is remote.
  
  Is set to true if the file system is remote.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_FILESYSTEM_REMOTE = "filesystem::remote";

/**
    A key in the "filesystem" namespace for getting the total size (in
  bytes) of the file system, used in [gio.file.File.queryFilesystemInfo].
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64].
*/
enum FILE_ATTRIBUTE_FILESYSTEM_SIZE = "filesystem::size";

/**
    A key in the "filesystem" namespace for getting the file system's type.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_FILESYSTEM_TYPE = "filesystem::type";

/**
    A key in the "filesystem" namespace for getting the number of bytes
  used by data on the file system.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64].
*/
enum FILE_ATTRIBUTE_FILESYSTEM_USED = "filesystem::used";

/**
    A key in the "filesystem" namespace for hinting a file manager
  application whether it should preview (e.g. thumbnail) files on the
  file system.
  
  The value for this key contain a #GFilesystemPreviewType.
*/
enum FILE_ATTRIBUTE_FILESYSTEM_USE_PREVIEW = "filesystem::use-preview";

/**
    A key in the "gvfs" namespace that gets the name of the current
  GVFS backend in use.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_GVFS_BACKEND = "gvfs::backend";

/**
    A key in the "id" namespace for getting a file identifier.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
  
  An example use would be during listing files, to avoid recursive
  directory scanning.
*/
enum FILE_ATTRIBUTE_ID_FILE = "id::file";

/**
    A key in the "id" namespace for getting the file system identifier.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
  
  An example use would be during drag and drop to see if the source
  and target are on the same filesystem (default to move) or not (default
  to copy).
*/
enum FILE_ATTRIBUTE_ID_FILESYSTEM = "id::filesystem";

/**
    A key in the "mountable" namespace for checking if a file (of
  type G_FILE_TYPE_MOUNTABLE) can be ejected.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_CAN_EJECT = "mountable::can-eject";

/**
    A key in the "mountable" namespace for checking if a file (of
  type G_FILE_TYPE_MOUNTABLE) is mountable.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_CAN_MOUNT = "mountable::can-mount";

/**
    A key in the "mountable" namespace for checking if a file (of
  type G_FILE_TYPE_MOUNTABLE) can be polled.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_CAN_POLL = "mountable::can-poll";

/**
    A key in the "mountable" namespace for checking if a file (of
  type G_FILE_TYPE_MOUNTABLE) can be started.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_CAN_START = "mountable::can-start";

/**
    A key in the "mountable" namespace for checking if a file (of
  type G_FILE_TYPE_MOUNTABLE) can be started degraded.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_CAN_START_DEGRADED = "mountable::can-start-degraded";

/**
    A key in the "mountable" namespace for checking if a file (of
  type G_FILE_TYPE_MOUNTABLE) can be stopped.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_CAN_STOP = "mountable::can-stop";

/**
    A key in the "mountable" namespace for checking if a file (of
  type G_FILE_TYPE_MOUNTABLE)  is unmountable.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_CAN_UNMOUNT = "mountable::can-unmount";

/**
    A key in the "mountable" namespace for getting the HAL UDI for the mountable
  file.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_HAL_UDI = "mountable::hal-udi";

/**
    A key in the "mountable" namespace for checking if a file (of
  type G_FILE_TYPE_MOUNTABLE) is automatically polled for media.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_IS_MEDIA_CHECK_AUTOMATIC = "mountable::is-media-check-automatic";

/**
    A key in the "mountable" namespace for getting the #GDriveStartStopType.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_START_STOP_TYPE = "mountable::start-stop-type";

/**
    A key in the "mountable" namespace for getting the unix device.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE = "mountable::unix-device";

/**
    A key in the "mountable" namespace for getting the unix device file.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE_FILE = "mountable::unix-device-file";

/**
    A key in the "owner" namespace for getting the file owner's group.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_OWNER_GROUP = "owner::group";

/**
    A key in the "owner" namespace for getting the user name of the
  file's owner.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_OWNER_USER = "owner::user";

/**
    A key in the "owner" namespace for getting the real name of the
  user that owns the file.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_OWNER_USER_REAL = "owner::user-real";

/**
    A key in the "preview" namespace for getting a #GIcon that can be
  used to get preview of the file.
  
  For example, it may be a low resolution thumbnail without metadata.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Object].
  
  The value for this key should contain a #GIcon.
*/
enum FILE_ATTRIBUTE_PREVIEW_ICON = "preview::icon";

/**
    A key in the "recent" namespace for getting time, when the metadata for the
  file in `recent:///` was last changed.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Int64].
*/
enum FILE_ATTRIBUTE_RECENT_MODIFIED = "recent::modified";

/**
    A key in the "selinux" namespace for getting the file's SELinux
  context.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
  
  Note that this attribute is only available if GLib has been built
  with SELinux support.
*/
enum FILE_ATTRIBUTE_SELINUX_CONTEXT = "selinux::context";

/**
    A key in the "standard" namespace for getting the amount of disk space
  that is consumed by the file (in bytes).
  
  This will generally be larger than the file size (due to block size
  overhead) but can occasionally be smaller (for example, for sparse files).
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64].
*/
enum FILE_ATTRIBUTE_STANDARD_ALLOCATED_SIZE = "standard::allocated-size";

/**
    A key in the "standard" namespace for getting the content type of the file.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
  
  The value for this key should contain a valid content type.
*/
enum FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE = "standard::content-type";

/**
    A key in the "standard" namespace for getting the copy name of the file.
  
  The copy name is an optional version of the name. If available it's always
  in UTF8, and corresponds directly to the original filename (only transcoded to
  UTF8). This is useful if you want to copy the file to another filesystem that
  might have a different encoding. If the filename is not a valid string in the
  encoding selected for the filesystem it is in then the copy name will not be set.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_STANDARD_COPY_NAME = "standard::copy-name";

/**
    A key in the "standard" namespace for getting the description of the file.
  
  The description is a utf8 string that describes the file, generally containing
  the filename, but can also contain further information. Example descriptions
  could be "filename (on hostname)" for a remote file or "filename (in trash)"
  for a file in the trash. This is useful for instance as the window title
  when displaying a directory or for a bookmarks menu.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_STANDARD_DESCRIPTION = "standard::description";

/**
    A key in the "standard" namespace for getting the display name of the file.
  
  A display name is guaranteed to be in UTF-8 and can thus be displayed in
  the UI. It is guaranteed to be set on every file.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME = "standard::display-name";

/**
    A key in the "standard" namespace for edit name of the file.
  
  An edit name is similar to the display name, but it is meant to be
  used when you want to rename the file in the UI. The display name
  might contain information you don't want in the new filename (such as
  "(invalid unicode)" if the filename was in an invalid encoding).
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_STANDARD_EDIT_NAME = "standard::edit-name";

/**
    A key in the "standard" namespace for getting the fast content type.
  
  The fast content type isn't as reliable as the regular one, as it
  only uses the filename to guess it, but it is faster to calculate than the
  regular content type.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_STANDARD_FAST_CONTENT_TYPE = "standard::fast-content-type";

/**
    A key in the "standard" namespace for getting the icon for the file.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Object].
  
  The value for this key should contain a #GIcon.
*/
enum FILE_ATTRIBUTE_STANDARD_ICON = "standard::icon";

/**
    A key in the "standard" namespace for checking if a file is a backup file.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_STANDARD_IS_BACKUP = "standard::is-backup";

/**
    A key in the "standard" namespace for checking if a file is hidden.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_STANDARD_IS_HIDDEN = "standard::is-hidden";

/**
    A key in the "standard" namespace for checking if the file is a symlink.
  Typically the actual type is something else, if we followed the symlink
  to get the type.
  
  On Windows NTFS mountpoints are considered to be symlinks as well.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_STANDARD_IS_SYMLINK = "standard::is-symlink";

/**
    A key in the "standard" namespace for checking if a file is virtual.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_STANDARD_IS_VIRTUAL = "standard::is-virtual";

/**
    A key in the "standard" namespace for checking if a file is
  volatile. This is meant for opaque, non-POSIX-like backends to
  indicate that the URI is not persistent. Applications should look
  at `G_FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET` for the persistent URI.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_STANDARD_IS_VOLATILE = "standard::is-volatile";

/**
    A key in the "standard" namespace for getting the name of the file.
  
  The name is the on-disk filename which may not be in any known encoding,
  and can thus not be generally displayed as is. It is guaranteed to be set on
  every file.
  
  Use `G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME` if you need to display the
  name in a user interface.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.ByteString].
*/
enum FILE_ATTRIBUTE_STANDARD_NAME = "standard::name";

/**
    A key in the "standard" namespace for getting the file's size (in bytes).
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64].
*/
enum FILE_ATTRIBUTE_STANDARD_SIZE = "standard::size";

/**
    A key in the "standard" namespace for setting the sort order of a file.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Int32].
  
  An example use would be in file managers, which would use this key
  to set the order files are displayed. Files with smaller sort order
  should be sorted first, and files without sort order as if sort order
  was zero.
*/
enum FILE_ATTRIBUTE_STANDARD_SORT_ORDER = "standard::sort-order";

/**
    A key in the "standard" namespace for getting the symbolic icon for the file.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Object].
  
  The value for this key should contain a #GIcon.
*/
enum FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON = "standard::symbolic-icon";

/**
    A key in the "standard" namespace for getting the symlink target, if the file
  is a symlink.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.ByteString].
*/
enum FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET = "standard::symlink-target";

/**
    A key in the "standard" namespace for getting the target URI for the file, in
  the case of [gio.types.FileType.Shortcut] or [gio.types.FileType.Mountable] files.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_STANDARD_TARGET_URI = "standard::target-uri";

/**
    A key in the "standard" namespace for storing file types.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
  
  The value for this key should contain a #GFileType.
*/
enum FILE_ATTRIBUTE_STANDARD_TYPE = "standard::type";

/**
    A key in the "thumbnail" namespace for checking if thumbnailing failed.
  
  This attribute is true if thumbnailing failed.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAILING_FAILED = "thumbnail::failed";

/**
    A key in the "thumbnail" namespace for checking if thumbnailing failed
  for the large image.
  
  This attribute is true if thumbnailing failed.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAILING_FAILED_LARGE = "thumbnail::failed-large";

/**
    A key in the "thumbnail" namespace for checking if thumbnailing failed
  for the normal image.
  
  This attribute is true if thumbnailing failed.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAILING_FAILED_NORMAL = "thumbnail::failed-normal";

/**
    A key in the "thumbnail" namespace for checking if thumbnailing failed
  for the x-large image.
  
  This attribute is true if thumbnailing failed.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAILING_FAILED_XLARGE = "thumbnail::failed-xlarge";

/**
    A key in the "thumbnail" namespace for checking if thumbnailing failed
  for the xx-large image.
  
  This attribute is true if thumbnailing failed.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAILING_FAILED_XXLARGE = "thumbnail::failed-xxlarge";

/**
    A key in the "thumbnail" namespace for checking whether the thumbnail is outdated.
  
  This attribute is true if the thumbnail is up-to-date with the file it represents,
  and false if the file has been modified since the thumbnail was generated.
  
  If `G_FILE_ATTRIBUTE_THUMBNAILING_FAILED` is true and this attribute is false,
  it indicates that thumbnailing may be attempted again and may succeed.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_IS_VALID = "thumbnail::is-valid";

/**
    A key in the "thumbnail" namespace for checking whether the large
  thumbnail is outdated.
  
  This attribute is true if the large thumbnail is up-to-date with the file
  it represents, and false if the file has been modified since the thumbnail
  was generated.
  
  If `G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_LARGE` is true and this attribute
  is false, it indicates that thumbnailing may be attempted again and may
  succeed.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_LARGE = "thumbnail::is-valid-large";

/**
    A key in the "thumbnail" namespace for checking whether the normal
  thumbnail is outdated.
  
  This attribute is true if the normal thumbnail is up-to-date with the file
  it represents, and false if the file has been modified since the thumbnail
  was generated.
  
  If `G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_NORMAL` is true and this attribute
  is false, it indicates that thumbnailing may be attempted again and may
  succeed.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_NORMAL = "thumbnail::is-valid-normal";

/**
    A key in the "thumbnail" namespace for checking whether the x-large
  thumbnail is outdated.
  
  This attribute is true if the x-large thumbnail is up-to-date with the file
  it represents, and false if the file has been modified since the thumbnail
  was generated.
  
  If `G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_XLARGE` is true and this attribute
  is false, it indicates that thumbnailing may be attempted again and may
  succeed.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_XLARGE = "thumbnail::is-valid-xlarge";

/**
    A key in the "thumbnail" namespace for checking whether the xx-large
  thumbnail is outdated.
  
  This attribute is true if the x-large thumbnail is up-to-date with the file
  it represents, and false if the file has been modified since the thumbnail
  was generated.
  
  If `G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_XXLARGE` is true and this attribute
  is false, it indicates that thumbnailing may be attempted again and may
  succeed.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_XXLARGE = "thumbnail::is-valid-xxlarge";

/**
    A key in the "thumbnail" namespace for getting the path to the thumbnail
  image with the biggest size available.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.ByteString].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_PATH = "thumbnail::path";

/**
    A key in the "thumbnail" namespace for getting the path to the large
  thumbnail image.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.ByteString].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_PATH_LARGE = "thumbnail::path-large";

/**
    A key in the "thumbnail" namespace for getting the path to the normal
  thumbnail image.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.ByteString].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_PATH_NORMAL = "thumbnail::path-normal";

/**
    A key in the "thumbnail" namespace for getting the path to the x-large
  thumbnail image.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.ByteString].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_PATH_XLARGE = "thumbnail::path-xlarge";

/**
    A key in the "thumbnail" namespace for getting the path to the xx-large
  thumbnail image.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.ByteString].
*/
enum FILE_ATTRIBUTE_THUMBNAIL_PATH_XXLARGE = "thumbnail::path-xxlarge";

/**
    A key in the "time" namespace for getting the time the file was last
  accessed.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64], and
  contains the time since the file was last accessed, in seconds since the
  UNIX epoch.
*/
enum FILE_ATTRIBUTE_TIME_ACCESS = "time::access";

/**
    A key in the "time" namespace for getting the nanoseconds of the time
  the file was last accessed. This should be used in conjunction with
  #G_FILE_ATTRIBUTE_TIME_ACCESS. Corresponding #GFileAttributeType is
  [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TIME_ACCESS_NSEC = "time::access-nsec";

/**
    A key in the "time" namespace for getting the microseconds of the time
  the file was last accessed.
  
  This should be used in conjunction with `G_FILE_ATTRIBUTE_TIME_ACCESS`.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TIME_ACCESS_USEC = "time::access-usec";

/**
    A key in the "time" namespace for getting the time the file was last
  changed.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64],
  and contains the time since the file was last changed, in seconds since
  the UNIX epoch.
  
  This corresponds to the traditional UNIX ctime.
*/
enum FILE_ATTRIBUTE_TIME_CHANGED = "time::changed";

/**
    A key in the "time" namespace for getting the nanoseconds of the time
  the file was last changed. This should be used in conjunction with
  #G_FILE_ATTRIBUTE_TIME_CHANGED. Corresponding #GFileAttributeType is
  [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TIME_CHANGED_NSEC = "time::changed-nsec";

/**
    A key in the "time" namespace for getting the microseconds of the time
  the file was last changed.
  
  This should be used in conjunction with `G_FILE_ATTRIBUTE_TIME_CHANGED`.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TIME_CHANGED_USEC = "time::changed-usec";

/**
    A key in the "time" namespace for getting the time the file was created.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64],
  and contains the time since the file was created, in seconds since the UNIX
  epoch.
  
  This may correspond to Linux `stx_btime`, FreeBSD `st_birthtim`, NetBSD
  `st_birthtime` or NTFS `ctime`.
*/
enum FILE_ATTRIBUTE_TIME_CREATED = "time::created";

/**
    A key in the "time" namespace for getting the nanoseconds of the time
  the file was created. This should be used in conjunction with
  #G_FILE_ATTRIBUTE_TIME_CREATED. Corresponding #GFileAttributeType is
  [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TIME_CREATED_NSEC = "time::created-nsec";

/**
    A key in the "time" namespace for getting the microseconds of the time
  the file was created.
  
  This should be used in conjunction with `G_FILE_ATTRIBUTE_TIME_CREATED`.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TIME_CREATED_USEC = "time::created-usec";

/**
    A key in the "time" namespace for getting the time the file was last
  modified.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64], and
  contains the time since the file was modified, in seconds since the UNIX
  epoch.
*/
enum FILE_ATTRIBUTE_TIME_MODIFIED = "time::modified";

/**
    A key in the "time" namespace for getting the nanoseconds of the time
  the file was last modified. This should be used in conjunction with
  #G_FILE_ATTRIBUTE_TIME_MODIFIED. Corresponding #GFileAttributeType is
  [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TIME_MODIFIED_NSEC = "time::modified-nsec";

/**
    A key in the "time" namespace for getting the microseconds of the time
  the file was last modified.
  
  This should be used in conjunction with `G_FILE_ATTRIBUTE_TIME_MODIFIED`.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TIME_MODIFIED_USEC = "time::modified-usec";

/**
    A key in the "trash" namespace for getting the deletion date and time
  of a file inside the `trash:///` folder.
  
  The format of the returned string is `YYYY-MM-DDThh:mm:ss`.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.String].
*/
enum FILE_ATTRIBUTE_TRASH_DELETION_DATE = "trash::deletion-date";

/**
    A key in the "trash" namespace for getting the number of (toplevel) items
  that are present in the `trash:///` folder.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_TRASH_ITEM_COUNT = "trash::item-count";

/**
    A key in the "trash" namespace for getting the original path of a file
  inside the `trash:///` folder before it was trashed.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.ByteString].
*/
enum FILE_ATTRIBUTE_TRASH_ORIG_PATH = "trash::orig-path";

/**
    A key in the "unix" namespace for getting the number of blocks allocated
  for the file.
  
  This attribute is only available for UNIX file systems.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64].
*/
enum FILE_ATTRIBUTE_UNIX_BLOCKS = "unix::blocks";

/**
    A key in the "unix" namespace for getting the block size for the file
  system.
  
  This attribute is only available for UNIX file systems.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_UNIX_BLOCK_SIZE = "unix::block-size";

/**
    A key in the "unix" namespace for getting the device id of the device the
  file is located on (see stat() documentation).
  
  This attribute is only available for UNIX file systems.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_UNIX_DEVICE = "unix::device";

/**
    A key in the "unix" namespace for getting the group ID for the file.
  
  This attribute is only available for UNIX file systems.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_UNIX_GID = "unix::gid";

/**
    A key in the "unix" namespace for getting the inode of the file.
  
  This attribute is only available for UNIX file systems.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint64].
*/
enum FILE_ATTRIBUTE_UNIX_INODE = "unix::inode";

/**
    A key in the "unix" namespace for checking if the file represents a
  UNIX mount point.
  
  This attribute is true if the file is a UNIX mount point.
  
  Since 2.58, `/` is considered to be a mount point.
  
  This attribute is only available for UNIX file systems.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Boolean].
*/
enum FILE_ATTRIBUTE_UNIX_IS_MOUNTPOINT = "unix::is-mountpoint";

/**
    A key in the "unix" namespace for getting the mode of the file
  (e.g. whether the file is a regular file, symlink, etc).
  
  See the documentation for `lstat()`: this attribute is equivalent to
  the `st_mode` member of `struct stat`, and includes both the file type
  and permissions.
  
  This attribute is only available for UNIX file systems.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_UNIX_MODE = "unix::mode";

/**
    A key in the "unix" namespace for getting the number of hard links
  for a file.
  
  See the documentation for `lstat()`.
  
  This attribute is only available for UNIX file systems.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_UNIX_NLINK = "unix::nlink";

/**
    A key in the "unix" namespace for getting the device ID for the file
  (if it is a special file).
  
  See the documentation for `lstat()`.
  
  This attribute is only available for UNIX file systems.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_UNIX_RDEV = "unix::rdev";

/**
    A key in the "unix" namespace for getting the user ID for the file.
  
  This attribute is only available for UNIX file systems.
  
  Corresponding #GFileAttributeType is [gio.types.FileAttributeType.Uint32].
*/
enum FILE_ATTRIBUTE_UNIX_UID = "unix::uid";

/**
    Extension point for memory usage monitoring functionality.
  See [Extending GIO][extending-gio].
*/
enum MEMORY_MONITOR_EXTENSION_POINT_NAME = "gio-memory-monitor";

/**
    The menu item attribute which holds the action name of the item.  Action
  names are namespaced with an identifier for the action group in which the
  action resides. For example, "win." for window-specific actions and "app."
  for application-wide actions.
  
  See also [gio.menu_model.MenuModel.getItemAttribute] and [gio.menu_item.MenuItem.setAttribute].
*/
enum MENU_ATTRIBUTE_ACTION = "action";

/**
    The menu item attribute that holds the namespace for all action names in
  menus that are linked from this item.
*/
enum MENU_ATTRIBUTE_ACTION_NAMESPACE = "action-namespace";

/**
    The menu item attribute which holds the icon of the item.
  
  The icon is stored in the format returned by [gio.icon.Icon.serialize].
  
  This attribute is intended only to represent 'noun' icons such as
  favicons for a webpage, or application icons.  It should not be used
  for 'verbs' (ie: stock icons).
*/
enum MENU_ATTRIBUTE_ICON = "icon";

/**
    The menu item attribute which holds the label of the item.
*/
enum MENU_ATTRIBUTE_LABEL = "label";

/**
    The menu item attribute which holds the target with which the item's action
  will be activated.
  
  See also [gio.menu_item.MenuItem.setActionAndTarget]
*/
enum MENU_ATTRIBUTE_TARGET = "target";

/**
    The maximum number of entries in a menu section supported by
  [gio.dbus_connection.DBusConnection.exportMenuModel].
  
  The exact value of the limit may change in future GLib versions.
*/
enum MENU_EXPORTER_MAX_SECTION_SIZE = 1000;

/**
    The name of the link that associates a menu item with a section.  The linked
  menu will usually be shown in place of the menu item, using the item's label
  as a header.
  
  See also [gio.menu_item.MenuItem.setLink].
*/
enum MENU_LINK_SECTION = "section";

/**
    The name of the link that associates a menu item with a submenu.
  
  See also [gio.menu_item.MenuItem.setLink].
*/
enum MENU_LINK_SUBMENU = "submenu";

/** */
enum NATIVE_VOLUME_MONITOR_EXTENSION_POINT_NAME = "gio-native-volume-monitor";

/**
    Extension point for network status monitoring functionality.
  See [Extending GIO][extending-gio].
*/
enum NETWORK_MONITOR_EXTENSION_POINT_NAME = "gio-network-monitor";

/**
    Extension point for power profile usage monitoring functionality.
  See [Extending GIO][extending-gio].
*/
enum POWER_PROFILE_MONITOR_EXTENSION_POINT_NAME = "gio-power-profile-monitor";

/**
    Extension point for proxy functionality.
  See [Extending GIO][extending-gio].
*/
enum PROXY_EXTENSION_POINT_NAME = "gio-proxy";

/**
    Extension point for proxy resolving functionality.
  See [Extending GIO][extending-gio].
*/
enum PROXY_RESOLVER_EXTENSION_POINT_NAME = "gio-proxy-resolver";

/**
    Extension point for #GSettingsBackend functionality.
*/
enum SETTINGS_BACKEND_EXTENSION_POINT_NAME = "gsettings-backend";

/**
    Extension point for TLS functionality via #GTlsBackend.
  See [Extending GIO][extending-gio].
*/
enum TLS_BACKEND_EXTENSION_POINT_NAME = "gio-tls-backend";

/**
    The purpose used to verify the client certificate in a TLS connection.
  Used by TLS servers.
*/
enum TLS_DATABASE_PURPOSE_AUTHENTICATE_CLIENT = "1.3.6.1.5.5.7.3.2";

/**
    The purpose used to verify the server certificate in a TLS connection. This
  is the most common purpose in use. Used by TLS clients.
*/
enum TLS_DATABASE_PURPOSE_AUTHENTICATE_SERVER = "1.3.6.1.5.5.7.3.1";

/**
    Extension point for #GVfs functionality.
  See [Extending GIO][extending-gio].
*/
enum VFS_EXTENSION_POINT_NAME = "gio-vfs";

/**
    The string used to obtain the volume class with [gio.volume.Volume.getIdentifier].
  
  Known volume classes include `device`, `network`, and `loop`. Other
  classes may be added in the future.
  
  This is intended to be used by applications to classify #GVolume
  instances into different sections - for example a file manager or
  file chooser can use this information to show `network` volumes under
  a "Network" heading and `device` volumes under a "Devices" heading.
*/
enum VOLUME_IDENTIFIER_KIND_CLASS = "class";

/**
    The string used to obtain a Hal UDI with [gio.volume.Volume.getIdentifier].

  Deprecated:     Do not use, HAL is deprecated.
*/
enum VOLUME_IDENTIFIER_KIND_HAL_UDI = "hal-udi";

/**
    The string used to obtain a filesystem label with [gio.volume.Volume.getIdentifier].
*/
enum VOLUME_IDENTIFIER_KIND_LABEL = "label";

/**
    The string used to obtain a NFS mount with [gio.volume.Volume.getIdentifier].
*/
enum VOLUME_IDENTIFIER_KIND_NFS_MOUNT = "nfs-mount";

/**
    The string used to obtain a Unix device path with [gio.volume.Volume.getIdentifier].
*/
enum VOLUME_IDENTIFIER_KIND_UNIX_DEVICE = "unix-device";

/**
    The string used to obtain a UUID with [gio.volume.Volume.getIdentifier].
*/
enum VOLUME_IDENTIFIER_KIND_UUID = "uuid";

/**
    Extension point for volume monitor functionality.
  See [Extending GIO][extending-gio].
*/
enum VOLUME_MONITOR_EXTENSION_POINT_NAME = "gio-volume-monitor";
