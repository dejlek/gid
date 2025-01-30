module GObject.Parameter;

import GObject.Types;
import GObject.Value;
import GObject.c.functions;
import GObject.c.types;
import Gid.gid;

/**
 * The GParameter struct is an auxiliary structure used
 * to hand parameter name/value pairs to [GObject.ObjectG.newv].

 * Deprecated: This type is not introspectable.
 */
class Parameter
{
  GParameter cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.Parameter");

    cInstance = *cast(GParameter*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string name()
  {
    return (cast(GParameter*)cPtr).name.fromCString(No.Free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GParameter*)cPtr).name);
    (cast(GParameter*)cPtr).name = propval.toCString(Yes.Alloc);
  }

  @property Value value()
  {
    return new Value(cast(GValue*)&(cast(GParameter*)cPtr).value);
  }
}
