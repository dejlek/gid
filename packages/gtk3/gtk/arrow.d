/// Module for [Arrow] class
module gtk.arrow;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.misc;
import gtk.types;

/**
    GtkArrow should be used to draw simple arrows that need to point in
    one of the four cardinal directions (up, down, left, or right).  The
    style of the arrow can be one of shadow in, shadow out, etched in, or
    etched out.  Note that these directions and style types may be
    amended in versions of GTK+ to come.
    
    GtkArrow will fill any space alloted to it, but since it is inherited
    from #GtkMisc, it can be padded and/or aligned, to fill exactly the
    space the programmer desires.
    
    Arrows are created with a call to [gtk.arrow.Arrow.new_].  The direction or
    style of an arrow can be changed after creation by using [gtk.arrow.Arrow.set].
    
    GtkArrow has been deprecated; you can simply use a #GtkImage with a
    suitable icon name, such as “pan-down-symbolic“. When replacing
    GtkArrow by an image, pay attention to the fact that GtkArrow is
    doing automatic flipping between #GTK_ARROW_LEFT and #GTK_ARROW_RIGHT,
    depending on the text direction. To get the same effect with an image,
    use the icon names “pan-start-symbolic“ and “pan-end-symbolic“, which
    react to the text direction.
*/
class Arrow : gtk.misc.Misc
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
    return cast(void function())gtk_arrow_get_type != &gidSymbolNotFound ? gtk_arrow_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override Arrow self()
  {
    return this;
  }

  /**
      Creates a new #GtkArrow widget.
  
      Params:
        arrowType = a valid #GtkArrowType.
        shadowType = a valid #GtkShadowType.
      Returns: the new #GtkArrow widget.
  
      Deprecated: Use a #GtkImage with a suitable icon.
  */
  this(gtk.types.ArrowType arrowType, gtk.types.ShadowType shadowType)
  {
    GtkWidget* _cretval;
    _cretval = gtk_arrow_new(arrowType, shadowType);
    this(_cretval, No.Take);
  }

  /**
      Sets the direction and style of the #GtkArrow, arrow.
  
      Params:
        arrowType = a valid #GtkArrowType.
        shadowType = a valid #GtkShadowType.
  
      Deprecated: Use a #GtkImage with a suitable icon.
  */
  void set(gtk.types.ArrowType arrowType, gtk.types.ShadowType shadowType)
  {
    gtk_arrow_set(cast(GtkArrow*)cPtr, arrowType, shadowType);
  }
}
