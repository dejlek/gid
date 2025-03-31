/// Module for [BuilderListItemFactory] class
module gtk.builder_list_item_factory;

import gid.gid;
import glib.bytes;
import gobject.object;
import gtk.builder_scope;
import gtk.c.functions;
import gtk.c.types;
import gtk.list_item_factory;
import gtk.types;

/**
    [gtk.builder_list_item_factory.BuilderListItemFactory] is a [gtk.list_item_factory.ListItemFactory] that creates
    widgets by instantiating [gtk.builder.Builder] UI templates.
    
    The templates must be extending [gtk.list_item.ListItem], and typically use
    [gtk.expression.Expression]s to obtain data from the items in the model.
    
    Example:
    ```xml
      <interface>
        <template class="GtkListItem">
          <property name="child">
            <object class="GtkLabel">
              <property name="xalign">0</property>
              <binding name="label">
                <lookup name="name" type="SettingsKey">
                  <lookup name="item">GtkListItem</lookup>
                </lookup>
              </binding>
            </object>
          </property>
        </template>
      </interface>
    ```
*/
class BuilderListItemFactory : gtk.list_item_factory.ListItemFactory
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
    return cast(void function())gtk_builder_list_item_factory_get_type != &gidSymbolNotFound ? gtk_builder_list_item_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override BuilderListItemFactory self()
  {
    return this;
  }

  /**
      Creates a new [gtk.builder_list_item_factory.BuilderListItemFactory] that instantiates widgets
      using bytes as the data to pass to [gtk.builder.Builder].
  
      Params:
        scope_ = A scope to use when instantiating
        bytes = the [glib.bytes.Bytes] containing the ui file to instantiate
      Returns: a new [gtk.builder_list_item_factory.BuilderListItemFactory]
  */
  static gtk.builder_list_item_factory.BuilderListItemFactory newFromBytes(gtk.builder_scope.BuilderScope scope_, glib.bytes.Bytes bytes)
  {
    GtkListItemFactory* _cretval;
    _cretval = gtk_builder_list_item_factory_new_from_bytes(scope_ ? cast(GtkBuilderScope*)(cast(ObjectG)scope_).cPtr(No.Dup) : null, bytes ? cast(GBytes*)bytes.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.builder_list_item_factory.BuilderListItemFactory)(cast(GtkListItemFactory*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new [gtk.builder_list_item_factory.BuilderListItemFactory] that instantiates widgets
      using data read from the given resource_path to pass to [gtk.builder.Builder].
  
      Params:
        scope_ = A scope to use when instantiating
        resourcePath = valid path to a resource that contains the data
      Returns: a new [gtk.builder_list_item_factory.BuilderListItemFactory]
  */
  static gtk.builder_list_item_factory.BuilderListItemFactory newFromResource(gtk.builder_scope.BuilderScope scope_, string resourcePath)
  {
    GtkListItemFactory* _cretval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    _cretval = gtk_builder_list_item_factory_new_from_resource(scope_ ? cast(GtkBuilderScope*)(cast(ObjectG)scope_).cPtr(No.Dup) : null, _resourcePath);
    auto _retval = ObjectG.getDObject!(gtk.builder_list_item_factory.BuilderListItemFactory)(cast(GtkListItemFactory*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the data used as the [gtk.builder.Builder] UI template for constructing
      listitems.
      Returns: The [gtk.builder.Builder] data
  */
  glib.bytes.Bytes getBytes()
  {
    GBytes* _cretval;
    _cretval = gtk_builder_list_item_factory_get_bytes(cast(GtkBuilderListItemFactory*)cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      If the data references a resource, gets the path of that resource.
      Returns: The path to the resource
  */
  string getResource()
  {
    const(char)* _cretval;
    _cretval = gtk_builder_list_item_factory_get_resource(cast(GtkBuilderListItemFactory*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the scope used when constructing listitems.
      Returns: The scope used when constructing listitems
  */
  gtk.builder_scope.BuilderScope getScope()
  {
    GtkBuilderScope* _cretval;
    _cretval = gtk_builder_list_item_factory_get_scope(cast(GtkBuilderListItemFactory*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.builder_scope.BuilderScope)(cast(GtkBuilderScope*)_cretval, No.Take);
    return _retval;
  }
}
