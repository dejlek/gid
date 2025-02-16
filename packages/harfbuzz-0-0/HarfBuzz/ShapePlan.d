module HarfBuzz.ShapePlan;

import GObject.Boxed;
import Gid.gid;
import HarfBuzz.Types;
import HarfBuzz.c.functions;
import HarfBuzz.c.types;

/**
 * Data type for holding a shaping plan.
 * Shape plans contain information about how HarfBuzz will shape a
 * particular text segment, based on the segment's properties and the
 * capabilities in the font face in use.
 * Shape plans can be queried about how shaping will perform, given a set
 * of specific input parameters $(LPAREN)script, language, direction, features,
 * etc.$(RPAREN).
 */
class ShapePlan : Boxed
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_shape_plan_get_type != &gidSymbolNotFound ? hb_gobject_shape_plan_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
