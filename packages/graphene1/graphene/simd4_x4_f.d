module graphene.simd4_x4_f;

import gid.gid;
import graphene.c.functions;
import graphene.c.types;
import graphene.types;

/** */
class Simd4X4F
{
  graphene_simd4x4f_t cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Graphene.Simd4X4F");

    cInstance = *cast(graphene_simd4x4f_t*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }
}
