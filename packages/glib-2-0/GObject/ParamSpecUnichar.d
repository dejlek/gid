module GObject.ParamSpecUnichar;

import GObject.ParamSpec;
import GObject.Types;
import GObject.c.functions;
import GObject.c.types;
import Gid.gid;

/**
 * A #GParamSpec derived structure that contains the meta data for unichar $(LPAREN)unsigned integer$(RPAREN) properties.
 */
class ParamSpecUnichar : ParamSpec
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.ParamSpecUnichar");

    super(cast(GParamSpec*)ptr, take);
  }
}
