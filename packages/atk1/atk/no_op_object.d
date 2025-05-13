/// Module for [NoOpObject] class
module atk.no_op_object;

import atk.action;
import atk.action_mixin;
import atk.c.functions;
import atk.c.types;
import atk.component;
import atk.component_mixin;
import atk.document;
import atk.document_mixin;
import atk.editable_text;
import atk.editable_text_mixin;
import atk.hypertext;
import atk.hypertext_mixin;
import atk.image;
import atk.image_mixin;
import atk.object;
import atk.selection;
import atk.selection_mixin;
import atk.table;
import atk.table_cell;
import atk.table_cell_mixin;
import atk.table_mixin;
import atk.text;
import atk.text_mixin;
import atk.types;
import atk.value;
import atk.value_mixin;
import atk.window;
import atk.window_mixin;
import gid.gid;
import gobject.object;

/**
    An AtkObject which purports to implement all ATK interfaces.
    
    An AtkNoOpObject is an AtkObject which purports to implement all
    ATK interfaces. It is the type of AtkObject which is created if an
    accessible object is requested for an object type for which no
    factory type is specified.
*/
class NoOpObject : atk.object.ObjectWrap, atk.action.Action, atk.component.Component, atk.document.Document, atk.editable_text.EditableText, atk.hypertext.Hypertext, atk.image.Image, atk.selection.Selection, atk.table.Table, atk.table_cell.TableCell, atk.text.Text, atk.value.Value, atk.window.Window
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_no_op_object_get_type != &gidSymbolNotFound ? atk_no_op_object_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NoOpObject self()
  {
    return this;
  }

  mixin ActionT!();
  mixin ComponentT!();
  mixin DocumentT!();
  mixin EditableTextT!();
  mixin HypertextT!();
  mixin ImageT!();
  mixin SelectionT!();
  mixin TableT!();
  mixin TableCellT!();
  mixin TextT!();
  mixin ValueT!();
  mixin WindowT!();
  alias getDescription = atk.object.ObjectWrap.getDescription;
  alias getName = atk.object.ObjectWrap.getName;
  alias setDescription = atk.object.ObjectWrap.setDescription;

  /**
      Provides a default (non-functioning stub) #AtkObject.
      Application maintainers should not use this method.
  
      Params:
        obj = a #GObject
      Returns: a default (non-functioning stub) #AtkObject
  */
  this(gobject.object.ObjectWrap obj)
  {
    AtkObject* _cretval;
    _cretval = atk_no_op_object_new(obj ? cast(GObject*)obj._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
