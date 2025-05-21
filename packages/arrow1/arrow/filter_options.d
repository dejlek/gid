/// Module for [FilterOptions] class
module arrow.filter_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class FilterOptions : arrow.function_options.FunctionOptions
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_filter_options_get_type != &gidSymbolNotFound ? garrow_filter_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterOptions self()
  {
    return this;
  }

  /**
      Get `nullSelectionBehavior` property.
      Returns: How to handle filtered values.
  */
  @property arrow.types.FilterNullSelectionBehavior nullSelectionBehavior()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.FilterNullSelectionBehavior)("null-selection-behavior");
  }

  /**
      Set `nullSelectionBehavior` property.
      Params:
        propval = How to handle filtered values.
  */
  @property void nullSelectionBehavior(arrow.types.FilterNullSelectionBehavior propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.FilterNullSelectionBehavior)("null-selection-behavior", propval);
  }

  /** */
  this()
  {
    GArrowFilterOptions* _cretval;
    _cretval = garrow_filter_options_new();
    this(_cretval, Yes.Take);
  }
}
