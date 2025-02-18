module Atk.Range;

import Atk.Types;
import Atk.c.functions;
import Atk.c.types;
import GObject.Boxed;
import Gid.gid;

/**
 * A given range or subrange, to be used with #AtkValue
 * #AtkRange are used on #AtkValue, in order to represent the full
 * range of a given component $(LPAREN)for example an slider or a range
 * control$(RPAREN), or to define each individual subrange this full range is
 * splitted if available. See #AtkValue documentation for further
 * details.
 */
class Range : Boxed
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
    return cast(void function())atk_range_get_type != &gidSymbolNotFound ? atk_range_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new #AtkRange.
   * Params:
   *   lowerLimit = inferior limit for this range
   *   upperLimit = superior limit for this range
   *   description = human readable description of this range.
   * Returns: a new #AtkRange
   */
  this(double lowerLimit, double upperLimit, string description)
  {
    AtkRange* _cretval;
    const(char)* _description = description.toCString(No.Alloc);
    _cretval = atk_range_new(lowerLimit, upperLimit, _description);
    this(_cretval, Yes.Take);
  }

  /**
   * Returns a new #AtkRange that is a exact copy of src
   * Returns: a new #AtkRange copy of src
   */
  Range copy()
  {
    AtkRange* _cretval;
    _cretval = atk_range_copy(cast(AtkRange*)cPtr);
    auto _retval = _cretval ? new Range(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Returns the human readable description of range
   * Returns: the human-readable description of range
   */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = atk_range_get_description(cast(AtkRange*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns the lower limit of range
   * Returns: the lower limit of range
   */
  double getLowerLimit()
  {
    double _retval;
    _retval = atk_range_get_lower_limit(cast(AtkRange*)cPtr);
    return _retval;
  }

  /**
   * Returns the upper limit of range
   * Returns: the upper limit of range
   */
  double getUpperLimit()
  {
    double _retval;
    _retval = atk_range_get_upper_limit(cast(AtkRange*)cPtr);
    return _retval;
  }
}
