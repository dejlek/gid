module Gio.FilenameCompleterClass;

import GObject.ObjectClass;
import Gid.gid;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

class FilenameCompleterClass
{
  GFilenameCompleterClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.FilenameCompleterClass");

    cInstance = *cast(GFilenameCompleterClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GFilenameCompleterClass*)cPtr).parentClass);
  }

  alias GotCompletionDataFuncType = extern(C) void function(GFilenameCompleter* filenameCompleter);

  @property GotCompletionDataFuncType gotCompletionData()
  {
    return (cast(GFilenameCompleterClass*)cPtr).gotCompletionData;
  }
}
