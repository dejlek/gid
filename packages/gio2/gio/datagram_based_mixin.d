module gio.datagram_based_mixin;

public import gio.datagram_based_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.cancellable;
public import gio.types;
public import glib.error;
public import glib.source;
public import glib.types;

/**
 * Interface for socket-like objects with datagram semantics.
 * A `GDatagramBased` is a networking interface for representing datagram-based
 * communications. It is a more or less direct mapping of the core parts of the
 * BSD socket API in a portable GObject interface. It is implemented by
 * [Gio.Socket], which wraps the UNIX socket API on UNIX and winsock2 on Windows.
 * `GDatagramBased` is entirely platform independent, and is intended to be used
 * alongside higher-level networking APIs such as [Gio.IOStream].
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
 * successfully run you can call [Gio.DatagramBased.conditionCheck] or
 * [Gio.DatagramBased.conditionWait]. You can also use
 * [Gio.DatagramBased.createSource] and attach it to a [GLib.MainContext]
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
template DatagramBasedT()
{

  /**
   * Checks on the readiness of datagram_based to perform operations. The
   * operations specified in condition are checked for and masked against the
   * currently-satisfied conditions on datagram_based. The result is returned.
   * %G_IO_IN will be set in the return value if data is available to read with
   * [Gio.DatagramBased.receiveMessages], or if the connection is closed remotely
   * $(LPAREN)EOS$(RPAREN); and if the datagram_based has not been closed locally using some
   * implementation-specific method $(LPAREN)such as [Gio.Socket.close] or
   * [Gio.Socket.shutdown] with shutdown_read set, if it’s a #GSocket$(RPAREN).
   * If the connection is shut down or closed $(LPAREN)by calling [Gio.Socket.close] or
   * [Gio.Socket.shutdown] with shutdown_read set, if it’s a #GSocket, for
   * example$(RPAREN), all calls to this function will return %G_IO_ERROR_CLOSED.
   * %G_IO_OUT will be set if it is expected that at least one byte can be sent
   * using [Gio.DatagramBased.sendMessages] without blocking. It will not be set
   * if the datagram_based has been closed locally.
   * %G_IO_HUP will be set if the connection has been closed locally.
   * %G_IO_ERR will be set if there was an asynchronous error in transmitting data
   * previously enqueued using [Gio.DatagramBased.sendMessages].
   * Note that on Windows, it is possible for an operation to return
   * %G_IO_ERROR_WOULD_BLOCK even immediately after
   * [Gio.DatagramBased.conditionCheck] has claimed that the #GDatagramBased is
   * ready for writing. Rather than calling [Gio.DatagramBased.conditionCheck] and
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
  override IOCondition conditionCheck(IOCondition condition)
  {
    GIOCondition _cretval;
    _cretval = g_datagram_based_condition_check(cast(GDatagramBased*)cPtr, condition);
    IOCondition _retval = cast(IOCondition)_cretval;
    return _retval;
  }

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
  override bool conditionWait(IOCondition condition, long timeout, Cancellable cancellable)
  {
    bool _retval;
    GError *_err;
    _retval = g_datagram_based_condition_wait(cast(GDatagramBased*)cPtr, condition, timeout, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

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
   * [Gio.Cancellable.isCancelled].
   * Params:
   *   condition = a #GIOCondition mask to monitor
   *   cancellable = a #GCancellable
   * Returns: a newly allocated #GSource
   */
  override Source createSource(IOCondition condition, Cancellable cancellable)
  {
    GSource* _cretval;
    _cretval = g_datagram_based_create_source(cast(GDatagramBased*)cPtr, condition, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null);
    auto _retval = _cretval ? new Source(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
