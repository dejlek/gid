/// Module for [BoxLayout] class
module gtk.box_layout;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_manager;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
    [gtk.box_layout.BoxLayout] is a layout manager that arranges children in a single
    row or column.
    
    Whether it is a row or column depends on the value of its
    [gtk.orientable.Orientable.Orientation] property. Within the other dimension
    all children all allocated the same size. The [gtk.box_layout.BoxLayout] will respect
    the [gtk.widget.Widget.Align] and [gtk.widget.Widget.Align]
    properties of each child widget.
    
    If you want all children to be assigned the same size, you can use
    the [gtk.box_layout.BoxLayout.gboolean] property.
    
    If you want to specify the amount of space placed between each child,
    you can use the [gtk.box_layout.BoxLayout.gint] property.
*/
class BoxLayout : gtk.layout_manager.LayoutManager, gtk.orientable.Orientable
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_box_layout_get_type != &gidSymbolNotFound ? gtk_box_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override BoxLayout self()
  {
    return this;
  }

  mixin OrientableT!();

  /**
      Creates a new [gtk.box_layout.BoxLayout].
  
      Params:
        orientation = the orientation for the new layout
      Returns: a new box layout
  */
  this(gtk.types.Orientation orientation)
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_box_layout_new(orientation);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the value set by [gtk.box_layout.BoxLayout.setBaselineChild].
      Returns: the index of the child that determines the baseline
            in vertical layout, or -1
  */
  int getBaselineChild()
  {
    int _retval;
    _retval = gtk_box_layout_get_baseline_child(cast(GtkBoxLayout*)cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.box_layout.BoxLayout.setBaselinePosition].
      Returns: the baseline position
  */
  gtk.types.BaselinePosition getBaselinePosition()
  {
    GtkBaselinePosition _cretval;
    _cretval = gtk_box_layout_get_baseline_position(cast(GtkBoxLayout*)cPtr);
    gtk.types.BaselinePosition _retval = cast(gtk.types.BaselinePosition)_cretval;
    return _retval;
  }

  /**
      Returns whether the layout is set to be homogeneous.
      Returns: true if the layout is homogeneous
  */
  bool getHomogeneous()
  {
    bool _retval;
    _retval = gtk_box_layout_get_homogeneous(cast(GtkBoxLayout*)cPtr);
    return _retval;
  }

  /**
      Returns the space that box_layout puts between children.
      Returns: the spacing of the layout
  */
  uint getSpacing()
  {
    uint _retval;
    _retval = gtk_box_layout_get_spacing(cast(GtkBoxLayout*)cPtr);
    return _retval;
  }

  /**
      Sets the index of the child that determines the baseline
      in vertical layout.
  
      Params:
        child = the child position, or -1
  */
  void setBaselineChild(int child)
  {
    gtk_box_layout_set_baseline_child(cast(GtkBoxLayout*)cPtr, child);
  }

  /**
      Sets the baseline position of a box layout.
      
      The baseline position affects only horizontal boxes with at least one
      baseline aligned child. If there is more vertical space available than
      requested, and the baseline is not allocated by the parent then the
      given position is used to allocate the baseline within the extra
      space available.
  
      Params:
        position = a [gtk.types.BaselinePosition]
  */
  void setBaselinePosition(gtk.types.BaselinePosition position)
  {
    gtk_box_layout_set_baseline_position(cast(GtkBoxLayout*)cPtr, position);
  }

  /**
      Sets whether the box layout will allocate the same
      size to all children.
  
      Params:
        homogeneous = true to set the box layout as homogeneous
  */
  void setHomogeneous(bool homogeneous)
  {
    gtk_box_layout_set_homogeneous(cast(GtkBoxLayout*)cPtr, homogeneous);
  }

  /**
      Sets how much spacing to put between children.
  
      Params:
        spacing = the spacing to apply between children
  */
  void setSpacing(uint spacing)
  {
    gtk_box_layout_set_spacing(cast(GtkBoxLayout*)cPtr, spacing);
  }
}
