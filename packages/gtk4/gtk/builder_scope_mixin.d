module gtk.builder_scope_mixin;

public import gtk.builder_scope_iface_proxy;
public import gid.global;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
 * `GtkBuilderScope` is an interface to provide language binding support
 * to `GtkBuilder`.
 * The goal of `GtkBuilderScope` is to look up programming-language-specific
 * values for strings that are given in a `GtkBuilder` UI file.
 * The primary intended audience is bindings that want to provide deeper
 * integration of `GtkBuilder` into the language.
 * A `GtkBuilderScope` instance may be used with multiple `GtkBuilder` objects,
 * even at once.
 * By default, GTK will use its own implementation of `GtkBuilderScope`
 * for the C language which can be created via [gtk.builder_cscope.BuilderCScope.new_].
 * If you implement `GtkBuilderScope` for a language binding, you
 * may want to $(LPAREN)partially$(RPAREN) derive from or fall back to a [gtk.builder_cscope.BuilderCScope],
 * as that class implements support for automatic lookups from C symbols.
 */
template BuilderScopeT()
{
}
