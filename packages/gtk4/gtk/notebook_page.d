/// Module for [NotebookPage] class
module gtk.notebook_page;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    [gtk.notebook_page.NotebookPage] is an auxiliary object used by [gtk.notebook.Notebook].
*/
class NotebookPage : gobject.object.ObjectWrap
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
    return cast(void function())gtk_notebook_page_get_type != &gidSymbolNotFound ? gtk_notebook_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NotebookPage self()
  {
    return this;
  }

  /**
      Get `detachable` property.
      Returns: Whether the tab is detachable.
  */
  @property bool detachable()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("detachable");
  }

  /**
      Set `detachable` property.
      Params:
        propval = Whether the tab is detachable.
  */
  @property void detachable(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("detachable", propval);
  }

  /**
      Get `menuLabel` property.
      Returns: The text of the menu widget.
  */
  @property string menuLabel()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("menu-label");
  }

  /**
      Set `menuLabel` property.
      Params:
        propval = The text of the menu widget.
  */
  @property void menuLabel(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("menu-label", propval);
  }

  /**
      Get `position` property.
      Returns: The index of the child in the parent.
  */
  @property int position()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("position");
  }

  /**
      Set `position` property.
      Params:
        propval = The index of the child in the parent.
  */
  @property void position(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("position", propval);
  }

  /**
      Get `reorderable` property.
      Returns: Whether the tab is reorderable by user action.
  */
  @property bool reorderable()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("reorderable");
  }

  /**
      Set `reorderable` property.
      Params:
        propval = Whether the tab is reorderable by user action.
  */
  @property void reorderable(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("reorderable", propval);
  }

  /**
      Get `tabExpand` property.
      Returns: Whether to expand the child's tab.
  */
  @property bool tabExpand()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("tab-expand");
  }

  /**
      Set `tabExpand` property.
      Params:
        propval = Whether to expand the child's tab.
  */
  @property void tabExpand(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("tab-expand", propval);
  }

  /**
      Get `tabFill` property.
      Returns: Whether the child's tab should fill the allocated area.
  */
  @property bool tabFill()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("tab-fill");
  }

  /**
      Set `tabFill` property.
      Params:
        propval = Whether the child's tab should fill the allocated area.
  */
  @property void tabFill(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("tab-fill", propval);
  }

  /**
      Get `tabLabel` property.
      Returns: The text of the tab widget.
  */
  @property string tabLabel()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("tab-label");
  }

  /**
      Set `tabLabel` property.
      Params:
        propval = The text of the tab widget.
  */
  @property void tabLabel(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("tab-label", propval);
  }

  /**
      Returns the notebook child to which page belongs.
      Returns: the child to which page belongs
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_notebook_page_get_child(cast(GtkNotebookPage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}
