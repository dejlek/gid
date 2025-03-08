module gobject.types;

import gid.gid;
import gobject.binding;
import gobject.c.functions;
import gobject.c.types;
import gobject.closure;
import gobject.object;
import gobject.param_spec;
import gobject.value;


// Aliases

/** */
alias SignalCMarshaller = gobject.types.ClosureMarshal;

/** */
alias GType = gobject.c.types.GType;

// Enums

/** */
alias BindingFlags = GBindingFlags;

/** */
alias ConnectFlags = GConnectFlags;

/** */
alias ParamFlags = GParamFlags;

/** */
alias SignalFlags = GSignalFlags;

/** */
alias SignalMatchType = GSignalMatchType;

/** */
alias TypeDebugFlags = GTypeDebugFlags;

/** */
alias TypeFlags = GTypeFlags;

/** */
alias TypeFundamentalFlags = GTypeFundamentalFlags;

// Structs

/** */
alias ClosureNotifyData = GClosureNotifyData;

/** */
alias ParamSpecTypeInfo = GParamSpecTypeInfo;

/** */
alias SignalInvocationHint = GSignalInvocationHint;

/** */
alias TypeCValue = GTypeCValue;

/** */
alias TypeFundamentalInfo = GTypeFundamentalInfo;

// Callbacks

/**
    A function to be called to transform from_value to to_value.
  
  If this is the transform_to function of a binding, then from_value
  is the source_property on the source object, and to_value is the
  target_property on the target object. If this is the
  transform_from function of a [gobject.types.BindingFlags.bidirectional] binding,
  then those roles are reversed.

  ## Parameters
  $(LIST
    * $(B binding)       a #GBinding
    * $(B fromValue)       the #GValue containing the value to transform
    * $(B toValue)       the #GValue in which to store the transformed value
  )
  Returns:     true if the transformation was successful, and false
      otherwise
*/
alias BindingTransformFunc = bool delegate(gobject.binding.Binding binding, gobject.value.Value fromValue, gobject.value.Value toValue);

/**
    This function is provided by the user and should produce a copy
  of the passed in boxed structure.

  ## Parameters
  $(LIST
    * $(B boxed)       The boxed structure to be copied.
  )
  Returns:     The newly created copy of the boxed structure.
*/
alias BoxedCopyFunc = void* delegate(void* boxed);

/**
    This function is provided by the user and should free the boxed
  structure passed.

  ## Parameters
  $(LIST
    * $(B boxed)       The boxed structure to be freed.
  )
*/
alias BoxedFreeFunc = void delegate(void* boxed);

/**
    The type used for callback functions in structure definitions and function
  signatures.
  
  This doesn't mean that all callback functions must take no  parameters and
  return void. The required signature of a callback function is determined by
  the context in which is used (e.g. the signal to which it is connected).
  
  Use G_CALLBACK() to cast the callback function to a #GCallback.
*/
alias Callback = void delegate();

/**
    The type used for marshaller functions.

  ## Parameters
  $(LIST
    * $(B closure)       the #GClosure to which the marshaller belongs
    * $(B returnValue)       a #GValue to store the return
       value. May be null if the callback of closure doesn't return a
       value.
    * $(B paramValues)       an array of
       #GValues holding the arguments on which to invoke the
       callback of closure
    * $(B invocationHint)       the invocation hint given as the
       last argument to [gobject.closure.Closure.invoke]
  )
*/
alias ClosureMarshal = void delegate(gobject.closure.Closure closure, gobject.value.Value returnValue, gobject.value.Value[] paramValues, void* invocationHint);

/**
    The type used for the various notification callbacks which can be registered
  on closures.

  ## Parameters
  $(LIST
    * $(B closure)       the #GClosure on which the notification is emitted
  )
*/
alias ClosureNotify = void delegate(gobject.closure.Closure closure);

/**
    The type of the finalize function of #GObjectClass.

  ## Parameters
  $(LIST
    * $(B object)       the #GObject being finalized
  )
*/
alias ObjectFinalizeFunc = void delegate(gobject.object.ObjectG object);

/**
    The type of the get_property function of #GObjectClass.

  ## Parameters
  $(LIST
    * $(B object)       a #GObject
    * $(B propertyId)       the numeric id under which the property was registered with
       [gobject.object_class.ObjectClass.installProperty].
    * $(B value)       a #GValue to return the property value in
    * $(B pspec)       the #GParamSpec describing the property
  )
*/
alias ObjectGetPropertyFunc = void delegate(gobject.object.ObjectG object, uint propertyId, gobject.value.Value value, gobject.param_spec.ParamSpec pspec);

/**
    The type of the set_property function of #GObjectClass.

  ## Parameters
  $(LIST
    * $(B object)       a #GObject
    * $(B propertyId)       the numeric id under which the property was registered with
       [gobject.object_class.ObjectClass.installProperty].
    * $(B value)       the new value for the property
    * $(B pspec)       the #GParamSpec describing the property
  )
*/
alias ObjectSetPropertyFunc = void delegate(gobject.object.ObjectG object, uint propertyId, gobject.value.Value value, gobject.param_spec.ParamSpec pspec);

/**
    The signal accumulator is a special callback function that can be used
  to collect return values of the various callbacks that are called
  during a signal emission.
  
  The signal accumulator is specified at signal creation time, if it is
  left null, no accumulation of callback return values is performed.
  The return value of signal emissions is then the value returned by the
  last callback.

  ## Parameters
  $(LIST
    * $(B ihint)       Signal invocation hint, see #GSignalInvocationHint.
    * $(B returnAccu)       Accumulator to collect callback return values in, this
       is the return value of the current signal emission.
    * $(B handlerReturn)       A #GValue holding the return value of the signal handler.
  )
  Returns:     The accumulator function returns whether the signal emission
     should be aborted. Returning true will continue with
     the signal emission. Returning false will abort the current emission.
     Since 2.62, returning false will skip to the CLEANUP stage. In this case,
     emission will occur as normal in the CLEANUP stage and the handler's
     return value will be accumulated.
*/
alias SignalAccumulator = bool delegate(gobject.types.SignalInvocationHint ihint, gobject.value.Value returnAccu, gobject.value.Value handlerReturn);

/**
    A simple function pointer to get invoked when the signal is emitted.
  
  Emission hooks allow you to tie a hook to the signal type, so that it will
  trap all emissions of that signal, from any object.
  
  You may not attach these to signals created with the `G_SIGNAL_NO_HOOKS` flag.

  ## Parameters
  $(LIST
    * $(B ihint)       Signal invocation hint, see #GSignalInvocationHint.
    * $(B paramValues)       the instance on which
       the signal was emitted, followed by the parameters of the emission.
  )
  Returns:     whether it wants to stay connected. If it returns false, the signal
     hook is disconnected (and destroyed).
*/
alias SignalEmissionHook = bool delegate(gobject.types.SignalInvocationHint ihint, gobject.value.Value[] paramValues);

/**
    A callback function used for notification when the state
  of a toggle reference changes.
  
  See also: [gobject.object.ObjectG.addToggleRef]

  ## Parameters
  $(LIST
    * $(B object)       The object on which [gobject.object.ObjectG.addToggleRef] was called.
    * $(B isLastRef)       true if the toggle reference is now the
       last reference to the object. false if the toggle
       reference was the last reference and there are now other
       references.
  )
*/
alias ToggleNotify = void delegate(gobject.object.ObjectG object, bool isLastRef);

/**
    This function is responsible for converting the values collected from
  a variadic argument list into contents suitable for storage in a #GValue.
  
  This function should setup value similar to #GTypeValueInitFunc; e.g.
  for a string value that does not allow `NULL` pointers, it needs to either
  emit an error, or do an implicit conversion by storing an empty string.
  
  The value passed in to this function has a zero-filled data array, so
  just like for #GTypeValueInitFunc it is guaranteed to not contain any old
  contents that might need freeing.
  
  The n_collect_values argument is the string length of the `collect_format`
  field of #GTypeValueTable, and `collect_values` is an array of #GTypeCValue
  with length of n_collect_values, containing the collected values according
  to `collect_format`.
  
  The collect_flags argument provided as a hint by the caller. It may
  contain the flag `G_VALUE_NOCOPY_CONTENTS` indicating that the collected
  value contents may be considered ‘static’ for the duration of the value
  lifetime. Thus an extra copy of the contents stored in collect_values is
  not required for assignment to value.
  
  For our above string example, we continue with:
  
  ```c
  if (!collect_values[0].v_pointer)
    value->data[0].v_pointer = g_strdup ("");
  else if (collect_flags & G_VALUE_NOCOPY_CONTENTS)
    {
      value->data[0].v_pointer = collect_values[0].v_pointer;
      // keep a flag for the value_free() implementation to not free this string
      value->data[1].v_uint = G_VALUE_NOCOPY_CONTENTS;
    }
  else
    value->data[0].v_pointer = g_strdup (collect_values[0].v_pointer);
  return NULL;
  ```
  
  It should be noted, that it is generally a bad idea to follow the
  `G_VALUE_NOCOPY_CONTENTS` hint for reference counted types. Due to
  reentrancy requirements and reference count assertions performed
  by the signal emission code, reference counts should always be
  incremented for reference counted contents stored in the `value->data`
  array. To deviate from our string example for a moment, and taking
  a look at an exemplary implementation for `GTypeValueTable.collect_value()`
  of [gobject.object.ObjectG]:
  
  ```c
  GObject *object = G_OBJECT (collect_values[0].v_pointer);
  g_return_val_if_fail (object != NULL,
     g_strdup_printf ("Object %p passed as invalid NULL pointer", object));
  // never honour G_VALUE_NOCOPY_CONTENTS for ref-counted types
  value->data[0].v_pointer = g_object_ref (object);
  return NULL;
  ```
  
  The reference count for valid objects is always incremented, regardless
  of `collect_flags`. For invalid objects, the example returns a newly
  allocated string without altering `value`.
  
  Upon success, `collect_value()` needs to return `NULL`. If, however,
  an error condition occurred, `collect_value()` should return a newly
  allocated string containing an error diagnostic.
  
  The calling code makes no assumptions about the `value` contents being
  valid upon error returns, `value` is simply thrown away without further
  freeing. As such, it is a good idea to not allocate [gobject.value.Value] contents
  prior to returning an error; however, `collect_values()` is not obliged
  to return a correctly setup value for error returns, simply because
  any non-`NULL` return is considered a fatal programming error, and
  further program behaviour is undefined.

  ## Parameters
  $(LIST
    * $(B value)       the value to initialize
    * $(B collectValues)       the collected values
    * $(B collectFlags)       optional flags
  )
  Returns:     `NULL` on success, otherwise a
      newly allocated error string on failure
*/
alias TypeValueCollectFunc = string delegate(gobject.value.Value value, gobject.types.TypeCValue[] collectValues, uint collectFlags);

/**
    Copies the content of a #GValue into another.
  
  The dest_value is a #GValue with zero-filled data section and src_value
  is a properly initialized #GValue of same type, or derived type.
  
  The purpose of this function is to copy the contents of src_value
  into dest_value in a way, that even after src_value has been freed, the
  contents of dest_value remain valid. String type example:
  
  ```c
  dest_value->data[0].v_pointer = g_strdup (src_value->data[0].v_pointer);
  ```

  ## Parameters
  $(LIST
    * $(B srcValue)       the value to copy
    * $(B destValue)       the location of the copy
  )
*/
alias TypeValueCopyFunc = void delegate(gobject.value.Value srcValue, out gobject.value.Value destValue);

/**
    Frees any old contents that might be left in the `value->data` array of
  the given value.
  
  No resources may remain allocated through the #GValue contents after this
  function returns. E.g. for our above string type:
  
  ```c
  // only free strings without a specific flag for static storage
  if (!(value->data[1].v_uint & G_VALUE_NOCOPY_CONTENTS))
    g_free (value->data[0].v_pointer);
  ```

  ## Parameters
  $(LIST
    * $(B value)       the value to free
  )
*/
alias TypeValueFreeFunc = void delegate(gobject.value.Value value);

/**
    Initializes the value contents by setting the fields of the `value->data`
  array.
  
  The data array of the #GValue passed into this function was zero-filled
  with `memset()`, so no care has to be taken to free any old contents.
  For example, in the case of a string value that may never be null, the
  implementation might look like:
  
  ```c
  value->data[0].v_pointer = g_strdup ("");
  ```

  ## Parameters
  $(LIST
    * $(B value)       the value to initialize
  )
*/
alias TypeValueInitFunc = void delegate(gobject.value.Value value);

/**
    This function is responsible for storing the `value`
  contents into arguments passed through a variadic argument list which
  got collected into `collect_values` according to `lcopy_format`.
  
  The `n_collect_values` argument equals the string length of
  `lcopy_format`, and `collect_flags` may contain `G_VALUE_NOCOPY_CONTENTS`.
  
  In contrast to #GTypeValueCollectFunc, this function is obliged to always
  properly support `G_VALUE_NOCOPY_CONTENTS`.
  
  Similar to #GTypeValueCollectFunc the function may prematurely abort by
  returning a newly allocated string describing an error condition. To
  complete the string example:
  
  ```c
  gchar **string_p = collect_values[0].v_pointer;
  g_return_val_if_fail (string_p != NULL,
    g_strdup ("string location passed as NULL"));
  
  if (collect_flags & G_VALUE_NOCOPY_CONTENTS)
    *string_p = value->data[0].v_pointer;
  else
    *string_p = g_strdup (value->data[0].v_pointer);
  ```
  
  And an illustrative version of this function for reference-counted
  types:
  
  ```c
  GObject **object_p = collect_values[0].v_pointer;
  g_return_val_if_fail (object_p != NULL,
    g_strdup ("object location passed as NULL"));
  
  if (value->data[0].v_pointer == NULL)
    *object_p = NULL;
  else if (collect_flags & G_VALUE_NOCOPY_CONTENTS) // always honour
    *object_p = value->data[0].v_pointer;
  else
    *object_p = g_object_ref (value->data[0].v_pointer);
  
  return NULL;
  ```

  ## Parameters
  $(LIST
    * $(B value)       the value to lcopy
    * $(B collectValues)       the collected
        locations for storage
    * $(B collectFlags)       optional flags
  )
  Returns:     `NULL` on success, otherwise
      a newly allocated error string on failure
*/
alias TypeValueLCopyFunc = string delegate(gobject.value.Value value, gobject.types.TypeCValue[] collectValues, uint collectFlags);

/**
    If the value contents fit into a pointer, such as objects or strings,
  return this pointer, so the caller can peek at the current contents.
  
  To extend on our above string example:
  
  ```c
  return value->data[0].v_pointer;
  ```

  ## Parameters
  $(LIST
    * $(B value)       the value to peek
  )
  Returns:     a pointer to the value contents
*/
alias TypeValuePeekPointerFunc = void* delegate(gobject.value.Value value);

/**
    The type of value transformation functions which can be registered with
  [gobject.value.Value.registerTransformFunc].
  
  dest_value will be initialized to the correct destination type.

  ## Parameters
  $(LIST
    * $(B srcValue)       Source value.
    * $(B destValue)       Target value.
  )
*/
alias ValueTransform = void delegate(gobject.value.Value srcValue, gobject.value.Value destValue);

/**
    A #GWeakNotify function can be added to an object as a callback that gets
  triggered when the object is finalized.
  
  Since the object is already being disposed when the #GWeakNotify is called,
  there's not much you could do with the object, apart from e.g. using its
  address as hash-index or the like.
  
  In particular, this means it’s invalid to call [gobject.object.ObjectG.ref_],
  [gobject.weak_ref.WeakRef.init_], [gobject.weak_ref.WeakRef.set], [gobject.object.ObjectG.addToggleRef],
  [gobject.object.ObjectG.weakRef], [gobject.object.ObjectG.addWeakPointer] or any function which calls
  them on the object from this callback.

  ## Parameters
  $(LIST
    * $(B whereTheObjectWas)       the object being disposed
  )
*/
alias WeakNotify = void delegate(gobject.object.ObjectG whereTheObjectWas);

/**
    Mask containing the bits of #GParamSpec.flags which are reserved for GLib.
*/
enum PARAM_MASK = 255;

/**
    #GParamFlags value alias for `G_PARAM_STATIC_NAME` | `G_PARAM_STATIC_NICK` | `G_PARAM_STATIC_BLURB`.
  
  It is recommended to use this for all properties by default, as it allows for
  internal performance improvements in GObject.
  
  It is very rare that a property would have a dynamically constructed name,
  nickname or blurb.
  
  Since 2.13.0
*/
enum PARAM_STATIC_STRINGS = 224;

/**
    Minimum shift count to be used for user defined flags, to be stored in
  #GParamSpec.flags. The maximum allowed is 10.
*/
enum PARAM_USER_SHIFT = 8;

/**
    A mask for all #GSignalFlags bits.
*/
enum SIGNAL_FLAGS_MASK = 511;

/**
    A mask for all #GSignalMatchType bits.
*/
enum SIGNAL_MATCH_MASK = 63;

/**
    A bit in the type number that's supposed to be left untouched.
*/
enum TYPE_FLAG_RESERVED_ID_BIT = 1;

/**
    An integer constant that represents the number of identifiers reserved
  for types that are assigned at compile-time.
*/
enum TYPE_FUNDAMENTAL_MAX = 1020;

/**
    Shift value used in converting numbers to type IDs.
*/
enum TYPE_FUNDAMENTAL_SHIFT = 2;

/**
    First fundamental type number to create a new fundamental type id with
  G_TYPE_MAKE_FUNDAMENTAL() reserved for BSE.
*/
enum TYPE_RESERVED_BSE_FIRST = 32;

/**
    Last fundamental type number reserved for BSE.
*/
enum TYPE_RESERVED_BSE_LAST = 48;

/**
    First fundamental type number to create a new fundamental type id with
  G_TYPE_MAKE_FUNDAMENTAL() reserved for GLib.
*/
enum TYPE_RESERVED_GLIB_FIRST = 22;

/**
    Last fundamental type number reserved for GLib.
*/
enum TYPE_RESERVED_GLIB_LAST = 31;

/**
    First available fundamental type number to create new fundamental
  type id with G_TYPE_MAKE_FUNDAMENTAL().
*/
enum TYPE_RESERVED_USER_FIRST = 49;

/**
    The maximal number of #GTypeCValues which can be collected for a
  single #GValue.
*/
enum VALUE_COLLECT_FORMAT_MAX_LENGTH = 8;

/**
    For string values, indicates that the string contained is canonical and will
  exist for the duration of the process. See [gobject.value.Value.setInternedString].
*/
enum VALUE_INTERNED_STRING = 268435456;

/**
    If passed to G_VALUE_COLLECT(), allocated data won't be copied
  but used verbatim. This does not affect ref-counted types like
  objects. This does not affect usage of [gobject.value.Value.copy], the data will
  be copied if it is not ref-counted.
*/
enum VALUE_NOCOPY_CONTENTS = 134217728;

enum GTypeFundamentalShift = 2; /// Fundamental GType shift value (G_TYPE_FUNDAMENTAL_SHIFT)

/// Fundamental GType values as an enum
enum GTypeEnum
{
  Invalid = 0 << GTypeFundamentalShift,
  None = 1 << GTypeFundamentalShift,
  Interface = 2 << GTypeFundamentalShift,
  Char = 3 << GTypeFundamentalShift,
  Uchar = 4 << GTypeFundamentalShift,
  Boolean = 5 << GTypeFundamentalShift,
  Int = 6 << GTypeFundamentalShift,
  Uint = 7 << GTypeFundamentalShift,
  Long = 8 << GTypeFundamentalShift,
  Ulong = 9 << GTypeFundamentalShift,
  Int64 = 10 << GTypeFundamentalShift,
  Uint64 = 11 << GTypeFundamentalShift,
  Enum = 12 << GTypeFundamentalShift,
  Flags = 13 << GTypeFundamentalShift,
  Float = 14 << GTypeFundamentalShift,
  Double = 15 << GTypeFundamentalShift,
  String = 16 << GTypeFundamentalShift,
  Pointer = 17 << GTypeFundamentalShift,
  Boxed = 18 << GTypeFundamentalShift,
  Param = 19 << GTypeFundamentalShift,
  Object = 20 << GTypeFundamentalShift,
  Variant = 21 << GTypeFundamentalShift,
}
