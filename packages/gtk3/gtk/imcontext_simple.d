module gtk.imcontext_simple;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.imcontext;
import gtk.types;

/**
    GtkIMContextSimple is a simple input method context supporting table-based
  input methods. It has a built-in table of compose sequences that is derived
  from the X11 Compose files.
  
  GtkIMContextSimple reads additional compose sequences from the first of the
  following files that is found: ~/.config/gtk-3.0/Compose, ~/.XCompose,
  /usr/share/X11/locale/$locale/Compose (for locales that have a nontrivial
  Compose file). The syntax of these files is described in the Compose(5)
  manual page.
  
  ## Unicode characters
  
  GtkIMContextSimple also supports numeric entry of Unicode characters
  by typing Ctrl-Shift-u, followed by a hexadecimal Unicode codepoint.
  For example, Ctrl-Shift-u 1 2 3 Enter yields U+0123 LATIN SMALL LETTER
  G WITH CEDILLA, i.e. ģ.
*/
class IMContextSimple : gtk.imcontext.IMContext
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_im_context_simple_get_type != &gidSymbolNotFound ? gtk_im_context_simple_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new #GtkIMContextSimple.
    Returns:     a new #GtkIMContextSimple.
  */
  this()
  {
    GtkIMContext* _cretval;
    _cretval = gtk_im_context_simple_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds an additional table from the X11 compose file.
    Params:
      composeFile =       The path of compose file
  */
  void addComposeFile(string composeFile)
  {
    const(char)* _composeFile = composeFile.toCString(No.Alloc);
    gtk_im_context_simple_add_compose_file(cast(GtkIMContextSimple*)cPtr, _composeFile);
  }
}
