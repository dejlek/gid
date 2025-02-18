module Atk.Attribute;

import Atk.Types;
import Atk.c.functions;
import Atk.c.types;
import Gid.gid;

/**
 * AtkAttribute is a string name/value pair representing a generic
 * attribute. This can be used to expose additional information from
 * an accessible object as a whole $(LPAREN)see [Atk.ObjectAtk.getAttributes]$(RPAREN)
 * or an document $(LPAREN)see [Atk.Document.getAttributes]$(RPAREN). In the case of
 * text attributes $(LPAREN)see [Atk.Text.getDefaultAttributes]$(RPAREN),
 * #AtkTextAttribute enum defines all the possible text attribute
 * names. You can use [Atk.Global.textAttributeGetName] to get the string
 * name from the enum value. See also [Atk.Global.textAttributeForName]
 * and [Atk.Global.textAttributeGetValue] for more information.
 * A string name/value pair representing a generic attribute.
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
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string name()
  {
    return (cast(AtkAttribute*)cPtr).name.fromCString(No.Free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(AtkAttribute*)cPtr).name);
    (cast(AtkAttribute*)cPtr).name = propval.toCString(Yes.Alloc);
  }

  @property string value()
  {
    return (cast(AtkAttribute*)cPtr).value.fromCString(No.Free);
  }

  @property void value(string propval)
  {
    safeFree(cast(void*)(cast(AtkAttribute*)cPtr).value);
    (cast(AtkAttribute*)cPtr).value = propval.toCString(Yes.Alloc);
  }
}
