module gtk.alignment;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    The #GtkAlignment widget controls the alignment and size of its child widget.
  It has four settings: xscale, yscale, xalign, and yalign.
  
  The scale settings are used to specify how much the child widget should
  expand to fill the space allocated to the #GtkAlignment.
  The values can range from 0 (meaning the child doesn’t expand at all) to
  1 (meaning the child expands to fill all of the available space).
  
  The align settings are used to place the child widget within the available
  area. The values range from 0 (top or left) to 1 (bottom or right).
  Of course, if the scale settings are both set to 1, the alignment settings
  have no effect.
  
  GtkAlignment has been deprecated in 3.14 and should not be used in
  newly-written code. The desired effect can be achieved by using the
  #GtkWidget:halign, #GtkWidget:valign and #GtkWidget:margin properties on the
  child widget.
*/
class Alignment : gtk.bin.Bin
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_alignment_get_type != &gidSymbolNotFound ? gtk_alignment_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Alignment self()
  {
    return this;
  }

  /**
      Creates a new #GtkAlignment.
    Params:
      xalign =       the horizontal alignment of the child widget, from 0 (left) to 1
         (right).
      yalign =       the vertical alignment of the child widget, from 0 (top) to 1
         (bottom).
      xscale =       the amount that the child widget expands horizontally to fill up
         unused space, from 0 to 1.
         A value of 0 indicates that the child widget should never expand.
         A value of 1 indicates that the child widget will expand to fill all of the
         space allocated for the #GtkAlignment.
      yscale =       the amount that the child widget expands vertically to fill up
         unused space, from 0 to 1. The values are similar to xscale.
    Returns:     the new #GtkAlignment
  
    Deprecated:     Use #GtkWidget alignment and margin properties
  */
  this(float xalign, float yalign, float xscale, float yscale)
  {
    GtkWidget* _cretval;
    _cretval = gtk_alignment_new(xalign, yalign, xscale, yscale);
    this(_cretval, No.Take);
  }

  /**
      Gets the padding on the different sides of the widget.
    See gtk_alignment_set_padding ().
    Params:
      paddingTop =       location to store the padding for
            the top of the widget, or null
      paddingBottom =       location to store the padding
            for the bottom of the widget, or null
      paddingLeft =       location to store the padding
            for the left of the widget, or null
      paddingRight =       location to store the padding
            for the right of the widget, or null
  
    Deprecated:     Use #GtkWidget alignment and margin properties
  */
  void getPadding(out uint paddingTop, out uint paddingBottom, out uint paddingLeft, out uint paddingRight)
  {
    gtk_alignment_get_padding(cast(GtkAlignment*)cPtr, cast(uint*)&paddingTop, cast(uint*)&paddingBottom, cast(uint*)&paddingLeft, cast(uint*)&paddingRight);
  }

  /**
      Sets the #GtkAlignment values.
    Params:
      xalign =       the horizontal alignment of the child widget, from 0 (left) to 1
         (right).
      yalign =       the vertical alignment of the child widget, from 0 (top) to 1
         (bottom).
      xscale =       the amount that the child widget expands horizontally to fill up
         unused space, from 0 to 1.
         A value of 0 indicates that the child widget should never expand.
         A value of 1 indicates that the child widget will expand to fill all of the
         space allocated for the #GtkAlignment.
      yscale =       the amount that the child widget expands vertically to fill up
         unused space, from 0 to 1. The values are similar to xscale.
  
    Deprecated:     Use #GtkWidget alignment and margin properties
  */
  void set(float xalign, float yalign, float xscale, float yscale)
  {
    gtk_alignment_set(cast(GtkAlignment*)cPtr, xalign, yalign, xscale, yscale);
  }

  /**
      Sets the padding on the different sides of the widget.
    The padding adds blank space to the sides of the widget. For instance,
    this can be used to indent the child widget towards the right by adding
    padding on the left.
    Params:
      paddingTop =       the padding at the top of the widget
      paddingBottom =       the padding at the bottom of the widget
      paddingLeft =       the padding at the left of the widget
      paddingRight =       the padding at the right of the widget.
  
    Deprecated:     Use #GtkWidget alignment and margin properties
  */
  void setPadding(uint paddingTop, uint paddingBottom, uint paddingLeft, uint paddingRight)
  {
    gtk_alignment_set_padding(cast(GtkAlignment*)cPtr, paddingTop, paddingBottom, paddingLeft, paddingRight);
  }
}
