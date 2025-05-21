/// Module for [TreeMgrLabel] class
module gda.tree_mgr_label;

import gda.c.functions;
import gda.c.types;
import gda.tree_manager;
import gda.types;
import gid.gid;

/** */
class TreeMgrLabel : gda.tree_manager.TreeManager
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_tree_mgr_label_get_type != &gidSymbolNotFound ? gda_tree_mgr_label_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeMgrLabel self()
  {
    return this;
  }

  /**
      Creates a new #GdaTreeManager object which will add one tree node labelled label
  
      Params:
        label = a label string
      Returns: a new #GdaTreeManager object
  */
  this(string label)
  {
    GdaTreeManager* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gda_tree_mgr_label_new(_label);
    this(_cretval, Yes.Take);
  }
}
