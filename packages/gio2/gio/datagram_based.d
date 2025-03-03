module gio.datagram_based;

public import gio.datagram_based_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.types;
import glib.error;
import glib.source;
import glib.types;

/**
 * Interface for socket-like objects with datagram semantics.
 * A `GDatagramBased` is a networking interface for representing datagram-based
 * communications. It is a more or less direct mapping of the core parts of the
 * BSD socket API in a portable GObject interface. It is implemented by
 * [gio.socket.Socket], which wraps the UNIX socket API on UNIX and winsock2 on Windows.
 * `GDatagramBased` is entirely platform independent, and is intended to be used
 * alongside higher-level networking APIs such as [gio.iostream.IOStream].
 * It uses vectored scatter/gather I/O by default, allowing for many messages
 * to be sent or received in a single call. Where possible, implementations of
 * the interface should take advantage of vectored I/O to minimise processing
 * or system calls. For example, `GSocket` uses `recvmmsg$(LPAREN)$(RPAREN)` and `sendmmsg$(LPAREN)$(RPAREN)`
 * where possible. Callers should take advantage of scatter/gather I/O $(LPAREN)the use of
 * multiple buffers per message$(RPAREN) to avoid unnecessary copying of data to
 * assemble or disassemble a message.
 * Each `GDatagramBased` operation has a timeout parameter which may be negative
 * for blocking behaviour, zero for non-blocking behaviour, or positive for
 * timeout behaviour. A blocking operation blocks until finished or there is an
 * error. A non-blocking operation will return immediately with a
 * `G_IO_ERROR_WOULD_BLOCK` error if it cannot make progress. A timeout operation
 * will block until the operation is complete or the timeout expires; if the
 * timeout expires it will return what progress it made, or
 * `G_IO_ERROR_TIMED_OUT` if no progress was made. To know when a call would
 * successfully run you can call [gio.datagram_based.DatagramBased.conditionCheck] or
 * [gio.datagram_based.DatagramBased.conditionWait]. You can also use
 * [gio.datagram_based.DatagramBased.createSource] and attach it to a [glib.main_context.MainContext]
 * to get callbacks when I/O is possible.
 * When running a non-blocking operation applications should always be able to
 * handle getting a `G_IO_ERROR_WOULD_BLOCK` error even when some other function
 * said that I/O was possible. This can easily happen in case of a race
 * condition in the application, but it can also happen for other reasons. For
 * instance, on Windows a socket is always seen as writable until a write
 * returns `G_IO_ERROR_WOULD_BLOCK`.
 * As with `GSocket`, `GDatagramBased`s can be either connection oriented $(LPAREN)for
 * example, SCTP$(RPAREN) or connectionless $(LPAREN)for example, UDP$(RPAREN). `GDatagramBased`s must be
 * datagram-based, not stream-based. The interface does not cover connection
 * establishment — use methods on the underlying type to establish a connection
 * before sending and receiving data through the `GDatagramBased` API. For
 * connectionless socket types the target/source address is specified or
 * received in each I/O operation.
 * Like most other APIs in GLib, `GDatagramBased` is not inherently thread safe.
 * To use a `GDatagramBased` concurrently from multiple threads, you must
 * implement your own locking.
 */
interface DatagramBased
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_datagram_based_get_type != &gidSymbolNotFound ? g_datagram_based_get_type() : cast(GType)0;
  }

  /**
   * Checks on the readiness of datagram_based to perform operations. The
   * operations specified in condition are checked for and masked against the
   * currently-satisfied conditions on datagram_based. The result is returned.
   * %G_IO_IN will be set in the return value if data is available to read with
   * [gio.datagram_based.DatagramBased.receiveMessages], or if the connection is closed remotely
   * $(LPAREN)EOS$(RPAREN); and if the datagram_based has not been closed locally using some
   * implementation-specific method $(LPAREN)such as [gio.socket.Socket.close] or
   * [gio.socket.Socket.shutdown] with shutdown_read set, if it’s a #GSocket$(RPAREN).
   * If the connection is shut down or closed $(LPAREN)by calling [gio.socket.Socket.close] or
   * [gio.socket.Socket.shutdown] with shutdown_read set, if it’s a #GSocket, for
   * example$(RPAREN), all calls to this function will return %G_IO_ERROR_CLOSED.
   * %G_IO_OUT will be set if it is expected that at least one byte can be sent
   * using [gio.datagram_based.DatagramBased.sendMessages] without blocking. It will not be set
   * if the datagram_based has been closed locally.
   * %G_IO_HUP will be set if the connection has been closed locally.
   * %G_IO_ERR will be set if there was an asynchronous error in transmitting data
   * previously enqueued using [gio.datagram_based.DatagramBased.sendMessages].
   * Note that on Windows, it is possible for an operation to return
   * %G_IO_ERROR_WOULD_BLOCK even immediately after
   * [gio.datagram_based.DatagramBased.conditionCheck] has claimed that the #GDatagramBased is
   * ready for writing. Rather than calling [gio.datagram_based.DatagramBased.conditionCheck] and
   * then writing to the #GDatagramBased if it succeeds, it is generally better to
   * simply try writing right away, and try again later if the initial attempt
   * returns %G_IO_ERROR_WOULD_BLOCK.
   * It is meaningless to specify %G_IO_ERR or %G_IO_HUP in condition; these
   * conditions will always be set in the output if they are true. Apart from
   * these flags, the output is guaranteed to be masked by condition.
   * This call never blocks.
   * Params:
   *   condition = a #GIOCondition mask to check
   * Returns: the #GIOCondition mask of the current state
   */
  glib.types.IOCondition conditionCheck(glib.types.IOCondition condition);

  /**
   * Waits for up to timeout microseconds for condition to become true on
   * datagram_based. If the condition is met, %TRUE is returned.
   * If cancellable is cancelled before the condition is met, or if timeout is
   * reached before the condition is met, then %FALSE is returned and error is
   * set appropriately $(LPAREN)%G_IO_ERROR_CANCELLED or %G_IO_ERROR_TIMED_OUT$(RPAREN).
   * Params:
   *   condition = a #GIOCondition mask to wait for
   *   timeout = the maximum time $(LPAREN)in microseconds$(RPAREN) to wait, 0 to not block, or -1
   *     to block indefinitely
   *   cancellable = a #GCancellable
   * Returns: %TRUE if the condition was met, %FALSE otherwise
   */
  bool conditionWait(glib.types.IOCondition condition, long timeout, gio.cancellable.Cancellable cancellable = null);

  /**
   * Creates a #GSource that can be attached to a #GMainContext to monitor for
   * the availability of the specified condition on the #GDatagramBased. The
   * #GSource keeps a reference to the datagram_based.
   * The callback on the source is of the #GDatagramBasedSourceFunc type.
   * It is meaningless to specify %G_IO_ERR or %G_IO_HUP in condition; these
   * conditions will always be reported in the callback if they are true.
   * If non-%NULL, cancellable can be used to cancel the source, which will
   * cause the source to trigger, reporting the current condition $(LPAREN)which is
   * likely 0 unless cancellation happened at the same time as a condition
   * change$(RPAREN). You can check for this in the callback using
   * [gio.cancellable.Cancellable.isCancelled].
   * Params:
   *   condition = a #GIOCondition mask to monitor
   *   cancellable = a #GCancellable
   * Returns: a newly allocated #GSource
   */
  glib.source.Source createSource(glib.types.IOCondition condition, gio.cancellable.Cancellable cancellable = null);
}
