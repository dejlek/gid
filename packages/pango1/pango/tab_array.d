module pango.tab_array;

import gid.gid;
import gobject.boxed;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
 * A `PangoTabArray` contains an array of tab stops.
 * `PangoTabArray` can be used to set tab stops in a `PangoLayout`.
 * Each tab stop has an alignment, a position, and optionally
 * a character to use as decimal point.
 */
class TabArray : gobject.boxed.Boxed
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
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_tab_array_get_type != &gidSymbolNotFound ? pango_tab_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates an array of initial_size tab stops.
   * Tab stops are specified in pixel units if positions_in_pixels is %TRUE,
   * otherwise in Pango units. All stops are initially at position 0.
   * Params:
   *   initialSize = Initial number of tab stops to allocate, can be 0
   *   positionsInPixels = whether positions are in pixel units
   * Returns: the newly allocated `PangoTabArray`, which should
   *   be freed with [pango.tab_array.TabArray.free].
   */
  this(int initialSize, bool positionsInPixels)
  {
    PangoTabArray* _cretval;
    _cretval = pango_tab_array_new(initialSize, positionsInPixels);
    this(_cretval, Yes.Take);
  }

  /**
   * Copies a `PangoTabArray`.
   * Returns: the newly allocated `PangoTabArray`, which should
   *   be freed with [pango.tab_array.TabArray.free].
   */
  pango.tab_array.TabArray copy()
  {
    PangoTabArray* _cretval;
    _cretval = pango_tab_array_copy(cast(PangoTabArray*)cPtr);
    auto _retval = _cretval ? new pango.tab_array.TabArray(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Gets the Unicode character to use as decimal point.
   * This is only relevant for tabs with %PANGO_TAB_DECIMAL alignment,
   * which align content at the first occurrence of the decimal point
   * character.
   * The default value of 0 means that Pango will use the
   * decimal point according to the current locale.
   * Params:
   *   tabIndex = the index of a tab stop
   * Returns:
   */
  dchar getDecimalPoint(int tabIndex)
  {
    dchar _retval;
    _retval = pango_tab_array_get_decimal_point(cast(PangoTabArray*)cPtr, tabIndex);
    return _retval;
  }

  /**
   * Returns %TRUE if the tab positions are in pixels,
   * %FALSE if they are in Pango units.
   * Returns: whether positions are in pixels.
   */
  bool getPositionsInPixels()
  {
    bool _retval;
    _retval = pango_tab_array_get_positions_in_pixels(cast(PangoTabArray*)cPtr);
    return _retval;
  }

  /**
   * Gets the number of tab stops in tab_array.
   * Returns: the number of tab stops in the array.
   */
  int getSize()
  {
    int _retval;
    _retval = pango_tab_array_get_size(cast(PangoTabArray*)cPtr);
    return _retval;
  }

  /**
   * Gets the alignment and position of a tab stop.
   * Params:
   *   tabIndex = tab stop index
   *   alignment = location to store alignment
   *   location = location to store tab position
   */
  void getTab(int tabIndex, out pango.types.TabAlign alignment, out int location)
  {
    pango_tab_array_get_tab(cast(PangoTabArray*)cPtr, tabIndex, &alignment, cast(int*)&location);
  }

  /**
   * Resizes a tab array.
   * You must subsequently initialize any tabs
   * that were added as a result of growing the array.
   * Params:
   *   newSize = new size of the array
   */
  void resize(int newSize)
  {
    pango_tab_array_resize(cast(PangoTabArray*)cPtr, newSize);
  }

  /**
   * Sets the Unicode character to use as decimal point.
   * This is only relevant for tabs with %PANGO_TAB_DECIMAL alignment,
   * which align content at the first occurrence of the decimal point
   * character.
   * By default, Pango uses the decimal point according
   * to the current locale.
   * Params:
   *   tabIndex = the index of a tab stop
   *   decimalPoint = the decimal point to use
   */
  void setDecimalPoint(int tabIndex, dchar decimalPoint)
  {
    pango_tab_array_set_decimal_point(cast(PangoTabArray*)cPtr, tabIndex, decimalPoint);
  }

  /**
   * Sets whether positions in this array are specified in
   * pixels.
   * Params:
   *   positionsInPixels = whether positions are in pixels
   */
  void setPositionsInPixels(bool positionsInPixels)
  {
    pango_tab_array_set_positions_in_pixels(cast(PangoTabArray*)cPtr, positionsInPixels);
  }

  /**
   * Sets the alignment and location of a tab stop.
   * Params:
   *   tabIndex = the index of a tab stop
   *   alignment = tab alignment
   *   location = tab location in Pango units
   */
  void setTab(int tabIndex, pango.types.TabAlign alignment, int location)
  {
    pango_tab_array_set_tab(cast(PangoTabArray*)cPtr, tabIndex, alignment, location);
  }

  /**
   * Utility function to ensure that the tab stops are in increasing order.
   */
  void sort()
  {
    pango_tab_array_sort(cast(PangoTabArray*)cPtr);
  }

  /**
   * Serializes a `PangoTabArray` to a string.
   * No guarantees are made about the format of the string,
   * it may change between Pango versions.
   * The intended use of this function is testing and
   * debugging. The format is not meant as a permanent
   * storage format.
   * Returns: a newly allocated string
   */
  string toString_()
  {
    char* _cretval;
    _cretval = pango_tab_array_to_string(cast(PangoTabArray*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Deserializes a `PangoTabArray` from a string.
   * This is the counterpart to [pango.tab_array.TabArray.toString_].
   * See that functions for details about the format.
   * Params:
   *   text = a string
   * Returns: a new `PangoTabArray`
   */
  static pango.tab_array.TabArray fromString(string text)
  {
    PangoTabArray* _cretval;
    const(char)* _text = text.toCString(No.Alloc);
    _cretval = pango_tab_array_from_string(_text);
    auto _retval = _cretval ? new pango.tab_array.TabArray(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
