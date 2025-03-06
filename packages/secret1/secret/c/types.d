module secret.c.types;

public import gid.basictypes;
public import gobject.c.types;
public import gio.c.types;
import secret.types;


// Enums
alias SecretBackendFlags = secret.types.BackendFlags;
alias SecretCollectionCreateFlags = secret.types.CollectionCreateFlags;
alias SecretCollectionFlags = secret.types.CollectionFlags;
alias SecretError = secret.types.Error;
alias SecretItemCreateFlags = secret.types.ItemCreateFlags;
alias SecretItemFlags = secret.types.ItemFlags;
alias SecretSchemaAttributeType = secret.types.SchemaAttributeType;
alias SecretSchemaFlags = secret.types.SchemaFlags;
alias SecretSchemaType = secret.types.SchemaType;
alias SecretSearchFlags = secret.types.SearchFlags;
alias SecretServiceFlags = secret.types.ServiceFlags;
/**
    #SecretBackend represents a backend implementation of password
  storage.
*/
struct SecretBackend;

/**
    The interface for #SecretBackend.
*/
struct SecretBackendInterface
{
  /**
      the parent interface
  */
  GTypeInterface parentIface;

  /** */
  extern(C) void function(SecretBackend* self, SecretBackendFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) ensureForFlags;

  /** */
  extern(C) bool function(SecretBackend* self, GAsyncResult* result, GError** _err) ensureForFlagsFinish;

  /** */
  extern(C) void function(SecretBackend* self, const(SecretSchema)* schema, GHashTable* attributes, const(char)* collection, const(char)* label, SecretValue* value, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) store;

  /** */
  extern(C) bool function(SecretBackend* self, GAsyncResult* result, GError** _err) storeFinish;

  /** */
  extern(C) void function(SecretBackend* self, const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) lookup;

  /** */
  extern(C) SecretValue* function(SecretBackend* self, GAsyncResult* result, GError** _err) lookupFinish;

  /** */
  extern(C) void function(SecretBackend* self, const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) clear;

  /** */
  extern(C) bool function(SecretBackend* self, GAsyncResult* result, GError** _err) clearFinish;

  /** */
  extern(C) void function(SecretBackend* self, const(SecretSchema)* schema, GHashTable* attributes, SecretSearchFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) search;

  /** */
  extern(C) GList* function(SecretBackend* self, GAsyncResult* result, GError** _err) searchFinish;
}

/**
    A proxy object representing a collection of secrets in the Secret Service.
  
  #SecretCollection represents a collection of secret items stored in the
  Secret Service.
  
  A collection can be in a locked or unlocked state. Use
  `method@SecretService.lock` or `method@SecretService.unlock` to lock or
  unlock the collection.
  
  Use the `property@SecretCollection:items` property or
  `method@SecretCollection.get_items` to lookup the items in the collection.
  There may not be any items exposed when the collection is locked.
*/
struct SecretCollection
{
  /** */
  GDBusProxy parent;

  /** */
  SecretCollectionPrivate* pv;
}

/**
    The class for #SecretCollection.
*/
struct SecretCollectionClass
{
  /**
      the parent class
  */
  GDBusProxyClass parentClass;

  /** */
  void*[8] padding;
}

/** */
struct SecretCollectionPrivate;

/**
    A secret item
  
  #SecretItem represents a secret item stored in the Secret Service.
  
  Each item has a value, represented by a `struct@Value`, which can be
  retrieved by [secret.item.Item.getSecret] or set by [secret.item.Item.setSecret].
  The item is only available when the item is not locked.
  
  Items can be locked or unlocked using the [secret.service.Service.lock] or
  [secret.service.Service.unlock] functions. The Secret Service may not be able to
  unlock individual items, and may unlock an entire collection when a single
  item is unlocked.
  
  Each item has a set of attributes, which are used to locate the item later.
  These are not stored or transferred in a secure manner. Each attribute has
  a string name and a string value. Use [secret.service.Service.search] to search for
  items based on their attributes, and [secret.item.Item.setAttributes] to change
  the attributes associated with an item.
  
  Items can be created with [secret.item.Item.create] or [secret.service.Service.store].
*/
struct SecretItem
{
  /** */
  GDBusProxy parentInstance;

  /** */
  SecretItemPrivate* pv;
}

/**
    The class for #SecretItem.
*/
struct SecretItemClass
{
  /**
      the parent class
  */
  GDBusProxyClass parentClass;

  /** */
  void*[4] padding;
}

/** */
struct SecretItemPrivate;

/**
    A prompt in the Service
  
  A proxy object representing a prompt that the Secret Service will display
  to the user.
  
  Certain actions on the Secret Service require user prompting to complete,
  such as creating a collection, or unlocking a collection. When such a prompt
  is necessary, then a #SecretPrompt object is created by this library, and
  passed to the [secret.service.Service.prompt] method. In this way it is handled
  automatically.
  
  In order to customize prompt handling, override the
  `vfunc@Service.prompt_async` and `vfunc@Service.prompt_finish` virtual
  methods of the `class@Service` class.
*/
struct SecretPrompt
{
  /** */
  GDBusProxy parentInstance;

  /** */
  SecretPromptPrivate* pv;
}

/**
    The class for #SecretPrompt.
*/
struct SecretPromptClass
{
  /**
      the parent class
  */
  GDBusProxyClass parentClass;

  /** */
  void*[8] padding;
}

/** */
struct SecretPromptPrivate;

/**
    A read-only view of a secret item in the Secret Service.
  
  #SecretRetrievable provides a read-only view of a secret item
  stored in the Secret Service.
  
  Each item has a value, represented by a `struct@Value`, which can be
  retrieved by [secret.retrievable.Retrievable.retrieveSecret] and
  [secret.retrievable.Retrievable.retrieveSecretFinish].
*/
struct SecretRetrievable;

/**
    The interface for #SecretRetrievable.
*/
struct SecretRetrievableInterface
{
  /**
      the parent interface
  */
  GTypeInterface parentIface;

  /** */
  extern(C) void function(SecretRetrievable* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) retrieveSecret;

  /** */
  extern(C) SecretValue* function(SecretRetrievable* self, GAsyncResult* result, GError** _err) retrieveSecretFinish;
}

/**
    Represents a set of attributes that are stored with an item.
  
  These schemas are used for interoperability between various services storing
  the same types of items.
  
  Each schema has a name like `org.gnome.keyring.NetworkPassword`, and defines a
  set of attributes, and types (string, integer, boolean) for those attributes.
  
  Attributes are stored as strings in the Secret Service, and the attribute types
  simply define standard ways to store integer and boolean values as strings.
  Attributes are represented in libsecret via a [glib.hash_table.HashTable] with
  string keys and values. Even for values that defined as an integer or boolean in
  the schema, the attribute values in the [glib.hash_table.HashTable] are strings.
  Boolean values are stored as the strings 'true' and 'false'. Integer values are
  stored in decimal, with a preceding negative sign for negative integers.
  
  Schemas are handled entirely on the client side by this library. The name of the
  schema is automatically stored as an attribute on the item.
  
  Normally when looking up passwords only those with matching schema names are
  returned. If the schema @flags contain the [secret.types.SchemaFlags.DontMatchName] flag,
  then lookups will not check that the schema name matches that on the item, only
  the schema's attributes are matched. This is useful when you are looking up
  items that are not stored by the libsecret library. Other libraries such as
  libgnome-keyring don't store the schema name.
  
  Additional schemas can be defined via the `struct@Schema` structure like this:
  
  ```c
  // in a header:
  
  const SecretSchema * example_get_schema (void) G_GNUC_CONST;
  
  #define EXAMPLE_SCHEMA  example_get_schema ()
  
  
  // in a .c file
  
  const SecretSchema *
  example_get_schema (void)
  {
      static const SecretSchema the_schema = {
          "org.example.Password", SECRET_SCHEMA_NONE,
          {
              {  "number", SECRET_SCHEMA_ATTRIBUTE_INTEGER },
              {  "string", SECRET_SCHEMA_ATTRIBUTE_STRING },
              {  "even", SECRET_SCHEMA_ATTRIBUTE_BOOLEAN },
              {  NULL, 0 },
          }
      };
      return &the_schema;
  }
  ```
*/
struct SecretSchema
{
  /**
      the dotted name of the schema
  */
  const(char)* name;

  /**
      flags for the schema
  */
  SecretSchemaFlags flags;

  /**
      the attribute names and types of those attributes
  */
  SecretSchemaAttribute[32] attributes;

  /** */
  int reserved;

  /** */
  void* reserved1;

  /** */
  void* reserved2;

  /** */
  void* reserved3;

  /** */
  void* reserved4;

  /** */
  void* reserved5;

  /** */
  void* reserved6;

  /** */
  void* reserved7;
}

/**
    An attribute in a #SecretSchema.
*/
struct SecretSchemaAttribute
{
  /**
      name of the attribute
  */
  const(char)* name;

  /**
      the type of the attribute
  */
  SecretSchemaAttributeType type;
}

/**
    A proxy object representing the Secret Service.
  
  A #SecretService object represents the Secret Service implementation which
  runs as a D-Bus service.
  
  Normally a single #SecretService object can be shared between multiple
  callers. The [secret.service.Service.get] method is used to access this #SecretService
  object. If a new independent #SecretService object is required, use
  [secret.service.Service.open].
  
  In order to securely transfer secrets to the Sercret Service, a session
  is established. This session can be established while initializing a
  #SecretService object by passing the [secret.types.ServiceFlags.OpenSession] flag
  to the [secret.service.Service.get] or [secret.service.Service.open] functions. In order to
  establish a session on an already existing #SecretService, use the
  [secret.service.Service.ensureSession] function.
  
  To search for items, use the [secret.service.Service.search] method.
  
  Multiple collections can exist in the Secret Service, each of which contains
  secret items. In order to instantiate `class@Collection` objects which
  represent those collections while initializing a #SecretService then pass
  the [secret.types.ServiceFlags.LoadCollections] flag to the [secret.service.Service.get] or
  [secret.service.Service.open] functions. In order to establish a session on an already
  existing #SecretService, use the [secret.service.Service.loadCollections] function.
  To access the list of collections use [secret.service.Service.getCollections].
  
  Certain actions on the Secret Service require user prompting to complete,
  such as creating a collection, or unlocking a collection. When such a prompt
  is necessary, then a `class@Prompt` object is created by this library, and
  passed to the [secret.service.Service.prompt] method. In this way it is handled
  automatically.
  
  In order to customize prompt handling, override the
  `vfunc@Service.prompt_async` and `vfunc@Service.prompt_finish` virtual
  methods of the #SecretService class.
*/
struct SecretService
{
  /** */
  GDBusProxy parent;

  /** */
  SecretServicePrivate* pv;
}

/**
    The class for #SecretService.
*/
struct SecretServiceClass
{
  /**
      the parent class
  */
  GDBusProxyClass parentClass;

  /**
      the `alias@GLib.Type` of the `class@Collection` objects instantiated
      by the #SecretService proxy
  */
  GType collectionGtype;

  /**
      the `alias@GLib.Type` of the `class@Item` objects instantiated by the
      #SecretService proxy
  */
  GType itemGtype;

  /** */
  extern(C) VariantC* function(SecretService* self, SecretPrompt* prompt, GCancellable* cancellable, const(GVariantType)* returnType, GError** _err) promptSync;

  /** */
  extern(C) void function(SecretService* self, SecretPrompt* prompt, const(GVariantType)* returnType, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) promptAsync;

  /** */
  extern(C) VariantC* function(SecretService* self, GAsyncResult* result, GError** _err) promptFinish;

  /** */
  extern(C) GType function(SecretService* self) getCollectionGtype;

  /** */
  extern(C) GType function(SecretService* self) getItemGtype;

  /** */
  void*[14] padding;
}

/** */
struct SecretServicePrivate;

/**
    A value containing a secret
  
  A #SecretValue contains a password or other secret value.
  
  Use [secret.value.Value.get] to get the actual secret data, such as a password.
  The secret data is not necessarily null-terminated, unless the content type
  is "text/plain".
  
  Each #SecretValue has a content type. For passwords, this is `text/plain`.
  Use [secret.value.Value.getContentType] to look at the content type.
  
  #SecretValue is reference counted and immutable. The secret data is only
  freed when all references have been released via [secret.value.Value.unref].
*/
struct SecretValue;

