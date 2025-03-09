module adw.c.functions;

public import gid.basictypes;
import gid.loader;
import adw.c.types;
public import gio.c.types;
public import gtk.c.types;

version(Windows)
  private immutable LIBS = ["libadwaita-1-0.dll;adwaita-1-0.dll;adwaita-1.dll"];
else version(OSX)
  private immutable LIBS = ["libadwaita-1.0.dylib"];
else
  private immutable LIBS = ["libadwaita-1.so.0"];

__gshared extern(C)
{
  // AboutDialog
  extern(C) GType function() c_adw_about_dialog_get_type;
  AdwDialog* function() c_adw_about_dialog_new;
  AdwDialog* function(const(char)* resourcePath, const(char)* releaseNotesVersion) c_adw_about_dialog_new_from_appdata;
  void function(AdwAboutDialog* self, const(char)* name, const(char*)* people) c_adw_about_dialog_add_acknowledgement_section;
  void function(AdwAboutDialog* self, const(char)* name, const(char*)* people) c_adw_about_dialog_add_credit_section;
  void function(AdwAboutDialog* self, const(char)* title, const(char)* copyright, GtkLicense licenseType, const(char)* license) c_adw_about_dialog_add_legal_section;
  void function(AdwAboutDialog* self, const(char)* title, const(char)* url) c_adw_about_dialog_add_link;
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_application_icon;
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_application_name;
  const(char*)* function(AdwAboutDialog* self) c_adw_about_dialog_get_artists;
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_comments;
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_copyright;
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_debug_info;
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_debug_info_filename;
  const(char*)* function(AdwAboutDialog* self) c_adw_about_dialog_get_designers;
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_developer_name;
  const(char*)* function(AdwAboutDialog* self) c_adw_about_dialog_get_developers;
  const(char*)* function(AdwAboutDialog* self) c_adw_about_dialog_get_documenters;
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_issue_url;
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_license;
  GtkLicense function(AdwAboutDialog* self) c_adw_about_dialog_get_license_type;
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_release_notes;
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_release_notes_version;
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_support_url;
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_translator_credits;
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_version;
  const(char)* function(AdwAboutDialog* self) c_adw_about_dialog_get_website;
  void function(AdwAboutDialog* self, const(char)* applicationIcon) c_adw_about_dialog_set_application_icon;
  void function(AdwAboutDialog* self, const(char)* applicationName) c_adw_about_dialog_set_application_name;
  void function(AdwAboutDialog* self, const(char*)* artists) c_adw_about_dialog_set_artists;
  void function(AdwAboutDialog* self, const(char)* comments) c_adw_about_dialog_set_comments;
  void function(AdwAboutDialog* self, const(char)* copyright) c_adw_about_dialog_set_copyright;
  void function(AdwAboutDialog* self, const(char)* debugInfo) c_adw_about_dialog_set_debug_info;
  void function(AdwAboutDialog* self, const(char)* filename) c_adw_about_dialog_set_debug_info_filename;
  void function(AdwAboutDialog* self, const(char*)* designers) c_adw_about_dialog_set_designers;
  void function(AdwAboutDialog* self, const(char)* developerName) c_adw_about_dialog_set_developer_name;
  void function(AdwAboutDialog* self, const(char*)* developers) c_adw_about_dialog_set_developers;
  void function(AdwAboutDialog* self, const(char*)* documenters) c_adw_about_dialog_set_documenters;
  void function(AdwAboutDialog* self, const(char)* issueUrl) c_adw_about_dialog_set_issue_url;
  void function(AdwAboutDialog* self, const(char)* license) c_adw_about_dialog_set_license;
  void function(AdwAboutDialog* self, GtkLicense licenseType) c_adw_about_dialog_set_license_type;
  void function(AdwAboutDialog* self, const(char)* releaseNotes) c_adw_about_dialog_set_release_notes;
  void function(AdwAboutDialog* self, const(char)* version_) c_adw_about_dialog_set_release_notes_version;
  void function(AdwAboutDialog* self, const(char)* supportUrl) c_adw_about_dialog_set_support_url;
  void function(AdwAboutDialog* self, const(char)* translatorCredits) c_adw_about_dialog_set_translator_credits;
  void function(AdwAboutDialog* self, const(char)* version_) c_adw_about_dialog_set_version;
  void function(AdwAboutDialog* self, const(char)* website) c_adw_about_dialog_set_website;

  // AboutWindow
  extern(C) GType function() c_adw_about_window_get_type;
  GtkWidget* function() c_adw_about_window_new;
  GtkWidget* function(const(char)* resourcePath, const(char)* releaseNotesVersion) c_adw_about_window_new_from_appdata;
  void function(AdwAboutWindow* self, const(char)* name, const(char*)* people) c_adw_about_window_add_acknowledgement_section;
  void function(AdwAboutWindow* self, const(char)* name, const(char*)* people) c_adw_about_window_add_credit_section;
  void function(AdwAboutWindow* self, const(char)* title, const(char)* copyright, GtkLicense licenseType, const(char)* license) c_adw_about_window_add_legal_section;
  void function(AdwAboutWindow* self, const(char)* title, const(char)* url) c_adw_about_window_add_link;
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_application_icon;
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_application_name;
  const(char*)* function(AdwAboutWindow* self) c_adw_about_window_get_artists;
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_comments;
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_copyright;
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_debug_info;
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_debug_info_filename;
  const(char*)* function(AdwAboutWindow* self) c_adw_about_window_get_designers;
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_developer_name;
  const(char*)* function(AdwAboutWindow* self) c_adw_about_window_get_developers;
  const(char*)* function(AdwAboutWindow* self) c_adw_about_window_get_documenters;
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_issue_url;
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_license;
  GtkLicense function(AdwAboutWindow* self) c_adw_about_window_get_license_type;
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_release_notes;
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_release_notes_version;
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_support_url;
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_translator_credits;
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_version;
  const(char)* function(AdwAboutWindow* self) c_adw_about_window_get_website;
  void function(AdwAboutWindow* self, const(char)* applicationIcon) c_adw_about_window_set_application_icon;
  void function(AdwAboutWindow* self, const(char)* applicationName) c_adw_about_window_set_application_name;
  void function(AdwAboutWindow* self, const(char*)* artists) c_adw_about_window_set_artists;
  void function(AdwAboutWindow* self, const(char)* comments) c_adw_about_window_set_comments;
  void function(AdwAboutWindow* self, const(char)* copyright) c_adw_about_window_set_copyright;
  void function(AdwAboutWindow* self, const(char)* debugInfo) c_adw_about_window_set_debug_info;
  void function(AdwAboutWindow* self, const(char)* filename) c_adw_about_window_set_debug_info_filename;
  void function(AdwAboutWindow* self, const(char*)* designers) c_adw_about_window_set_designers;
  void function(AdwAboutWindow* self, const(char)* developerName) c_adw_about_window_set_developer_name;
  void function(AdwAboutWindow* self, const(char*)* developers) c_adw_about_window_set_developers;
  void function(AdwAboutWindow* self, const(char*)* documenters) c_adw_about_window_set_documenters;
  void function(AdwAboutWindow* self, const(char)* issueUrl) c_adw_about_window_set_issue_url;
  void function(AdwAboutWindow* self, const(char)* license) c_adw_about_window_set_license;
  void function(AdwAboutWindow* self, GtkLicense licenseType) c_adw_about_window_set_license_type;
  void function(AdwAboutWindow* self, const(char)* releaseNotes) c_adw_about_window_set_release_notes;
  void function(AdwAboutWindow* self, const(char)* version_) c_adw_about_window_set_release_notes_version;
  void function(AdwAboutWindow* self, const(char)* supportUrl) c_adw_about_window_set_support_url;
  void function(AdwAboutWindow* self, const(char)* translatorCredits) c_adw_about_window_set_translator_credits;
  void function(AdwAboutWindow* self, const(char)* version_) c_adw_about_window_set_version;
  void function(AdwAboutWindow* self, const(char)* website) c_adw_about_window_set_website;

  // ActionRow
  extern(C) GType function() c_adw_action_row_get_type;
  GtkWidget* function() c_adw_action_row_new;
  void function(AdwActionRow* self) c_adw_action_row_activate;
  void function(AdwActionRow* self, GtkWidget* widget) c_adw_action_row_add_prefix;
  void function(AdwActionRow* self, GtkWidget* widget) c_adw_action_row_add_suffix;
  GtkWidget* function(AdwActionRow* self) c_adw_action_row_get_activatable_widget;
  const(char)* function(AdwActionRow* self) c_adw_action_row_get_icon_name;
  const(char)* function(AdwActionRow* self) c_adw_action_row_get_subtitle;
  int function(AdwActionRow* self) c_adw_action_row_get_subtitle_lines;
  bool function(AdwActionRow* self) c_adw_action_row_get_subtitle_selectable;
  int function(AdwActionRow* self) c_adw_action_row_get_title_lines;
  void function(AdwActionRow* self, GtkWidget* widget) c_adw_action_row_remove;
  void function(AdwActionRow* self, GtkWidget* widget) c_adw_action_row_set_activatable_widget;
  void function(AdwActionRow* self, const(char)* iconName) c_adw_action_row_set_icon_name;
  void function(AdwActionRow* self, const(char)* subtitle) c_adw_action_row_set_subtitle;
  void function(AdwActionRow* self, int subtitleLines) c_adw_action_row_set_subtitle_lines;
  void function(AdwActionRow* self, bool subtitleSelectable) c_adw_action_row_set_subtitle_selectable;
  void function(AdwActionRow* self, int titleLines) c_adw_action_row_set_title_lines;

  // AlertDialog
  extern(C) GType function() c_adw_alert_dialog_get_type;
  AdwDialog* function(const(char)* heading, const(char)* body_) c_adw_alert_dialog_new;
  void function(AdwAlertDialog* self, const(char)* id, const(char)* label) c_adw_alert_dialog_add_response;
  void function(AdwAlertDialog* self, const(char)* firstId,  ...) c_adw_alert_dialog_add_responses;
  void function(AdwAlertDialog* self, GtkWidget* parent, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_adw_alert_dialog_choose;
  const(char)* function(AdwAlertDialog* self, GAsyncResult* result) c_adw_alert_dialog_choose_finish;
  void function(AdwAlertDialog* self, const(char)* format,  ...) c_adw_alert_dialog_format_body;
  void function(AdwAlertDialog* self, const(char)* format,  ...) c_adw_alert_dialog_format_body_markup;
  void function(AdwAlertDialog* self, const(char)* format,  ...) c_adw_alert_dialog_format_heading;
  void function(AdwAlertDialog* self, const(char)* format,  ...) c_adw_alert_dialog_format_heading_markup;
  const(char)* function(AdwAlertDialog* self) c_adw_alert_dialog_get_body;
  bool function(AdwAlertDialog* self) c_adw_alert_dialog_get_body_use_markup;
  const(char)* function(AdwAlertDialog* self) c_adw_alert_dialog_get_close_response;
  const(char)* function(AdwAlertDialog* self) c_adw_alert_dialog_get_default_response;
  GtkWidget* function(AdwAlertDialog* self) c_adw_alert_dialog_get_extra_child;
  const(char)* function(AdwAlertDialog* self) c_adw_alert_dialog_get_heading;
  bool function(AdwAlertDialog* self) c_adw_alert_dialog_get_heading_use_markup;
  AdwResponseAppearance function(AdwAlertDialog* self, const(char)* response) c_adw_alert_dialog_get_response_appearance;
  bool function(AdwAlertDialog* self, const(char)* response) c_adw_alert_dialog_get_response_enabled;
  const(char)* function(AdwAlertDialog* self, const(char)* response) c_adw_alert_dialog_get_response_label;
  bool function(AdwAlertDialog* self, const(char)* response) c_adw_alert_dialog_has_response;
  void function(AdwAlertDialog* self, const(char)* id) c_adw_alert_dialog_remove_response;
  void function(AdwAlertDialog* self, const(char)* body_) c_adw_alert_dialog_set_body;
  void function(AdwAlertDialog* self, bool useMarkup) c_adw_alert_dialog_set_body_use_markup;
  void function(AdwAlertDialog* self, const(char)* response) c_adw_alert_dialog_set_close_response;
  void function(AdwAlertDialog* self, const(char)* response) c_adw_alert_dialog_set_default_response;
  void function(AdwAlertDialog* self, GtkWidget* child) c_adw_alert_dialog_set_extra_child;
  void function(AdwAlertDialog* self, const(char)* heading) c_adw_alert_dialog_set_heading;
  void function(AdwAlertDialog* self, bool useMarkup) c_adw_alert_dialog_set_heading_use_markup;
  void function(AdwAlertDialog* self, const(char)* response, AdwResponseAppearance appearance) c_adw_alert_dialog_set_response_appearance;
  void function(AdwAlertDialog* self, const(char)* response, bool enabled) c_adw_alert_dialog_set_response_enabled;
  void function(AdwAlertDialog* self, const(char)* response, const(char)* label) c_adw_alert_dialog_set_response_label;

  // Animation
  extern(C) GType function() c_adw_animation_get_type;
  bool function(AdwAnimation* self) c_adw_animation_get_follow_enable_animations_setting;
  AdwAnimationState function(AdwAnimation* self) c_adw_animation_get_state;
  AdwAnimationTarget* function(AdwAnimation* self) c_adw_animation_get_target;
  double function(AdwAnimation* self) c_adw_animation_get_value;
  GtkWidget* function(AdwAnimation* self) c_adw_animation_get_widget;
  void function(AdwAnimation* self) c_adw_animation_pause;
  void function(AdwAnimation* self) c_adw_animation_play;
  void function(AdwAnimation* self) c_adw_animation_reset;
  void function(AdwAnimation* self) c_adw_animation_resume;
  void function(AdwAnimation* self, bool setting) c_adw_animation_set_follow_enable_animations_setting;
  void function(AdwAnimation* self, AdwAnimationTarget* target) c_adw_animation_set_target;
  void function(AdwAnimation* self) c_adw_animation_skip;

  // AnimationTarget
  extern(C) GType function() c_adw_animation_target_get_type;

  // Application
  extern(C) GType function() c_adw_application_get_type;
  AdwApplication* function(const(char)* applicationId, GApplicationFlags flags) c_adw_application_new;
  AdwStyleManager* function(AdwApplication* self) c_adw_application_get_style_manager;

  // ApplicationWindow
  extern(C) GType function() c_adw_application_window_get_type;
  GtkWidget* function(GtkApplication* app) c_adw_application_window_new;
  void function(AdwApplicationWindow* self, AdwBreakpoint* breakpoint) c_adw_application_window_add_breakpoint;
  GtkWidget* function(AdwApplicationWindow* self) c_adw_application_window_get_content;
  AdwBreakpoint* function(AdwApplicationWindow* self) c_adw_application_window_get_current_breakpoint;
  GListModel* function(AdwApplicationWindow* self) c_adw_application_window_get_dialogs;
  AdwDialog* function(AdwApplicationWindow* self) c_adw_application_window_get_visible_dialog;
  void function(AdwApplicationWindow* self, GtkWidget* content) c_adw_application_window_set_content;

  // Avatar
  extern(C) GType function() c_adw_avatar_get_type;
  GtkWidget* function(int size, const(char)* text, bool showInitials) c_adw_avatar_new;
  GdkTexture* function(AdwAvatar* self, int scaleFactor) c_adw_avatar_draw_to_texture;
  GdkPaintable* function(AdwAvatar* self) c_adw_avatar_get_custom_image;
  const(char)* function(AdwAvatar* self) c_adw_avatar_get_icon_name;
  bool function(AdwAvatar* self) c_adw_avatar_get_show_initials;
  int function(AdwAvatar* self) c_adw_avatar_get_size;
  const(char)* function(AdwAvatar* self) c_adw_avatar_get_text;
  void function(AdwAvatar* self, GdkPaintable* customImage) c_adw_avatar_set_custom_image;
  void function(AdwAvatar* self, const(char)* iconName) c_adw_avatar_set_icon_name;
  void function(AdwAvatar* self, bool showInitials) c_adw_avatar_set_show_initials;
  void function(AdwAvatar* self, int size) c_adw_avatar_set_size;
  void function(AdwAvatar* self, const(char)* text) c_adw_avatar_set_text;

  // Banner
  extern(C) GType function() c_adw_banner_get_type;
  GtkWidget* function(const(char)* title) c_adw_banner_new;
  const(char)* function(AdwBanner* self) c_adw_banner_get_button_label;
  bool function(AdwBanner* self) c_adw_banner_get_revealed;
  const(char)* function(AdwBanner* self) c_adw_banner_get_title;
  bool function(AdwBanner* self) c_adw_banner_get_use_markup;
  void function(AdwBanner* self, const(char)* label) c_adw_banner_set_button_label;
  void function(AdwBanner* self, bool revealed) c_adw_banner_set_revealed;
  void function(AdwBanner* self, const(char)* title) c_adw_banner_set_title;
  void function(AdwBanner* self, bool useMarkup) c_adw_banner_set_use_markup;

  // Bin
  extern(C) GType function() c_adw_bin_get_type;
  GtkWidget* function() c_adw_bin_new;
  GtkWidget* function(AdwBin* self) c_adw_bin_get_child;
  void function(AdwBin* self, GtkWidget* child) c_adw_bin_set_child;

  // Breakpoint
  extern(C) GType function() c_adw_breakpoint_get_type;
  AdwBreakpoint* function(AdwBreakpointCondition* condition) c_adw_breakpoint_new;
  void function(AdwBreakpoint* self, ObjectC* object, const(char)* property, const(GValue)* value) c_adw_breakpoint_add_setter;
  void function(AdwBreakpoint* self, ObjectC* firstObject, const(char)* firstProperty,  ...) c_adw_breakpoint_add_setters;
  void function(AdwBreakpoint* self, ObjectC* firstObject, const(char)* firstProperty, void* args) c_adw_breakpoint_add_setters_valist;
  void function(AdwBreakpoint* self, int nSetters, ObjectC** objects, const(char*)* names, const(GValue*)* values) c_adw_breakpoint_add_settersv;
  AdwBreakpointCondition* function(AdwBreakpoint* self) c_adw_breakpoint_get_condition;
  void function(AdwBreakpoint* self, AdwBreakpointCondition* condition) c_adw_breakpoint_set_condition;

  // BreakpointBin
  extern(C) GType function() c_adw_breakpoint_bin_get_type;
  GtkWidget* function() c_adw_breakpoint_bin_new;
  void function(AdwBreakpointBin* self, AdwBreakpoint* breakpoint) c_adw_breakpoint_bin_add_breakpoint;
  GtkWidget* function(AdwBreakpointBin* self) c_adw_breakpoint_bin_get_child;
  AdwBreakpoint* function(AdwBreakpointBin* self) c_adw_breakpoint_bin_get_current_breakpoint;
  void function(AdwBreakpointBin* self, AdwBreakpoint* breakpoint) c_adw_breakpoint_bin_remove_breakpoint;
  void function(AdwBreakpointBin* self, GtkWidget* child) c_adw_breakpoint_bin_set_child;

  // BreakpointCondition
  extern(C) GType function() c_adw_breakpoint_condition_get_type;
  AdwBreakpointCondition* function(AdwBreakpointCondition* condition1, AdwBreakpointCondition* condition2) c_adw_breakpoint_condition_new_and;
  AdwBreakpointCondition* function(AdwBreakpointConditionLengthType type, double value, AdwLengthUnit unit) c_adw_breakpoint_condition_new_length;
  AdwBreakpointCondition* function(AdwBreakpointCondition* condition1, AdwBreakpointCondition* condition2) c_adw_breakpoint_condition_new_or;
  AdwBreakpointCondition* function(AdwBreakpointConditionRatioType type, int width, int height) c_adw_breakpoint_condition_new_ratio;
  AdwBreakpointCondition* function(AdwBreakpointCondition* self) c_adw_breakpoint_condition_copy;
  void function(AdwBreakpointCondition* self) c_adw_breakpoint_condition_free;
  char* function(AdwBreakpointCondition* self) c_adw_breakpoint_condition_to_string;
  AdwBreakpointCondition* function(const(char)* str) c_adw_breakpoint_condition_parse;

  // ButtonContent
  extern(C) GType function() c_adw_button_content_get_type;
  GtkWidget* function() c_adw_button_content_new;
  bool function(AdwButtonContent* self) c_adw_button_content_get_can_shrink;
  const(char)* function(AdwButtonContent* self) c_adw_button_content_get_icon_name;
  const(char)* function(AdwButtonContent* self) c_adw_button_content_get_label;
  bool function(AdwButtonContent* self) c_adw_button_content_get_use_underline;
  void function(AdwButtonContent* self, bool canShrink) c_adw_button_content_set_can_shrink;
  void function(AdwButtonContent* self, const(char)* iconName) c_adw_button_content_set_icon_name;
  void function(AdwButtonContent* self, const(char)* label) c_adw_button_content_set_label;
  void function(AdwButtonContent* self, bool useUnderline) c_adw_button_content_set_use_underline;

  // CallbackAnimationTarget
  extern(C) GType function() c_adw_callback_animation_target_get_type;
  AdwAnimationTarget* function(AdwAnimationTargetFunc callback, void* userData, GDestroyNotify destroy) c_adw_callback_animation_target_new;

  // Carousel
  extern(C) GType function() c_adw_carousel_get_type;
  GtkWidget* function() c_adw_carousel_new;
  void function(AdwCarousel* self, GtkWidget* child) c_adw_carousel_append;
  bool function(AdwCarousel* self) c_adw_carousel_get_allow_long_swipes;
  bool function(AdwCarousel* self) c_adw_carousel_get_allow_mouse_drag;
  bool function(AdwCarousel* self) c_adw_carousel_get_allow_scroll_wheel;
  bool function(AdwCarousel* self) c_adw_carousel_get_interactive;
  uint function(AdwCarousel* self) c_adw_carousel_get_n_pages;
  GtkWidget* function(AdwCarousel* self, uint n) c_adw_carousel_get_nth_page;
  double function(AdwCarousel* self) c_adw_carousel_get_position;
  uint function(AdwCarousel* self) c_adw_carousel_get_reveal_duration;
  AdwSpringParams* function(AdwCarousel* self) c_adw_carousel_get_scroll_params;
  uint function(AdwCarousel* self) c_adw_carousel_get_spacing;
  void function(AdwCarousel* self, GtkWidget* child, int position) c_adw_carousel_insert;
  void function(AdwCarousel* self, GtkWidget* child) c_adw_carousel_prepend;
  void function(AdwCarousel* self, GtkWidget* child) c_adw_carousel_remove;
  void function(AdwCarousel* self, GtkWidget* child, int position) c_adw_carousel_reorder;
  void function(AdwCarousel* self, GtkWidget* widget, bool animate) c_adw_carousel_scroll_to;
  void function(AdwCarousel* self, bool allowLongSwipes) c_adw_carousel_set_allow_long_swipes;
  void function(AdwCarousel* self, bool allowMouseDrag) c_adw_carousel_set_allow_mouse_drag;
  void function(AdwCarousel* self, bool allowScrollWheel) c_adw_carousel_set_allow_scroll_wheel;
  void function(AdwCarousel* self, bool interactive) c_adw_carousel_set_interactive;
  void function(AdwCarousel* self, uint revealDuration) c_adw_carousel_set_reveal_duration;
  void function(AdwCarousel* self, AdwSpringParams* params) c_adw_carousel_set_scroll_params;
  void function(AdwCarousel* self, uint spacing) c_adw_carousel_set_spacing;

  // CarouselIndicatorDots
  extern(C) GType function() c_adw_carousel_indicator_dots_get_type;
  GtkWidget* function() c_adw_carousel_indicator_dots_new;
  AdwCarousel* function(AdwCarouselIndicatorDots* self) c_adw_carousel_indicator_dots_get_carousel;
  void function(AdwCarouselIndicatorDots* self, AdwCarousel* carousel) c_adw_carousel_indicator_dots_set_carousel;

  // CarouselIndicatorLines
  extern(C) GType function() c_adw_carousel_indicator_lines_get_type;
  GtkWidget* function() c_adw_carousel_indicator_lines_new;
  AdwCarousel* function(AdwCarouselIndicatorLines* self) c_adw_carousel_indicator_lines_get_carousel;
  void function(AdwCarouselIndicatorLines* self, AdwCarousel* carousel) c_adw_carousel_indicator_lines_set_carousel;

  // Clamp
  extern(C) GType function() c_adw_clamp_get_type;
  GtkWidget* function() c_adw_clamp_new;
  GtkWidget* function(AdwClamp* self) c_adw_clamp_get_child;
  int function(AdwClamp* self) c_adw_clamp_get_maximum_size;
  int function(AdwClamp* self) c_adw_clamp_get_tightening_threshold;
  AdwLengthUnit function(AdwClamp* self) c_adw_clamp_get_unit;
  void function(AdwClamp* self, GtkWidget* child) c_adw_clamp_set_child;
  void function(AdwClamp* self, int maximumSize) c_adw_clamp_set_maximum_size;
  void function(AdwClamp* self, int tighteningThreshold) c_adw_clamp_set_tightening_threshold;
  void function(AdwClamp* self, AdwLengthUnit unit) c_adw_clamp_set_unit;

  // ClampLayout
  extern(C) GType function() c_adw_clamp_layout_get_type;
  GtkLayoutManager* function() c_adw_clamp_layout_new;
  int function(AdwClampLayout* self) c_adw_clamp_layout_get_maximum_size;
  int function(AdwClampLayout* self) c_adw_clamp_layout_get_tightening_threshold;
  AdwLengthUnit function(AdwClampLayout* self) c_adw_clamp_layout_get_unit;
  void function(AdwClampLayout* self, int maximumSize) c_adw_clamp_layout_set_maximum_size;
  void function(AdwClampLayout* self, int tighteningThreshold) c_adw_clamp_layout_set_tightening_threshold;
  void function(AdwClampLayout* self, AdwLengthUnit unit) c_adw_clamp_layout_set_unit;

  // ClampScrollable
  extern(C) GType function() c_adw_clamp_scrollable_get_type;
  GtkWidget* function() c_adw_clamp_scrollable_new;
  GtkWidget* function(AdwClampScrollable* self) c_adw_clamp_scrollable_get_child;
  int function(AdwClampScrollable* self) c_adw_clamp_scrollable_get_maximum_size;
  int function(AdwClampScrollable* self) c_adw_clamp_scrollable_get_tightening_threshold;
  AdwLengthUnit function(AdwClampScrollable* self) c_adw_clamp_scrollable_get_unit;
  void function(AdwClampScrollable* self, GtkWidget* child) c_adw_clamp_scrollable_set_child;
  void function(AdwClampScrollable* self, int maximumSize) c_adw_clamp_scrollable_set_maximum_size;
  void function(AdwClampScrollable* self, int tighteningThreshold) c_adw_clamp_scrollable_set_tightening_threshold;
  void function(AdwClampScrollable* self, AdwLengthUnit unit) c_adw_clamp_scrollable_set_unit;

  // ComboRow
  extern(C) GType function() c_adw_combo_row_get_type;
  GtkWidget* function() c_adw_combo_row_new;
  bool function(AdwComboRow* self) c_adw_combo_row_get_enable_search;
  GtkExpression* function(AdwComboRow* self) c_adw_combo_row_get_expression;
  GtkListItemFactory* function(AdwComboRow* self) c_adw_combo_row_get_factory;
  GtkListItemFactory* function(AdwComboRow* self) c_adw_combo_row_get_list_factory;
  GListModel* function(AdwComboRow* self) c_adw_combo_row_get_model;
  uint function(AdwComboRow* self) c_adw_combo_row_get_selected;
  ObjectC* function(AdwComboRow* self) c_adw_combo_row_get_selected_item;
  bool function(AdwComboRow* self) c_adw_combo_row_get_use_subtitle;
  void function(AdwComboRow* self, bool enableSearch) c_adw_combo_row_set_enable_search;
  void function(AdwComboRow* self, GtkExpression* expression) c_adw_combo_row_set_expression;
  void function(AdwComboRow* self, GtkListItemFactory* factory) c_adw_combo_row_set_factory;
  void function(AdwComboRow* self, GtkListItemFactory* factory) c_adw_combo_row_set_list_factory;
  void function(AdwComboRow* self, GListModel* model) c_adw_combo_row_set_model;
  void function(AdwComboRow* self, uint position) c_adw_combo_row_set_selected;
  void function(AdwComboRow* self, bool useSubtitle) c_adw_combo_row_set_use_subtitle;

  // Dialog
  extern(C) GType function() c_adw_dialog_get_type;
  AdwDialog* function() c_adw_dialog_new;
  void function(AdwDialog* self, AdwBreakpoint* breakpoint) c_adw_dialog_add_breakpoint;
  bool function(AdwDialog* self) c_adw_dialog_close;
  void function(AdwDialog* self) c_adw_dialog_force_close;
  bool function(AdwDialog* self) c_adw_dialog_get_can_close;
  GtkWidget* function(AdwDialog* self) c_adw_dialog_get_child;
  int function(AdwDialog* self) c_adw_dialog_get_content_height;
  int function(AdwDialog* self) c_adw_dialog_get_content_width;
  AdwBreakpoint* function(AdwDialog* self) c_adw_dialog_get_current_breakpoint;
  GtkWidget* function(AdwDialog* self) c_adw_dialog_get_default_widget;
  GtkWidget* function(AdwDialog* self) c_adw_dialog_get_focus;
  bool function(AdwDialog* self) c_adw_dialog_get_follows_content_size;
  AdwDialogPresentationMode function(AdwDialog* self) c_adw_dialog_get_presentation_mode;
  const(char)* function(AdwDialog* self) c_adw_dialog_get_title;
  void function(AdwDialog* self, GtkWidget* parent) c_adw_dialog_present;
  void function(AdwDialog* self, bool canClose) c_adw_dialog_set_can_close;
  void function(AdwDialog* self, GtkWidget* child) c_adw_dialog_set_child;
  void function(AdwDialog* self, int contentHeight) c_adw_dialog_set_content_height;
  void function(AdwDialog* self, int contentWidth) c_adw_dialog_set_content_width;
  void function(AdwDialog* self, GtkWidget* defaultWidget) c_adw_dialog_set_default_widget;
  void function(AdwDialog* self, GtkWidget* focus) c_adw_dialog_set_focus;
  void function(AdwDialog* self, bool followsContentSize) c_adw_dialog_set_follows_content_size;
  void function(AdwDialog* self, AdwDialogPresentationMode presentationMode) c_adw_dialog_set_presentation_mode;
  void function(AdwDialog* self, const(char)* title) c_adw_dialog_set_title;

  // EntryRow
  extern(C) GType function() c_adw_entry_row_get_type;
  GtkWidget* function() c_adw_entry_row_new;
  void function(AdwEntryRow* self, GtkWidget* widget) c_adw_entry_row_add_prefix;
  void function(AdwEntryRow* self, GtkWidget* widget) c_adw_entry_row_add_suffix;
  bool function(AdwEntryRow* self) c_adw_entry_row_get_activates_default;
  PangoAttrList* function(AdwEntryRow* self) c_adw_entry_row_get_attributes;
  bool function(AdwEntryRow* self) c_adw_entry_row_get_enable_emoji_completion;
  GtkInputHints function(AdwEntryRow* self) c_adw_entry_row_get_input_hints;
  GtkInputPurpose function(AdwEntryRow* self) c_adw_entry_row_get_input_purpose;
  bool function(AdwEntryRow* self) c_adw_entry_row_get_show_apply_button;
  uint function(AdwEntryRow* self) c_adw_entry_row_get_text_length;
  bool function(AdwEntryRow* self) c_adw_entry_row_grab_focus_without_selecting;
  void function(AdwEntryRow* self, GtkWidget* widget) c_adw_entry_row_remove;
  void function(AdwEntryRow* self, bool activates) c_adw_entry_row_set_activates_default;
  void function(AdwEntryRow* self, PangoAttrList* attributes) c_adw_entry_row_set_attributes;
  void function(AdwEntryRow* self, bool enableEmojiCompletion) c_adw_entry_row_set_enable_emoji_completion;
  void function(AdwEntryRow* self, GtkInputHints hints) c_adw_entry_row_set_input_hints;
  void function(AdwEntryRow* self, GtkInputPurpose purpose) c_adw_entry_row_set_input_purpose;
  void function(AdwEntryRow* self, bool showApplyButton) c_adw_entry_row_set_show_apply_button;

  // EnumListItem
  extern(C) GType function() c_adw_enum_list_item_get_type;
  const(char)* function(AdwEnumListItem* self) c_adw_enum_list_item_get_name;
  const(char)* function(AdwEnumListItem* self) c_adw_enum_list_item_get_nick;
  int function(AdwEnumListItem* self) c_adw_enum_list_item_get_value;

  // EnumListModel
  extern(C) GType function() c_adw_enum_list_model_get_type;
  AdwEnumListModel* function(GType enumType) c_adw_enum_list_model_new;
  uint function(AdwEnumListModel* self, int value) c_adw_enum_list_model_find_position;
  GType function(AdwEnumListModel* self) c_adw_enum_list_model_get_enum_type;

  // ExpanderRow
  extern(C) GType function() c_adw_expander_row_get_type;
  GtkWidget* function() c_adw_expander_row_new;
  void function(AdwExpanderRow* self, GtkWidget* widget) c_adw_expander_row_add_action;
  void function(AdwExpanderRow* self, GtkWidget* widget) c_adw_expander_row_add_prefix;
  void function(AdwExpanderRow* self, GtkWidget* child) c_adw_expander_row_add_row;
  void function(AdwExpanderRow* self, GtkWidget* widget) c_adw_expander_row_add_suffix;
  bool function(AdwExpanderRow* self) c_adw_expander_row_get_enable_expansion;
  bool function(AdwExpanderRow* self) c_adw_expander_row_get_expanded;
  const(char)* function(AdwExpanderRow* self) c_adw_expander_row_get_icon_name;
  bool function(AdwExpanderRow* self) c_adw_expander_row_get_show_enable_switch;
  const(char)* function(AdwExpanderRow* self) c_adw_expander_row_get_subtitle;
  int function(AdwExpanderRow* self) c_adw_expander_row_get_subtitle_lines;
  int function(AdwExpanderRow* self) c_adw_expander_row_get_title_lines;
  void function(AdwExpanderRow* self, GtkWidget* child) c_adw_expander_row_remove;
  void function(AdwExpanderRow* self, bool enableExpansion) c_adw_expander_row_set_enable_expansion;
  void function(AdwExpanderRow* self, bool expanded) c_adw_expander_row_set_expanded;
  void function(AdwExpanderRow* self, const(char)* iconName) c_adw_expander_row_set_icon_name;
  void function(AdwExpanderRow* self, bool showEnableSwitch) c_adw_expander_row_set_show_enable_switch;
  void function(AdwExpanderRow* self, const(char)* subtitle) c_adw_expander_row_set_subtitle;
  void function(AdwExpanderRow* self, int subtitleLines) c_adw_expander_row_set_subtitle_lines;
  void function(AdwExpanderRow* self, int titleLines) c_adw_expander_row_set_title_lines;

  // Flap
  extern(C) GType function() c_adw_flap_get_type;
  GtkWidget* function() c_adw_flap_new;
  GtkWidget* function(AdwFlap* self) c_adw_flap_get_content;
  GtkWidget* function(AdwFlap* self) c_adw_flap_get_flap;
  GtkPackType function(AdwFlap* self) c_adw_flap_get_flap_position;
  uint function(AdwFlap* self) c_adw_flap_get_fold_duration;
  AdwFlapFoldPolicy function(AdwFlap* self) c_adw_flap_get_fold_policy;
  AdwFoldThresholdPolicy function(AdwFlap* self) c_adw_flap_get_fold_threshold_policy;
  bool function(AdwFlap* self) c_adw_flap_get_folded;
  bool function(AdwFlap* self) c_adw_flap_get_locked;
  bool function(AdwFlap* self) c_adw_flap_get_modal;
  bool function(AdwFlap* self) c_adw_flap_get_reveal_flap;
  AdwSpringParams* function(AdwFlap* self) c_adw_flap_get_reveal_params;
  double function(AdwFlap* self) c_adw_flap_get_reveal_progress;
  GtkWidget* function(AdwFlap* self) c_adw_flap_get_separator;
  bool function(AdwFlap* self) c_adw_flap_get_swipe_to_close;
  bool function(AdwFlap* self) c_adw_flap_get_swipe_to_open;
  AdwFlapTransitionType function(AdwFlap* self) c_adw_flap_get_transition_type;
  void function(AdwFlap* self, GtkWidget* content) c_adw_flap_set_content;
  void function(AdwFlap* self, GtkWidget* flap) c_adw_flap_set_flap;
  void function(AdwFlap* self, GtkPackType position) c_adw_flap_set_flap_position;
  void function(AdwFlap* self, uint duration) c_adw_flap_set_fold_duration;
  void function(AdwFlap* self, AdwFlapFoldPolicy policy) c_adw_flap_set_fold_policy;
  void function(AdwFlap* self, AdwFoldThresholdPolicy policy) c_adw_flap_set_fold_threshold_policy;
  void function(AdwFlap* self, bool locked) c_adw_flap_set_locked;
  void function(AdwFlap* self, bool modal) c_adw_flap_set_modal;
  void function(AdwFlap* self, bool revealFlap) c_adw_flap_set_reveal_flap;
  void function(AdwFlap* self, AdwSpringParams* params) c_adw_flap_set_reveal_params;
  void function(AdwFlap* self, GtkWidget* separator) c_adw_flap_set_separator;
  void function(AdwFlap* self, bool swipeToClose) c_adw_flap_set_swipe_to_close;
  void function(AdwFlap* self, bool swipeToOpen) c_adw_flap_set_swipe_to_open;
  void function(AdwFlap* self, AdwFlapTransitionType transitionType) c_adw_flap_set_transition_type;

  // HeaderBar
  extern(C) GType function() c_adw_header_bar_get_type;
  GtkWidget* function() c_adw_header_bar_new;
  AdwCenteringPolicy function(AdwHeaderBar* self) c_adw_header_bar_get_centering_policy;
  const(char)* function(AdwHeaderBar* self) c_adw_header_bar_get_decoration_layout;
  bool function(AdwHeaderBar* self) c_adw_header_bar_get_show_back_button;
  bool function(AdwHeaderBar* self) c_adw_header_bar_get_show_end_title_buttons;
  bool function(AdwHeaderBar* self) c_adw_header_bar_get_show_start_title_buttons;
  bool function(AdwHeaderBar* self) c_adw_header_bar_get_show_title;
  GtkWidget* function(AdwHeaderBar* self) c_adw_header_bar_get_title_widget;
  void function(AdwHeaderBar* self, GtkWidget* child) c_adw_header_bar_pack_end;
  void function(AdwHeaderBar* self, GtkWidget* child) c_adw_header_bar_pack_start;
  void function(AdwHeaderBar* self, GtkWidget* child) c_adw_header_bar_remove;
  void function(AdwHeaderBar* self, AdwCenteringPolicy centeringPolicy) c_adw_header_bar_set_centering_policy;
  void function(AdwHeaderBar* self, const(char)* layout) c_adw_header_bar_set_decoration_layout;
  void function(AdwHeaderBar* self, bool showBackButton) c_adw_header_bar_set_show_back_button;
  void function(AdwHeaderBar* self, bool setting) c_adw_header_bar_set_show_end_title_buttons;
  void function(AdwHeaderBar* self, bool setting) c_adw_header_bar_set_show_start_title_buttons;
  void function(AdwHeaderBar* self, bool showTitle) c_adw_header_bar_set_show_title;
  void function(AdwHeaderBar* self, GtkWidget* titleWidget) c_adw_header_bar_set_title_widget;

  // Leaflet
  extern(C) GType function() c_adw_leaflet_get_type;
  GtkWidget* function() c_adw_leaflet_new;
  AdwLeafletPage* function(AdwLeaflet* self, GtkWidget* child) c_adw_leaflet_append;
  GtkWidget* function(AdwLeaflet* self, AdwNavigationDirection direction) c_adw_leaflet_get_adjacent_child;
  bool function(AdwLeaflet* self) c_adw_leaflet_get_can_navigate_back;
  bool function(AdwLeaflet* self) c_adw_leaflet_get_can_navigate_forward;
  bool function(AdwLeaflet* self) c_adw_leaflet_get_can_unfold;
  GtkWidget* function(AdwLeaflet* self, const(char)* name) c_adw_leaflet_get_child_by_name;
  AdwSpringParams* function(AdwLeaflet* self) c_adw_leaflet_get_child_transition_params;
  bool function(AdwLeaflet* self) c_adw_leaflet_get_child_transition_running;
  AdwFoldThresholdPolicy function(AdwLeaflet* self) c_adw_leaflet_get_fold_threshold_policy;
  bool function(AdwLeaflet* self) c_adw_leaflet_get_folded;
  bool function(AdwLeaflet* self) c_adw_leaflet_get_homogeneous;
  uint function(AdwLeaflet* self) c_adw_leaflet_get_mode_transition_duration;
  AdwLeafletPage* function(AdwLeaflet* self, GtkWidget* child) c_adw_leaflet_get_page;
  GtkSelectionModel* function(AdwLeaflet* self) c_adw_leaflet_get_pages;
  AdwLeafletTransitionType function(AdwLeaflet* self) c_adw_leaflet_get_transition_type;
  GtkWidget* function(AdwLeaflet* self) c_adw_leaflet_get_visible_child;
  const(char)* function(AdwLeaflet* self) c_adw_leaflet_get_visible_child_name;
  AdwLeafletPage* function(AdwLeaflet* self, GtkWidget* child, GtkWidget* sibling) c_adw_leaflet_insert_child_after;
  bool function(AdwLeaflet* self, AdwNavigationDirection direction) c_adw_leaflet_navigate;
  AdwLeafletPage* function(AdwLeaflet* self, GtkWidget* child) c_adw_leaflet_prepend;
  void function(AdwLeaflet* self, GtkWidget* child) c_adw_leaflet_remove;
  void function(AdwLeaflet* self, GtkWidget* child, GtkWidget* sibling) c_adw_leaflet_reorder_child_after;
  void function(AdwLeaflet* self, bool canNavigateBack) c_adw_leaflet_set_can_navigate_back;
  void function(AdwLeaflet* self, bool canNavigateForward) c_adw_leaflet_set_can_navigate_forward;
  void function(AdwLeaflet* self, bool canUnfold) c_adw_leaflet_set_can_unfold;
  void function(AdwLeaflet* self, AdwSpringParams* params) c_adw_leaflet_set_child_transition_params;
  void function(AdwLeaflet* self, AdwFoldThresholdPolicy policy) c_adw_leaflet_set_fold_threshold_policy;
  void function(AdwLeaflet* self, bool homogeneous) c_adw_leaflet_set_homogeneous;
  void function(AdwLeaflet* self, uint duration) c_adw_leaflet_set_mode_transition_duration;
  void function(AdwLeaflet* self, AdwLeafletTransitionType transition) c_adw_leaflet_set_transition_type;
  void function(AdwLeaflet* self, GtkWidget* visibleChild) c_adw_leaflet_set_visible_child;
  void function(AdwLeaflet* self, const(char)* name) c_adw_leaflet_set_visible_child_name;

  // LeafletPage
  extern(C) GType function() c_adw_leaflet_page_get_type;
  GtkWidget* function(AdwLeafletPage* self) c_adw_leaflet_page_get_child;
  const(char)* function(AdwLeafletPage* self) c_adw_leaflet_page_get_name;
  bool function(AdwLeafletPage* self) c_adw_leaflet_page_get_navigatable;
  void function(AdwLeafletPage* self, const(char)* name) c_adw_leaflet_page_set_name;
  void function(AdwLeafletPage* self, bool navigatable) c_adw_leaflet_page_set_navigatable;

  // MessageDialog
  extern(C) GType function() c_adw_message_dialog_get_type;
  GtkWidget* function(GtkWindow* parent, const(char)* heading, const(char)* body_) c_adw_message_dialog_new;
  void function(AdwMessageDialog* self, const(char)* id, const(char)* label) c_adw_message_dialog_add_response;
  void function(AdwMessageDialog* self, const(char)* firstId,  ...) c_adw_message_dialog_add_responses;
  void function(AdwMessageDialog* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_adw_message_dialog_choose;
  const(char)* function(AdwMessageDialog* self, GAsyncResult* result) c_adw_message_dialog_choose_finish;
  void function(AdwMessageDialog* self, const(char)* format,  ...) c_adw_message_dialog_format_body;
  void function(AdwMessageDialog* self, const(char)* format,  ...) c_adw_message_dialog_format_body_markup;
  void function(AdwMessageDialog* self, const(char)* format,  ...) c_adw_message_dialog_format_heading;
  void function(AdwMessageDialog* self, const(char)* format,  ...) c_adw_message_dialog_format_heading_markup;
  const(char)* function(AdwMessageDialog* self) c_adw_message_dialog_get_body;
  bool function(AdwMessageDialog* self) c_adw_message_dialog_get_body_use_markup;
  const(char)* function(AdwMessageDialog* self) c_adw_message_dialog_get_close_response;
  const(char)* function(AdwMessageDialog* self) c_adw_message_dialog_get_default_response;
  GtkWidget* function(AdwMessageDialog* self) c_adw_message_dialog_get_extra_child;
  const(char)* function(AdwMessageDialog* self) c_adw_message_dialog_get_heading;
  bool function(AdwMessageDialog* self) c_adw_message_dialog_get_heading_use_markup;
  AdwResponseAppearance function(AdwMessageDialog* self, const(char)* response) c_adw_message_dialog_get_response_appearance;
  bool function(AdwMessageDialog* self, const(char)* response) c_adw_message_dialog_get_response_enabled;
  const(char)* function(AdwMessageDialog* self, const(char)* response) c_adw_message_dialog_get_response_label;
  bool function(AdwMessageDialog* self, const(char)* response) c_adw_message_dialog_has_response;
  void function(AdwMessageDialog* self, const(char)* id) c_adw_message_dialog_remove_response;
  void function(AdwMessageDialog* self, const(char)* response) c_adw_message_dialog_response;
  void function(AdwMessageDialog* self, const(char)* body_) c_adw_message_dialog_set_body;
  void function(AdwMessageDialog* self, bool useMarkup) c_adw_message_dialog_set_body_use_markup;
  void function(AdwMessageDialog* self, const(char)* response) c_adw_message_dialog_set_close_response;
  void function(AdwMessageDialog* self, const(char)* response) c_adw_message_dialog_set_default_response;
  void function(AdwMessageDialog* self, GtkWidget* child) c_adw_message_dialog_set_extra_child;
  void function(AdwMessageDialog* self, const(char)* heading) c_adw_message_dialog_set_heading;
  void function(AdwMessageDialog* self, bool useMarkup) c_adw_message_dialog_set_heading_use_markup;
  void function(AdwMessageDialog* self, const(char)* response, AdwResponseAppearance appearance) c_adw_message_dialog_set_response_appearance;
  void function(AdwMessageDialog* self, const(char)* response, bool enabled) c_adw_message_dialog_set_response_enabled;
  void function(AdwMessageDialog* self, const(char)* response, const(char)* label) c_adw_message_dialog_set_response_label;

  // NavigationPage
  extern(C) GType function() c_adw_navigation_page_get_type;
  AdwNavigationPage* function(GtkWidget* child, const(char)* title) c_adw_navigation_page_new;
  AdwNavigationPage* function(GtkWidget* child, const(char)* title, const(char)* tag) c_adw_navigation_page_new_with_tag;
  bool function(AdwNavigationPage* self) c_adw_navigation_page_get_can_pop;
  GtkWidget* function(AdwNavigationPage* self) c_adw_navigation_page_get_child;
  const(char)* function(AdwNavigationPage* self) c_adw_navigation_page_get_tag;
  const(char)* function(AdwNavigationPage* self) c_adw_navigation_page_get_title;
  void function(AdwNavigationPage* self, bool canPop) c_adw_navigation_page_set_can_pop;
  void function(AdwNavigationPage* self, GtkWidget* child) c_adw_navigation_page_set_child;
  void function(AdwNavigationPage* self, const(char)* tag) c_adw_navigation_page_set_tag;
  void function(AdwNavigationPage* self, const(char)* title) c_adw_navigation_page_set_title;

  // NavigationSplitView
  extern(C) GType function() c_adw_navigation_split_view_get_type;
  GtkWidget* function() c_adw_navigation_split_view_new;
  bool function(AdwNavigationSplitView* self) c_adw_navigation_split_view_get_collapsed;
  AdwNavigationPage* function(AdwNavigationSplitView* self) c_adw_navigation_split_view_get_content;
  double function(AdwNavigationSplitView* self) c_adw_navigation_split_view_get_max_sidebar_width;
  double function(AdwNavigationSplitView* self) c_adw_navigation_split_view_get_min_sidebar_width;
  bool function(AdwNavigationSplitView* self) c_adw_navigation_split_view_get_show_content;
  AdwNavigationPage* function(AdwNavigationSplitView* self) c_adw_navigation_split_view_get_sidebar;
  double function(AdwNavigationSplitView* self) c_adw_navigation_split_view_get_sidebar_width_fraction;
  AdwLengthUnit function(AdwNavigationSplitView* self) c_adw_navigation_split_view_get_sidebar_width_unit;
  void function(AdwNavigationSplitView* self, bool collapsed) c_adw_navigation_split_view_set_collapsed;
  void function(AdwNavigationSplitView* self, AdwNavigationPage* content) c_adw_navigation_split_view_set_content;
  void function(AdwNavigationSplitView* self, double width) c_adw_navigation_split_view_set_max_sidebar_width;
  void function(AdwNavigationSplitView* self, double width) c_adw_navigation_split_view_set_min_sidebar_width;
  void function(AdwNavigationSplitView* self, bool showContent) c_adw_navigation_split_view_set_show_content;
  void function(AdwNavigationSplitView* self, AdwNavigationPage* sidebar) c_adw_navigation_split_view_set_sidebar;
  void function(AdwNavigationSplitView* self, double fraction) c_adw_navigation_split_view_set_sidebar_width_fraction;
  void function(AdwNavigationSplitView* self, AdwLengthUnit unit) c_adw_navigation_split_view_set_sidebar_width_unit;

  // NavigationView
  extern(C) GType function() c_adw_navigation_view_get_type;
  GtkWidget* function() c_adw_navigation_view_new;
  void function(AdwNavigationView* self, AdwNavigationPage* page) c_adw_navigation_view_add;
  AdwNavigationPage* function(AdwNavigationView* self, const(char)* tag) c_adw_navigation_view_find_page;
  bool function(AdwNavigationView* self) c_adw_navigation_view_get_animate_transitions;
  GListModel* function(AdwNavigationView* self) c_adw_navigation_view_get_navigation_stack;
  bool function(AdwNavigationView* self) c_adw_navigation_view_get_pop_on_escape;
  AdwNavigationPage* function(AdwNavigationView* self, AdwNavigationPage* page) c_adw_navigation_view_get_previous_page;
  AdwNavigationPage* function(AdwNavigationView* self) c_adw_navigation_view_get_visible_page;
  bool function(AdwNavigationView* self) c_adw_navigation_view_pop;
  bool function(AdwNavigationView* self, AdwNavigationPage* page) c_adw_navigation_view_pop_to_page;
  bool function(AdwNavigationView* self, const(char)* tag) c_adw_navigation_view_pop_to_tag;
  void function(AdwNavigationView* self, AdwNavigationPage* page) c_adw_navigation_view_push;
  void function(AdwNavigationView* self, const(char)* tag) c_adw_navigation_view_push_by_tag;
  void function(AdwNavigationView* self, AdwNavigationPage* page) c_adw_navigation_view_remove;
  void function(AdwNavigationView* self, AdwNavigationPage** pages, int nPages) c_adw_navigation_view_replace;
  void function(AdwNavigationView* self, const(char*)* tags, int nTags) c_adw_navigation_view_replace_with_tags;
  void function(AdwNavigationView* self, bool animateTransitions) c_adw_navigation_view_set_animate_transitions;
  void function(AdwNavigationView* self, bool popOnEscape) c_adw_navigation_view_set_pop_on_escape;

  // OverlaySplitView
  extern(C) GType function() c_adw_overlay_split_view_get_type;
  GtkWidget* function() c_adw_overlay_split_view_new;
  bool function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_collapsed;
  GtkWidget* function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_content;
  bool function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_enable_hide_gesture;
  bool function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_enable_show_gesture;
  double function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_max_sidebar_width;
  double function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_min_sidebar_width;
  bool function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_pin_sidebar;
  bool function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_show_sidebar;
  GtkWidget* function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_sidebar;
  GtkPackType function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_sidebar_position;
  double function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_sidebar_width_fraction;
  AdwLengthUnit function(AdwOverlaySplitView* self) c_adw_overlay_split_view_get_sidebar_width_unit;
  void function(AdwOverlaySplitView* self, bool collapsed) c_adw_overlay_split_view_set_collapsed;
  void function(AdwOverlaySplitView* self, GtkWidget* content) c_adw_overlay_split_view_set_content;
  void function(AdwOverlaySplitView* self, bool enableHideGesture) c_adw_overlay_split_view_set_enable_hide_gesture;
  void function(AdwOverlaySplitView* self, bool enableShowGesture) c_adw_overlay_split_view_set_enable_show_gesture;
  void function(AdwOverlaySplitView* self, double width) c_adw_overlay_split_view_set_max_sidebar_width;
  void function(AdwOverlaySplitView* self, double width) c_adw_overlay_split_view_set_min_sidebar_width;
  void function(AdwOverlaySplitView* self, bool pinSidebar) c_adw_overlay_split_view_set_pin_sidebar;
  void function(AdwOverlaySplitView* self, bool showSidebar) c_adw_overlay_split_view_set_show_sidebar;
  void function(AdwOverlaySplitView* self, GtkWidget* sidebar) c_adw_overlay_split_view_set_sidebar;
  void function(AdwOverlaySplitView* self, GtkPackType position) c_adw_overlay_split_view_set_sidebar_position;
  void function(AdwOverlaySplitView* self, double fraction) c_adw_overlay_split_view_set_sidebar_width_fraction;
  void function(AdwOverlaySplitView* self, AdwLengthUnit unit) c_adw_overlay_split_view_set_sidebar_width_unit;

  // PasswordEntryRow
  extern(C) GType function() c_adw_password_entry_row_get_type;
  GtkWidget* function() c_adw_password_entry_row_new;

  // PreferencesDialog
  extern(C) GType function() c_adw_preferences_dialog_get_type;
  AdwDialog* function() c_adw_preferences_dialog_new;
  void function(AdwPreferencesDialog* self, AdwPreferencesPage* page) c_adw_preferences_dialog_add;
  void function(AdwPreferencesDialog* self, AdwToast* toast) c_adw_preferences_dialog_add_toast;
  bool function(AdwPreferencesDialog* self) c_adw_preferences_dialog_get_search_enabled;
  AdwPreferencesPage* function(AdwPreferencesDialog* self) c_adw_preferences_dialog_get_visible_page;
  const(char)* function(AdwPreferencesDialog* self) c_adw_preferences_dialog_get_visible_page_name;
  bool function(AdwPreferencesDialog* self) c_adw_preferences_dialog_pop_subpage;
  void function(AdwPreferencesDialog* self, AdwNavigationPage* page) c_adw_preferences_dialog_push_subpage;
  void function(AdwPreferencesDialog* self, AdwPreferencesPage* page) c_adw_preferences_dialog_remove;
  void function(AdwPreferencesDialog* self, bool searchEnabled) c_adw_preferences_dialog_set_search_enabled;
  void function(AdwPreferencesDialog* self, AdwPreferencesPage* page) c_adw_preferences_dialog_set_visible_page;
  void function(AdwPreferencesDialog* self, const(char)* name) c_adw_preferences_dialog_set_visible_page_name;

  // PreferencesGroup
  extern(C) GType function() c_adw_preferences_group_get_type;
  GtkWidget* function() c_adw_preferences_group_new;
  void function(AdwPreferencesGroup* self, GtkWidget* child) c_adw_preferences_group_add;
  const(char)* function(AdwPreferencesGroup* self) c_adw_preferences_group_get_description;
  GtkWidget* function(AdwPreferencesGroup* self) c_adw_preferences_group_get_header_suffix;
  const(char)* function(AdwPreferencesGroup* self) c_adw_preferences_group_get_title;
  void function(AdwPreferencesGroup* self, GtkWidget* child) c_adw_preferences_group_remove;
  void function(AdwPreferencesGroup* self, const(char)* description) c_adw_preferences_group_set_description;
  void function(AdwPreferencesGroup* self, GtkWidget* suffix) c_adw_preferences_group_set_header_suffix;
  void function(AdwPreferencesGroup* self, const(char)* title) c_adw_preferences_group_set_title;

  // PreferencesPage
  extern(C) GType function() c_adw_preferences_page_get_type;
  GtkWidget* function() c_adw_preferences_page_new;
  void function(AdwPreferencesPage* self, AdwPreferencesGroup* group) c_adw_preferences_page_add;
  const(char)* function(AdwPreferencesPage* self) c_adw_preferences_page_get_description;
  const(char)* function(AdwPreferencesPage* self) c_adw_preferences_page_get_icon_name;
  const(char)* function(AdwPreferencesPage* self) c_adw_preferences_page_get_name;
  const(char)* function(AdwPreferencesPage* self) c_adw_preferences_page_get_title;
  bool function(AdwPreferencesPage* self) c_adw_preferences_page_get_use_underline;
  void function(AdwPreferencesPage* self, AdwPreferencesGroup* group) c_adw_preferences_page_remove;
  void function(AdwPreferencesPage* self) c_adw_preferences_page_scroll_to_top;
  void function(AdwPreferencesPage* self, const(char)* description) c_adw_preferences_page_set_description;
  void function(AdwPreferencesPage* self, const(char)* iconName) c_adw_preferences_page_set_icon_name;
  void function(AdwPreferencesPage* self, const(char)* name) c_adw_preferences_page_set_name;
  void function(AdwPreferencesPage* self, const(char)* title) c_adw_preferences_page_set_title;
  void function(AdwPreferencesPage* self, bool useUnderline) c_adw_preferences_page_set_use_underline;

  // PreferencesRow
  extern(C) GType function() c_adw_preferences_row_get_type;
  GtkWidget* function() c_adw_preferences_row_new;
  const(char)* function(AdwPreferencesRow* self) c_adw_preferences_row_get_title;
  bool function(AdwPreferencesRow* self) c_adw_preferences_row_get_title_selectable;
  bool function(AdwPreferencesRow* self) c_adw_preferences_row_get_use_markup;
  bool function(AdwPreferencesRow* self) c_adw_preferences_row_get_use_underline;
  void function(AdwPreferencesRow* self, const(char)* title) c_adw_preferences_row_set_title;
  void function(AdwPreferencesRow* self, bool titleSelectable) c_adw_preferences_row_set_title_selectable;
  void function(AdwPreferencesRow* self, bool useMarkup) c_adw_preferences_row_set_use_markup;
  void function(AdwPreferencesRow* self, bool useUnderline) c_adw_preferences_row_set_use_underline;

  // PreferencesWindow
  extern(C) GType function() c_adw_preferences_window_get_type;
  GtkWidget* function() c_adw_preferences_window_new;
  void function(AdwPreferencesWindow* self, AdwPreferencesPage* page) c_adw_preferences_window_add;
  void function(AdwPreferencesWindow* self, AdwToast* toast) c_adw_preferences_window_add_toast;
  void function(AdwPreferencesWindow* self) c_adw_preferences_window_close_subpage;
  bool function(AdwPreferencesWindow* self) c_adw_preferences_window_get_can_navigate_back;
  bool function(AdwPreferencesWindow* self) c_adw_preferences_window_get_search_enabled;
  AdwPreferencesPage* function(AdwPreferencesWindow* self) c_adw_preferences_window_get_visible_page;
  const(char)* function(AdwPreferencesWindow* self) c_adw_preferences_window_get_visible_page_name;
  bool function(AdwPreferencesWindow* self) c_adw_preferences_window_pop_subpage;
  void function(AdwPreferencesWindow* self, GtkWidget* subpage) c_adw_preferences_window_present_subpage;
  void function(AdwPreferencesWindow* self, AdwNavigationPage* page) c_adw_preferences_window_push_subpage;
  void function(AdwPreferencesWindow* self, AdwPreferencesPage* page) c_adw_preferences_window_remove;
  void function(AdwPreferencesWindow* self, bool canNavigateBack) c_adw_preferences_window_set_can_navigate_back;
  void function(AdwPreferencesWindow* self, bool searchEnabled) c_adw_preferences_window_set_search_enabled;
  void function(AdwPreferencesWindow* self, AdwPreferencesPage* page) c_adw_preferences_window_set_visible_page;
  void function(AdwPreferencesWindow* self, const(char)* name) c_adw_preferences_window_set_visible_page_name;

  // PropertyAnimationTarget
  extern(C) GType function() c_adw_property_animation_target_get_type;
  AdwAnimationTarget* function(ObjectC* object, const(char)* propertyName) c_adw_property_animation_target_new;
  AdwAnimationTarget* function(ObjectC* object, GParamSpec* pspec) c_adw_property_animation_target_new_for_pspec;
  ObjectC* function(AdwPropertyAnimationTarget* self) c_adw_property_animation_target_get_object;
  GParamSpec* function(AdwPropertyAnimationTarget* self) c_adw_property_animation_target_get_pspec;

  // SpinRow
  extern(C) GType function() c_adw_spin_row_get_type;
  GtkWidget* function(GtkAdjustment* adjustment, double climbRate, uint digits) c_adw_spin_row_new;
  GtkWidget* function(double min, double max, double step) c_adw_spin_row_new_with_range;
  void function(AdwSpinRow* self, GtkAdjustment* adjustment, double climbRate, uint digits) c_adw_spin_row_configure;
  GtkAdjustment* function(AdwSpinRow* self) c_adw_spin_row_get_adjustment;
  double function(AdwSpinRow* self) c_adw_spin_row_get_climb_rate;
  uint function(AdwSpinRow* self) c_adw_spin_row_get_digits;
  bool function(AdwSpinRow* self) c_adw_spin_row_get_numeric;
  bool function(AdwSpinRow* self) c_adw_spin_row_get_snap_to_ticks;
  GtkSpinButtonUpdatePolicy function(AdwSpinRow* self) c_adw_spin_row_get_update_policy;
  double function(AdwSpinRow* self) c_adw_spin_row_get_value;
  bool function(AdwSpinRow* self) c_adw_spin_row_get_wrap;
  void function(AdwSpinRow* self, GtkAdjustment* adjustment) c_adw_spin_row_set_adjustment;
  void function(AdwSpinRow* self, double climbRate) c_adw_spin_row_set_climb_rate;
  void function(AdwSpinRow* self, uint digits) c_adw_spin_row_set_digits;
  void function(AdwSpinRow* self, bool numeric) c_adw_spin_row_set_numeric;
  void function(AdwSpinRow* self, double min, double max) c_adw_spin_row_set_range;
  void function(AdwSpinRow* self, bool snapToTicks) c_adw_spin_row_set_snap_to_ticks;
  void function(AdwSpinRow* self, GtkSpinButtonUpdatePolicy policy) c_adw_spin_row_set_update_policy;
  void function(AdwSpinRow* self, double value) c_adw_spin_row_set_value;
  void function(AdwSpinRow* self, bool wrap) c_adw_spin_row_set_wrap;
  void function(AdwSpinRow* self) c_adw_spin_row_update;

  // SplitButton
  extern(C) GType function() c_adw_split_button_get_type;
  GtkWidget* function() c_adw_split_button_new;
  bool function(AdwSplitButton* self) c_adw_split_button_get_can_shrink;
  GtkWidget* function(AdwSplitButton* self) c_adw_split_button_get_child;
  GtkArrowType function(AdwSplitButton* self) c_adw_split_button_get_direction;
  const(char)* function(AdwSplitButton* self) c_adw_split_button_get_dropdown_tooltip;
  const(char)* function(AdwSplitButton* self) c_adw_split_button_get_icon_name;
  const(char)* function(AdwSplitButton* self) c_adw_split_button_get_label;
  GMenuModel* function(AdwSplitButton* self) c_adw_split_button_get_menu_model;
  GtkPopover* function(AdwSplitButton* self) c_adw_split_button_get_popover;
  bool function(AdwSplitButton* self) c_adw_split_button_get_use_underline;
  void function(AdwSplitButton* self) c_adw_split_button_popdown;
  void function(AdwSplitButton* self) c_adw_split_button_popup;
  void function(AdwSplitButton* self, bool canShrink) c_adw_split_button_set_can_shrink;
  void function(AdwSplitButton* self, GtkWidget* child) c_adw_split_button_set_child;
  void function(AdwSplitButton* self, GtkArrowType direction) c_adw_split_button_set_direction;
  void function(AdwSplitButton* self, const(char)* tooltip) c_adw_split_button_set_dropdown_tooltip;
  void function(AdwSplitButton* self, const(char)* iconName) c_adw_split_button_set_icon_name;
  void function(AdwSplitButton* self, const(char)* label) c_adw_split_button_set_label;
  void function(AdwSplitButton* self, GMenuModel* menuModel) c_adw_split_button_set_menu_model;
  void function(AdwSplitButton* self, GtkPopover* popover) c_adw_split_button_set_popover;
  void function(AdwSplitButton* self, bool useUnderline) c_adw_split_button_set_use_underline;

  // SpringAnimation
  extern(C) GType function() c_adw_spring_animation_get_type;
  AdwAnimation* function(GtkWidget* widget, double from, double to, AdwSpringParams* springParams, AdwAnimationTarget* target) c_adw_spring_animation_new;
  double function(AdwSpringAnimation* self, uint time) c_adw_spring_animation_calculate_value;
  double function(AdwSpringAnimation* self, uint time) c_adw_spring_animation_calculate_velocity;
  bool function(AdwSpringAnimation* self) c_adw_spring_animation_get_clamp;
  double function(AdwSpringAnimation* self) c_adw_spring_animation_get_epsilon;
  uint function(AdwSpringAnimation* self) c_adw_spring_animation_get_estimated_duration;
  double function(AdwSpringAnimation* self) c_adw_spring_animation_get_initial_velocity;
  AdwSpringParams* function(AdwSpringAnimation* self) c_adw_spring_animation_get_spring_params;
  double function(AdwSpringAnimation* self) c_adw_spring_animation_get_value_from;
  double function(AdwSpringAnimation* self) c_adw_spring_animation_get_value_to;
  double function(AdwSpringAnimation* self) c_adw_spring_animation_get_velocity;
  void function(AdwSpringAnimation* self, bool clamp) c_adw_spring_animation_set_clamp;
  void function(AdwSpringAnimation* self, double epsilon) c_adw_spring_animation_set_epsilon;
  void function(AdwSpringAnimation* self, double velocity) c_adw_spring_animation_set_initial_velocity;
  void function(AdwSpringAnimation* self, AdwSpringParams* springParams) c_adw_spring_animation_set_spring_params;
  void function(AdwSpringAnimation* self, double value) c_adw_spring_animation_set_value_from;
  void function(AdwSpringAnimation* self, double value) c_adw_spring_animation_set_value_to;

  // SpringParams
  extern(C) GType function() c_adw_spring_params_get_type;
  AdwSpringParams* function(double dampingRatio, double mass, double stiffness) c_adw_spring_params_new;
  AdwSpringParams* function(double damping, double mass, double stiffness) c_adw_spring_params_new_full;
  double function(AdwSpringParams* self) c_adw_spring_params_get_damping;
  double function(AdwSpringParams* self) c_adw_spring_params_get_damping_ratio;
  double function(AdwSpringParams* self) c_adw_spring_params_get_mass;
  double function(AdwSpringParams* self) c_adw_spring_params_get_stiffness;
  AdwSpringParams* function(AdwSpringParams* self) c_adw_spring_params_ref;
  void function(AdwSpringParams* self) c_adw_spring_params_unref;

  // Squeezer
  extern(C) GType function() c_adw_squeezer_get_type;
  GtkWidget* function() c_adw_squeezer_new;
  AdwSqueezerPage* function(AdwSqueezer* self, GtkWidget* child) c_adw_squeezer_add;
  bool function(AdwSqueezer* self) c_adw_squeezer_get_allow_none;
  bool function(AdwSqueezer* self) c_adw_squeezer_get_homogeneous;
  bool function(AdwSqueezer* self) c_adw_squeezer_get_interpolate_size;
  AdwSqueezerPage* function(AdwSqueezer* self, GtkWidget* child) c_adw_squeezer_get_page;
  GtkSelectionModel* function(AdwSqueezer* self) c_adw_squeezer_get_pages;
  AdwFoldThresholdPolicy function(AdwSqueezer* self) c_adw_squeezer_get_switch_threshold_policy;
  uint function(AdwSqueezer* self) c_adw_squeezer_get_transition_duration;
  bool function(AdwSqueezer* self) c_adw_squeezer_get_transition_running;
  AdwSqueezerTransitionType function(AdwSqueezer* self) c_adw_squeezer_get_transition_type;
  GtkWidget* function(AdwSqueezer* self) c_adw_squeezer_get_visible_child;
  float function(AdwSqueezer* self) c_adw_squeezer_get_xalign;
  float function(AdwSqueezer* self) c_adw_squeezer_get_yalign;
  void function(AdwSqueezer* self, GtkWidget* child) c_adw_squeezer_remove;
  void function(AdwSqueezer* self, bool allowNone) c_adw_squeezer_set_allow_none;
  void function(AdwSqueezer* self, bool homogeneous) c_adw_squeezer_set_homogeneous;
  void function(AdwSqueezer* self, bool interpolateSize) c_adw_squeezer_set_interpolate_size;
  void function(AdwSqueezer* self, AdwFoldThresholdPolicy policy) c_adw_squeezer_set_switch_threshold_policy;
  void function(AdwSqueezer* self, uint duration) c_adw_squeezer_set_transition_duration;
  void function(AdwSqueezer* self, AdwSqueezerTransitionType transition) c_adw_squeezer_set_transition_type;
  void function(AdwSqueezer* self, float xalign) c_adw_squeezer_set_xalign;
  void function(AdwSqueezer* self, float yalign) c_adw_squeezer_set_yalign;

  // SqueezerPage
  extern(C) GType function() c_adw_squeezer_page_get_type;
  GtkWidget* function(AdwSqueezerPage* self) c_adw_squeezer_page_get_child;
  bool function(AdwSqueezerPage* self) c_adw_squeezer_page_get_enabled;
  void function(AdwSqueezerPage* self, bool enabled) c_adw_squeezer_page_set_enabled;

  // StatusPage
  extern(C) GType function() c_adw_status_page_get_type;
  GtkWidget* function() c_adw_status_page_new;
  GtkWidget* function(AdwStatusPage* self) c_adw_status_page_get_child;
  const(char)* function(AdwStatusPage* self) c_adw_status_page_get_description;
  const(char)* function(AdwStatusPage* self) c_adw_status_page_get_icon_name;
  GdkPaintable* function(AdwStatusPage* self) c_adw_status_page_get_paintable;
  const(char)* function(AdwStatusPage* self) c_adw_status_page_get_title;
  void function(AdwStatusPage* self, GtkWidget* child) c_adw_status_page_set_child;
  void function(AdwStatusPage* self, const(char)* description) c_adw_status_page_set_description;
  void function(AdwStatusPage* self, const(char)* iconName) c_adw_status_page_set_icon_name;
  void function(AdwStatusPage* self, GdkPaintable* paintable) c_adw_status_page_set_paintable;
  void function(AdwStatusPage* self, const(char)* title) c_adw_status_page_set_title;

  // StyleManager
  extern(C) GType function() c_adw_style_manager_get_type;
  AdwStyleManager* function() c_adw_style_manager_get_default;
  AdwStyleManager* function(GdkDisplay* display) c_adw_style_manager_get_for_display;
  AdwColorScheme function(AdwStyleManager* self) c_adw_style_manager_get_color_scheme;
  bool function(AdwStyleManager* self) c_adw_style_manager_get_dark;
  GdkDisplay* function(AdwStyleManager* self) c_adw_style_manager_get_display;
  bool function(AdwStyleManager* self) c_adw_style_manager_get_high_contrast;
  bool function(AdwStyleManager* self) c_adw_style_manager_get_system_supports_color_schemes;
  void function(AdwStyleManager* self, AdwColorScheme colorScheme) c_adw_style_manager_set_color_scheme;

  // SwipeTracker
  extern(C) GType function() c_adw_swipe_tracker_get_type;
  AdwSwipeTracker* function(AdwSwipeable* swipeable) c_adw_swipe_tracker_new;
  bool function(AdwSwipeTracker* self) c_adw_swipe_tracker_get_allow_long_swipes;
  bool function(AdwSwipeTracker* self) c_adw_swipe_tracker_get_allow_mouse_drag;
  bool function(AdwSwipeTracker* self) c_adw_swipe_tracker_get_allow_window_handle;
  bool function(AdwSwipeTracker* self) c_adw_swipe_tracker_get_enabled;
  bool function(AdwSwipeTracker* self) c_adw_swipe_tracker_get_lower_overshoot;
  bool function(AdwSwipeTracker* self) c_adw_swipe_tracker_get_reversed;
  AdwSwipeable* function(AdwSwipeTracker* self) c_adw_swipe_tracker_get_swipeable;
  bool function(AdwSwipeTracker* self) c_adw_swipe_tracker_get_upper_overshoot;
  void function(AdwSwipeTracker* self, bool allowLongSwipes) c_adw_swipe_tracker_set_allow_long_swipes;
  void function(AdwSwipeTracker* self, bool allowMouseDrag) c_adw_swipe_tracker_set_allow_mouse_drag;
  void function(AdwSwipeTracker* self, bool allowWindowHandle) c_adw_swipe_tracker_set_allow_window_handle;
  void function(AdwSwipeTracker* self, bool enabled) c_adw_swipe_tracker_set_enabled;
  void function(AdwSwipeTracker* self, bool overshoot) c_adw_swipe_tracker_set_lower_overshoot;
  void function(AdwSwipeTracker* self, bool reversed) c_adw_swipe_tracker_set_reversed;
  void function(AdwSwipeTracker* self, bool overshoot) c_adw_swipe_tracker_set_upper_overshoot;
  void function(AdwSwipeTracker* self, double delta) c_adw_swipe_tracker_shift_position;

  // Swipeable
  extern(C) GType function() c_adw_swipeable_get_type;
  double function(AdwSwipeable* self) c_adw_swipeable_get_cancel_progress;
  double function(AdwSwipeable* self) c_adw_swipeable_get_distance;
  double function(AdwSwipeable* self) c_adw_swipeable_get_progress;
  double* function(AdwSwipeable* self, int* nSnapPoints) c_adw_swipeable_get_snap_points;
  void function(AdwSwipeable* self, AdwNavigationDirection navigationDirection, bool isDrag, GdkRectangle* rect) c_adw_swipeable_get_swipe_area;

  // SwitchRow
  extern(C) GType function() c_adw_switch_row_get_type;
  GtkWidget* function() c_adw_switch_row_new;
  bool function(AdwSwitchRow* self) c_adw_switch_row_get_active;
  void function(AdwSwitchRow* self, bool isActive) c_adw_switch_row_set_active;

  // TabBar
  extern(C) GType function() c_adw_tab_bar_get_type;
  AdwTabBar* function() c_adw_tab_bar_new;
  bool function(AdwTabBar* self) c_adw_tab_bar_get_autohide;
  GtkWidget* function(AdwTabBar* self) c_adw_tab_bar_get_end_action_widget;
  bool function(AdwTabBar* self) c_adw_tab_bar_get_expand_tabs;
  GdkDragAction function(AdwTabBar* self) c_adw_tab_bar_get_extra_drag_preferred_action;
  bool function(AdwTabBar* self) c_adw_tab_bar_get_extra_drag_preload;
  bool function(AdwTabBar* self) c_adw_tab_bar_get_inverted;
  bool function(AdwTabBar* self) c_adw_tab_bar_get_is_overflowing;
  GtkWidget* function(AdwTabBar* self) c_adw_tab_bar_get_start_action_widget;
  bool function(AdwTabBar* self) c_adw_tab_bar_get_tabs_revealed;
  AdwTabView* function(AdwTabBar* self) c_adw_tab_bar_get_view;
  void function(AdwTabBar* self, bool autohide) c_adw_tab_bar_set_autohide;
  void function(AdwTabBar* self, GtkWidget* widget) c_adw_tab_bar_set_end_action_widget;
  void function(AdwTabBar* self, bool expandTabs) c_adw_tab_bar_set_expand_tabs;
  void function(AdwTabBar* self, bool preload) c_adw_tab_bar_set_extra_drag_preload;
  void function(AdwTabBar* self, bool inverted) c_adw_tab_bar_set_inverted;
  void function(AdwTabBar* self, GtkWidget* widget) c_adw_tab_bar_set_start_action_widget;
  void function(AdwTabBar* self, AdwTabView* view) c_adw_tab_bar_set_view;
  void function(AdwTabBar* self, GdkDragAction actions, GType* types, size_t nTypes) c_adw_tab_bar_setup_extra_drop_target;

  // TabButton
  extern(C) GType function() c_adw_tab_button_get_type;
  GtkWidget* function() c_adw_tab_button_new;
  AdwTabView* function(AdwTabButton* self) c_adw_tab_button_get_view;
  void function(AdwTabButton* self, AdwTabView* view) c_adw_tab_button_set_view;

  // TabOverview
  extern(C) GType function() c_adw_tab_overview_get_type;
  GtkWidget* function() c_adw_tab_overview_new;
  GtkWidget* function(AdwTabOverview* self) c_adw_tab_overview_get_child;
  bool function(AdwTabOverview* self) c_adw_tab_overview_get_enable_new_tab;
  bool function(AdwTabOverview* self) c_adw_tab_overview_get_enable_search;
  GdkDragAction function(AdwTabOverview* self) c_adw_tab_overview_get_extra_drag_preferred_action;
  bool function(AdwTabOverview* self) c_adw_tab_overview_get_extra_drag_preload;
  bool function(AdwTabOverview* self) c_adw_tab_overview_get_inverted;
  bool function(AdwTabOverview* self) c_adw_tab_overview_get_open;
  bool function(AdwTabOverview* self) c_adw_tab_overview_get_search_active;
  GMenuModel* function(AdwTabOverview* self) c_adw_tab_overview_get_secondary_menu;
  bool function(AdwTabOverview* self) c_adw_tab_overview_get_show_end_title_buttons;
  bool function(AdwTabOverview* self) c_adw_tab_overview_get_show_start_title_buttons;
  AdwTabView* function(AdwTabOverview* self) c_adw_tab_overview_get_view;
  void function(AdwTabOverview* self, GtkWidget* child) c_adw_tab_overview_set_child;
  void function(AdwTabOverview* self, bool enableNewTab) c_adw_tab_overview_set_enable_new_tab;
  void function(AdwTabOverview* self, bool enableSearch) c_adw_tab_overview_set_enable_search;
  void function(AdwTabOverview* self, bool preload) c_adw_tab_overview_set_extra_drag_preload;
  void function(AdwTabOverview* self, bool inverted) c_adw_tab_overview_set_inverted;
  void function(AdwTabOverview* self, bool open) c_adw_tab_overview_set_open;
  void function(AdwTabOverview* self, GMenuModel* secondaryMenu) c_adw_tab_overview_set_secondary_menu;
  void function(AdwTabOverview* self, bool showEndTitleButtons) c_adw_tab_overview_set_show_end_title_buttons;
  void function(AdwTabOverview* self, bool showStartTitleButtons) c_adw_tab_overview_set_show_start_title_buttons;
  void function(AdwTabOverview* self, AdwTabView* view) c_adw_tab_overview_set_view;
  void function(AdwTabOverview* self, GdkDragAction actions, GType* types, size_t nTypes) c_adw_tab_overview_setup_extra_drop_target;

  // TabPage
  extern(C) GType function() c_adw_tab_page_get_type;
  GtkWidget* function(AdwTabPage* self) c_adw_tab_page_get_child;
  GIcon* function(AdwTabPage* self) c_adw_tab_page_get_icon;
  bool function(AdwTabPage* self) c_adw_tab_page_get_indicator_activatable;
  GIcon* function(AdwTabPage* self) c_adw_tab_page_get_indicator_icon;
  const(char)* function(AdwTabPage* self) c_adw_tab_page_get_indicator_tooltip;
  const(char)* function(AdwTabPage* self) c_adw_tab_page_get_keyword;
  bool function(AdwTabPage* self) c_adw_tab_page_get_live_thumbnail;
  bool function(AdwTabPage* self) c_adw_tab_page_get_loading;
  bool function(AdwTabPage* self) c_adw_tab_page_get_needs_attention;
  AdwTabPage* function(AdwTabPage* self) c_adw_tab_page_get_parent;
  bool function(AdwTabPage* self) c_adw_tab_page_get_pinned;
  bool function(AdwTabPage* self) c_adw_tab_page_get_selected;
  float function(AdwTabPage* self) c_adw_tab_page_get_thumbnail_xalign;
  float function(AdwTabPage* self) c_adw_tab_page_get_thumbnail_yalign;
  const(char)* function(AdwTabPage* self) c_adw_tab_page_get_title;
  const(char)* function(AdwTabPage* self) c_adw_tab_page_get_tooltip;
  void function(AdwTabPage* self) c_adw_tab_page_invalidate_thumbnail;
  void function(AdwTabPage* self, GIcon* icon) c_adw_tab_page_set_icon;
  void function(AdwTabPage* self, bool activatable) c_adw_tab_page_set_indicator_activatable;
  void function(AdwTabPage* self, GIcon* indicatorIcon) c_adw_tab_page_set_indicator_icon;
  void function(AdwTabPage* self, const(char)* tooltip) c_adw_tab_page_set_indicator_tooltip;
  void function(AdwTabPage* self, const(char)* keyword) c_adw_tab_page_set_keyword;
  void function(AdwTabPage* self, bool liveThumbnail) c_adw_tab_page_set_live_thumbnail;
  void function(AdwTabPage* self, bool loading) c_adw_tab_page_set_loading;
  void function(AdwTabPage* self, bool needsAttention) c_adw_tab_page_set_needs_attention;
  void function(AdwTabPage* self, float xalign) c_adw_tab_page_set_thumbnail_xalign;
  void function(AdwTabPage* self, float yalign) c_adw_tab_page_set_thumbnail_yalign;
  void function(AdwTabPage* self, const(char)* title) c_adw_tab_page_set_title;
  void function(AdwTabPage* self, const(char)* tooltip) c_adw_tab_page_set_tooltip;

  // TabView
  extern(C) GType function() c_adw_tab_view_get_type;
  AdwTabView* function() c_adw_tab_view_new;
  AdwTabPage* function(AdwTabView* self, GtkWidget* child, AdwTabPage* parent) c_adw_tab_view_add_page;
  void function(AdwTabView* self, AdwTabViewShortcuts shortcuts) c_adw_tab_view_add_shortcuts;
  AdwTabPage* function(AdwTabView* self, GtkWidget* child) c_adw_tab_view_append;
  AdwTabPage* function(AdwTabView* self, GtkWidget* child) c_adw_tab_view_append_pinned;
  void function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_close_other_pages;
  void function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_close_page;
  void function(AdwTabView* self, AdwTabPage* page, bool confirm) c_adw_tab_view_close_page_finish;
  void function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_close_pages_after;
  void function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_close_pages_before;
  GIcon* function(AdwTabView* self) c_adw_tab_view_get_default_icon;
  bool function(AdwTabView* self) c_adw_tab_view_get_is_transferring_page;
  GMenuModel* function(AdwTabView* self) c_adw_tab_view_get_menu_model;
  int function(AdwTabView* self) c_adw_tab_view_get_n_pages;
  int function(AdwTabView* self) c_adw_tab_view_get_n_pinned_pages;
  AdwTabPage* function(AdwTabView* self, int position) c_adw_tab_view_get_nth_page;
  AdwTabPage* function(AdwTabView* self, GtkWidget* child) c_adw_tab_view_get_page;
  int function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_get_page_position;
  GtkSelectionModel* function(AdwTabView* self) c_adw_tab_view_get_pages;
  AdwTabPage* function(AdwTabView* self) c_adw_tab_view_get_selected_page;
  AdwTabViewShortcuts function(AdwTabView* self) c_adw_tab_view_get_shortcuts;
  AdwTabPage* function(AdwTabView* self, GtkWidget* child, int position) c_adw_tab_view_insert;
  AdwTabPage* function(AdwTabView* self, GtkWidget* child, int position) c_adw_tab_view_insert_pinned;
  void function(AdwTabView* self) c_adw_tab_view_invalidate_thumbnails;
  AdwTabPage* function(AdwTabView* self, GtkWidget* child) c_adw_tab_view_prepend;
  AdwTabPage* function(AdwTabView* self, GtkWidget* child) c_adw_tab_view_prepend_pinned;
  void function(AdwTabView* self, AdwTabViewShortcuts shortcuts) c_adw_tab_view_remove_shortcuts;
  bool function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_reorder_backward;
  bool function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_reorder_first;
  bool function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_reorder_forward;
  bool function(AdwTabView* self, AdwTabPage* page) c_adw_tab_view_reorder_last;
  bool function(AdwTabView* self, AdwTabPage* page, int position) c_adw_tab_view_reorder_page;
  bool function(AdwTabView* self) c_adw_tab_view_select_next_page;
  bool function(AdwTabView* self) c_adw_tab_view_select_previous_page;
  void function(AdwTabView* self, GIcon* defaultIcon) c_adw_tab_view_set_default_icon;
  void function(AdwTabView* self, GMenuModel* menuModel) c_adw_tab_view_set_menu_model;
  void function(AdwTabView* self, AdwTabPage* page, bool pinned) c_adw_tab_view_set_page_pinned;
  void function(AdwTabView* self, AdwTabPage* selectedPage) c_adw_tab_view_set_selected_page;
  void function(AdwTabView* self, AdwTabViewShortcuts shortcuts) c_adw_tab_view_set_shortcuts;
  void function(AdwTabView* self, AdwTabPage* page, AdwTabView* otherView, int position) c_adw_tab_view_transfer_page;

  // TimedAnimation
  extern(C) GType function() c_adw_timed_animation_get_type;
  AdwAnimation* function(GtkWidget* widget, double from, double to, uint duration, AdwAnimationTarget* target) c_adw_timed_animation_new;
  bool function(AdwTimedAnimation* self) c_adw_timed_animation_get_alternate;
  uint function(AdwTimedAnimation* self) c_adw_timed_animation_get_duration;
  AdwEasing function(AdwTimedAnimation* self) c_adw_timed_animation_get_easing;
  uint function(AdwTimedAnimation* self) c_adw_timed_animation_get_repeat_count;
  bool function(AdwTimedAnimation* self) c_adw_timed_animation_get_reverse;
  double function(AdwTimedAnimation* self) c_adw_timed_animation_get_value_from;
  double function(AdwTimedAnimation* self) c_adw_timed_animation_get_value_to;
  void function(AdwTimedAnimation* self, bool alternate) c_adw_timed_animation_set_alternate;
  void function(AdwTimedAnimation* self, uint duration) c_adw_timed_animation_set_duration;
  void function(AdwTimedAnimation* self, AdwEasing easing) c_adw_timed_animation_set_easing;
  void function(AdwTimedAnimation* self, uint repeatCount) c_adw_timed_animation_set_repeat_count;
  void function(AdwTimedAnimation* self, bool reverse) c_adw_timed_animation_set_reverse;
  void function(AdwTimedAnimation* self, double value) c_adw_timed_animation_set_value_from;
  void function(AdwTimedAnimation* self, double value) c_adw_timed_animation_set_value_to;

  // Toast
  extern(C) GType function() c_adw_toast_get_type;
  AdwToast* function(const(char)* title) c_adw_toast_new;
  AdwToast* function(const(char)* format,  ...) c_adw_toast_new_format;
  void function(AdwToast* self) c_adw_toast_dismiss;
  const(char)* function(AdwToast* self) c_adw_toast_get_action_name;
  VariantC* function(AdwToast* self) c_adw_toast_get_action_target_value;
  const(char)* function(AdwToast* self) c_adw_toast_get_button_label;
  GtkWidget* function(AdwToast* self) c_adw_toast_get_custom_title;
  AdwToastPriority function(AdwToast* self) c_adw_toast_get_priority;
  uint function(AdwToast* self) c_adw_toast_get_timeout;
  const(char)* function(AdwToast* self) c_adw_toast_get_title;
  bool function(AdwToast* self) c_adw_toast_get_use_markup;
  void function(AdwToast* self, const(char)* actionName) c_adw_toast_set_action_name;
  void function(AdwToast* self, const(char)* formatString,  ...) c_adw_toast_set_action_target;
  void function(AdwToast* self, VariantC* actionTarget) c_adw_toast_set_action_target_value;
  void function(AdwToast* self, const(char)* buttonLabel) c_adw_toast_set_button_label;
  void function(AdwToast* self, GtkWidget* widget) c_adw_toast_set_custom_title;
  void function(AdwToast* self, const(char)* detailedActionName) c_adw_toast_set_detailed_action_name;
  void function(AdwToast* self, AdwToastPriority priority) c_adw_toast_set_priority;
  void function(AdwToast* self, uint timeout) c_adw_toast_set_timeout;
  void function(AdwToast* self, const(char)* title) c_adw_toast_set_title;
  void function(AdwToast* self, bool useMarkup) c_adw_toast_set_use_markup;

  // ToastOverlay
  extern(C) GType function() c_adw_toast_overlay_get_type;
  GtkWidget* function() c_adw_toast_overlay_new;
  void function(AdwToastOverlay* self, AdwToast* toast) c_adw_toast_overlay_add_toast;
  GtkWidget* function(AdwToastOverlay* self) c_adw_toast_overlay_get_child;
  void function(AdwToastOverlay* self, GtkWidget* child) c_adw_toast_overlay_set_child;

  // ToolbarView
  extern(C) GType function() c_adw_toolbar_view_get_type;
  GtkWidget* function() c_adw_toolbar_view_new;
  void function(AdwToolbarView* self, GtkWidget* widget) c_adw_toolbar_view_add_bottom_bar;
  void function(AdwToolbarView* self, GtkWidget* widget) c_adw_toolbar_view_add_top_bar;
  int function(AdwToolbarView* self) c_adw_toolbar_view_get_bottom_bar_height;
  AdwToolbarStyle function(AdwToolbarView* self) c_adw_toolbar_view_get_bottom_bar_style;
  GtkWidget* function(AdwToolbarView* self) c_adw_toolbar_view_get_content;
  bool function(AdwToolbarView* self) c_adw_toolbar_view_get_extend_content_to_bottom_edge;
  bool function(AdwToolbarView* self) c_adw_toolbar_view_get_extend_content_to_top_edge;
  bool function(AdwToolbarView* self) c_adw_toolbar_view_get_reveal_bottom_bars;
  bool function(AdwToolbarView* self) c_adw_toolbar_view_get_reveal_top_bars;
  int function(AdwToolbarView* self) c_adw_toolbar_view_get_top_bar_height;
  AdwToolbarStyle function(AdwToolbarView* self) c_adw_toolbar_view_get_top_bar_style;
  void function(AdwToolbarView* self, GtkWidget* widget) c_adw_toolbar_view_remove;
  void function(AdwToolbarView* self, AdwToolbarStyle style) c_adw_toolbar_view_set_bottom_bar_style;
  void function(AdwToolbarView* self, GtkWidget* content) c_adw_toolbar_view_set_content;
  void function(AdwToolbarView* self, bool extend) c_adw_toolbar_view_set_extend_content_to_bottom_edge;
  void function(AdwToolbarView* self, bool extend) c_adw_toolbar_view_set_extend_content_to_top_edge;
  void function(AdwToolbarView* self, bool reveal) c_adw_toolbar_view_set_reveal_bottom_bars;
  void function(AdwToolbarView* self, bool reveal) c_adw_toolbar_view_set_reveal_top_bars;
  void function(AdwToolbarView* self, AdwToolbarStyle style) c_adw_toolbar_view_set_top_bar_style;

  // ViewStack
  extern(C) GType function() c_adw_view_stack_get_type;
  GtkWidget* function() c_adw_view_stack_new;
  AdwViewStackPage* function(AdwViewStack* self, GtkWidget* child) c_adw_view_stack_add;
  AdwViewStackPage* function(AdwViewStack* self, GtkWidget* child, const(char)* name) c_adw_view_stack_add_named;
  AdwViewStackPage* function(AdwViewStack* self, GtkWidget* child, const(char)* name, const(char)* title) c_adw_view_stack_add_titled;
  AdwViewStackPage* function(AdwViewStack* self, GtkWidget* child, const(char)* name, const(char)* title, const(char)* iconName) c_adw_view_stack_add_titled_with_icon;
  GtkWidget* function(AdwViewStack* self, const(char)* name) c_adw_view_stack_get_child_by_name;
  bool function(AdwViewStack* self) c_adw_view_stack_get_hhomogeneous;
  AdwViewStackPage* function(AdwViewStack* self, GtkWidget* child) c_adw_view_stack_get_page;
  GtkSelectionModel* function(AdwViewStack* self) c_adw_view_stack_get_pages;
  bool function(AdwViewStack* self) c_adw_view_stack_get_vhomogeneous;
  GtkWidget* function(AdwViewStack* self) c_adw_view_stack_get_visible_child;
  const(char)* function(AdwViewStack* self) c_adw_view_stack_get_visible_child_name;
  void function(AdwViewStack* self, GtkWidget* child) c_adw_view_stack_remove;
  void function(AdwViewStack* self, bool hhomogeneous) c_adw_view_stack_set_hhomogeneous;
  void function(AdwViewStack* self, bool vhomogeneous) c_adw_view_stack_set_vhomogeneous;
  void function(AdwViewStack* self, GtkWidget* child) c_adw_view_stack_set_visible_child;
  void function(AdwViewStack* self, const(char)* name) c_adw_view_stack_set_visible_child_name;

  // ViewStackPage
  extern(C) GType function() c_adw_view_stack_page_get_type;
  uint function(AdwViewStackPage* self) c_adw_view_stack_page_get_badge_number;
  GtkWidget* function(AdwViewStackPage* self) c_adw_view_stack_page_get_child;
  const(char)* function(AdwViewStackPage* self) c_adw_view_stack_page_get_icon_name;
  const(char)* function(AdwViewStackPage* self) c_adw_view_stack_page_get_name;
  bool function(AdwViewStackPage* self) c_adw_view_stack_page_get_needs_attention;
  const(char)* function(AdwViewStackPage* self) c_adw_view_stack_page_get_title;
  bool function(AdwViewStackPage* self) c_adw_view_stack_page_get_use_underline;
  bool function(AdwViewStackPage* self) c_adw_view_stack_page_get_visible;
  void function(AdwViewStackPage* self, uint badgeNumber) c_adw_view_stack_page_set_badge_number;
  void function(AdwViewStackPage* self, const(char)* iconName) c_adw_view_stack_page_set_icon_name;
  void function(AdwViewStackPage* self, const(char)* name) c_adw_view_stack_page_set_name;
  void function(AdwViewStackPage* self, bool needsAttention) c_adw_view_stack_page_set_needs_attention;
  void function(AdwViewStackPage* self, const(char)* title) c_adw_view_stack_page_set_title;
  void function(AdwViewStackPage* self, bool useUnderline) c_adw_view_stack_page_set_use_underline;
  void function(AdwViewStackPage* self, bool visible) c_adw_view_stack_page_set_visible;

  // ViewStackPages
  extern(C) GType function() c_adw_view_stack_pages_get_type;
  AdwViewStackPage* function(AdwViewStackPages* self) c_adw_view_stack_pages_get_selected_page;
  void function(AdwViewStackPages* self, AdwViewStackPage* page) c_adw_view_stack_pages_set_selected_page;

  // ViewSwitcher
  extern(C) GType function() c_adw_view_switcher_get_type;
  GtkWidget* function() c_adw_view_switcher_new;
  AdwViewSwitcherPolicy function(AdwViewSwitcher* self) c_adw_view_switcher_get_policy;
  AdwViewStack* function(AdwViewSwitcher* self) c_adw_view_switcher_get_stack;
  void function(AdwViewSwitcher* self, AdwViewSwitcherPolicy policy) c_adw_view_switcher_set_policy;
  void function(AdwViewSwitcher* self, AdwViewStack* stack) c_adw_view_switcher_set_stack;

  // ViewSwitcherBar
  extern(C) GType function() c_adw_view_switcher_bar_get_type;
  GtkWidget* function() c_adw_view_switcher_bar_new;
  bool function(AdwViewSwitcherBar* self) c_adw_view_switcher_bar_get_reveal;
  AdwViewStack* function(AdwViewSwitcherBar* self) c_adw_view_switcher_bar_get_stack;
  void function(AdwViewSwitcherBar* self, bool reveal) c_adw_view_switcher_bar_set_reveal;
  void function(AdwViewSwitcherBar* self, AdwViewStack* stack) c_adw_view_switcher_bar_set_stack;

  // ViewSwitcherTitle
  extern(C) GType function() c_adw_view_switcher_title_get_type;
  GtkWidget* function() c_adw_view_switcher_title_new;
  AdwViewStack* function(AdwViewSwitcherTitle* self) c_adw_view_switcher_title_get_stack;
  const(char)* function(AdwViewSwitcherTitle* self) c_adw_view_switcher_title_get_subtitle;
  const(char)* function(AdwViewSwitcherTitle* self) c_adw_view_switcher_title_get_title;
  bool function(AdwViewSwitcherTitle* self) c_adw_view_switcher_title_get_title_visible;
  bool function(AdwViewSwitcherTitle* self) c_adw_view_switcher_title_get_view_switcher_enabled;
  void function(AdwViewSwitcherTitle* self, AdwViewStack* stack) c_adw_view_switcher_title_set_stack;
  void function(AdwViewSwitcherTitle* self, const(char)* subtitle) c_adw_view_switcher_title_set_subtitle;
  void function(AdwViewSwitcherTitle* self, const(char)* title) c_adw_view_switcher_title_set_title;
  void function(AdwViewSwitcherTitle* self, bool enabled) c_adw_view_switcher_title_set_view_switcher_enabled;

  // Window
  extern(C) GType function() c_adw_window_get_type;
  GtkWidget* function() c_adw_window_new;
  void function(AdwWindow* self, AdwBreakpoint* breakpoint) c_adw_window_add_breakpoint;
  GtkWidget* function(AdwWindow* self) c_adw_window_get_content;
  AdwBreakpoint* function(AdwWindow* self) c_adw_window_get_current_breakpoint;
  GListModel* function(AdwWindow* self) c_adw_window_get_dialogs;
  AdwDialog* function(AdwWindow* self) c_adw_window_get_visible_dialog;
  void function(AdwWindow* self, GtkWidget* content) c_adw_window_set_content;

  // WindowTitle
  extern(C) GType function() c_adw_window_title_get_type;
  GtkWidget* function(const(char)* title, const(char)* subtitle) c_adw_window_title_new;
  const(char)* function(AdwWindowTitle* self) c_adw_window_title_get_subtitle;
  const(char)* function(AdwWindowTitle* self) c_adw_window_title_get_title;
  void function(AdwWindowTitle* self, const(char)* subtitle) c_adw_window_title_set_subtitle;
  void function(AdwWindowTitle* self, const(char)* title) c_adw_window_title_set_title;

  // global
  bool function(GtkWidget* widget) c_adw_get_enable_animations;
  uint function() c_adw_get_major_version;
  uint function() c_adw_get_micro_version;
  uint function() c_adw_get_minor_version;
  void function() c_adw_init;
  bool function() c_adw_is_initialized;
  double function(double a, double b, double t) c_adw_lerp;
  void function(GtkWidget* parent, const(char)* firstPropertyName,  ...) c_adw_show_about_dialog;
  void function(GtkWidget* parent, const(char)* resourcePath, const(char)* releaseNotesVersion, const(char)* firstPropertyName,  ...) c_adw_show_about_dialog_from_appdata;
  void function(GtkWindow* parent, const(char)* firstPropertyName,  ...) c_adw_show_about_window;
  void function(GtkWindow* parent, const(char)* resourcePath, const(char)* releaseNotesVersion, const(char)* firstPropertyName,  ...) c_adw_show_about_window_from_appdata;
}

// AboutDialog
alias adw_about_dialog_get_type = c_adw_about_dialog_get_type;
alias adw_about_dialog_new = c_adw_about_dialog_new;
alias adw_about_dialog_new_from_appdata = c_adw_about_dialog_new_from_appdata;
alias adw_about_dialog_add_acknowledgement_section = c_adw_about_dialog_add_acknowledgement_section;
alias adw_about_dialog_add_credit_section = c_adw_about_dialog_add_credit_section;
alias adw_about_dialog_add_legal_section = c_adw_about_dialog_add_legal_section;
alias adw_about_dialog_add_link = c_adw_about_dialog_add_link;
alias adw_about_dialog_get_application_icon = c_adw_about_dialog_get_application_icon;
alias adw_about_dialog_get_application_name = c_adw_about_dialog_get_application_name;
alias adw_about_dialog_get_artists = c_adw_about_dialog_get_artists;
alias adw_about_dialog_get_comments = c_adw_about_dialog_get_comments;
alias adw_about_dialog_get_copyright = c_adw_about_dialog_get_copyright;
alias adw_about_dialog_get_debug_info = c_adw_about_dialog_get_debug_info;
alias adw_about_dialog_get_debug_info_filename = c_adw_about_dialog_get_debug_info_filename;
alias adw_about_dialog_get_designers = c_adw_about_dialog_get_designers;
alias adw_about_dialog_get_developer_name = c_adw_about_dialog_get_developer_name;
alias adw_about_dialog_get_developers = c_adw_about_dialog_get_developers;
alias adw_about_dialog_get_documenters = c_adw_about_dialog_get_documenters;
alias adw_about_dialog_get_issue_url = c_adw_about_dialog_get_issue_url;
alias adw_about_dialog_get_license = c_adw_about_dialog_get_license;
alias adw_about_dialog_get_license_type = c_adw_about_dialog_get_license_type;
alias adw_about_dialog_get_release_notes = c_adw_about_dialog_get_release_notes;
alias adw_about_dialog_get_release_notes_version = c_adw_about_dialog_get_release_notes_version;
alias adw_about_dialog_get_support_url = c_adw_about_dialog_get_support_url;
alias adw_about_dialog_get_translator_credits = c_adw_about_dialog_get_translator_credits;
alias adw_about_dialog_get_version = c_adw_about_dialog_get_version;
alias adw_about_dialog_get_website = c_adw_about_dialog_get_website;
alias adw_about_dialog_set_application_icon = c_adw_about_dialog_set_application_icon;
alias adw_about_dialog_set_application_name = c_adw_about_dialog_set_application_name;
alias adw_about_dialog_set_artists = c_adw_about_dialog_set_artists;
alias adw_about_dialog_set_comments = c_adw_about_dialog_set_comments;
alias adw_about_dialog_set_copyright = c_adw_about_dialog_set_copyright;
alias adw_about_dialog_set_debug_info = c_adw_about_dialog_set_debug_info;
alias adw_about_dialog_set_debug_info_filename = c_adw_about_dialog_set_debug_info_filename;
alias adw_about_dialog_set_designers = c_adw_about_dialog_set_designers;
alias adw_about_dialog_set_developer_name = c_adw_about_dialog_set_developer_name;
alias adw_about_dialog_set_developers = c_adw_about_dialog_set_developers;
alias adw_about_dialog_set_documenters = c_adw_about_dialog_set_documenters;
alias adw_about_dialog_set_issue_url = c_adw_about_dialog_set_issue_url;
alias adw_about_dialog_set_license = c_adw_about_dialog_set_license;
alias adw_about_dialog_set_license_type = c_adw_about_dialog_set_license_type;
alias adw_about_dialog_set_release_notes = c_adw_about_dialog_set_release_notes;
alias adw_about_dialog_set_release_notes_version = c_adw_about_dialog_set_release_notes_version;
alias adw_about_dialog_set_support_url = c_adw_about_dialog_set_support_url;
alias adw_about_dialog_set_translator_credits = c_adw_about_dialog_set_translator_credits;
alias adw_about_dialog_set_version = c_adw_about_dialog_set_version;
alias adw_about_dialog_set_website = c_adw_about_dialog_set_website;

// AboutWindow
alias adw_about_window_get_type = c_adw_about_window_get_type;
alias adw_about_window_new = c_adw_about_window_new;
alias adw_about_window_new_from_appdata = c_adw_about_window_new_from_appdata;
alias adw_about_window_add_acknowledgement_section = c_adw_about_window_add_acknowledgement_section;
alias adw_about_window_add_credit_section = c_adw_about_window_add_credit_section;
alias adw_about_window_add_legal_section = c_adw_about_window_add_legal_section;
alias adw_about_window_add_link = c_adw_about_window_add_link;
alias adw_about_window_get_application_icon = c_adw_about_window_get_application_icon;
alias adw_about_window_get_application_name = c_adw_about_window_get_application_name;
alias adw_about_window_get_artists = c_adw_about_window_get_artists;
alias adw_about_window_get_comments = c_adw_about_window_get_comments;
alias adw_about_window_get_copyright = c_adw_about_window_get_copyright;
alias adw_about_window_get_debug_info = c_adw_about_window_get_debug_info;
alias adw_about_window_get_debug_info_filename = c_adw_about_window_get_debug_info_filename;
alias adw_about_window_get_designers = c_adw_about_window_get_designers;
alias adw_about_window_get_developer_name = c_adw_about_window_get_developer_name;
alias adw_about_window_get_developers = c_adw_about_window_get_developers;
alias adw_about_window_get_documenters = c_adw_about_window_get_documenters;
alias adw_about_window_get_issue_url = c_adw_about_window_get_issue_url;
alias adw_about_window_get_license = c_adw_about_window_get_license;
alias adw_about_window_get_license_type = c_adw_about_window_get_license_type;
alias adw_about_window_get_release_notes = c_adw_about_window_get_release_notes;
alias adw_about_window_get_release_notes_version = c_adw_about_window_get_release_notes_version;
alias adw_about_window_get_support_url = c_adw_about_window_get_support_url;
alias adw_about_window_get_translator_credits = c_adw_about_window_get_translator_credits;
alias adw_about_window_get_version = c_adw_about_window_get_version;
alias adw_about_window_get_website = c_adw_about_window_get_website;
alias adw_about_window_set_application_icon = c_adw_about_window_set_application_icon;
alias adw_about_window_set_application_name = c_adw_about_window_set_application_name;
alias adw_about_window_set_artists = c_adw_about_window_set_artists;
alias adw_about_window_set_comments = c_adw_about_window_set_comments;
alias adw_about_window_set_copyright = c_adw_about_window_set_copyright;
alias adw_about_window_set_debug_info = c_adw_about_window_set_debug_info;
alias adw_about_window_set_debug_info_filename = c_adw_about_window_set_debug_info_filename;
alias adw_about_window_set_designers = c_adw_about_window_set_designers;
alias adw_about_window_set_developer_name = c_adw_about_window_set_developer_name;
alias adw_about_window_set_developers = c_adw_about_window_set_developers;
alias adw_about_window_set_documenters = c_adw_about_window_set_documenters;
alias adw_about_window_set_issue_url = c_adw_about_window_set_issue_url;
alias adw_about_window_set_license = c_adw_about_window_set_license;
alias adw_about_window_set_license_type = c_adw_about_window_set_license_type;
alias adw_about_window_set_release_notes = c_adw_about_window_set_release_notes;
alias adw_about_window_set_release_notes_version = c_adw_about_window_set_release_notes_version;
alias adw_about_window_set_support_url = c_adw_about_window_set_support_url;
alias adw_about_window_set_translator_credits = c_adw_about_window_set_translator_credits;
alias adw_about_window_set_version = c_adw_about_window_set_version;
alias adw_about_window_set_website = c_adw_about_window_set_website;

// ActionRow
alias adw_action_row_get_type = c_adw_action_row_get_type;
alias adw_action_row_new = c_adw_action_row_new;
alias adw_action_row_activate = c_adw_action_row_activate;
alias adw_action_row_add_prefix = c_adw_action_row_add_prefix;
alias adw_action_row_add_suffix = c_adw_action_row_add_suffix;
alias adw_action_row_get_activatable_widget = c_adw_action_row_get_activatable_widget;
alias adw_action_row_get_icon_name = c_adw_action_row_get_icon_name;
alias adw_action_row_get_subtitle = c_adw_action_row_get_subtitle;
alias adw_action_row_get_subtitle_lines = c_adw_action_row_get_subtitle_lines;
alias adw_action_row_get_subtitle_selectable = c_adw_action_row_get_subtitle_selectable;
alias adw_action_row_get_title_lines = c_adw_action_row_get_title_lines;
alias adw_action_row_remove = c_adw_action_row_remove;
alias adw_action_row_set_activatable_widget = c_adw_action_row_set_activatable_widget;
alias adw_action_row_set_icon_name = c_adw_action_row_set_icon_name;
alias adw_action_row_set_subtitle = c_adw_action_row_set_subtitle;
alias adw_action_row_set_subtitle_lines = c_adw_action_row_set_subtitle_lines;
alias adw_action_row_set_subtitle_selectable = c_adw_action_row_set_subtitle_selectable;
alias adw_action_row_set_title_lines = c_adw_action_row_set_title_lines;

// AlertDialog
alias adw_alert_dialog_get_type = c_adw_alert_dialog_get_type;
alias adw_alert_dialog_new = c_adw_alert_dialog_new;
alias adw_alert_dialog_add_response = c_adw_alert_dialog_add_response;
alias adw_alert_dialog_add_responses = c_adw_alert_dialog_add_responses;
alias adw_alert_dialog_choose = c_adw_alert_dialog_choose;
alias adw_alert_dialog_choose_finish = c_adw_alert_dialog_choose_finish;
alias adw_alert_dialog_format_body = c_adw_alert_dialog_format_body;
alias adw_alert_dialog_format_body_markup = c_adw_alert_dialog_format_body_markup;
alias adw_alert_dialog_format_heading = c_adw_alert_dialog_format_heading;
alias adw_alert_dialog_format_heading_markup = c_adw_alert_dialog_format_heading_markup;
alias adw_alert_dialog_get_body = c_adw_alert_dialog_get_body;
alias adw_alert_dialog_get_body_use_markup = c_adw_alert_dialog_get_body_use_markup;
alias adw_alert_dialog_get_close_response = c_adw_alert_dialog_get_close_response;
alias adw_alert_dialog_get_default_response = c_adw_alert_dialog_get_default_response;
alias adw_alert_dialog_get_extra_child = c_adw_alert_dialog_get_extra_child;
alias adw_alert_dialog_get_heading = c_adw_alert_dialog_get_heading;
alias adw_alert_dialog_get_heading_use_markup = c_adw_alert_dialog_get_heading_use_markup;
alias adw_alert_dialog_get_response_appearance = c_adw_alert_dialog_get_response_appearance;
alias adw_alert_dialog_get_response_enabled = c_adw_alert_dialog_get_response_enabled;
alias adw_alert_dialog_get_response_label = c_adw_alert_dialog_get_response_label;
alias adw_alert_dialog_has_response = c_adw_alert_dialog_has_response;
alias adw_alert_dialog_remove_response = c_adw_alert_dialog_remove_response;
alias adw_alert_dialog_set_body = c_adw_alert_dialog_set_body;
alias adw_alert_dialog_set_body_use_markup = c_adw_alert_dialog_set_body_use_markup;
alias adw_alert_dialog_set_close_response = c_adw_alert_dialog_set_close_response;
alias adw_alert_dialog_set_default_response = c_adw_alert_dialog_set_default_response;
alias adw_alert_dialog_set_extra_child = c_adw_alert_dialog_set_extra_child;
alias adw_alert_dialog_set_heading = c_adw_alert_dialog_set_heading;
alias adw_alert_dialog_set_heading_use_markup = c_adw_alert_dialog_set_heading_use_markup;
alias adw_alert_dialog_set_response_appearance = c_adw_alert_dialog_set_response_appearance;
alias adw_alert_dialog_set_response_enabled = c_adw_alert_dialog_set_response_enabled;
alias adw_alert_dialog_set_response_label = c_adw_alert_dialog_set_response_label;

// Animation
alias adw_animation_get_type = c_adw_animation_get_type;
alias adw_animation_get_follow_enable_animations_setting = c_adw_animation_get_follow_enable_animations_setting;
alias adw_animation_get_state = c_adw_animation_get_state;
alias adw_animation_get_target = c_adw_animation_get_target;
alias adw_animation_get_value = c_adw_animation_get_value;
alias adw_animation_get_widget = c_adw_animation_get_widget;
alias adw_animation_pause = c_adw_animation_pause;
alias adw_animation_play = c_adw_animation_play;
alias adw_animation_reset = c_adw_animation_reset;
alias adw_animation_resume = c_adw_animation_resume;
alias adw_animation_set_follow_enable_animations_setting = c_adw_animation_set_follow_enable_animations_setting;
alias adw_animation_set_target = c_adw_animation_set_target;
alias adw_animation_skip = c_adw_animation_skip;

// AnimationTarget
alias adw_animation_target_get_type = c_adw_animation_target_get_type;

// Application
alias adw_application_get_type = c_adw_application_get_type;
alias adw_application_new = c_adw_application_new;
alias adw_application_get_style_manager = c_adw_application_get_style_manager;

// ApplicationWindow
alias adw_application_window_get_type = c_adw_application_window_get_type;
alias adw_application_window_new = c_adw_application_window_new;
alias adw_application_window_add_breakpoint = c_adw_application_window_add_breakpoint;
alias adw_application_window_get_content = c_adw_application_window_get_content;
alias adw_application_window_get_current_breakpoint = c_adw_application_window_get_current_breakpoint;
alias adw_application_window_get_dialogs = c_adw_application_window_get_dialogs;
alias adw_application_window_get_visible_dialog = c_adw_application_window_get_visible_dialog;
alias adw_application_window_set_content = c_adw_application_window_set_content;

// Avatar
alias adw_avatar_get_type = c_adw_avatar_get_type;
alias adw_avatar_new = c_adw_avatar_new;
alias adw_avatar_draw_to_texture = c_adw_avatar_draw_to_texture;
alias adw_avatar_get_custom_image = c_adw_avatar_get_custom_image;
alias adw_avatar_get_icon_name = c_adw_avatar_get_icon_name;
alias adw_avatar_get_show_initials = c_adw_avatar_get_show_initials;
alias adw_avatar_get_size = c_adw_avatar_get_size;
alias adw_avatar_get_text = c_adw_avatar_get_text;
alias adw_avatar_set_custom_image = c_adw_avatar_set_custom_image;
alias adw_avatar_set_icon_name = c_adw_avatar_set_icon_name;
alias adw_avatar_set_show_initials = c_adw_avatar_set_show_initials;
alias adw_avatar_set_size = c_adw_avatar_set_size;
alias adw_avatar_set_text = c_adw_avatar_set_text;

// Banner
alias adw_banner_get_type = c_adw_banner_get_type;
alias adw_banner_new = c_adw_banner_new;
alias adw_banner_get_button_label = c_adw_banner_get_button_label;
alias adw_banner_get_revealed = c_adw_banner_get_revealed;
alias adw_banner_get_title = c_adw_banner_get_title;
alias adw_banner_get_use_markup = c_adw_banner_get_use_markup;
alias adw_banner_set_button_label = c_adw_banner_set_button_label;
alias adw_banner_set_revealed = c_adw_banner_set_revealed;
alias adw_banner_set_title = c_adw_banner_set_title;
alias adw_banner_set_use_markup = c_adw_banner_set_use_markup;

// Bin
alias adw_bin_get_type = c_adw_bin_get_type;
alias adw_bin_new = c_adw_bin_new;
alias adw_bin_get_child = c_adw_bin_get_child;
alias adw_bin_set_child = c_adw_bin_set_child;

// Breakpoint
alias adw_breakpoint_get_type = c_adw_breakpoint_get_type;
alias adw_breakpoint_new = c_adw_breakpoint_new;
alias adw_breakpoint_add_setter = c_adw_breakpoint_add_setter;
alias adw_breakpoint_add_setters = c_adw_breakpoint_add_setters;
alias adw_breakpoint_add_setters_valist = c_adw_breakpoint_add_setters_valist;
alias adw_breakpoint_add_settersv = c_adw_breakpoint_add_settersv;
alias adw_breakpoint_get_condition = c_adw_breakpoint_get_condition;
alias adw_breakpoint_set_condition = c_adw_breakpoint_set_condition;

// BreakpointBin
alias adw_breakpoint_bin_get_type = c_adw_breakpoint_bin_get_type;
alias adw_breakpoint_bin_new = c_adw_breakpoint_bin_new;
alias adw_breakpoint_bin_add_breakpoint = c_adw_breakpoint_bin_add_breakpoint;
alias adw_breakpoint_bin_get_child = c_adw_breakpoint_bin_get_child;
alias adw_breakpoint_bin_get_current_breakpoint = c_adw_breakpoint_bin_get_current_breakpoint;
alias adw_breakpoint_bin_remove_breakpoint = c_adw_breakpoint_bin_remove_breakpoint;
alias adw_breakpoint_bin_set_child = c_adw_breakpoint_bin_set_child;

// BreakpointCondition
alias adw_breakpoint_condition_get_type = c_adw_breakpoint_condition_get_type;
alias adw_breakpoint_condition_new_and = c_adw_breakpoint_condition_new_and;
alias adw_breakpoint_condition_new_length = c_adw_breakpoint_condition_new_length;
alias adw_breakpoint_condition_new_or = c_adw_breakpoint_condition_new_or;
alias adw_breakpoint_condition_new_ratio = c_adw_breakpoint_condition_new_ratio;
alias adw_breakpoint_condition_copy = c_adw_breakpoint_condition_copy;
alias adw_breakpoint_condition_free = c_adw_breakpoint_condition_free;
alias adw_breakpoint_condition_to_string = c_adw_breakpoint_condition_to_string;
alias adw_breakpoint_condition_parse = c_adw_breakpoint_condition_parse;

// ButtonContent
alias adw_button_content_get_type = c_adw_button_content_get_type;
alias adw_button_content_new = c_adw_button_content_new;
alias adw_button_content_get_can_shrink = c_adw_button_content_get_can_shrink;
alias adw_button_content_get_icon_name = c_adw_button_content_get_icon_name;
alias adw_button_content_get_label = c_adw_button_content_get_label;
alias adw_button_content_get_use_underline = c_adw_button_content_get_use_underline;
alias adw_button_content_set_can_shrink = c_adw_button_content_set_can_shrink;
alias adw_button_content_set_icon_name = c_adw_button_content_set_icon_name;
alias adw_button_content_set_label = c_adw_button_content_set_label;
alias adw_button_content_set_use_underline = c_adw_button_content_set_use_underline;

// CallbackAnimationTarget
alias adw_callback_animation_target_get_type = c_adw_callback_animation_target_get_type;
alias adw_callback_animation_target_new = c_adw_callback_animation_target_new;

// Carousel
alias adw_carousel_get_type = c_adw_carousel_get_type;
alias adw_carousel_new = c_adw_carousel_new;
alias adw_carousel_append = c_adw_carousel_append;
alias adw_carousel_get_allow_long_swipes = c_adw_carousel_get_allow_long_swipes;
alias adw_carousel_get_allow_mouse_drag = c_adw_carousel_get_allow_mouse_drag;
alias adw_carousel_get_allow_scroll_wheel = c_adw_carousel_get_allow_scroll_wheel;
alias adw_carousel_get_interactive = c_adw_carousel_get_interactive;
alias adw_carousel_get_n_pages = c_adw_carousel_get_n_pages;
alias adw_carousel_get_nth_page = c_adw_carousel_get_nth_page;
alias adw_carousel_get_position = c_adw_carousel_get_position;
alias adw_carousel_get_reveal_duration = c_adw_carousel_get_reveal_duration;
alias adw_carousel_get_scroll_params = c_adw_carousel_get_scroll_params;
alias adw_carousel_get_spacing = c_adw_carousel_get_spacing;
alias adw_carousel_insert = c_adw_carousel_insert;
alias adw_carousel_prepend = c_adw_carousel_prepend;
alias adw_carousel_remove = c_adw_carousel_remove;
alias adw_carousel_reorder = c_adw_carousel_reorder;
alias adw_carousel_scroll_to = c_adw_carousel_scroll_to;
alias adw_carousel_set_allow_long_swipes = c_adw_carousel_set_allow_long_swipes;
alias adw_carousel_set_allow_mouse_drag = c_adw_carousel_set_allow_mouse_drag;
alias adw_carousel_set_allow_scroll_wheel = c_adw_carousel_set_allow_scroll_wheel;
alias adw_carousel_set_interactive = c_adw_carousel_set_interactive;
alias adw_carousel_set_reveal_duration = c_adw_carousel_set_reveal_duration;
alias adw_carousel_set_scroll_params = c_adw_carousel_set_scroll_params;
alias adw_carousel_set_spacing = c_adw_carousel_set_spacing;

// CarouselIndicatorDots
alias adw_carousel_indicator_dots_get_type = c_adw_carousel_indicator_dots_get_type;
alias adw_carousel_indicator_dots_new = c_adw_carousel_indicator_dots_new;
alias adw_carousel_indicator_dots_get_carousel = c_adw_carousel_indicator_dots_get_carousel;
alias adw_carousel_indicator_dots_set_carousel = c_adw_carousel_indicator_dots_set_carousel;

// CarouselIndicatorLines
alias adw_carousel_indicator_lines_get_type = c_adw_carousel_indicator_lines_get_type;
alias adw_carousel_indicator_lines_new = c_adw_carousel_indicator_lines_new;
alias adw_carousel_indicator_lines_get_carousel = c_adw_carousel_indicator_lines_get_carousel;
alias adw_carousel_indicator_lines_set_carousel = c_adw_carousel_indicator_lines_set_carousel;

// Clamp
alias adw_clamp_get_type = c_adw_clamp_get_type;
alias adw_clamp_new = c_adw_clamp_new;
alias adw_clamp_get_child = c_adw_clamp_get_child;
alias adw_clamp_get_maximum_size = c_adw_clamp_get_maximum_size;
alias adw_clamp_get_tightening_threshold = c_adw_clamp_get_tightening_threshold;
alias adw_clamp_get_unit = c_adw_clamp_get_unit;
alias adw_clamp_set_child = c_adw_clamp_set_child;
alias adw_clamp_set_maximum_size = c_adw_clamp_set_maximum_size;
alias adw_clamp_set_tightening_threshold = c_adw_clamp_set_tightening_threshold;
alias adw_clamp_set_unit = c_adw_clamp_set_unit;

// ClampLayout
alias adw_clamp_layout_get_type = c_adw_clamp_layout_get_type;
alias adw_clamp_layout_new = c_adw_clamp_layout_new;
alias adw_clamp_layout_get_maximum_size = c_adw_clamp_layout_get_maximum_size;
alias adw_clamp_layout_get_tightening_threshold = c_adw_clamp_layout_get_tightening_threshold;
alias adw_clamp_layout_get_unit = c_adw_clamp_layout_get_unit;
alias adw_clamp_layout_set_maximum_size = c_adw_clamp_layout_set_maximum_size;
alias adw_clamp_layout_set_tightening_threshold = c_adw_clamp_layout_set_tightening_threshold;
alias adw_clamp_layout_set_unit = c_adw_clamp_layout_set_unit;

// ClampScrollable
alias adw_clamp_scrollable_get_type = c_adw_clamp_scrollable_get_type;
alias adw_clamp_scrollable_new = c_adw_clamp_scrollable_new;
alias adw_clamp_scrollable_get_child = c_adw_clamp_scrollable_get_child;
alias adw_clamp_scrollable_get_maximum_size = c_adw_clamp_scrollable_get_maximum_size;
alias adw_clamp_scrollable_get_tightening_threshold = c_adw_clamp_scrollable_get_tightening_threshold;
alias adw_clamp_scrollable_get_unit = c_adw_clamp_scrollable_get_unit;
alias adw_clamp_scrollable_set_child = c_adw_clamp_scrollable_set_child;
alias adw_clamp_scrollable_set_maximum_size = c_adw_clamp_scrollable_set_maximum_size;
alias adw_clamp_scrollable_set_tightening_threshold = c_adw_clamp_scrollable_set_tightening_threshold;
alias adw_clamp_scrollable_set_unit = c_adw_clamp_scrollable_set_unit;

// ComboRow
alias adw_combo_row_get_type = c_adw_combo_row_get_type;
alias adw_combo_row_new = c_adw_combo_row_new;
alias adw_combo_row_get_enable_search = c_adw_combo_row_get_enable_search;
alias adw_combo_row_get_expression = c_adw_combo_row_get_expression;
alias adw_combo_row_get_factory = c_adw_combo_row_get_factory;
alias adw_combo_row_get_list_factory = c_adw_combo_row_get_list_factory;
alias adw_combo_row_get_model = c_adw_combo_row_get_model;
alias adw_combo_row_get_selected = c_adw_combo_row_get_selected;
alias adw_combo_row_get_selected_item = c_adw_combo_row_get_selected_item;
alias adw_combo_row_get_use_subtitle = c_adw_combo_row_get_use_subtitle;
alias adw_combo_row_set_enable_search = c_adw_combo_row_set_enable_search;
alias adw_combo_row_set_expression = c_adw_combo_row_set_expression;
alias adw_combo_row_set_factory = c_adw_combo_row_set_factory;
alias adw_combo_row_set_list_factory = c_adw_combo_row_set_list_factory;
alias adw_combo_row_set_model = c_adw_combo_row_set_model;
alias adw_combo_row_set_selected = c_adw_combo_row_set_selected;
alias adw_combo_row_set_use_subtitle = c_adw_combo_row_set_use_subtitle;

// Dialog
alias adw_dialog_get_type = c_adw_dialog_get_type;
alias adw_dialog_new = c_adw_dialog_new;
alias adw_dialog_add_breakpoint = c_adw_dialog_add_breakpoint;
alias adw_dialog_close = c_adw_dialog_close;
alias adw_dialog_force_close = c_adw_dialog_force_close;
alias adw_dialog_get_can_close = c_adw_dialog_get_can_close;
alias adw_dialog_get_child = c_adw_dialog_get_child;
alias adw_dialog_get_content_height = c_adw_dialog_get_content_height;
alias adw_dialog_get_content_width = c_adw_dialog_get_content_width;
alias adw_dialog_get_current_breakpoint = c_adw_dialog_get_current_breakpoint;
alias adw_dialog_get_default_widget = c_adw_dialog_get_default_widget;
alias adw_dialog_get_focus = c_adw_dialog_get_focus;
alias adw_dialog_get_follows_content_size = c_adw_dialog_get_follows_content_size;
alias adw_dialog_get_presentation_mode = c_adw_dialog_get_presentation_mode;
alias adw_dialog_get_title = c_adw_dialog_get_title;
alias adw_dialog_present = c_adw_dialog_present;
alias adw_dialog_set_can_close = c_adw_dialog_set_can_close;
alias adw_dialog_set_child = c_adw_dialog_set_child;
alias adw_dialog_set_content_height = c_adw_dialog_set_content_height;
alias adw_dialog_set_content_width = c_adw_dialog_set_content_width;
alias adw_dialog_set_default_widget = c_adw_dialog_set_default_widget;
alias adw_dialog_set_focus = c_adw_dialog_set_focus;
alias adw_dialog_set_follows_content_size = c_adw_dialog_set_follows_content_size;
alias adw_dialog_set_presentation_mode = c_adw_dialog_set_presentation_mode;
alias adw_dialog_set_title = c_adw_dialog_set_title;

// EntryRow
alias adw_entry_row_get_type = c_adw_entry_row_get_type;
alias adw_entry_row_new = c_adw_entry_row_new;
alias adw_entry_row_add_prefix = c_adw_entry_row_add_prefix;
alias adw_entry_row_add_suffix = c_adw_entry_row_add_suffix;
alias adw_entry_row_get_activates_default = c_adw_entry_row_get_activates_default;
alias adw_entry_row_get_attributes = c_adw_entry_row_get_attributes;
alias adw_entry_row_get_enable_emoji_completion = c_adw_entry_row_get_enable_emoji_completion;
alias adw_entry_row_get_input_hints = c_adw_entry_row_get_input_hints;
alias adw_entry_row_get_input_purpose = c_adw_entry_row_get_input_purpose;
alias adw_entry_row_get_show_apply_button = c_adw_entry_row_get_show_apply_button;
alias adw_entry_row_get_text_length = c_adw_entry_row_get_text_length;
alias adw_entry_row_grab_focus_without_selecting = c_adw_entry_row_grab_focus_without_selecting;
alias adw_entry_row_remove = c_adw_entry_row_remove;
alias adw_entry_row_set_activates_default = c_adw_entry_row_set_activates_default;
alias adw_entry_row_set_attributes = c_adw_entry_row_set_attributes;
alias adw_entry_row_set_enable_emoji_completion = c_adw_entry_row_set_enable_emoji_completion;
alias adw_entry_row_set_input_hints = c_adw_entry_row_set_input_hints;
alias adw_entry_row_set_input_purpose = c_adw_entry_row_set_input_purpose;
alias adw_entry_row_set_show_apply_button = c_adw_entry_row_set_show_apply_button;

// EnumListItem
alias adw_enum_list_item_get_type = c_adw_enum_list_item_get_type;
alias adw_enum_list_item_get_name = c_adw_enum_list_item_get_name;
alias adw_enum_list_item_get_nick = c_adw_enum_list_item_get_nick;
alias adw_enum_list_item_get_value = c_adw_enum_list_item_get_value;

// EnumListModel
alias adw_enum_list_model_get_type = c_adw_enum_list_model_get_type;
alias adw_enum_list_model_new = c_adw_enum_list_model_new;
alias adw_enum_list_model_find_position = c_adw_enum_list_model_find_position;
alias adw_enum_list_model_get_enum_type = c_adw_enum_list_model_get_enum_type;

// ExpanderRow
alias adw_expander_row_get_type = c_adw_expander_row_get_type;
alias adw_expander_row_new = c_adw_expander_row_new;
alias adw_expander_row_add_action = c_adw_expander_row_add_action;
alias adw_expander_row_add_prefix = c_adw_expander_row_add_prefix;
alias adw_expander_row_add_row = c_adw_expander_row_add_row;
alias adw_expander_row_add_suffix = c_adw_expander_row_add_suffix;
alias adw_expander_row_get_enable_expansion = c_adw_expander_row_get_enable_expansion;
alias adw_expander_row_get_expanded = c_adw_expander_row_get_expanded;
alias adw_expander_row_get_icon_name = c_adw_expander_row_get_icon_name;
alias adw_expander_row_get_show_enable_switch = c_adw_expander_row_get_show_enable_switch;
alias adw_expander_row_get_subtitle = c_adw_expander_row_get_subtitle;
alias adw_expander_row_get_subtitle_lines = c_adw_expander_row_get_subtitle_lines;
alias adw_expander_row_get_title_lines = c_adw_expander_row_get_title_lines;
alias adw_expander_row_remove = c_adw_expander_row_remove;
alias adw_expander_row_set_enable_expansion = c_adw_expander_row_set_enable_expansion;
alias adw_expander_row_set_expanded = c_adw_expander_row_set_expanded;
alias adw_expander_row_set_icon_name = c_adw_expander_row_set_icon_name;
alias adw_expander_row_set_show_enable_switch = c_adw_expander_row_set_show_enable_switch;
alias adw_expander_row_set_subtitle = c_adw_expander_row_set_subtitle;
alias adw_expander_row_set_subtitle_lines = c_adw_expander_row_set_subtitle_lines;
alias adw_expander_row_set_title_lines = c_adw_expander_row_set_title_lines;

// Flap
alias adw_flap_get_type = c_adw_flap_get_type;
alias adw_flap_new = c_adw_flap_new;
alias adw_flap_get_content = c_adw_flap_get_content;
alias adw_flap_get_flap = c_adw_flap_get_flap;
alias adw_flap_get_flap_position = c_adw_flap_get_flap_position;
alias adw_flap_get_fold_duration = c_adw_flap_get_fold_duration;
alias adw_flap_get_fold_policy = c_adw_flap_get_fold_policy;
alias adw_flap_get_fold_threshold_policy = c_adw_flap_get_fold_threshold_policy;
alias adw_flap_get_folded = c_adw_flap_get_folded;
alias adw_flap_get_locked = c_adw_flap_get_locked;
alias adw_flap_get_modal = c_adw_flap_get_modal;
alias adw_flap_get_reveal_flap = c_adw_flap_get_reveal_flap;
alias adw_flap_get_reveal_params = c_adw_flap_get_reveal_params;
alias adw_flap_get_reveal_progress = c_adw_flap_get_reveal_progress;
alias adw_flap_get_separator = c_adw_flap_get_separator;
alias adw_flap_get_swipe_to_close = c_adw_flap_get_swipe_to_close;
alias adw_flap_get_swipe_to_open = c_adw_flap_get_swipe_to_open;
alias adw_flap_get_transition_type = c_adw_flap_get_transition_type;
alias adw_flap_set_content = c_adw_flap_set_content;
alias adw_flap_set_flap = c_adw_flap_set_flap;
alias adw_flap_set_flap_position = c_adw_flap_set_flap_position;
alias adw_flap_set_fold_duration = c_adw_flap_set_fold_duration;
alias adw_flap_set_fold_policy = c_adw_flap_set_fold_policy;
alias adw_flap_set_fold_threshold_policy = c_adw_flap_set_fold_threshold_policy;
alias adw_flap_set_locked = c_adw_flap_set_locked;
alias adw_flap_set_modal = c_adw_flap_set_modal;
alias adw_flap_set_reveal_flap = c_adw_flap_set_reveal_flap;
alias adw_flap_set_reveal_params = c_adw_flap_set_reveal_params;
alias adw_flap_set_separator = c_adw_flap_set_separator;
alias adw_flap_set_swipe_to_close = c_adw_flap_set_swipe_to_close;
alias adw_flap_set_swipe_to_open = c_adw_flap_set_swipe_to_open;
alias adw_flap_set_transition_type = c_adw_flap_set_transition_type;

// HeaderBar
alias adw_header_bar_get_type = c_adw_header_bar_get_type;
alias adw_header_bar_new = c_adw_header_bar_new;
alias adw_header_bar_get_centering_policy = c_adw_header_bar_get_centering_policy;
alias adw_header_bar_get_decoration_layout = c_adw_header_bar_get_decoration_layout;
alias adw_header_bar_get_show_back_button = c_adw_header_bar_get_show_back_button;
alias adw_header_bar_get_show_end_title_buttons = c_adw_header_bar_get_show_end_title_buttons;
alias adw_header_bar_get_show_start_title_buttons = c_adw_header_bar_get_show_start_title_buttons;
alias adw_header_bar_get_show_title = c_adw_header_bar_get_show_title;
alias adw_header_bar_get_title_widget = c_adw_header_bar_get_title_widget;
alias adw_header_bar_pack_end = c_adw_header_bar_pack_end;
alias adw_header_bar_pack_start = c_adw_header_bar_pack_start;
alias adw_header_bar_remove = c_adw_header_bar_remove;
alias adw_header_bar_set_centering_policy = c_adw_header_bar_set_centering_policy;
alias adw_header_bar_set_decoration_layout = c_adw_header_bar_set_decoration_layout;
alias adw_header_bar_set_show_back_button = c_adw_header_bar_set_show_back_button;
alias adw_header_bar_set_show_end_title_buttons = c_adw_header_bar_set_show_end_title_buttons;
alias adw_header_bar_set_show_start_title_buttons = c_adw_header_bar_set_show_start_title_buttons;
alias adw_header_bar_set_show_title = c_adw_header_bar_set_show_title;
alias adw_header_bar_set_title_widget = c_adw_header_bar_set_title_widget;

// Leaflet
alias adw_leaflet_get_type = c_adw_leaflet_get_type;
alias adw_leaflet_new = c_adw_leaflet_new;
alias adw_leaflet_append = c_adw_leaflet_append;
alias adw_leaflet_get_adjacent_child = c_adw_leaflet_get_adjacent_child;
alias adw_leaflet_get_can_navigate_back = c_adw_leaflet_get_can_navigate_back;
alias adw_leaflet_get_can_navigate_forward = c_adw_leaflet_get_can_navigate_forward;
alias adw_leaflet_get_can_unfold = c_adw_leaflet_get_can_unfold;
alias adw_leaflet_get_child_by_name = c_adw_leaflet_get_child_by_name;
alias adw_leaflet_get_child_transition_params = c_adw_leaflet_get_child_transition_params;
alias adw_leaflet_get_child_transition_running = c_adw_leaflet_get_child_transition_running;
alias adw_leaflet_get_fold_threshold_policy = c_adw_leaflet_get_fold_threshold_policy;
alias adw_leaflet_get_folded = c_adw_leaflet_get_folded;
alias adw_leaflet_get_homogeneous = c_adw_leaflet_get_homogeneous;
alias adw_leaflet_get_mode_transition_duration = c_adw_leaflet_get_mode_transition_duration;
alias adw_leaflet_get_page = c_adw_leaflet_get_page;
alias adw_leaflet_get_pages = c_adw_leaflet_get_pages;
alias adw_leaflet_get_transition_type = c_adw_leaflet_get_transition_type;
alias adw_leaflet_get_visible_child = c_adw_leaflet_get_visible_child;
alias adw_leaflet_get_visible_child_name = c_adw_leaflet_get_visible_child_name;
alias adw_leaflet_insert_child_after = c_adw_leaflet_insert_child_after;
alias adw_leaflet_navigate = c_adw_leaflet_navigate;
alias adw_leaflet_prepend = c_adw_leaflet_prepend;
alias adw_leaflet_remove = c_adw_leaflet_remove;
alias adw_leaflet_reorder_child_after = c_adw_leaflet_reorder_child_after;
alias adw_leaflet_set_can_navigate_back = c_adw_leaflet_set_can_navigate_back;
alias adw_leaflet_set_can_navigate_forward = c_adw_leaflet_set_can_navigate_forward;
alias adw_leaflet_set_can_unfold = c_adw_leaflet_set_can_unfold;
alias adw_leaflet_set_child_transition_params = c_adw_leaflet_set_child_transition_params;
alias adw_leaflet_set_fold_threshold_policy = c_adw_leaflet_set_fold_threshold_policy;
alias adw_leaflet_set_homogeneous = c_adw_leaflet_set_homogeneous;
alias adw_leaflet_set_mode_transition_duration = c_adw_leaflet_set_mode_transition_duration;
alias adw_leaflet_set_transition_type = c_adw_leaflet_set_transition_type;
alias adw_leaflet_set_visible_child = c_adw_leaflet_set_visible_child;
alias adw_leaflet_set_visible_child_name = c_adw_leaflet_set_visible_child_name;

// LeafletPage
alias adw_leaflet_page_get_type = c_adw_leaflet_page_get_type;
alias adw_leaflet_page_get_child = c_adw_leaflet_page_get_child;
alias adw_leaflet_page_get_name = c_adw_leaflet_page_get_name;
alias adw_leaflet_page_get_navigatable = c_adw_leaflet_page_get_navigatable;
alias adw_leaflet_page_set_name = c_adw_leaflet_page_set_name;
alias adw_leaflet_page_set_navigatable = c_adw_leaflet_page_set_navigatable;

// MessageDialog
alias adw_message_dialog_get_type = c_adw_message_dialog_get_type;
alias adw_message_dialog_new = c_adw_message_dialog_new;
alias adw_message_dialog_add_response = c_adw_message_dialog_add_response;
alias adw_message_dialog_add_responses = c_adw_message_dialog_add_responses;
alias adw_message_dialog_choose = c_adw_message_dialog_choose;
alias adw_message_dialog_choose_finish = c_adw_message_dialog_choose_finish;
alias adw_message_dialog_format_body = c_adw_message_dialog_format_body;
alias adw_message_dialog_format_body_markup = c_adw_message_dialog_format_body_markup;
alias adw_message_dialog_format_heading = c_adw_message_dialog_format_heading;
alias adw_message_dialog_format_heading_markup = c_adw_message_dialog_format_heading_markup;
alias adw_message_dialog_get_body = c_adw_message_dialog_get_body;
alias adw_message_dialog_get_body_use_markup = c_adw_message_dialog_get_body_use_markup;
alias adw_message_dialog_get_close_response = c_adw_message_dialog_get_close_response;
alias adw_message_dialog_get_default_response = c_adw_message_dialog_get_default_response;
alias adw_message_dialog_get_extra_child = c_adw_message_dialog_get_extra_child;
alias adw_message_dialog_get_heading = c_adw_message_dialog_get_heading;
alias adw_message_dialog_get_heading_use_markup = c_adw_message_dialog_get_heading_use_markup;
alias adw_message_dialog_get_response_appearance = c_adw_message_dialog_get_response_appearance;
alias adw_message_dialog_get_response_enabled = c_adw_message_dialog_get_response_enabled;
alias adw_message_dialog_get_response_label = c_adw_message_dialog_get_response_label;
alias adw_message_dialog_has_response = c_adw_message_dialog_has_response;
alias adw_message_dialog_remove_response = c_adw_message_dialog_remove_response;
alias adw_message_dialog_response = c_adw_message_dialog_response;
alias adw_message_dialog_set_body = c_adw_message_dialog_set_body;
alias adw_message_dialog_set_body_use_markup = c_adw_message_dialog_set_body_use_markup;
alias adw_message_dialog_set_close_response = c_adw_message_dialog_set_close_response;
alias adw_message_dialog_set_default_response = c_adw_message_dialog_set_default_response;
alias adw_message_dialog_set_extra_child = c_adw_message_dialog_set_extra_child;
alias adw_message_dialog_set_heading = c_adw_message_dialog_set_heading;
alias adw_message_dialog_set_heading_use_markup = c_adw_message_dialog_set_heading_use_markup;
alias adw_message_dialog_set_response_appearance = c_adw_message_dialog_set_response_appearance;
alias adw_message_dialog_set_response_enabled = c_adw_message_dialog_set_response_enabled;
alias adw_message_dialog_set_response_label = c_adw_message_dialog_set_response_label;

// NavigationPage
alias adw_navigation_page_get_type = c_adw_navigation_page_get_type;
alias adw_navigation_page_new = c_adw_navigation_page_new;
alias adw_navigation_page_new_with_tag = c_adw_navigation_page_new_with_tag;
alias adw_navigation_page_get_can_pop = c_adw_navigation_page_get_can_pop;
alias adw_navigation_page_get_child = c_adw_navigation_page_get_child;
alias adw_navigation_page_get_tag = c_adw_navigation_page_get_tag;
alias adw_navigation_page_get_title = c_adw_navigation_page_get_title;
alias adw_navigation_page_set_can_pop = c_adw_navigation_page_set_can_pop;
alias adw_navigation_page_set_child = c_adw_navigation_page_set_child;
alias adw_navigation_page_set_tag = c_adw_navigation_page_set_tag;
alias adw_navigation_page_set_title = c_adw_navigation_page_set_title;

// NavigationSplitView
alias adw_navigation_split_view_get_type = c_adw_navigation_split_view_get_type;
alias adw_navigation_split_view_new = c_adw_navigation_split_view_new;
alias adw_navigation_split_view_get_collapsed = c_adw_navigation_split_view_get_collapsed;
alias adw_navigation_split_view_get_content = c_adw_navigation_split_view_get_content;
alias adw_navigation_split_view_get_max_sidebar_width = c_adw_navigation_split_view_get_max_sidebar_width;
alias adw_navigation_split_view_get_min_sidebar_width = c_adw_navigation_split_view_get_min_sidebar_width;
alias adw_navigation_split_view_get_show_content = c_adw_navigation_split_view_get_show_content;
alias adw_navigation_split_view_get_sidebar = c_adw_navigation_split_view_get_sidebar;
alias adw_navigation_split_view_get_sidebar_width_fraction = c_adw_navigation_split_view_get_sidebar_width_fraction;
alias adw_navigation_split_view_get_sidebar_width_unit = c_adw_navigation_split_view_get_sidebar_width_unit;
alias adw_navigation_split_view_set_collapsed = c_adw_navigation_split_view_set_collapsed;
alias adw_navigation_split_view_set_content = c_adw_navigation_split_view_set_content;
alias adw_navigation_split_view_set_max_sidebar_width = c_adw_navigation_split_view_set_max_sidebar_width;
alias adw_navigation_split_view_set_min_sidebar_width = c_adw_navigation_split_view_set_min_sidebar_width;
alias adw_navigation_split_view_set_show_content = c_adw_navigation_split_view_set_show_content;
alias adw_navigation_split_view_set_sidebar = c_adw_navigation_split_view_set_sidebar;
alias adw_navigation_split_view_set_sidebar_width_fraction = c_adw_navigation_split_view_set_sidebar_width_fraction;
alias adw_navigation_split_view_set_sidebar_width_unit = c_adw_navigation_split_view_set_sidebar_width_unit;

// NavigationView
alias adw_navigation_view_get_type = c_adw_navigation_view_get_type;
alias adw_navigation_view_new = c_adw_navigation_view_new;
alias adw_navigation_view_add = c_adw_navigation_view_add;
alias adw_navigation_view_find_page = c_adw_navigation_view_find_page;
alias adw_navigation_view_get_animate_transitions = c_adw_navigation_view_get_animate_transitions;
alias adw_navigation_view_get_navigation_stack = c_adw_navigation_view_get_navigation_stack;
alias adw_navigation_view_get_pop_on_escape = c_adw_navigation_view_get_pop_on_escape;
alias adw_navigation_view_get_previous_page = c_adw_navigation_view_get_previous_page;
alias adw_navigation_view_get_visible_page = c_adw_navigation_view_get_visible_page;
alias adw_navigation_view_pop = c_adw_navigation_view_pop;
alias adw_navigation_view_pop_to_page = c_adw_navigation_view_pop_to_page;
alias adw_navigation_view_pop_to_tag = c_adw_navigation_view_pop_to_tag;
alias adw_navigation_view_push = c_adw_navigation_view_push;
alias adw_navigation_view_push_by_tag = c_adw_navigation_view_push_by_tag;
alias adw_navigation_view_remove = c_adw_navigation_view_remove;
alias adw_navigation_view_replace = c_adw_navigation_view_replace;
alias adw_navigation_view_replace_with_tags = c_adw_navigation_view_replace_with_tags;
alias adw_navigation_view_set_animate_transitions = c_adw_navigation_view_set_animate_transitions;
alias adw_navigation_view_set_pop_on_escape = c_adw_navigation_view_set_pop_on_escape;

// OverlaySplitView
alias adw_overlay_split_view_get_type = c_adw_overlay_split_view_get_type;
alias adw_overlay_split_view_new = c_adw_overlay_split_view_new;
alias adw_overlay_split_view_get_collapsed = c_adw_overlay_split_view_get_collapsed;
alias adw_overlay_split_view_get_content = c_adw_overlay_split_view_get_content;
alias adw_overlay_split_view_get_enable_hide_gesture = c_adw_overlay_split_view_get_enable_hide_gesture;
alias adw_overlay_split_view_get_enable_show_gesture = c_adw_overlay_split_view_get_enable_show_gesture;
alias adw_overlay_split_view_get_max_sidebar_width = c_adw_overlay_split_view_get_max_sidebar_width;
alias adw_overlay_split_view_get_min_sidebar_width = c_adw_overlay_split_view_get_min_sidebar_width;
alias adw_overlay_split_view_get_pin_sidebar = c_adw_overlay_split_view_get_pin_sidebar;
alias adw_overlay_split_view_get_show_sidebar = c_adw_overlay_split_view_get_show_sidebar;
alias adw_overlay_split_view_get_sidebar = c_adw_overlay_split_view_get_sidebar;
alias adw_overlay_split_view_get_sidebar_position = c_adw_overlay_split_view_get_sidebar_position;
alias adw_overlay_split_view_get_sidebar_width_fraction = c_adw_overlay_split_view_get_sidebar_width_fraction;
alias adw_overlay_split_view_get_sidebar_width_unit = c_adw_overlay_split_view_get_sidebar_width_unit;
alias adw_overlay_split_view_set_collapsed = c_adw_overlay_split_view_set_collapsed;
alias adw_overlay_split_view_set_content = c_adw_overlay_split_view_set_content;
alias adw_overlay_split_view_set_enable_hide_gesture = c_adw_overlay_split_view_set_enable_hide_gesture;
alias adw_overlay_split_view_set_enable_show_gesture = c_adw_overlay_split_view_set_enable_show_gesture;
alias adw_overlay_split_view_set_max_sidebar_width = c_adw_overlay_split_view_set_max_sidebar_width;
alias adw_overlay_split_view_set_min_sidebar_width = c_adw_overlay_split_view_set_min_sidebar_width;
alias adw_overlay_split_view_set_pin_sidebar = c_adw_overlay_split_view_set_pin_sidebar;
alias adw_overlay_split_view_set_show_sidebar = c_adw_overlay_split_view_set_show_sidebar;
alias adw_overlay_split_view_set_sidebar = c_adw_overlay_split_view_set_sidebar;
alias adw_overlay_split_view_set_sidebar_position = c_adw_overlay_split_view_set_sidebar_position;
alias adw_overlay_split_view_set_sidebar_width_fraction = c_adw_overlay_split_view_set_sidebar_width_fraction;
alias adw_overlay_split_view_set_sidebar_width_unit = c_adw_overlay_split_view_set_sidebar_width_unit;

// PasswordEntryRow
alias adw_password_entry_row_get_type = c_adw_password_entry_row_get_type;
alias adw_password_entry_row_new = c_adw_password_entry_row_new;

// PreferencesDialog
alias adw_preferences_dialog_get_type = c_adw_preferences_dialog_get_type;
alias adw_preferences_dialog_new = c_adw_preferences_dialog_new;
alias adw_preferences_dialog_add = c_adw_preferences_dialog_add;
alias adw_preferences_dialog_add_toast = c_adw_preferences_dialog_add_toast;
alias adw_preferences_dialog_get_search_enabled = c_adw_preferences_dialog_get_search_enabled;
alias adw_preferences_dialog_get_visible_page = c_adw_preferences_dialog_get_visible_page;
alias adw_preferences_dialog_get_visible_page_name = c_adw_preferences_dialog_get_visible_page_name;
alias adw_preferences_dialog_pop_subpage = c_adw_preferences_dialog_pop_subpage;
alias adw_preferences_dialog_push_subpage = c_adw_preferences_dialog_push_subpage;
alias adw_preferences_dialog_remove = c_adw_preferences_dialog_remove;
alias adw_preferences_dialog_set_search_enabled = c_adw_preferences_dialog_set_search_enabled;
alias adw_preferences_dialog_set_visible_page = c_adw_preferences_dialog_set_visible_page;
alias adw_preferences_dialog_set_visible_page_name = c_adw_preferences_dialog_set_visible_page_name;

// PreferencesGroup
alias adw_preferences_group_get_type = c_adw_preferences_group_get_type;
alias adw_preferences_group_new = c_adw_preferences_group_new;
alias adw_preferences_group_add = c_adw_preferences_group_add;
alias adw_preferences_group_get_description = c_adw_preferences_group_get_description;
alias adw_preferences_group_get_header_suffix = c_adw_preferences_group_get_header_suffix;
alias adw_preferences_group_get_title = c_adw_preferences_group_get_title;
alias adw_preferences_group_remove = c_adw_preferences_group_remove;
alias adw_preferences_group_set_description = c_adw_preferences_group_set_description;
alias adw_preferences_group_set_header_suffix = c_adw_preferences_group_set_header_suffix;
alias adw_preferences_group_set_title = c_adw_preferences_group_set_title;

// PreferencesPage
alias adw_preferences_page_get_type = c_adw_preferences_page_get_type;
alias adw_preferences_page_new = c_adw_preferences_page_new;
alias adw_preferences_page_add = c_adw_preferences_page_add;
alias adw_preferences_page_get_description = c_adw_preferences_page_get_description;
alias adw_preferences_page_get_icon_name = c_adw_preferences_page_get_icon_name;
alias adw_preferences_page_get_name = c_adw_preferences_page_get_name;
alias adw_preferences_page_get_title = c_adw_preferences_page_get_title;
alias adw_preferences_page_get_use_underline = c_adw_preferences_page_get_use_underline;
alias adw_preferences_page_remove = c_adw_preferences_page_remove;
alias adw_preferences_page_scroll_to_top = c_adw_preferences_page_scroll_to_top;
alias adw_preferences_page_set_description = c_adw_preferences_page_set_description;
alias adw_preferences_page_set_icon_name = c_adw_preferences_page_set_icon_name;
alias adw_preferences_page_set_name = c_adw_preferences_page_set_name;
alias adw_preferences_page_set_title = c_adw_preferences_page_set_title;
alias adw_preferences_page_set_use_underline = c_adw_preferences_page_set_use_underline;

// PreferencesRow
alias adw_preferences_row_get_type = c_adw_preferences_row_get_type;
alias adw_preferences_row_new = c_adw_preferences_row_new;
alias adw_preferences_row_get_title = c_adw_preferences_row_get_title;
alias adw_preferences_row_get_title_selectable = c_adw_preferences_row_get_title_selectable;
alias adw_preferences_row_get_use_markup = c_adw_preferences_row_get_use_markup;
alias adw_preferences_row_get_use_underline = c_adw_preferences_row_get_use_underline;
alias adw_preferences_row_set_title = c_adw_preferences_row_set_title;
alias adw_preferences_row_set_title_selectable = c_adw_preferences_row_set_title_selectable;
alias adw_preferences_row_set_use_markup = c_adw_preferences_row_set_use_markup;
alias adw_preferences_row_set_use_underline = c_adw_preferences_row_set_use_underline;

// PreferencesWindow
alias adw_preferences_window_get_type = c_adw_preferences_window_get_type;
alias adw_preferences_window_new = c_adw_preferences_window_new;
alias adw_preferences_window_add = c_adw_preferences_window_add;
alias adw_preferences_window_add_toast = c_adw_preferences_window_add_toast;
alias adw_preferences_window_close_subpage = c_adw_preferences_window_close_subpage;
alias adw_preferences_window_get_can_navigate_back = c_adw_preferences_window_get_can_navigate_back;
alias adw_preferences_window_get_search_enabled = c_adw_preferences_window_get_search_enabled;
alias adw_preferences_window_get_visible_page = c_adw_preferences_window_get_visible_page;
alias adw_preferences_window_get_visible_page_name = c_adw_preferences_window_get_visible_page_name;
alias adw_preferences_window_pop_subpage = c_adw_preferences_window_pop_subpage;
alias adw_preferences_window_present_subpage = c_adw_preferences_window_present_subpage;
alias adw_preferences_window_push_subpage = c_adw_preferences_window_push_subpage;
alias adw_preferences_window_remove = c_adw_preferences_window_remove;
alias adw_preferences_window_set_can_navigate_back = c_adw_preferences_window_set_can_navigate_back;
alias adw_preferences_window_set_search_enabled = c_adw_preferences_window_set_search_enabled;
alias adw_preferences_window_set_visible_page = c_adw_preferences_window_set_visible_page;
alias adw_preferences_window_set_visible_page_name = c_adw_preferences_window_set_visible_page_name;

// PropertyAnimationTarget
alias adw_property_animation_target_get_type = c_adw_property_animation_target_get_type;
alias adw_property_animation_target_new = c_adw_property_animation_target_new;
alias adw_property_animation_target_new_for_pspec = c_adw_property_animation_target_new_for_pspec;
alias adw_property_animation_target_get_object = c_adw_property_animation_target_get_object;
alias adw_property_animation_target_get_pspec = c_adw_property_animation_target_get_pspec;

// SpinRow
alias adw_spin_row_get_type = c_adw_spin_row_get_type;
alias adw_spin_row_new = c_adw_spin_row_new;
alias adw_spin_row_new_with_range = c_adw_spin_row_new_with_range;
alias adw_spin_row_configure = c_adw_spin_row_configure;
alias adw_spin_row_get_adjustment = c_adw_spin_row_get_adjustment;
alias adw_spin_row_get_climb_rate = c_adw_spin_row_get_climb_rate;
alias adw_spin_row_get_digits = c_adw_spin_row_get_digits;
alias adw_spin_row_get_numeric = c_adw_spin_row_get_numeric;
alias adw_spin_row_get_snap_to_ticks = c_adw_spin_row_get_snap_to_ticks;
alias adw_spin_row_get_update_policy = c_adw_spin_row_get_update_policy;
alias adw_spin_row_get_value = c_adw_spin_row_get_value;
alias adw_spin_row_get_wrap = c_adw_spin_row_get_wrap;
alias adw_spin_row_set_adjustment = c_adw_spin_row_set_adjustment;
alias adw_spin_row_set_climb_rate = c_adw_spin_row_set_climb_rate;
alias adw_spin_row_set_digits = c_adw_spin_row_set_digits;
alias adw_spin_row_set_numeric = c_adw_spin_row_set_numeric;
alias adw_spin_row_set_range = c_adw_spin_row_set_range;
alias adw_spin_row_set_snap_to_ticks = c_adw_spin_row_set_snap_to_ticks;
alias adw_spin_row_set_update_policy = c_adw_spin_row_set_update_policy;
alias adw_spin_row_set_value = c_adw_spin_row_set_value;
alias adw_spin_row_set_wrap = c_adw_spin_row_set_wrap;
alias adw_spin_row_update = c_adw_spin_row_update;

// SplitButton
alias adw_split_button_get_type = c_adw_split_button_get_type;
alias adw_split_button_new = c_adw_split_button_new;
alias adw_split_button_get_can_shrink = c_adw_split_button_get_can_shrink;
alias adw_split_button_get_child = c_adw_split_button_get_child;
alias adw_split_button_get_direction = c_adw_split_button_get_direction;
alias adw_split_button_get_dropdown_tooltip = c_adw_split_button_get_dropdown_tooltip;
alias adw_split_button_get_icon_name = c_adw_split_button_get_icon_name;
alias adw_split_button_get_label = c_adw_split_button_get_label;
alias adw_split_button_get_menu_model = c_adw_split_button_get_menu_model;
alias adw_split_button_get_popover = c_adw_split_button_get_popover;
alias adw_split_button_get_use_underline = c_adw_split_button_get_use_underline;
alias adw_split_button_popdown = c_adw_split_button_popdown;
alias adw_split_button_popup = c_adw_split_button_popup;
alias adw_split_button_set_can_shrink = c_adw_split_button_set_can_shrink;
alias adw_split_button_set_child = c_adw_split_button_set_child;
alias adw_split_button_set_direction = c_adw_split_button_set_direction;
alias adw_split_button_set_dropdown_tooltip = c_adw_split_button_set_dropdown_tooltip;
alias adw_split_button_set_icon_name = c_adw_split_button_set_icon_name;
alias adw_split_button_set_label = c_adw_split_button_set_label;
alias adw_split_button_set_menu_model = c_adw_split_button_set_menu_model;
alias adw_split_button_set_popover = c_adw_split_button_set_popover;
alias adw_split_button_set_use_underline = c_adw_split_button_set_use_underline;

// SpringAnimation
alias adw_spring_animation_get_type = c_adw_spring_animation_get_type;
alias adw_spring_animation_new = c_adw_spring_animation_new;
alias adw_spring_animation_calculate_value = c_adw_spring_animation_calculate_value;
alias adw_spring_animation_calculate_velocity = c_adw_spring_animation_calculate_velocity;
alias adw_spring_animation_get_clamp = c_adw_spring_animation_get_clamp;
alias adw_spring_animation_get_epsilon = c_adw_spring_animation_get_epsilon;
alias adw_spring_animation_get_estimated_duration = c_adw_spring_animation_get_estimated_duration;
alias adw_spring_animation_get_initial_velocity = c_adw_spring_animation_get_initial_velocity;
alias adw_spring_animation_get_spring_params = c_adw_spring_animation_get_spring_params;
alias adw_spring_animation_get_value_from = c_adw_spring_animation_get_value_from;
alias adw_spring_animation_get_value_to = c_adw_spring_animation_get_value_to;
alias adw_spring_animation_get_velocity = c_adw_spring_animation_get_velocity;
alias adw_spring_animation_set_clamp = c_adw_spring_animation_set_clamp;
alias adw_spring_animation_set_epsilon = c_adw_spring_animation_set_epsilon;
alias adw_spring_animation_set_initial_velocity = c_adw_spring_animation_set_initial_velocity;
alias adw_spring_animation_set_spring_params = c_adw_spring_animation_set_spring_params;
alias adw_spring_animation_set_value_from = c_adw_spring_animation_set_value_from;
alias adw_spring_animation_set_value_to = c_adw_spring_animation_set_value_to;

// SpringParams
alias adw_spring_params_get_type = c_adw_spring_params_get_type;
alias adw_spring_params_new = c_adw_spring_params_new;
alias adw_spring_params_new_full = c_adw_spring_params_new_full;
alias adw_spring_params_get_damping = c_adw_spring_params_get_damping;
alias adw_spring_params_get_damping_ratio = c_adw_spring_params_get_damping_ratio;
alias adw_spring_params_get_mass = c_adw_spring_params_get_mass;
alias adw_spring_params_get_stiffness = c_adw_spring_params_get_stiffness;
alias adw_spring_params_ref = c_adw_spring_params_ref;
alias adw_spring_params_unref = c_adw_spring_params_unref;

// Squeezer
alias adw_squeezer_get_type = c_adw_squeezer_get_type;
alias adw_squeezer_new = c_adw_squeezer_new;
alias adw_squeezer_add = c_adw_squeezer_add;
alias adw_squeezer_get_allow_none = c_adw_squeezer_get_allow_none;
alias adw_squeezer_get_homogeneous = c_adw_squeezer_get_homogeneous;
alias adw_squeezer_get_interpolate_size = c_adw_squeezer_get_interpolate_size;
alias adw_squeezer_get_page = c_adw_squeezer_get_page;
alias adw_squeezer_get_pages = c_adw_squeezer_get_pages;
alias adw_squeezer_get_switch_threshold_policy = c_adw_squeezer_get_switch_threshold_policy;
alias adw_squeezer_get_transition_duration = c_adw_squeezer_get_transition_duration;
alias adw_squeezer_get_transition_running = c_adw_squeezer_get_transition_running;
alias adw_squeezer_get_transition_type = c_adw_squeezer_get_transition_type;
alias adw_squeezer_get_visible_child = c_adw_squeezer_get_visible_child;
alias adw_squeezer_get_xalign = c_adw_squeezer_get_xalign;
alias adw_squeezer_get_yalign = c_adw_squeezer_get_yalign;
alias adw_squeezer_remove = c_adw_squeezer_remove;
alias adw_squeezer_set_allow_none = c_adw_squeezer_set_allow_none;
alias adw_squeezer_set_homogeneous = c_adw_squeezer_set_homogeneous;
alias adw_squeezer_set_interpolate_size = c_adw_squeezer_set_interpolate_size;
alias adw_squeezer_set_switch_threshold_policy = c_adw_squeezer_set_switch_threshold_policy;
alias adw_squeezer_set_transition_duration = c_adw_squeezer_set_transition_duration;
alias adw_squeezer_set_transition_type = c_adw_squeezer_set_transition_type;
alias adw_squeezer_set_xalign = c_adw_squeezer_set_xalign;
alias adw_squeezer_set_yalign = c_adw_squeezer_set_yalign;

// SqueezerPage
alias adw_squeezer_page_get_type = c_adw_squeezer_page_get_type;
alias adw_squeezer_page_get_child = c_adw_squeezer_page_get_child;
alias adw_squeezer_page_get_enabled = c_adw_squeezer_page_get_enabled;
alias adw_squeezer_page_set_enabled = c_adw_squeezer_page_set_enabled;

// StatusPage
alias adw_status_page_get_type = c_adw_status_page_get_type;
alias adw_status_page_new = c_adw_status_page_new;
alias adw_status_page_get_child = c_adw_status_page_get_child;
alias adw_status_page_get_description = c_adw_status_page_get_description;
alias adw_status_page_get_icon_name = c_adw_status_page_get_icon_name;
alias adw_status_page_get_paintable = c_adw_status_page_get_paintable;
alias adw_status_page_get_title = c_adw_status_page_get_title;
alias adw_status_page_set_child = c_adw_status_page_set_child;
alias adw_status_page_set_description = c_adw_status_page_set_description;
alias adw_status_page_set_icon_name = c_adw_status_page_set_icon_name;
alias adw_status_page_set_paintable = c_adw_status_page_set_paintable;
alias adw_status_page_set_title = c_adw_status_page_set_title;

// StyleManager
alias adw_style_manager_get_type = c_adw_style_manager_get_type;
alias adw_style_manager_get_default = c_adw_style_manager_get_default;
alias adw_style_manager_get_for_display = c_adw_style_manager_get_for_display;
alias adw_style_manager_get_color_scheme = c_adw_style_manager_get_color_scheme;
alias adw_style_manager_get_dark = c_adw_style_manager_get_dark;
alias adw_style_manager_get_display = c_adw_style_manager_get_display;
alias adw_style_manager_get_high_contrast = c_adw_style_manager_get_high_contrast;
alias adw_style_manager_get_system_supports_color_schemes = c_adw_style_manager_get_system_supports_color_schemes;
alias adw_style_manager_set_color_scheme = c_adw_style_manager_set_color_scheme;

// SwipeTracker
alias adw_swipe_tracker_get_type = c_adw_swipe_tracker_get_type;
alias adw_swipe_tracker_new = c_adw_swipe_tracker_new;
alias adw_swipe_tracker_get_allow_long_swipes = c_adw_swipe_tracker_get_allow_long_swipes;
alias adw_swipe_tracker_get_allow_mouse_drag = c_adw_swipe_tracker_get_allow_mouse_drag;
alias adw_swipe_tracker_get_allow_window_handle = c_adw_swipe_tracker_get_allow_window_handle;
alias adw_swipe_tracker_get_enabled = c_adw_swipe_tracker_get_enabled;
alias adw_swipe_tracker_get_lower_overshoot = c_adw_swipe_tracker_get_lower_overshoot;
alias adw_swipe_tracker_get_reversed = c_adw_swipe_tracker_get_reversed;
alias adw_swipe_tracker_get_swipeable = c_adw_swipe_tracker_get_swipeable;
alias adw_swipe_tracker_get_upper_overshoot = c_adw_swipe_tracker_get_upper_overshoot;
alias adw_swipe_tracker_set_allow_long_swipes = c_adw_swipe_tracker_set_allow_long_swipes;
alias adw_swipe_tracker_set_allow_mouse_drag = c_adw_swipe_tracker_set_allow_mouse_drag;
alias adw_swipe_tracker_set_allow_window_handle = c_adw_swipe_tracker_set_allow_window_handle;
alias adw_swipe_tracker_set_enabled = c_adw_swipe_tracker_set_enabled;
alias adw_swipe_tracker_set_lower_overshoot = c_adw_swipe_tracker_set_lower_overshoot;
alias adw_swipe_tracker_set_reversed = c_adw_swipe_tracker_set_reversed;
alias adw_swipe_tracker_set_upper_overshoot = c_adw_swipe_tracker_set_upper_overshoot;
alias adw_swipe_tracker_shift_position = c_adw_swipe_tracker_shift_position;

// Swipeable
alias adw_swipeable_get_type = c_adw_swipeable_get_type;
alias adw_swipeable_get_cancel_progress = c_adw_swipeable_get_cancel_progress;
alias adw_swipeable_get_distance = c_adw_swipeable_get_distance;
alias adw_swipeable_get_progress = c_adw_swipeable_get_progress;
alias adw_swipeable_get_snap_points = c_adw_swipeable_get_snap_points;
alias adw_swipeable_get_swipe_area = c_adw_swipeable_get_swipe_area;

// SwitchRow
alias adw_switch_row_get_type = c_adw_switch_row_get_type;
alias adw_switch_row_new = c_adw_switch_row_new;
alias adw_switch_row_get_active = c_adw_switch_row_get_active;
alias adw_switch_row_set_active = c_adw_switch_row_set_active;

// TabBar
alias adw_tab_bar_get_type = c_adw_tab_bar_get_type;
alias adw_tab_bar_new = c_adw_tab_bar_new;
alias adw_tab_bar_get_autohide = c_adw_tab_bar_get_autohide;
alias adw_tab_bar_get_end_action_widget = c_adw_tab_bar_get_end_action_widget;
alias adw_tab_bar_get_expand_tabs = c_adw_tab_bar_get_expand_tabs;
alias adw_tab_bar_get_extra_drag_preferred_action = c_adw_tab_bar_get_extra_drag_preferred_action;
alias adw_tab_bar_get_extra_drag_preload = c_adw_tab_bar_get_extra_drag_preload;
alias adw_tab_bar_get_inverted = c_adw_tab_bar_get_inverted;
alias adw_tab_bar_get_is_overflowing = c_adw_tab_bar_get_is_overflowing;
alias adw_tab_bar_get_start_action_widget = c_adw_tab_bar_get_start_action_widget;
alias adw_tab_bar_get_tabs_revealed = c_adw_tab_bar_get_tabs_revealed;
alias adw_tab_bar_get_view = c_adw_tab_bar_get_view;
alias adw_tab_bar_set_autohide = c_adw_tab_bar_set_autohide;
alias adw_tab_bar_set_end_action_widget = c_adw_tab_bar_set_end_action_widget;
alias adw_tab_bar_set_expand_tabs = c_adw_tab_bar_set_expand_tabs;
alias adw_tab_bar_set_extra_drag_preload = c_adw_tab_bar_set_extra_drag_preload;
alias adw_tab_bar_set_inverted = c_adw_tab_bar_set_inverted;
alias adw_tab_bar_set_start_action_widget = c_adw_tab_bar_set_start_action_widget;
alias adw_tab_bar_set_view = c_adw_tab_bar_set_view;
alias adw_tab_bar_setup_extra_drop_target = c_adw_tab_bar_setup_extra_drop_target;

// TabButton
alias adw_tab_button_get_type = c_adw_tab_button_get_type;
alias adw_tab_button_new = c_adw_tab_button_new;
alias adw_tab_button_get_view = c_adw_tab_button_get_view;
alias adw_tab_button_set_view = c_adw_tab_button_set_view;

// TabOverview
alias adw_tab_overview_get_type = c_adw_tab_overview_get_type;
alias adw_tab_overview_new = c_adw_tab_overview_new;
alias adw_tab_overview_get_child = c_adw_tab_overview_get_child;
alias adw_tab_overview_get_enable_new_tab = c_adw_tab_overview_get_enable_new_tab;
alias adw_tab_overview_get_enable_search = c_adw_tab_overview_get_enable_search;
alias adw_tab_overview_get_extra_drag_preferred_action = c_adw_tab_overview_get_extra_drag_preferred_action;
alias adw_tab_overview_get_extra_drag_preload = c_adw_tab_overview_get_extra_drag_preload;
alias adw_tab_overview_get_inverted = c_adw_tab_overview_get_inverted;
alias adw_tab_overview_get_open = c_adw_tab_overview_get_open;
alias adw_tab_overview_get_search_active = c_adw_tab_overview_get_search_active;
alias adw_tab_overview_get_secondary_menu = c_adw_tab_overview_get_secondary_menu;
alias adw_tab_overview_get_show_end_title_buttons = c_adw_tab_overview_get_show_end_title_buttons;
alias adw_tab_overview_get_show_start_title_buttons = c_adw_tab_overview_get_show_start_title_buttons;
alias adw_tab_overview_get_view = c_adw_tab_overview_get_view;
alias adw_tab_overview_set_child = c_adw_tab_overview_set_child;
alias adw_tab_overview_set_enable_new_tab = c_adw_tab_overview_set_enable_new_tab;
alias adw_tab_overview_set_enable_search = c_adw_tab_overview_set_enable_search;
alias adw_tab_overview_set_extra_drag_preload = c_adw_tab_overview_set_extra_drag_preload;
alias adw_tab_overview_set_inverted = c_adw_tab_overview_set_inverted;
alias adw_tab_overview_set_open = c_adw_tab_overview_set_open;
alias adw_tab_overview_set_secondary_menu = c_adw_tab_overview_set_secondary_menu;
alias adw_tab_overview_set_show_end_title_buttons = c_adw_tab_overview_set_show_end_title_buttons;
alias adw_tab_overview_set_show_start_title_buttons = c_adw_tab_overview_set_show_start_title_buttons;
alias adw_tab_overview_set_view = c_adw_tab_overview_set_view;
alias adw_tab_overview_setup_extra_drop_target = c_adw_tab_overview_setup_extra_drop_target;

// TabPage
alias adw_tab_page_get_type = c_adw_tab_page_get_type;
alias adw_tab_page_get_child = c_adw_tab_page_get_child;
alias adw_tab_page_get_icon = c_adw_tab_page_get_icon;
alias adw_tab_page_get_indicator_activatable = c_adw_tab_page_get_indicator_activatable;
alias adw_tab_page_get_indicator_icon = c_adw_tab_page_get_indicator_icon;
alias adw_tab_page_get_indicator_tooltip = c_adw_tab_page_get_indicator_tooltip;
alias adw_tab_page_get_keyword = c_adw_tab_page_get_keyword;
alias adw_tab_page_get_live_thumbnail = c_adw_tab_page_get_live_thumbnail;
alias adw_tab_page_get_loading = c_adw_tab_page_get_loading;
alias adw_tab_page_get_needs_attention = c_adw_tab_page_get_needs_attention;
alias adw_tab_page_get_parent = c_adw_tab_page_get_parent;
alias adw_tab_page_get_pinned = c_adw_tab_page_get_pinned;
alias adw_tab_page_get_selected = c_adw_tab_page_get_selected;
alias adw_tab_page_get_thumbnail_xalign = c_adw_tab_page_get_thumbnail_xalign;
alias adw_tab_page_get_thumbnail_yalign = c_adw_tab_page_get_thumbnail_yalign;
alias adw_tab_page_get_title = c_adw_tab_page_get_title;
alias adw_tab_page_get_tooltip = c_adw_tab_page_get_tooltip;
alias adw_tab_page_invalidate_thumbnail = c_adw_tab_page_invalidate_thumbnail;
alias adw_tab_page_set_icon = c_adw_tab_page_set_icon;
alias adw_tab_page_set_indicator_activatable = c_adw_tab_page_set_indicator_activatable;
alias adw_tab_page_set_indicator_icon = c_adw_tab_page_set_indicator_icon;
alias adw_tab_page_set_indicator_tooltip = c_adw_tab_page_set_indicator_tooltip;
alias adw_tab_page_set_keyword = c_adw_tab_page_set_keyword;
alias adw_tab_page_set_live_thumbnail = c_adw_tab_page_set_live_thumbnail;
alias adw_tab_page_set_loading = c_adw_tab_page_set_loading;
alias adw_tab_page_set_needs_attention = c_adw_tab_page_set_needs_attention;
alias adw_tab_page_set_thumbnail_xalign = c_adw_tab_page_set_thumbnail_xalign;
alias adw_tab_page_set_thumbnail_yalign = c_adw_tab_page_set_thumbnail_yalign;
alias adw_tab_page_set_title = c_adw_tab_page_set_title;
alias adw_tab_page_set_tooltip = c_adw_tab_page_set_tooltip;

// TabView
alias adw_tab_view_get_type = c_adw_tab_view_get_type;
alias adw_tab_view_new = c_adw_tab_view_new;
alias adw_tab_view_add_page = c_adw_tab_view_add_page;
alias adw_tab_view_add_shortcuts = c_adw_tab_view_add_shortcuts;
alias adw_tab_view_append = c_adw_tab_view_append;
alias adw_tab_view_append_pinned = c_adw_tab_view_append_pinned;
alias adw_tab_view_close_other_pages = c_adw_tab_view_close_other_pages;
alias adw_tab_view_close_page = c_adw_tab_view_close_page;
alias adw_tab_view_close_page_finish = c_adw_tab_view_close_page_finish;
alias adw_tab_view_close_pages_after = c_adw_tab_view_close_pages_after;
alias adw_tab_view_close_pages_before = c_adw_tab_view_close_pages_before;
alias adw_tab_view_get_default_icon = c_adw_tab_view_get_default_icon;
alias adw_tab_view_get_is_transferring_page = c_adw_tab_view_get_is_transferring_page;
alias adw_tab_view_get_menu_model = c_adw_tab_view_get_menu_model;
alias adw_tab_view_get_n_pages = c_adw_tab_view_get_n_pages;
alias adw_tab_view_get_n_pinned_pages = c_adw_tab_view_get_n_pinned_pages;
alias adw_tab_view_get_nth_page = c_adw_tab_view_get_nth_page;
alias adw_tab_view_get_page = c_adw_tab_view_get_page;
alias adw_tab_view_get_page_position = c_adw_tab_view_get_page_position;
alias adw_tab_view_get_pages = c_adw_tab_view_get_pages;
alias adw_tab_view_get_selected_page = c_adw_tab_view_get_selected_page;
alias adw_tab_view_get_shortcuts = c_adw_tab_view_get_shortcuts;
alias adw_tab_view_insert = c_adw_tab_view_insert;
alias adw_tab_view_insert_pinned = c_adw_tab_view_insert_pinned;
alias adw_tab_view_invalidate_thumbnails = c_adw_tab_view_invalidate_thumbnails;
alias adw_tab_view_prepend = c_adw_tab_view_prepend;
alias adw_tab_view_prepend_pinned = c_adw_tab_view_prepend_pinned;
alias adw_tab_view_remove_shortcuts = c_adw_tab_view_remove_shortcuts;
alias adw_tab_view_reorder_backward = c_adw_tab_view_reorder_backward;
alias adw_tab_view_reorder_first = c_adw_tab_view_reorder_first;
alias adw_tab_view_reorder_forward = c_adw_tab_view_reorder_forward;
alias adw_tab_view_reorder_last = c_adw_tab_view_reorder_last;
alias adw_tab_view_reorder_page = c_adw_tab_view_reorder_page;
alias adw_tab_view_select_next_page = c_adw_tab_view_select_next_page;
alias adw_tab_view_select_previous_page = c_adw_tab_view_select_previous_page;
alias adw_tab_view_set_default_icon = c_adw_tab_view_set_default_icon;
alias adw_tab_view_set_menu_model = c_adw_tab_view_set_menu_model;
alias adw_tab_view_set_page_pinned = c_adw_tab_view_set_page_pinned;
alias adw_tab_view_set_selected_page = c_adw_tab_view_set_selected_page;
alias adw_tab_view_set_shortcuts = c_adw_tab_view_set_shortcuts;
alias adw_tab_view_transfer_page = c_adw_tab_view_transfer_page;

// TimedAnimation
alias adw_timed_animation_get_type = c_adw_timed_animation_get_type;
alias adw_timed_animation_new = c_adw_timed_animation_new;
alias adw_timed_animation_get_alternate = c_adw_timed_animation_get_alternate;
alias adw_timed_animation_get_duration = c_adw_timed_animation_get_duration;
alias adw_timed_animation_get_easing = c_adw_timed_animation_get_easing;
alias adw_timed_animation_get_repeat_count = c_adw_timed_animation_get_repeat_count;
alias adw_timed_animation_get_reverse = c_adw_timed_animation_get_reverse;
alias adw_timed_animation_get_value_from = c_adw_timed_animation_get_value_from;
alias adw_timed_animation_get_value_to = c_adw_timed_animation_get_value_to;
alias adw_timed_animation_set_alternate = c_adw_timed_animation_set_alternate;
alias adw_timed_animation_set_duration = c_adw_timed_animation_set_duration;
alias adw_timed_animation_set_easing = c_adw_timed_animation_set_easing;
alias adw_timed_animation_set_repeat_count = c_adw_timed_animation_set_repeat_count;
alias adw_timed_animation_set_reverse = c_adw_timed_animation_set_reverse;
alias adw_timed_animation_set_value_from = c_adw_timed_animation_set_value_from;
alias adw_timed_animation_set_value_to = c_adw_timed_animation_set_value_to;

// Toast
alias adw_toast_get_type = c_adw_toast_get_type;
alias adw_toast_new = c_adw_toast_new;
alias adw_toast_new_format = c_adw_toast_new_format;
alias adw_toast_dismiss = c_adw_toast_dismiss;
alias adw_toast_get_action_name = c_adw_toast_get_action_name;
alias adw_toast_get_action_target_value = c_adw_toast_get_action_target_value;
alias adw_toast_get_button_label = c_adw_toast_get_button_label;
alias adw_toast_get_custom_title = c_adw_toast_get_custom_title;
alias adw_toast_get_priority = c_adw_toast_get_priority;
alias adw_toast_get_timeout = c_adw_toast_get_timeout;
alias adw_toast_get_title = c_adw_toast_get_title;
alias adw_toast_get_use_markup = c_adw_toast_get_use_markup;
alias adw_toast_set_action_name = c_adw_toast_set_action_name;
alias adw_toast_set_action_target = c_adw_toast_set_action_target;
alias adw_toast_set_action_target_value = c_adw_toast_set_action_target_value;
alias adw_toast_set_button_label = c_adw_toast_set_button_label;
alias adw_toast_set_custom_title = c_adw_toast_set_custom_title;
alias adw_toast_set_detailed_action_name = c_adw_toast_set_detailed_action_name;
alias adw_toast_set_priority = c_adw_toast_set_priority;
alias adw_toast_set_timeout = c_adw_toast_set_timeout;
alias adw_toast_set_title = c_adw_toast_set_title;
alias adw_toast_set_use_markup = c_adw_toast_set_use_markup;

// ToastOverlay
alias adw_toast_overlay_get_type = c_adw_toast_overlay_get_type;
alias adw_toast_overlay_new = c_adw_toast_overlay_new;
alias adw_toast_overlay_add_toast = c_adw_toast_overlay_add_toast;
alias adw_toast_overlay_get_child = c_adw_toast_overlay_get_child;
alias adw_toast_overlay_set_child = c_adw_toast_overlay_set_child;

// ToolbarView
alias adw_toolbar_view_get_type = c_adw_toolbar_view_get_type;
alias adw_toolbar_view_new = c_adw_toolbar_view_new;
alias adw_toolbar_view_add_bottom_bar = c_adw_toolbar_view_add_bottom_bar;
alias adw_toolbar_view_add_top_bar = c_adw_toolbar_view_add_top_bar;
alias adw_toolbar_view_get_bottom_bar_height = c_adw_toolbar_view_get_bottom_bar_height;
alias adw_toolbar_view_get_bottom_bar_style = c_adw_toolbar_view_get_bottom_bar_style;
alias adw_toolbar_view_get_content = c_adw_toolbar_view_get_content;
alias adw_toolbar_view_get_extend_content_to_bottom_edge = c_adw_toolbar_view_get_extend_content_to_bottom_edge;
alias adw_toolbar_view_get_extend_content_to_top_edge = c_adw_toolbar_view_get_extend_content_to_top_edge;
alias adw_toolbar_view_get_reveal_bottom_bars = c_adw_toolbar_view_get_reveal_bottom_bars;
alias adw_toolbar_view_get_reveal_top_bars = c_adw_toolbar_view_get_reveal_top_bars;
alias adw_toolbar_view_get_top_bar_height = c_adw_toolbar_view_get_top_bar_height;
alias adw_toolbar_view_get_top_bar_style = c_adw_toolbar_view_get_top_bar_style;
alias adw_toolbar_view_remove = c_adw_toolbar_view_remove;
alias adw_toolbar_view_set_bottom_bar_style = c_adw_toolbar_view_set_bottom_bar_style;
alias adw_toolbar_view_set_content = c_adw_toolbar_view_set_content;
alias adw_toolbar_view_set_extend_content_to_bottom_edge = c_adw_toolbar_view_set_extend_content_to_bottom_edge;
alias adw_toolbar_view_set_extend_content_to_top_edge = c_adw_toolbar_view_set_extend_content_to_top_edge;
alias adw_toolbar_view_set_reveal_bottom_bars = c_adw_toolbar_view_set_reveal_bottom_bars;
alias adw_toolbar_view_set_reveal_top_bars = c_adw_toolbar_view_set_reveal_top_bars;
alias adw_toolbar_view_set_top_bar_style = c_adw_toolbar_view_set_top_bar_style;

// ViewStack
alias adw_view_stack_get_type = c_adw_view_stack_get_type;
alias adw_view_stack_new = c_adw_view_stack_new;
alias adw_view_stack_add = c_adw_view_stack_add;
alias adw_view_stack_add_named = c_adw_view_stack_add_named;
alias adw_view_stack_add_titled = c_adw_view_stack_add_titled;
alias adw_view_stack_add_titled_with_icon = c_adw_view_stack_add_titled_with_icon;
alias adw_view_stack_get_child_by_name = c_adw_view_stack_get_child_by_name;
alias adw_view_stack_get_hhomogeneous = c_adw_view_stack_get_hhomogeneous;
alias adw_view_stack_get_page = c_adw_view_stack_get_page;
alias adw_view_stack_get_pages = c_adw_view_stack_get_pages;
alias adw_view_stack_get_vhomogeneous = c_adw_view_stack_get_vhomogeneous;
alias adw_view_stack_get_visible_child = c_adw_view_stack_get_visible_child;
alias adw_view_stack_get_visible_child_name = c_adw_view_stack_get_visible_child_name;
alias adw_view_stack_remove = c_adw_view_stack_remove;
alias adw_view_stack_set_hhomogeneous = c_adw_view_stack_set_hhomogeneous;
alias adw_view_stack_set_vhomogeneous = c_adw_view_stack_set_vhomogeneous;
alias adw_view_stack_set_visible_child = c_adw_view_stack_set_visible_child;
alias adw_view_stack_set_visible_child_name = c_adw_view_stack_set_visible_child_name;

// ViewStackPage
alias adw_view_stack_page_get_type = c_adw_view_stack_page_get_type;
alias adw_view_stack_page_get_badge_number = c_adw_view_stack_page_get_badge_number;
alias adw_view_stack_page_get_child = c_adw_view_stack_page_get_child;
alias adw_view_stack_page_get_icon_name = c_adw_view_stack_page_get_icon_name;
alias adw_view_stack_page_get_name = c_adw_view_stack_page_get_name;
alias adw_view_stack_page_get_needs_attention = c_adw_view_stack_page_get_needs_attention;
alias adw_view_stack_page_get_title = c_adw_view_stack_page_get_title;
alias adw_view_stack_page_get_use_underline = c_adw_view_stack_page_get_use_underline;
alias adw_view_stack_page_get_visible = c_adw_view_stack_page_get_visible;
alias adw_view_stack_page_set_badge_number = c_adw_view_stack_page_set_badge_number;
alias adw_view_stack_page_set_icon_name = c_adw_view_stack_page_set_icon_name;
alias adw_view_stack_page_set_name = c_adw_view_stack_page_set_name;
alias adw_view_stack_page_set_needs_attention = c_adw_view_stack_page_set_needs_attention;
alias adw_view_stack_page_set_title = c_adw_view_stack_page_set_title;
alias adw_view_stack_page_set_use_underline = c_adw_view_stack_page_set_use_underline;
alias adw_view_stack_page_set_visible = c_adw_view_stack_page_set_visible;

// ViewStackPages
alias adw_view_stack_pages_get_type = c_adw_view_stack_pages_get_type;
alias adw_view_stack_pages_get_selected_page = c_adw_view_stack_pages_get_selected_page;
alias adw_view_stack_pages_set_selected_page = c_adw_view_stack_pages_set_selected_page;

// ViewSwitcher
alias adw_view_switcher_get_type = c_adw_view_switcher_get_type;
alias adw_view_switcher_new = c_adw_view_switcher_new;
alias adw_view_switcher_get_policy = c_adw_view_switcher_get_policy;
alias adw_view_switcher_get_stack = c_adw_view_switcher_get_stack;
alias adw_view_switcher_set_policy = c_adw_view_switcher_set_policy;
alias adw_view_switcher_set_stack = c_adw_view_switcher_set_stack;

// ViewSwitcherBar
alias adw_view_switcher_bar_get_type = c_adw_view_switcher_bar_get_type;
alias adw_view_switcher_bar_new = c_adw_view_switcher_bar_new;
alias adw_view_switcher_bar_get_reveal = c_adw_view_switcher_bar_get_reveal;
alias adw_view_switcher_bar_get_stack = c_adw_view_switcher_bar_get_stack;
alias adw_view_switcher_bar_set_reveal = c_adw_view_switcher_bar_set_reveal;
alias adw_view_switcher_bar_set_stack = c_adw_view_switcher_bar_set_stack;

// ViewSwitcherTitle
alias adw_view_switcher_title_get_type = c_adw_view_switcher_title_get_type;
alias adw_view_switcher_title_new = c_adw_view_switcher_title_new;
alias adw_view_switcher_title_get_stack = c_adw_view_switcher_title_get_stack;
alias adw_view_switcher_title_get_subtitle = c_adw_view_switcher_title_get_subtitle;
alias adw_view_switcher_title_get_title = c_adw_view_switcher_title_get_title;
alias adw_view_switcher_title_get_title_visible = c_adw_view_switcher_title_get_title_visible;
alias adw_view_switcher_title_get_view_switcher_enabled = c_adw_view_switcher_title_get_view_switcher_enabled;
alias adw_view_switcher_title_set_stack = c_adw_view_switcher_title_set_stack;
alias adw_view_switcher_title_set_subtitle = c_adw_view_switcher_title_set_subtitle;
alias adw_view_switcher_title_set_title = c_adw_view_switcher_title_set_title;
alias adw_view_switcher_title_set_view_switcher_enabled = c_adw_view_switcher_title_set_view_switcher_enabled;

// Window
alias adw_window_get_type = c_adw_window_get_type;
alias adw_window_new = c_adw_window_new;
alias adw_window_add_breakpoint = c_adw_window_add_breakpoint;
alias adw_window_get_content = c_adw_window_get_content;
alias adw_window_get_current_breakpoint = c_adw_window_get_current_breakpoint;
alias adw_window_get_dialogs = c_adw_window_get_dialogs;
alias adw_window_get_visible_dialog = c_adw_window_get_visible_dialog;
alias adw_window_set_content = c_adw_window_set_content;

// WindowTitle
alias adw_window_title_get_type = c_adw_window_title_get_type;
alias adw_window_title_new = c_adw_window_title_new;
alias adw_window_title_get_subtitle = c_adw_window_title_get_subtitle;
alias adw_window_title_get_title = c_adw_window_title_get_title;
alias adw_window_title_set_subtitle = c_adw_window_title_set_subtitle;
alias adw_window_title_set_title = c_adw_window_title_set_title;

// global
alias adw_get_enable_animations = c_adw_get_enable_animations;
alias adw_get_major_version = c_adw_get_major_version;
alias adw_get_micro_version = c_adw_get_micro_version;
alias adw_get_minor_version = c_adw_get_minor_version;
alias adw_init = c_adw_init;
alias adw_is_initialized = c_adw_is_initialized;
alias adw_lerp = c_adw_lerp;
alias adw_show_about_dialog = c_adw_show_about_dialog;
alias adw_show_about_dialog_from_appdata = c_adw_show_about_dialog_from_appdata;
alias adw_show_about_window = c_adw_show_about_window;
alias adw_show_about_window_from_appdata = c_adw_show_about_window_from_appdata;

shared static this()
{
  // AboutDialog
  gidLink(cast(void**)&adw_about_dialog_get_type, "adw_about_dialog_get_type", LIBS);
  gidLink(cast(void**)&adw_about_dialog_new, "adw_about_dialog_new", LIBS);
  gidLink(cast(void**)&adw_about_dialog_new_from_appdata, "adw_about_dialog_new_from_appdata", LIBS);
  gidLink(cast(void**)&adw_about_dialog_add_acknowledgement_section, "adw_about_dialog_add_acknowledgement_section", LIBS);
  gidLink(cast(void**)&adw_about_dialog_add_credit_section, "adw_about_dialog_add_credit_section", LIBS);
  gidLink(cast(void**)&adw_about_dialog_add_legal_section, "adw_about_dialog_add_legal_section", LIBS);
  gidLink(cast(void**)&adw_about_dialog_add_link, "adw_about_dialog_add_link", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_application_icon, "adw_about_dialog_get_application_icon", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_application_name, "adw_about_dialog_get_application_name", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_artists, "adw_about_dialog_get_artists", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_comments, "adw_about_dialog_get_comments", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_copyright, "adw_about_dialog_get_copyright", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_debug_info, "adw_about_dialog_get_debug_info", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_debug_info_filename, "adw_about_dialog_get_debug_info_filename", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_designers, "adw_about_dialog_get_designers", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_developer_name, "adw_about_dialog_get_developer_name", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_developers, "adw_about_dialog_get_developers", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_documenters, "adw_about_dialog_get_documenters", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_issue_url, "adw_about_dialog_get_issue_url", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_license, "adw_about_dialog_get_license", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_license_type, "adw_about_dialog_get_license_type", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_release_notes, "adw_about_dialog_get_release_notes", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_release_notes_version, "adw_about_dialog_get_release_notes_version", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_support_url, "adw_about_dialog_get_support_url", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_translator_credits, "adw_about_dialog_get_translator_credits", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_version, "adw_about_dialog_get_version", LIBS);
  gidLink(cast(void**)&adw_about_dialog_get_website, "adw_about_dialog_get_website", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_application_icon, "adw_about_dialog_set_application_icon", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_application_name, "adw_about_dialog_set_application_name", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_artists, "adw_about_dialog_set_artists", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_comments, "adw_about_dialog_set_comments", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_copyright, "adw_about_dialog_set_copyright", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_debug_info, "adw_about_dialog_set_debug_info", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_debug_info_filename, "adw_about_dialog_set_debug_info_filename", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_designers, "adw_about_dialog_set_designers", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_developer_name, "adw_about_dialog_set_developer_name", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_developers, "adw_about_dialog_set_developers", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_documenters, "adw_about_dialog_set_documenters", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_issue_url, "adw_about_dialog_set_issue_url", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_license, "adw_about_dialog_set_license", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_license_type, "adw_about_dialog_set_license_type", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_release_notes, "adw_about_dialog_set_release_notes", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_release_notes_version, "adw_about_dialog_set_release_notes_version", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_support_url, "adw_about_dialog_set_support_url", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_translator_credits, "adw_about_dialog_set_translator_credits", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_version, "adw_about_dialog_set_version", LIBS);
  gidLink(cast(void**)&adw_about_dialog_set_website, "adw_about_dialog_set_website", LIBS);

  // AboutWindow
  gidLink(cast(void**)&adw_about_window_get_type, "adw_about_window_get_type", LIBS);
  gidLink(cast(void**)&adw_about_window_new, "adw_about_window_new", LIBS);
  gidLink(cast(void**)&adw_about_window_new_from_appdata, "adw_about_window_new_from_appdata", LIBS);
  gidLink(cast(void**)&adw_about_window_add_acknowledgement_section, "adw_about_window_add_acknowledgement_section", LIBS);
  gidLink(cast(void**)&adw_about_window_add_credit_section, "adw_about_window_add_credit_section", LIBS);
  gidLink(cast(void**)&adw_about_window_add_legal_section, "adw_about_window_add_legal_section", LIBS);
  gidLink(cast(void**)&adw_about_window_add_link, "adw_about_window_add_link", LIBS);
  gidLink(cast(void**)&adw_about_window_get_application_icon, "adw_about_window_get_application_icon", LIBS);
  gidLink(cast(void**)&adw_about_window_get_application_name, "adw_about_window_get_application_name", LIBS);
  gidLink(cast(void**)&adw_about_window_get_artists, "adw_about_window_get_artists", LIBS);
  gidLink(cast(void**)&adw_about_window_get_comments, "adw_about_window_get_comments", LIBS);
  gidLink(cast(void**)&adw_about_window_get_copyright, "adw_about_window_get_copyright", LIBS);
  gidLink(cast(void**)&adw_about_window_get_debug_info, "adw_about_window_get_debug_info", LIBS);
  gidLink(cast(void**)&adw_about_window_get_debug_info_filename, "adw_about_window_get_debug_info_filename", LIBS);
  gidLink(cast(void**)&adw_about_window_get_designers, "adw_about_window_get_designers", LIBS);
  gidLink(cast(void**)&adw_about_window_get_developer_name, "adw_about_window_get_developer_name", LIBS);
  gidLink(cast(void**)&adw_about_window_get_developers, "adw_about_window_get_developers", LIBS);
  gidLink(cast(void**)&adw_about_window_get_documenters, "adw_about_window_get_documenters", LIBS);
  gidLink(cast(void**)&adw_about_window_get_issue_url, "adw_about_window_get_issue_url", LIBS);
  gidLink(cast(void**)&adw_about_window_get_license, "adw_about_window_get_license", LIBS);
  gidLink(cast(void**)&adw_about_window_get_license_type, "adw_about_window_get_license_type", LIBS);
  gidLink(cast(void**)&adw_about_window_get_release_notes, "adw_about_window_get_release_notes", LIBS);
  gidLink(cast(void**)&adw_about_window_get_release_notes_version, "adw_about_window_get_release_notes_version", LIBS);
  gidLink(cast(void**)&adw_about_window_get_support_url, "adw_about_window_get_support_url", LIBS);
  gidLink(cast(void**)&adw_about_window_get_translator_credits, "adw_about_window_get_translator_credits", LIBS);
  gidLink(cast(void**)&adw_about_window_get_version, "adw_about_window_get_version", LIBS);
  gidLink(cast(void**)&adw_about_window_get_website, "adw_about_window_get_website", LIBS);
  gidLink(cast(void**)&adw_about_window_set_application_icon, "adw_about_window_set_application_icon", LIBS);
  gidLink(cast(void**)&adw_about_window_set_application_name, "adw_about_window_set_application_name", LIBS);
  gidLink(cast(void**)&adw_about_window_set_artists, "adw_about_window_set_artists", LIBS);
  gidLink(cast(void**)&adw_about_window_set_comments, "adw_about_window_set_comments", LIBS);
  gidLink(cast(void**)&adw_about_window_set_copyright, "adw_about_window_set_copyright", LIBS);
  gidLink(cast(void**)&adw_about_window_set_debug_info, "adw_about_window_set_debug_info", LIBS);
  gidLink(cast(void**)&adw_about_window_set_debug_info_filename, "adw_about_window_set_debug_info_filename", LIBS);
  gidLink(cast(void**)&adw_about_window_set_designers, "adw_about_window_set_designers", LIBS);
  gidLink(cast(void**)&adw_about_window_set_developer_name, "adw_about_window_set_developer_name", LIBS);
  gidLink(cast(void**)&adw_about_window_set_developers, "adw_about_window_set_developers", LIBS);
  gidLink(cast(void**)&adw_about_window_set_documenters, "adw_about_window_set_documenters", LIBS);
  gidLink(cast(void**)&adw_about_window_set_issue_url, "adw_about_window_set_issue_url", LIBS);
  gidLink(cast(void**)&adw_about_window_set_license, "adw_about_window_set_license", LIBS);
  gidLink(cast(void**)&adw_about_window_set_license_type, "adw_about_window_set_license_type", LIBS);
  gidLink(cast(void**)&adw_about_window_set_release_notes, "adw_about_window_set_release_notes", LIBS);
  gidLink(cast(void**)&adw_about_window_set_release_notes_version, "adw_about_window_set_release_notes_version", LIBS);
  gidLink(cast(void**)&adw_about_window_set_support_url, "adw_about_window_set_support_url", LIBS);
  gidLink(cast(void**)&adw_about_window_set_translator_credits, "adw_about_window_set_translator_credits", LIBS);
  gidLink(cast(void**)&adw_about_window_set_version, "adw_about_window_set_version", LIBS);
  gidLink(cast(void**)&adw_about_window_set_website, "adw_about_window_set_website", LIBS);

  // ActionRow
  gidLink(cast(void**)&adw_action_row_get_type, "adw_action_row_get_type", LIBS);
  gidLink(cast(void**)&adw_action_row_new, "adw_action_row_new", LIBS);
  gidLink(cast(void**)&adw_action_row_activate, "adw_action_row_activate", LIBS);
  gidLink(cast(void**)&adw_action_row_add_prefix, "adw_action_row_add_prefix", LIBS);
  gidLink(cast(void**)&adw_action_row_add_suffix, "adw_action_row_add_suffix", LIBS);
  gidLink(cast(void**)&adw_action_row_get_activatable_widget, "adw_action_row_get_activatable_widget", LIBS);
  gidLink(cast(void**)&adw_action_row_get_icon_name, "adw_action_row_get_icon_name", LIBS);
  gidLink(cast(void**)&adw_action_row_get_subtitle, "adw_action_row_get_subtitle", LIBS);
  gidLink(cast(void**)&adw_action_row_get_subtitle_lines, "adw_action_row_get_subtitle_lines", LIBS);
  gidLink(cast(void**)&adw_action_row_get_subtitle_selectable, "adw_action_row_get_subtitle_selectable", LIBS);
  gidLink(cast(void**)&adw_action_row_get_title_lines, "adw_action_row_get_title_lines", LIBS);
  gidLink(cast(void**)&adw_action_row_remove, "adw_action_row_remove", LIBS);
  gidLink(cast(void**)&adw_action_row_set_activatable_widget, "adw_action_row_set_activatable_widget", LIBS);
  gidLink(cast(void**)&adw_action_row_set_icon_name, "adw_action_row_set_icon_name", LIBS);
  gidLink(cast(void**)&adw_action_row_set_subtitle, "adw_action_row_set_subtitle", LIBS);
  gidLink(cast(void**)&adw_action_row_set_subtitle_lines, "adw_action_row_set_subtitle_lines", LIBS);
  gidLink(cast(void**)&adw_action_row_set_subtitle_selectable, "adw_action_row_set_subtitle_selectable", LIBS);
  gidLink(cast(void**)&adw_action_row_set_title_lines, "adw_action_row_set_title_lines", LIBS);

  // AlertDialog
  gidLink(cast(void**)&adw_alert_dialog_get_type, "adw_alert_dialog_get_type", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_new, "adw_alert_dialog_new", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_add_response, "adw_alert_dialog_add_response", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_add_responses, "adw_alert_dialog_add_responses", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_choose, "adw_alert_dialog_choose", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_choose_finish, "adw_alert_dialog_choose_finish", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_format_body, "adw_alert_dialog_format_body", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_format_body_markup, "adw_alert_dialog_format_body_markup", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_format_heading, "adw_alert_dialog_format_heading", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_format_heading_markup, "adw_alert_dialog_format_heading_markup", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_get_body, "adw_alert_dialog_get_body", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_get_body_use_markup, "adw_alert_dialog_get_body_use_markup", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_get_close_response, "adw_alert_dialog_get_close_response", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_get_default_response, "adw_alert_dialog_get_default_response", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_get_extra_child, "adw_alert_dialog_get_extra_child", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_get_heading, "adw_alert_dialog_get_heading", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_get_heading_use_markup, "adw_alert_dialog_get_heading_use_markup", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_get_response_appearance, "adw_alert_dialog_get_response_appearance", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_get_response_enabled, "adw_alert_dialog_get_response_enabled", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_get_response_label, "adw_alert_dialog_get_response_label", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_has_response, "adw_alert_dialog_has_response", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_remove_response, "adw_alert_dialog_remove_response", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_set_body, "adw_alert_dialog_set_body", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_set_body_use_markup, "adw_alert_dialog_set_body_use_markup", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_set_close_response, "adw_alert_dialog_set_close_response", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_set_default_response, "adw_alert_dialog_set_default_response", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_set_extra_child, "adw_alert_dialog_set_extra_child", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_set_heading, "adw_alert_dialog_set_heading", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_set_heading_use_markup, "adw_alert_dialog_set_heading_use_markup", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_set_response_appearance, "adw_alert_dialog_set_response_appearance", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_set_response_enabled, "adw_alert_dialog_set_response_enabled", LIBS);
  gidLink(cast(void**)&adw_alert_dialog_set_response_label, "adw_alert_dialog_set_response_label", LIBS);

  // Animation
  gidLink(cast(void**)&adw_animation_get_type, "adw_animation_get_type", LIBS);
  gidLink(cast(void**)&adw_animation_get_follow_enable_animations_setting, "adw_animation_get_follow_enable_animations_setting", LIBS);
  gidLink(cast(void**)&adw_animation_get_state, "adw_animation_get_state", LIBS);
  gidLink(cast(void**)&adw_animation_get_target, "adw_animation_get_target", LIBS);
  gidLink(cast(void**)&adw_animation_get_value, "adw_animation_get_value", LIBS);
  gidLink(cast(void**)&adw_animation_get_widget, "adw_animation_get_widget", LIBS);
  gidLink(cast(void**)&adw_animation_pause, "adw_animation_pause", LIBS);
  gidLink(cast(void**)&adw_animation_play, "adw_animation_play", LIBS);
  gidLink(cast(void**)&adw_animation_reset, "adw_animation_reset", LIBS);
  gidLink(cast(void**)&adw_animation_resume, "adw_animation_resume", LIBS);
  gidLink(cast(void**)&adw_animation_set_follow_enable_animations_setting, "adw_animation_set_follow_enable_animations_setting", LIBS);
  gidLink(cast(void**)&adw_animation_set_target, "adw_animation_set_target", LIBS);
  gidLink(cast(void**)&adw_animation_skip, "adw_animation_skip", LIBS);

  // AnimationTarget
  gidLink(cast(void**)&adw_animation_target_get_type, "adw_animation_target_get_type", LIBS);

  // Application
  gidLink(cast(void**)&adw_application_get_type, "adw_application_get_type", LIBS);
  gidLink(cast(void**)&adw_application_new, "adw_application_new", LIBS);
  gidLink(cast(void**)&adw_application_get_style_manager, "adw_application_get_style_manager", LIBS);

  // ApplicationWindow
  gidLink(cast(void**)&adw_application_window_get_type, "adw_application_window_get_type", LIBS);
  gidLink(cast(void**)&adw_application_window_new, "adw_application_window_new", LIBS);
  gidLink(cast(void**)&adw_application_window_add_breakpoint, "adw_application_window_add_breakpoint", LIBS);
  gidLink(cast(void**)&adw_application_window_get_content, "adw_application_window_get_content", LIBS);
  gidLink(cast(void**)&adw_application_window_get_current_breakpoint, "adw_application_window_get_current_breakpoint", LIBS);
  gidLink(cast(void**)&adw_application_window_get_dialogs, "adw_application_window_get_dialogs", LIBS);
  gidLink(cast(void**)&adw_application_window_get_visible_dialog, "adw_application_window_get_visible_dialog", LIBS);
  gidLink(cast(void**)&adw_application_window_set_content, "adw_application_window_set_content", LIBS);

  // Avatar
  gidLink(cast(void**)&adw_avatar_get_type, "adw_avatar_get_type", LIBS);
  gidLink(cast(void**)&adw_avatar_new, "adw_avatar_new", LIBS);
  gidLink(cast(void**)&adw_avatar_draw_to_texture, "adw_avatar_draw_to_texture", LIBS);
  gidLink(cast(void**)&adw_avatar_get_custom_image, "adw_avatar_get_custom_image", LIBS);
  gidLink(cast(void**)&adw_avatar_get_icon_name, "adw_avatar_get_icon_name", LIBS);
  gidLink(cast(void**)&adw_avatar_get_show_initials, "adw_avatar_get_show_initials", LIBS);
  gidLink(cast(void**)&adw_avatar_get_size, "adw_avatar_get_size", LIBS);
  gidLink(cast(void**)&adw_avatar_get_text, "adw_avatar_get_text", LIBS);
  gidLink(cast(void**)&adw_avatar_set_custom_image, "adw_avatar_set_custom_image", LIBS);
  gidLink(cast(void**)&adw_avatar_set_icon_name, "adw_avatar_set_icon_name", LIBS);
  gidLink(cast(void**)&adw_avatar_set_show_initials, "adw_avatar_set_show_initials", LIBS);
  gidLink(cast(void**)&adw_avatar_set_size, "adw_avatar_set_size", LIBS);
  gidLink(cast(void**)&adw_avatar_set_text, "adw_avatar_set_text", LIBS);

  // Banner
  gidLink(cast(void**)&adw_banner_get_type, "adw_banner_get_type", LIBS);
  gidLink(cast(void**)&adw_banner_new, "adw_banner_new", LIBS);
  gidLink(cast(void**)&adw_banner_get_button_label, "adw_banner_get_button_label", LIBS);
  gidLink(cast(void**)&adw_banner_get_revealed, "adw_banner_get_revealed", LIBS);
  gidLink(cast(void**)&adw_banner_get_title, "adw_banner_get_title", LIBS);
  gidLink(cast(void**)&adw_banner_get_use_markup, "adw_banner_get_use_markup", LIBS);
  gidLink(cast(void**)&adw_banner_set_button_label, "adw_banner_set_button_label", LIBS);
  gidLink(cast(void**)&adw_banner_set_revealed, "adw_banner_set_revealed", LIBS);
  gidLink(cast(void**)&adw_banner_set_title, "adw_banner_set_title", LIBS);
  gidLink(cast(void**)&adw_banner_set_use_markup, "adw_banner_set_use_markup", LIBS);

  // Bin
  gidLink(cast(void**)&adw_bin_get_type, "adw_bin_get_type", LIBS);
  gidLink(cast(void**)&adw_bin_new, "adw_bin_new", LIBS);
  gidLink(cast(void**)&adw_bin_get_child, "adw_bin_get_child", LIBS);
  gidLink(cast(void**)&adw_bin_set_child, "adw_bin_set_child", LIBS);

  // Breakpoint
  gidLink(cast(void**)&adw_breakpoint_get_type, "adw_breakpoint_get_type", LIBS);
  gidLink(cast(void**)&adw_breakpoint_new, "adw_breakpoint_new", LIBS);
  gidLink(cast(void**)&adw_breakpoint_add_setter, "adw_breakpoint_add_setter", LIBS);
  gidLink(cast(void**)&adw_breakpoint_add_setters, "adw_breakpoint_add_setters", LIBS);
  gidLink(cast(void**)&adw_breakpoint_add_setters_valist, "adw_breakpoint_add_setters_valist", LIBS);
  gidLink(cast(void**)&adw_breakpoint_add_settersv, "adw_breakpoint_add_settersv", LIBS);
  gidLink(cast(void**)&adw_breakpoint_get_condition, "adw_breakpoint_get_condition", LIBS);
  gidLink(cast(void**)&adw_breakpoint_set_condition, "adw_breakpoint_set_condition", LIBS);

  // BreakpointBin
  gidLink(cast(void**)&adw_breakpoint_bin_get_type, "adw_breakpoint_bin_get_type", LIBS);
  gidLink(cast(void**)&adw_breakpoint_bin_new, "adw_breakpoint_bin_new", LIBS);
  gidLink(cast(void**)&adw_breakpoint_bin_add_breakpoint, "adw_breakpoint_bin_add_breakpoint", LIBS);
  gidLink(cast(void**)&adw_breakpoint_bin_get_child, "adw_breakpoint_bin_get_child", LIBS);
  gidLink(cast(void**)&adw_breakpoint_bin_get_current_breakpoint, "adw_breakpoint_bin_get_current_breakpoint", LIBS);
  gidLink(cast(void**)&adw_breakpoint_bin_remove_breakpoint, "adw_breakpoint_bin_remove_breakpoint", LIBS);
  gidLink(cast(void**)&adw_breakpoint_bin_set_child, "adw_breakpoint_bin_set_child", LIBS);

  // BreakpointCondition
  gidLink(cast(void**)&adw_breakpoint_condition_get_type, "adw_breakpoint_condition_get_type", LIBS);
  gidLink(cast(void**)&adw_breakpoint_condition_new_and, "adw_breakpoint_condition_new_and", LIBS);
  gidLink(cast(void**)&adw_breakpoint_condition_new_length, "adw_breakpoint_condition_new_length", LIBS);
  gidLink(cast(void**)&adw_breakpoint_condition_new_or, "adw_breakpoint_condition_new_or", LIBS);
  gidLink(cast(void**)&adw_breakpoint_condition_new_ratio, "adw_breakpoint_condition_new_ratio", LIBS);
  gidLink(cast(void**)&adw_breakpoint_condition_copy, "adw_breakpoint_condition_copy", LIBS);
  gidLink(cast(void**)&adw_breakpoint_condition_free, "adw_breakpoint_condition_free", LIBS);
  gidLink(cast(void**)&adw_breakpoint_condition_to_string, "adw_breakpoint_condition_to_string", LIBS);
  gidLink(cast(void**)&adw_breakpoint_condition_parse, "adw_breakpoint_condition_parse", LIBS);

  // ButtonContent
  gidLink(cast(void**)&adw_button_content_get_type, "adw_button_content_get_type", LIBS);
  gidLink(cast(void**)&adw_button_content_new, "adw_button_content_new", LIBS);
  gidLink(cast(void**)&adw_button_content_get_can_shrink, "adw_button_content_get_can_shrink", LIBS);
  gidLink(cast(void**)&adw_button_content_get_icon_name, "adw_button_content_get_icon_name", LIBS);
  gidLink(cast(void**)&adw_button_content_get_label, "adw_button_content_get_label", LIBS);
  gidLink(cast(void**)&adw_button_content_get_use_underline, "adw_button_content_get_use_underline", LIBS);
  gidLink(cast(void**)&adw_button_content_set_can_shrink, "adw_button_content_set_can_shrink", LIBS);
  gidLink(cast(void**)&adw_button_content_set_icon_name, "adw_button_content_set_icon_name", LIBS);
  gidLink(cast(void**)&adw_button_content_set_label, "adw_button_content_set_label", LIBS);
  gidLink(cast(void**)&adw_button_content_set_use_underline, "adw_button_content_set_use_underline", LIBS);

  // CallbackAnimationTarget
  gidLink(cast(void**)&adw_callback_animation_target_get_type, "adw_callback_animation_target_get_type", LIBS);
  gidLink(cast(void**)&adw_callback_animation_target_new, "adw_callback_animation_target_new", LIBS);

  // Carousel
  gidLink(cast(void**)&adw_carousel_get_type, "adw_carousel_get_type", LIBS);
  gidLink(cast(void**)&adw_carousel_new, "adw_carousel_new", LIBS);
  gidLink(cast(void**)&adw_carousel_append, "adw_carousel_append", LIBS);
  gidLink(cast(void**)&adw_carousel_get_allow_long_swipes, "adw_carousel_get_allow_long_swipes", LIBS);
  gidLink(cast(void**)&adw_carousel_get_allow_mouse_drag, "adw_carousel_get_allow_mouse_drag", LIBS);
  gidLink(cast(void**)&adw_carousel_get_allow_scroll_wheel, "adw_carousel_get_allow_scroll_wheel", LIBS);
  gidLink(cast(void**)&adw_carousel_get_interactive, "adw_carousel_get_interactive", LIBS);
  gidLink(cast(void**)&adw_carousel_get_n_pages, "adw_carousel_get_n_pages", LIBS);
  gidLink(cast(void**)&adw_carousel_get_nth_page, "adw_carousel_get_nth_page", LIBS);
  gidLink(cast(void**)&adw_carousel_get_position, "adw_carousel_get_position", LIBS);
  gidLink(cast(void**)&adw_carousel_get_reveal_duration, "adw_carousel_get_reveal_duration", LIBS);
  gidLink(cast(void**)&adw_carousel_get_scroll_params, "adw_carousel_get_scroll_params", LIBS);
  gidLink(cast(void**)&adw_carousel_get_spacing, "adw_carousel_get_spacing", LIBS);
  gidLink(cast(void**)&adw_carousel_insert, "adw_carousel_insert", LIBS);
  gidLink(cast(void**)&adw_carousel_prepend, "adw_carousel_prepend", LIBS);
  gidLink(cast(void**)&adw_carousel_remove, "adw_carousel_remove", LIBS);
  gidLink(cast(void**)&adw_carousel_reorder, "adw_carousel_reorder", LIBS);
  gidLink(cast(void**)&adw_carousel_scroll_to, "adw_carousel_scroll_to", LIBS);
  gidLink(cast(void**)&adw_carousel_set_allow_long_swipes, "adw_carousel_set_allow_long_swipes", LIBS);
  gidLink(cast(void**)&adw_carousel_set_allow_mouse_drag, "adw_carousel_set_allow_mouse_drag", LIBS);
  gidLink(cast(void**)&adw_carousel_set_allow_scroll_wheel, "adw_carousel_set_allow_scroll_wheel", LIBS);
  gidLink(cast(void**)&adw_carousel_set_interactive, "adw_carousel_set_interactive", LIBS);
  gidLink(cast(void**)&adw_carousel_set_reveal_duration, "adw_carousel_set_reveal_duration", LIBS);
  gidLink(cast(void**)&adw_carousel_set_scroll_params, "adw_carousel_set_scroll_params", LIBS);
  gidLink(cast(void**)&adw_carousel_set_spacing, "adw_carousel_set_spacing", LIBS);

  // CarouselIndicatorDots
  gidLink(cast(void**)&adw_carousel_indicator_dots_get_type, "adw_carousel_indicator_dots_get_type", LIBS);
  gidLink(cast(void**)&adw_carousel_indicator_dots_new, "adw_carousel_indicator_dots_new", LIBS);
  gidLink(cast(void**)&adw_carousel_indicator_dots_get_carousel, "adw_carousel_indicator_dots_get_carousel", LIBS);
  gidLink(cast(void**)&adw_carousel_indicator_dots_set_carousel, "adw_carousel_indicator_dots_set_carousel", LIBS);

  // CarouselIndicatorLines
  gidLink(cast(void**)&adw_carousel_indicator_lines_get_type, "adw_carousel_indicator_lines_get_type", LIBS);
  gidLink(cast(void**)&adw_carousel_indicator_lines_new, "adw_carousel_indicator_lines_new", LIBS);
  gidLink(cast(void**)&adw_carousel_indicator_lines_get_carousel, "adw_carousel_indicator_lines_get_carousel", LIBS);
  gidLink(cast(void**)&adw_carousel_indicator_lines_set_carousel, "adw_carousel_indicator_lines_set_carousel", LIBS);

  // Clamp
  gidLink(cast(void**)&adw_clamp_get_type, "adw_clamp_get_type", LIBS);
  gidLink(cast(void**)&adw_clamp_new, "adw_clamp_new", LIBS);
  gidLink(cast(void**)&adw_clamp_get_child, "adw_clamp_get_child", LIBS);
  gidLink(cast(void**)&adw_clamp_get_maximum_size, "adw_clamp_get_maximum_size", LIBS);
  gidLink(cast(void**)&adw_clamp_get_tightening_threshold, "adw_clamp_get_tightening_threshold", LIBS);
  gidLink(cast(void**)&adw_clamp_get_unit, "adw_clamp_get_unit", LIBS);
  gidLink(cast(void**)&adw_clamp_set_child, "adw_clamp_set_child", LIBS);
  gidLink(cast(void**)&adw_clamp_set_maximum_size, "adw_clamp_set_maximum_size", LIBS);
  gidLink(cast(void**)&adw_clamp_set_tightening_threshold, "adw_clamp_set_tightening_threshold", LIBS);
  gidLink(cast(void**)&adw_clamp_set_unit, "adw_clamp_set_unit", LIBS);

  // ClampLayout
  gidLink(cast(void**)&adw_clamp_layout_get_type, "adw_clamp_layout_get_type", LIBS);
  gidLink(cast(void**)&adw_clamp_layout_new, "adw_clamp_layout_new", LIBS);
  gidLink(cast(void**)&adw_clamp_layout_get_maximum_size, "adw_clamp_layout_get_maximum_size", LIBS);
  gidLink(cast(void**)&adw_clamp_layout_get_tightening_threshold, "adw_clamp_layout_get_tightening_threshold", LIBS);
  gidLink(cast(void**)&adw_clamp_layout_get_unit, "adw_clamp_layout_get_unit", LIBS);
  gidLink(cast(void**)&adw_clamp_layout_set_maximum_size, "adw_clamp_layout_set_maximum_size", LIBS);
  gidLink(cast(void**)&adw_clamp_layout_set_tightening_threshold, "adw_clamp_layout_set_tightening_threshold", LIBS);
  gidLink(cast(void**)&adw_clamp_layout_set_unit, "adw_clamp_layout_set_unit", LIBS);

  // ClampScrollable
  gidLink(cast(void**)&adw_clamp_scrollable_get_type, "adw_clamp_scrollable_get_type", LIBS);
  gidLink(cast(void**)&adw_clamp_scrollable_new, "adw_clamp_scrollable_new", LIBS);
  gidLink(cast(void**)&adw_clamp_scrollable_get_child, "adw_clamp_scrollable_get_child", LIBS);
  gidLink(cast(void**)&adw_clamp_scrollable_get_maximum_size, "adw_clamp_scrollable_get_maximum_size", LIBS);
  gidLink(cast(void**)&adw_clamp_scrollable_get_tightening_threshold, "adw_clamp_scrollable_get_tightening_threshold", LIBS);
  gidLink(cast(void**)&adw_clamp_scrollable_get_unit, "adw_clamp_scrollable_get_unit", LIBS);
  gidLink(cast(void**)&adw_clamp_scrollable_set_child, "adw_clamp_scrollable_set_child", LIBS);
  gidLink(cast(void**)&adw_clamp_scrollable_set_maximum_size, "adw_clamp_scrollable_set_maximum_size", LIBS);
  gidLink(cast(void**)&adw_clamp_scrollable_set_tightening_threshold, "adw_clamp_scrollable_set_tightening_threshold", LIBS);
  gidLink(cast(void**)&adw_clamp_scrollable_set_unit, "adw_clamp_scrollable_set_unit", LIBS);

  // ComboRow
  gidLink(cast(void**)&adw_combo_row_get_type, "adw_combo_row_get_type", LIBS);
  gidLink(cast(void**)&adw_combo_row_new, "adw_combo_row_new", LIBS);
  gidLink(cast(void**)&adw_combo_row_get_enable_search, "adw_combo_row_get_enable_search", LIBS);
  gidLink(cast(void**)&adw_combo_row_get_expression, "adw_combo_row_get_expression", LIBS);
  gidLink(cast(void**)&adw_combo_row_get_factory, "adw_combo_row_get_factory", LIBS);
  gidLink(cast(void**)&adw_combo_row_get_list_factory, "adw_combo_row_get_list_factory", LIBS);
  gidLink(cast(void**)&adw_combo_row_get_model, "adw_combo_row_get_model", LIBS);
  gidLink(cast(void**)&adw_combo_row_get_selected, "adw_combo_row_get_selected", LIBS);
  gidLink(cast(void**)&adw_combo_row_get_selected_item, "adw_combo_row_get_selected_item", LIBS);
  gidLink(cast(void**)&adw_combo_row_get_use_subtitle, "adw_combo_row_get_use_subtitle", LIBS);
  gidLink(cast(void**)&adw_combo_row_set_enable_search, "adw_combo_row_set_enable_search", LIBS);
  gidLink(cast(void**)&adw_combo_row_set_expression, "adw_combo_row_set_expression", LIBS);
  gidLink(cast(void**)&adw_combo_row_set_factory, "adw_combo_row_set_factory", LIBS);
  gidLink(cast(void**)&adw_combo_row_set_list_factory, "adw_combo_row_set_list_factory", LIBS);
  gidLink(cast(void**)&adw_combo_row_set_model, "adw_combo_row_set_model", LIBS);
  gidLink(cast(void**)&adw_combo_row_set_selected, "adw_combo_row_set_selected", LIBS);
  gidLink(cast(void**)&adw_combo_row_set_use_subtitle, "adw_combo_row_set_use_subtitle", LIBS);

  // Dialog
  gidLink(cast(void**)&adw_dialog_get_type, "adw_dialog_get_type", LIBS);
  gidLink(cast(void**)&adw_dialog_new, "adw_dialog_new", LIBS);
  gidLink(cast(void**)&adw_dialog_add_breakpoint, "adw_dialog_add_breakpoint", LIBS);
  gidLink(cast(void**)&adw_dialog_close, "adw_dialog_close", LIBS);
  gidLink(cast(void**)&adw_dialog_force_close, "adw_dialog_force_close", LIBS);
  gidLink(cast(void**)&adw_dialog_get_can_close, "adw_dialog_get_can_close", LIBS);
  gidLink(cast(void**)&adw_dialog_get_child, "adw_dialog_get_child", LIBS);
  gidLink(cast(void**)&adw_dialog_get_content_height, "adw_dialog_get_content_height", LIBS);
  gidLink(cast(void**)&adw_dialog_get_content_width, "adw_dialog_get_content_width", LIBS);
  gidLink(cast(void**)&adw_dialog_get_current_breakpoint, "adw_dialog_get_current_breakpoint", LIBS);
  gidLink(cast(void**)&adw_dialog_get_default_widget, "adw_dialog_get_default_widget", LIBS);
  gidLink(cast(void**)&adw_dialog_get_focus, "adw_dialog_get_focus", LIBS);
  gidLink(cast(void**)&adw_dialog_get_follows_content_size, "adw_dialog_get_follows_content_size", LIBS);
  gidLink(cast(void**)&adw_dialog_get_presentation_mode, "adw_dialog_get_presentation_mode", LIBS);
  gidLink(cast(void**)&adw_dialog_get_title, "adw_dialog_get_title", LIBS);
  gidLink(cast(void**)&adw_dialog_present, "adw_dialog_present", LIBS);
  gidLink(cast(void**)&adw_dialog_set_can_close, "adw_dialog_set_can_close", LIBS);
  gidLink(cast(void**)&adw_dialog_set_child, "adw_dialog_set_child", LIBS);
  gidLink(cast(void**)&adw_dialog_set_content_height, "adw_dialog_set_content_height", LIBS);
  gidLink(cast(void**)&adw_dialog_set_content_width, "adw_dialog_set_content_width", LIBS);
  gidLink(cast(void**)&adw_dialog_set_default_widget, "adw_dialog_set_default_widget", LIBS);
  gidLink(cast(void**)&adw_dialog_set_focus, "adw_dialog_set_focus", LIBS);
  gidLink(cast(void**)&adw_dialog_set_follows_content_size, "adw_dialog_set_follows_content_size", LIBS);
  gidLink(cast(void**)&adw_dialog_set_presentation_mode, "adw_dialog_set_presentation_mode", LIBS);
  gidLink(cast(void**)&adw_dialog_set_title, "adw_dialog_set_title", LIBS);

  // EntryRow
  gidLink(cast(void**)&adw_entry_row_get_type, "adw_entry_row_get_type", LIBS);
  gidLink(cast(void**)&adw_entry_row_new, "adw_entry_row_new", LIBS);
  gidLink(cast(void**)&adw_entry_row_add_prefix, "adw_entry_row_add_prefix", LIBS);
  gidLink(cast(void**)&adw_entry_row_add_suffix, "adw_entry_row_add_suffix", LIBS);
  gidLink(cast(void**)&adw_entry_row_get_activates_default, "adw_entry_row_get_activates_default", LIBS);
  gidLink(cast(void**)&adw_entry_row_get_attributes, "adw_entry_row_get_attributes", LIBS);
  gidLink(cast(void**)&adw_entry_row_get_enable_emoji_completion, "adw_entry_row_get_enable_emoji_completion", LIBS);
  gidLink(cast(void**)&adw_entry_row_get_input_hints, "adw_entry_row_get_input_hints", LIBS);
  gidLink(cast(void**)&adw_entry_row_get_input_purpose, "adw_entry_row_get_input_purpose", LIBS);
  gidLink(cast(void**)&adw_entry_row_get_show_apply_button, "adw_entry_row_get_show_apply_button", LIBS);
  gidLink(cast(void**)&adw_entry_row_get_text_length, "adw_entry_row_get_text_length", LIBS);
  gidLink(cast(void**)&adw_entry_row_grab_focus_without_selecting, "adw_entry_row_grab_focus_without_selecting", LIBS);
  gidLink(cast(void**)&adw_entry_row_remove, "adw_entry_row_remove", LIBS);
  gidLink(cast(void**)&adw_entry_row_set_activates_default, "adw_entry_row_set_activates_default", LIBS);
  gidLink(cast(void**)&adw_entry_row_set_attributes, "adw_entry_row_set_attributes", LIBS);
  gidLink(cast(void**)&adw_entry_row_set_enable_emoji_completion, "adw_entry_row_set_enable_emoji_completion", LIBS);
  gidLink(cast(void**)&adw_entry_row_set_input_hints, "adw_entry_row_set_input_hints", LIBS);
  gidLink(cast(void**)&adw_entry_row_set_input_purpose, "adw_entry_row_set_input_purpose", LIBS);
  gidLink(cast(void**)&adw_entry_row_set_show_apply_button, "adw_entry_row_set_show_apply_button", LIBS);

  // EnumListItem
  gidLink(cast(void**)&adw_enum_list_item_get_type, "adw_enum_list_item_get_type", LIBS);
  gidLink(cast(void**)&adw_enum_list_item_get_name, "adw_enum_list_item_get_name", LIBS);
  gidLink(cast(void**)&adw_enum_list_item_get_nick, "adw_enum_list_item_get_nick", LIBS);
  gidLink(cast(void**)&adw_enum_list_item_get_value, "adw_enum_list_item_get_value", LIBS);

  // EnumListModel
  gidLink(cast(void**)&adw_enum_list_model_get_type, "adw_enum_list_model_get_type", LIBS);
  gidLink(cast(void**)&adw_enum_list_model_new, "adw_enum_list_model_new", LIBS);
  gidLink(cast(void**)&adw_enum_list_model_find_position, "adw_enum_list_model_find_position", LIBS);
  gidLink(cast(void**)&adw_enum_list_model_get_enum_type, "adw_enum_list_model_get_enum_type", LIBS);

  // ExpanderRow
  gidLink(cast(void**)&adw_expander_row_get_type, "adw_expander_row_get_type", LIBS);
  gidLink(cast(void**)&adw_expander_row_new, "adw_expander_row_new", LIBS);
  gidLink(cast(void**)&adw_expander_row_add_action, "adw_expander_row_add_action", LIBS);
  gidLink(cast(void**)&adw_expander_row_add_prefix, "adw_expander_row_add_prefix", LIBS);
  gidLink(cast(void**)&adw_expander_row_add_row, "adw_expander_row_add_row", LIBS);
  gidLink(cast(void**)&adw_expander_row_add_suffix, "adw_expander_row_add_suffix", LIBS);
  gidLink(cast(void**)&adw_expander_row_get_enable_expansion, "adw_expander_row_get_enable_expansion", LIBS);
  gidLink(cast(void**)&adw_expander_row_get_expanded, "adw_expander_row_get_expanded", LIBS);
  gidLink(cast(void**)&adw_expander_row_get_icon_name, "adw_expander_row_get_icon_name", LIBS);
  gidLink(cast(void**)&adw_expander_row_get_show_enable_switch, "adw_expander_row_get_show_enable_switch", LIBS);
  gidLink(cast(void**)&adw_expander_row_get_subtitle, "adw_expander_row_get_subtitle", LIBS);
  gidLink(cast(void**)&adw_expander_row_get_subtitle_lines, "adw_expander_row_get_subtitle_lines", LIBS);
  gidLink(cast(void**)&adw_expander_row_get_title_lines, "adw_expander_row_get_title_lines", LIBS);
  gidLink(cast(void**)&adw_expander_row_remove, "adw_expander_row_remove", LIBS);
  gidLink(cast(void**)&adw_expander_row_set_enable_expansion, "adw_expander_row_set_enable_expansion", LIBS);
  gidLink(cast(void**)&adw_expander_row_set_expanded, "adw_expander_row_set_expanded", LIBS);
  gidLink(cast(void**)&adw_expander_row_set_icon_name, "adw_expander_row_set_icon_name", LIBS);
  gidLink(cast(void**)&adw_expander_row_set_show_enable_switch, "adw_expander_row_set_show_enable_switch", LIBS);
  gidLink(cast(void**)&adw_expander_row_set_subtitle, "adw_expander_row_set_subtitle", LIBS);
  gidLink(cast(void**)&adw_expander_row_set_subtitle_lines, "adw_expander_row_set_subtitle_lines", LIBS);
  gidLink(cast(void**)&adw_expander_row_set_title_lines, "adw_expander_row_set_title_lines", LIBS);

  // Flap
  gidLink(cast(void**)&adw_flap_get_type, "adw_flap_get_type", LIBS);
  gidLink(cast(void**)&adw_flap_new, "adw_flap_new", LIBS);
  gidLink(cast(void**)&adw_flap_get_content, "adw_flap_get_content", LIBS);
  gidLink(cast(void**)&adw_flap_get_flap, "adw_flap_get_flap", LIBS);
  gidLink(cast(void**)&adw_flap_get_flap_position, "adw_flap_get_flap_position", LIBS);
  gidLink(cast(void**)&adw_flap_get_fold_duration, "adw_flap_get_fold_duration", LIBS);
  gidLink(cast(void**)&adw_flap_get_fold_policy, "adw_flap_get_fold_policy", LIBS);
  gidLink(cast(void**)&adw_flap_get_fold_threshold_policy, "adw_flap_get_fold_threshold_policy", LIBS);
  gidLink(cast(void**)&adw_flap_get_folded, "adw_flap_get_folded", LIBS);
  gidLink(cast(void**)&adw_flap_get_locked, "adw_flap_get_locked", LIBS);
  gidLink(cast(void**)&adw_flap_get_modal, "adw_flap_get_modal", LIBS);
  gidLink(cast(void**)&adw_flap_get_reveal_flap, "adw_flap_get_reveal_flap", LIBS);
  gidLink(cast(void**)&adw_flap_get_reveal_params, "adw_flap_get_reveal_params", LIBS);
  gidLink(cast(void**)&adw_flap_get_reveal_progress, "adw_flap_get_reveal_progress", LIBS);
  gidLink(cast(void**)&adw_flap_get_separator, "adw_flap_get_separator", LIBS);
  gidLink(cast(void**)&adw_flap_get_swipe_to_close, "adw_flap_get_swipe_to_close", LIBS);
  gidLink(cast(void**)&adw_flap_get_swipe_to_open, "adw_flap_get_swipe_to_open", LIBS);
  gidLink(cast(void**)&adw_flap_get_transition_type, "adw_flap_get_transition_type", LIBS);
  gidLink(cast(void**)&adw_flap_set_content, "adw_flap_set_content", LIBS);
  gidLink(cast(void**)&adw_flap_set_flap, "adw_flap_set_flap", LIBS);
  gidLink(cast(void**)&adw_flap_set_flap_position, "adw_flap_set_flap_position", LIBS);
  gidLink(cast(void**)&adw_flap_set_fold_duration, "adw_flap_set_fold_duration", LIBS);
  gidLink(cast(void**)&adw_flap_set_fold_policy, "adw_flap_set_fold_policy", LIBS);
  gidLink(cast(void**)&adw_flap_set_fold_threshold_policy, "adw_flap_set_fold_threshold_policy", LIBS);
  gidLink(cast(void**)&adw_flap_set_locked, "adw_flap_set_locked", LIBS);
  gidLink(cast(void**)&adw_flap_set_modal, "adw_flap_set_modal", LIBS);
  gidLink(cast(void**)&adw_flap_set_reveal_flap, "adw_flap_set_reveal_flap", LIBS);
  gidLink(cast(void**)&adw_flap_set_reveal_params, "adw_flap_set_reveal_params", LIBS);
  gidLink(cast(void**)&adw_flap_set_separator, "adw_flap_set_separator", LIBS);
  gidLink(cast(void**)&adw_flap_set_swipe_to_close, "adw_flap_set_swipe_to_close", LIBS);
  gidLink(cast(void**)&adw_flap_set_swipe_to_open, "adw_flap_set_swipe_to_open", LIBS);
  gidLink(cast(void**)&adw_flap_set_transition_type, "adw_flap_set_transition_type", LIBS);

  // HeaderBar
  gidLink(cast(void**)&adw_header_bar_get_type, "adw_header_bar_get_type", LIBS);
  gidLink(cast(void**)&adw_header_bar_new, "adw_header_bar_new", LIBS);
  gidLink(cast(void**)&adw_header_bar_get_centering_policy, "adw_header_bar_get_centering_policy", LIBS);
  gidLink(cast(void**)&adw_header_bar_get_decoration_layout, "adw_header_bar_get_decoration_layout", LIBS);
  gidLink(cast(void**)&adw_header_bar_get_show_back_button, "adw_header_bar_get_show_back_button", LIBS);
  gidLink(cast(void**)&adw_header_bar_get_show_end_title_buttons, "adw_header_bar_get_show_end_title_buttons", LIBS);
  gidLink(cast(void**)&adw_header_bar_get_show_start_title_buttons, "adw_header_bar_get_show_start_title_buttons", LIBS);
  gidLink(cast(void**)&adw_header_bar_get_show_title, "adw_header_bar_get_show_title", LIBS);
  gidLink(cast(void**)&adw_header_bar_get_title_widget, "adw_header_bar_get_title_widget", LIBS);
  gidLink(cast(void**)&adw_header_bar_pack_end, "adw_header_bar_pack_end", LIBS);
  gidLink(cast(void**)&adw_header_bar_pack_start, "adw_header_bar_pack_start", LIBS);
  gidLink(cast(void**)&adw_header_bar_remove, "adw_header_bar_remove", LIBS);
  gidLink(cast(void**)&adw_header_bar_set_centering_policy, "adw_header_bar_set_centering_policy", LIBS);
  gidLink(cast(void**)&adw_header_bar_set_decoration_layout, "adw_header_bar_set_decoration_layout", LIBS);
  gidLink(cast(void**)&adw_header_bar_set_show_back_button, "adw_header_bar_set_show_back_button", LIBS);
  gidLink(cast(void**)&adw_header_bar_set_show_end_title_buttons, "adw_header_bar_set_show_end_title_buttons", LIBS);
  gidLink(cast(void**)&adw_header_bar_set_show_start_title_buttons, "adw_header_bar_set_show_start_title_buttons", LIBS);
  gidLink(cast(void**)&adw_header_bar_set_show_title, "adw_header_bar_set_show_title", LIBS);
  gidLink(cast(void**)&adw_header_bar_set_title_widget, "adw_header_bar_set_title_widget", LIBS);

  // Leaflet
  gidLink(cast(void**)&adw_leaflet_get_type, "adw_leaflet_get_type", LIBS);
  gidLink(cast(void**)&adw_leaflet_new, "adw_leaflet_new", LIBS);
  gidLink(cast(void**)&adw_leaflet_append, "adw_leaflet_append", LIBS);
  gidLink(cast(void**)&adw_leaflet_get_adjacent_child, "adw_leaflet_get_adjacent_child", LIBS);
  gidLink(cast(void**)&adw_leaflet_get_can_navigate_back, "adw_leaflet_get_can_navigate_back", LIBS);
  gidLink(cast(void**)&adw_leaflet_get_can_navigate_forward, "adw_leaflet_get_can_navigate_forward", LIBS);
  gidLink(cast(void**)&adw_leaflet_get_can_unfold, "adw_leaflet_get_can_unfold", LIBS);
  gidLink(cast(void**)&adw_leaflet_get_child_by_name, "adw_leaflet_get_child_by_name", LIBS);
  gidLink(cast(void**)&adw_leaflet_get_child_transition_params, "adw_leaflet_get_child_transition_params", LIBS);
  gidLink(cast(void**)&adw_leaflet_get_child_transition_running, "adw_leaflet_get_child_transition_running", LIBS);
  gidLink(cast(void**)&adw_leaflet_get_fold_threshold_policy, "adw_leaflet_get_fold_threshold_policy", LIBS);
  gidLink(cast(void**)&adw_leaflet_get_folded, "adw_leaflet_get_folded", LIBS);
  gidLink(cast(void**)&adw_leaflet_get_homogeneous, "adw_leaflet_get_homogeneous", LIBS);
  gidLink(cast(void**)&adw_leaflet_get_mode_transition_duration, "adw_leaflet_get_mode_transition_duration", LIBS);
  gidLink(cast(void**)&adw_leaflet_get_page, "adw_leaflet_get_page", LIBS);
  gidLink(cast(void**)&adw_leaflet_get_pages, "adw_leaflet_get_pages", LIBS);
  gidLink(cast(void**)&adw_leaflet_get_transition_type, "adw_leaflet_get_transition_type", LIBS);
  gidLink(cast(void**)&adw_leaflet_get_visible_child, "adw_leaflet_get_visible_child", LIBS);
  gidLink(cast(void**)&adw_leaflet_get_visible_child_name, "adw_leaflet_get_visible_child_name", LIBS);
  gidLink(cast(void**)&adw_leaflet_insert_child_after, "adw_leaflet_insert_child_after", LIBS);
  gidLink(cast(void**)&adw_leaflet_navigate, "adw_leaflet_navigate", LIBS);
  gidLink(cast(void**)&adw_leaflet_prepend, "adw_leaflet_prepend", LIBS);
  gidLink(cast(void**)&adw_leaflet_remove, "adw_leaflet_remove", LIBS);
  gidLink(cast(void**)&adw_leaflet_reorder_child_after, "adw_leaflet_reorder_child_after", LIBS);
  gidLink(cast(void**)&adw_leaflet_set_can_navigate_back, "adw_leaflet_set_can_navigate_back", LIBS);
  gidLink(cast(void**)&adw_leaflet_set_can_navigate_forward, "adw_leaflet_set_can_navigate_forward", LIBS);
  gidLink(cast(void**)&adw_leaflet_set_can_unfold, "adw_leaflet_set_can_unfold", LIBS);
  gidLink(cast(void**)&adw_leaflet_set_child_transition_params, "adw_leaflet_set_child_transition_params", LIBS);
  gidLink(cast(void**)&adw_leaflet_set_fold_threshold_policy, "adw_leaflet_set_fold_threshold_policy", LIBS);
  gidLink(cast(void**)&adw_leaflet_set_homogeneous, "adw_leaflet_set_homogeneous", LIBS);
  gidLink(cast(void**)&adw_leaflet_set_mode_transition_duration, "adw_leaflet_set_mode_transition_duration", LIBS);
  gidLink(cast(void**)&adw_leaflet_set_transition_type, "adw_leaflet_set_transition_type", LIBS);
  gidLink(cast(void**)&adw_leaflet_set_visible_child, "adw_leaflet_set_visible_child", LIBS);
  gidLink(cast(void**)&adw_leaflet_set_visible_child_name, "adw_leaflet_set_visible_child_name", LIBS);

  // LeafletPage
  gidLink(cast(void**)&adw_leaflet_page_get_type, "adw_leaflet_page_get_type", LIBS);
  gidLink(cast(void**)&adw_leaflet_page_get_child, "adw_leaflet_page_get_child", LIBS);
  gidLink(cast(void**)&adw_leaflet_page_get_name, "adw_leaflet_page_get_name", LIBS);
  gidLink(cast(void**)&adw_leaflet_page_get_navigatable, "adw_leaflet_page_get_navigatable", LIBS);
  gidLink(cast(void**)&adw_leaflet_page_set_name, "adw_leaflet_page_set_name", LIBS);
  gidLink(cast(void**)&adw_leaflet_page_set_navigatable, "adw_leaflet_page_set_navigatable", LIBS);

  // MessageDialog
  gidLink(cast(void**)&adw_message_dialog_get_type, "adw_message_dialog_get_type", LIBS);
  gidLink(cast(void**)&adw_message_dialog_new, "adw_message_dialog_new", LIBS);
  gidLink(cast(void**)&adw_message_dialog_add_response, "adw_message_dialog_add_response", LIBS);
  gidLink(cast(void**)&adw_message_dialog_add_responses, "adw_message_dialog_add_responses", LIBS);
  gidLink(cast(void**)&adw_message_dialog_choose, "adw_message_dialog_choose", LIBS);
  gidLink(cast(void**)&adw_message_dialog_choose_finish, "adw_message_dialog_choose_finish", LIBS);
  gidLink(cast(void**)&adw_message_dialog_format_body, "adw_message_dialog_format_body", LIBS);
  gidLink(cast(void**)&adw_message_dialog_format_body_markup, "adw_message_dialog_format_body_markup", LIBS);
  gidLink(cast(void**)&adw_message_dialog_format_heading, "adw_message_dialog_format_heading", LIBS);
  gidLink(cast(void**)&adw_message_dialog_format_heading_markup, "adw_message_dialog_format_heading_markup", LIBS);
  gidLink(cast(void**)&adw_message_dialog_get_body, "adw_message_dialog_get_body", LIBS);
  gidLink(cast(void**)&adw_message_dialog_get_body_use_markup, "adw_message_dialog_get_body_use_markup", LIBS);
  gidLink(cast(void**)&adw_message_dialog_get_close_response, "adw_message_dialog_get_close_response", LIBS);
  gidLink(cast(void**)&adw_message_dialog_get_default_response, "adw_message_dialog_get_default_response", LIBS);
  gidLink(cast(void**)&adw_message_dialog_get_extra_child, "adw_message_dialog_get_extra_child", LIBS);
  gidLink(cast(void**)&adw_message_dialog_get_heading, "adw_message_dialog_get_heading", LIBS);
  gidLink(cast(void**)&adw_message_dialog_get_heading_use_markup, "adw_message_dialog_get_heading_use_markup", LIBS);
  gidLink(cast(void**)&adw_message_dialog_get_response_appearance, "adw_message_dialog_get_response_appearance", LIBS);
  gidLink(cast(void**)&adw_message_dialog_get_response_enabled, "adw_message_dialog_get_response_enabled", LIBS);
  gidLink(cast(void**)&adw_message_dialog_get_response_label, "adw_message_dialog_get_response_label", LIBS);
  gidLink(cast(void**)&adw_message_dialog_has_response, "adw_message_dialog_has_response", LIBS);
  gidLink(cast(void**)&adw_message_dialog_remove_response, "adw_message_dialog_remove_response", LIBS);
  gidLink(cast(void**)&adw_message_dialog_response, "adw_message_dialog_response", LIBS);
  gidLink(cast(void**)&adw_message_dialog_set_body, "adw_message_dialog_set_body", LIBS);
  gidLink(cast(void**)&adw_message_dialog_set_body_use_markup, "adw_message_dialog_set_body_use_markup", LIBS);
  gidLink(cast(void**)&adw_message_dialog_set_close_response, "adw_message_dialog_set_close_response", LIBS);
  gidLink(cast(void**)&adw_message_dialog_set_default_response, "adw_message_dialog_set_default_response", LIBS);
  gidLink(cast(void**)&adw_message_dialog_set_extra_child, "adw_message_dialog_set_extra_child", LIBS);
  gidLink(cast(void**)&adw_message_dialog_set_heading, "adw_message_dialog_set_heading", LIBS);
  gidLink(cast(void**)&adw_message_dialog_set_heading_use_markup, "adw_message_dialog_set_heading_use_markup", LIBS);
  gidLink(cast(void**)&adw_message_dialog_set_response_appearance, "adw_message_dialog_set_response_appearance", LIBS);
  gidLink(cast(void**)&adw_message_dialog_set_response_enabled, "adw_message_dialog_set_response_enabled", LIBS);
  gidLink(cast(void**)&adw_message_dialog_set_response_label, "adw_message_dialog_set_response_label", LIBS);

  // NavigationPage
  gidLink(cast(void**)&adw_navigation_page_get_type, "adw_navigation_page_get_type", LIBS);
  gidLink(cast(void**)&adw_navigation_page_new, "adw_navigation_page_new", LIBS);
  gidLink(cast(void**)&adw_navigation_page_new_with_tag, "adw_navigation_page_new_with_tag", LIBS);
  gidLink(cast(void**)&adw_navigation_page_get_can_pop, "adw_navigation_page_get_can_pop", LIBS);
  gidLink(cast(void**)&adw_navigation_page_get_child, "adw_navigation_page_get_child", LIBS);
  gidLink(cast(void**)&adw_navigation_page_get_tag, "adw_navigation_page_get_tag", LIBS);
  gidLink(cast(void**)&adw_navigation_page_get_title, "adw_navigation_page_get_title", LIBS);
  gidLink(cast(void**)&adw_navigation_page_set_can_pop, "adw_navigation_page_set_can_pop", LIBS);
  gidLink(cast(void**)&adw_navigation_page_set_child, "adw_navigation_page_set_child", LIBS);
  gidLink(cast(void**)&adw_navigation_page_set_tag, "adw_navigation_page_set_tag", LIBS);
  gidLink(cast(void**)&adw_navigation_page_set_title, "adw_navigation_page_set_title", LIBS);

  // NavigationSplitView
  gidLink(cast(void**)&adw_navigation_split_view_get_type, "adw_navigation_split_view_get_type", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_new, "adw_navigation_split_view_new", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_get_collapsed, "adw_navigation_split_view_get_collapsed", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_get_content, "adw_navigation_split_view_get_content", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_get_max_sidebar_width, "adw_navigation_split_view_get_max_sidebar_width", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_get_min_sidebar_width, "adw_navigation_split_view_get_min_sidebar_width", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_get_show_content, "adw_navigation_split_view_get_show_content", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_get_sidebar, "adw_navigation_split_view_get_sidebar", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_get_sidebar_width_fraction, "adw_navigation_split_view_get_sidebar_width_fraction", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_get_sidebar_width_unit, "adw_navigation_split_view_get_sidebar_width_unit", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_set_collapsed, "adw_navigation_split_view_set_collapsed", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_set_content, "adw_navigation_split_view_set_content", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_set_max_sidebar_width, "adw_navigation_split_view_set_max_sidebar_width", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_set_min_sidebar_width, "adw_navigation_split_view_set_min_sidebar_width", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_set_show_content, "adw_navigation_split_view_set_show_content", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_set_sidebar, "adw_navigation_split_view_set_sidebar", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_set_sidebar_width_fraction, "adw_navigation_split_view_set_sidebar_width_fraction", LIBS);
  gidLink(cast(void**)&adw_navigation_split_view_set_sidebar_width_unit, "adw_navigation_split_view_set_sidebar_width_unit", LIBS);

  // NavigationView
  gidLink(cast(void**)&adw_navigation_view_get_type, "adw_navigation_view_get_type", LIBS);
  gidLink(cast(void**)&adw_navigation_view_new, "adw_navigation_view_new", LIBS);
  gidLink(cast(void**)&adw_navigation_view_add, "adw_navigation_view_add", LIBS);
  gidLink(cast(void**)&adw_navigation_view_find_page, "adw_navigation_view_find_page", LIBS);
  gidLink(cast(void**)&adw_navigation_view_get_animate_transitions, "adw_navigation_view_get_animate_transitions", LIBS);
  gidLink(cast(void**)&adw_navigation_view_get_navigation_stack, "adw_navigation_view_get_navigation_stack", LIBS);
  gidLink(cast(void**)&adw_navigation_view_get_pop_on_escape, "adw_navigation_view_get_pop_on_escape", LIBS);
  gidLink(cast(void**)&adw_navigation_view_get_previous_page, "adw_navigation_view_get_previous_page", LIBS);
  gidLink(cast(void**)&adw_navigation_view_get_visible_page, "adw_navigation_view_get_visible_page", LIBS);
  gidLink(cast(void**)&adw_navigation_view_pop, "adw_navigation_view_pop", LIBS);
  gidLink(cast(void**)&adw_navigation_view_pop_to_page, "adw_navigation_view_pop_to_page", LIBS);
  gidLink(cast(void**)&adw_navigation_view_pop_to_tag, "adw_navigation_view_pop_to_tag", LIBS);
  gidLink(cast(void**)&adw_navigation_view_push, "adw_navigation_view_push", LIBS);
  gidLink(cast(void**)&adw_navigation_view_push_by_tag, "adw_navigation_view_push_by_tag", LIBS);
  gidLink(cast(void**)&adw_navigation_view_remove, "adw_navigation_view_remove", LIBS);
  gidLink(cast(void**)&adw_navigation_view_replace, "adw_navigation_view_replace", LIBS);
  gidLink(cast(void**)&adw_navigation_view_replace_with_tags, "adw_navigation_view_replace_with_tags", LIBS);
  gidLink(cast(void**)&adw_navigation_view_set_animate_transitions, "adw_navigation_view_set_animate_transitions", LIBS);
  gidLink(cast(void**)&adw_navigation_view_set_pop_on_escape, "adw_navigation_view_set_pop_on_escape", LIBS);

  // OverlaySplitView
  gidLink(cast(void**)&adw_overlay_split_view_get_type, "adw_overlay_split_view_get_type", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_new, "adw_overlay_split_view_new", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_get_collapsed, "adw_overlay_split_view_get_collapsed", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_get_content, "adw_overlay_split_view_get_content", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_get_enable_hide_gesture, "adw_overlay_split_view_get_enable_hide_gesture", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_get_enable_show_gesture, "adw_overlay_split_view_get_enable_show_gesture", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_get_max_sidebar_width, "adw_overlay_split_view_get_max_sidebar_width", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_get_min_sidebar_width, "adw_overlay_split_view_get_min_sidebar_width", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_get_pin_sidebar, "adw_overlay_split_view_get_pin_sidebar", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_get_show_sidebar, "adw_overlay_split_view_get_show_sidebar", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_get_sidebar, "adw_overlay_split_view_get_sidebar", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_get_sidebar_position, "adw_overlay_split_view_get_sidebar_position", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_get_sidebar_width_fraction, "adw_overlay_split_view_get_sidebar_width_fraction", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_get_sidebar_width_unit, "adw_overlay_split_view_get_sidebar_width_unit", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_set_collapsed, "adw_overlay_split_view_set_collapsed", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_set_content, "adw_overlay_split_view_set_content", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_set_enable_hide_gesture, "adw_overlay_split_view_set_enable_hide_gesture", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_set_enable_show_gesture, "adw_overlay_split_view_set_enable_show_gesture", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_set_max_sidebar_width, "adw_overlay_split_view_set_max_sidebar_width", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_set_min_sidebar_width, "adw_overlay_split_view_set_min_sidebar_width", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_set_pin_sidebar, "adw_overlay_split_view_set_pin_sidebar", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_set_show_sidebar, "adw_overlay_split_view_set_show_sidebar", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_set_sidebar, "adw_overlay_split_view_set_sidebar", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_set_sidebar_position, "adw_overlay_split_view_set_sidebar_position", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_set_sidebar_width_fraction, "adw_overlay_split_view_set_sidebar_width_fraction", LIBS);
  gidLink(cast(void**)&adw_overlay_split_view_set_sidebar_width_unit, "adw_overlay_split_view_set_sidebar_width_unit", LIBS);

  // PasswordEntryRow
  gidLink(cast(void**)&adw_password_entry_row_get_type, "adw_password_entry_row_get_type", LIBS);
  gidLink(cast(void**)&adw_password_entry_row_new, "adw_password_entry_row_new", LIBS);

  // PreferencesDialog
  gidLink(cast(void**)&adw_preferences_dialog_get_type, "adw_preferences_dialog_get_type", LIBS);
  gidLink(cast(void**)&adw_preferences_dialog_new, "adw_preferences_dialog_new", LIBS);
  gidLink(cast(void**)&adw_preferences_dialog_add, "adw_preferences_dialog_add", LIBS);
  gidLink(cast(void**)&adw_preferences_dialog_add_toast, "adw_preferences_dialog_add_toast", LIBS);
  gidLink(cast(void**)&adw_preferences_dialog_get_search_enabled, "adw_preferences_dialog_get_search_enabled", LIBS);
  gidLink(cast(void**)&adw_preferences_dialog_get_visible_page, "adw_preferences_dialog_get_visible_page", LIBS);
  gidLink(cast(void**)&adw_preferences_dialog_get_visible_page_name, "adw_preferences_dialog_get_visible_page_name", LIBS);
  gidLink(cast(void**)&adw_preferences_dialog_pop_subpage, "adw_preferences_dialog_pop_subpage", LIBS);
  gidLink(cast(void**)&adw_preferences_dialog_push_subpage, "adw_preferences_dialog_push_subpage", LIBS);
  gidLink(cast(void**)&adw_preferences_dialog_remove, "adw_preferences_dialog_remove", LIBS);
  gidLink(cast(void**)&adw_preferences_dialog_set_search_enabled, "adw_preferences_dialog_set_search_enabled", LIBS);
  gidLink(cast(void**)&adw_preferences_dialog_set_visible_page, "adw_preferences_dialog_set_visible_page", LIBS);
  gidLink(cast(void**)&adw_preferences_dialog_set_visible_page_name, "adw_preferences_dialog_set_visible_page_name", LIBS);

  // PreferencesGroup
  gidLink(cast(void**)&adw_preferences_group_get_type, "adw_preferences_group_get_type", LIBS);
  gidLink(cast(void**)&adw_preferences_group_new, "adw_preferences_group_new", LIBS);
  gidLink(cast(void**)&adw_preferences_group_add, "adw_preferences_group_add", LIBS);
  gidLink(cast(void**)&adw_preferences_group_get_description, "adw_preferences_group_get_description", LIBS);
  gidLink(cast(void**)&adw_preferences_group_get_header_suffix, "adw_preferences_group_get_header_suffix", LIBS);
  gidLink(cast(void**)&adw_preferences_group_get_title, "adw_preferences_group_get_title", LIBS);
  gidLink(cast(void**)&adw_preferences_group_remove, "adw_preferences_group_remove", LIBS);
  gidLink(cast(void**)&adw_preferences_group_set_description, "adw_preferences_group_set_description", LIBS);
  gidLink(cast(void**)&adw_preferences_group_set_header_suffix, "adw_preferences_group_set_header_suffix", LIBS);
  gidLink(cast(void**)&adw_preferences_group_set_title, "adw_preferences_group_set_title", LIBS);

  // PreferencesPage
  gidLink(cast(void**)&adw_preferences_page_get_type, "adw_preferences_page_get_type", LIBS);
  gidLink(cast(void**)&adw_preferences_page_new, "adw_preferences_page_new", LIBS);
  gidLink(cast(void**)&adw_preferences_page_add, "adw_preferences_page_add", LIBS);
  gidLink(cast(void**)&adw_preferences_page_get_description, "adw_preferences_page_get_description", LIBS);
  gidLink(cast(void**)&adw_preferences_page_get_icon_name, "adw_preferences_page_get_icon_name", LIBS);
  gidLink(cast(void**)&adw_preferences_page_get_name, "adw_preferences_page_get_name", LIBS);
  gidLink(cast(void**)&adw_preferences_page_get_title, "adw_preferences_page_get_title", LIBS);
  gidLink(cast(void**)&adw_preferences_page_get_use_underline, "adw_preferences_page_get_use_underline", LIBS);
  gidLink(cast(void**)&adw_preferences_page_remove, "adw_preferences_page_remove", LIBS);
  gidLink(cast(void**)&adw_preferences_page_scroll_to_top, "adw_preferences_page_scroll_to_top", LIBS);
  gidLink(cast(void**)&adw_preferences_page_set_description, "adw_preferences_page_set_description", LIBS);
  gidLink(cast(void**)&adw_preferences_page_set_icon_name, "adw_preferences_page_set_icon_name", LIBS);
  gidLink(cast(void**)&adw_preferences_page_set_name, "adw_preferences_page_set_name", LIBS);
  gidLink(cast(void**)&adw_preferences_page_set_title, "adw_preferences_page_set_title", LIBS);
  gidLink(cast(void**)&adw_preferences_page_set_use_underline, "adw_preferences_page_set_use_underline", LIBS);

  // PreferencesRow
  gidLink(cast(void**)&adw_preferences_row_get_type, "adw_preferences_row_get_type", LIBS);
  gidLink(cast(void**)&adw_preferences_row_new, "adw_preferences_row_new", LIBS);
  gidLink(cast(void**)&adw_preferences_row_get_title, "adw_preferences_row_get_title", LIBS);
  gidLink(cast(void**)&adw_preferences_row_get_title_selectable, "adw_preferences_row_get_title_selectable", LIBS);
  gidLink(cast(void**)&adw_preferences_row_get_use_markup, "adw_preferences_row_get_use_markup", LIBS);
  gidLink(cast(void**)&adw_preferences_row_get_use_underline, "adw_preferences_row_get_use_underline", LIBS);
  gidLink(cast(void**)&adw_preferences_row_set_title, "adw_preferences_row_set_title", LIBS);
  gidLink(cast(void**)&adw_preferences_row_set_title_selectable, "adw_preferences_row_set_title_selectable", LIBS);
  gidLink(cast(void**)&adw_preferences_row_set_use_markup, "adw_preferences_row_set_use_markup", LIBS);
  gidLink(cast(void**)&adw_preferences_row_set_use_underline, "adw_preferences_row_set_use_underline", LIBS);

  // PreferencesWindow
  gidLink(cast(void**)&adw_preferences_window_get_type, "adw_preferences_window_get_type", LIBS);
  gidLink(cast(void**)&adw_preferences_window_new, "adw_preferences_window_new", LIBS);
  gidLink(cast(void**)&adw_preferences_window_add, "adw_preferences_window_add", LIBS);
  gidLink(cast(void**)&adw_preferences_window_add_toast, "adw_preferences_window_add_toast", LIBS);
  gidLink(cast(void**)&adw_preferences_window_close_subpage, "adw_preferences_window_close_subpage", LIBS);
  gidLink(cast(void**)&adw_preferences_window_get_can_navigate_back, "adw_preferences_window_get_can_navigate_back", LIBS);
  gidLink(cast(void**)&adw_preferences_window_get_search_enabled, "adw_preferences_window_get_search_enabled", LIBS);
  gidLink(cast(void**)&adw_preferences_window_get_visible_page, "adw_preferences_window_get_visible_page", LIBS);
  gidLink(cast(void**)&adw_preferences_window_get_visible_page_name, "adw_preferences_window_get_visible_page_name", LIBS);
  gidLink(cast(void**)&adw_preferences_window_pop_subpage, "adw_preferences_window_pop_subpage", LIBS);
  gidLink(cast(void**)&adw_preferences_window_present_subpage, "adw_preferences_window_present_subpage", LIBS);
  gidLink(cast(void**)&adw_preferences_window_push_subpage, "adw_preferences_window_push_subpage", LIBS);
  gidLink(cast(void**)&adw_preferences_window_remove, "adw_preferences_window_remove", LIBS);
  gidLink(cast(void**)&adw_preferences_window_set_can_navigate_back, "adw_preferences_window_set_can_navigate_back", LIBS);
  gidLink(cast(void**)&adw_preferences_window_set_search_enabled, "adw_preferences_window_set_search_enabled", LIBS);
  gidLink(cast(void**)&adw_preferences_window_set_visible_page, "adw_preferences_window_set_visible_page", LIBS);
  gidLink(cast(void**)&adw_preferences_window_set_visible_page_name, "adw_preferences_window_set_visible_page_name", LIBS);

  // PropertyAnimationTarget
  gidLink(cast(void**)&adw_property_animation_target_get_type, "adw_property_animation_target_get_type", LIBS);
  gidLink(cast(void**)&adw_property_animation_target_new, "adw_property_animation_target_new", LIBS);
  gidLink(cast(void**)&adw_property_animation_target_new_for_pspec, "adw_property_animation_target_new_for_pspec", LIBS);
  gidLink(cast(void**)&adw_property_animation_target_get_object, "adw_property_animation_target_get_object", LIBS);
  gidLink(cast(void**)&adw_property_animation_target_get_pspec, "adw_property_animation_target_get_pspec", LIBS);

  // SpinRow
  gidLink(cast(void**)&adw_spin_row_get_type, "adw_spin_row_get_type", LIBS);
  gidLink(cast(void**)&adw_spin_row_new, "adw_spin_row_new", LIBS);
  gidLink(cast(void**)&adw_spin_row_new_with_range, "adw_spin_row_new_with_range", LIBS);
  gidLink(cast(void**)&adw_spin_row_configure, "adw_spin_row_configure", LIBS);
  gidLink(cast(void**)&adw_spin_row_get_adjustment, "adw_spin_row_get_adjustment", LIBS);
  gidLink(cast(void**)&adw_spin_row_get_climb_rate, "adw_spin_row_get_climb_rate", LIBS);
  gidLink(cast(void**)&adw_spin_row_get_digits, "adw_spin_row_get_digits", LIBS);
  gidLink(cast(void**)&adw_spin_row_get_numeric, "adw_spin_row_get_numeric", LIBS);
  gidLink(cast(void**)&adw_spin_row_get_snap_to_ticks, "adw_spin_row_get_snap_to_ticks", LIBS);
  gidLink(cast(void**)&adw_spin_row_get_update_policy, "adw_spin_row_get_update_policy", LIBS);
  gidLink(cast(void**)&adw_spin_row_get_value, "adw_spin_row_get_value", LIBS);
  gidLink(cast(void**)&adw_spin_row_get_wrap, "adw_spin_row_get_wrap", LIBS);
  gidLink(cast(void**)&adw_spin_row_set_adjustment, "adw_spin_row_set_adjustment", LIBS);
  gidLink(cast(void**)&adw_spin_row_set_climb_rate, "adw_spin_row_set_climb_rate", LIBS);
  gidLink(cast(void**)&adw_spin_row_set_digits, "adw_spin_row_set_digits", LIBS);
  gidLink(cast(void**)&adw_spin_row_set_numeric, "adw_spin_row_set_numeric", LIBS);
  gidLink(cast(void**)&adw_spin_row_set_range, "adw_spin_row_set_range", LIBS);
  gidLink(cast(void**)&adw_spin_row_set_snap_to_ticks, "adw_spin_row_set_snap_to_ticks", LIBS);
  gidLink(cast(void**)&adw_spin_row_set_update_policy, "adw_spin_row_set_update_policy", LIBS);
  gidLink(cast(void**)&adw_spin_row_set_value, "adw_spin_row_set_value", LIBS);
  gidLink(cast(void**)&adw_spin_row_set_wrap, "adw_spin_row_set_wrap", LIBS);
  gidLink(cast(void**)&adw_spin_row_update, "adw_spin_row_update", LIBS);

  // SplitButton
  gidLink(cast(void**)&adw_split_button_get_type, "adw_split_button_get_type", LIBS);
  gidLink(cast(void**)&adw_split_button_new, "adw_split_button_new", LIBS);
  gidLink(cast(void**)&adw_split_button_get_can_shrink, "adw_split_button_get_can_shrink", LIBS);
  gidLink(cast(void**)&adw_split_button_get_child, "adw_split_button_get_child", LIBS);
  gidLink(cast(void**)&adw_split_button_get_direction, "adw_split_button_get_direction", LIBS);
  gidLink(cast(void**)&adw_split_button_get_dropdown_tooltip, "adw_split_button_get_dropdown_tooltip", LIBS);
  gidLink(cast(void**)&adw_split_button_get_icon_name, "adw_split_button_get_icon_name", LIBS);
  gidLink(cast(void**)&adw_split_button_get_label, "adw_split_button_get_label", LIBS);
  gidLink(cast(void**)&adw_split_button_get_menu_model, "adw_split_button_get_menu_model", LIBS);
  gidLink(cast(void**)&adw_split_button_get_popover, "adw_split_button_get_popover", LIBS);
  gidLink(cast(void**)&adw_split_button_get_use_underline, "adw_split_button_get_use_underline", LIBS);
  gidLink(cast(void**)&adw_split_button_popdown, "adw_split_button_popdown", LIBS);
  gidLink(cast(void**)&adw_split_button_popup, "adw_split_button_popup", LIBS);
  gidLink(cast(void**)&adw_split_button_set_can_shrink, "adw_split_button_set_can_shrink", LIBS);
  gidLink(cast(void**)&adw_split_button_set_child, "adw_split_button_set_child", LIBS);
  gidLink(cast(void**)&adw_split_button_set_direction, "adw_split_button_set_direction", LIBS);
  gidLink(cast(void**)&adw_split_button_set_dropdown_tooltip, "adw_split_button_set_dropdown_tooltip", LIBS);
  gidLink(cast(void**)&adw_split_button_set_icon_name, "adw_split_button_set_icon_name", LIBS);
  gidLink(cast(void**)&adw_split_button_set_label, "adw_split_button_set_label", LIBS);
  gidLink(cast(void**)&adw_split_button_set_menu_model, "adw_split_button_set_menu_model", LIBS);
  gidLink(cast(void**)&adw_split_button_set_popover, "adw_split_button_set_popover", LIBS);
  gidLink(cast(void**)&adw_split_button_set_use_underline, "adw_split_button_set_use_underline", LIBS);

  // SpringAnimation
  gidLink(cast(void**)&adw_spring_animation_get_type, "adw_spring_animation_get_type", LIBS);
  gidLink(cast(void**)&adw_spring_animation_new, "adw_spring_animation_new", LIBS);
  gidLink(cast(void**)&adw_spring_animation_calculate_value, "adw_spring_animation_calculate_value", LIBS);
  gidLink(cast(void**)&adw_spring_animation_calculate_velocity, "adw_spring_animation_calculate_velocity", LIBS);
  gidLink(cast(void**)&adw_spring_animation_get_clamp, "adw_spring_animation_get_clamp", LIBS);
  gidLink(cast(void**)&adw_spring_animation_get_epsilon, "adw_spring_animation_get_epsilon", LIBS);
  gidLink(cast(void**)&adw_spring_animation_get_estimated_duration, "adw_spring_animation_get_estimated_duration", LIBS);
  gidLink(cast(void**)&adw_spring_animation_get_initial_velocity, "adw_spring_animation_get_initial_velocity", LIBS);
  gidLink(cast(void**)&adw_spring_animation_get_spring_params, "adw_spring_animation_get_spring_params", LIBS);
  gidLink(cast(void**)&adw_spring_animation_get_value_from, "adw_spring_animation_get_value_from", LIBS);
  gidLink(cast(void**)&adw_spring_animation_get_value_to, "adw_spring_animation_get_value_to", LIBS);
  gidLink(cast(void**)&adw_spring_animation_get_velocity, "adw_spring_animation_get_velocity", LIBS);
  gidLink(cast(void**)&adw_spring_animation_set_clamp, "adw_spring_animation_set_clamp", LIBS);
  gidLink(cast(void**)&adw_spring_animation_set_epsilon, "adw_spring_animation_set_epsilon", LIBS);
  gidLink(cast(void**)&adw_spring_animation_set_initial_velocity, "adw_spring_animation_set_initial_velocity", LIBS);
  gidLink(cast(void**)&adw_spring_animation_set_spring_params, "adw_spring_animation_set_spring_params", LIBS);
  gidLink(cast(void**)&adw_spring_animation_set_value_from, "adw_spring_animation_set_value_from", LIBS);
  gidLink(cast(void**)&adw_spring_animation_set_value_to, "adw_spring_animation_set_value_to", LIBS);

  // SpringParams
  gidLink(cast(void**)&adw_spring_params_get_type, "adw_spring_params_get_type", LIBS);
  gidLink(cast(void**)&adw_spring_params_new, "adw_spring_params_new", LIBS);
  gidLink(cast(void**)&adw_spring_params_new_full, "adw_spring_params_new_full", LIBS);
  gidLink(cast(void**)&adw_spring_params_get_damping, "adw_spring_params_get_damping", LIBS);
  gidLink(cast(void**)&adw_spring_params_get_damping_ratio, "adw_spring_params_get_damping_ratio", LIBS);
  gidLink(cast(void**)&adw_spring_params_get_mass, "adw_spring_params_get_mass", LIBS);
  gidLink(cast(void**)&adw_spring_params_get_stiffness, "adw_spring_params_get_stiffness", LIBS);
  gidLink(cast(void**)&adw_spring_params_ref, "adw_spring_params_ref", LIBS);
  gidLink(cast(void**)&adw_spring_params_unref, "adw_spring_params_unref", LIBS);

  // Squeezer
  gidLink(cast(void**)&adw_squeezer_get_type, "adw_squeezer_get_type", LIBS);
  gidLink(cast(void**)&adw_squeezer_new, "adw_squeezer_new", LIBS);
  gidLink(cast(void**)&adw_squeezer_add, "adw_squeezer_add", LIBS);
  gidLink(cast(void**)&adw_squeezer_get_allow_none, "adw_squeezer_get_allow_none", LIBS);
  gidLink(cast(void**)&adw_squeezer_get_homogeneous, "adw_squeezer_get_homogeneous", LIBS);
  gidLink(cast(void**)&adw_squeezer_get_interpolate_size, "adw_squeezer_get_interpolate_size", LIBS);
  gidLink(cast(void**)&adw_squeezer_get_page, "adw_squeezer_get_page", LIBS);
  gidLink(cast(void**)&adw_squeezer_get_pages, "adw_squeezer_get_pages", LIBS);
  gidLink(cast(void**)&adw_squeezer_get_switch_threshold_policy, "adw_squeezer_get_switch_threshold_policy", LIBS);
  gidLink(cast(void**)&adw_squeezer_get_transition_duration, "adw_squeezer_get_transition_duration", LIBS);
  gidLink(cast(void**)&adw_squeezer_get_transition_running, "adw_squeezer_get_transition_running", LIBS);
  gidLink(cast(void**)&adw_squeezer_get_transition_type, "adw_squeezer_get_transition_type", LIBS);
  gidLink(cast(void**)&adw_squeezer_get_visible_child, "adw_squeezer_get_visible_child", LIBS);
  gidLink(cast(void**)&adw_squeezer_get_xalign, "adw_squeezer_get_xalign", LIBS);
  gidLink(cast(void**)&adw_squeezer_get_yalign, "adw_squeezer_get_yalign", LIBS);
  gidLink(cast(void**)&adw_squeezer_remove, "adw_squeezer_remove", LIBS);
  gidLink(cast(void**)&adw_squeezer_set_allow_none, "adw_squeezer_set_allow_none", LIBS);
  gidLink(cast(void**)&adw_squeezer_set_homogeneous, "adw_squeezer_set_homogeneous", LIBS);
  gidLink(cast(void**)&adw_squeezer_set_interpolate_size, "adw_squeezer_set_interpolate_size", LIBS);
  gidLink(cast(void**)&adw_squeezer_set_switch_threshold_policy, "adw_squeezer_set_switch_threshold_policy", LIBS);
  gidLink(cast(void**)&adw_squeezer_set_transition_duration, "adw_squeezer_set_transition_duration", LIBS);
  gidLink(cast(void**)&adw_squeezer_set_transition_type, "adw_squeezer_set_transition_type", LIBS);
  gidLink(cast(void**)&adw_squeezer_set_xalign, "adw_squeezer_set_xalign", LIBS);
  gidLink(cast(void**)&adw_squeezer_set_yalign, "adw_squeezer_set_yalign", LIBS);

  // SqueezerPage
  gidLink(cast(void**)&adw_squeezer_page_get_type, "adw_squeezer_page_get_type", LIBS);
  gidLink(cast(void**)&adw_squeezer_page_get_child, "adw_squeezer_page_get_child", LIBS);
  gidLink(cast(void**)&adw_squeezer_page_get_enabled, "adw_squeezer_page_get_enabled", LIBS);
  gidLink(cast(void**)&adw_squeezer_page_set_enabled, "adw_squeezer_page_set_enabled", LIBS);

  // StatusPage
  gidLink(cast(void**)&adw_status_page_get_type, "adw_status_page_get_type", LIBS);
  gidLink(cast(void**)&adw_status_page_new, "adw_status_page_new", LIBS);
  gidLink(cast(void**)&adw_status_page_get_child, "adw_status_page_get_child", LIBS);
  gidLink(cast(void**)&adw_status_page_get_description, "adw_status_page_get_description", LIBS);
  gidLink(cast(void**)&adw_status_page_get_icon_name, "adw_status_page_get_icon_name", LIBS);
  gidLink(cast(void**)&adw_status_page_get_paintable, "adw_status_page_get_paintable", LIBS);
  gidLink(cast(void**)&adw_status_page_get_title, "adw_status_page_get_title", LIBS);
  gidLink(cast(void**)&adw_status_page_set_child, "adw_status_page_set_child", LIBS);
  gidLink(cast(void**)&adw_status_page_set_description, "adw_status_page_set_description", LIBS);
  gidLink(cast(void**)&adw_status_page_set_icon_name, "adw_status_page_set_icon_name", LIBS);
  gidLink(cast(void**)&adw_status_page_set_paintable, "adw_status_page_set_paintable", LIBS);
  gidLink(cast(void**)&adw_status_page_set_title, "adw_status_page_set_title", LIBS);

  // StyleManager
  gidLink(cast(void**)&adw_style_manager_get_type, "adw_style_manager_get_type", LIBS);
  gidLink(cast(void**)&adw_style_manager_get_default, "adw_style_manager_get_default", LIBS);
  gidLink(cast(void**)&adw_style_manager_get_for_display, "adw_style_manager_get_for_display", LIBS);
  gidLink(cast(void**)&adw_style_manager_get_color_scheme, "adw_style_manager_get_color_scheme", LIBS);
  gidLink(cast(void**)&adw_style_manager_get_dark, "adw_style_manager_get_dark", LIBS);
  gidLink(cast(void**)&adw_style_manager_get_display, "adw_style_manager_get_display", LIBS);
  gidLink(cast(void**)&adw_style_manager_get_high_contrast, "adw_style_manager_get_high_contrast", LIBS);
  gidLink(cast(void**)&adw_style_manager_get_system_supports_color_schemes, "adw_style_manager_get_system_supports_color_schemes", LIBS);
  gidLink(cast(void**)&adw_style_manager_set_color_scheme, "adw_style_manager_set_color_scheme", LIBS);

  // SwipeTracker
  gidLink(cast(void**)&adw_swipe_tracker_get_type, "adw_swipe_tracker_get_type", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_new, "adw_swipe_tracker_new", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_get_allow_long_swipes, "adw_swipe_tracker_get_allow_long_swipes", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_get_allow_mouse_drag, "adw_swipe_tracker_get_allow_mouse_drag", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_get_allow_window_handle, "adw_swipe_tracker_get_allow_window_handle", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_get_enabled, "adw_swipe_tracker_get_enabled", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_get_lower_overshoot, "adw_swipe_tracker_get_lower_overshoot", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_get_reversed, "adw_swipe_tracker_get_reversed", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_get_swipeable, "adw_swipe_tracker_get_swipeable", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_get_upper_overshoot, "adw_swipe_tracker_get_upper_overshoot", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_set_allow_long_swipes, "adw_swipe_tracker_set_allow_long_swipes", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_set_allow_mouse_drag, "adw_swipe_tracker_set_allow_mouse_drag", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_set_allow_window_handle, "adw_swipe_tracker_set_allow_window_handle", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_set_enabled, "adw_swipe_tracker_set_enabled", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_set_lower_overshoot, "adw_swipe_tracker_set_lower_overshoot", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_set_reversed, "adw_swipe_tracker_set_reversed", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_set_upper_overshoot, "adw_swipe_tracker_set_upper_overshoot", LIBS);
  gidLink(cast(void**)&adw_swipe_tracker_shift_position, "adw_swipe_tracker_shift_position", LIBS);

  // Swipeable
  gidLink(cast(void**)&adw_swipeable_get_type, "adw_swipeable_get_type", LIBS);
  gidLink(cast(void**)&adw_swipeable_get_cancel_progress, "adw_swipeable_get_cancel_progress", LIBS);
  gidLink(cast(void**)&adw_swipeable_get_distance, "adw_swipeable_get_distance", LIBS);
  gidLink(cast(void**)&adw_swipeable_get_progress, "adw_swipeable_get_progress", LIBS);
  gidLink(cast(void**)&adw_swipeable_get_snap_points, "adw_swipeable_get_snap_points", LIBS);
  gidLink(cast(void**)&adw_swipeable_get_swipe_area, "adw_swipeable_get_swipe_area", LIBS);

  // SwitchRow
  gidLink(cast(void**)&adw_switch_row_get_type, "adw_switch_row_get_type", LIBS);
  gidLink(cast(void**)&adw_switch_row_new, "adw_switch_row_new", LIBS);
  gidLink(cast(void**)&adw_switch_row_get_active, "adw_switch_row_get_active", LIBS);
  gidLink(cast(void**)&adw_switch_row_set_active, "adw_switch_row_set_active", LIBS);

  // TabBar
  gidLink(cast(void**)&adw_tab_bar_get_type, "adw_tab_bar_get_type", LIBS);
  gidLink(cast(void**)&adw_tab_bar_new, "adw_tab_bar_new", LIBS);
  gidLink(cast(void**)&adw_tab_bar_get_autohide, "adw_tab_bar_get_autohide", LIBS);
  gidLink(cast(void**)&adw_tab_bar_get_end_action_widget, "adw_tab_bar_get_end_action_widget", LIBS);
  gidLink(cast(void**)&adw_tab_bar_get_expand_tabs, "adw_tab_bar_get_expand_tabs", LIBS);
  gidLink(cast(void**)&adw_tab_bar_get_extra_drag_preferred_action, "adw_tab_bar_get_extra_drag_preferred_action", LIBS);
  gidLink(cast(void**)&adw_tab_bar_get_extra_drag_preload, "adw_tab_bar_get_extra_drag_preload", LIBS);
  gidLink(cast(void**)&adw_tab_bar_get_inverted, "adw_tab_bar_get_inverted", LIBS);
  gidLink(cast(void**)&adw_tab_bar_get_is_overflowing, "adw_tab_bar_get_is_overflowing", LIBS);
  gidLink(cast(void**)&adw_tab_bar_get_start_action_widget, "adw_tab_bar_get_start_action_widget", LIBS);
  gidLink(cast(void**)&adw_tab_bar_get_tabs_revealed, "adw_tab_bar_get_tabs_revealed", LIBS);
  gidLink(cast(void**)&adw_tab_bar_get_view, "adw_tab_bar_get_view", LIBS);
  gidLink(cast(void**)&adw_tab_bar_set_autohide, "adw_tab_bar_set_autohide", LIBS);
  gidLink(cast(void**)&adw_tab_bar_set_end_action_widget, "adw_tab_bar_set_end_action_widget", LIBS);
  gidLink(cast(void**)&adw_tab_bar_set_expand_tabs, "adw_tab_bar_set_expand_tabs", LIBS);
  gidLink(cast(void**)&adw_tab_bar_set_extra_drag_preload, "adw_tab_bar_set_extra_drag_preload", LIBS);
  gidLink(cast(void**)&adw_tab_bar_set_inverted, "adw_tab_bar_set_inverted", LIBS);
  gidLink(cast(void**)&adw_tab_bar_set_start_action_widget, "adw_tab_bar_set_start_action_widget", LIBS);
  gidLink(cast(void**)&adw_tab_bar_set_view, "adw_tab_bar_set_view", LIBS);
  gidLink(cast(void**)&adw_tab_bar_setup_extra_drop_target, "adw_tab_bar_setup_extra_drop_target", LIBS);

  // TabButton
  gidLink(cast(void**)&adw_tab_button_get_type, "adw_tab_button_get_type", LIBS);
  gidLink(cast(void**)&adw_tab_button_new, "adw_tab_button_new", LIBS);
  gidLink(cast(void**)&adw_tab_button_get_view, "adw_tab_button_get_view", LIBS);
  gidLink(cast(void**)&adw_tab_button_set_view, "adw_tab_button_set_view", LIBS);

  // TabOverview
  gidLink(cast(void**)&adw_tab_overview_get_type, "adw_tab_overview_get_type", LIBS);
  gidLink(cast(void**)&adw_tab_overview_new, "adw_tab_overview_new", LIBS);
  gidLink(cast(void**)&adw_tab_overview_get_child, "adw_tab_overview_get_child", LIBS);
  gidLink(cast(void**)&adw_tab_overview_get_enable_new_tab, "adw_tab_overview_get_enable_new_tab", LIBS);
  gidLink(cast(void**)&adw_tab_overview_get_enable_search, "adw_tab_overview_get_enable_search", LIBS);
  gidLink(cast(void**)&adw_tab_overview_get_extra_drag_preferred_action, "adw_tab_overview_get_extra_drag_preferred_action", LIBS);
  gidLink(cast(void**)&adw_tab_overview_get_extra_drag_preload, "adw_tab_overview_get_extra_drag_preload", LIBS);
  gidLink(cast(void**)&adw_tab_overview_get_inverted, "adw_tab_overview_get_inverted", LIBS);
  gidLink(cast(void**)&adw_tab_overview_get_open, "adw_tab_overview_get_open", LIBS);
  gidLink(cast(void**)&adw_tab_overview_get_search_active, "adw_tab_overview_get_search_active", LIBS);
  gidLink(cast(void**)&adw_tab_overview_get_secondary_menu, "adw_tab_overview_get_secondary_menu", LIBS);
  gidLink(cast(void**)&adw_tab_overview_get_show_end_title_buttons, "adw_tab_overview_get_show_end_title_buttons", LIBS);
  gidLink(cast(void**)&adw_tab_overview_get_show_start_title_buttons, "adw_tab_overview_get_show_start_title_buttons", LIBS);
  gidLink(cast(void**)&adw_tab_overview_get_view, "adw_tab_overview_get_view", LIBS);
  gidLink(cast(void**)&adw_tab_overview_set_child, "adw_tab_overview_set_child", LIBS);
  gidLink(cast(void**)&adw_tab_overview_set_enable_new_tab, "adw_tab_overview_set_enable_new_tab", LIBS);
  gidLink(cast(void**)&adw_tab_overview_set_enable_search, "adw_tab_overview_set_enable_search", LIBS);
  gidLink(cast(void**)&adw_tab_overview_set_extra_drag_preload, "adw_tab_overview_set_extra_drag_preload", LIBS);
  gidLink(cast(void**)&adw_tab_overview_set_inverted, "adw_tab_overview_set_inverted", LIBS);
  gidLink(cast(void**)&adw_tab_overview_set_open, "adw_tab_overview_set_open", LIBS);
  gidLink(cast(void**)&adw_tab_overview_set_secondary_menu, "adw_tab_overview_set_secondary_menu", LIBS);
  gidLink(cast(void**)&adw_tab_overview_set_show_end_title_buttons, "adw_tab_overview_set_show_end_title_buttons", LIBS);
  gidLink(cast(void**)&adw_tab_overview_set_show_start_title_buttons, "adw_tab_overview_set_show_start_title_buttons", LIBS);
  gidLink(cast(void**)&adw_tab_overview_set_view, "adw_tab_overview_set_view", LIBS);
  gidLink(cast(void**)&adw_tab_overview_setup_extra_drop_target, "adw_tab_overview_setup_extra_drop_target", LIBS);

  // TabPage
  gidLink(cast(void**)&adw_tab_page_get_type, "adw_tab_page_get_type", LIBS);
  gidLink(cast(void**)&adw_tab_page_get_child, "adw_tab_page_get_child", LIBS);
  gidLink(cast(void**)&adw_tab_page_get_icon, "adw_tab_page_get_icon", LIBS);
  gidLink(cast(void**)&adw_tab_page_get_indicator_activatable, "adw_tab_page_get_indicator_activatable", LIBS);
  gidLink(cast(void**)&adw_tab_page_get_indicator_icon, "adw_tab_page_get_indicator_icon", LIBS);
  gidLink(cast(void**)&adw_tab_page_get_indicator_tooltip, "adw_tab_page_get_indicator_tooltip", LIBS);
  gidLink(cast(void**)&adw_tab_page_get_keyword, "adw_tab_page_get_keyword", LIBS);
  gidLink(cast(void**)&adw_tab_page_get_live_thumbnail, "adw_tab_page_get_live_thumbnail", LIBS);
  gidLink(cast(void**)&adw_tab_page_get_loading, "adw_tab_page_get_loading", LIBS);
  gidLink(cast(void**)&adw_tab_page_get_needs_attention, "adw_tab_page_get_needs_attention", LIBS);
  gidLink(cast(void**)&adw_tab_page_get_parent, "adw_tab_page_get_parent", LIBS);
  gidLink(cast(void**)&adw_tab_page_get_pinned, "adw_tab_page_get_pinned", LIBS);
  gidLink(cast(void**)&adw_tab_page_get_selected, "adw_tab_page_get_selected", LIBS);
  gidLink(cast(void**)&adw_tab_page_get_thumbnail_xalign, "adw_tab_page_get_thumbnail_xalign", LIBS);
  gidLink(cast(void**)&adw_tab_page_get_thumbnail_yalign, "adw_tab_page_get_thumbnail_yalign", LIBS);
  gidLink(cast(void**)&adw_tab_page_get_title, "adw_tab_page_get_title", LIBS);
  gidLink(cast(void**)&adw_tab_page_get_tooltip, "adw_tab_page_get_tooltip", LIBS);
  gidLink(cast(void**)&adw_tab_page_invalidate_thumbnail, "adw_tab_page_invalidate_thumbnail", LIBS);
  gidLink(cast(void**)&adw_tab_page_set_icon, "adw_tab_page_set_icon", LIBS);
  gidLink(cast(void**)&adw_tab_page_set_indicator_activatable, "adw_tab_page_set_indicator_activatable", LIBS);
  gidLink(cast(void**)&adw_tab_page_set_indicator_icon, "adw_tab_page_set_indicator_icon", LIBS);
  gidLink(cast(void**)&adw_tab_page_set_indicator_tooltip, "adw_tab_page_set_indicator_tooltip", LIBS);
  gidLink(cast(void**)&adw_tab_page_set_keyword, "adw_tab_page_set_keyword", LIBS);
  gidLink(cast(void**)&adw_tab_page_set_live_thumbnail, "adw_tab_page_set_live_thumbnail", LIBS);
  gidLink(cast(void**)&adw_tab_page_set_loading, "adw_tab_page_set_loading", LIBS);
  gidLink(cast(void**)&adw_tab_page_set_needs_attention, "adw_tab_page_set_needs_attention", LIBS);
  gidLink(cast(void**)&adw_tab_page_set_thumbnail_xalign, "adw_tab_page_set_thumbnail_xalign", LIBS);
  gidLink(cast(void**)&adw_tab_page_set_thumbnail_yalign, "adw_tab_page_set_thumbnail_yalign", LIBS);
  gidLink(cast(void**)&adw_tab_page_set_title, "adw_tab_page_set_title", LIBS);
  gidLink(cast(void**)&adw_tab_page_set_tooltip, "adw_tab_page_set_tooltip", LIBS);

  // TabView
  gidLink(cast(void**)&adw_tab_view_get_type, "adw_tab_view_get_type", LIBS);
  gidLink(cast(void**)&adw_tab_view_new, "adw_tab_view_new", LIBS);
  gidLink(cast(void**)&adw_tab_view_add_page, "adw_tab_view_add_page", LIBS);
  gidLink(cast(void**)&adw_tab_view_add_shortcuts, "adw_tab_view_add_shortcuts", LIBS);
  gidLink(cast(void**)&adw_tab_view_append, "adw_tab_view_append", LIBS);
  gidLink(cast(void**)&adw_tab_view_append_pinned, "adw_tab_view_append_pinned", LIBS);
  gidLink(cast(void**)&adw_tab_view_close_other_pages, "adw_tab_view_close_other_pages", LIBS);
  gidLink(cast(void**)&adw_tab_view_close_page, "adw_tab_view_close_page", LIBS);
  gidLink(cast(void**)&adw_tab_view_close_page_finish, "adw_tab_view_close_page_finish", LIBS);
  gidLink(cast(void**)&adw_tab_view_close_pages_after, "adw_tab_view_close_pages_after", LIBS);
  gidLink(cast(void**)&adw_tab_view_close_pages_before, "adw_tab_view_close_pages_before", LIBS);
  gidLink(cast(void**)&adw_tab_view_get_default_icon, "adw_tab_view_get_default_icon", LIBS);
  gidLink(cast(void**)&adw_tab_view_get_is_transferring_page, "adw_tab_view_get_is_transferring_page", LIBS);
  gidLink(cast(void**)&adw_tab_view_get_menu_model, "adw_tab_view_get_menu_model", LIBS);
  gidLink(cast(void**)&adw_tab_view_get_n_pages, "adw_tab_view_get_n_pages", LIBS);
  gidLink(cast(void**)&adw_tab_view_get_n_pinned_pages, "adw_tab_view_get_n_pinned_pages", LIBS);
  gidLink(cast(void**)&adw_tab_view_get_nth_page, "adw_tab_view_get_nth_page", LIBS);
  gidLink(cast(void**)&adw_tab_view_get_page, "adw_tab_view_get_page", LIBS);
  gidLink(cast(void**)&adw_tab_view_get_page_position, "adw_tab_view_get_page_position", LIBS);
  gidLink(cast(void**)&adw_tab_view_get_pages, "adw_tab_view_get_pages", LIBS);
  gidLink(cast(void**)&adw_tab_view_get_selected_page, "adw_tab_view_get_selected_page", LIBS);
  gidLink(cast(void**)&adw_tab_view_get_shortcuts, "adw_tab_view_get_shortcuts", LIBS);
  gidLink(cast(void**)&adw_tab_view_insert, "adw_tab_view_insert", LIBS);
  gidLink(cast(void**)&adw_tab_view_insert_pinned, "adw_tab_view_insert_pinned", LIBS);
  gidLink(cast(void**)&adw_tab_view_invalidate_thumbnails, "adw_tab_view_invalidate_thumbnails", LIBS);
  gidLink(cast(void**)&adw_tab_view_prepend, "adw_tab_view_prepend", LIBS);
  gidLink(cast(void**)&adw_tab_view_prepend_pinned, "adw_tab_view_prepend_pinned", LIBS);
  gidLink(cast(void**)&adw_tab_view_remove_shortcuts, "adw_tab_view_remove_shortcuts", LIBS);
  gidLink(cast(void**)&adw_tab_view_reorder_backward, "adw_tab_view_reorder_backward", LIBS);
  gidLink(cast(void**)&adw_tab_view_reorder_first, "adw_tab_view_reorder_first", LIBS);
  gidLink(cast(void**)&adw_tab_view_reorder_forward, "adw_tab_view_reorder_forward", LIBS);
  gidLink(cast(void**)&adw_tab_view_reorder_last, "adw_tab_view_reorder_last", LIBS);
  gidLink(cast(void**)&adw_tab_view_reorder_page, "adw_tab_view_reorder_page", LIBS);
  gidLink(cast(void**)&adw_tab_view_select_next_page, "adw_tab_view_select_next_page", LIBS);
  gidLink(cast(void**)&adw_tab_view_select_previous_page, "adw_tab_view_select_previous_page", LIBS);
  gidLink(cast(void**)&adw_tab_view_set_default_icon, "adw_tab_view_set_default_icon", LIBS);
  gidLink(cast(void**)&adw_tab_view_set_menu_model, "adw_tab_view_set_menu_model", LIBS);
  gidLink(cast(void**)&adw_tab_view_set_page_pinned, "adw_tab_view_set_page_pinned", LIBS);
  gidLink(cast(void**)&adw_tab_view_set_selected_page, "adw_tab_view_set_selected_page", LIBS);
  gidLink(cast(void**)&adw_tab_view_set_shortcuts, "adw_tab_view_set_shortcuts", LIBS);
  gidLink(cast(void**)&adw_tab_view_transfer_page, "adw_tab_view_transfer_page", LIBS);

  // TimedAnimation
  gidLink(cast(void**)&adw_timed_animation_get_type, "adw_timed_animation_get_type", LIBS);
  gidLink(cast(void**)&adw_timed_animation_new, "adw_timed_animation_new", LIBS);
  gidLink(cast(void**)&adw_timed_animation_get_alternate, "adw_timed_animation_get_alternate", LIBS);
  gidLink(cast(void**)&adw_timed_animation_get_duration, "adw_timed_animation_get_duration", LIBS);
  gidLink(cast(void**)&adw_timed_animation_get_easing, "adw_timed_animation_get_easing", LIBS);
  gidLink(cast(void**)&adw_timed_animation_get_repeat_count, "adw_timed_animation_get_repeat_count", LIBS);
  gidLink(cast(void**)&adw_timed_animation_get_reverse, "adw_timed_animation_get_reverse", LIBS);
  gidLink(cast(void**)&adw_timed_animation_get_value_from, "adw_timed_animation_get_value_from", LIBS);
  gidLink(cast(void**)&adw_timed_animation_get_value_to, "adw_timed_animation_get_value_to", LIBS);
  gidLink(cast(void**)&adw_timed_animation_set_alternate, "adw_timed_animation_set_alternate", LIBS);
  gidLink(cast(void**)&adw_timed_animation_set_duration, "adw_timed_animation_set_duration", LIBS);
  gidLink(cast(void**)&adw_timed_animation_set_easing, "adw_timed_animation_set_easing", LIBS);
  gidLink(cast(void**)&adw_timed_animation_set_repeat_count, "adw_timed_animation_set_repeat_count", LIBS);
  gidLink(cast(void**)&adw_timed_animation_set_reverse, "adw_timed_animation_set_reverse", LIBS);
  gidLink(cast(void**)&adw_timed_animation_set_value_from, "adw_timed_animation_set_value_from", LIBS);
  gidLink(cast(void**)&adw_timed_animation_set_value_to, "adw_timed_animation_set_value_to", LIBS);

  // Toast
  gidLink(cast(void**)&adw_toast_get_type, "adw_toast_get_type", LIBS);
  gidLink(cast(void**)&adw_toast_new, "adw_toast_new", LIBS);
  gidLink(cast(void**)&adw_toast_new_format, "adw_toast_new_format", LIBS);
  gidLink(cast(void**)&adw_toast_dismiss, "adw_toast_dismiss", LIBS);
  gidLink(cast(void**)&adw_toast_get_action_name, "adw_toast_get_action_name", LIBS);
  gidLink(cast(void**)&adw_toast_get_action_target_value, "adw_toast_get_action_target_value", LIBS);
  gidLink(cast(void**)&adw_toast_get_button_label, "adw_toast_get_button_label", LIBS);
  gidLink(cast(void**)&adw_toast_get_custom_title, "adw_toast_get_custom_title", LIBS);
  gidLink(cast(void**)&adw_toast_get_priority, "adw_toast_get_priority", LIBS);
  gidLink(cast(void**)&adw_toast_get_timeout, "adw_toast_get_timeout", LIBS);
  gidLink(cast(void**)&adw_toast_get_title, "adw_toast_get_title", LIBS);
  gidLink(cast(void**)&adw_toast_get_use_markup, "adw_toast_get_use_markup", LIBS);
  gidLink(cast(void**)&adw_toast_set_action_name, "adw_toast_set_action_name", LIBS);
  gidLink(cast(void**)&adw_toast_set_action_target, "adw_toast_set_action_target", LIBS);
  gidLink(cast(void**)&adw_toast_set_action_target_value, "adw_toast_set_action_target_value", LIBS);
  gidLink(cast(void**)&adw_toast_set_button_label, "adw_toast_set_button_label", LIBS);
  gidLink(cast(void**)&adw_toast_set_custom_title, "adw_toast_set_custom_title", LIBS);
  gidLink(cast(void**)&adw_toast_set_detailed_action_name, "adw_toast_set_detailed_action_name", LIBS);
  gidLink(cast(void**)&adw_toast_set_priority, "adw_toast_set_priority", LIBS);
  gidLink(cast(void**)&adw_toast_set_timeout, "adw_toast_set_timeout", LIBS);
  gidLink(cast(void**)&adw_toast_set_title, "adw_toast_set_title", LIBS);
  gidLink(cast(void**)&adw_toast_set_use_markup, "adw_toast_set_use_markup", LIBS);

  // ToastOverlay
  gidLink(cast(void**)&adw_toast_overlay_get_type, "adw_toast_overlay_get_type", LIBS);
  gidLink(cast(void**)&adw_toast_overlay_new, "adw_toast_overlay_new", LIBS);
  gidLink(cast(void**)&adw_toast_overlay_add_toast, "adw_toast_overlay_add_toast", LIBS);
  gidLink(cast(void**)&adw_toast_overlay_get_child, "adw_toast_overlay_get_child", LIBS);
  gidLink(cast(void**)&adw_toast_overlay_set_child, "adw_toast_overlay_set_child", LIBS);

  // ToolbarView
  gidLink(cast(void**)&adw_toolbar_view_get_type, "adw_toolbar_view_get_type", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_new, "adw_toolbar_view_new", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_add_bottom_bar, "adw_toolbar_view_add_bottom_bar", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_add_top_bar, "adw_toolbar_view_add_top_bar", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_get_bottom_bar_height, "adw_toolbar_view_get_bottom_bar_height", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_get_bottom_bar_style, "adw_toolbar_view_get_bottom_bar_style", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_get_content, "adw_toolbar_view_get_content", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_get_extend_content_to_bottom_edge, "adw_toolbar_view_get_extend_content_to_bottom_edge", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_get_extend_content_to_top_edge, "adw_toolbar_view_get_extend_content_to_top_edge", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_get_reveal_bottom_bars, "adw_toolbar_view_get_reveal_bottom_bars", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_get_reveal_top_bars, "adw_toolbar_view_get_reveal_top_bars", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_get_top_bar_height, "adw_toolbar_view_get_top_bar_height", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_get_top_bar_style, "adw_toolbar_view_get_top_bar_style", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_remove, "adw_toolbar_view_remove", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_set_bottom_bar_style, "adw_toolbar_view_set_bottom_bar_style", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_set_content, "adw_toolbar_view_set_content", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_set_extend_content_to_bottom_edge, "adw_toolbar_view_set_extend_content_to_bottom_edge", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_set_extend_content_to_top_edge, "adw_toolbar_view_set_extend_content_to_top_edge", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_set_reveal_bottom_bars, "adw_toolbar_view_set_reveal_bottom_bars", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_set_reveal_top_bars, "adw_toolbar_view_set_reveal_top_bars", LIBS);
  gidLink(cast(void**)&adw_toolbar_view_set_top_bar_style, "adw_toolbar_view_set_top_bar_style", LIBS);

  // ViewStack
  gidLink(cast(void**)&adw_view_stack_get_type, "adw_view_stack_get_type", LIBS);
  gidLink(cast(void**)&adw_view_stack_new, "adw_view_stack_new", LIBS);
  gidLink(cast(void**)&adw_view_stack_add, "adw_view_stack_add", LIBS);
  gidLink(cast(void**)&adw_view_stack_add_named, "adw_view_stack_add_named", LIBS);
  gidLink(cast(void**)&adw_view_stack_add_titled, "adw_view_stack_add_titled", LIBS);
  gidLink(cast(void**)&adw_view_stack_add_titled_with_icon, "adw_view_stack_add_titled_with_icon", LIBS);
  gidLink(cast(void**)&adw_view_stack_get_child_by_name, "adw_view_stack_get_child_by_name", LIBS);
  gidLink(cast(void**)&adw_view_stack_get_hhomogeneous, "adw_view_stack_get_hhomogeneous", LIBS);
  gidLink(cast(void**)&adw_view_stack_get_page, "adw_view_stack_get_page", LIBS);
  gidLink(cast(void**)&adw_view_stack_get_pages, "adw_view_stack_get_pages", LIBS);
  gidLink(cast(void**)&adw_view_stack_get_vhomogeneous, "adw_view_stack_get_vhomogeneous", LIBS);
  gidLink(cast(void**)&adw_view_stack_get_visible_child, "adw_view_stack_get_visible_child", LIBS);
  gidLink(cast(void**)&adw_view_stack_get_visible_child_name, "adw_view_stack_get_visible_child_name", LIBS);
  gidLink(cast(void**)&adw_view_stack_remove, "adw_view_stack_remove", LIBS);
  gidLink(cast(void**)&adw_view_stack_set_hhomogeneous, "adw_view_stack_set_hhomogeneous", LIBS);
  gidLink(cast(void**)&adw_view_stack_set_vhomogeneous, "adw_view_stack_set_vhomogeneous", LIBS);
  gidLink(cast(void**)&adw_view_stack_set_visible_child, "adw_view_stack_set_visible_child", LIBS);
  gidLink(cast(void**)&adw_view_stack_set_visible_child_name, "adw_view_stack_set_visible_child_name", LIBS);

  // ViewStackPage
  gidLink(cast(void**)&adw_view_stack_page_get_type, "adw_view_stack_page_get_type", LIBS);
  gidLink(cast(void**)&adw_view_stack_page_get_badge_number, "adw_view_stack_page_get_badge_number", LIBS);
  gidLink(cast(void**)&adw_view_stack_page_get_child, "adw_view_stack_page_get_child", LIBS);
  gidLink(cast(void**)&adw_view_stack_page_get_icon_name, "adw_view_stack_page_get_icon_name", LIBS);
  gidLink(cast(void**)&adw_view_stack_page_get_name, "adw_view_stack_page_get_name", LIBS);
  gidLink(cast(void**)&adw_view_stack_page_get_needs_attention, "adw_view_stack_page_get_needs_attention", LIBS);
  gidLink(cast(void**)&adw_view_stack_page_get_title, "adw_view_stack_page_get_title", LIBS);
  gidLink(cast(void**)&adw_view_stack_page_get_use_underline, "adw_view_stack_page_get_use_underline", LIBS);
  gidLink(cast(void**)&adw_view_stack_page_get_visible, "adw_view_stack_page_get_visible", LIBS);
  gidLink(cast(void**)&adw_view_stack_page_set_badge_number, "adw_view_stack_page_set_badge_number", LIBS);
  gidLink(cast(void**)&adw_view_stack_page_set_icon_name, "adw_view_stack_page_set_icon_name", LIBS);
  gidLink(cast(void**)&adw_view_stack_page_set_name, "adw_view_stack_page_set_name", LIBS);
  gidLink(cast(void**)&adw_view_stack_page_set_needs_attention, "adw_view_stack_page_set_needs_attention", LIBS);
  gidLink(cast(void**)&adw_view_stack_page_set_title, "adw_view_stack_page_set_title", LIBS);
  gidLink(cast(void**)&adw_view_stack_page_set_use_underline, "adw_view_stack_page_set_use_underline", LIBS);
  gidLink(cast(void**)&adw_view_stack_page_set_visible, "adw_view_stack_page_set_visible", LIBS);

  // ViewStackPages
  gidLink(cast(void**)&adw_view_stack_pages_get_type, "adw_view_stack_pages_get_type", LIBS);
  gidLink(cast(void**)&adw_view_stack_pages_get_selected_page, "adw_view_stack_pages_get_selected_page", LIBS);
  gidLink(cast(void**)&adw_view_stack_pages_set_selected_page, "adw_view_stack_pages_set_selected_page", LIBS);

  // ViewSwitcher
  gidLink(cast(void**)&adw_view_switcher_get_type, "adw_view_switcher_get_type", LIBS);
  gidLink(cast(void**)&adw_view_switcher_new, "adw_view_switcher_new", LIBS);
  gidLink(cast(void**)&adw_view_switcher_get_policy, "adw_view_switcher_get_policy", LIBS);
  gidLink(cast(void**)&adw_view_switcher_get_stack, "adw_view_switcher_get_stack", LIBS);
  gidLink(cast(void**)&adw_view_switcher_set_policy, "adw_view_switcher_set_policy", LIBS);
  gidLink(cast(void**)&adw_view_switcher_set_stack, "adw_view_switcher_set_stack", LIBS);

  // ViewSwitcherBar
  gidLink(cast(void**)&adw_view_switcher_bar_get_type, "adw_view_switcher_bar_get_type", LIBS);
  gidLink(cast(void**)&adw_view_switcher_bar_new, "adw_view_switcher_bar_new", LIBS);
  gidLink(cast(void**)&adw_view_switcher_bar_get_reveal, "adw_view_switcher_bar_get_reveal", LIBS);
  gidLink(cast(void**)&adw_view_switcher_bar_get_stack, "adw_view_switcher_bar_get_stack", LIBS);
  gidLink(cast(void**)&adw_view_switcher_bar_set_reveal, "adw_view_switcher_bar_set_reveal", LIBS);
  gidLink(cast(void**)&adw_view_switcher_bar_set_stack, "adw_view_switcher_bar_set_stack", LIBS);

  // ViewSwitcherTitle
  gidLink(cast(void**)&adw_view_switcher_title_get_type, "adw_view_switcher_title_get_type", LIBS);
  gidLink(cast(void**)&adw_view_switcher_title_new, "adw_view_switcher_title_new", LIBS);
  gidLink(cast(void**)&adw_view_switcher_title_get_stack, "adw_view_switcher_title_get_stack", LIBS);
  gidLink(cast(void**)&adw_view_switcher_title_get_subtitle, "adw_view_switcher_title_get_subtitle", LIBS);
  gidLink(cast(void**)&adw_view_switcher_title_get_title, "adw_view_switcher_title_get_title", LIBS);
  gidLink(cast(void**)&adw_view_switcher_title_get_title_visible, "adw_view_switcher_title_get_title_visible", LIBS);
  gidLink(cast(void**)&adw_view_switcher_title_get_view_switcher_enabled, "adw_view_switcher_title_get_view_switcher_enabled", LIBS);
  gidLink(cast(void**)&adw_view_switcher_title_set_stack, "adw_view_switcher_title_set_stack", LIBS);
  gidLink(cast(void**)&adw_view_switcher_title_set_subtitle, "adw_view_switcher_title_set_subtitle", LIBS);
  gidLink(cast(void**)&adw_view_switcher_title_set_title, "adw_view_switcher_title_set_title", LIBS);
  gidLink(cast(void**)&adw_view_switcher_title_set_view_switcher_enabled, "adw_view_switcher_title_set_view_switcher_enabled", LIBS);

  // Window
  gidLink(cast(void**)&adw_window_get_type, "adw_window_get_type", LIBS);
  gidLink(cast(void**)&adw_window_new, "adw_window_new", LIBS);
  gidLink(cast(void**)&adw_window_add_breakpoint, "adw_window_add_breakpoint", LIBS);
  gidLink(cast(void**)&adw_window_get_content, "adw_window_get_content", LIBS);
  gidLink(cast(void**)&adw_window_get_current_breakpoint, "adw_window_get_current_breakpoint", LIBS);
  gidLink(cast(void**)&adw_window_get_dialogs, "adw_window_get_dialogs", LIBS);
  gidLink(cast(void**)&adw_window_get_visible_dialog, "adw_window_get_visible_dialog", LIBS);
  gidLink(cast(void**)&adw_window_set_content, "adw_window_set_content", LIBS);

  // WindowTitle
  gidLink(cast(void**)&adw_window_title_get_type, "adw_window_title_get_type", LIBS);
  gidLink(cast(void**)&adw_window_title_new, "adw_window_title_new", LIBS);
  gidLink(cast(void**)&adw_window_title_get_subtitle, "adw_window_title_get_subtitle", LIBS);
  gidLink(cast(void**)&adw_window_title_get_title, "adw_window_title_get_title", LIBS);
  gidLink(cast(void**)&adw_window_title_set_subtitle, "adw_window_title_set_subtitle", LIBS);
  gidLink(cast(void**)&adw_window_title_set_title, "adw_window_title_set_title", LIBS);

  // global
  gidLink(cast(void**)&adw_get_enable_animations, "adw_get_enable_animations", LIBS);
  gidLink(cast(void**)&adw_get_major_version, "adw_get_major_version", LIBS);
  gidLink(cast(void**)&adw_get_micro_version, "adw_get_micro_version", LIBS);
  gidLink(cast(void**)&adw_get_minor_version, "adw_get_minor_version", LIBS);
  gidLink(cast(void**)&adw_init, "adw_init", LIBS);
  gidLink(cast(void**)&adw_is_initialized, "adw_is_initialized", LIBS);
  gidLink(cast(void**)&adw_lerp, "adw_lerp", LIBS);
  gidLink(cast(void**)&adw_show_about_dialog, "adw_show_about_dialog", LIBS);
  gidLink(cast(void**)&adw_show_about_dialog_from_appdata, "adw_show_about_dialog_from_appdata", LIBS);
  gidLink(cast(void**)&adw_show_about_window, "adw_show_about_window", LIBS);
  gidLink(cast(void**)&adw_show_about_window_from_appdata, "adw_show_about_window_from_appdata", LIBS);
}
