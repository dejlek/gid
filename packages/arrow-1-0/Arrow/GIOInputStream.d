module Arrow.GIOInputStream;

import Arrow.File;
import Arrow.FileT;
import Arrow.Readable;
import Arrow.ReadableT;
import Arrow.SeekableInputStream;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;
import Gio.InputStream;

class GIOInputStream : SeekableInputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_gio_input_stream_get_type != &gidSymbolNotFound ? garrow_gio_input_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(InputStream gioInputStream)
  {
    GArrowGIOInputStream* _cretval;
    _cretval = garrow_gio_input_stream_new(gioInputStream ? cast(GInputStream*)gioInputStream.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  InputStream getRaw()
  {
    GInputStream* _cretval;
    _cretval = garrow_gio_input_stream_get_raw(cast(GArrowGIOInputStream*)cPtr);
    auto _retval = ObjectG.getDObject!InputStream(cast(GInputStream*)_cretval, No.Take);
    return _retval;
  }
}
