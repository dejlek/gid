module ArrowFlight.ServerAuthSender;

import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GLib.Bytes;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class ServerAuthSender : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_server_auth_sender_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Writes a message to the client.
   * Params:
   *   message = A #GBytes to be sent.
   * Returns: %TRUE on success, %FALSE on error.
   */
  bool write(Bytes message)
  {
    bool _retval;
    GError *_err;
    _retval = gaflight_server_auth_sender_write(cast(GAFlightServerAuthSender*)cPtr, message ? cast(GBytes*)message.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
