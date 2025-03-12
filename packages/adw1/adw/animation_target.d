module adw.animation_target;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.object;

/**
    Represents a value `class@Animation` can animate.
*/
class AnimationTarget : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_animation_target_get_type != &gidSymbolNotFound ? adw_animation_target_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override AnimationTarget self()
  {
    return this;
  }
}
