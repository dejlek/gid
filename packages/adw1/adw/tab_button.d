module adw.tab_button;

import adw.c.functions;
import adw.c.types;
import adw.tab_view;
import adw.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A button that displays the number of `class@TabView` pages.
  
  <picture>
    <source srcset="tab-button-dark.png" media="(prefers-color-scheme: dark)">
    <img src="tab-button.png" alt="tab-button">
  </picture>
  
  [adw.tab_button.TabButton] is a button that displays the number of pages in a given
  [adw.tab_view.TabView], as well as whether one of the inactive pages needs attention.
  
  It's intended to be used as a visible indicator when there's no visible tab
  bar, typically opening an `class@TabOverview` on click, e.g. via the
  `overview.open` action name:
  
  ```xml
  <object class="AdwTabButton">
    <property name="view">view</property>
    <property name="action-name">overview.open</property>
  </object>
  ```
  
  ## CSS nodes
  
  [adw.tab_button.TabButton] has a main CSS node with name `tabbutton`.
  
  # Accessibility
  
  [adw.tab_button.TabButton] uses the [gtk.types.AccessibleRole.Button] role.
*/
class TabButton : gtk.widget.Widget, gtk.actionable.Actionable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_tab_button_get_type != &gidSymbolNotFound ? adw_tab_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin ActionableT!();

  /**
      Creates a new [adw.tab_button.TabButton].
    Returns:     the newly created [adw.tab_button.TabButton]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_tab_button_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the tab view self displays.
    Returns:     the tab view
  */
  adw.tab_view.TabView getView()
  {
    AdwTabView* _cretval;
    _cretval = adw_tab_button_get_view(cast(AdwTabButton*)cPtr);
    auto _retval = ObjectG.getDObject!(adw.tab_view.TabView)(cast(AdwTabView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the tab view to display.
    Params:
      view =       a tab view
  */
  void setView(adw.tab_view.TabView view = null)
  {
    adw_tab_button_set_view(cast(AdwTabButton*)cPtr, view ? cast(AdwTabView*)view.cPtr(No.Dup) : null);
  }

  /**
      Emitted to animate press then release.
    
    This is an action signal. Applications should never connect to this signal,
    but use the `signalTabButton::clicked` signal.
  
    ## Parameters
    $(LIST
      * $(B tabButton) the instance the signal is connected to
    )
  */
  alias ActivateCallbackDlg = void delegate(adw.tab_button.TabButton tabButton);

  /** ditto */
  alias ActivateCallbackFunc = void function(adw.tab_button.TabButton tabButton);

  /**
    Connect to Activate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto tabButton = getVal!(adw.tab_button.TabButton)(_paramVals);
      _dClosure.dlg(tabButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Emitted when the button has been activated (pressed and released).
  
    ## Parameters
    $(LIST
      * $(B tabButton) the instance the signal is connected to
    )
  */
  alias ClickedCallbackDlg = void delegate(adw.tab_button.TabButton tabButton);

  /** ditto */
  alias ClickedCallbackFunc = void function(adw.tab_button.TabButton tabButton);

  /**
    Connect to Clicked signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectClicked(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ClickedCallbackDlg) || is(T : ClickedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto tabButton = getVal!(adw.tab_button.TabButton)(_paramVals);
      _dClosure.dlg(tabButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("clicked", closure, after);
  }
}
