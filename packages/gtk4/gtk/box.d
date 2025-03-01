module gtk.box;

import gid.global;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
 * The `GtkBox` widget arranges child widgets into a single row or column.
 * ![An example GtkBox](box.png)
 * Whether it is a row or column depends on the value of its
 * [gtk.orientable.Orientable.Orientation] property. Within the other
 * dimension, all children are allocated the same size. Of course, the
 * [gtk.widget.Widget.Align] and [gtk.widget.Widget.Align] properties
 * can be used on the children to influence their allocation.
 * Use repeated calls to [gtk.box.Box.append] to pack widgets into a
 * `GtkBox` from start to end. Use [gtk.box.Box.remove] to remove widgets
 * from the `GtkBox`. [gtk.box.Box.insertChildAfter] can be used to add
 * a child at a particular position.
 * Use [gtk.box.Box.setHomogeneous] to specify whether or not all children
 * of the `GtkBox` are forced to get the same amount of space.
 * Use [gtk.box.Box.setSpacing] to determine how much space will be minimally
 * placed between all children in the `GtkBox`. Note that spacing is added
 * *between* the children.
 * Use [gtk.box.Box.reorderChildAfter] to move a child to a different
 * place in the box.
 * # CSS nodes
 * `GtkBox` uses a single CSS node with name box.
 * # Accessibility
 * Until GTK 4.10, `GtkBox` used the `GTK_ACCESSIBLE_ROLE_GROUP` role.
 * Starting from GTK 4.12, `GtkBox` uses the `GTK_ACCESSIBLE_ROLE_GENERIC` role.
 */
class Box : Widget, Orientable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_box_get_type != &gidSymbolNotFound ? gtk_box_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin OrientableT!();

  /**
   * Creates a new `GtkBox`.
   * Params:
   *   orientation = the box’s orientation
   *   spacing = the number of pixels to place by default between children
   * Returns: a new `GtkBox`.
   */
  this(Orientation orientation, int spacing)
  {
    GtkWidget* _cretval;
    _cretval = gtk_box_new(orientation, spacing);
    this(_cretval, No.Take);
  }

  /**
   * Adds child as the last child to box.
   * Params:
   *   child = the `GtkWidget` to append
   */
  void append(Widget child)
  {
    gtk_box_append(cast(GtkBox*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
   * Gets the value set by [gtk.box.Box.setBaselineChild].
   * Returns: the baseline child
   */
  int getBaselineChild()
  {
    int _retval;
    _retval = gtk_box_get_baseline_child(cast(GtkBox*)cPtr);
    return _retval;
  }

  /**
   * Gets the value set by [gtk.box.Box.setBaselinePosition].
   * Returns: the baseline position
   */
  BaselinePosition getBaselinePosition()
  {
    GtkBaselinePosition _cretval;
    _cretval = gtk_box_get_baseline_position(cast(GtkBox*)cPtr);
    BaselinePosition _retval = cast(BaselinePosition)_cretval;
    return _retval;
  }

  /**
   * Returns whether the box is homogeneous $(LPAREN)all children are the
   * same size$(RPAREN).
   * Returns: %TRUE if the box is homogeneous.
   */
  bool getHomogeneous()
  {
    bool _retval;
    _retval = gtk_box_get_homogeneous(cast(GtkBox*)cPtr);
    return _retval;
  }

  /**
   * Gets the value set by [gtk.box.Box.setSpacing].
   * Returns: spacing between children
   */
  int getSpacing()
  {
    int _retval;
    _retval = gtk_box_get_spacing(cast(GtkBox*)cPtr);
    return _retval;
  }

  /**
   * Inserts child in the position after sibling in the list
   * of box children.
   * If sibling is %NULL, insert child at the first position.
   * Params:
   *   child = the `GtkWidget` to insert
   *   sibling = the sibling after which to insert child
   */
  void insertChildAfter(Widget child, Widget sibling)
  {
    gtk_box_insert_child_after(cast(GtkBox*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, sibling ? cast(GtkWidget*)sibling.cPtr(No.Dup) : null);
  }

  /**
   * Adds child as the first child to box.
   * Params:
   *   child = the `GtkWidget` to prepend
   */
  void prepend(Widget child)
  {
    gtk_box_prepend(cast(GtkBox*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
   * Removes a child widget from box.
   * The child must have been added before with
   * [gtk.box.Box.append], [gtk.box.Box.prepend], or
   * [gtk.box.Box.insertChildAfter].
   * Params:
   *   child = the child to remove
   */
  void remove(Widget child)
  {
    gtk_box_remove(cast(GtkBox*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
   * Moves child to the position after sibling in the list
   * of box children.
   * If sibling is %NULL, move child to the first position.
   * Params:
   *   child = the `GtkWidget` to move, must be a child of box
   *   sibling = the sibling to move child after
   */
  void reorderChildAfter(Widget child, Widget sibling)
  {
    gtk_box_reorder_child_after(cast(GtkBox*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, sibling ? cast(GtkWidget*)sibling.cPtr(No.Dup) : null);
  }

  /**
   * Sets the baseline child of a box.
   * This affects only vertical boxes.
   * Params:
   *   child = a child, or -1
   */
  void setBaselineChild(int child)
  {
    gtk_box_set_baseline_child(cast(GtkBox*)cPtr, child);
  }

  /**
   * Sets the baseline position of a box.
   * This affects only horizontal boxes with at least one baseline
   * aligned child. If there is more vertical space available than
   * requested, and the baseline is not allocated by the parent then
   * position is used to allocate the baseline with respect to the
   * extra space available.
   * Params:
   *   position = a `GtkBaselinePosition`
   */
  void setBaselinePosition(BaselinePosition position)
  {
    gtk_box_set_baseline_position(cast(GtkBox*)cPtr, position);
  }

  /**
   * Sets whether or not all children of box are given equal space
   * in the box.
   * Params:
   *   homogeneous = a boolean value, %TRUE to create equal allotments,
   *     %FALSE for variable allotments
   */
  void setHomogeneous(bool homogeneous)
  {
    gtk_box_set_homogeneous(cast(GtkBox*)cPtr, homogeneous);
  }

  /**
   * Sets the number of pixels to place between children of box.
   * Params:
   *   spacing = the number of pixels to put between children
   */
  void setSpacing(int spacing)
  {
    gtk_box_set_spacing(cast(GtkBox*)cPtr, spacing);
  }
}
