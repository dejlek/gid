/// Module for [Analysis] class
module pango.analysis;

import gid.gid;
import pango.c.functions;
import pango.c.types;
import pango.font;
import pango.language;
import pango.types;

/**
    The [pango.analysis.Analysis] structure stores information about
    the properties of a segment of text.
*/
class Analysis
{
  PangoAnalysis cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for pango.analysis.Analysis");

    cInstance = *cast(PangoAnalysis*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `font` field.
      Returns: the font for this segment.
  */
  @property pango.font.Font font()
  {
    return cToD!(pango.font.Font)(cast(void*)(cast(PangoAnalysis*)cPtr).font);
  }

  /**
      Set `font` field.
      Params:
        propval = the font for this segment.
  */
  @property void font(pango.font.Font propval)
  {
    cValueFree!(pango.font.Font)(cast(void*)(cast(PangoAnalysis*)cPtr).font);
    dToC(propval, cast(void*)&(cast(PangoAnalysis*)cPtr).font);
  }

  /**
      Get `level` field.
      Returns: the bidirectional level for this segment.
  */
  @property ubyte level()
  {
    return (cast(PangoAnalysis*)cPtr).level;
  }

  /**
      Set `level` field.
      Params:
        propval = the bidirectional level for this segment.
  */
  @property void level(ubyte propval)
  {
    (cast(PangoAnalysis*)cPtr).level = propval;
  }

  /**
      Get `gravity` field.
      Returns: the glyph orientation for this segment (A [pango.types.Gravity]).
  */
  @property ubyte gravity()
  {
    return (cast(PangoAnalysis*)cPtr).gravity;
  }

  /**
      Set `gravity` field.
      Params:
        propval = the glyph orientation for this segment (A [pango.types.Gravity]).
  */
  @property void gravity(ubyte propval)
  {
    (cast(PangoAnalysis*)cPtr).gravity = propval;
  }

  /**
      Get `flags` field.
      Returns: boolean flags for this segment (Since: 1.16).
  */
  @property ubyte flags()
  {
    return (cast(PangoAnalysis*)cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = boolean flags for this segment (Since: 1.16).
  */
  @property void flags(ubyte propval)
  {
    (cast(PangoAnalysis*)cPtr).flags = propval;
  }

  /**
      Get `script` field.
      Returns: the detected script for this segment (A [pango.types.Script]) (Since: 1.18).
  */
  @property ubyte script()
  {
    return (cast(PangoAnalysis*)cPtr).script;
  }

  /**
      Set `script` field.
      Params:
        propval = the detected script for this segment (A [pango.types.Script]) (Since: 1.18).
  */
  @property void script(ubyte propval)
  {
    (cast(PangoAnalysis*)cPtr).script = propval;
  }

  /**
      Get `language` field.
      Returns: the detected language for this segment.
  */
  @property pango.language.Language language()
  {
    return cToD!(pango.language.Language)(cast(void*)(cast(PangoAnalysis*)cPtr).language);
  }

  /**
      Set `language` field.
      Params:
        propval = the detected language for this segment.
  */
  @property void language(pango.language.Language propval)
  {
    cValueFree!(pango.language.Language)(cast(void*)(cast(PangoAnalysis*)cPtr).language);
    dToC(propval, cast(void*)&(cast(PangoAnalysis*)cPtr).language);
  }
}
