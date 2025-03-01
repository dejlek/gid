module arrowdataset.dataset;

import arrow.record_batch_reader;
import arrow.table;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.scanner_builder;
import arrowdataset.types;
import gid.global;
import glib.error;
import gobject.object;

class Dataset : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_dataset_get_type != &gidSymbolNotFound ? gadataset_dataset_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  ScannerBuilder beginScan()
  {
    GADatasetScannerBuilder* _cretval;
    GError *_err;
    _cretval = gadataset_dataset_begin_scan(cast(GADatasetDataset*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!ScannerBuilder(cast(GADatasetScannerBuilder*)_cretval, Yes.Take);
    return _retval;
  }

  string getTypeName()
  {
    char* _cretval;
    _cretval = gadataset_dataset_get_type_name(cast(GADatasetDataset*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  RecordBatchReader toRecordBatchReader()
  {
    GArrowRecordBatchReader* _cretval;
    GError *_err;
    _cretval = gadataset_dataset_to_record_batch_reader(cast(GADatasetDataset*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!RecordBatchReader(cast(GArrowRecordBatchReader*)_cretval, Yes.Take);
    return _retval;
  }

  Table toTable()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = gadataset_dataset_to_table(cast(GADatasetDataset*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }
}
