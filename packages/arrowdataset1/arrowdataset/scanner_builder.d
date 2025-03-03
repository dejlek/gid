module arrowdataset.scanner_builder;

import arrow.expression;
import arrow.record_batch_reader;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.dataset;
import arrowdataset.scanner;
import arrowdataset.types;
import gid.gid;
import glib.error;
import gobject.object;

class ScannerBuilder : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_scanner_builder_get_type != &gidSymbolNotFound ? gadataset_scanner_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(arrowdataset.dataset.Dataset dataset)
  {
    GADatasetScannerBuilder* _cretval;
    GError *_err;
    _cretval = gadataset_scanner_builder_new(dataset ? cast(GADatasetDataset*)dataset.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  static arrowdataset.scanner_builder.ScannerBuilder newRecordBatchReader(arrow.record_batch_reader.RecordBatchReader reader)
  {
    GADatasetScannerBuilder* _cretval;
    _cretval = gadataset_scanner_builder_new_record_batch_reader(reader ? cast(GArrowRecordBatchReader*)reader.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(arrowdataset.scanner_builder.ScannerBuilder)(cast(GADatasetScannerBuilder*)_cretval, Yes.Take);
    return _retval;
  }

  arrowdataset.scanner.Scanner finish()
  {
    GADatasetScanner* _cretval;
    GError *_err;
    _cretval = gadataset_scanner_builder_finish(cast(GADatasetScannerBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrowdataset.scanner.Scanner)(cast(GADatasetScanner*)_cretval, Yes.Take);
    return _retval;
  }

  bool setFilter(arrow.expression.Expression expression)
  {
    bool _retval;
    GError *_err;
    _retval = gadataset_scanner_builder_set_filter(cast(GADatasetScannerBuilder*)cPtr, expression ? cast(GArrowExpression*)expression.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
