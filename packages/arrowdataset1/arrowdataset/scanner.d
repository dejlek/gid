module arrowdataset.scanner;

import arrow.record_batch_reader;
import arrow.table;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.global;
import glib.error;
import gobject.object;

class Scanner : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_scanner_get_type != &gidSymbolNotFound ? gadataset_scanner_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  RecordBatchReader toRecordBatchReader()
  {
    GArrowRecordBatchReader* _cretval;
    GError *_err;
    _cretval = gadataset_scanner_to_record_batch_reader(cast(GADatasetScanner*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!RecordBatchReader(cast(GArrowRecordBatchReader*)_cretval, Yes.Take);
    return _retval;
  }

  Table toTable()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = gadataset_scanner_to_table(cast(GADatasetScanner*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }
}
