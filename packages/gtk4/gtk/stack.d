module gtk.stack;

import gid.global;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.selection_model;
import gtk.selection_model_mixin;
import gtk.stack_page;
import gtk.types;
import gtk.widget;

/**
 * `GtkStack` is a container which only shows one of its children
 * at a time.
 * In contrast to `GtkNotebook`, `GtkStack` does not provide a means
 * for users to change the visible child. Instead, a separate widget
 * such as [gtk.stack_switcher.StackSwitcher] or [gtk.stack_sidebar.StackSidebar] can
 * be used with `GtkStack` to provide this functionality.
 * Transitions between pages can be animated as slides or fades. This
 * can be controlled with [gtk.stack.Stack.setTransitionType].
 * These animations respect the property@Gtk.Settings:gtk-enable-animations
 * setting.
 * `GtkStack` maintains a [gtk.stack_page.StackPage] object for each added
 * child, which holds additional per-child properties. You
 * obtain the `GtkStackPage` for a child with [gtk.stack.Stack.getPage]
 * and you can obtain a `GtkSelectionModel` containing all the pages
 * with [gtk.stack.Stack.getPages].
 * # GtkStack as GtkBuildable
 * To set child-specific properties in a .ui file, create `GtkStackPage`
 * objects explicitly, and set the child widget as a property on it:
 * ```xml
 * <object class\="GtkStack" id\="stack">
 * <child>
 * <object class\="GtkStackPage">
 * <property name\="name">page1</property>
 * <property name\="title">In the beginning…</property>
 * <property name\="child">
 * <object class\="GtkLabel">
 * <property name\="label">It was dark</property>
 * </object>
 * </property>
 * </object>
 * </child>
 * ```
 * # CSS nodes
 * `GtkStack` has a single CSS node named stack.
 * # Accessibility
 * `GtkStack` uses the %GTK_ACCESSIBLE_ROLE_TAB_PANEL for the stack
 * pages, which are the accessible parent objects of the child widgets.
 */
class Stack : Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_stack_get_type != &gidSymbolNotFound ? gtk_stack_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkStack`.
   * Returns: a new `GtkStack`
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_stack_new();
    this(_cretval, No.Take);
  }

  /**
   * Adds a child to stack.
   * Params:
   *   child = the widget to add
   * Returns: the `GtkStackPage` for child
   */
  StackPage addChild(Widget child)
  {
    GtkStackPage* _cretval;
    _cretval = gtk_stack_add_child(cast(GtkStack*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!StackPage(cast(GtkStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Adds a child to stack.
   * The child is identified by the name.
   * Params:
   *   child = the widget to add
   *   name = the name for child
   * Returns: the `GtkStackPage` for child
   */
  StackPage addNamed(Widget child, string name)
  {
    GtkStackPage* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_stack_add_named(cast(GtkStack*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, _name);
    auto _retval = ObjectG.getDObject!StackPage(cast(GtkStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Adds a child to stack.
   * The child is identified by the name. The title
   * will be used by `GtkStackSwitcher` to represent
   * child in a tab bar, so it should be short.
   * Params:
   *   child = the widget to add
   *   name = the name for child
   *   title = a human-readable title for child
   * Returns: the `GtkStackPage` for child
   */
  StackPage addTitled(Widget child, string name, string title)
  {
    GtkStackPage* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_stack_add_titled(cast(GtkStack*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, _name, _title);
    auto _retval = ObjectG.getDObject!StackPage(cast(GtkStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Finds the child with the name given as the argument.
   * Returns %NULL if there is no child with this name.
   * Params:
   *   name = the name of the child to find
   * Returns: the requested child
   *   of the `GtkStack`
   */
  Widget getChildByName(string name)
  {
    GtkWidget* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_stack_get_child_by_name(cast(GtkStack*)cPtr, _name);
    auto _retval = ObjectG.getDObject!Widget(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets whether stack is horizontally homogeneous.
   * Returns: whether stack is horizontally homogeneous.
   */
  bool getHhomogeneous()
  {
    bool _retval;
    _retval = gtk_stack_get_hhomogeneous(cast(GtkStack*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the `GtkStack` is set up to interpolate between
   * the sizes of children on page switch.
   * Returns: %TRUE if child sizes are interpolated
   */
  bool getInterpolateSize()
  {
    bool _retval;
    _retval = gtk_stack_get_interpolate_size(cast(GtkStack*)cPtr);
    return _retval;
  }

  /**
   * Returns the `GtkStackPage` object for child.
   * Params:
   *   child = a child of stack
   * Returns: the `GtkStackPage` for child
   */
  StackPage getPage(Widget child)
  {
    GtkStackPage* _cretval;
    _cretval = gtk_stack_get_page(cast(GtkStack*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!StackPage(cast(GtkStackPage*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns a `GListModel` that contains the pages of the stack.
   * This can be used to keep an up-to-date view. The model also
   * implements [gtk.selection_model.SelectionModel] and can be used to track
   * and modify the visible page.
   * Returns: a `GtkSelectionModel` for the stack's children
   */
  SelectionModel getPages()
  {
    GtkSelectionModel* _cretval;
    _cretval = gtk_stack_get_pages(cast(GtkStack*)cPtr);
    auto _retval = ObjectG.getDObject!SelectionModel(cast(GtkSelectionModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Returns the amount of time $(LPAREN)in milliseconds$(RPAREN) that
   * transitions between pages in stack will take.
   * Returns: the transition duration
   */
  uint getTransitionDuration()
  {
    uint _retval;
    _retval = gtk_stack_get_transition_duration(cast(GtkStack*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the stack is currently in a transition from one page to
   * another.
   * Returns: %TRUE if the transition is currently running, %FALSE otherwise.
   */
  bool getTransitionRunning()
  {
    bool _retval;
    _retval = gtk_stack_get_transition_running(cast(GtkStack*)cPtr);
    return _retval;
  }

  /**
   * Gets the type of animation that will be used
   * for transitions between pages in stack.
   * Returns: the current transition type of stack
   */
  StackTransitionType getTransitionType()
  {
    GtkStackTransitionType _cretval;
    _cretval = gtk_stack_get_transition_type(cast(GtkStack*)cPtr);
    StackTransitionType _retval = cast(StackTransitionType)_cretval;
    return _retval;
  }

  /**
   * Gets whether stack is vertically homogeneous.
   * Returns: whether stack is vertically homogeneous.
   */
  bool getVhomogeneous()
  {
    bool _retval;
    _retval = gtk_stack_get_vhomogeneous(cast(GtkStack*)cPtr);
    return _retval;
  }

  /**
   * Gets the currently visible child of stack.
   * Returns %NULL if there are no visible children.
   * Returns: the visible child of the `GtkStack`
   */
  Widget getVisibleChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_stack_get_visible_child(cast(GtkStack*)cPtr);
    auto _retval = ObjectG.getDObject!Widget(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the name of the currently visible child of stack.
   * Returns %NULL if there is no visible child.
   * Returns: the name of the visible child
   *   of the `GtkStack`
   */
  string getVisibleChildName()
  {
    const(char)* _cretval;
    _cretval = gtk_stack_get_visible_child_name(cast(GtkStack*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Removes a child widget from stack.
   * Params:
   *   child = the child to remove
   */
  void remove(Widget child)
  {
    gtk_stack_remove(cast(GtkStack*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
   * Sets the `GtkStack` to be horizontally homogeneous or not.
   * If it is homogeneous, the `GtkStack` will request the same
   * width for all its children. If it isn't, the stack
   * may change width when a different child becomes visible.
   * Params:
   *   hhomogeneous = %TRUE to make stack horizontally homogeneous
   */
  void setHhomogeneous(bool hhomogeneous)
  {
    gtk_stack_set_hhomogeneous(cast(GtkStack*)cPtr, hhomogeneous);
  }

  /**
   * Sets whether or not stack will interpolate its size when
   * changing the visible child.
   * If the propertyGtk.Stack:interpolate-size property is set
   * to %TRUE, stack will interpolate its size between the current
   * one and the one it'll take after changing the visible child,
   * according to the set transition duration.
   * Params:
   *   interpolateSize = the new value
   */
  void setInterpolateSize(bool interpolateSize)
  {
    gtk_stack_set_interpolate_size(cast(GtkStack*)cPtr, interpolateSize);
  }

  /**
   * Sets the duration that transitions between pages in stack
   * will take.
   * Params:
   *   duration = the new duration, in milliseconds
   */
  void setTransitionDuration(uint duration)
  {
    gtk_stack_set_transition_duration(cast(GtkStack*)cPtr, duration);
  }

  /**
   * Sets the type of animation that will be used for
   * transitions between pages in stack.
   * Available types include various kinds of fades and slides.
   * The transition type can be changed without problems
   * at runtime, so it is possible to change the animation
   * based on the page that is about to become current.
   * Params:
   *   transition = the new transition type
   */
  void setTransitionType(StackTransitionType transition)
  {
    gtk_stack_set_transition_type(cast(GtkStack*)cPtr, transition);
  }

  /**
   * Sets the `GtkStack` to be vertically homogeneous or not.
   * If it is homogeneous, the `GtkStack` will request the same
   * height for all its children. If it isn't, the stack
   * may change height when a different child becomes visible.
   * Params:
   *   vhomogeneous = %TRUE to make stack vertically homogeneous
   */
  void setVhomogeneous(bool vhomogeneous)
  {
    gtk_stack_set_vhomogeneous(cast(GtkStack*)cPtr, vhomogeneous);
  }

  /**
   * Makes child the visible child of stack.
   * If child is different from the currently visible child,
   * the transition between the two will be animated with the
   * current transition type of stack.
   * Note that the child widget has to be visible itself
   * $(LPAREN)see [gtk.widget.Widget.show]$(RPAREN) in order to become the visible
   * child of stack.
   * Params:
   *   child = a child of stack
   */
  void setVisibleChild(Widget child)
  {
    gtk_stack_set_visible_child(cast(GtkStack*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
   * Makes the child with the given name visible.
   * Note that the child widget has to be visible itself
   * $(LPAREN)see [gtk.widget.Widget.show]$(RPAREN) in order to become the visible
   * child of stack.
   * Params:
   *   name = the name of the child to make visible
   *   transition = the transition type to use
   */
  void setVisibleChildFull(string name, StackTransitionType transition)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_stack_set_visible_child_full(cast(GtkStack*)cPtr, _name, transition);
  }

  /**
   * Makes the child with the given name visible.
   * If child is different from the currently visible child,
   * the transition between the two will be animated with the
   * current transition type of stack.
   * Note that the child widget has to be visible itself
   * $(LPAREN)see [gtk.widget.Widget.show]$(RPAREN) in order to become the visible
   * child of stack.
   * Params:
   *   name = the name of the child to make visible
   */
  void setVisibleChildName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_stack_set_visible_child_name(cast(GtkStack*)cPtr, _name);
  }
}
