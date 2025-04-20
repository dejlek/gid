/// Module for [AttrShape] class
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for pango.attr_shape.AttrShape");

    cInstance = *cast(PangoAttrShape*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `attr` field.
      Returns: the common portion of the attribute
  */
  @property pango.attribute.Attribute attr()
  {
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrShape*)cPtr).attr);
  }

  /**
      Get `inkRect` field.
      Returns: the ink rectangle to restrict to
  */
  @property pango.types.Rectangle inkRect()
  {
    return cToD!(pango.types.Rectangle)(cast(void*)&(cast(PangoAttrShape*)cPtr).inkRect);
  }

  /**
      Set `inkRect` field.
      Params:
        propval = the ink rectangle to restrict to
  */
  @property void inkRect(pango.types.Rectangle propval)
  {
    (cast(PangoAttrShape*)cPtr).inkRect = propval;
  }

  /**
      Get `logicalRect` field.
      Returns: the logical rectangle to restrict to
  */
  @property pango.types.Rectangle logicalRect()
  {
    return cToD!(pango.types.Rectangle)(cast(void*)&(cast(PangoAttrShape*)cPtr).logicalRect);
  }

  /**
      Set `logicalRect` field.
      Params:
        propval = the logical rectangle to restrict to
  */
  @property void logicalRect(pango.types.Rectangle propval)
  {
    (cast(PangoAttrShape*)cPtr).logicalRect = propval;
  }

  /**
      Get `copyFunc` field.
      Returns: copy function for the user data
  */
  @property PangoAttrDataCopyFunc copyFunc()
  {
    return (cast(PangoAttrShape*)cPtr).copyFunc;
  }

  /**
      Set `copyFunc` field.
      Params:
        propval = copy function for the user data
  */

  @property void copyFunc(PangoAttrDataCopyFunc propval)
  {
    (cast(PangoAttrShape*)cPtr).copyFunc = propval;
  }

  /**
      Get `destroyFunc` field.
      Returns: destroy function for the user data
  */
  @property GDestroyNotify destroyFunc()
  {
    return (cast(PangoAttrShape*)cPtr).destroyFunc;
  }

  /**
      Set `destroyFunc` field.
      Params:
        propval = destroy function for the user data
  */

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
        inkRect = ink rectangle to assign to each character
        logicalRect = logical rectangle to assign to each character
      Returns: the newly allocated
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
