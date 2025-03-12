module gio.emblem;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.icon;
import gio.icon_mixin;
import gio.types;
import gobject.object;

/**
    [gio.emblem.Emblem] is an implementation of [gio.icon.Icon] that supports
  having an emblem, which is an icon with additional properties.
  It can than be added to a [gio.emblemed_icon.EmblemedIcon].
  
  Currently, only metainformation about the emblem's origin is
  supported. More may be added in the future.
*/
class Emblem : gobject.object.ObjectG, gio.icon.Icon
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_emblem_get_type != &gidSymbolNotFound ? g_emblem_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Emblem self()
  {
    return this;
  }

  mixin IconT!();

  /**
      Creates a new emblem for icon.
    Params:
      icon =       a GIcon containing the icon.
    Returns:     a new #GEmblem.
  */
  this(gio.icon.Icon icon)
  {
    GEmblem* _cretval;
    _cretval = g_emblem_new(icon ? cast(GIcon*)(cast(ObjectG)icon).cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new emblem for icon.
    Params:
      icon =       a GIcon containing the icon.
      origin =       a GEmblemOrigin enum defining the emblem's origin
    Returns:     a new #GEmblem.
  */
  static gio.emblem.Emblem newWithOrigin(gio.icon.Icon icon, gio.types.EmblemOrigin origin)
  {
    GEmblem* _cretval;
    _cretval = g_emblem_new_with_origin(icon ? cast(GIcon*)(cast(ObjectG)icon).cPtr(No.Dup) : null, origin);
    auto _retval = ObjectG.getDObject!(gio.emblem.Emblem)(cast(GEmblem*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gives back the icon from emblem.
    Returns:     a #GIcon. The returned object belongs to
               the emblem and should not be modified or freed.
  */
  gio.icon.Icon getIcon()
  {
    GIcon* _cretval;
    _cretval = g_emblem_get_icon(cast(GEmblem*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the origin of the emblem.
    Returns:     the origin of the emblem
  */
  gio.types.EmblemOrigin getOrigin()
  {
    GEmblemOrigin _cretval;
    _cretval = g_emblem_get_origin(cast(GEmblem*)cPtr);
    gio.types.EmblemOrigin _retval = cast(gio.types.EmblemOrigin)_cretval;
    return _retval;
  }
}
