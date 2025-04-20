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
      throw new GidConstructException("Null instance pointer for harfbuzz.variation.Variation");

    cInstance = *cast(hb_variation_t*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `tag` field.
      Returns: The #hb_tag_t tag of the variation-axis name
  */
  @property harfbuzz.types.Tag tag()
  {
    return (cast(hb_variation_t*)cPtr).tag;
  }

  /**
      Set `tag` field.
      Params:
        propval = The #hb_tag_t tag of the variation-axis name
  */
  @property void tag(harfbuzz.types.Tag propval)
  {
    (cast(hb_variation_t*)cPtr).tag = propval;
  }

  /**
      Get `value` field.
      Returns: The value of the variation axis
  */
  @property float value()
  {
    return (cast(hb_variation_t*)cPtr).value;
  }

  /**
      Set `value` field.
      Params:
        propval = The value of the variation axis
  */
  @property void value(float propval)
  {
    (cast(hb_variation_t*)cPtr).value = propval;
  }
}
