/// Module for [RoundOptions] class
module arrow.round_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class RoundOptions : arrow.function_options.FunctionOptions
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_round_options_get_type != &gidSymbolNotFound ? garrow_round_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RoundOptions self()
  {
    return this;
  }

  /**
      Get `mode` property.
      Returns: The rounding and tie-breaking mode.
  */
  @property arrow.types.RoundMode mode()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.RoundMode)("mode");
  }

  /**
      Set `mode` property.
      Params:
        propval = The rounding and tie-breaking mode.
  */
  @property void mode(arrow.types.RoundMode propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.RoundMode)("mode", propval);
  }

  /**
      Get `nDigits` property.
      Returns: The rounding precision (number of digits to round to).
  */
  @property long nDigits()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("n-digits");
  }

  /**
      Set `nDigits` property.
      Params:
        propval = The rounding precision (number of digits to round to).
  */
  @property void nDigits(long propval)
  {
    gobject.object.ObjectWrap.setProperty!(long)("n-digits", propval);
  }

  /** */
  this()
  {
    GArrowRoundOptions* _cretval;
    _cretval = garrow_round_options_new();
    this(_cretval, Yes.Take);
  }
}
