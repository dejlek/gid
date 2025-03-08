module gio.drive_mixin;

public import gio.drive_iface_proxy;
public import gid.gid;
public import gio.async_result;
public import gio.c.functions;
public import gio.c.types;
public import gio.cancellable;
public import gio.icon;
public import gio.mount_operation;
public import gio.types;
public import gio.volume;
public import glib.error;
public import gobject.dclosure;
public import gobject.object;

/**
    [gio.drive.Drive] represents a piece of hardware connected to the machine.
  It’s generally only created for removable hardware or hardware with
  removable media.
  
  [gio.drive.Drive] is a container class for [gio.volume.Volume] objects that stem from
  the same piece of media. As such, [gio.drive.Drive] abstracts a drive with
  (or without) removable media and provides operations for querying
  whether media is available, determining whether media change is
  automatically detected and ejecting the media.
  
  If the [gio.drive.Drive] reports that media isn’t automatically detected, one
  can poll for media; typically one should not do this periodically
  as a poll for media operation is potentially expensive and may
  spin up the drive creating noise.
  
  [gio.drive.Drive] supports starting and stopping drives with authentication
  support for the former. This can be used to support a diverse set
  of use cases including connecting/disconnecting iSCSI devices,
  powering down external disk enclosures and starting/stopping
  multi-disk devices such as RAID devices. Note that the actual
  semantics and side-effects of starting/stopping a [gio.drive.Drive] may vary
  according to implementation. To choose the correct verbs in e.g. a
  file manager, use [gio.drive.Drive.getStartStopType].
  
  For [porting from GnomeVFS](migrating-gnome-vfs.html) note that there is no
  equivalent of [gio.drive.Drive] in that API.
*/
template DriveT()
{

  /**
      Checks if a drive can be ejected.
    Returns:     true if the drive can be ejected, false otherwise.
  */
  override bool canEject()
  {
    bool _retval;
    _retval = g_drive_can_eject(cast(GDrive*)cPtr);
    return _retval;
  }

  /**
      Checks if a drive can be polled for media changes.
    Returns:     true if the drive can be polled for media changes,
          false otherwise.
  */
  override bool canPollForMedia()
  {
    bool _retval;
    _retval = g_drive_can_poll_for_media(cast(GDrive*)cPtr);
    return _retval;
  }

  /**
      Checks if a drive can be started.
    Returns:     true if the drive can be started, false otherwise.
  */
  override bool canStart()
  {
    bool _retval;
    _retval = g_drive_can_start(cast(GDrive*)cPtr);
    return _retval;
  }

  /**
      Checks if a drive can be started degraded.
    Returns:     true if the drive can be started degraded, false otherwise.
  */
  override bool canStartDegraded()
  {
    bool _retval;
    _retval = g_drive_can_start_degraded(cast(GDrive*)cPtr);
    return _retval;
  }

  /**
      Checks if a drive can be stopped.
    Returns:     true if the drive can be stopped, false otherwise.
  */
  override bool canStop()
  {
    bool _retval;
    _retval = g_drive_can_stop(cast(GDrive*)cPtr);
    return _retval;
  }

  /**
      Asynchronously ejects a drive.
    
    When the operation is finished, callback will be called.
    You can then call [gio.drive.Drive.ejectFinish] to obtain the
    result of the operation.
    Params:
      flags =       flags affecting the unmount if required for eject
      cancellable =       optional #GCancellable object, null to ignore.
      callback =       a #GAsyncReadyCallback, or null.
  
    Deprecated:     Use [gio.drive.Drive.ejectWithOperation] instead.
  */
  override void eject(gio.types.MountUnmountFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_drive_eject(cast(GDrive*)cPtr, flags, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes ejecting a drive.
    Params:
      result =       a #GAsyncResult.
    Returns:     true if the drive has been ejected successfully,
          false otherwise.
  
    Deprecated:     Use [gio.drive.Drive.ejectWithOperationFinish] instead.
  */
  override bool ejectFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = g_drive_eject_finish(cast(GDrive*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Ejects a drive. This is an asynchronous operation, and is
    finished by calling [gio.drive.Drive.ejectWithOperationFinish] with the drive
    and #GAsyncResult data returned in the callback.
    Params:
      flags =       flags affecting the unmount if required for eject
      mountOperation =       a #GMountOperation or null to avoid
            user interaction.
      cancellable =       optional #GCancellable object, null to ignore.
      callback =       a #GAsyncReadyCallback, or null.
  */
  override void ejectWithOperation(gio.types.MountUnmountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_drive_eject_with_operation(cast(GDrive*)cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes ejecting a drive. If any errors occurred during the operation,
    error will be set to contain the errors and false will be returned.
    Params:
      result =       a #GAsyncResult.
    Returns:     true if the drive was successfully ejected. false otherwise.
  */
  override bool ejectWithOperationFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = g_drive_eject_with_operation_finish(cast(GDrive*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Gets the kinds of identifiers that drive has.
    Use [gio.drive.Drive.getIdentifier] to obtain the identifiers
    themselves.
    Returns:     a null-terminated
          array of strings containing kinds of identifiers. Use [glib.global.strfreev]
          to free.
  */
  override string[] enumerateIdentifiers()
  {
    char** _cretval;
    _cretval = g_drive_enumerate_identifiers(cast(GDrive*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /**
      Gets the icon for drive.
    Returns:     #GIcon for the drive.
         Free the returned object with [gobject.object.ObjectG.unref].
  */
  override gio.icon.Icon getIcon()
  {
    GIcon* _cretval;
    _cretval = g_drive_get_icon(cast(GDrive*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the identifier of the given kind for drive. The only
    identifier currently available is
    `G_DRIVE_IDENTIFIER_KIND_UNIX_DEVICE`.
    Params:
      kind =       the kind of identifier to return
    Returns:     a newly allocated string containing the
          requested identifier, or null if the #GDrive
          doesn't have this kind of identifier.
  */
  override string getIdentifier(string kind)
  {
    char* _cretval;
    const(char)* _kind = kind.toCString(No.Alloc);
    _cretval = g_drive_get_identifier(cast(GDrive*)cPtr, _kind);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the name of drive.
    Returns:     a string containing drive's name. The returned
          string should be freed when no longer needed.
  */
  override string getName()
  {
    char* _cretval;
    _cretval = g_drive_get_name(cast(GDrive*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the sort key for drive, if any.
    Returns:     Sorting key for drive or null if no such key is available.
  */
  override string getSortKey()
  {
    const(char)* _cretval;
    _cretval = g_drive_get_sort_key(cast(GDrive*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets a hint about how a drive can be started/stopped.
    Returns:     A value from the #GDriveStartStopType enumeration.
  */
  override gio.types.DriveStartStopType getStartStopType()
  {
    GDriveStartStopType _cretval;
    _cretval = g_drive_get_start_stop_type(cast(GDrive*)cPtr);
    gio.types.DriveStartStopType _retval = cast(gio.types.DriveStartStopType)_cretval;
    return _retval;
  }

  /**
      Gets the icon for drive.
    Returns:     symbolic #GIcon for the drive.
         Free the returned object with [gobject.object.ObjectG.unref].
  */
  override gio.icon.Icon getSymbolicIcon()
  {
    GIcon* _cretval;
    _cretval = g_drive_get_symbolic_icon(cast(GDrive*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get a list of mountable volumes for drive.
    
    The returned list should be freed with [glib.list.List.free], after
    its elements have been unreffed with [gobject.object.ObjectG.unref].
    Returns:     #GList containing any #GVolume objects on the given drive.
  */
  override gio.volume.Volume[] getVolumes()
  {
    GList* _cretval;
    _cretval = g_drive_get_volumes(cast(GDrive*)cPtr);
    auto _retval = gListToD!(gio.volume.Volume, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Checks if the drive has media. Note that the OS may not be polling
    the drive for media changes; see [gio.drive.Drive.isMediaCheckAutomatic]
    for more details.
    Returns:     true if drive has media, false otherwise.
  */
  override bool hasMedia()
  {
    bool _retval;
    _retval = g_drive_has_media(cast(GDrive*)cPtr);
    return _retval;
  }

  /**
      Check if drive has any mountable volumes.
    Returns:     true if the drive contains volumes, false otherwise.
  */
  override bool hasVolumes()
  {
    bool _retval;
    _retval = g_drive_has_volumes(cast(GDrive*)cPtr);
    return _retval;
  }

  /**
      Checks if drive is capable of automatically detecting media changes.
    Returns:     true if the drive is capable of automatically detecting
          media changes, false otherwise.
  */
  override bool isMediaCheckAutomatic()
  {
    bool _retval;
    _retval = g_drive_is_media_check_automatic(cast(GDrive*)cPtr);
    return _retval;
  }

  /**
      Checks if the drive supports removable media.
    Returns:     true if drive supports removable media, false otherwise.
  */
  override bool isMediaRemovable()
  {
    bool _retval;
    _retval = g_drive_is_media_removable(cast(GDrive*)cPtr);
    return _retval;
  }

  /**
      Checks if the #GDrive and/or its media is considered removable by the user.
    See [gio.drive.Drive.isMediaRemovable].
    Returns:     true if drive and/or its media is considered removable, false otherwise.
  */
  override bool isRemovable()
  {
    bool _retval;
    _retval = g_drive_is_removable(cast(GDrive*)cPtr);
    return _retval;
  }

  /**
      Asynchronously polls drive to see if media has been inserted or removed.
    
    When the operation is finished, callback will be called.
    You can then call [gio.drive.Drive.pollForMediaFinish] to obtain the
    result of the operation.
    Params:
      cancellable =       optional #GCancellable object, null to ignore.
      callback =       a #GAsyncReadyCallback, or null.
  */
  override void pollForMedia(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_drive_poll_for_media(cast(GDrive*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an operation started with [gio.drive.Drive.pollForMedia] on a drive.
    Params:
      result =       a #GAsyncResult.
    Returns:     true if the drive has been poll_for_mediaed successfully,
          false otherwise.
  */
  override bool pollForMediaFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = g_drive_poll_for_media_finish(cast(GDrive*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Asynchronously starts a drive.
    
    When the operation is finished, callback will be called.
    You can then call [gio.drive.Drive.startFinish] to obtain the
    result of the operation.
    Params:
      flags =       flags affecting the start operation.
      mountOperation =       a #GMountOperation or null to avoid
            user interaction.
      cancellable =       optional #GCancellable object, null to ignore.
      callback =       a #GAsyncReadyCallback, or null.
  */
  override void start(gio.types.DriveStartFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_drive_start(cast(GDrive*)cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes starting a drive.
    Params:
      result =       a #GAsyncResult.
    Returns:     true if the drive has been started successfully,
          false otherwise.
  */
  override bool startFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = g_drive_start_finish(cast(GDrive*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Asynchronously stops a drive.
    
    When the operation is finished, callback will be called.
    You can then call [gio.drive.Drive.stopFinish] to obtain the
    result of the operation.
    Params:
      flags =       flags affecting the unmount if required for stopping.
      mountOperation =       a #GMountOperation or null to avoid
            user interaction.
      cancellable =       optional #GCancellable object, null to ignore.
      callback =       a #GAsyncReadyCallback, or null.
  */
  override void stop(gio.types.MountUnmountFlags flags, gio.mount_operation.MountOperation mountOperation = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_drive_stop(cast(GDrive*)cPtr, flags, mountOperation ? cast(GMountOperation*)mountOperation.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes stopping a drive.
    Params:
      result =       a #GAsyncResult.
    Returns:     true if the drive has been stopped successfully,
          false otherwise.
  */
  override bool stopFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = g_drive_stop_finish(cast(GDrive*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Emitted when the drive's state has changed.
  
    ## Parameters
    $(LIST
      * $(B drive) the instance the signal is connected to
    )
  */
  alias ChangedCallbackDlg = void delegate(gio.drive.Drive drive);

  /** ditto */
  alias ChangedCallbackFunc = void function(gio.drive.Drive drive);

  /**
    Connect to Changed signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangedCallbackDlg) || is(T : ChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto drive = getVal!(gio.drive.Drive)(_paramVals);
      _dClosure.dlg(drive);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      This signal is emitted when the #GDrive have been
    disconnected. If the recipient is holding references to the
    object they should release them so the object can be
    finalized.
  
    ## Parameters
    $(LIST
      * $(B drive) the instance the signal is connected to
    )
  */
  alias DisconnectedCallbackDlg = void delegate(gio.drive.Drive drive);

  /** ditto */
  alias DisconnectedCallbackFunc = void function(gio.drive.Drive drive);

  /**
    Connect to Disconnected signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDisconnected(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DisconnectedCallbackDlg) || is(T : DisconnectedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto drive = getVal!(gio.drive.Drive)(_paramVals);
      _dClosure.dlg(drive);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("disconnected", closure, after);
  }

  /**
      Emitted when the physical eject button (if any) of a drive has
    been pressed.
  
    ## Parameters
    $(LIST
      * $(B drive) the instance the signal is connected to
    )
  */
  alias EjectButtonCallbackDlg = void delegate(gio.drive.Drive drive);

  /** ditto */
  alias EjectButtonCallbackFunc = void function(gio.drive.Drive drive);

  /**
    Connect to EjectButton signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectEjectButton(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EjectButtonCallbackDlg) || is(T : EjectButtonCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto drive = getVal!(gio.drive.Drive)(_paramVals);
      _dClosure.dlg(drive);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("eject-button", closure, after);
  }

  /**
      Emitted when the physical stop button (if any) of a drive has
    been pressed.
  
    ## Parameters
    $(LIST
      * $(B drive) the instance the signal is connected to
    )
  */
  alias StopButtonCallbackDlg = void delegate(gio.drive.Drive drive);

  /** ditto */
  alias StopButtonCallbackFunc = void function(gio.drive.Drive drive);

  /**
    Connect to StopButton signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectStopButton(T)(T callback, Flag!"After" after = No.After)
  if (is(T : StopButtonCallbackDlg) || is(T : StopButtonCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto drive = getVal!(gio.drive.Drive)(_paramVals);
      _dClosure.dlg(drive);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("stop-button", closure, after);
  }
}
