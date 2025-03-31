/// Module for [Scrollable] interface mixin
module gtk.scrollable_mixin;

public import gtk.scrollable_iface_proxy;
public import gid.gid;
public import gobject.object;
public import gtk.adjustment;
public import gtk.border;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    [gtk.scrollable.Scrollable] is an interface for widgets with native scrolling ability.
    
    To implement this interface you should override the
    [gtk.scrollable.Scrollable.Adjustment] and
    [gtk.scrollable.Scrollable.Adjustment] properties.
    
    ## Creating a scrollable widget
    
    All scrollable widgets should do the following.
    
    $(LIST
      * When a parent widget sets the scrollable child widget’s adjustments,
        the widget should connect to the `signal@Gtk.Adjustment::value-changed`
        signal. The child widget should then populate the adjustments’ properties
        as soon as possible, which usually means queueing an allocation right away
        and populating the properties in the `vfunc@Gtk.Widget.size_allocate`
        implementation.
      
      * Because its preferred size is the size for a fully expanded widget,
        the scrollable widget must be able to cope with underallocations.
        This means that it must accept any value passed to its
        `vfunc@Gtk.Widget.size_allocate` implementation.
      
      * When the parent allocates space to the scrollable child widget,
        the widget must ensure the adjustments’ property values are correct and up
        to date, for example using [gtk.adjustment.Adjustment.configure].
      
      * When any of the adjustments emits the `signal@Gtk.Adjustment::value-changed`
        signal, the scrollable widget should scroll its contents.
    )
*/
template ScrollableT()
{

  /**
      Returns the size of a non-scrolling border around the
      outside of the scrollable.
      
      An example for this would be treeview headers. GTK can use
      this information to display overlaid graphics, like the
      overshoot indication, at the right position.
  
      Params:
        border = return location for the results
      Returns: true if border has been set
  */
  override bool getBorder(out gtk.border.Border border)
  {
    bool _retval;
    GtkBorder _border;
    _retval = gtk_scrollable_get_border(cast(GtkScrollable*)cPtr, &_border);
    border = new gtk.border.Border(cast(void*)&_border, No.Take);
    return _retval;
  }

  /**
      Retrieves the [gtk.adjustment.Adjustment] used for horizontal scrolling.
      Returns: horizontal [gtk.adjustment.Adjustment].
  */
  override gtk.adjustment.Adjustment getHadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scrollable_get_hadjustment(cast(GtkScrollable*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the horizontal [gtk.types.ScrollablePolicy].
      Returns: The horizontal [gtk.types.ScrollablePolicy].
  */
  override gtk.types.ScrollablePolicy getHscrollPolicy()
  {
    GtkScrollablePolicy _cretval;
    _cretval = gtk_scrollable_get_hscroll_policy(cast(GtkScrollable*)cPtr);
    gtk.types.ScrollablePolicy _retval = cast(gtk.types.ScrollablePolicy)_cretval;
    return _retval;
  }

  /**
      Retrieves the [gtk.adjustment.Adjustment] used for vertical scrolling.
      Returns: vertical [gtk.adjustment.Adjustment].
  */
  override gtk.adjustment.Adjustment getVadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scrollable_get_vadjustment(cast(GtkScrollable*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the vertical [gtk.types.ScrollablePolicy].
      Returns: The vertical [gtk.types.ScrollablePolicy].
  */
  override gtk.types.ScrollablePolicy getVscrollPolicy()
  {
    GtkScrollablePolicy _cretval;
    _cretval = gtk_scrollable_get_vscroll_policy(cast(GtkScrollable*)cPtr);
    gtk.types.ScrollablePolicy _retval = cast(gtk.types.ScrollablePolicy)_cretval;
    return _retval;
  }

  /**
      Sets the horizontal adjustment of the [gtk.scrollable.Scrollable].
  
      Params:
        hadjustment = a [gtk.adjustment.Adjustment]
  */
  override void setHadjustment(gtk.adjustment.Adjustment hadjustment = null)
  {
    gtk_scrollable_set_hadjustment(cast(GtkScrollable*)cPtr, hadjustment ? cast(GtkAdjustment*)hadjustment.cPtr(No.Dup) : null);
  }

  /**
      Sets the [gtk.types.ScrollablePolicy].
      
      The policy determines whether horizontal scrolling should start
      below the minimum width or below the natural width.
  
      Params:
        policy = the horizontal [gtk.types.ScrollablePolicy]
  */
  override void setHscrollPolicy(gtk.types.ScrollablePolicy policy)
  {
    gtk_scrollable_set_hscroll_policy(cast(GtkScrollable*)cPtr, policy);
  }

  /**
      Sets the vertical adjustment of the [gtk.scrollable.Scrollable].
  
      Params:
        vadjustment = a [gtk.adjustment.Adjustment]
  */
  override void setVadjustment(gtk.adjustment.Adjustment vadjustment = null)
  {
    gtk_scrollable_set_vadjustment(cast(GtkScrollable*)cPtr, vadjustment ? cast(GtkAdjustment*)vadjustment.cPtr(No.Dup) : null);
  }

  /**
      Sets the [gtk.types.ScrollablePolicy].
      
      The policy determines whether vertical scrolling should start
      below the minimum height or below the natural height.
  
      Params:
        policy = the vertical [gtk.types.ScrollablePolicy]
  */
  override void setVscrollPolicy(gtk.types.ScrollablePolicy policy)
  {
    gtk_scrollable_set_vscroll_policy(cast(GtkScrollable*)cPtr, policy);
  }
}
