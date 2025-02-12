module ArrowDataset.Dataset;

import Arrow.RecordBatchReader;
import Arrow.Table;
import ArrowDataset.ScannerBuilder;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class Dataset : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gadataset_dataset_get_type();
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
