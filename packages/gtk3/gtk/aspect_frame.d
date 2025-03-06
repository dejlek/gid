module gtk.aspect_frame;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.frame;
import gtk.types;

/**
    The #GtkAspectFrame is useful when you want
  pack a widget so that it can resize but always retains
  the same aspect ratio. For instance, one might be
  drawing a small preview of a larger image. #GtkAspectFrame
  derives from #GtkFrame, so it can draw a label and
  a frame around the child. The frame will be
  “shrink-wrapped” to the size of the child.
  
  # CSS nodes
  
  GtkAspectFrame uses a CSS node with name frame.
*/
class AspectFrame : gtk.frame.Frame
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_aspect_frame_get_type != &gidSymbolNotFound ? gtk_aspect_frame_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
      Create a new #GtkAspectFrame.
    Params:
      label =       Label text.
      xalign =       Horizontal alignment of the child within the allocation of
         the #GtkAspectFrame. This ranges from 0.0 (left aligned)
         to 1.0 (right aligned)
      yalign =       Vertical alignment of the child within the allocation of
         the #GtkAspectFrame. This ranges from 0.0 (top aligned)
         to 1.0 (bottom aligned)
      ratio =       The desired aspect ratio.
      obeyChild =       If true, ratio is ignored, and the aspect
         ratio is taken from the requistion of the child.
    Returns:     the new #GtkAspectFrame.
  */
  this(string label, float xalign, float yalign, float ratio, bool obeyChild)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_aspect_frame_new(_label, xalign, yalign, ratio, obeyChild);
    this(_cretval, No.Take);
  }

  /**
      Set parameters for an existing #GtkAspectFrame.
    Params:
      xalign =       Horizontal alignment of the child within the allocation of
         the #GtkAspectFrame. This ranges from 0.0 (left aligned)
         to 1.0 (right aligned)
      yalign =       Vertical alignment of the child within the allocation of
         the #GtkAspectFrame. This ranges from 0.0 (top aligned)
         to 1.0 (bottom aligned)
      ratio =       The desired aspect ratio.
      obeyChild =       If true, ratio is ignored, and the aspect
         ratio is taken from the requistion of the child.
  */
  void set(float xalign, float yalign, float ratio, bool obeyChild)
  {
    gtk_aspect_frame_set(cast(GtkAspectFrame*)cPtr, xalign, yalign, ratio, obeyChild);
  }
}
