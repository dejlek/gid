module Arrow.JSONReader;

import Arrow.InputStream;
import Arrow.JSONReadOptions;
import Arrow.Table;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class JSONReader : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_json_reader_get_type != &gidSymbolNotFound ? garrow_json_reader_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(InputStream input, JSONReadOptions options)
  {
    GArrowJSONReader* _cretval;
    GError *_err;
    _cretval = garrow_json_reader_new(input ? cast(GArrowInputStream*)input.cPtr(No.Dup) : null, options ? cast(GArrowJSONReadOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  Table read()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_json_reader_read(cast(GArrowJSONReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }
}
