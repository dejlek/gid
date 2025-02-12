module ArrowDataset.Scanner;

import Arrow.RecordBatchReader;
import Arrow.Table;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class Scanner : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gadataset_scanner_get_type();
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
