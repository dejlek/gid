module gio.pollable_input_stream_mixin;

public import gio.pollable_input_stream_iface_proxy;
public import gid.global;
public import gio.c.functions;
public import gio.c.types;
public import gio.cancellable;
public import gio.types;
public import glib.error;
public import glib.source;

/**
 * `GPollableInputStream` is implemented by [gio.input_stream.InputStream]s that
 * can be polled for readiness to read. This can be used when
 * interfacing with a non-GIO API that expects
 * UNIX-file-descriptor-style asynchronous I/O rather than GIO-style.
 * Some classes may implement `GPollableInputStream` but have only certain
 * instances of that class be pollable. If [gio.pollable_input_stream.PollableInputStream.canPoll]
 * returns false, then the behavior of other `GPollableInputStream` methods is
 * undefined.
 */
template PollableInputStreamT()
{

  /**
   * Checks if stream is actually pollable. Some classes may implement
   * #GPollableInputStream but have only certain instances of that class
   * be pollable. If this method returns %FALSE, then the behavior of
   * other #GPollableInputStream methods is undefined.
   * For any given stream, the value returned by this method is constant;
   * a stream cannot switch from pollable to non-pollable or vice versa.
   * Returns: %TRUE if stream is pollable, %FALSE if not.
   */
  override bool canPoll()
  {
    bool _retval;
    _retval = g_pollable_input_stream_can_poll(cast(GPollableInputStream*)cPtr);
    return _retval;
  }

  /**
   * Creates a #GSource that triggers when stream can be read, or
   * cancellable is triggered or an error occurs. The callback on the
   * source is of the #GPollableSourceFunc type.
   * As with [gio.pollable_input_stream.PollableInputStream.isReadable], it is possible that
   * the stream may not actually be readable even after the source
   * triggers, so you should use [gio.pollable_input_stream.PollableInputStream.readNonblocking]
   * rather than [gio.input_stream.InputStream.read] from the callback.
   * The behaviour of this method is undefined if
   * [gio.pollable_input_stream.PollableInputStream.canPoll] returns %FALSE for stream.
   * Params:
   *   cancellable = a #GCancellable, or %NULL
   * Returns: a new #GSource
   */
  override Source createSource(Cancellable cancellable)
  {
    GSource* _cretval;
    _cretval = g_pollable_input_stream_create_source(cast(GPollableInputStream*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null);
    auto _retval = _cretval ? new Source(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Checks if stream can be read.
   * Note that some stream types may not be able to implement this 100%
   * reliably, and it is possible that a call to [gio.input_stream.InputStream.read]
   * after this returns %TRUE would still block. To guarantee
   * non-blocking behavior, you should always use
   * [gio.pollable_input_stream.PollableInputStream.readNonblocking], which will return a
   * %G_IO_ERROR_WOULD_BLOCK error rather than blocking.
   * The behaviour of this method is undefined if
   * [gio.pollable_input_stream.PollableInputStream.canPoll] returns %FALSE for stream.
   * Returns: %TRUE if stream is readable, %FALSE if not. If an error
   *   has occurred on stream, this will result in
   *   [gio.pollable_input_stream.PollableInputStream.isReadable] returning %TRUE, and the
   *   next attempt to read will return the error.
   */
  override bool isReadable()
  {
    bool _retval;
    _retval = g_pollable_input_stream_is_readable(cast(GPollableInputStream*)cPtr);
    return _retval;
  }

  /**
   * Attempts to read up to count bytes from stream into buffer, as
   * with [gio.input_stream.InputStream.read]. If stream is not currently readable,
   * this will immediately return %G_IO_ERROR_WOULD_BLOCK, and you can
   * use [gio.pollable_input_stream.PollableInputStream.createSource] to create a #GSource
   * that will be triggered when stream is readable.
   * Note that since this method never blocks, you cannot actually
   * use cancellable to cancel it. However, it will return an error
   * if cancellable has already been cancelled when you call, which
   * may happen if you call this method after a source triggers due
   * to having been cancelled.
   * The behaviour of this method is undefined if
   * [gio.pollable_input_stream.PollableInputStream.canPoll] returns %FALSE for stream.
   * Params:
   *   buffer = a
   *     buffer to read data into $(LPAREN)which should be at least count bytes long$(RPAREN).
   *   cancellable = a #GCancellable, or %NULL
   * Returns: the number of bytes read, or -1 on error $(LPAREN)including
   *   %G_IO_ERROR_WOULD_BLOCK$(RPAREN).
   */
  override ptrdiff_t readNonblocking(ref ubyte[] buffer, Cancellable cancellable)
  {
    ptrdiff_t _retval;
    size_t _count;
    GError *_err;
    _retval = g_pollable_input_stream_read_nonblocking(cast(GPollableInputStream*)cPtr, buffer.ptr, _count, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
