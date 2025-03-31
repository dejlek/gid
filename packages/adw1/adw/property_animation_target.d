/// Module for [PropertyAnimationTarget] class
module adw.property_animation_target;

import adw.animation_target;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.object;
import gobject.param_spec;

/**
    An `class@AnimationTarget` changing the value of a property of a
    [gobject.object.ObjectG] instance.
*/
class PropertyAnimationTarget : adw.animation_target.AnimationTarget
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
    return cast(void function())adw_property_animation_target_get_type != &gidSymbolNotFound ? adw_property_animation_target_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override PropertyAnimationTarget self()
  {
    return this;
  }

  /**
      Creates a new [adw.property_animation_target.PropertyAnimationTarget] for the property_name property on
      object.
  
      Params:
        object = an object to be animated
        propertyName = the name of the property on object to animate
      Returns: the newly created [adw.property_animation_target.PropertyAnimationTarget]
  */
  this(gobject.object.ObjectG object, string propertyName)
  {
    AdwAnimationTarget* _cretval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _cretval = adw_property_animation_target_new(object ? cast(ObjectC*)object.cPtr(No.Dup) : null, _propertyName);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new [adw.property_animation_target.PropertyAnimationTarget] for the pspec property on
      object.
  
      Params:
        object = an object to be animated
        pspec = the param spec of the property on object to animate
      Returns: new newly created [adw.property_animation_target.PropertyAnimationTarget]
  */
  static adw.property_animation_target.PropertyAnimationTarget newForPspec(gobject.object.ObjectG object, gobject.param_spec.ParamSpec pspec)
  {
    AdwAnimationTarget* _cretval;
    _cretval = adw_property_animation_target_new_for_pspec(object ? cast(ObjectC*)object.cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(adw.property_animation_target.PropertyAnimationTarget)(cast(AdwAnimationTarget*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the object animated by self.
      
      The [adw.property_animation_target.PropertyAnimationTarget] instance does not hold a strong reference on
      the object; make sure the object is kept alive throughout the target's
      lifetime.
      Returns: the animated object
  */
  gobject.object.ObjectG getObject()
  {
    ObjectC* _cretval;
    _cretval = adw_property_animation_target_get_object(cast(AdwPropertyAnimationTarget*)cPtr);
    auto _retval = ObjectG.getDObject!(gobject.object.ObjectG)(cast(ObjectC*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [gobject.param_spec.ParamSpec] of the property animated by self.
      Returns: the animated property's [gobject.param_spec.ParamSpec]
  */
  gobject.param_spec.ParamSpec getPspec()
  {
    GParamSpec* _cretval;
    _cretval = adw_property_animation_target_get_pspec(cast(AdwPropertyAnimationTarget*)cPtr);
    auto _retval = _cretval ? new gobject.param_spec.ParamSpec(cast(GParamSpec*)_cretval, No.Take) : null;
    return _retval;
  }
}
