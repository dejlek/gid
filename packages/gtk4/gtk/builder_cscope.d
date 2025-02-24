module gtk.builder_cscope;

import gid.gid;
import gobject.object;
import gtk.builder_scope;
import gtk.builder_scope_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * A `GtkBuilderScope` implementation for the C language.
 * `GtkBuilderCScope` instances use symbols explicitly added to @builder
 * with prior calls to [Gtk.BuilderCScope.addCallbackSymbol].
 * If developers want to do that, they are encouraged to create their
 * own scopes for that purpose.
 * In the case that symbols are not explicitly added; GTK will uses
 * `GModule`’s introspective features $(LPAREN)by opening the module %NULL$(RPAREN) to
 * look at the application’s symbol table. From here it tries to match
 * the signal function names given in the interface description with
 * symbols in the application.
 * Note that unless [Gtk.BuilderCScope.addCallbackSymbol] is
 * called for all signal callbacks which are referenced by the loaded XML,
 * this functionality will require that `GModule` be supported on the platform.
 */
class BuilderCScope : ObjectG, BuilderScope
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_builder_cscope_get_type != &gidSymbolNotFound ? gtk_builder_cscope_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin BuilderScopeT!();

  /**
   * Creates a new `GtkBuilderCScope` object to use with future
   * `GtkBuilder` instances.
   * Calling this function is only necessary if you want to add
   * custom callbacks via [Gtk.BuilderCScope.addCallbackSymbol].
   * Returns: a new `GtkBuilderCScope`
   */
  this()
  {
    GtkBuilderScope* _cretval;
    _cretval = gtk_builder_cscope_new();
    this(_cretval, Yes.Take);
  }
}
