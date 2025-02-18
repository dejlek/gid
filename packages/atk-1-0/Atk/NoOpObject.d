module Atk.NoOpObject;

import Atk.Action;
import Atk.ActionT;
import Atk.Component;
import Atk.ComponentT;
import Atk.Document;
import Atk.DocumentT;
import Atk.EditableText;
import Atk.EditableTextT;
import Atk.Hypertext;
import Atk.HypertextT;
import Atk.Image;
import Atk.ImageT;
import Atk.ObjectAtk;
import Atk.Selection;
import Atk.SelectionT;
import Atk.Table;
import Atk.TableCell;
import Atk.TableCellT;
import Atk.TableT;
import Atk.Text;
import Atk.TextT;
import Atk.Types;
import Atk.ValueAtk;
import Atk.ValueAtkT;
import Atk.Window;
import Atk.WindowT;
import Atk.c.functions;
import Atk.c.types;
import GObject.ObjectG;
import Gid.gid;

/**
 * An AtkObject which purports to implement all ATK interfaces.
 * An AtkNoOpObject is an AtkObject which purports to implement all
 * ATK interfaces. It is the type of AtkObject which is created if an
 * accessible object is requested for an object type for which no
 * factory type is specified.
 */
class NoOpObject : ObjectAtk, Action, Component, Document, EditableText, Hypertext, Image, Selection, Table, TableCell, Text, ValueAtk, Window
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())atk_no_op_object_get_type != &gidSymbolNotFound ? atk_no_op_object_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
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
  mixin ValueAtkT!();
  mixin WindowT!();
  alias getDescription = ObjectAtk.getDescription;

  alias getName = ObjectAtk.getName;

  alias setDescription = ObjectAtk.setDescription;


  /**
   * Provides a default $(LPAREN)non-functioning stub$(RPAREN) #AtkObject.
   * Application maintainers should not use this method.
   * Params:
   *   obj = a #GObject
   * Returns: a default $(LPAREN)non-functioning stub$(RPAREN) #AtkObject
   */
  this(ObjectG obj)
  {
    AtkObject* _cretval;
    _cretval = atk_no_op_object_new(obj ? cast(ObjectC*)obj.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
