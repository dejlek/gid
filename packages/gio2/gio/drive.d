module gio.drive;

public import gio.drive_iface_proxy;
import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.icon;
import gio.mount_operation;
import gio.types;
import gio.volume;
import glib.error;
import gobject.dclosure;
import gobject.object;

/**
 * `GDrive` represents a piece of hardware connected to the machine.
 * It’s generally only created for removable hardware or hardware with
 * removable media.
 * `GDrive` is a container class for [gio.volume.Volume] objects that stem from
 * the same piece of media. As such, `GDrive` abstracts a drive with
 * $(LPAREN)or without$(RPAREN) removable media and provides operations for querying
 * whether media is available, determining whether media change is
 * automatically detected and ejecting the media.
 * If the `GDrive` reports that media isn’t automatically detected, one
 * can poll for media; typically one should not do this periodically
 * as a poll for media operation is potentially expensive and may
 * spin up the drive creating noise.
 * `GDrive` supports starting and stopping drives with authentication
 * support for the former. This can be used to support a diverse set
 * of use cases including connecting/disconnecting iSCSI devices,
 * powering down external disk enclosures and starting/stopping
 * multi-disk devices such as RAID devices. Note that the actual
 * semantics and side-effects of starting/stopping a `GDrive` may vary
 * according to implementation. To choose the correct verbs in e.g. a
 * file manager, use [gio.drive.Drive.getStartStopType].
 * For [porting from GnomeVFS](migrating-gnome-vfs.html) note that there is no
 * equivalent of `GDrive` in that API.
 */
interface Drive
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_drive_get_type != &gidSymbolNotFound ? g_drive_get_type() : cast(GType)0;
  }

  /**
   * Checks if a drive can be ejected.
   * Returns: %TRUE if the drive can be ejected, %FALSE otherwise.
   */
  bool canEject();

  /**
   * Checks if a drive can be polled for media changes.
   * Returns: %TRUE if the drive can be polled for media changes,
   *   %FALSE otherwise.
   */
  bool canPollForMedia();

  /**
   * Checks if a drive can be started.
   * Returns: %TRUE if the drive can be started, %FALSE otherwise.
   */
  bool canStart();

  /**
   * Checks if a drive can be started degraded.
   * Returns: %TRUE if the drive can be started degraded, %FALSE otherwise.
   */
  bool canStartDegraded();

  /**
   * Checks if a drive can be stopped.
   * Returns: %TRUE if the drive can be stopped, %FALSE otherwise.
   */
  bool canStop();

  /**
   * Asynchronously ejects a drive.
   * When the operation is finished, callback will be called.
   * You can then call [gio.drive.Drive.ejectFinish] to obtain the
   * result of the operation.
   * Params:
   *   flags = flags affecting the unmount if required for eject
   *   cancellable = optional #GCancellable object, %NULL to ignore.
   *   callback = a #GAsyncReadyCallback, or %NULL.

   * Deprecated: Use [gio.drive.Drive.ejectWithOperation] instead.
   */
  void eject(gio.types.MountUnmountFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
   * Finishes ejecting a drive.
   * Params:
   *   result = a #GAsyncResult.
   * Returns: %TRUE if the drive has been ejected successfully,
   *   %FALSE otherwise.

   * Deprecated: Use [gio.drive.Drive.ejectWithOperationFinish] instead.
   */
  bool ejectFinish(gio.async_result.AsyncResult result);

  /**
   * Ejects a drive. This is an asynchronous operation, and is
   * finished by calling [gio.drive.Drive.ejectWithOperationFinish] with the drive
   * and #GAsyncResult data returned in the callback.
   * Params:
   *   flags = flags affecting the unmount if required for eject
   *   mountOperation = a #GMountOperation or %NULL to avoid
   *     user interaction.
   *   cancellable = optional #GCancellable object, %NULL to ignore.
   *   callback = a #GAsyncReadyCallback, or %NULL.
   */
  void ejectWithOperation(gio.types.MountUnmountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
   * Finishes ejecting a drive. If any errors occurred during the operation,
   * error will be set to contain the errors and %FALSE will be returned.
   * Params:
   *   result = a #GAsyncResult.
   * Returns: %TRUE if the drive was successfully ejected. %FALSE otherwise.
   */
  bool ejectWithOperationFinish(gio.async_result.AsyncResult result);

  /**
   * Gets the kinds of identifiers that drive has.
   * Use [gio.drive.Drive.getIdentifier] to obtain the identifiers
   * themselves.
   * Returns: a %NULL-terminated
   *   array of strings containing kinds of identifiers. Use [glib.global.strfreev]
   *   to free.
   */
  string[] enumerateIdentifiers();

  /**
   * Gets the icon for drive.
   * Returns: #GIcon for the drive.
   *   Free the returned object with [gobject.object.ObjectG.unref].
   */
  gio.icon.Icon getIcon();

  /**
   * Gets the identifier of the given kind for drive. The only
   * identifier currently available is
   * %G_DRIVE_IDENTIFIER_KIND_UNIX_DEVICE.
   * Params:
   *   kind = the kind of identifier to return
   * Returns: a newly allocated string containing the
   *   requested identifier, or %NULL if the #GDrive
   *   doesn't have this kind of identifier.
   */
  string getIdentifier(string kind);

  /**
   * Gets the name of drive.
   * Returns: a string containing drive's name. The returned
   *   string should be freed when no longer needed.
   */
  string getName();

  /**
   * Gets the sort key for drive, if any.
   * Returns: Sorting key for drive or %NULL if no such key is available.
   */
  string getSortKey();

  /**
   * Gets a hint about how a drive can be started/stopped.
   * Returns: A value from the #GDriveStartStopType enumeration.
   */
  gio.types.DriveStartStopType getStartStopType();

  /**
   * Gets the icon for drive.
   * Returns: symbolic #GIcon for the drive.
   *   Free the returned object with [gobject.object.ObjectG.unref].
   */
  gio.icon.Icon getSymbolicIcon();

  /**
   * Get a list of mountable volumes for drive.
   * The returned list should be freed with [glib.list.List.free], after
   * its elements have been unreffed with [gobject.object.ObjectG.unref].
   * Returns: #GList containing any #GVolume objects on the given drive.
   */
  gio.volume.Volume[] getVolumes();

  /**
   * Checks if the drive has media. Note that the OS may not be polling
   * the drive for media changes; see [gio.drive.Drive.isMediaCheckAutomatic]
   * for more details.
   * Returns: %TRUE if drive has media, %FALSE otherwise.
   */
  bool hasMedia();

  /**
   * Check if drive has any mountable volumes.
   * Returns: %TRUE if the drive contains volumes, %FALSE otherwise.
   */
  bool hasVolumes();

  /**
   * Checks if drive is capable of automatically detecting media changes.
   * Returns: %TRUE if the drive is capable of automatically detecting
   *   media changes, %FALSE otherwise.
   */
  bool isMediaCheckAutomatic();

  /**
   * Checks if the drive supports removable media.
   * Returns: %TRUE if drive supports removable media, %FALSE otherwise.
   */
  bool isMediaRemovable();

  /**
   * Checks if the #GDrive and/or its media is considered removable by the user.
   * See [gio.drive.Drive.isMediaRemovable].
   * Returns: %TRUE if drive and/or its media is considered removable, %FALSE otherwise.
   */
  bool isRemovable();

  /**
   * Asynchronously polls drive to see if media has been inserted or removed.
   * When the operation is finished, callback will be called.
   * You can then call [gio.drive.Drive.pollForMediaFinish] to obtain the
   * result of the operation.
   * Params:
   *   cancellable = optional #GCancellable object, %NULL to ignore.
   *   callback = a #GAsyncReadyCallback, or %NULL.
   */
  void pollForMedia(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
   * Finishes an operation started with [gio.drive.Drive.pollForMedia] on a drive.
   * Params:
   *   result = a #GAsyncResult.
   * Returns: %TRUE if the drive has been poll_for_mediaed successfully,
   *   %FALSE otherwise.
   */
  bool pollForMediaFinish(gio.async_result.AsyncResult result);

  /**
   * Asynchronously starts a drive.
   * When the operation is finished, callback will be called.
   * You can then call [gio.drive.Drive.startFinish] to obtain the
   * result of the operation.
   * Params:
   *   flags = flags affecting the start operation.
   *   mountOperation = a #GMountOperation or %NULL to avoid
   *     user interaction.
   *   cancellable = optional #GCancellable object, %NULL to ignore.
   *   callback = a #GAsyncReadyCallback, or %NULL.
   */
  void start(gio.types.DriveStartFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
   * Finishes starting a drive.
   * Params:
   *   result = a #GAsyncResult.
   * Returns: %TRUE if the drive has been started successfully,
   *   %FALSE otherwise.
   */
  bool startFinish(gio.async_result.AsyncResult result);

  /**
   * Asynchronously stops a drive.
   * When the operation is finished, callback will be called.
   * You can then call [gio.drive.Drive.stopFinish] to obtain the
   * result of the operation.
   * Params:
   *   flags = flags affecting the unmount if required for stopping.
   *   mountOperation = a #GMountOperation or %NULL to avoid
   *     user interaction.
   *   cancellable = optional #GCancellable object, %NULL to ignore.
   *   callback = a #GAsyncReadyCallback, or %NULL.
   */
  void stop(gio.types.MountUnmountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
   * Finishes stopping a drive.
   * Params:
   *   result = a #GAsyncResult.
   * Returns: %TRUE if the drive has been stopped successfully,
   *   %FALSE otherwise.
   */
  bool stopFinish(gio.async_result.AsyncResult result);

  /**
   * Emitted when the drive's state has changed.
   *   drive = the instance the signal is connected to
   */
  alias ChangedCallbackDlg = void delegate(gio.drive.Drive drive);
  alias ChangedCallbackFunc = void function(gio.drive.Drive drive);

  /**
   * Connect to Changed signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangedCallbackDlg) || is(T : ChangedCallbackFunc));

  /**
   * This signal is emitted when the #GDrive have been
   * disconnected. If the recipient is holding references to the
   * object they should release them so the object can be
   * finalized.
   *   drive = the instance the signal is connected to
   */
  alias DisconnectedCallbackDlg = void delegate(gio.drive.Drive drive);
  alias DisconnectedCallbackFunc = void function(gio.drive.Drive drive);

  /**
   * Connect to Disconnected signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDisconnected(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DisconnectedCallbackDlg) || is(T : DisconnectedCallbackFunc));

  /**
   * Emitted when the physical eject button $(LPAREN)if any$(RPAREN) of a drive has
   * been pressed.
   *   drive = the instance the signal is connected to
   */
  alias EjectButtonCallbackDlg = void delegate(gio.drive.Drive drive);
  alias EjectButtonCallbackFunc = void function(gio.drive.Drive drive);

  /**
   * Connect to EjectButton signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectEjectButton(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EjectButtonCallbackDlg) || is(T : EjectButtonCallbackFunc));

  /**
   * Emitted when the physical stop button $(LPAREN)if any$(RPAREN) of a drive has
   * been pressed.
   *   drive = the instance the signal is connected to
   */
  alias StopButtonCallbackDlg = void delegate(gio.drive.Drive drive);
  alias StopButtonCallbackFunc = void function(gio.drive.Drive drive);

  /**
   * Connect to StopButton signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectStopButton(T)(T callback, Flag!"After" after = No.After)
  if (is(T : StopButtonCallbackDlg) || is(T : StopButtonCallbackFunc));
  }
