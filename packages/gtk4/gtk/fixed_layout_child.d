module gtk.fixed_layout_child;

import gid.gid;
import gsk.transform;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_child;
import gtk.types;

/**
    [gtk.layout_child.LayoutChild] subclass for children in a [gtk.fixed_layout.FixedLayout].
*/
class FixedLayoutChild : gtk.layout_child.LayoutChild
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_fixed_layout_child_get_type != &gidSymbolNotFound ? gtk_fixed_layout_child_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
      Retrieves the transformation of the child.
    Returns:     a [gsk.transform.Transform]
  */
  gsk.transform.Transform getTransform()
  {
    GskTransform* _cretval;
    _cretval = gtk_fixed_layout_child_get_transform(cast(GtkFixedLayoutChild*)cPtr);
    auto _retval = _cretval ? new gsk.transform.Transform(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sets the transformation of the child of a [gtk.fixed_layout.FixedLayout].
    Params:
      transform =       a [gsk.transform.Transform]
  */
  void setTransform(gsk.transform.Transform transform)
  {
    gtk_fixed_layout_child_set_transform(cast(GtkFixedLayoutChild*)cPtr, transform ? cast(GskTransform*)transform.cPtr(No.Dup) : null);
  }
}
