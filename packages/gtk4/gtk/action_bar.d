module gtk.action_bar;

import gid.gid;
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
    [gtk.action_bar.ActionBar] is designed to present contextual actions.
  
  ![An example GtkActionBar](action-bar.png)
  
  It is expected to be displayed below the content and expand
  horizontally to fill the area.
  
  It allows placing children at the start or the end. In addition, it
  contains an internal centered box which is centered with respect to
  the full width of the box, even if the children at either side take
  up different amounts of space.
  
  # GtkActionBar as GtkBuildable
  
  The [gtk.action_bar.ActionBar] implementation of the [gtk.buildable.Buildable] interface supports
  adding children at the start or end sides by specifying “start” or “end” as
  the “type” attribute of a `<child>` element, or setting the center widget
  by specifying “center” value.
  
  # CSS nodes
  
  ```
  actionbar
  ╰── revealer
      ╰── box
          ├── box.start
          │   ╰── [start children]
          ├── [center widget]
          ╰── box.end
              ╰── [end children]
  ```
  
  A [gtk.action_bar.ActionBar]'s CSS node is called `actionbar`. It contains a `revealer`
  subnode, which contains a `box` subnode, which contains two `box` subnodes at
  the start and end of the action bar, with `start` and `end style classes
  respectively, as well as a center node that represents the center child.
  
  Each of the boxes contains children packed for that side.
*/
class ActionBar : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_action_bar_get_type != &gidSymbolNotFound ? gtk_action_bar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ActionBar self()
  {
    return this;
  }

  /**
      Creates a new [gtk.action_bar.ActionBar] widget.
    Returns:     a new [gtk.action_bar.ActionBar]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_action_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Retrieves the center bar widget of the bar.
    Returns:     the center [gtk.widget.Widget]
  */
  gtk.widget.Widget getCenterWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_action_bar_get_center_widget(cast(GtkActionBar*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the contents of the action bar are revealed.
    Returns:     the current value of the [gtk.action_bar.ActionBar.gboolean]
        property
  */
  bool getRevealed()
  {
    bool _retval;
    _retval = gtk_action_bar_get_revealed(cast(GtkActionBar*)cPtr);
    return _retval;
  }

  /**
      Adds child to action_bar, packed with reference to the
    end of the action_bar.
    Params:
      child =       the [gtk.widget.Widget] to be added to action_bar
  */
  void packEnd(gtk.widget.Widget child)
  {
    gtk_action_bar_pack_end(cast(GtkActionBar*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Adds child to action_bar, packed with reference to the
    start of the action_bar.
    Params:
      child =       the [gtk.widget.Widget] to be added to action_bar
  */
  void packStart(gtk.widget.Widget child)
  {
    gtk_action_bar_pack_start(cast(GtkActionBar*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Removes a child from action_bar.
    Params:
      child =       the [gtk.widget.Widget] to be removed
  */
  void remove(gtk.widget.Widget child)
  {
    gtk_action_bar_remove(cast(GtkActionBar*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Sets the center widget for the [gtk.action_bar.ActionBar].
    Params:
      centerWidget =       a widget to use for the center
  */
  void setCenterWidget(gtk.widget.Widget centerWidget = null)
  {
    gtk_action_bar_set_center_widget(cast(GtkActionBar*)cPtr, centerWidget ? cast(GtkWidget*)centerWidget.cPtr(No.Dup) : null);
  }

  /**
      Reveals or conceals the content of the action bar.
    
    Note: this does not show or hide action_bar in the
    [gtk.widget.Widget.gboolean] sense, so revealing has
    no effect if the action bar is hidden.
    Params:
      revealed =       The new value of the property
  */
  void setRevealed(bool revealed)
  {
    gtk_action_bar_set_revealed(cast(GtkActionBar*)cPtr, revealed);
  }
}
