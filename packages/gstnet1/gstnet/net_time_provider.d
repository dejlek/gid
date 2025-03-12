module gstnet.net_time_provider;

import gid.gid;
import gio.initable;
import gio.initable_mixin;
import gst.clock;
import gst.object;
import gstnet.c.functions;
import gstnet.c.types;
import gstnet.types;

/**
    This object exposes the time of a #GstClock on the network.
  
  A #GstNetTimeProvider is created with [gstnet.net_time_provider.NetTimeProvider.new_] which
  takes a #GstClock, an address and a port number as arguments.
  
  After creating the object, a client clock such as #GstNetClientClock can
  query the exposed clock over the network for its values.
  
  The #GstNetTimeProvider typically wraps the clock used by a #GstPipeline.
*/
class NetTimeProvider : gst.object.ObjectGst, gio.initable.Initable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_net_time_provider_get_type != &gidSymbolNotFound ? gst_net_time_provider_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override NetTimeProvider self()
  {
    return this;
  }

  mixin InitableT!();

  /**
      Allows network clients to get the current time of clock.
    Params:
      clock =       a #GstClock to export over the network
      address =       an address to bind on as a dotted quad
                  (xxx.xxx.xxx.xxx), IPv6 address, or NULL to bind to all addresses
      port =       a port to bind on, or 0 to let the kernel choose
    Returns:     the new #GstNetTimeProvider, or NULL on error
  */
  this(gst.clock.Clock clock, string address, int port)
  {
    GstNetTimeProvider* _cretval;
    const(char)* _address = address.toCString(No.Alloc);
    _cretval = gst_net_time_provider_new(clock ? cast(GstClock*)clock.cPtr(No.Dup) : null, _address, port);
    this(_cretval, Yes.Take);
  }
}
