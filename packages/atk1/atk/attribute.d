module atk.attribute;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;

/**
    AtkAttribute is a string name/value pair representing a generic
  attribute. This can be used to expose additional information from
  an accessible object as a whole (see [atk.object.ObjectAtk.getAttributes])
  or an document (see [atk.document.Document.getAttributes]). In the case of
  text attributes (see [atk.text.Text.getDefaultAttributes]),
  #AtkTextAttribute enum defines all the possible text attribute
  names. You can use [atk.global.textAttributeGetName] to get the string
  name from the enum value. See also [atk.global.textAttributeForName]
  and [atk.global.textAttributeGetValue] for more information.
  
  A string name/value pair representing a generic attribute.
*/
class Attribute
{
  AtkAttribute cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Atk.Attribute");

    cInstance = *cast(AtkAttribute*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(AtkAttribute*)cPtr).name);
  }

  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(AtkAttribute*)cPtr).name);
    dToC(propval, cast(void*)&(cast(AtkAttribute*)cPtr).name);
  }

  @property string value()
  {
    return cToD!(string)(cast(void*)(cast(AtkAttribute*)cPtr).value);
  }

  @property void value(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(AtkAttribute*)cPtr).value);
    dToC(propval, cast(void*)&(cast(AtkAttribute*)cPtr).value);
  }
}
