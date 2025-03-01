//!class Boxed pre
//!kind Boxed Boxed
//!inhibit init funcs

/// Class wrapper for boxed types
abstract class Boxed
{
  void* cInstancePtr; /// Pointer to the C boxed value

  /**
    * Constructor for wrapping a GObject boxed value
    * Params:
    *   boxPtr = The pointer to the boxed type instance
    *   owned = true if ownership of pointer should be taken by the D object, false to do a box copy of it
    */
  this(void* boxPtr, bool owned)
  {
    if (!boxPtr)
      throw new GidConstructException("Null instance pointer for " ~ typeid(this).name);

    if (!owned)
    {
      auto type = gType;
      this.cInstancePtr = g_boxed_copy(type, boxPtr);
    }
    else
      this.cInstancePtr = boxPtr;
  }

  /**
    * Constructor for duplicating a wrapped boxed type value.
    */
  this(Boxed boxed)
  {
    this(boxed.cInstancePtr, false);
  }

  ~this()
  {
    if (cInstancePtr) // Might be null if an exception occurred during construction
      g_boxed_free(gType, cInstancePtr);
  }

  /**
   * Get the GType of this boxed type.
   * Returns: The GObject GType
   */
  static GType getType()
  {
    return cast(GType)0; // Gets overridden by derived boxed types
  }

  /**
   * Boxed GType property.
   * Returns: The GType of the Boxed class.
   */
  @property GType gType()
  {
    return getType;
  }

  /**
   * Make a copy of the wrapped C boxed data.
   * Returns: Copy of the boxed type
   */
  void* copy_()
  {
    return cast(void*)g_boxed_copy(gType, cInstancePtr);
  }

  /**
   * Copy a C boxed value using g_boxed_copy.
   * Params:
   *   T = The D boxed type
   *   cBoxed = The C boxed pointer
   * Returns: A copy of the boxed type
   */
  static void* boxedCopy(T)(void* cBoxed)
  {
    return g_boxed_copy(T.getType, cBoxed);
  }

  /**
   * Free a C boxed value using g_boxed_free.
   * Params:
   *   T = The D boxed type
   *   cBoxed = The C boxed pointer
   */
  static void boxedFree(T)(void* cBoxed)
  {
    g_boxed_free(T.getType, cBoxed);
  }
}
