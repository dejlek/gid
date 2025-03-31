/// Module for [ButtonBox] class
module gtk.button_box;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/** */
class ButtonBox : gtk.box.Box
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
    return cast(void function())gtk_button_box_get_type != &gidSymbolNotFound ? gtk_button_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override ButtonBox self()
  {
    return this;
  }

  /**
      Creates a new #GtkButtonBox.
  
      Params:
        orientation = the box's orientation.
      Returns: a new #GtkButtonBox.
  */
  this(gtk.types.Orientation orientation)
  {
    GtkWidget* _cretval;
    _cretval = gtk_button_box_new(orientation);
    this(_cretval, No.Take);
  }

  /**
      Returns whether the child is exempted from homogenous
      sizing.
  
      Params:
        child = a child of widget
      Returns: true if the child is not subject to homogenous sizing
  */
  bool getChildNonHomogeneous(gtk.widget.Widget child)
  {
    bool _retval;
    _retval = gtk_button_box_get_child_non_homogeneous(cast(GtkButtonBox*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns whether child should appear in a secondary group of children.
  
      Params:
        child = a child of widget
      Returns: whether child should appear in a secondary group of children.
  */
  bool getChildSecondary(gtk.widget.Widget child)
  {
    bool _retval;
    _retval = gtk_button_box_get_child_secondary(cast(GtkButtonBox*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Retrieves the method being used to arrange the buttons in a button box.
      Returns: the method used to lay out buttons in widget.
  */
  gtk.types.ButtonBoxStyle getLayout()
  {
    GtkButtonBoxStyle _cretval;
    _cretval = gtk_button_box_get_layout(cast(GtkButtonBox*)cPtr);
    gtk.types.ButtonBoxStyle _retval = cast(gtk.types.ButtonBoxStyle)_cretval;
    return _retval;
  }

  /**
      Sets whether the child is exempted from homogeous sizing.
  
      Params:
        child = a child of widget
        nonHomogeneous = the new value
  */
  void setChildNonHomogeneous(gtk.widget.Widget child, bool nonHomogeneous)
  {
    gtk_button_box_set_child_non_homogeneous(cast(GtkButtonBox*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, nonHomogeneous);
  }

  /**
      Sets whether child should appear in a secondary group of children.
      A typical use of a secondary child is the help button in a dialog.
      
      This group appears after the other children if the style
      is [gtk.types.ButtonBoxStyle.Start], [gtk.types.ButtonBoxStyle.Spread] or
      [gtk.types.ButtonBoxStyle.Edge], and before the other children if the style
      is [gtk.types.ButtonBoxStyle.End]. For horizontal button boxes, the definition
      of before/after depends on direction of the widget (see
      [gtk.widget.Widget.setDirection]). If the style is [gtk.types.ButtonBoxStyle.Start]
      or [gtk.types.ButtonBoxStyle.End], then the secondary children are aligned at
      the other end of the button box from the main children. For the
      other styles, they appear immediately next to the main children.
  
      Params:
        child = a child of widget
        isSecondary = if true, the child appears in a secondary group of the
                         button box.
  */
  void setChildSecondary(gtk.widget.Widget child, bool isSecondary)
  {
    gtk_button_box_set_child_secondary(cast(GtkButtonBox*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, isSecondary);
  }

  /**
      Changes the way buttons are arranged in their container.
  
      Params:
        layoutStyle = the new layout style
  */
  void setLayout(gtk.types.ButtonBoxStyle layoutStyle)
  {
    gtk_button_box_set_layout(cast(GtkButtonBox*)cPtr, layoutStyle);
  }
}
