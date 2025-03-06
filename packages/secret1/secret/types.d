module secret.types;

import gid.gid;
import secret.c.functions;
import secret.c.types;


/**
    Flags which determine which parts of the #SecretBackend are initialized.
*/
enum BackendFlags
{
  /**
      no flags for initializing the #SecretBackend
  */
  None = 0,

  /**
      establish a session for transfer of secrets
      while initializing the #SecretBackend
  */
  OpenSession = 2,

  /**
      load collections while initializing the
      #SecretBackend
  */
  LoadCollections = 4,
}

/**
    Flags for [secret.collection.Collection.create].
*/
enum CollectionCreateFlags : uint
{
  /**
      no flags
  */
  None = 0,
}

/**
    Flags which determine which parts of the #SecretCollection proxy are initialized.
*/
enum CollectionFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      items have or should be loaded
  */
  LoadItems = 2,
}

/**
    Errors returned by the Secret Service.
  
  None of the errors are appropriate for display to the user. It is up to the
  application to handle them appropriately.
*/
enum Error
{
  /**
      received an invalid data or message from the Secret
      Service
  */
  Protocol = 1,

  /**
      the item or collection is locked and the operation
      cannot be performed
  */
  IsLocked = 2,

  /**
      no such item or collection found in the Secret
      Service
  */
  NoSuchObject = 3,

  /**
      a relevant item or collection already exists
  */
  AlreadyExists = 4,

  /**
      the file format is not valid
  */
  InvalidFileFormat = 5,

  /**
      the xdg:schema attribute of the table does
    not match the schema name
  */
  MismatchedSchema = 6,

  /**
      attribute contained in table not found
    in corresponding schema
  */
  NoMatchingAttribute = 7,

  /**
      attribute could not be parsed according to its type
    reported in the table's schema
  */
  WrongType = 8,

  /**
      attribute list passed to secret_attributes_validate
    has no elements to validate
  */
  EmptyTable = 9,
}

/**
    Flags for [secret.item.Item.create].
*/
enum ItemCreateFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      replace an item with the same attributes.
  */
  Replace = 2,
}

/**
    Flags which determine which parts of the #SecretItem proxy are initialized.
*/
enum ItemFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      a secret has been (or should be) loaded for #SecretItem
  */
  LoadSecret = 2,
}

/**
    The type of an attribute in a `struct@SecretSchema`.
  
  Attributes are stored as strings in the Secret Service, and the attribute
  types simply define standard ways to store integer and boolean values as
  strings.
*/
enum SchemaAttributeType
{
  /**
      a utf-8 string attribute
  */
  String = 0,

  /**
      an integer attribute, stored as a decimal
  */
  Integer = 1,

  /**
      a boolean attribute, stored as 'true' or 'false'
  */
  Boolean = 2,
}

/**
    Flags for a #SecretSchema definition.
*/
enum SchemaFlags : uint
{
  /**
      no flags for the schema
  */
  None = 0,

  /**
      don't match the schema name when looking up or
      removing passwords
  */
  DontMatchName = 2,
}

/**
    Different types of schemas for storing secrets, intended for use with
  `func@get_schema`.
  
  ## @SECRET_SCHEMA_NOTE
  
  A predefined schema for personal passwords stored by the user in the
  password manager. This schema has no attributes, and the items are not
  meant to be used automatically by applications.
  
  When used to search for items using this schema, it will only match
  items that have the same schema. Items stored via libgnome-keyring with the
  `GNOME_KEYRING_ITEM_NOTE` item type will match.
  
  ## @SECRET_SCHEMA_COMPAT_NETWORK
  
  A predefined schema that is compatible with items stored via the
  libgnome-keyring 'network password' functions. This is meant to be used by
  applications migrating from libgnome-keyring which stored their secrets as
  'network passwords'. It is not recommended that new code use this schema.
  
  When used to search for items using this schema, it will only match
  items that have the same schema. Items stored via libgnome-keyring with the
  `GNOME_KEYRING_ITEM_NETWORK_PASSWORD` item type will match.
  
  The following attributes exist in the schema:
  
  ### Attributes:
  
  <table>
      <tr>
          <td><tt>user</tt>:</td>
          <td>The user name (string).</td>
      </tr>
      <tr>
          <td><tt>domain</tt>:</td>
          <td>The login domain or realm (string).</td></tr>
      <tr>
          <td><tt>object</tt>:</td>
          <td>The object or path (string).</td>
      </tr>
      <tr>
          <td><tt>protocol</tt>:</td>
          <td>The protocol (a string like 'http').</td>
      </tr>
      <tr>
          <td><tt>port</tt>:</td>
          <td>The network port (integer).</td>
      </tr>
      <tr>
          <td><tt>server</tt>:</td>
          <td>The hostname or server (string).</td>
      </tr>
      <tr>
          <td><tt>authtype</tt>:</td>
          <td>The authentication type (string).</td>
      </tr>
  </table>
*/
enum SchemaType
{
  /**
      Personal passwords
  */
  Note = 0,

  /**
      Network passwords from older
       libgnome-keyring storage
  */
  CompatNetwork = 1,
}

/**
    Various flags to be used with [secret.service.Service.search] and [secret.service.Service.searchSync].
*/
enum SearchFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      all the items matching the search will be returned, instead of just the first one
  */
  All = 2,

  /**
      unlock locked items while searching
  */
  Unlock = 4,

  /**
      while searching load secrets for items that are not locked
  */
  LoadSecrets = 8,
}

/**
    Flags which determine which parts of the #SecretService proxy are initialized
  during a [secret.service.Service.get] or [secret.service.Service.open] operation.
*/
enum ServiceFlags : uint
{
  /**
      no flags for initializing the #SecretService
  */
  None = 0,

  /**
      establish a session for transfer of secrets
      while initializing the #SecretService
  */
  OpenSession = 2,

  /**
      load collections while initializing the
      #SecretService
  */
  LoadCollections = 4,
}

/**
    Extension point for the secret backend.
*/
enum BACKEND_EXTENSION_POINT_NAME = "secret-backend";

/**
    An alias to the default collection.
  
  This can be passed to `func@password_store` [secret.collection.Collection.forAlias].
*/
enum COLLECTION_DEFAULT = "default";

/**
    An alias to the session collection, which will be cleared when the user ends
  the session.
  
  This can be passed to `func@password_store`, [secret.collection.Collection.forAlias] or
  similar functions.
*/
enum COLLECTION_SESSION = "session";

/**
    The major version of libsecret.
*/
enum MAJOR_VERSION = 0;

/**
    The micro version of libsecret.
*/
enum MICRO_VERSION = 4;

/**
    The minor version of libsecret.
*/
enum MINOR_VERSION = 21;
