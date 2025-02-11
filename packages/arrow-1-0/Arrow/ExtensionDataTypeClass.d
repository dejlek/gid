module Arrow.ExtensionDataTypeClass;

import Arrow.DataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ExtensionDataTypeClass
{
  GArrowExtensionDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.ExtensionDataTypeClass");

    cInstance = *cast(GArrowExtensionDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DataTypeClass parentClass()
  {
    return new DataTypeClass(cast(GArrowDataTypeClass*)&(cast(GArrowExtensionDataTypeClass*)cPtr).parentClass);
  }

  alias GetExtensionNameFuncType = extern(C) char* function(GArrowExtensionDataType* dataType);

  @property GetExtensionNameFuncType getExtensionName()
  {
    return (cast(GArrowExtensionDataTypeClass*)cPtr).getExtensionName;
  }

  alias EqualFuncType = extern(C) bool function(GArrowExtensionDataType* dataType, GArrowExtensionDataType* otherDataType);

  @property EqualFuncType equal()
  {
    return (cast(GArrowExtensionDataTypeClass*)cPtr).equal;
  }

  alias SerializeFuncType = extern(C) GBytes* function(GArrowExtensionDataType* dataType);

  @property SerializeFuncType serialize()
  {
    return (cast(GArrowExtensionDataTypeClass*)cPtr).serialize;
  }

  alias GetArrayGtypeFuncType = extern(C) GType function(GArrowExtensionDataType* dataType);

  @property GetArrayGtypeFuncType getArrayGtype()
  {
    return (cast(GArrowExtensionDataTypeClass*)cPtr).getArrayGtype;
  }
}
