module gtk.constraint_guide;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;

/**
    A [gtk.constraint_guide.ConstraintGuide] is an invisible layout element in a
  [gtk.constraint_layout.ConstraintLayout].
  
  The [gtk.constraint_layout.ConstraintLayout] treats guides like widgets. They
  can be used as the source or target of a [gtk.constraint.Constraint].
  
  Guides have a minimum, maximum and natural size. Depending
  on the constraints that are applied, they can act like a
  guideline that widgets can be aligned to, or like *flexible
  space*.
  
  Unlike a [gtk.widget.Widget], a [gtk.constraint_guide.ConstraintGuide] will not be drawn.
*/
class ConstraintGuide : gobject.object.ObjectG, gtk.constraint_target.ConstraintTarget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_constraint_guide_get_type != &gidSymbolNotFound ? gtk_constraint_guide_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ConstraintGuide self()
  {
    return this;
  }

  mixin ConstraintTargetT!();

  /**
      Creates a new [gtk.constraint_guide.ConstraintGuide] object.
    Returns:     a new [gtk.constraint_guide.ConstraintGuide] object.
  */
  this()
  {
    GtkConstraintGuide* _cretval;
    _cretval = gtk_constraint_guide_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the maximum size of guide.
    Params:
      width =       return location for the maximum width
      height =       return location for the maximum height
  */
  void getMaxSize(out int width, out int height)
  {
    gtk_constraint_guide_get_max_size(cast(GtkConstraintGuide*)cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Gets the minimum size of guide.
    Params:
      width =       return location for the minimum width
      height =       return location for the minimum height
  */
  void getMinSize(out int width, out int height)
  {
    gtk_constraint_guide_get_min_size(cast(GtkConstraintGuide*)cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Retrieves the name set using [gtk.constraint_guide.ConstraintGuide.setName].
    Returns:     the name of the guide
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_constraint_guide_get_name(cast(GtkConstraintGuide*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the natural size of guide.
    Params:
      width =       return location for the natural width
      height =       return location for the natural height
  */
  void getNatSize(out int width, out int height)
  {
    gtk_constraint_guide_get_nat_size(cast(GtkConstraintGuide*)cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Retrieves the strength set using [gtk.constraint_guide.ConstraintGuide.setStrength].
    Returns:     the strength of the constraint on the natural size
  */
  gtk.types.ConstraintStrength getStrength()
  {
    GtkConstraintStrength _cretval;
    _cretval = gtk_constraint_guide_get_strength(cast(GtkConstraintGuide*)cPtr);
    gtk.types.ConstraintStrength _retval = cast(gtk.types.ConstraintStrength)_cretval;
    return _retval;
  }

  /**
      Sets the maximum size of guide.
    
    If guide is attached to a [gtk.constraint_layout.ConstraintLayout],
    the constraints will be updated to reflect the new size.
    Params:
      width =       the new maximum width, or -1 to not change it
      height =       the new maximum height, or -1 to not change it
  */
  void setMaxSize(int width, int height)
  {
    gtk_constraint_guide_set_max_size(cast(GtkConstraintGuide*)cPtr, width, height);
  }

  /**
      Sets the minimum size of guide.
    
    If guide is attached to a [gtk.constraint_layout.ConstraintLayout],
    the constraints will be updated to reflect the new size.
    Params:
      width =       the new minimum width, or -1 to not change it
      height =       the new minimum height, or -1 to not change it
  */
  void setMinSize(int width, int height)
  {
    gtk_constraint_guide_set_min_size(cast(GtkConstraintGuide*)cPtr, width, height);
  }

  /**
      Sets a name for the given [gtk.constraint_guide.ConstraintGuide].
    
    The name is useful for debugging purposes.
    Params:
      name =       a name for the guide
  */
  void setName(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_constraint_guide_set_name(cast(GtkConstraintGuide*)cPtr, _name);
  }

  /**
      Sets the natural size of guide.
    
    If guide is attached to a [gtk.constraint_layout.ConstraintLayout],
    the constraints will be updated to reflect the new size.
    Params:
      width =       the new natural width, or -1 to not change it
      height =       the new natural height, or -1 to not change it
  */
  void setNatSize(int width, int height)
  {
    gtk_constraint_guide_set_nat_size(cast(GtkConstraintGuide*)cPtr, width, height);
  }

  /**
      Sets the strength of the constraint on the natural size of the
    given [gtk.constraint_guide.ConstraintGuide].
    Params:
      strength =       the strength of the constraint
  */
  void setStrength(gtk.types.ConstraintStrength strength)
  {
    gtk_constraint_guide_set_strength(cast(GtkConstraintGuide*)cPtr, strength);
  }
}
