module gtksource.region;

import gid.gid;
import gobject.object;
import gtk.text_buffer;
import gtk.text_iter;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.region_iter;
import gtksource.types;

/**
 * Region utility.
 * A `GtkSourceRegion` permits to store a group of subregions of a
 * [Gtk.TextBuffer]. `GtkSourceRegion` stores the subregions with pairs of
 * [Gtk.TextMark]'s, so the region is still valid after insertions and deletions
 * in the [Gtk.TextBuffer].
 * The [Gtk.TextMark] for the start of a subregion has a left gravity, while the
 * [Gtk.TextMark] for the end of a subregion has a right gravity.
 * The typical use-case of `GtkSourceRegion` is to scan a [Gtk.TextBuffer] chunk by
 * chunk, not the whole buffer at once to not block the user interface. The
 * `GtkSourceRegion` represents in that case the remaining region to scan. You
 * can listen to the signal@Gtk.TextBuffer::insert-text and
 * signal@Gtk.TextBuffer::delete-range signals to update the `GtkSourceRegion`
 * accordingly.
 * To iterate through the subregions, you need to use a struct@RegionIter,
 * for example:
 * ```c
 * GtkSourceRegion *region;
 * GtkSourceRegionIter region_iter;
 * gtk_source_region_get_start_region_iter $(LPAREN)region, &region_iter$(RPAREN);
 * while $(LPAREN)!gtk_source_region_iter_is_end $(LPAREN)&region_iter$(RPAREN)$(RPAREN)
 * {
 * GtkTextIter subregion_start;
 * GtkTextIter subregion_end;
 * if $(LPAREN)!gtk_source_region_iter_get_subregion $(LPAREN)&region_iter,
 * &subregion_start,
 * &subregion_end$(RPAREN)$(RPAREN)
 * {
 * break;
 * }
 * // Do something useful with the subregion.
 * gtk_source_region_iter_next $(LPAREN)&region_iter$(RPAREN);
 * }
 * ```
 */
class Region : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_region_get_type != &gidSymbolNotFound ? gtk_source_region_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(TextBuffer buffer)
  {
    GtkSourceRegion* _cretval;
    _cretval = gtk_source_region_new(buffer ? cast(GtkTextBuffer*)buffer.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Adds region_to_add to region.
   * region_to_add is not modified.
   * Params:
   *   regionToAdd = the #GtkSourceRegion to add to region, or %NULL.
   */
  void addRegion(Region regionToAdd)
  {
    gtk_source_region_add_region(cast(GtkSourceRegion*)cPtr, regionToAdd ? cast(GtkSourceRegion*)regionToAdd.cPtr(No.Dup) : null);
  }

  /**
   * Adds the subregion delimited by _start and _end to region.
   * Params:
   *   Start = the start of the subregion.
   *   End = the end of the subregion.
   */
  void addSubregion(TextIter Start, TextIter End)
  {
    gtk_source_region_add_subregion(cast(GtkSourceRegion*)cPtr, Start ? cast(GtkTextIter*)Start.cPtr(No.Dup) : null, End ? cast(GtkTextIter*)End.cPtr(No.Dup) : null);
  }

  /**
   * Gets the start and end bounds of the region.
   * Params:
   *   start = iterator to initialize with the start of region,
   *     or %NULL.
   *   end = iterator to initialize with the end of region,
   *     or %NULL.
   * Returns: %TRUE if start and end have been set successfully $(LPAREN)if non-%NULL$(RPAREN),
   *   or %FALSE if the region is empty.
   */
  bool getBounds(out TextIter start, out TextIter end)
  {
    bool _retval;
    GtkTextIter _start;
    GtkTextIter _end;
    _retval = gtk_source_region_get_bounds(cast(GtkSourceRegion*)cPtr, &_start, &_end);
    start = new TextIter(cast(void*)&_start, No.Take);
    end = new TextIter(cast(void*)&_end, No.Take);
    return _retval;
  }

  TextBuffer getBuffer()
  {
    GtkTextBuffer* _cretval;
    _cretval = gtk_source_region_get_buffer(cast(GtkSourceRegion*)cPtr);
    auto _retval = ObjectG.getDObject!TextBuffer(cast(GtkTextBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Initializes a structRegionIter to the first subregion of region.
   * If region is empty, iter will be initialized to the end iterator.
   * Params:
   *   iter = iterator to initialize to the first subregion.
   */
  void getStartRegionIter(out RegionIter iter)
  {
    GtkSourceRegionIter _iter;
    gtk_source_region_get_start_region_iter(cast(GtkSourceRegion*)cPtr, &_iter);
    iter = new RegionIter(cast(void*)&_iter);
  }

  /**
   * Returns the intersection between region1 and region2.
   * region1 and region2 are not modified.
   * Params:
   *   region2 = a #GtkSourceRegion, or %NULL.
   * Returns: the intersection as a #GtkSourceRegion
   *   object.
   */
  Region intersectRegion(Region region2)
  {
    GtkSourceRegion* _cretval;
    _cretval = gtk_source_region_intersect_region(cast(GtkSourceRegion*)cPtr, region2 ? cast(GtkSourceRegion*)region2.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!Region(cast(GtkSourceRegion*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Returns the intersection between region and the subregion delimited by
   * _start and _end.
   * region is not modified.
   * Params:
   *   Start = the start of the subregion.
   *   End = the end of the subregion.
   * Returns: the intersection as a new
   *   #GtkSourceRegion.
   */
  Region intersectSubregion(TextIter Start, TextIter End)
  {
    GtkSourceRegion* _cretval;
    _cretval = gtk_source_region_intersect_subregion(cast(GtkSourceRegion*)cPtr, Start ? cast(GtkTextIter*)Start.cPtr(No.Dup) : null, End ? cast(GtkTextIter*)End.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!Region(cast(GtkSourceRegion*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Returns whether the region is empty.
   * A %NULL region is considered empty.
   * Returns: whether the region is empty.
   */
  bool isEmpty()
  {
    bool _retval;
    _retval = gtk_source_region_is_empty(cast(GtkSourceRegion*)cPtr);
    return _retval;
  }

  /**
   * Subtracts region_to_subtract from region.
   * region_to_subtract is not modified.
   * Params:
   *   regionToSubtract = the #GtkSourceRegion to subtract from
   *     region, or %NULL.
   */
  void subtractRegion(Region regionToSubtract)
  {
    gtk_source_region_subtract_region(cast(GtkSourceRegion*)cPtr, regionToSubtract ? cast(GtkSourceRegion*)regionToSubtract.cPtr(No.Dup) : null);
  }

  /**
   * Subtracts the subregion delimited by _start and _end from region.
   * Params:
   *   Start = the start of the subregion.
   *   End = the end of the subregion.
   */
  void subtractSubregion(TextIter Start, TextIter End)
  {
    gtk_source_region_subtract_subregion(cast(GtkSourceRegion*)cPtr, Start ? cast(GtkTextIter*)Start.cPtr(No.Dup) : null, End ? cast(GtkTextIter*)End.cPtr(No.Dup) : null);
  }

  /**
   * Gets a string represention of region, for debugging purposes.
   * The returned string contains the character offsets of the subregions. It
   * doesn't include a newline character at the end of the string.
   * Returns: a string represention of region. Free
   *   with [GLib.Global.gfree] when no longer needed.
   */
  string toString_()
  {
    char* _cretval;
    _cretval = gtk_source_region_to_string(cast(GtkSourceRegion*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
