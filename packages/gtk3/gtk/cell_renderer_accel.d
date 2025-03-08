module gtk.cell_renderer_accel;

import gdk.types;
import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer_text;
import gtk.types;

/**
    #GtkCellRendererAccel displays a keyboard accelerator (i.e. a key
  combination like `Control + a`). If the cell renderer is editable,
  the accelerator can be changed by simply typing the new combination.
  
  The #GtkCellRendererAccel cell renderer was added in GTK+ 2.10.
*/
class CellRendererAccel : gtk.cell_renderer_text.CellRendererText
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_cell_renderer_accel_get_type != &gidSymbolNotFound ? gtk_cell_renderer_accel_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new #GtkCellRendererAccel.
    Returns:     the new cell renderer
  */
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_accel_new();
    this(_cretval, No.Take);
  }

  /**
      Gets emitted when the user has removed the accelerator.
  
    ## Parameters
    $(LIST
      * $(B pathString)       the path identifying the row of the edited cell
      * $(B cellRendererAccel) the instance the signal is connected to
    )
  */
  alias AccelClearedCallbackDlg = void delegate(string pathString, gtk.cell_renderer_accel.CellRendererAccel cellRendererAccel);

  /** ditto */
  alias AccelClearedCallbackFunc = void function(string pathString, gtk.cell_renderer_accel.CellRendererAccel cellRendererAccel);

  /**
    Connect to AccelCleared signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectAccelCleared(T)(T callback, Flag!"After" after = No.After)
  if (is(T : AccelClearedCallbackDlg) || is(T : AccelClearedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto cellRendererAccel = getVal!(gtk.cell_renderer_accel.CellRendererAccel)(_paramVals);
      auto pathString = getVal!(string)(&_paramVals[1]);
      _dClosure.dlg(pathString, cellRendererAccel);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accel-cleared", closure, after);
  }

  /**
      Gets emitted when the user has selected a new accelerator.
  
    ## Parameters
    $(LIST
      * $(B pathString)       the path identifying the row of the edited cell
      * $(B accelKey)       the new accelerator keyval
      * $(B accelMods)       the new acclerator modifier mask
      * $(B hardwareKeycode)       the keycode of the new accelerator
      * $(B cellRendererAccel) the instance the signal is connected to
    )
  */
  alias AccelEditedCallbackDlg = void delegate(string pathString, uint accelKey, gdk.types.ModifierType accelMods, uint hardwareKeycode, gtk.cell_renderer_accel.CellRendererAccel cellRendererAccel);

  /** ditto */
  alias AccelEditedCallbackFunc = void function(string pathString, uint accelKey, gdk.types.ModifierType accelMods, uint hardwareKeycode, gtk.cell_renderer_accel.CellRendererAccel cellRendererAccel);

  /**
    Connect to AccelEdited signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectAccelEdited(T)(T callback, Flag!"After" after = No.After)
  if (is(T : AccelEditedCallbackDlg) || is(T : AccelEditedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto cellRendererAccel = getVal!(gtk.cell_renderer_accel.CellRendererAccel)(_paramVals);
      auto pathString = getVal!(string)(&_paramVals[1]);
      auto accelKey = getVal!(uint)(&_paramVals[2]);
      auto accelMods = getVal!(gdk.types.ModifierType)(&_paramVals[3]);
      auto hardwareKeycode = getVal!(uint)(&_paramVals[4]);
      _dClosure.dlg(pathString, accelKey, accelMods, hardwareKeycode, cellRendererAccel);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accel-edited", closure, after);
  }
}
