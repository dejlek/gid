module atk.plug;

import atk.c.functions;
import atk.c.types;
import atk.component;
import atk.component_mixin;
import atk.object;
import atk.types;
import gid.gid;

/**
 * Toplevel for embedding into other processes
 * See class@AtkSocket
 */
class Plug : atk.object.ObjectAtk, atk.component.Component
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_plug_get_type != &gidSymbolNotFound ? atk_plug_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ComponentT!();

  /**
   * Creates a new #AtkPlug instance.
   * Returns: the newly created #AtkPlug
   */
  this()
  {
    AtkObject* _cretval;
    _cretval = atk_plug_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the unique ID of an #AtkPlug object, which can be used to
   * embed inside of an #AtkSocket using [atk.socket.Socket.embed].
   * Internally, this calls a class function that should be registered
   * by the IPC layer $(LPAREN)usually at-spi2-atk$(RPAREN). The implementor of an
   * #AtkPlug object should call this function $(LPAREN)after atk-bridge is
   * loaded$(RPAREN) and pass the value to the process implementing the
   * #AtkSocket, so it could embed the plug.
   * Returns: the unique ID for the plug
   */
  string getId()
  {
    char* _cretval;
    _cretval = atk_plug_get_id(cast(AtkPlug*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Sets child as accessible child of plug and plug as accessible parent of
   * child. child can be NULL.
   * In some cases, one can not use the AtkPlug type directly as accessible
   * object for the toplevel widget of the application. For instance in the gtk
   * case, GtkPlugAccessible can not inherit both from GtkWindowAccessible and
   * from AtkPlug. In such a case, one can create, in addition to the standard
   * accessible object for the toplevel widget, an AtkPlug object, and make the
   * former the child of the latter by calling [atk.plug.Plug.setChild].
   * Params:
   *   child = an #AtkObject to be set as accessible child of plug.
   */
  void setChild(atk.object.ObjectAtk child)
  {
    atk_plug_set_child(cast(AtkPlug*)cPtr, child ? cast(AtkObject*)child.cPtr(No.Dup) : null);
  }
}
