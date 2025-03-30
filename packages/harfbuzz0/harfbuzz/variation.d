/// Module for [Variation] class
module harfbuzz.variation;

import gid.gid;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data type for holding variation data. Registered OpenType
    variation-axis tags are listed in
    [OpenType Axis Tag Registry](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
*/
class Variation
{
  hb_variation_t cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for HarfBuzz.Variation");

    cInstance = *cast(hb_variation_t*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property harfbuzz.types.Tag tag()
  {
    return (cast(hb_variation_t*)cPtr).tag;
  }

  @property void tag(harfbuzz.types.Tag propval)
  {
    (cast(hb_variation_t*)cPtr).tag = propval;
  }

  @property float value()
  {
    return (cast(hb_variation_t*)cPtr).value;
  }

  @property void value(float propval)
  {
    (cast(hb_variation_t*)cPtr).value = propval;
  }
}
