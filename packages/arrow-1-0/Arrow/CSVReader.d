module Arrow.CSVReader;

import Arrow.CSVReadOptions;
import Arrow.InputStream;
import Arrow.Table;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class CSVReader : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_csv_reader_get_type != &gidSymbolNotFound ? garrow_csv_reader_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(InputStream input, CSVReadOptions options)
  {
    GArrowCSVReader* _cretval;
    GError *_err;
    _cretval = garrow_csv_reader_new(input ? cast(GArrowInputStream*)input.cPtr(No.Dup) : null, options ? cast(GArrowCSVReadOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  Table read()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_csv_reader_read(cast(GArrowCSVReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }
}
