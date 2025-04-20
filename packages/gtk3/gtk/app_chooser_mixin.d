/// Module for [AppChooser] interface mixin
module gtk.app_chooser_mixin;

public import gtk.app_chooser_iface_proxy;
public import gid.gid;
public import gio.app_info;
public import gobject.object;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    #GtkAppChooser is an interface that can be implemented by widgets which
    allow the user to choose an application (typically for the purpose of
    opening a file). The main objects that implement this interface are
    #GtkAppChooserWidget, #GtkAppChooserDialog and #GtkAppChooserButton.
    
    Applications are represented by GIO #GAppInfo objects here.
    GIO has a concept of recommended and fallback applications for a
    given content type. Recommended applications are those that claim
    to handle the content type itself, while fallback also includes
    applications that handle a more generic content type. GIO also
    knows the default and last-used application for a given content
    type. The #GtkAppChooserWidget provides detailed control over
    whether the shown list of applications should include default,
    recommended or fallback applications.
    
    To obtain the application that has been selected in a #GtkAppChooser,
    use [gtk.app_chooser.AppChooser.getAppInfo].
*/
template AppChooserT()
{

  /**
      Returns the currently selected application.
      Returns: a #GAppInfo for the currently selected
            application, or null if none is selected. Free with [gobject.object.ObjectWrap.unref]
  */
  override gio.app_info.AppInfo getAppInfo()
  {
    GAppInfo* _cretval;
    _cretval = gtk_app_chooser_get_app_info(cast(GtkAppChooser*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gio.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the current value of the #GtkAppChooser:content-type property.
      Returns: the content type of self. Free with [glib.global.gfree]
  */
  override string getContentType()
  {
    char* _cretval;
    _cretval = gtk_app_chooser_get_content_type(cast(GtkAppChooser*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Reloads the list of applications.
  */
  override void refresh()
  {
    gtk_app_chooser_refresh(cast(GtkAppChooser*)cPtr);
  }
}
