module arrow.resizable_buffer;

import arrow.c.functions;
import arrow.c.types;
import arrow.mutable_buffer;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class ResizableBuffer : arrow.mutable_buffer.MutableBuffer
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_resizable_buffer_get_type != &gidSymbolNotFound ? garrow_resizable_buffer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  this(long initialSize)
  {
    GArrowResizableBuffer* _cretval;
    GError *_err;
    _cretval = garrow_resizable_buffer_new(initialSize, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  bool reserve(long newCapacity)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_resizable_buffer_reserve(cast(GArrowResizableBuffer*)cPtr, newCapacity, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /** */
  bool resize(long newSize)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_resizable_buffer_resize(cast(GArrowResizableBuffer*)cPtr, newSize, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
