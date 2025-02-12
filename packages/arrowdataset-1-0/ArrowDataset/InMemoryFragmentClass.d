module ArrowDataset.InMemoryFragmentClass;

import ArrowDataset.FragmentClass;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import Gid.gid;

class InMemoryFragmentClass
{
  GADatasetInMemoryFragmentClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowDataset.InMemoryFragmentClass");

    cInstance = *cast(GADatasetInMemoryFragmentClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FragmentClass parentClass()
  {
    return new FragmentClass(cast(GADatasetFragmentClass*)&(cast(GADatasetInMemoryFragmentClass*)cPtr).parentClass);
  }
}
