module gtk.flow_box_child;

import gid.global;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
 * `GtkFlowBoxChild` is the kind of widget that can be added to a `GtkFlowBox`.
 */
class FlowBoxChild : Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_flow_box_child_get_type != &gidSymbolNotFound ? gtk_flow_box_child_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkFlowBoxChild`.
   * This should only be used as a child of a `GtkFlowBox`.
   * Returns: a new `GtkFlowBoxChild`
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_flow_box_child_new();
    this(_cretval, No.Take);
  }

  /**
   * Marks child as changed, causing any state that depends on this
   * to be updated.
   * This affects sorting and filtering.
   * Note that calls to this method must be in sync with the data
   * used for the sorting and filtering functions. For instance, if
   * the list is mirroring some external data set, and *two* children
   * changed in the external data set when you call
   * [gtk.flow_box_child.FlowBoxChild.changed] on the first child, the sort function
   * must only read the new data for the first of the two changed
   * children, otherwise the resorting of the children will be wrong.
   * This generally means that if you don’t fully control the data
   * model, you have to duplicate the data that affects the sorting
   * and filtering functions into the widgets themselves.
   * Another alternative is to call [gtk.flow_box.FlowBox.invalidateSort]
   * on any model change, but that is more expensive.
   */
  void changed()
  {
    gtk_flow_box_child_changed(cast(GtkFlowBoxChild*)cPtr);
  }

  /**
   * Gets the child widget of self.
   * Returns: the child widget of self
   */
  Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_flow_box_child_get_child(cast(GtkFlowBoxChild*)cPtr);
    auto _retval = ObjectG.getDObject!Widget(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the current index of the child in its `GtkFlowBox` container.
   * Returns: the index of the child, or -1 if the child is not
   *   in a flow box
   */
  int getIndex()
  {
    int _retval;
    _retval = gtk_flow_box_child_get_index(cast(GtkFlowBoxChild*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the child is currently selected in its
   * `GtkFlowBox` container.
   * Returns: %TRUE if child is selected
   */
  bool isSelected()
  {
    bool _retval;
    _retval = gtk_flow_box_child_is_selected(cast(GtkFlowBoxChild*)cPtr);
    return _retval;
  }

  /**
   * Sets the child widget of self.
   * Params:
   *   child = the child widget
   */
  void setChild(Widget child)
  {
    gtk_flow_box_child_set_child(cast(GtkFlowBoxChild*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
   * Emitted when the user activates a child widget in a `GtkFlowBox`.
   * This can happen either by clicking or double-clicking,
   * or via a keybinding.
   * This is a [keybinding signal](class.SignalAction.html),
   * but it can be used by applications for their own purposes.
   * The default bindings are <kbd>Space</kbd> and <kbd>Enter</kbd>.
   *   flowBoxChild = the instance the signal is connected to
   */
  alias ActivateCallbackDlg = void delegate(FlowBoxChild flowBoxChild);
  alias ActivateCallbackFunc = void function(FlowBoxChild flowBoxChild);

  /**
   * Connect to Activate signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto flowBoxChild = getVal!FlowBoxChild(_paramVals);
      _dClosure.dlg(flowBoxChild);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}
