module pango.attr_shape;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    The [pango.attr_shape.AttrShape] structure is used to represent attributes which
  impose shape restrictions.
*/
class AttrShape
{
  PangoAttrShape cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Pango.AttrShape");

    cInstance = *cast(PangoAttrShape*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property pango.attribute.Attribute attr()
  {
    return new pango.attribute.Attribute(cast(PangoAttribute*)&(cast(PangoAttrShape*)cPtr).attr);
  }

  @property pango.types.Rectangle inkRect()
  {
    return (cast(PangoAttrShape*)cPtr).inkRect;
  }

  @property void inkRect(pango.types.Rectangle propval)
  {
    (cast(PangoAttrShape*)cPtr).inkRect = propval;
  }

  @property pango.types.Rectangle logicalRect()
  {
    return (cast(PangoAttrShape*)cPtr).logicalRect;
  }

  @property void logicalRect(pango.types.Rectangle propval)
  {
    (cast(PangoAttrShape*)cPtr).logicalRect = propval;
  }

  @property PangoAttrDataCopyFunc copyFunc()
  {
    return (cast(PangoAttrShape*)cPtr).copyFunc;
  }

  @property void copyFunc(PangoAttrDataCopyFunc propval)
  {
    (cast(PangoAttrShape*)cPtr).copyFunc = propval;
  }

  @property GDestroyNotify destroyFunc()
  {
    return (cast(PangoAttrShape*)cPtr).destroyFunc;
  }

  @property void destroyFunc(GDestroyNotify propval)
  {
    (cast(PangoAttrShape*)cPtr).destroyFunc = propval;
  }

  /**
      Create a new shape attribute.
    
    A shape is used to impose a particular ink and logical
    rectangle on the result of shaping a particular glyph.
    This might be used, for instance, for embedding a picture
    or a widget inside a [pango.layout.Layout].
    Params:
      inkRect =       ink rectangle to assign to each character
      logicalRect =       logical rectangle to assign to each character
    Returns:     the newly allocated
        [pango.attribute.Attribute], which should be freed with
        [pango.attribute.Attribute.destroy]
  */
  static pango.attribute.Attribute new_(pango.types.Rectangle inkRect, pango.types.Rectangle logicalRect)
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_shape_new(&inkRect, &logicalRect);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
