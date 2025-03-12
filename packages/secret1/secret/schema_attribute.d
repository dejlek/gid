module secret.schema_attribute;

import gid.gid;
import gobject.boxed;
import secret.c.functions;
import secret.c.types;
import secret.types;

/**
    An attribute in a #SecretSchema.
*/
class SchemaAttribute : gobject.boxed.Boxed
{

  this()
  {
    super(gMalloc(SecretSchemaAttribute.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())secret_schema_attribute_get_type != &gidSymbolNotFound ? secret_schema_attribute_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override SchemaAttribute self()
  {
    return this;
  }

  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(SecretSchemaAttribute*)cPtr).name);
  }

  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(SecretSchemaAttribute*)cPtr).name);
    dToC(propval, cast(void*)&(cast(SecretSchemaAttribute*)cPtr).name);
  }

  @property secret.types.SchemaAttributeType type()
  {
    return cast(secret.types.SchemaAttributeType)(cast(SecretSchemaAttribute*)cPtr).type;
  }

  @property void type(secret.types.SchemaAttributeType propval)
  {
    (cast(SecretSchemaAttribute*)cPtr).type = cast(SecretSchemaAttributeType)propval;
  }
}
