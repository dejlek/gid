module ArrowDataset.ScannerBuilder;

import Arrow.Expression;
import Arrow.RecordBatchReader;
import ArrowDataset.Dataset;
import ArrowDataset.Scanner;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class ScannerBuilder : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_scanner_builder_get_type != &gidSymbolNotFound ? gadataset_scanner_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Dataset dataset)
  {
    GADatasetScannerBuilder* _cretval;
    GError *_err;
    _cretval = gadataset_scanner_builder_new(dataset ? cast(GADatasetDataset*)dataset.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  static ScannerBuilder newRecordBatchReader(RecordBatchReader reader)
  {
    GADatasetScannerBuilder* _cretval;
    _cretval = gadataset_scanner_builder_new_record_batch_reader(reader ? cast(GArrowRecordBatchReader*)reader.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!ScannerBuilder(cast(GADatasetScannerBuilder*)_cretval, Yes.Take);
    return _retval;
  }

  Scanner finish()
  {
    GADatasetScanner* _cretval;
    GError *_err;
    _cretval = gadataset_scanner_builder_finish(cast(GADatasetScannerBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Scanner(cast(GADatasetScanner*)_cretval, Yes.Take);
    return _retval;
  }

  bool setFilter(Expression expression)
  {
    bool _retval;
    GError *_err;
    _retval = gadataset_scanner_builder_set_filter(cast(GADatasetScannerBuilder*)cPtr, expression ? cast(GArrowExpression*)expression.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
