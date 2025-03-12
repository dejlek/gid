module gtk.bookmark_list;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.bookmark_list.BookmarkList] is a list model that wraps [glib.bookmark_file.BookmarkFile].
  
  It presents a [gio.list_model.ListModel] and fills it asynchronously with the
  [gio.file_info.FileInfo]s returned from that function.
  
  The [gio.file_info.FileInfo]s in the list have some attributes in the recent
  namespace added: `recent::private` (boolean) and `recent:applications`
  (stringv).
*/
class BookmarkList : gobject.object.ObjectG, gio.list_model.ListModel
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_bookmark_list_get_type != &gidSymbolNotFound ? gtk_bookmark_list_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override BookmarkList self()
  {
    return this;
  }

  mixin ListModelT!();

  /**
      Creates a new [gtk.bookmark_list.BookmarkList] with the given attributes.
    Params:
      filename =       The bookmark file to load
      attributes =       The attributes to query
    Returns:     a new [gtk.bookmark_list.BookmarkList]
  */
  this(string filename = null, string attributes = null)
  {
    GtkBookmarkList* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    const(char)* _attributes = attributes.toCString(No.Alloc);
    _cretval = gtk_bookmark_list_new(_filename, _attributes);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the attributes queried on the children.
    Returns:     The queried attributes
  */
  string getAttributes()
  {
    const(char)* _cretval;
    _cretval = gtk_bookmark_list_get_attributes(cast(GtkBookmarkList*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the filename of the bookmark file that
    this list is loading.
    Returns:     the filename of the .xbel file
  */
  string getFilename()
  {
    const(char)* _cretval;
    _cretval = gtk_bookmark_list_get_filename(cast(GtkBookmarkList*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the IO priority to use while loading file.
    Returns:     The IO priority.
  */
  int getIoPriority()
  {
    int _retval;
    _retval = gtk_bookmark_list_get_io_priority(cast(GtkBookmarkList*)cPtr);
    return _retval;
  }

  /**
      Returns true if the files are currently being loaded.
    
    Files will be added to self from time to time while loading is
    going on. The order in which are added is undefined and may change
    in between runs.
    Returns:     true if self is loading
  */
  bool isLoading()
  {
    bool _retval;
    _retval = gtk_bookmark_list_is_loading(cast(GtkBookmarkList*)cPtr);
    return _retval;
  }

  /**
      Sets the attributes to be enumerated and starts the enumeration.
    
    If attributes is null, no attributes will be queried, but a list
    of [gio.file_info.FileInfo]s will still be created.
    Params:
      attributes =       the attributes to enumerate
  */
  void setAttributes(string attributes = null)
  {
    const(char)* _attributes = attributes.toCString(No.Alloc);
    gtk_bookmark_list_set_attributes(cast(GtkBookmarkList*)cPtr, _attributes);
  }

  /**
      Sets the IO priority to use while loading files.
    
    The default IO priority is `G_PRIORITY_DEFAULT`.
    Params:
      ioPriority =       IO priority to use
  */
  void setIoPriority(int ioPriority)
  {
    gtk_bookmark_list_set_io_priority(cast(GtkBookmarkList*)cPtr, ioPriority);
  }
}
