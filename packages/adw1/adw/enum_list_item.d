/// Module for [EnumListItem] class
module adw.enum_list_item;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.object;

/**
    [adw.enum_list_item.EnumListItem] is the type of items in a `class@EnumListModel`.
*/
class EnumListItem : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_enum_list_item_get_type != &gidSymbolNotFound ? adw_enum_list_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EnumListItem self()
  {
    return this;
  }

  /**
      Get `name` property.
      Returns: The enum value name.
  */
  @property string name()
  {
    return getName();
  }

  /**
      Get `nick` property.
      Returns: The enum value nick.
  */
  @property string nick()
  {
    return getNick();
  }

  /**
      Get `value` property.
      Returns: The enum value.
  */
  @property int value()
  {
    return getValue();
  }

  /**
      Gets the enum value name.
      Returns: the enum value name
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = adw_enum_list_item_get_name(cast(AdwEnumListItem*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the enum value nick.
      Returns: the enum value nick
  */
  string getNick()
  {
    const(char)* _cretval;
    _cretval = adw_enum_list_item_get_nick(cast(AdwEnumListItem*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the enum value.
      Returns: the enum value
  */
  int getValue()
  {
    int _retval;
    _retval = adw_enum_list_item_get_value(cast(AdwEnumListItem*)cPtr);
    return _retval;
  }
}
