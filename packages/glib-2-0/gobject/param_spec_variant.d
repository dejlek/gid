module gobject.param_spec_variant;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
 * A #GParamSpec derived structure that contains the meta data for #GVariant properties.
 * When comparing values with [GObject.Global.paramValuesCmp], scalar values with the same
 * type will be compared with [GLib.VariantG.compare]. Other non-%NULL variants will
 * be checked for equality with [GLib.VariantG.equal], and their sort order is
 * otherwise undefined. %NULL is ordered before non-%NULL variants. Two %NULL
 * values compare equal.
 */
class ParamSpecVariant : ParamSpec
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.ParamSpecVariant");

    super(cast(GParamSpec*)ptr, take);
  }
}
