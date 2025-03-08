module gtk.misc;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    The #GtkMisc widget is an abstract widget which is not useful itself, but
  is used to derive subclasses which have alignment and padding attributes.
  
  The horizontal and vertical padding attributes allows extra space to be
  added around the widget.
  
  The horizontal and vertical alignment attributes enable the widget to be
  positioned within its allocated area. Note that if the widget is added to
  a container in such a way that it expands automatically to fill its
  allocated area, the alignment settings will not alter the widget's position.
  
  Note that the desired effect can in most cases be achieved by using the
  #GtkWidget:halign, #GtkWidget:valign and #GtkWidget:margin properties
  on the child widget, so GtkMisc should not be used in new code. To reflect
  this fact, all #GtkMisc API has been deprecated.
*/
class Misc : gtk.widget.Widget
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_misc_get_type != &gidSymbolNotFound ? gtk_misc_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Gets the X and Y alignment of the widget within its allocation.
    See [gtk.misc.Misc.setAlignment].
    Params:
      xalign =       location to store X alignment of misc, or null
      yalign =       location to store Y alignment of misc, or null
  
    Deprecated:     Use #GtkWidget alignment and margin properties.
  */
  void getAlignment(out float xalign, out float yalign)
  {
    gtk_misc_get_alignment(cast(GtkMisc*)cPtr, cast(float*)&xalign, cast(float*)&yalign);
  }

  /**
      Gets the padding in the X and Y directions of the widget.
    See [gtk.misc.Misc.setPadding].
    Params:
      xpad =       location to store padding in the X
               direction, or null
      ypad =       location to store padding in the Y
               direction, or null
  
    Deprecated:     Use #GtkWidget alignment and margin properties.
  */
  void getPadding(out int xpad, out int ypad)
  {
    gtk_misc_get_padding(cast(GtkMisc*)cPtr, cast(int*)&xpad, cast(int*)&ypad);
  }

  /**
      Sets the alignment of the widget.
    Params:
      xalign =       the horizontal alignment, from 0 (left) to 1 (right).
      yalign =       the vertical alignment, from 0 (top) to 1 (bottom).
  
    Deprecated:     Use #GtkWidget's alignment (#GtkWidget:halign and #GtkWidget:valign) and margin properties or #GtkLabel's #GtkLabel:xalign and #GtkLabel:yalign properties.
  */
  void setAlignment(float xalign, float yalign)
  {
    gtk_misc_set_alignment(cast(GtkMisc*)cPtr, xalign, yalign);
  }

  /**
      Sets the amount of space to add around the widget.
    Params:
      xpad =       the amount of space to add on the left and right of the widget,
          in pixels.
      ypad =       the amount of space to add on the top and bottom of the widget,
          in pixels.
  
    Deprecated:     Use #GtkWidget alignment and margin properties.
  */
  void setPadding(int xpad, int ypad)
  {
    gtk_misc_set_padding(cast(GtkMisc*)cPtr, xpad, ypad);
  }
}
