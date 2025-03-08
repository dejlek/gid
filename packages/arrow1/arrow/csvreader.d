module arrow.csvreader;

import arrow.c.functions;
import arrow.c.types;
import arrow.csvread_options;
import arrow.input_stream;
import arrow.table;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class CSVReader : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_csv_reader_get_type != &gidSymbolNotFound ? garrow_csv_reader_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.input_stream.InputStream input, arrow.csvread_options.CSVReadOptions options = null)
  {
    GArrowCSVReader* _cretval;
    GError *_err;
    _cretval = garrow_csv_reader_new(input ? cast(GArrowInputStream*)input.cPtr(No.Dup) : null, options ? cast(GArrowCSVReadOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.table.Table read()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_csv_reader_read(cast(GArrowCSVReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }
}
