module gtk.activatable;

public import gtk.activatable_iface_proxy;
import gid.gid;
import gobject.object;
import gtk.action;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * Activatable widgets can be connected to a #GtkAction and reflects
 * the state of its action. A #GtkActivatable can also provide feedback
 * through its action, as they are responsible for activating their
 * related actions.
 * # Implementing GtkActivatable
 * When extending a class that is already #GtkActivatable; it is only
 * necessary to implement the #GtkActivatable->sync_action_properties$(LPAREN)$(RPAREN)
 * and #GtkActivatable->update$(LPAREN)$(RPAREN) methods and chain up to the parent
 * implementation, however when introducing
 * a new #GtkActivatable class; the #GtkActivatable:related-action and
 * #GtkActivatable:use-action-appearance properties need to be handled by
 * the implementor. Handling these properties is mostly a matter of installing
 * the action pointer and boolean flag on your instance, and calling
 * [gtk.activatable.Activatable.doSetRelatedAction] and
 * [gtk.activatable.Activatable.syncActionProperties] at the appropriate times.
 * ## A class fragment implementing #GtkActivatable
 * |[<!-- language\="C" -->
 * enum {
 * ...
 * PROP_ACTIVATABLE_RELATED_ACTION,
 * PROP_ACTIVATABLE_USE_ACTION_APPEARANCE
 * }
 * struct _FooBarPrivate
 * {
 * ...
 * GtkAction      *action;
 * gboolean        use_action_appearance;
 * };
 * ...
 * static void foo_bar_activatable_interface_init         $(LPAREN)GtkActivatableIface  *iface$(RPAREN);
 * static void foo_bar_activatable_update                 $(LPAREN)GtkActivatable       *activatable,
 * GtkAction            *action,
 * const gchar          *property_name$(RPAREN);
 * static void foo_bar_activatable_sync_action_properties $(LPAREN)GtkActivatable       *activatable,
 * GtkAction            *action$(RPAREN);
 * ...
 * static void
 * foo_bar_class_init $(LPAREN)FooBarClass *klass$(RPAREN)
 * {
 * ...
 * g_object_class_override_property $(LPAREN)gobject_class, PROP_ACTIVATABLE_RELATED_ACTION, "related-action"$(RPAREN);
 * g_object_class_override_property $(LPAREN)gobject_class, PROP_ACTIVATABLE_USE_ACTION_APPEARANCE, "use-action-appearance"$(RPAREN);
 * ...
 * }
 * static void
 * foo_bar_activatable_interface_init $(LPAREN)GtkActivatableIface  *iface$(RPAREN)
 * {
 * iface->update \= foo_bar_activatable_update;
 * iface->sync_action_properties \= foo_bar_activatable_sync_action_properties;
 * }
 * ... Break the reference using [gtk.activatable.Activatable.doSetRelatedAction]...
 * static void
 * foo_bar_dispose $(LPAREN)GObject *object$(RPAREN)
 * {
 * FooBar *bar \= FOO_BAR $(LPAREN)object$(RPAREN);
 * FooBarPrivate *priv \= FOO_BAR_GET_PRIVATE $(LPAREN)bar$(RPAREN);
 * ...
 * if $(LPAREN)priv->action$(RPAREN)
 * {
 * gtk_activatable_do_set_related_action $(LPAREN)GTK_ACTIVATABLE $(LPAREN)bar$(RPAREN), NULL$(RPAREN);
 * priv->action \= NULL;
 * }
 * G_OBJECT_CLASS $(LPAREN)foo_bar_parent_class$(RPAREN)->dispose $(LPAREN)object$(RPAREN);
 * }
 * ... Handle the “related-action” and “use-action-appearance” properties ...
 * static void
 * foo_bar_set_property $(LPAREN)GObject         *object,
 * guint            prop_id,
 * const GValue    *value,
 * GParamSpec      *pspec$(RPAREN)
 * {
 * FooBar *bar \= FOO_BAR $(LPAREN)object$(RPAREN);
 * FooBarPrivate *priv \= FOO_BAR_GET_PRIVATE $(LPAREN)bar$(RPAREN);
 * switch $(LPAREN)prop_id$(RPAREN)
 * {
 * ...
 * case PROP_ACTIVATABLE_RELATED_ACTION:
 * foo_bar_set_related_action $(LPAREN)bar, g_value_get_object $(LPAREN)value$(RPAREN)$(RPAREN);
 * break;
 * case PROP_ACTIVATABLE_USE_ACTION_APPEARANCE:
 * foo_bar_set_use_action_appearance $(LPAREN)bar, g_value_get_boolean $(LPAREN)value$(RPAREN)$(RPAREN);
 * break;
 * default:
 * G_OBJECT_WARN_INVALID_PROPERTY_ID $(LPAREN)object, prop_id, pspec$(RPAREN);
 * break;
 * }
 * }
 * static void
 * foo_bar_get_property $(LPAREN)GObject         *object,
 * guint            prop_id,
 * GValue          *value,
 * GParamSpec      *pspec$(RPAREN)
 * {
 * FooBar *bar \= FOO_BAR $(LPAREN)object$(RPAREN);
 * FooBarPrivate *priv \= FOO_BAR_GET_PRIVATE $(LPAREN)bar$(RPAREN);
 * switch $(LPAREN)prop_id$(RPAREN)
 * {
 * ...
 * case PROP_ACTIVATABLE_RELATED_ACTION:
 * g_value_set_object $(LPAREN)value, priv->action$(RPAREN);
 * break;
 * case PROP_ACTIVATABLE_USE_ACTION_APPEARANCE:
 * g_value_set_boolean $(LPAREN)value, priv->use_action_appearance$(RPAREN);
 * break;
 * default:
 * G_OBJECT_WARN_INVALID_PROPERTY_ID $(LPAREN)object, prop_id, pspec$(RPAREN);
 * break;
 * }
 * }
 * static void
 * foo_bar_set_use_action_appearance $(LPAREN)FooBar   *bar,
 * gboolean  use_appearance$(RPAREN)
 * {
 * FooBarPrivate *priv \= FOO_BAR_GET_PRIVATE $(LPAREN)bar$(RPAREN);
 * if $(LPAREN)priv->use_action_appearance !\= use_appearance$(RPAREN)
 * {
 * priv->use_action_appearance \= use_appearance;
 * gtk_activatable_sync_action_properties $(LPAREN)GTK_ACTIVATABLE $(LPAREN)bar$(RPAREN), priv->action$(RPAREN);
 * }
 * }
 * ... call [gtk.activatable.Activatable.doSetRelatedAction] and then assign the action pointer,
 * no need to reference the action here since [gtk.activatable.Activatable.doSetRelatedAction] already
 * holds a reference here for you...
 * static void
 * foo_bar_set_related_action $(LPAREN)FooBar    *bar,
 * GtkAction *action$(RPAREN)
 * {
 * FooBarPrivate *priv \= FOO_BAR_GET_PRIVATE $(LPAREN)bar$(RPAREN);
 * if $(LPAREN)priv->action \=\= action$(RPAREN)
 * return;
 * gtk_activatable_do_set_related_action $(LPAREN)GTK_ACTIVATABLE $(LPAREN)bar$(RPAREN), action$(RPAREN);
 * priv->action \= action;
 * }
 * ... Selectively reset and update activatable depending on the use-action-appearance property ...
 * static void
 * gtk_button_activatable_sync_action_properties $(LPAREN)GtkActivatable       *activatable,
 * GtkAction            *action$(RPAREN)
 * {
 * GtkButtonPrivate *priv \= GTK_BUTTON_GET_PRIVATE $(LPAREN)activatable$(RPAREN);
 * if $(LPAREN)!action$(RPAREN)
 * return;
 * if $(LPAREN)gtk_action_is_visible $(LPAREN)action$(RPAREN)$(RPAREN)
 * gtk_widget_show $(LPAREN)GTK_WIDGET $(LPAREN)activatable$(RPAREN)$(RPAREN);
 * else
 * gtk_widget_hide $(LPAREN)GTK_WIDGET $(LPAREN)activatable$(RPAREN)$(RPAREN);
 * gtk_widget_set_sensitive $(LPAREN)GTK_WIDGET $(LPAREN)activatable$(RPAREN), gtk_action_is_sensitive $(LPAREN)action$(RPAREN)$(RPAREN);
 * ...
 * if $(LPAREN)priv->use_action_appearance$(RPAREN)
 * {
 * if $(LPAREN)gtk_action_get_stock_id $(LPAREN)action$(RPAREN)$(RPAREN)
 * foo_bar_set_stock $(LPAREN)button, gtk_action_get_stock_id $(LPAREN)action$(RPAREN)$(RPAREN);
 * else if $(LPAREN)gtk_action_get_label $(LPAREN)action$(RPAREN)$(RPAREN)
 * foo_bar_set_label $(LPAREN)button, gtk_action_get_label $(LPAREN)action$(RPAREN)$(RPAREN);
 * ...
 * }
 * }
 * static void
 * foo_bar_activatable_update $(LPAREN)GtkActivatable       *activatable,
 * GtkAction            *action,
 * const gchar          *property_name$(RPAREN)
 * {
 * FooBarPrivate *priv \= FOO_BAR_GET_PRIVATE $(LPAREN)activatable$(RPAREN);
 * if $(LPAREN)strcmp $(LPAREN)property_name, "visible"$(RPAREN) \=\= 0$(RPAREN)
 * {
 * if $(LPAREN)gtk_action_is_visible $(LPAREN)action$(RPAREN)$(RPAREN)
 * gtk_widget_show $(LPAREN)GTK_WIDGET $(LPAREN)activatable$(RPAREN)$(RPAREN);
 * else
 * gtk_widget_hide $(LPAREN)GTK_WIDGET $(LPAREN)activatable$(RPAREN)$(RPAREN);
 * }
 * else if $(LPAREN)strcmp $(LPAREN)property_name, "sensitive"$(RPAREN) \=\= 0$(RPAREN)
 * gtk_widget_set_sensitive $(LPAREN)GTK_WIDGET $(LPAREN)activatable$(RPAREN), gtk_action_is_sensitive $(LPAREN)action$(RPAREN)$(RPAREN);
 * ...
 * if $(LPAREN)!priv->use_action_appearance$(RPAREN)
 * return;
 * if $(LPAREN)strcmp $(LPAREN)property_name, "stock-id"$(RPAREN) \=\= 0$(RPAREN)
 * foo_bar_set_stock $(LPAREN)button, gtk_action_get_stock_id $(LPAREN)action$(RPAREN)$(RPAREN);
 * else if $(LPAREN)strcmp $(LPAREN)property_name, "label"$(RPAREN) \=\= 0$(RPAREN)
 * foo_bar_set_label $(LPAREN)button, gtk_action_get_label $(LPAREN)action$(RPAREN)$(RPAREN);
 * ...
 * }
 * ]|
 */
interface Activatable
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_activatable_get_type != &gidSymbolNotFound ? gtk_activatable_get_type() : cast(GType)0;
  }

  /**
   * This is a utility function for #GtkActivatable implementors.
   * When implementing #GtkActivatable you must call this when
   * handling changes of the #GtkActivatable:related-action, and
   * you must also use this to break references in #GObject->dispose$(LPAREN)$(RPAREN).
   * This function adds a reference to the currently set related
   * action for you, it also makes sure the #GtkActivatable->update$(LPAREN)$(RPAREN)
   * method is called when the related #GtkAction properties change
   * and registers to the action’s proxy list.
   * > Be careful to call this before setting the local
   * > copy of the #GtkAction property, since this function uses
   * > [gtk.activatable.Activatable.getRelatedAction] to retrieve the
   * > previous action.
   * Params:
   *   action = the #GtkAction to set
   */
  void doSetRelatedAction(gtk.action.Action action);

  /**
   * Gets the related #GtkAction for activatable.
   * Returns: the related #GtkAction if one is set.
   */
  gtk.action.Action getRelatedAction();

  /**
   * Gets whether this activatable should reset its layout
   * and appearance when setting the related action or when
   * the action changes appearance.
   * Returns: whether activatable uses its actions appearance.
   */
  bool getUseActionAppearance();

  /**
   * Sets the related action on the activatable object.
   * > #GtkActivatable implementors need to handle the #GtkActivatable:related-action
   * > property and call [gtk.activatable.Activatable.doSetRelatedAction] when it changes.
   * Params:
   *   action = the #GtkAction to set
   */
  void setRelatedAction(gtk.action.Action action);

  /**
   * Sets whether this activatable should reset its layout and appearance
   * when setting the related action or when the action changes appearance
   * > #GtkActivatable implementors need to handle the
   * > #GtkActivatable:use-action-appearance property and call
   * > [gtk.activatable.Activatable.syncActionProperties] to update activatable
   * > if needed.
   * Params:
   *   useAppearance = whether to use the actions appearance
   */
  void setUseActionAppearance(bool useAppearance);

  /**
   * This is called to update the activatable completely, this is called
   * internally when the #GtkActivatable:related-action property is set
   * or unset and by the implementing class when
   * #GtkActivatable:use-action-appearance changes.
   * Params:
   *   action = the related #GtkAction or %NULL
   */
  void syncActionProperties(gtk.action.Action action);
}
