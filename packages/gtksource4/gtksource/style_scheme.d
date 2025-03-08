module gtksource.style_scheme;

import gid.gid;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.style;
import gtksource.types;

/** */
class StyleScheme : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_style_scheme_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  string[] getAuthors()
  {
    const(char*)* _cretval;
    _cretval = gtk_source_style_scheme_get_authors(cast(GtkSourceStyleScheme*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.free);
    }
    return _retval;
  }

  /** */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = gtk_source_style_scheme_get_description(cast(GtkSourceStyleScheme*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /** */
  string getFilename()
  {
    const(char)* _cretval;
    _cretval = gtk_source_style_scheme_get_filename(cast(GtkSourceStyleScheme*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /** */
  string getId()
  {
    const(char)* _cretval;
    _cretval = gtk_source_style_scheme_get_id(cast(GtkSourceStyleScheme*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /** */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_style_scheme_get_name(cast(GtkSourceStyleScheme*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /** */
  gtksource.style.Style getStyle(string styleId)
  {
    GtkSourceStyle* _cretval;
    const(char)* _styleId = styleId.toCString(No.alloc);
    _cretval = gtk_source_style_scheme_get_style(cast(GtkSourceStyleScheme*)cPtr, _styleId);
    auto _retval = ObjectG.getDObject!(gtksource.style.Style)(cast(GtkSourceStyle*)_cretval, No.take);
    return _retval;
  }
}
