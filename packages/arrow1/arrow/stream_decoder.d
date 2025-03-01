module arrow.stream_decoder;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.read_options;
import arrow.schema;
import arrow.stream_listener;
import arrow.types;
import gid.global;
import glib.bytes;
import glib.error;
import gobject.object;

class StreamDecoder : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_stream_decoder_get_type != &gidSymbolNotFound ? garrow_stream_decoder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(StreamListener listener, ReadOptions options)
  {
    GArrowStreamDecoder* _cretval;
    _cretval = garrow_stream_decoder_new(listener ? cast(GArrowStreamListener*)listener.cPtr(No.Dup) : null, options ? cast(GArrowReadOptions*)options.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Feed data to the decoder as a #GArrowBuffer.
   * If the decoder can read one or more record batches by the data, the
   * decoder calls vfuncGArrowStreamListener.on_record_batch_decoded
   * with a decoded record batch multiple times.
   * Params:
   *   buffer = A #GArrowBuffer to be decoded.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool consumeBuffer(Buffer buffer)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_stream_decoder_consume_buffer(cast(GArrowStreamDecoder*)cPtr, buffer ? cast(GArrowBuffer*)buffer.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Feed data to the decoder as a raw data.
   * If the decoder can read one or more record batches by the data, the
   * decoder calls vfuncGArrowStreamListener.on_record_batch_decoded
   * with a decoded record batch multiple times.
   * Params:
   *   bytes = A #GBytes to be decoded.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool consumeBytes(Bytes bytes)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_stream_decoder_consume_bytes(cast(GArrowStreamDecoder*)cPtr, bytes ? cast(GBytes*)bytes.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * This method is provided for users who want to optimize performance.
   * Normal users don't need to use this method.
   * Here is an example usage for normal users:
   * garrow_stream_decoder_consume_buffer$(LPAREN)decoder, buffer1$(RPAREN);
   * garrow_stream_decoder_consume_buffer$(LPAREN)decoder, buffer2$(RPAREN);
   * garrow_stream_decoder_consume_buffer$(LPAREN)decoder, buffer3$(RPAREN);
   * Decoder has internal buffer. If consumed data isn't enough to
   * advance the state of the decoder, consumed data is buffered to
   * the internal buffer. It causes performance overhead.
   * If you pass garrow_stream_decoer_get_next_required_size$(LPAREN)$(RPAREN) size data
   * to each
   * [arrow.stream_decoder.StreamDecoder.consumeBytes]/[arrow.stream_decoder.StreamDecoder.consumeBuffer]
   * call, the decoder doesn't use its internal buffer. It improves
   * performance.
   * Here is an example usage to avoid using internal buffer:
   * buffer1 \= get_data$(LPAREN)garrow_stream_decoder_get_next_required_size$(LPAREN)decoder$(RPAREN)$(RPAREN);
   * garrow_stream_decoder_consume_buffer$(LPAREN)buffer1$(RPAREN);
   * buffer2 \= get_data$(LPAREN)garrow_stream_decoder_get_next_required_size$(LPAREN)decoder$(RPAREN)$(RPAREN);
   * garrow_stream_decoder_consume_buffer$(LPAREN)buffer2$(RPAREN);
   * Users can use this method to avoid creating small chunks. Record
   * batch data must be contiguous data. If users pass small chunks to
   * the decoder, the decoder needs concatenate small chunks
   * internally. It causes performance overhead.
   * Here is an example usage to reduce small chunks:
   * GArrowResizablBuffer *buffer \= garrow_resizable_buffer_new$(LPAREN)1024, NULL$(RPAREN);
   * while $(LPAREN)$(LPAREN)small_chunk \= get_data$(LPAREN)&small_chunk_size$(RPAREN)$(RPAREN)$(RPAREN) {
   * size_t current_buffer_size \= garrow_buffer_get_size$(LPAREN)GARROW_BUFFER$(LPAREN)buffer$(RPAREN)$(RPAREN);
   * garrow_resizable_buffer_resize$(LPAREN)buffer, current_buffer_size + small_chunk_size,
   * NULL$(RPAREN);
   * garrow_mutable_buffer_set_data$(LPAREN)GARROW_MUTABLE_BUFFER$(LPAREN)buffer$(RPAREN),
   * current_buffer_size,
   * small_chunk,
   * small_chunk_size,
   * NULL$(RPAREN);
   * if $(LPAREN)garrow_buffer_get_size$(LPAREN)GARROW_BUFFER$(LPAREN)buffer$(RPAREN)$(RPAREN) <
   * garrow_stream_decoder_get_next_required_size$(LPAREN)decoder$(RPAREN)$(RPAREN) {
   * continue;
   * }
   * garrow_stream_decoder_consume_buffer$(LPAREN)decoder, GARROW_BUFFER$(LPAREN)buffer$(RPAREN), NULL$(RPAREN);
   * g_object_unref$(LPAREN)buffer$(RPAREN);
   * buffer \= garrow_resizable_buffer_new$(LPAREN)1024, NULL$(RPAREN);
   * }
   * if $(LPAREN)garrow_buffer_get_size$(LPAREN)GARROW_BUFFER$(LPAREN)buffer$(RPAREN)$(RPAREN) > 0$(RPAREN) {
   * garrow_stream_decoder_consume_buffer$(LPAREN)decoder, GARROW_BUFFER$(LPAREN)buffer$(RPAREN), NULL$(RPAREN);
   * }
   * g_object_unref$(LPAREN)buffer$(RPAREN);
   * Returns: The number of bytes needed to advance the state of
   *   the decoder.
   */
  size_t getNextRequiredSize()
  {
    size_t _retval;
    _retval = garrow_stream_decoder_get_next_required_size(cast(GArrowStreamDecoder*)cPtr);
    return _retval;
  }

  Schema getSchema()
  {
    GArrowSchema* _cretval;
    _cretval = garrow_stream_decoder_get_schema(cast(GArrowStreamDecoder*)cPtr);
    auto _retval = ObjectG.getDObject!Schema(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Reset the internal status.
   * You can reuse this decoder for new stream after calling this.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool reset()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_stream_decoder_reset(cast(GArrowStreamDecoder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
