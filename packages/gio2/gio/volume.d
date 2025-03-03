module gio.volume;

public import gio.volume_iface_proxy;
import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.drive;
import gio.file;
import gio.icon;
import gio.mount;
import gio.mount_operation;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;

/**
 * The `GVolume` interface represents user-visible objects that can be
 * mounted. Note, when [porting from GnomeVFS](migrating-gnome-vfs.html),
 * `GVolume` is the moral equivalent of `GnomeVFSDrive`.
 * Mounting a `GVolume` instance is an asynchronous operation. For more
 * information about asynchronous operations, see [gio.async_result.AsyncResult] and
 * [gio.task.Task]. To mount a `GVolume`, first call [gio.volume.Volume.mount]
 * with $(LPAREN)at least$(RPAREN) the `GVolume` instance, optionally a
 * [gio.mount_operation.MountOperation] object and a [gio.types.AsyncReadyCallback].
 * Typically, one will only want to pass `NULL` for the
 * [gio.mount_operation.MountOperation] if automounting all volumes when a desktop session
 * starts since it’s not desirable to put up a lot of dialogs asking
 * for credentials.
 * The callback will be fired when the operation has resolved $(LPAREN)either
 * with success or failure$(RPAREN), and a [gio.async_result.AsyncResult] instance will be
 * passed to the callback.  That callback should then call
 * [gio.volume.Volume.mountFinish] with the `GVolume` instance and the
 * [gio.async_result.AsyncResult] data to see if the operation was completed
 * successfully.  If a [glib.error.ErrorG] is present when
 * [gio.volume.Volume.mountFinish] is called, then it will be filled with any
 * error information.
 * ## Volume Identifiers
 * It is sometimes necessary to directly access the underlying
 * operating system object behind a volume $(LPAREN)e.g. for passing a volume
 * to an application via the command line$(RPAREN). For this purpose, GIO
 * allows to obtain an ‘identifier’ for the volume. There can be
 * different kinds of identifiers, such as Hal UDIs, filesystem labels,
 * traditional Unix devices $(LPAREN)e.g. `/dev/sda2`$(RPAREN), UUIDs. GIO uses predefined
 * strings as names for the different kinds of identifiers:
 * `G_VOLUME_IDENTIFIER_KIND_UUID`, `G_VOLUME_IDENTIFIER_KIND_LABEL`, etc.
 * Use [gio.volume.Volume.getIdentifier] to obtain an identifier for a volume.
 * Note that `G_VOLUME_IDENTIFIER_KIND_HAL_UDI` will only be available
 * when the GVFS hal volume monitor is in use. Other volume monitors
 * will generally be able to provide the `G_VOLUME_IDENTIFIER_KIND_UNIX_DEVICE`
 * identifier, which can be used to obtain a hal device by means of
 * `libhal_manager_find_device_string_match$(LPAREN)$(RPAREN)`.
 */
interface Volume
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_volume_get_type != &gidSymbolNotFound ? g_volume_get_type() : cast(GType)0;
  }

  /**
   * Checks if a volume can be ejected.
   * Returns: %TRUE if the volume can be ejected. %FALSE otherwise
   */
  bool canEject();

  /**
   * Checks if a volume can be mounted.
   * Returns: %TRUE if the volume can be mounted. %FALSE otherwise
   */
  bool canMount();

  /**
   * Ejects a volume. This is an asynchronous operation, and is
   * finished by calling [gio.volume.Volume.ejectFinish] with the volume
   * and #GAsyncResult returned in the callback.
   * Params:
   *   flags = flags affecting the unmount if required for eject
   *   cancellable = optional #GCancellable object, %NULL to ignore
   *   callback = a #GAsyncReadyCallback, or %NULL

   * Deprecated: Use [gio.volume.Volume.ejectWithOperation] instead.
   */
  void eject(gio.types.MountUnmountFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
   * Finishes ejecting a volume. If any errors occurred during the operation,
   * error will be set to contain the errors and %FALSE will be returned.
   * Params:
   *   result = a #GAsyncResult
   * Returns: %TRUE, %FALSE if operation failed

   * Deprecated: Use [gio.volume.Volume.ejectWithOperationFinish] instead.
   */
  bool ejectFinish(gio.async_result.AsyncResult result);

  /**
   * Ejects a volume. This is an asynchronous operation, and is
   * finished by calling [gio.volume.Volume.ejectWithOperationFinish] with the volume
   * and #GAsyncResult data returned in the callback.
   * Params:
   *   flags = flags affecting the unmount if required for eject
   *   mountOperation = a #GMountOperation or %NULL to
   *     avoid user interaction
   *   cancellable = optional #GCancellable object, %NULL to ignore
   *   callback = a #GAsyncReadyCallback, or %NULL
   */
  void ejectWithOperation(gio.types.MountUnmountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
   * Finishes ejecting a volume. If any errors occurred during the operation,
   * error will be set to contain the errors and %FALSE will be returned.
   * Params:
   *   result = a #GAsyncResult
   * Returns: %TRUE if the volume was successfully ejected. %FALSE otherwise
   */
  bool ejectWithOperationFinish(gio.async_result.AsyncResult result);

  /**
   * Gets the kinds of [identifiers](#volume-identifiers) that volume has.
   * Use [gio.volume.Volume.getIdentifier] to obtain the identifiers themselves.
   * Returns: a %NULL-terminated array
   *   of strings containing kinds of identifiers. Use [glib.global.strfreev] to free.
   */
  string[] enumerateIdentifiers();

  /**
   * Gets the activation root for a #GVolume if it is known ahead of
   * mount time. Returns %NULL otherwise. If not %NULL and if volume
   * is mounted, then the result of [gio.mount.Mount.getRoot] on the
   * #GMount object obtained from [gio.volume.Volume.getMount] will always
   * either be equal or a prefix of what this function returns. In
   * other words, in code
   * |[<!-- language\="C" -->
   * GMount *mount;
   * GFile *mount_root
   * GFile *volume_activation_root;
   * mount \= g_volume_get_mount $(LPAREN)volume$(RPAREN); // mounted, so never NULL
   * mount_root \= g_mount_get_root $(LPAREN)mount$(RPAREN);
   * volume_activation_root \= g_volume_get_activation_root $(LPAREN)volume$(RPAREN); // assume not NULL
   * ]|
   * then the expression
   * |[<!-- language\="C" -->
   * $(LPAREN)g_file_has_prefix $(LPAREN)volume_activation_root, mount_root$(RPAREN) ||
   * g_file_equal $(LPAREN)volume_activation_root, mount_root$(RPAREN)$(RPAREN)
   * ]|
   * will always be %TRUE.
   * Activation roots are typically used in #GVolumeMonitor
   * implementations to find the underlying mount to shadow, see
   * [gio.mount.Mount.isShadowed] for more details.
   * Returns: the activation root of volume
   *   or %NULL. Use [gobject.object.ObjectG.unref] to free.
   */
  gio.file.File getActivationRoot();

  /**
   * Gets the drive for the volume.
   * Returns: a #GDrive or %NULL if volume is not
   *   associated with a drive. The returned object should be unreffed
   *   with [gobject.object.ObjectG.unref] when no longer needed.
   */
  gio.drive.Drive getDrive();

  /**
   * Gets the icon for volume.
   * Returns: a #GIcon.
   *   The returned object should be unreffed with [gobject.object.ObjectG.unref]
   *   when no longer needed.
   */
  gio.icon.Icon getIcon();

  /**
   * Gets the identifier of the given kind for volume.
   * See the [introduction](#volume-identifiers) for more
   * information about volume identifiers.
   * Params:
   *   kind = the kind of identifier to return
   * Returns: a newly allocated string containing the
   *   requested identifier, or %NULL if the #GVolume
   *   doesn't have this kind of identifier
   */
  string getIdentifier(string kind);

  /**
   * Gets the mount for the volume.
   * Returns: a #GMount or %NULL if volume isn't mounted.
   *   The returned object should be unreffed with [gobject.object.ObjectG.unref]
   *   when no longer needed.
   */
  gio.mount.Mount getMount();

  /**
   * Gets the name of volume.
   * Returns: the name for the given volume. The returned string should
   *   be freed with [glib.global.gfree] when no longer needed.
   */
  string getName();

  /**
   * Gets the sort key for volume, if any.
   * Returns: Sorting key for volume or %NULL if no such key is available
   */
  string getSortKey();

  /**
   * Gets the symbolic icon for volume.
   * Returns: a #GIcon.
   *   The returned object should be unreffed with [gobject.object.ObjectG.unref]
   *   when no longer needed.
   */
  gio.icon.Icon getSymbolicIcon();

  /**
   * Gets the UUID for the volume. The reference is typically based on
   * the file system UUID for the volume in question and should be
   * considered an opaque string. Returns %NULL if there is no UUID
   * available.
   * Returns: the UUID for volume or %NULL if no UUID
   *   can be computed.
   *   The returned string should be freed with [glib.global.gfree]
   *   when no longer needed.
   */
  string getUuid();

  /**
   * Mounts a volume. This is an asynchronous operation, and is
   * finished by calling [gio.volume.Volume.mountFinish] with the volume
   * and #GAsyncResult returned in the callback.
   * Params:
   *   flags = flags affecting the operation
   *   mountOperation = a #GMountOperation or %NULL to avoid user interaction
   *   cancellable = optional #GCancellable object, %NULL to ignore
   *   callback = a #GAsyncReadyCallback, or %NULL
   */
  void mount(gio.types.MountMountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
   * Finishes mounting a volume. If any errors occurred during the operation,
   * error will be set to contain the errors and %FALSE will be returned.
   * If the mount operation succeeded, [gio.volume.Volume.getMount] on volume
   * is guaranteed to return the mount right after calling this
   * function; there's no need to listen for the 'mount-added' signal on
   * #GVolumeMonitor.
   * Params:
   *   result = a #GAsyncResult
   * Returns: %TRUE, %FALSE if operation failed
   */
  bool mountFinish(gio.async_result.AsyncResult result);

  /**
   * Returns whether the volume should be automatically mounted.
   * Returns: %TRUE if the volume should be automatically mounted
   */
  bool shouldAutomount();

  /**
   * Emitted when the volume has been changed.
   *   volume = the instance the signal is connected to
   */
  alias ChangedCallbackDlg = void delegate(gio.volume.Volume volume);
  alias ChangedCallbackFunc = void function(gio.volume.Volume volume);

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
   * This signal is emitted when the #GVolume have been removed. If
   * the recipient is holding references to the object they should
   * release them so the object can be finalized.
   *   volume = the instance the signal is connected to
   */
  alias RemovedCallbackDlg = void delegate(gio.volume.Volume volume);
  alias RemovedCallbackFunc = void function(gio.volume.Volume volume);

  /**
   * Connect to Removed signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectRemoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RemovedCallbackDlg) || is(T : RemovedCallbackFunc));
  }
