/// Module for [InetAddressMask] class
module gio.inet_address_mask;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.inet_address;
import gio.initable;
import gio.initable_mixin;
import gio.types;
import glib.error;
import gobject.object;

/**
    [gio.inet_address_mask.InetAddressMask] represents a range of IPv4 or IPv6 addresses
    described by a base address and a length indicating how many bits
    of the base address are relevant for matching purposes. These are
    often given in string form. For example, `10.0.0.0/8`, or `fe80::/10`.
*/
class InetAddressMask : gobject.object.ObjectG, gio.initable.Initable
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_inet_address_mask_get_type != &gidSymbolNotFound ? g_inet_address_mask_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override InetAddressMask self()
  {
    return this;
  }

  mixin InitableT!();

  /**
      Creates a new #GInetAddressMask representing all addresses whose
      first length bits match addr.
  
      Params:
        addr = a #GInetAddress
        length = number of bits of addr to use
      Returns: a new #GInetAddressMask, or null on error
      Throws: [ErrorG]
  */
  this(gio.inet_address.InetAddress addr, uint length)
  {
    GInetAddressMask* _cretval;
    GError *_err;
    _cretval = g_inet_address_mask_new(addr ? cast(GInetAddress*)addr.cPtr(No.Dup) : null, length, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /**
      Parses mask_string as an IP address and (optional) length, and
      creates a new #GInetAddressMask. The length, if present, is
      delimited by a "/". If it is not present, then the length is
      assumed to be the full length of the address.
  
      Params:
        maskString = an IP address or address/length string
      Returns: a new #GInetAddressMask corresponding to string, or null
        on error.
      Throws: [ErrorG]
  */
  static gio.inet_address_mask.InetAddressMask newFromString(string maskString)
  {
    GInetAddressMask* _cretval;
    const(char)* _maskString = maskString.toCString(No.Alloc);
    GError *_err;
    _cretval = g_inet_address_mask_new_from_string(_maskString, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.inet_address_mask.InetAddressMask)(cast(GInetAddressMask*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Tests if mask and mask2 are the same mask.
  
      Params:
        mask2 = another #GInetAddressMask
      Returns: whether mask and mask2 are the same mask
  */
  bool equal(gio.inet_address_mask.InetAddressMask mask2)
  {
    bool _retval;
    _retval = g_inet_address_mask_equal(cast(GInetAddressMask*)cPtr, mask2 ? cast(GInetAddressMask*)mask2.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets mask's base address
      Returns: mask's base address
  */
  gio.inet_address.InetAddress getAddress()
  {
    GInetAddress* _cretval;
    _cretval = g_inet_address_mask_get_address(cast(GInetAddressMask*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.inet_address.InetAddress)(cast(GInetAddress*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GSocketFamily of mask's address
      Returns: the #GSocketFamily of mask's address
  */
  gio.types.SocketFamily getFamily()
  {
    GSocketFamily _cretval;
    _cretval = g_inet_address_mask_get_family(cast(GInetAddressMask*)cPtr);
    gio.types.SocketFamily _retval = cast(gio.types.SocketFamily)_cretval;
    return _retval;
  }

  /**
      Gets mask's length
      Returns: mask's length
  */
  uint getLength()
  {
    uint _retval;
    _retval = g_inet_address_mask_get_length(cast(GInetAddressMask*)cPtr);
    return _retval;
  }

  /**
      Tests if address falls within the range described by mask.
  
      Params:
        address = a #GInetAddress
      Returns: whether address falls within the range described by
        mask.
  */
  bool matches(gio.inet_address.InetAddress address)
  {
    bool _retval;
    _retval = g_inet_address_mask_matches(cast(GInetAddressMask*)cPtr, address ? cast(GInetAddress*)address.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Converts mask back to its corresponding string form.
      Returns: a string corresponding to mask.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = g_inet_address_mask_to_string(cast(GInetAddressMask*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
