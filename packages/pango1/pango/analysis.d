module pango.analysis;

import gid.gid;
import gobject.object;
import pango.c.functions;
import pango.c.types;
import pango.font;
import pango.language;
import pango.types;

/**
 * The `PangoAnalysis` structure stores information about
 * the properties of a segment of text.
 */
class Analysis
{
  PangoAnalysis cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Pango.Analysis");

    cInstance = *cast(PangoAnalysis*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property pango.font.Font font()
  {
    return ObjectG.getDObject!(pango.font.Font)((cast(PangoAnalysis*)cPtr).font, No.Take);
  }

  @property ubyte level()
  {
    return (cast(PangoAnalysis*)cPtr).level;
  }

  @property void level(ubyte propval)
  {
    (cast(PangoAnalysis*)cPtr).level = propval;
  }

  @property ubyte gravity()
  {
    return (cast(PangoAnalysis*)cPtr).gravity;
  }

  @property void gravity(ubyte propval)
  {
    (cast(PangoAnalysis*)cPtr).gravity = propval;
  }

  @property ubyte flags()
  {
    return (cast(PangoAnalysis*)cPtr).flags;
  }

  @property void flags(ubyte propval)
  {
    (cast(PangoAnalysis*)cPtr).flags = propval;
  }

  @property ubyte script()
  {
    return (cast(PangoAnalysis*)cPtr).script;
  }

  @property void script(ubyte propval)
  {
    (cast(PangoAnalysis*)cPtr).script = propval;
  }

  @property pango.language.PgLanguage language()
  {
    return new pango.language.PgLanguage(cast(PangoLanguage*)(cast(PangoAnalysis*)cPtr).language);
  }
}
