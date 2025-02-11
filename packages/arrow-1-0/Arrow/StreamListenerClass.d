module Arrow.StreamListenerClass;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectClass;
import Gid.gid;

class StreamListenerClass
{
  GArrowStreamListenerClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.StreamListenerClass");

    cInstance = *cast(GArrowStreamListenerClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GArrowStreamListenerClass*)cPtr).parentClass);
  }

  alias OnEosFuncType = extern(C) bool function(GArrowStreamListener* listener, GError** _err);

  @property OnEosFuncType onEos()
  {
    return (cast(GArrowStreamListenerClass*)cPtr).onEos;
  }

  alias OnRecordBatchDecodedFuncType = extern(C) bool function(GArrowStreamListener* listener, GArrowRecordBatch* recordBatch, GHashTable* metadata, GError** _err);

  @property OnRecordBatchDecodedFuncType onRecordBatchDecoded()
  {
    return (cast(GArrowStreamListenerClass*)cPtr).onRecordBatchDecoded;
  }

  alias OnSchemaDecodedFuncType = extern(C) bool function(GArrowStreamListener* listener, GArrowSchema* schema, GArrowSchema* filteredSchema, GError** _err);

  @property OnSchemaDecodedFuncType onSchemaDecoded()
  {
    return (cast(GArrowStreamListenerClass*)cPtr).onSchemaDecoded;
  }
}
