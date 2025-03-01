module gio.permission;

import gid.global;
import gio.async_result;
import gio.async_result_mixin;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.object;

/**
 * A `GPermission` represents the status of the caller’s permission to
 * perform a certain action.
 * You can query if the action is currently allowed and if it is
 * possible to acquire the permission so that the action will be allowed
 * in the future.
 * There is also an API to actually acquire the permission and one to
 * release it.
 * As an example, a `GPermission` might represent the ability for the
 * user to write to a [gio.settings.Settings] object.  This `GPermission` object
 * could then be used to decide if it is appropriate to show a “Click here to
 * unlock” button in a dialog and to provide the mechanism to invoke
 * when that button is clicked.
 */
class Permission : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_permission_get_type != &gidSymbolNotFound ? g_permission_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Attempts to acquire the permission represented by permission.
   * The precise method by which this happens depends on the permission
   * and the underlying authentication mechanism.  A simple example is
   * that a dialog may appear asking the user to enter their password.
   * You should check with [gio.permission.Permission.getCanAcquire] before calling
   * this function.
   * If the permission is acquired then %TRUE is returned.  Otherwise,
   * %FALSE is returned and error is set appropriately.
   * This call is blocking, likely for a very long time $(LPAREN)in the case that
   * user interaction is required$(RPAREN).  See [gio.permission.Permission.acquireAsync] for
   * the non-blocking version.
   * Params:
   *   cancellable = a #GCancellable, or %NULL
   * Returns: %TRUE if the permission was successfully acquired
   */
  bool acquire(Cancellable cancellable)
  {
    bool _retval;
    GError *_err;
    _retval = g_permission_acquire(cast(GPermission*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Attempts to acquire the permission represented by permission.
   * This is the first half of the asynchronous version of
   * [gio.permission.Permission.acquire].
   * Params:
   *   cancellable = a #GCancellable, or %NULL
   *   callback = the #GAsyncReadyCallback to call when done
   */
  void acquireAsync(Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_permission_acquire_async(cast(GPermission*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Collects the result of attempting to acquire the permission
   * represented by permission.
   * This is the second half of the asynchronous version of
   * [gio.permission.Permission.acquire].
   * Params:
   *   result = the #GAsyncResult given to the #GAsyncReadyCallback
   * Returns: %TRUE if the permission was successfully acquired
   */
  bool acquireFinish(AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = g_permission_acquire_finish(cast(GPermission*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Gets the value of the 'allowed' property.  This property is %TRUE if
   * the caller currently has permission to perform the action that
   * permission represents the permission to perform.
   * Returns: the value of the 'allowed' property
   */
  bool getAllowed()
  {
    bool _retval;
    _retval = g_permission_get_allowed(cast(GPermission*)cPtr);
    return _retval;
  }

  /**
   * Gets the value of the 'can-acquire' property.  This property is %TRUE
   * if it is generally possible to acquire the permission by calling
   * [gio.permission.Permission.acquire].
   * Returns: the value of the 'can-acquire' property
   */
  bool getCanAcquire()
  {
    bool _retval;
    _retval = g_permission_get_can_acquire(cast(GPermission*)cPtr);
    return _retval;
  }

  /**
   * Gets the value of the 'can-release' property.  This property is %TRUE
   * if it is generally possible to release the permission by calling
   * [gio.permission.Permission.release].
   * Returns: the value of the 'can-release' property
   */
  bool getCanRelease()
  {
    bool _retval;
    _retval = g_permission_get_can_release(cast(GPermission*)cPtr);
    return _retval;
  }

  /**
   * This function is called by the #GPermission implementation to update
   * the properties of the permission.  You should never call this
   * function except from a #GPermission implementation.
   * GObject notify signals are generated, as appropriate.
   * Params:
   *   allowed = the new value for the 'allowed' property
   *   canAcquire = the new value for the 'can-acquire' property
   *   canRelease = the new value for the 'can-release' property
   */
  void implUpdate(bool allowed, bool canAcquire, bool canRelease)
  {
    g_permission_impl_update(cast(GPermission*)cPtr, allowed, canAcquire, canRelease);
  }

  /**
   * Attempts to release the permission represented by permission.
   * The precise method by which this happens depends on the permission
   * and the underlying authentication mechanism.  In most cases the
   * permission will be dropped immediately without further action.
   * You should check with [gio.permission.Permission.getCanRelease] before calling
   * this function.
   * If the permission is released then %TRUE is returned.  Otherwise,
   * %FALSE is returned and error is set appropriately.
   * This call is blocking, likely for a very long time $(LPAREN)in the case that
   * user interaction is required$(RPAREN).  See [gio.permission.Permission.releaseAsync] for
   * the non-blocking version.
   * Params:
   *   cancellable = a #GCancellable, or %NULL
   * Returns: %TRUE if the permission was successfully released
   */
  bool release(Cancellable cancellable)
  {
    bool _retval;
    GError *_err;
    _retval = g_permission_release(cast(GPermission*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Attempts to release the permission represented by permission.
   * This is the first half of the asynchronous version of
   * [gio.permission.Permission.release].
   * Params:
   *   cancellable = a #GCancellable, or %NULL
   *   callback = the #GAsyncReadyCallback to call when done
   */
  void releaseAsync(Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_permission_release_async(cast(GPermission*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Collects the result of attempting to release the permission
   * represented by permission.
   * This is the second half of the asynchronous version of
   * [gio.permission.Permission.release].
   * Params:
   *   result = the #GAsyncResult given to the #GAsyncReadyCallback
   * Returns: %TRUE if the permission was successfully released
   */
  bool releaseFinish(AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = g_permission_release_finish(cast(GPermission*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
