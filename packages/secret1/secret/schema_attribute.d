module secret.schema_attribute;

import gid.global;
import gobject.boxed;
import secret.c.functions;
import secret.c.types;
import secret.types;

/**
 * An attribute in a #SecretSchema.
 */
class SchemaAttribute : Boxed
{

  this()
  {
    super(safeMalloc(SecretSchemaAttribute.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())secret_schema_attribute_get_type != &gidSymbolNotFound ? secret_schema_attribute_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  @property string name()
  {
    return (cast(SecretSchemaAttribute*)cPtr).name.fromCString(No.Free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(SecretSchemaAttribute*)cPtr).name);
    (cast(SecretSchemaAttribute*)cPtr).name = propval.toCString(Yes.Alloc);
  }

  @property SchemaAttributeType type()
  {
    return cast(SchemaAttributeType)(cast(SecretSchemaAttribute*)cPtr).type;
  }

  @property void type(SchemaAttributeType propval)
  {
    (cast(SecretSchemaAttribute*)cPtr).type = cast(SecretSchemaAttributeType)propval;
  }
}
