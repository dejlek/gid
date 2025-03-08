module pango.attr_size;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    The [pango.attr_size.AttrSize] structure is used to represent attributes which
  set font size.
*/
class AttrSize
{
  PangoAttrSize cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Pango.AttrSize");

    cInstance = *cast(PangoAttrSize*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property pango.attribute.Attribute attr()
  {
    return new pango.attribute.Attribute(cast(PangoAttribute*)&(cast(PangoAttrSize*)cPtr).attr);
  }

  @property int size()
  {
    return (cast(PangoAttrSize*)cPtr).size;
  }

  @property void size(int propval)
  {
    (cast(PangoAttrSize*)cPtr).size = propval;
  }

  @property uint absolute()
  {
    return (cast(PangoAttrSize*)cPtr).absolute;
  }

  @property void absolute(uint propval)
  {
    (cast(PangoAttrSize*)cPtr).absolute = propval;
  }

  /**
      Create a new font-size attribute in fractional points.
    Params:
      size =       the font size, in `PANGO_SCALE`-ths of a point
    Returns:     the newly allocated
        [pango.attribute.Attribute], which should be freed with
        [pango.attribute.Attribute.destroy]
  */
  static pango.attribute.Attribute new_(int size)
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_size_new(size);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new font-size attribute in device units.
    Params:
      size =       the font size, in `PANGO_SCALE`-ths of a device unit
    Returns:     the newly allocated
        [pango.attribute.Attribute], which should be freed with
        [pango.attribute.Attribute.destroy]
  */
  static pango.attribute.Attribute newAbsolute(int size)
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_size_new_absolute(size);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
