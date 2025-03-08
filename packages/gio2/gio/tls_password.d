module gio.tls_password;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.types;
import gobject.object;

/**
    An abstract interface representing a password used in TLS. Often used in
  user interaction such as unlocking a key storage token.
*/
class TlsPassword : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_tls_password_get_type != &gidSymbolNotFound ? g_tls_password_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Create a new #GTlsPassword object.
    Params:
      flags =       the password flags
      description =       description of what the password is for
    Returns:     The newly allocated password object
  */
  this(gio.types.TlsPasswordFlags flags, string description)
  {
    GTlsPassword* _cretval;
    const(char)* _description = description.toCString(No.alloc);
    _cretval = g_tls_password_new(flags, _description);
    this(_cretval, Yes.take);
  }

  /**
      Get a description string about what the password will be used for.
    Returns:     The description of the password.
  */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = g_tls_password_get_description(cast(GTlsPassword*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Get flags about the password.
    Returns:     The flags about the password.
  */
  gio.types.TlsPasswordFlags getFlags()
  {
    GTlsPasswordFlags _cretval;
    _cretval = g_tls_password_get_flags(cast(GTlsPassword*)cPtr);
    gio.types.TlsPasswordFlags _retval = cast(gio.types.TlsPasswordFlags)_cretval;
    return _retval;
  }

  /**
      Get the password value. If length is not null then it will be
    filled in with the length of the password value. (Note that the
    password value is not nul-terminated, so you can only pass null
    for length in contexts where you know the password will have a
    certain fixed length.)
    Returns:     The password value (owned by the password object).
  */
  ubyte[] getValue()
  {
    const(ubyte)* _cretval;
    size_t _cretlength;
    _cretval = g_tls_password_get_value(cast(GTlsPassword*)cPtr, &_cretlength);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  /**
      Get a user readable translated warning. Usually this warning is a
    representation of the password flags returned from
    [gio.tls_password.TlsPassword.getFlags].
    Returns:     The warning.
  */
  string getWarning()
  {
    const(char)* _cretval;
    _cretval = g_tls_password_get_warning(cast(GTlsPassword*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Set a description string about what the password will be used for.
    Params:
      description =       The description of the password
  */
  void setDescription(string description)
  {
    const(char)* _description = description.toCString(No.alloc);
    g_tls_password_set_description(cast(GTlsPassword*)cPtr, _description);
  }

  /**
      Set flags about the password.
    Params:
      flags =       The flags about the password
  */
  void setFlags(gio.types.TlsPasswordFlags flags)
  {
    g_tls_password_set_flags(cast(GTlsPassword*)cPtr, flags);
  }

  /**
      Set the value for this password. The value will be copied by the password
    object.
    
    Specify the length, for a non-nul-terminated password. Pass -1 as
    length if using a nul-terminated password, and length will be
    calculated automatically. (Note that the terminating nul is not
    considered part of the password in this case.)
    Params:
      value =       the new password value
  */
  void setValue(ubyte[] value)
  {
    ptrdiff_t _length;
    if (value)
      _length = cast(ptrdiff_t)value.length;

    auto _value = cast(const(ubyte)*)value.ptr;
    g_tls_password_set_value(cast(GTlsPassword*)cPtr, _value, _length);
  }

  /**
      Provide the value for this password.
    
    The value will be owned by the password object, and later freed using
    the destroy function callback.
    
    Specify the length, for a non-nul-terminated password. Pass -1 as
    length if using a nul-terminated password, and length will be
    calculated automatically. (Note that the terminating nul is not
    considered part of the password in this case.)
    Params:
      value =       the value for the password
      destroy =       a function to use to free the password.
  */
  void setValueFull(ubyte[] value, glib.types.DestroyNotify destroy = null)
  {
    extern(C) void _destroyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _destroyCB = destroy ? &_destroyCallback : null;

    ptrdiff_t _length;
    if (value)
      _length = cast(ptrdiff_t)value.length;

    auto _value = cast(ubyte*)value.ptr;
    g_tls_password_set_value_full(cast(GTlsPassword*)cPtr, _value, _length, _destroyCB);
  }

  /**
      Set a user readable translated warning. Usually this warning is a
    representation of the password flags returned from
    [gio.tls_password.TlsPassword.getFlags].
    Params:
      warning =       The user readable warning
  */
  void setWarning(string warning)
  {
    const(char)* _warning = warning.toCString(No.alloc);
    g_tls_password_set_warning(cast(GTlsPassword*)cPtr, _warning);
  }
}
