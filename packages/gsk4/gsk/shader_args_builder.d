module gsk.shader_args_builder;

import gid.global;
import glib.bytes;
import gobject.boxed;
import graphene.vec2;
import graphene.vec3;
import graphene.vec4;
import gsk.c.functions;
import gsk.c.types;
import gsk.glshader;
import gsk.types;

/**
 * An object to build the uniforms data for a `GskGLShader`.
 */
class ShaderArgsBuilder : Boxed
{

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
    return cast(void function())gsk_shader_args_builder_get_type != &gidSymbolNotFound ? gsk_shader_args_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Allocates a builder that can be used to construct a new uniform data
   * chunk.
   * Params:
   *   shader = a `GskGLShader`
   *   initialValues = optional `GBytes` with initial values
   * Returns: The newly allocated builder, free with
   *   [gsk.shader_args_builder.ShaderArgsBuilder.unref]
   */
  this(GLShader shader, Bytes initialValues)
  {
    GskShaderArgsBuilder* _cretval;
    _cretval = gsk_shader_args_builder_new(shader ? cast(GskGLShader*)shader.cPtr(No.Dup) : null, initialValues ? cast(GBytes*)initialValues.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Sets the value of the uniform idx.
   * The uniform must be of bool type.
   * Params:
   *   idx = index of the uniform
   *   value = value to set the uniform to
   */
  void setBool(int idx, bool value)
  {
    gsk_shader_args_builder_set_bool(cast(GskShaderArgsBuilder*)cPtr, idx, value);
  }

  /**
   * Sets the value of the uniform idx.
   * The uniform must be of float type.
   * Params:
   *   idx = index of the uniform
   *   value = value to set the uniform to
   */
  void setFloat(int idx, float value)
  {
    gsk_shader_args_builder_set_float(cast(GskShaderArgsBuilder*)cPtr, idx, value);
  }

  /**
   * Sets the value of the uniform idx.
   * The uniform must be of int type.
   * Params:
   *   idx = index of the uniform
   *   value = value to set the uniform to
   */
  void setInt(int idx, int value)
  {
    gsk_shader_args_builder_set_int(cast(GskShaderArgsBuilder*)cPtr, idx, value);
  }

  /**
   * Sets the value of the uniform idx.
   * The uniform must be of uint type.
   * Params:
   *   idx = index of the uniform
   *   value = value to set the uniform to
   */
  void setUint(int idx, uint value)
  {
    gsk_shader_args_builder_set_uint(cast(GskShaderArgsBuilder*)cPtr, idx, value);
  }

  /**
   * Sets the value of the uniform idx.
   * The uniform must be of vec2 type.
   * Params:
   *   idx = index of the uniform
   *   value = value to set the uniform too
   */
  void setVec2(int idx, Vec2 value)
  {
    gsk_shader_args_builder_set_vec2(cast(GskShaderArgsBuilder*)cPtr, idx, value ? cast(graphene_vec2_t*)value.cPtr(No.Dup) : null);
  }

  /**
   * Sets the value of the uniform idx.
   * The uniform must be of vec3 type.
   * Params:
   *   idx = index of the uniform
   *   value = value to set the uniform too
   */
  void setVec3(int idx, Vec3 value)
  {
    gsk_shader_args_builder_set_vec3(cast(GskShaderArgsBuilder*)cPtr, idx, value ? cast(graphene_vec3_t*)value.cPtr(No.Dup) : null);
  }

  /**
   * Sets the value of the uniform idx.
   * The uniform must be of vec4 type.
   * Params:
   *   idx = index of the uniform
   *   value = value to set the uniform too
   */
  void setVec4(int idx, Vec4 value)
  {
    gsk_shader_args_builder_set_vec4(cast(GskShaderArgsBuilder*)cPtr, idx, value ? cast(graphene_vec4_t*)value.cPtr(No.Dup) : null);
  }

  /**
   * Creates a new `GBytes` args from the current state of the
   * given builder.
   * Any uniforms of the shader that have not been explicitly set on
   * the builder are zero-initialized.
   * The given `GskShaderArgsBuilder` is reset once this function returns;
   * you cannot call this function multiple times on the same builder instance.
   * This function is intended primarily for bindings. C code should use
   * [gsk.shader_args_builder.ShaderArgsBuilder.freeToArgs].
   * Returns: the newly allocated buffer with
   *   all the args added to builder
   */
  Bytes toArgs()
  {
    GBytes* _cretval;
    _cretval = gsk_shader_args_builder_to_args(cast(GskShaderArgsBuilder*)cPtr);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
