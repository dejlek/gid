module Arrow.ResizableBuffer;

import Arrow.MutableBuffer;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class ResizableBuffer : MutableBuffer
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_resizable_buffer_get_type != &gidSymbolNotFound ? garrow_resizable_buffer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long initialSize)
  {
    GArrowResizableBuffer* _cretval;
    GError *_err;
    _cretval = garrow_resizable_buffer_new(initialSize, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  bool reserve(long newCapacity)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_resizable_buffer_reserve(cast(GArrowResizableBuffer*)cPtr, newCapacity, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

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
