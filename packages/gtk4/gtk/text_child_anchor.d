module gtk.text_child_anchor;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
 * A `GtkTextChildAnchor` is a spot in a `GtkTextBuffer` where child widgets can
 * be “anchored”.
 * The anchor can have multiple widgets anchored, to allow for multiple views.
 */
class TextChildAnchor : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_text_child_anchor_get_type != &gidSymbolNotFound ? gtk_text_child_anchor_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkTextChildAnchor`.
   * Usually you would then insert it into a `GtkTextBuffer` with
   * [gtk.text_buffer.TextBuffer.insertChildAnchor]. To perform the
   * creation and insertion in one step, use the convenience
   * function [gtk.text_buffer.TextBuffer.createChildAnchor].
   * Returns: a new `GtkTextChildAnchor`
   */
  this()
  {
    GtkTextChildAnchor* _cretval;
    _cretval = gtk_text_child_anchor_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Creates a new `GtkTextChildAnchor` with the given replacement character.
   * Usually you would then insert it into a `GtkTextBuffer` with
   * [gtk.text_buffer.TextBuffer.insertChildAnchor].
   * Params:
   *   character =
   * Returns: a new `GtkTextChildAnchor`
   */
  static gtk.text_child_anchor.TextChildAnchor newWithReplacement(string character)
  {
    GtkTextChildAnchor* _cretval;
    const(char)* _character = character.toCString(No.Alloc);
    _cretval = gtk_text_child_anchor_new_with_replacement(_character);
    auto _retval = ObjectG.getDObject!(gtk.text_child_anchor.TextChildAnchor)(cast(GtkTextChildAnchor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Determines whether a child anchor has been deleted from
   * the buffer.
   * Keep in mind that the child anchor will be unreferenced
   * when removed from the buffer, so you need to hold your own
   * reference $(LPAREN)with [gobject.object.ObjectG.ref_]$(RPAREN) if you plan to use this
   * function — otherwise all deleted child anchors will also
   * be finalized.
   * Returns: %TRUE if the child anchor has been deleted from its buffer
   */
  bool getDeleted()
  {
    bool _retval;
    _retval = gtk_text_child_anchor_get_deleted(cast(GtkTextChildAnchor*)cPtr);
    return _retval;
  }

  /**
   * Gets a list of all widgets anchored at this child anchor.
   * The order in which the widgets are returned is not defined.
   * Returns: an
   *   array of widgets anchored at anchor
   */
  gtk.widget.Widget[] getWidgets()
  {
    GtkWidget** _cretval;
    uint _cretlength;
    _cretval = gtk_text_child_anchor_get_widgets(cast(GtkTextChildAnchor*)cPtr, &_cretlength);
    gtk.widget.Widget[] _retval;

    if (_cretval)
    {
      _retval = new gtk.widget.Widget[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = ObjectG.getDObject!(gtk.widget.Widget)(_cretval[i], No.Take);
    }
    return _retval;
  }
}
