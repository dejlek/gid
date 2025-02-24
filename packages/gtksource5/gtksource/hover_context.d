module gtksource.hover_context;

import gid.gid;
import gobject.object;
import gtk.text_iter;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;
import gtksource.view;

/**
 * Context for populating class@HoverDisplay contents.
 * `GtkSourceHoverContext` contains information about the request to populate
 * contents for a class@HoverDisplay.
 * It can be used to retrieve the class@View, class@Buffer, and
 * [Gtk.TextIter] for the regions of text which are being displayed.
 * Use [GtkSource.HoverContext.getBounds] to get the word that was
 * requested. [GtkSource.HoverContext.getIter] will get you the location
 * of the pointer when the request was made.
 */
class HoverContext : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_hover_context_get_type != &gidSymbolNotFound ? gtk_source_hover_context_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Gets the current word bounds of the hover.
   * If begin is non-%NULL, it will be set to the start position of the
   * current word being hovered.
   * If end is non-%NULL, it will be set to the end position for the
   * current word being hovered.
   * Params:
   *   begin = a #GtkTextIter
   *   end = a #GtkTextIter
   * Returns: %TRUE if the marks are still valid and begin or end was set.
   */
  bool getBounds(out TextIter begin, out TextIter end)
  {
    bool _retval;
    GtkTextIter _begin;
    GtkTextIter _end;
    _retval = gtk_source_hover_context_get_bounds(cast(GtkSourceHoverContext*)cPtr, &_begin, &_end);
    begin = new TextIter(cast(void*)&_begin, No.Take);
    end = new TextIter(cast(void*)&_end, No.Take);
    return _retval;
  }

  /**
   * A convenience function to get the buffer.
   * Returns: The #GtkSourceBuffer for the view
   */
  Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_hover_context_get_buffer(cast(GtkSourceHoverContext*)cPtr);
    auto _retval = ObjectG.getDObject!Buffer(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  bool getIter(TextIter iter)
  {
    bool _retval;
    _retval = gtk_source_hover_context_get_iter(cast(GtkSourceHoverContext*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null);
    return _retval;
  }

  View getView()
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_hover_context_get_view(cast(GtkSourceHoverContext*)cPtr);
    auto _retval = ObjectG.getDObject!View(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }
}
