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
    super(safeMalloc(SecretSchemaAttribute.sizeof), Yes.take);
  }

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"dup" dup = No.dup)
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

  @property string name()
  {
    return (cast(SecretSchemaAttribute*)cPtr).name.fromCString(No.free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(SecretSchemaAttribute*)cPtr).name);
    (cast(SecretSchemaAttribute*)cPtr).name = propval.toCString(Yes.alloc);
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
