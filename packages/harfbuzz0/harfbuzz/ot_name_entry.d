module harfbuzz.ot_name_entry;

import gid.gid;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Structure representing a name ID in a particular language.
*/
class OtNameEntry
{
  hb_ot_name_entry_t cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for HarfBuzz.OtNameEntry");

    cInstance = *cast(hb_ot_name_entry_t*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property harfbuzz.types.OtNameId nameId()
  {
    return (cast(hb_ot_name_entry_t*)cPtr).nameId;
  }

  @property void nameId(harfbuzz.types.OtNameId propval)
  {
    (cast(hb_ot_name_entry_t*)cPtr).nameId = propval;
  }

  @property harfbuzz.types.Language language()
  {
    return (cast(hb_ot_name_entry_t*)cPtr).language;
  }

  @property void language(harfbuzz.types.Language propval)
  {
    (cast(hb_ot_name_entry_t*)cPtr).language = propval;
  }
}
