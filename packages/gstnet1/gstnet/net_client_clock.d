/// Module for [NetClientClock] class
module gstnet.net_client_clock;

import gid.gid;
import gst.system_clock;
import gst.types;
import gstnet.c.functions;
import gstnet.c.types;
import gstnet.types;

/**
    #GstNetClientClock implements a custom #GstClock that synchronizes its time
    to a remote time provider such as #GstNetTimeProvider. #GstNtpClock
    implements a #GstClock that synchronizes its time to a remote NTPv4 server.
    
    A new clock is created with [gstnet.net_client_clock.NetClientClock.new_] or
    [gstnet.ntp_clock.NtpClock.new_], which takes the address and port of the remote time
    provider along with a name and an initial time.
    
    This clock will poll the time provider and will update its calibration
    parameters based on the local and remote observations.
    
    The "round-trip" property limits the maximum round trip packets can take.
    
    Various parameters of the clock can be configured with the parent #GstClock
    "timeout", "window-size" and "window-threshold" object properties.
    
    A #GstNetClientClock and #GstNtpClock is typically set on a #GstPipeline with
    [gst.pipeline.Pipeline.useClock].
    
    If you set a #GstBus on the clock via the "bus" object property, it will
    send @GST_MESSAGE_ELEMENT messages with an attached #GstStructure containing
    statistics about clock accuracy and network traffic.
*/
class NetClientClock : gst.system_clock.SystemClock
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
    return cast(void function())gst_net_client_clock_get_type != &gidSymbolNotFound ? gst_net_client_clock_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override NetClientClock self()
  {
    return this;
  }

  /**
      Create a new #GstNetClientClock that will report the time
      provided by the #GstNetTimeProvider on remote_address and
      remote_port.
  
      Params:
        name = a name for the clock
        remoteAddress = the address or hostname of the remote clock provider
        remotePort = the port of the remote clock provider
        baseTime = initial time of the clock
      Returns: a new #GstClock that receives a time from the remote
        clock.
  */
  this(string name, string remoteAddress, int remotePort, gst.types.ClockTime baseTime)
  {
    GstClock* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _remoteAddress = remoteAddress.toCString(No.Alloc);
    _cretval = gst_net_client_clock_new(_name, _remoteAddress, remotePort, baseTime);
    this(_cretval, Yes.Take);
  }
}
