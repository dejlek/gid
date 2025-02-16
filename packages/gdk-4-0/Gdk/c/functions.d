module Gdk.c.functions;

public import Gid.basictypes;
import Gid.loader;
import Gdk.c.types;
public import GdkPixbuf.c.types;
public import Gio.c.types;
public import Pango.c.types;
public import PangoCairo.c.types;
public import cairo.c.types;

version(Windows)
  private immutable LIBS = ["libgtk-4-1.dll;gtk-4-1.dll;gtk-4.dll"];
else version(OSX)
  private immutable LIBS = ["libgtk-4.1.dylib"];
else
  private immutable LIBS = ["libgtk-4.so.1"];

__gshared extern(C)
{
  // AppLaunchContext
  extern(C) GType function() c_gdk_app_launch_context_get_type;
  GdkDisplay* function(GdkAppLaunchContext* context) c_gdk_app_launch_context_get_display;
  void function(GdkAppLaunchContext* context, int desktop) c_gdk_app_launch_context_set_desktop;
  void function(GdkAppLaunchContext* context, GIcon* icon) c_gdk_app_launch_context_set_icon;
  void function(GdkAppLaunchContext* context, const(char)* iconName) c_gdk_app_launch_context_set_icon_name;
  void function(GdkAppLaunchContext* context, uint timestamp) c_gdk_app_launch_context_set_timestamp;

  // ButtonEvent
  extern(C) GType function() c_gdk_button_event_get_type;
  uint function(GdkEvent* event) c_gdk_button_event_get_button;

  // CairoContext
  extern(C) GType function() c_gdk_cairo_context_get_type;
  cairo_t* function(GdkCairoContext* self) c_gdk_cairo_context_cairo_create;

  // Clipboard
  extern(C) GType function() c_gdk_clipboard_get_type;
  GdkContentProvider* function(GdkClipboard* clipboard) c_gdk_clipboard_get_content;
  GdkDisplay* function(GdkClipboard* clipboard) c_gdk_clipboard_get_display;
  GdkContentFormats* function(GdkClipboard* clipboard) c_gdk_clipboard_get_formats;
  bool function(GdkClipboard* clipboard) c_gdk_clipboard_is_local;
  void function(GdkClipboard* clipboard, const(char*)* mimeTypes, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gdk_clipboard_read_async;
  GInputStream* function(GdkClipboard* clipboard, GAsyncResult* result, const(char*)* outMimeType, GError** _err) c_gdk_clipboard_read_finish;
  void function(GdkClipboard* clipboard, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gdk_clipboard_read_text_async;
  char* function(GdkClipboard* clipboard, GAsyncResult* result, GError** _err) c_gdk_clipboard_read_text_finish;
  void function(GdkClipboard* clipboard, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gdk_clipboard_read_texture_async;
  GdkTexture* function(GdkClipboard* clipboard, GAsyncResult* result, GError** _err) c_gdk_clipboard_read_texture_finish;
  void function(GdkClipboard* clipboard, GType type, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gdk_clipboard_read_value_async;
  const(GValue)* function(GdkClipboard* clipboard, GAsyncResult* result, GError** _err) c_gdk_clipboard_read_value_finish;
  void function(GdkClipboard* clipboard, GType type,  ...) c_gdk_clipboard_set;
  bool function(GdkClipboard* clipboard, GdkContentProvider* provider) c_gdk_clipboard_set_content;
  void function(GdkClipboard* clipboard, const(char)* text) c_gdk_clipboard_set_text;
  void function(GdkClipboard* clipboard, GdkTexture* texture) c_gdk_clipboard_set_texture;
  void function(GdkClipboard* clipboard, GType type, void* args) c_gdk_clipboard_set_valist;
  void function(GdkClipboard* clipboard, const(GValue)* value) c_gdk_clipboard_set_value;
  void function(GdkClipboard* clipboard, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gdk_clipboard_store_async;
  bool function(GdkClipboard* clipboard, GAsyncResult* result, GError** _err) c_gdk_clipboard_store_finish;

  // ContentDeserializer
  extern(C) GType function() c_gdk_content_deserializer_get_type;
  GCancellable* function(GdkContentDeserializer* deserializer) c_gdk_content_deserializer_get_cancellable;
  GType function(GdkContentDeserializer* deserializer) c_gdk_content_deserializer_get_gtype;
  GInputStream* function(GdkContentDeserializer* deserializer) c_gdk_content_deserializer_get_input_stream;
  const(char)* function(GdkContentDeserializer* deserializer) c_gdk_content_deserializer_get_mime_type;
  int function(GdkContentDeserializer* deserializer) c_gdk_content_deserializer_get_priority;
  void* function(GdkContentDeserializer* deserializer) c_gdk_content_deserializer_get_task_data;
  void* function(GdkContentDeserializer* deserializer) c_gdk_content_deserializer_get_user_data;
  GValue* function(GdkContentDeserializer* deserializer) c_gdk_content_deserializer_get_value;
  void function(GdkContentDeserializer* deserializer, GError* error) c_gdk_content_deserializer_return_error;
  void function(GdkContentDeserializer* deserializer) c_gdk_content_deserializer_return_success;
  void function(GdkContentDeserializer* deserializer, void* data, GDestroyNotify notify) c_gdk_content_deserializer_set_task_data;

  // ContentFormats
  extern(C) GType function() c_gdk_content_formats_get_type;
  GdkContentFormats* function(const(char*)* mimeTypes, uint nMimeTypes) c_gdk_content_formats_new;
  GdkContentFormats* function(GType type) c_gdk_content_formats_new_for_gtype;
  bool function(const(GdkContentFormats)* formats, GType type) c_gdk_content_formats_contain_gtype;
  bool function(const(GdkContentFormats)* formats, const(char)* mimeType) c_gdk_content_formats_contain_mime_type;
  const(GType)* function(const(GdkContentFormats)* formats, size_t* nGtypes) c_gdk_content_formats_get_gtypes;
  const(char*)* function(const(GdkContentFormats)* formats, size_t* nMimeTypes) c_gdk_content_formats_get_mime_types;
  bool function(const(GdkContentFormats)* first, const(GdkContentFormats)* second) c_gdk_content_formats_match;
  GType function(const(GdkContentFormats)* first, const(GdkContentFormats)* second) c_gdk_content_formats_match_gtype;
  const(char)* function(const(GdkContentFormats)* first, const(GdkContentFormats)* second) c_gdk_content_formats_match_mime_type;
  void function(GdkContentFormats* formats, GString* string_) c_gdk_content_formats_print;
  GdkContentFormats* function(GdkContentFormats* formats) c_gdk_content_formats_ref;
  char* function(GdkContentFormats* formats) c_gdk_content_formats_to_string;
  GdkContentFormats* function(GdkContentFormats* first, const(GdkContentFormats)* second) c_gdk_content_formats_union;
  GdkContentFormats* function(GdkContentFormats* formats) c_gdk_content_formats_union_deserialize_gtypes;
  GdkContentFormats* function(GdkContentFormats* formats) c_gdk_content_formats_union_deserialize_mime_types;
  GdkContentFormats* function(GdkContentFormats* formats) c_gdk_content_formats_union_serialize_gtypes;
  GdkContentFormats* function(GdkContentFormats* formats) c_gdk_content_formats_union_serialize_mime_types;
  void function(GdkContentFormats* formats) c_gdk_content_formats_unref;
  GdkContentFormats* function(const(char)* string_) c_gdk_content_formats_parse;

  // ContentFormatsBuilder
  extern(C) GType function() c_gdk_content_formats_builder_get_type;
  GdkContentFormatsBuilder* function() c_gdk_content_formats_builder_new;
  void function(GdkContentFormatsBuilder* builder, const(GdkContentFormats)* formats) c_gdk_content_formats_builder_add_formats;
  void function(GdkContentFormatsBuilder* builder, GType type) c_gdk_content_formats_builder_add_gtype;
  void function(GdkContentFormatsBuilder* builder, const(char)* mimeType) c_gdk_content_formats_builder_add_mime_type;
  GdkContentFormats* function(GdkContentFormatsBuilder* builder) c_gdk_content_formats_builder_free_to_formats;
  GdkContentFormatsBuilder* function(GdkContentFormatsBuilder* builder) c_gdk_content_formats_builder_ref;
  GdkContentFormats* function(GdkContentFormatsBuilder* builder) c_gdk_content_formats_builder_to_formats;
  void function(GdkContentFormatsBuilder* builder) c_gdk_content_formats_builder_unref;

  // ContentProvider
  extern(C) GType function() c_gdk_content_provider_get_type;
  GdkContentProvider* function(const(char)* mimeType, GBytes* bytes) c_gdk_content_provider_new_for_bytes;
  GdkContentProvider* function(const(GValue)* value) c_gdk_content_provider_new_for_value;
  GdkContentProvider* function(GType type,  ...) c_gdk_content_provider_new_typed;
  GdkContentProvider* function(GdkContentProvider** providers, size_t nProviders) c_gdk_content_provider_new_union;
  void function(GdkContentProvider* provider) c_gdk_content_provider_content_changed;
  bool function(GdkContentProvider* provider, GValue* value, GError** _err) c_gdk_content_provider_get_value;
  GdkContentFormats* function(GdkContentProvider* provider) c_gdk_content_provider_ref_formats;
  GdkContentFormats* function(GdkContentProvider* provider) c_gdk_content_provider_ref_storable_formats;
  void function(GdkContentProvider* provider, const(char)* mimeType, GOutputStream* stream, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gdk_content_provider_write_mime_type_async;
  bool function(GdkContentProvider* provider, GAsyncResult* result, GError** _err) c_gdk_content_provider_write_mime_type_finish;

  // ContentSerializer
  extern(C) GType function() c_gdk_content_serializer_get_type;
  GCancellable* function(GdkContentSerializer* serializer) c_gdk_content_serializer_get_cancellable;
  GType function(GdkContentSerializer* serializer) c_gdk_content_serializer_get_gtype;
  const(char)* function(GdkContentSerializer* serializer) c_gdk_content_serializer_get_mime_type;
  GOutputStream* function(GdkContentSerializer* serializer) c_gdk_content_serializer_get_output_stream;
  int function(GdkContentSerializer* serializer) c_gdk_content_serializer_get_priority;
  void* function(GdkContentSerializer* serializer) c_gdk_content_serializer_get_task_data;
  void* function(GdkContentSerializer* serializer) c_gdk_content_serializer_get_user_data;
  const(GValue)* function(GdkContentSerializer* serializer) c_gdk_content_serializer_get_value;
  void function(GdkContentSerializer* serializer, GError* error) c_gdk_content_serializer_return_error;
  void function(GdkContentSerializer* serializer) c_gdk_content_serializer_return_success;
  void function(GdkContentSerializer* serializer, void* data, GDestroyNotify notify) c_gdk_content_serializer_set_task_data;

  // CrossingEvent
  extern(C) GType function() c_gdk_crossing_event_get_type;
  GdkNotifyType function(GdkEvent* event) c_gdk_crossing_event_get_detail;
  bool function(GdkEvent* event) c_gdk_crossing_event_get_focus;
  GdkCrossingMode function(GdkEvent* event) c_gdk_crossing_event_get_mode;

  // Cursor
  extern(C) GType function() c_gdk_cursor_get_type;
  GdkCursor* function(const(char)* name, GdkCursor* fallback) c_gdk_cursor_new_from_name;
  GdkCursor* function(GdkTexture* texture, int hotspotX, int hotspotY, GdkCursor* fallback) c_gdk_cursor_new_from_texture;
  GdkCursor* function(GdkCursor* cursor) c_gdk_cursor_get_fallback;
  int function(GdkCursor* cursor) c_gdk_cursor_get_hotspot_x;
  int function(GdkCursor* cursor) c_gdk_cursor_get_hotspot_y;
  const(char)* function(GdkCursor* cursor) c_gdk_cursor_get_name;
  GdkTexture* function(GdkCursor* cursor) c_gdk_cursor_get_texture;

  // DNDEvent
  extern(C) GType function() c_gdk_dnd_event_get_type;
  GdkDrop* function(GdkEvent* event) c_gdk_dnd_event_get_drop;

  // DeleteEvent
  extern(C) GType function() c_gdk_delete_event_get_type;

  // Device
  extern(C) GType function() c_gdk_device_get_type;
  bool function(GdkDevice* device) c_gdk_device_get_caps_lock_state;
  GdkDeviceTool* function(GdkDevice* device) c_gdk_device_get_device_tool;
  PangoDirection function(GdkDevice* device) c_gdk_device_get_direction;
  GdkDisplay* function(GdkDevice* device) c_gdk_device_get_display;
  bool function(GdkDevice* device) c_gdk_device_get_has_cursor;
  GdkModifierType function(GdkDevice* device) c_gdk_device_get_modifier_state;
  const(char)* function(GdkDevice* device) c_gdk_device_get_name;
  bool function(GdkDevice* device) c_gdk_device_get_num_lock_state;
  uint function(GdkDevice* device) c_gdk_device_get_num_touches;
  const(char)* function(GdkDevice* device) c_gdk_device_get_product_id;
  bool function(GdkDevice* device) c_gdk_device_get_scroll_lock_state;
  GdkSeat* function(GdkDevice* device) c_gdk_device_get_seat;
  GdkInputSource function(GdkDevice* device) c_gdk_device_get_source;
  GdkSurface* function(GdkDevice* device, double* winX, double* winY) c_gdk_device_get_surface_at_position;
  uint function(GdkDevice* device) c_gdk_device_get_timestamp;
  const(char)* function(GdkDevice* device) c_gdk_device_get_vendor_id;
  bool function(GdkDevice* device) c_gdk_device_has_bidi_layouts;

  // DevicePad
  extern(C) GType function() c_gdk_device_pad_get_type;
  int function(GdkDevicePad* pad, GdkDevicePadFeature feature, int featureIdx) c_gdk_device_pad_get_feature_group;
  int function(GdkDevicePad* pad, int groupIdx) c_gdk_device_pad_get_group_n_modes;
  int function(GdkDevicePad* pad, GdkDevicePadFeature feature) c_gdk_device_pad_get_n_features;
  int function(GdkDevicePad* pad) c_gdk_device_pad_get_n_groups;

  // DeviceTool
  extern(C) GType function() c_gdk_device_tool_get_type;
  GdkAxisFlags function(GdkDeviceTool* tool) c_gdk_device_tool_get_axes;
  ulong function(GdkDeviceTool* tool) c_gdk_device_tool_get_hardware_id;
  ulong function(GdkDeviceTool* tool) c_gdk_device_tool_get_serial;
  GdkDeviceToolType function(GdkDeviceTool* tool) c_gdk_device_tool_get_tool_type;

  // Display
  extern(C) GType function() c_gdk_display_get_type;
  GdkDisplay* function() c_gdk_display_get_default;
  GdkDisplay* function(const(char)* displayName) c_gdk_display_open;
  void function(GdkDisplay* display) c_gdk_display_beep;
  void function(GdkDisplay* display) c_gdk_display_close;
  GdkGLContext* function(GdkDisplay* self, GError** _err) c_gdk_display_create_gl_context;
  bool function(GdkDisplay* display, GdkDevice* device) c_gdk_display_device_is_grabbed;
  void function(GdkDisplay* display) c_gdk_display_flush;
  GdkAppLaunchContext* function(GdkDisplay* display) c_gdk_display_get_app_launch_context;
  GdkClipboard* function(GdkDisplay* display) c_gdk_display_get_clipboard;
  GdkSeat* function(GdkDisplay* display) c_gdk_display_get_default_seat;
  GdkDmabufFormats* function(GdkDisplay* display) c_gdk_display_get_dmabuf_formats;
  GdkMonitor* function(GdkDisplay* display, GdkSurface* surface) c_gdk_display_get_monitor_at_surface;
  GListModel* function(GdkDisplay* self) c_gdk_display_get_monitors;
  const(char)* function(GdkDisplay* display) c_gdk_display_get_name;
  GdkClipboard* function(GdkDisplay* display) c_gdk_display_get_primary_clipboard;
  bool function(GdkDisplay* display, const(char)* name, GValue* value) c_gdk_display_get_setting;
  const(char)* function(GdkDisplay* display) c_gdk_display_get_startup_notification_id;
  bool function(GdkDisplay* display) c_gdk_display_is_closed;
  bool function(GdkDisplay* display) c_gdk_display_is_composited;
  bool function(GdkDisplay* display) c_gdk_display_is_rgba;
  GList* function(GdkDisplay* display) c_gdk_display_list_seats;
  bool function(GdkDisplay* display, uint keycode, GdkKeymapKey** keys, uint** keyvals, int* nEntries) c_gdk_display_map_keycode;
  bool function(GdkDisplay* display, uint keyval, GdkKeymapKey** keys, int* nKeys) c_gdk_display_map_keyval;
  void function(GdkDisplay* display, const(char)* startupId) c_gdk_display_notify_startup_complete;
  bool function(GdkDisplay* self, GError** _err) c_gdk_display_prepare_gl;
  void function(GdkDisplay* display, GdkEvent* event) c_gdk_display_put_event;
  bool function(GdkDisplay* display) c_gdk_display_supports_input_shapes;
  bool function(GdkDisplay* display) c_gdk_display_supports_shadow_width;
  void function(GdkDisplay* display) c_gdk_display_sync;
  bool function(GdkDisplay* display, uint keycode, GdkModifierType state, int group, uint* keyval, int* effectiveGroup, int* level, GdkModifierType* consumed) c_gdk_display_translate_key;

  // DisplayManager
  extern(C) GType function() c_gdk_display_manager_get_type;
  GdkDisplayManager* function() c_gdk_display_manager_get;
  GdkDisplay* function(GdkDisplayManager* manager) c_gdk_display_manager_get_default_display;
  GSList* function(GdkDisplayManager* manager) c_gdk_display_manager_list_displays;
  GdkDisplay* function(GdkDisplayManager* manager, const(char)* name) c_gdk_display_manager_open_display;
  void function(GdkDisplayManager* manager, GdkDisplay* display) c_gdk_display_manager_set_default_display;

  // DmabufFormats
  extern(C) GType function() c_gdk_dmabuf_formats_get_type;
  bool function(GdkDmabufFormats* formats, uint fourcc, ulong modifier) c_gdk_dmabuf_formats_contains;
  bool function(const(GdkDmabufFormats)* formats1, const(GdkDmabufFormats)* formats2) c_gdk_dmabuf_formats_equal;
  void function(GdkDmabufFormats* formats, size_t idx, uint* fourcc, ulong* modifier) c_gdk_dmabuf_formats_get_format;
  size_t function(GdkDmabufFormats* formats) c_gdk_dmabuf_formats_get_n_formats;
  GdkDmabufFormats* function(GdkDmabufFormats* formats) c_gdk_dmabuf_formats_ref;
  void function(GdkDmabufFormats* formats) c_gdk_dmabuf_formats_unref;

  // DmabufTexture
  extern(C) GType function() c_gdk_dmabuf_texture_get_type;

  // DmabufTextureBuilder
  extern(C) GType function() c_gdk_dmabuf_texture_builder_get_type;
  GdkDmabufTextureBuilder* function() c_gdk_dmabuf_texture_builder_new;
  GdkTexture* function(GdkDmabufTextureBuilder* self, GDestroyNotify destroy, void* data, GError** _err) c_gdk_dmabuf_texture_builder_build;
  GdkDisplay* function(GdkDmabufTextureBuilder* self) c_gdk_dmabuf_texture_builder_get_display;
  int function(GdkDmabufTextureBuilder* self, uint plane) c_gdk_dmabuf_texture_builder_get_fd;
  uint function(GdkDmabufTextureBuilder* self) c_gdk_dmabuf_texture_builder_get_fourcc;
  uint function(GdkDmabufTextureBuilder* self) c_gdk_dmabuf_texture_builder_get_height;
  ulong function(GdkDmabufTextureBuilder* self) c_gdk_dmabuf_texture_builder_get_modifier;
  uint function(GdkDmabufTextureBuilder* self) c_gdk_dmabuf_texture_builder_get_n_planes;
  uint function(GdkDmabufTextureBuilder* self, uint plane) c_gdk_dmabuf_texture_builder_get_offset;
  bool function(GdkDmabufTextureBuilder* self) c_gdk_dmabuf_texture_builder_get_premultiplied;
  uint function(GdkDmabufTextureBuilder* self, uint plane) c_gdk_dmabuf_texture_builder_get_stride;
  cairo_region_t* function(GdkDmabufTextureBuilder* self) c_gdk_dmabuf_texture_builder_get_update_region;
  GdkTexture* function(GdkDmabufTextureBuilder* self) c_gdk_dmabuf_texture_builder_get_update_texture;
  uint function(GdkDmabufTextureBuilder* self) c_gdk_dmabuf_texture_builder_get_width;
  void function(GdkDmabufTextureBuilder* self, GdkDisplay* display) c_gdk_dmabuf_texture_builder_set_display;
  void function(GdkDmabufTextureBuilder* self, uint plane, int fd) c_gdk_dmabuf_texture_builder_set_fd;
  void function(GdkDmabufTextureBuilder* self, uint fourcc) c_gdk_dmabuf_texture_builder_set_fourcc;
  void function(GdkDmabufTextureBuilder* self, uint height) c_gdk_dmabuf_texture_builder_set_height;
  void function(GdkDmabufTextureBuilder* self, ulong modifier) c_gdk_dmabuf_texture_builder_set_modifier;
  void function(GdkDmabufTextureBuilder* self, uint nPlanes) c_gdk_dmabuf_texture_builder_set_n_planes;
  void function(GdkDmabufTextureBuilder* self, uint plane, uint offset) c_gdk_dmabuf_texture_builder_set_offset;
  void function(GdkDmabufTextureBuilder* self, bool premultiplied) c_gdk_dmabuf_texture_builder_set_premultiplied;
  void function(GdkDmabufTextureBuilder* self, uint plane, uint stride) c_gdk_dmabuf_texture_builder_set_stride;
  void function(GdkDmabufTextureBuilder* self, cairo_region_t* region) c_gdk_dmabuf_texture_builder_set_update_region;
  void function(GdkDmabufTextureBuilder* self, GdkTexture* texture) c_gdk_dmabuf_texture_builder_set_update_texture;
  void function(GdkDmabufTextureBuilder* self, uint width) c_gdk_dmabuf_texture_builder_set_width;

  // Drag
  extern(C) GType function() c_gdk_drag_get_type;
  GdkDrag* function(GdkSurface* surface, GdkDevice* device, GdkContentProvider* content, GdkDragAction actions, double dx, double dy) c_gdk_drag_begin;
  void function(GdkDrag* drag, bool success) c_gdk_drag_drop_done;
  GdkDragAction function(GdkDrag* drag) c_gdk_drag_get_actions;
  GdkContentProvider* function(GdkDrag* drag) c_gdk_drag_get_content;
  GdkDevice* function(GdkDrag* drag) c_gdk_drag_get_device;
  GdkDisplay* function(GdkDrag* drag) c_gdk_drag_get_display;
  GdkSurface* function(GdkDrag* drag) c_gdk_drag_get_drag_surface;
  GdkContentFormats* function(GdkDrag* drag) c_gdk_drag_get_formats;
  GdkDragAction function(GdkDrag* drag) c_gdk_drag_get_selected_action;
  GdkSurface* function(GdkDrag* drag) c_gdk_drag_get_surface;
  void function(GdkDrag* drag, int hotX, int hotY) c_gdk_drag_set_hotspot;

  // DragSurface
  extern(C) GType function() c_gdk_drag_surface_get_type;
  bool function(GdkDragSurface* dragSurface, int width, int height) c_gdk_drag_surface_present;

  // DragSurfaceSize
  void function(GdkDragSurfaceSize* size, int width, int height) c_gdk_drag_surface_size_set_size;

  // DrawContext
  extern(C) GType function() c_gdk_draw_context_get_type;
  void function(GdkDrawContext* context, const(cairo_region_t)* region) c_gdk_draw_context_begin_frame;
  void function(GdkDrawContext* context) c_gdk_draw_context_end_frame;
  GdkDisplay* function(GdkDrawContext* context) c_gdk_draw_context_get_display;
  const(cairo_region_t)* function(GdkDrawContext* context) c_gdk_draw_context_get_frame_region;
  GdkSurface* function(GdkDrawContext* context) c_gdk_draw_context_get_surface;
  bool function(GdkDrawContext* context) c_gdk_draw_context_is_in_frame;

  // Drop
  extern(C) GType function() c_gdk_drop_get_type;
  void function(GdkDrop* self, GdkDragAction action) c_gdk_drop_finish;
  GdkDragAction function(GdkDrop* self) c_gdk_drop_get_actions;
  GdkDevice* function(GdkDrop* self) c_gdk_drop_get_device;
  GdkDisplay* function(GdkDrop* self) c_gdk_drop_get_display;
  GdkDrag* function(GdkDrop* self) c_gdk_drop_get_drag;
  GdkContentFormats* function(GdkDrop* self) c_gdk_drop_get_formats;
  GdkSurface* function(GdkDrop* self) c_gdk_drop_get_surface;
  void function(GdkDrop* self, const(char*)* mimeTypes, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gdk_drop_read_async;
  GInputStream* function(GdkDrop* self, GAsyncResult* result, const(char*)* outMimeType, GError** _err) c_gdk_drop_read_finish;
  void function(GdkDrop* self, GType type, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gdk_drop_read_value_async;
  const(GValue)* function(GdkDrop* self, GAsyncResult* result, GError** _err) c_gdk_drop_read_value_finish;
  void function(GdkDrop* self, GdkDragAction actions, GdkDragAction preferred) c_gdk_drop_status;

  // Event
  extern(C) GType function() c_gdk_event_get_type;
  bool function(GdkEvent* event, double** axes, uint* nAxes) c_gdk_event_get_axes;
  bool function(GdkEvent* event, GdkAxisUse axisUse, double* value) c_gdk_event_get_axis;
  GdkDevice* function(GdkEvent* event) c_gdk_event_get_device;
  GdkDeviceTool* function(GdkEvent* event) c_gdk_event_get_device_tool;
  GdkDisplay* function(GdkEvent* event) c_gdk_event_get_display;
  GdkEventSequence* function(GdkEvent* event) c_gdk_event_get_event_sequence;
  GdkEventType function(GdkEvent* event) c_gdk_event_get_event_type;
  GdkTimeCoord* function(GdkEvent* event, uint* outNCoords) c_gdk_event_get_history;
  GdkModifierType function(GdkEvent* event) c_gdk_event_get_modifier_state;
  bool function(GdkEvent* event) c_gdk_event_get_pointer_emulated;
  bool function(GdkEvent* event, double* x, double* y) c_gdk_event_get_position;
  GdkSeat* function(GdkEvent* event) c_gdk_event_get_seat;
  GdkSurface* function(GdkEvent* event) c_gdk_event_get_surface;
  uint function(GdkEvent* event) c_gdk_event_get_time;
  GdkEvent* function(GdkEvent* event) c_gdk_event_ref;
  bool function(GdkEvent* event) c_gdk_event_triggers_context_menu;
  void function(GdkEvent* event) c_gdk_event_unref;

  // EventSequence
  extern(C) GType function() c_gdk_event_sequence_get_type;

  // FileList
  extern(C) GType function() c_gdk_file_list_get_type;
  GdkFileList* function(GFile** files, size_t nFiles) c_gdk_file_list_new_from_array;
  GdkFileList* function(GSList* files) c_gdk_file_list_new_from_list;
  GSList* function(GdkFileList* fileList) c_gdk_file_list_get_files;

  // FocusEvent
  extern(C) GType function() c_gdk_focus_event_get_type;
  bool function(GdkEvent* event) c_gdk_focus_event_get_in;

  // FrameClock
  extern(C) GType function() c_gdk_frame_clock_get_type;
  void function(GdkFrameClock* frameClock) c_gdk_frame_clock_begin_updating;
  void function(GdkFrameClock* frameClock) c_gdk_frame_clock_end_updating;
  GdkFrameTimings* function(GdkFrameClock* frameClock) c_gdk_frame_clock_get_current_timings;
  double function(GdkFrameClock* frameClock) c_gdk_frame_clock_get_fps;
  long function(GdkFrameClock* frameClock) c_gdk_frame_clock_get_frame_counter;
  long function(GdkFrameClock* frameClock) c_gdk_frame_clock_get_frame_time;
  long function(GdkFrameClock* frameClock) c_gdk_frame_clock_get_history_start;
  void function(GdkFrameClock* frameClock, long baseTime, long* refreshIntervalReturn, long* presentationTimeReturn) c_gdk_frame_clock_get_refresh_info;
  GdkFrameTimings* function(GdkFrameClock* frameClock, long frameCounter) c_gdk_frame_clock_get_timings;
  void function(GdkFrameClock* frameClock, GdkFrameClockPhase phase) c_gdk_frame_clock_request_phase;

  // FrameTimings
  extern(C) GType function() c_gdk_frame_timings_get_type;
  bool function(GdkFrameTimings* timings) c_gdk_frame_timings_get_complete;
  long function(GdkFrameTimings* timings) c_gdk_frame_timings_get_frame_counter;
  long function(GdkFrameTimings* timings) c_gdk_frame_timings_get_frame_time;
  long function(GdkFrameTimings* timings) c_gdk_frame_timings_get_predicted_presentation_time;
  long function(GdkFrameTimings* timings) c_gdk_frame_timings_get_presentation_time;
  long function(GdkFrameTimings* timings) c_gdk_frame_timings_get_refresh_interval;
  GdkFrameTimings* function(GdkFrameTimings* timings) c_gdk_frame_timings_ref;
  void function(GdkFrameTimings* timings) c_gdk_frame_timings_unref;

  // GLContext
  extern(C) GType function() c_gdk_gl_context_get_type;
  void function() c_gdk_gl_context_clear_current;
  GdkGLContext* function() c_gdk_gl_context_get_current;
  GdkGLAPI function(GdkGLContext* self) c_gdk_gl_context_get_allowed_apis;
  GdkGLAPI function(GdkGLContext* self) c_gdk_gl_context_get_api;
  bool function(GdkGLContext* context) c_gdk_gl_context_get_debug_enabled;
  GdkDisplay* function(GdkGLContext* context) c_gdk_gl_context_get_display;
  bool function(GdkGLContext* context) c_gdk_gl_context_get_forward_compatible;
  void function(GdkGLContext* context, int* major, int* minor) c_gdk_gl_context_get_required_version;
  GdkGLContext* function(GdkGLContext* context) c_gdk_gl_context_get_shared_context;
  GdkSurface* function(GdkGLContext* context) c_gdk_gl_context_get_surface;
  bool function(GdkGLContext* context) c_gdk_gl_context_get_use_es;
  void function(GdkGLContext* context, int* major, int* minor) c_gdk_gl_context_get_version;
  bool function(GdkGLContext* context) c_gdk_gl_context_is_legacy;
  bool function(GdkGLContext* self, GdkGLContext* other) c_gdk_gl_context_is_shared;
  void function(GdkGLContext* context) c_gdk_gl_context_make_current;
  bool function(GdkGLContext* context, GError** _err) c_gdk_gl_context_realize;
  void function(GdkGLContext* self, GdkGLAPI apis) c_gdk_gl_context_set_allowed_apis;
  void function(GdkGLContext* context, bool enabled) c_gdk_gl_context_set_debug_enabled;
  void function(GdkGLContext* context, bool compatible) c_gdk_gl_context_set_forward_compatible;
  void function(GdkGLContext* context, int major, int minor) c_gdk_gl_context_set_required_version;
  void function(GdkGLContext* context, int useEs) c_gdk_gl_context_set_use_es;

  // GLTexture
  extern(C) GType function() c_gdk_gl_texture_get_type;
  GdkTexture* function(GdkGLContext* context, uint id, int width, int height, GDestroyNotify destroy, void* data) c_gdk_gl_texture_new;
  void function(GdkGLTexture* self) c_gdk_gl_texture_release;

  // GLTextureBuilder
  extern(C) GType function() c_gdk_gl_texture_builder_get_type;
  GdkGLTextureBuilder* function() c_gdk_gl_texture_builder_new;
  GdkTexture* function(GdkGLTextureBuilder* self, GDestroyNotify destroy, void* data) c_gdk_gl_texture_builder_build;
  GdkGLContext* function(GdkGLTextureBuilder* self) c_gdk_gl_texture_builder_get_context;
  GdkMemoryFormat function(GdkGLTextureBuilder* self) c_gdk_gl_texture_builder_get_format;
  bool function(GdkGLTextureBuilder* self) c_gdk_gl_texture_builder_get_has_mipmap;
  int function(GdkGLTextureBuilder* self) c_gdk_gl_texture_builder_get_height;
  uint function(GdkGLTextureBuilder* self) c_gdk_gl_texture_builder_get_id;
  void* function(GdkGLTextureBuilder* self) c_gdk_gl_texture_builder_get_sync;
  cairo_region_t* function(GdkGLTextureBuilder* self) c_gdk_gl_texture_builder_get_update_region;
  GdkTexture* function(GdkGLTextureBuilder* self) c_gdk_gl_texture_builder_get_update_texture;
  int function(GdkGLTextureBuilder* self) c_gdk_gl_texture_builder_get_width;
  void function(GdkGLTextureBuilder* self, GdkGLContext* context) c_gdk_gl_texture_builder_set_context;
  void function(GdkGLTextureBuilder* self, GdkMemoryFormat format) c_gdk_gl_texture_builder_set_format;
  void function(GdkGLTextureBuilder* self, bool hasMipmap) c_gdk_gl_texture_builder_set_has_mipmap;
  void function(GdkGLTextureBuilder* self, int height) c_gdk_gl_texture_builder_set_height;
  void function(GdkGLTextureBuilder* self, uint id) c_gdk_gl_texture_builder_set_id;
  void function(GdkGLTextureBuilder* self, void* sync) c_gdk_gl_texture_builder_set_sync;
  void function(GdkGLTextureBuilder* self, cairo_region_t* region) c_gdk_gl_texture_builder_set_update_region;
  void function(GdkGLTextureBuilder* self, GdkTexture* texture) c_gdk_gl_texture_builder_set_update_texture;
  void function(GdkGLTextureBuilder* self, int width) c_gdk_gl_texture_builder_set_width;

  // Global
  void function(cairo_t* cr, GdkSurface* surface, int source, int sourceType, int bufferScale, int x, int y, int width, int height) c_gdk_cairo_draw_from_gl;
  void function(cairo_t* cr, const(GdkRectangle)* rectangle) c_gdk_cairo_rectangle;
  void function(cairo_t* cr, const(cairo_region_t)* region) c_gdk_cairo_region;
  cairo_region_t* function(cairo_surface_t* surface) c_gdk_cairo_region_create_from_surface;
  void function(cairo_t* cr, const(PixbufC)* pixbuf, double pixbufX, double pixbufY) c_gdk_cairo_set_source_pixbuf;
  void function(cairo_t* cr, const(GdkRGBA)* rgba) c_gdk_cairo_set_source_rgba;
  void function(GInputStream* stream, const(char)* mimeType, GType type, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gdk_content_deserialize_async;
  bool function(GAsyncResult* result, GValue* value, GError** _err) c_gdk_content_deserialize_finish;
  void function(const(char)* mimeType, GType type, GdkContentDeserializeFunc deserialize, void* data, GDestroyNotify notify) c_gdk_content_register_deserializer;
  void function(GType type, const(char)* mimeType, GdkContentSerializeFunc serialize, void* data, GDestroyNotify notify) c_gdk_content_register_serializer;
  void function(GOutputStream* stream, const(char)* mimeType, const(GValue)* value, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_gdk_content_serialize_async;
  bool function(GAsyncResult* result, GError** _err) c_gdk_content_serialize_finish;
  GType function() c_gdk_drag_surface_size_get_type;
  bool function(GdkEvent* event1, GdkEvent* event2, double* angle) c_gdk_events_get_angle;
  bool function(GdkEvent* event1, GdkEvent* event2, double* x, double* y) c_gdk_events_get_center;
  bool function(GdkEvent* event1, GdkEvent* event2, double* distance) c_gdk_events_get_distance;
  const(char)* function(const(char)* string_) c_gdk_intern_mime_type;
  void function(uint symbol, uint* lower, uint* upper) c_gdk_keyval_convert_case;
  uint function(const(char)* keyvalName) c_gdk_keyval_from_name;
  bool function(uint keyval) c_gdk_keyval_is_lower;
  bool function(uint keyval) c_gdk_keyval_is_upper;
  const(char)* function(uint keyval) c_gdk_keyval_name;
  uint function(uint keyval) c_gdk_keyval_to_lower;
  uint function(uint keyval) c_gdk_keyval_to_unicode;
  uint function(uint keyval) c_gdk_keyval_to_upper;
  cairo_region_t* function(PangoLayout* layout, int xOrigin, int yOrigin, const(int)* indexRanges, int nRanges) c_gdk_pango_layout_get_clip_region;
  cairo_region_t* function(PangoLayoutLine* line, int xOrigin, int yOrigin, const(int)* indexRanges, int nRanges) c_gdk_pango_layout_line_get_clip_region;
  PixbufC* function(cairo_surface_t* surface, int srcX, int srcY, int width, int height) c_gdk_pixbuf_get_from_surface;
  PixbufC* function(GdkTexture* texture) c_gdk_pixbuf_get_from_texture;
  void function(const(char)* backends) c_gdk_set_allowed_backends;
  GType function() c_gdk_toplevel_size_get_type;
  uint function(uint wc) c_gdk_unicode_to_keyval;

  // GrabBrokenEvent
  extern(C) GType function() c_gdk_grab_broken_event_get_type;
  GdkSurface* function(GdkEvent* event) c_gdk_grab_broken_event_get_grab_surface;
  bool function(GdkEvent* event) c_gdk_grab_broken_event_get_implicit;

  // KeyEvent
  extern(C) GType function() c_gdk_key_event_get_type;
  GdkModifierType function(GdkEvent* event) c_gdk_key_event_get_consumed_modifiers;
  uint function(GdkEvent* event) c_gdk_key_event_get_keycode;
  uint function(GdkEvent* event) c_gdk_key_event_get_keyval;
  uint function(GdkEvent* event) c_gdk_key_event_get_layout;
  uint function(GdkEvent* event) c_gdk_key_event_get_level;
  bool function(GdkEvent* event, uint* keyval, GdkModifierType* modifiers) c_gdk_key_event_get_match;
  bool function(GdkEvent* event) c_gdk_key_event_is_modifier;
  GdkKeyMatch function(GdkEvent* event, uint keyval, GdkModifierType modifiers) c_gdk_key_event_matches;

  // MemoryTexture
  extern(C) GType function() c_gdk_memory_texture_get_type;
  GdkTexture* function(int width, int height, GdkMemoryFormat format, GBytes* bytes, size_t stride) c_gdk_memory_texture_new;

  // MonitorG
  extern(C) GType function() c_gdk_monitor_get_type;
  const(char)* function(GdkMonitor* monitor) c_gdk_monitor_get_connector;
  const(char)* function(GdkMonitor* monitor) c_gdk_monitor_get_description;
  GdkDisplay* function(GdkMonitor* monitor) c_gdk_monitor_get_display;
  void function(GdkMonitor* monitor, GdkRectangle* geometry) c_gdk_monitor_get_geometry;
  int function(GdkMonitor* monitor) c_gdk_monitor_get_height_mm;
  const(char)* function(GdkMonitor* monitor) c_gdk_monitor_get_manufacturer;
  const(char)* function(GdkMonitor* monitor) c_gdk_monitor_get_model;
  int function(GdkMonitor* monitor) c_gdk_monitor_get_refresh_rate;
  double function(GdkMonitor* monitor) c_gdk_monitor_get_scale;
  int function(GdkMonitor* monitor) c_gdk_monitor_get_scale_factor;
  GdkSubpixelLayout function(GdkMonitor* monitor) c_gdk_monitor_get_subpixel_layout;
  int function(GdkMonitor* monitor) c_gdk_monitor_get_width_mm;
  bool function(GdkMonitor* monitor) c_gdk_monitor_is_valid;

  // MotionEvent
  extern(C) GType function() c_gdk_motion_event_get_type;

  // PadEvent
  extern(C) GType function() c_gdk_pad_event_get_type;
  void function(GdkEvent* event, uint* index, double* value) c_gdk_pad_event_get_axis_value;
  uint function(GdkEvent* event) c_gdk_pad_event_get_button;
  void function(GdkEvent* event, uint* group, uint* mode) c_gdk_pad_event_get_group_mode;

  // Paintable
  extern(C) GType function() c_gdk_paintable_get_type;
  GdkPaintable* function(int intrinsicWidth, int intrinsicHeight) c_gdk_paintable_new_empty;
  void function(GdkPaintable* paintable, double specifiedWidth, double specifiedHeight, double defaultWidth, double defaultHeight, double* concreteWidth, double* concreteHeight) c_gdk_paintable_compute_concrete_size;
  GdkPaintable* function(GdkPaintable* paintable) c_gdk_paintable_get_current_image;
  GdkPaintableFlags function(GdkPaintable* paintable) c_gdk_paintable_get_flags;
  double function(GdkPaintable* paintable) c_gdk_paintable_get_intrinsic_aspect_ratio;
  int function(GdkPaintable* paintable) c_gdk_paintable_get_intrinsic_height;
  int function(GdkPaintable* paintable) c_gdk_paintable_get_intrinsic_width;
  void function(GdkPaintable* paintable) c_gdk_paintable_invalidate_contents;
  void function(GdkPaintable* paintable) c_gdk_paintable_invalidate_size;
  void function(GdkPaintable* paintable, GdkSnapshot* snapshot, double width, double height) c_gdk_paintable_snapshot;

  // Popup
  extern(C) GType function() c_gdk_popup_get_type;
  bool function(GdkPopup* popup) c_gdk_popup_get_autohide;
  GdkSurface* function(GdkPopup* popup) c_gdk_popup_get_parent;
  int function(GdkPopup* popup) c_gdk_popup_get_position_x;
  int function(GdkPopup* popup) c_gdk_popup_get_position_y;
  GdkGravity function(GdkPopup* popup) c_gdk_popup_get_rect_anchor;
  GdkGravity function(GdkPopup* popup) c_gdk_popup_get_surface_anchor;
  bool function(GdkPopup* popup, int width, int height, GdkPopupLayout* layout) c_gdk_popup_present;

  // PopupLayout
  extern(C) GType function() c_gdk_popup_layout_get_type;
  GdkPopupLayout* function(const(GdkRectangle)* anchorRect, GdkGravity rectAnchor, GdkGravity surfaceAnchor) c_gdk_popup_layout_new;
  GdkPopupLayout* function(GdkPopupLayout* layout) c_gdk_popup_layout_copy;
  bool function(GdkPopupLayout* layout, GdkPopupLayout* other) c_gdk_popup_layout_equal;
  GdkAnchorHints function(GdkPopupLayout* layout) c_gdk_popup_layout_get_anchor_hints;
  const(GdkRectangle)* function(GdkPopupLayout* layout) c_gdk_popup_layout_get_anchor_rect;
  void function(GdkPopupLayout* layout, int* dx, int* dy) c_gdk_popup_layout_get_offset;
  GdkGravity function(GdkPopupLayout* layout) c_gdk_popup_layout_get_rect_anchor;
  void function(GdkPopupLayout* layout, int* left, int* right, int* top, int* bottom) c_gdk_popup_layout_get_shadow_width;
  GdkGravity function(GdkPopupLayout* layout) c_gdk_popup_layout_get_surface_anchor;
  GdkPopupLayout* function(GdkPopupLayout* layout) c_gdk_popup_layout_ref;
  void function(GdkPopupLayout* layout, GdkAnchorHints anchorHints) c_gdk_popup_layout_set_anchor_hints;
  void function(GdkPopupLayout* layout, const(GdkRectangle)* anchorRect) c_gdk_popup_layout_set_anchor_rect;
  void function(GdkPopupLayout* layout, int dx, int dy) c_gdk_popup_layout_set_offset;
  void function(GdkPopupLayout* layout, GdkGravity anchor) c_gdk_popup_layout_set_rect_anchor;
  void function(GdkPopupLayout* layout, int left, int right, int top, int bottom) c_gdk_popup_layout_set_shadow_width;
  void function(GdkPopupLayout* layout, GdkGravity anchor) c_gdk_popup_layout_set_surface_anchor;
  void function(GdkPopupLayout* layout) c_gdk_popup_layout_unref;

  // ProximityEvent
  extern(C) GType function() c_gdk_proximity_event_get_type;

  // RGBA
  extern(C) GType function() c_gdk_rgba_get_type;
  GdkRGBA* function(const(GdkRGBA)* rgba) c_gdk_rgba_copy;
  bool function(GdkRGBA* p1, GdkRGBA* p2) c_gdk_rgba_equal;
  void function(GdkRGBA* rgba) c_gdk_rgba_free;
  uint function(GdkRGBA* p) c_gdk_rgba_hash;
  bool function(const(GdkRGBA)* rgba) c_gdk_rgba_is_clear;
  bool function(const(GdkRGBA)* rgba) c_gdk_rgba_is_opaque;
  bool function(GdkRGBA* rgba, const(char)* spec) c_gdk_rgba_parse;
  char* function(const(GdkRGBA)* rgba) c_gdk_rgba_to_string;

  // Rectangle
  extern(C) GType function() c_gdk_rectangle_get_type;
  bool function(const(GdkRectangle)* rect, int x, int y) c_gdk_rectangle_contains_point;
  bool function(const(GdkRectangle)* rect1, const(GdkRectangle)* rect2) c_gdk_rectangle_equal;
  bool function(const(GdkRectangle)* src1, const(GdkRectangle)* src2, GdkRectangle* dest) c_gdk_rectangle_intersect;
  void function(const(GdkRectangle)* src1, const(GdkRectangle)* src2, GdkRectangle* dest) c_gdk_rectangle_union;

  // ScrollEvent
  extern(C) GType function() c_gdk_scroll_event_get_type;
  void function(GdkEvent* event, double* deltaX, double* deltaY) c_gdk_scroll_event_get_deltas;
  GdkScrollDirection function(GdkEvent* event) c_gdk_scroll_event_get_direction;
  GdkScrollUnit function(GdkEvent* event) c_gdk_scroll_event_get_unit;
  bool function(GdkEvent* event) c_gdk_scroll_event_is_stop;

  // Seat
  extern(C) GType function() c_gdk_seat_get_type;
  GdkSeatCapabilities function(GdkSeat* seat) c_gdk_seat_get_capabilities;
  GList* function(GdkSeat* seat, GdkSeatCapabilities capabilities) c_gdk_seat_get_devices;
  GdkDisplay* function(GdkSeat* seat) c_gdk_seat_get_display;
  GdkDevice* function(GdkSeat* seat) c_gdk_seat_get_keyboard;
  GdkDevice* function(GdkSeat* seat) c_gdk_seat_get_pointer;
  GList* function(GdkSeat* seat) c_gdk_seat_get_tools;

  // Snapshot
  extern(C) GType function() c_gdk_snapshot_get_type;

  // Surface
  extern(C) GType function() c_gdk_surface_get_type;
  GdkSurface* function(GdkSurface* parent, bool autohide) c_gdk_surface_new_popup;
  GdkSurface* function(GdkDisplay* display) c_gdk_surface_new_toplevel;
  void function(GdkSurface* surface) c_gdk_surface_beep;
  GdkCairoContext* function(GdkSurface* surface) c_gdk_surface_create_cairo_context;
  GdkGLContext* function(GdkSurface* surface, GError** _err) c_gdk_surface_create_gl_context;
  cairo_surface_t* function(GdkSurface* surface, cairo_content_t content, int width, int height) c_gdk_surface_create_similar_surface;
  GdkVulkanContext* function(GdkSurface* surface, GError** _err) c_gdk_surface_create_vulkan_context;
  void function(GdkSurface* surface) c_gdk_surface_destroy;
  GdkCursor* function(GdkSurface* surface) c_gdk_surface_get_cursor;
  GdkCursor* function(GdkSurface* surface, GdkDevice* device) c_gdk_surface_get_device_cursor;
  bool function(GdkSurface* surface, GdkDevice* device, double* x, double* y, GdkModifierType* mask) c_gdk_surface_get_device_position;
  GdkDisplay* function(GdkSurface* surface) c_gdk_surface_get_display;
  GdkFrameClock* function(GdkSurface* surface) c_gdk_surface_get_frame_clock;
  int function(GdkSurface* surface) c_gdk_surface_get_height;
  bool function(GdkSurface* surface) c_gdk_surface_get_mapped;
  double function(GdkSurface* surface) c_gdk_surface_get_scale;
  int function(GdkSurface* surface) c_gdk_surface_get_scale_factor;
  int function(GdkSurface* surface) c_gdk_surface_get_width;
  void function(GdkSurface* surface) c_gdk_surface_hide;
  bool function(GdkSurface* surface) c_gdk_surface_is_destroyed;
  void function(GdkSurface* surface) c_gdk_surface_queue_render;
  void function(GdkSurface* surface) c_gdk_surface_request_layout;
  void function(GdkSurface* surface, GdkCursor* cursor) c_gdk_surface_set_cursor;
  void function(GdkSurface* surface, GdkDevice* device, GdkCursor* cursor) c_gdk_surface_set_device_cursor;
  void function(GdkSurface* surface, cairo_region_t* region) c_gdk_surface_set_input_region;
  void function(GdkSurface* surface, cairo_region_t* region) c_gdk_surface_set_opaque_region;
  bool function(GdkSurface* from, GdkSurface* to, double* x, double* y) c_gdk_surface_translate_coordinates;

  // Texture
  extern(C) GType function() c_gdk_texture_get_type;
  GdkTexture* function(PixbufC* pixbuf) c_gdk_texture_new_for_pixbuf;
  GdkTexture* function(GBytes* bytes, GError** _err) c_gdk_texture_new_from_bytes;
  GdkTexture* function(GFile* file, GError** _err) c_gdk_texture_new_from_file;
  GdkTexture* function(const(char)* path, GError** _err) c_gdk_texture_new_from_filename;
  GdkTexture* function(const(char)* resourcePath) c_gdk_texture_new_from_resource;
  void function(GdkTexture* texture, ubyte* data, size_t stride) c_gdk_texture_download;
  GdkMemoryFormat function(GdkTexture* self) c_gdk_texture_get_format;
  int function(GdkTexture* texture) c_gdk_texture_get_height;
  int function(GdkTexture* texture) c_gdk_texture_get_width;
  bool function(GdkTexture* texture, const(char)* filename) c_gdk_texture_save_to_png;
  GBytes* function(GdkTexture* texture) c_gdk_texture_save_to_png_bytes;
  bool function(GdkTexture* texture, const(char)* filename) c_gdk_texture_save_to_tiff;
  GBytes* function(GdkTexture* texture) c_gdk_texture_save_to_tiff_bytes;

  // TextureDownloader
  extern(C) GType function() c_gdk_texture_downloader_get_type;
  GdkTextureDownloader* function(GdkTexture* texture) c_gdk_texture_downloader_new;
  GdkTextureDownloader* function(const(GdkTextureDownloader)* self) c_gdk_texture_downloader_copy;
  GBytes* function(const(GdkTextureDownloader)* self, size_t* outStride) c_gdk_texture_downloader_download_bytes;
  void function(const(GdkTextureDownloader)* self, ubyte* data, size_t stride) c_gdk_texture_downloader_download_into;
  void function(GdkTextureDownloader* self) c_gdk_texture_downloader_free;
  GdkMemoryFormat function(const(GdkTextureDownloader)* self) c_gdk_texture_downloader_get_format;
  GdkTexture* function(const(GdkTextureDownloader)* self) c_gdk_texture_downloader_get_texture;
  void function(GdkTextureDownloader* self, GdkMemoryFormat format) c_gdk_texture_downloader_set_format;
  void function(GdkTextureDownloader* self, GdkTexture* texture) c_gdk_texture_downloader_set_texture;

  // Toplevel
  extern(C) GType function() c_gdk_toplevel_get_type;
  void function(GdkToplevel* toplevel, GdkDevice* device, int button, double x, double y, uint timestamp) c_gdk_toplevel_begin_move;
  void function(GdkToplevel* toplevel, GdkSurfaceEdge edge, GdkDevice* device, int button, double x, double y, uint timestamp) c_gdk_toplevel_begin_resize;
  void function(GdkToplevel* toplevel, uint timestamp) c_gdk_toplevel_focus;
  GdkToplevelState function(GdkToplevel* toplevel) c_gdk_toplevel_get_state;
  void function(GdkToplevel* toplevel, GdkEvent* event) c_gdk_toplevel_inhibit_system_shortcuts;
  bool function(GdkToplevel* toplevel) c_gdk_toplevel_lower;
  bool function(GdkToplevel* toplevel) c_gdk_toplevel_minimize;
  void function(GdkToplevel* toplevel, GdkToplevelLayout* layout) c_gdk_toplevel_present;
  void function(GdkToplevel* toplevel) c_gdk_toplevel_restore_system_shortcuts;
  void function(GdkToplevel* toplevel, bool decorated) c_gdk_toplevel_set_decorated;
  void function(GdkToplevel* toplevel, bool deletable) c_gdk_toplevel_set_deletable;
  void function(GdkToplevel* toplevel, GList* surfaces) c_gdk_toplevel_set_icon_list;
  void function(GdkToplevel* toplevel, bool modal) c_gdk_toplevel_set_modal;
  void function(GdkToplevel* toplevel, const(char)* startupId) c_gdk_toplevel_set_startup_id;
  void function(GdkToplevel* toplevel, const(char)* title) c_gdk_toplevel_set_title;
  void function(GdkToplevel* toplevel, GdkSurface* parent) c_gdk_toplevel_set_transient_for;
  bool function(GdkToplevel* toplevel, GdkEvent* event) c_gdk_toplevel_show_window_menu;
  bool function(GdkToplevel* toplevel) c_gdk_toplevel_supports_edge_constraints;
  bool function(GdkToplevel* toplevel, GdkTitlebarGesture gesture) c_gdk_toplevel_titlebar_gesture;

  // ToplevelLayout
  extern(C) GType function() c_gdk_toplevel_layout_get_type;
  GdkToplevelLayout* function() c_gdk_toplevel_layout_new;
  GdkToplevelLayout* function(GdkToplevelLayout* layout) c_gdk_toplevel_layout_copy;
  bool function(GdkToplevelLayout* layout, GdkToplevelLayout* other) c_gdk_toplevel_layout_equal;
  bool function(GdkToplevelLayout* layout, bool* fullscreen) c_gdk_toplevel_layout_get_fullscreen;
  GdkMonitor* function(GdkToplevelLayout* layout) c_gdk_toplevel_layout_get_fullscreen_monitor;
  bool function(GdkToplevelLayout* layout, bool* maximized) c_gdk_toplevel_layout_get_maximized;
  bool function(GdkToplevelLayout* layout) c_gdk_toplevel_layout_get_resizable;
  GdkToplevelLayout* function(GdkToplevelLayout* layout) c_gdk_toplevel_layout_ref;
  void function(GdkToplevelLayout* layout, bool fullscreen, GdkMonitor* monitor) c_gdk_toplevel_layout_set_fullscreen;
  void function(GdkToplevelLayout* layout, bool maximized) c_gdk_toplevel_layout_set_maximized;
  void function(GdkToplevelLayout* layout, bool resizable) c_gdk_toplevel_layout_set_resizable;
  void function(GdkToplevelLayout* layout) c_gdk_toplevel_layout_unref;

  // ToplevelSize
  void function(GdkToplevelSize* size, int* boundsWidth, int* boundsHeight) c_gdk_toplevel_size_get_bounds;
  void function(GdkToplevelSize* size, int minWidth, int minHeight) c_gdk_toplevel_size_set_min_size;
  void function(GdkToplevelSize* size, int left, int right, int top, int bottom) c_gdk_toplevel_size_set_shadow_width;
  void function(GdkToplevelSize* size, int width, int height) c_gdk_toplevel_size_set_size;

  // TouchEvent
  extern(C) GType function() c_gdk_touch_event_get_type;
  bool function(GdkEvent* event) c_gdk_touch_event_get_emulating_pointer;

  // TouchpadEvent
  extern(C) GType function() c_gdk_touchpad_event_get_type;
  void function(GdkEvent* event, double* dx, double* dy) c_gdk_touchpad_event_get_deltas;
  GdkTouchpadGesturePhase function(GdkEvent* event) c_gdk_touchpad_event_get_gesture_phase;
  uint function(GdkEvent* event) c_gdk_touchpad_event_get_n_fingers;
  double function(GdkEvent* event) c_gdk_touchpad_event_get_pinch_angle_delta;
  double function(GdkEvent* event) c_gdk_touchpad_event_get_pinch_scale;

  // VulkanContext
  extern(C) GType function() c_gdk_vulkan_context_get_type;
}

// AppLaunchContext
alias gdk_app_launch_context_get_type = c_gdk_app_launch_context_get_type;
alias gdk_app_launch_context_get_display = c_gdk_app_launch_context_get_display;
alias gdk_app_launch_context_set_desktop = c_gdk_app_launch_context_set_desktop;
alias gdk_app_launch_context_set_icon = c_gdk_app_launch_context_set_icon;
alias gdk_app_launch_context_set_icon_name = c_gdk_app_launch_context_set_icon_name;
alias gdk_app_launch_context_set_timestamp = c_gdk_app_launch_context_set_timestamp;

// ButtonEvent
alias gdk_button_event_get_type = c_gdk_button_event_get_type;
alias gdk_button_event_get_button = c_gdk_button_event_get_button;

// CairoContext
alias gdk_cairo_context_get_type = c_gdk_cairo_context_get_type;
alias gdk_cairo_context_cairo_create = c_gdk_cairo_context_cairo_create;

// Clipboard
alias gdk_clipboard_get_type = c_gdk_clipboard_get_type;
alias gdk_clipboard_get_content = c_gdk_clipboard_get_content;
alias gdk_clipboard_get_display = c_gdk_clipboard_get_display;
alias gdk_clipboard_get_formats = c_gdk_clipboard_get_formats;
alias gdk_clipboard_is_local = c_gdk_clipboard_is_local;
alias gdk_clipboard_read_async = c_gdk_clipboard_read_async;
alias gdk_clipboard_read_finish = c_gdk_clipboard_read_finish;
alias gdk_clipboard_read_text_async = c_gdk_clipboard_read_text_async;
alias gdk_clipboard_read_text_finish = c_gdk_clipboard_read_text_finish;
alias gdk_clipboard_read_texture_async = c_gdk_clipboard_read_texture_async;
alias gdk_clipboard_read_texture_finish = c_gdk_clipboard_read_texture_finish;
alias gdk_clipboard_read_value_async = c_gdk_clipboard_read_value_async;
alias gdk_clipboard_read_value_finish = c_gdk_clipboard_read_value_finish;
alias gdk_clipboard_set = c_gdk_clipboard_set;
alias gdk_clipboard_set_content = c_gdk_clipboard_set_content;
alias gdk_clipboard_set_text = c_gdk_clipboard_set_text;
alias gdk_clipboard_set_texture = c_gdk_clipboard_set_texture;
alias gdk_clipboard_set_valist = c_gdk_clipboard_set_valist;
alias gdk_clipboard_set_value = c_gdk_clipboard_set_value;
alias gdk_clipboard_store_async = c_gdk_clipboard_store_async;
alias gdk_clipboard_store_finish = c_gdk_clipboard_store_finish;

// ContentDeserializer
alias gdk_content_deserializer_get_type = c_gdk_content_deserializer_get_type;
alias gdk_content_deserializer_get_cancellable = c_gdk_content_deserializer_get_cancellable;
alias gdk_content_deserializer_get_gtype = c_gdk_content_deserializer_get_gtype;
alias gdk_content_deserializer_get_input_stream = c_gdk_content_deserializer_get_input_stream;
alias gdk_content_deserializer_get_mime_type = c_gdk_content_deserializer_get_mime_type;
alias gdk_content_deserializer_get_priority = c_gdk_content_deserializer_get_priority;
alias gdk_content_deserializer_get_task_data = c_gdk_content_deserializer_get_task_data;
alias gdk_content_deserializer_get_user_data = c_gdk_content_deserializer_get_user_data;
alias gdk_content_deserializer_get_value = c_gdk_content_deserializer_get_value;
alias gdk_content_deserializer_return_error = c_gdk_content_deserializer_return_error;
alias gdk_content_deserializer_return_success = c_gdk_content_deserializer_return_success;
alias gdk_content_deserializer_set_task_data = c_gdk_content_deserializer_set_task_data;

// ContentFormats
alias gdk_content_formats_get_type = c_gdk_content_formats_get_type;
alias gdk_content_formats_new = c_gdk_content_formats_new;
alias gdk_content_formats_new_for_gtype = c_gdk_content_formats_new_for_gtype;
alias gdk_content_formats_contain_gtype = c_gdk_content_formats_contain_gtype;
alias gdk_content_formats_contain_mime_type = c_gdk_content_formats_contain_mime_type;
alias gdk_content_formats_get_gtypes = c_gdk_content_formats_get_gtypes;
alias gdk_content_formats_get_mime_types = c_gdk_content_formats_get_mime_types;
alias gdk_content_formats_match = c_gdk_content_formats_match;
alias gdk_content_formats_match_gtype = c_gdk_content_formats_match_gtype;
alias gdk_content_formats_match_mime_type = c_gdk_content_formats_match_mime_type;
alias gdk_content_formats_print = c_gdk_content_formats_print;
alias gdk_content_formats_ref = c_gdk_content_formats_ref;
alias gdk_content_formats_to_string = c_gdk_content_formats_to_string;
alias gdk_content_formats_union = c_gdk_content_formats_union;
alias gdk_content_formats_union_deserialize_gtypes = c_gdk_content_formats_union_deserialize_gtypes;
alias gdk_content_formats_union_deserialize_mime_types = c_gdk_content_formats_union_deserialize_mime_types;
alias gdk_content_formats_union_serialize_gtypes = c_gdk_content_formats_union_serialize_gtypes;
alias gdk_content_formats_union_serialize_mime_types = c_gdk_content_formats_union_serialize_mime_types;
alias gdk_content_formats_unref = c_gdk_content_formats_unref;
alias gdk_content_formats_parse = c_gdk_content_formats_parse;

// ContentFormatsBuilder
alias gdk_content_formats_builder_get_type = c_gdk_content_formats_builder_get_type;
alias gdk_content_formats_builder_new = c_gdk_content_formats_builder_new;
alias gdk_content_formats_builder_add_formats = c_gdk_content_formats_builder_add_formats;
alias gdk_content_formats_builder_add_gtype = c_gdk_content_formats_builder_add_gtype;
alias gdk_content_formats_builder_add_mime_type = c_gdk_content_formats_builder_add_mime_type;
alias gdk_content_formats_builder_free_to_formats = c_gdk_content_formats_builder_free_to_formats;
alias gdk_content_formats_builder_ref = c_gdk_content_formats_builder_ref;
alias gdk_content_formats_builder_to_formats = c_gdk_content_formats_builder_to_formats;
alias gdk_content_formats_builder_unref = c_gdk_content_formats_builder_unref;

// ContentProvider
alias gdk_content_provider_get_type = c_gdk_content_provider_get_type;
alias gdk_content_provider_new_for_bytes = c_gdk_content_provider_new_for_bytes;
alias gdk_content_provider_new_for_value = c_gdk_content_provider_new_for_value;
alias gdk_content_provider_new_typed = c_gdk_content_provider_new_typed;
alias gdk_content_provider_new_union = c_gdk_content_provider_new_union;
alias gdk_content_provider_content_changed = c_gdk_content_provider_content_changed;
alias gdk_content_provider_get_value = c_gdk_content_provider_get_value;
alias gdk_content_provider_ref_formats = c_gdk_content_provider_ref_formats;
alias gdk_content_provider_ref_storable_formats = c_gdk_content_provider_ref_storable_formats;
alias gdk_content_provider_write_mime_type_async = c_gdk_content_provider_write_mime_type_async;
alias gdk_content_provider_write_mime_type_finish = c_gdk_content_provider_write_mime_type_finish;

// ContentSerializer
alias gdk_content_serializer_get_type = c_gdk_content_serializer_get_type;
alias gdk_content_serializer_get_cancellable = c_gdk_content_serializer_get_cancellable;
alias gdk_content_serializer_get_gtype = c_gdk_content_serializer_get_gtype;
alias gdk_content_serializer_get_mime_type = c_gdk_content_serializer_get_mime_type;
alias gdk_content_serializer_get_output_stream = c_gdk_content_serializer_get_output_stream;
alias gdk_content_serializer_get_priority = c_gdk_content_serializer_get_priority;
alias gdk_content_serializer_get_task_data = c_gdk_content_serializer_get_task_data;
alias gdk_content_serializer_get_user_data = c_gdk_content_serializer_get_user_data;
alias gdk_content_serializer_get_value = c_gdk_content_serializer_get_value;
alias gdk_content_serializer_return_error = c_gdk_content_serializer_return_error;
alias gdk_content_serializer_return_success = c_gdk_content_serializer_return_success;
alias gdk_content_serializer_set_task_data = c_gdk_content_serializer_set_task_data;

// CrossingEvent
alias gdk_crossing_event_get_type = c_gdk_crossing_event_get_type;
alias gdk_crossing_event_get_detail = c_gdk_crossing_event_get_detail;
alias gdk_crossing_event_get_focus = c_gdk_crossing_event_get_focus;
alias gdk_crossing_event_get_mode = c_gdk_crossing_event_get_mode;

// Cursor
alias gdk_cursor_get_type = c_gdk_cursor_get_type;
alias gdk_cursor_new_from_name = c_gdk_cursor_new_from_name;
alias gdk_cursor_new_from_texture = c_gdk_cursor_new_from_texture;
alias gdk_cursor_get_fallback = c_gdk_cursor_get_fallback;
alias gdk_cursor_get_hotspot_x = c_gdk_cursor_get_hotspot_x;
alias gdk_cursor_get_hotspot_y = c_gdk_cursor_get_hotspot_y;
alias gdk_cursor_get_name = c_gdk_cursor_get_name;
alias gdk_cursor_get_texture = c_gdk_cursor_get_texture;

// DNDEvent
alias gdk_dnd_event_get_type = c_gdk_dnd_event_get_type;
alias gdk_dnd_event_get_drop = c_gdk_dnd_event_get_drop;

// DeleteEvent
alias gdk_delete_event_get_type = c_gdk_delete_event_get_type;

// Device
alias gdk_device_get_type = c_gdk_device_get_type;
alias gdk_device_get_caps_lock_state = c_gdk_device_get_caps_lock_state;
alias gdk_device_get_device_tool = c_gdk_device_get_device_tool;
alias gdk_device_get_direction = c_gdk_device_get_direction;
alias gdk_device_get_display = c_gdk_device_get_display;
alias gdk_device_get_has_cursor = c_gdk_device_get_has_cursor;
alias gdk_device_get_modifier_state = c_gdk_device_get_modifier_state;
alias gdk_device_get_name = c_gdk_device_get_name;
alias gdk_device_get_num_lock_state = c_gdk_device_get_num_lock_state;
alias gdk_device_get_num_touches = c_gdk_device_get_num_touches;
alias gdk_device_get_product_id = c_gdk_device_get_product_id;
alias gdk_device_get_scroll_lock_state = c_gdk_device_get_scroll_lock_state;
alias gdk_device_get_seat = c_gdk_device_get_seat;
alias gdk_device_get_source = c_gdk_device_get_source;
alias gdk_device_get_surface_at_position = c_gdk_device_get_surface_at_position;
alias gdk_device_get_timestamp = c_gdk_device_get_timestamp;
alias gdk_device_get_vendor_id = c_gdk_device_get_vendor_id;
alias gdk_device_has_bidi_layouts = c_gdk_device_has_bidi_layouts;

// DevicePad
alias gdk_device_pad_get_type = c_gdk_device_pad_get_type;
alias gdk_device_pad_get_feature_group = c_gdk_device_pad_get_feature_group;
alias gdk_device_pad_get_group_n_modes = c_gdk_device_pad_get_group_n_modes;
alias gdk_device_pad_get_n_features = c_gdk_device_pad_get_n_features;
alias gdk_device_pad_get_n_groups = c_gdk_device_pad_get_n_groups;

// DeviceTool
alias gdk_device_tool_get_type = c_gdk_device_tool_get_type;
alias gdk_device_tool_get_axes = c_gdk_device_tool_get_axes;
alias gdk_device_tool_get_hardware_id = c_gdk_device_tool_get_hardware_id;
alias gdk_device_tool_get_serial = c_gdk_device_tool_get_serial;
alias gdk_device_tool_get_tool_type = c_gdk_device_tool_get_tool_type;

// Display
alias gdk_display_get_type = c_gdk_display_get_type;
alias gdk_display_get_default = c_gdk_display_get_default;
alias gdk_display_open = c_gdk_display_open;
alias gdk_display_beep = c_gdk_display_beep;
alias gdk_display_close = c_gdk_display_close;
alias gdk_display_create_gl_context = c_gdk_display_create_gl_context;
alias gdk_display_device_is_grabbed = c_gdk_display_device_is_grabbed;
alias gdk_display_flush = c_gdk_display_flush;
alias gdk_display_get_app_launch_context = c_gdk_display_get_app_launch_context;
alias gdk_display_get_clipboard = c_gdk_display_get_clipboard;
alias gdk_display_get_default_seat = c_gdk_display_get_default_seat;
alias gdk_display_get_dmabuf_formats = c_gdk_display_get_dmabuf_formats;
alias gdk_display_get_monitor_at_surface = c_gdk_display_get_monitor_at_surface;
alias gdk_display_get_monitors = c_gdk_display_get_monitors;
alias gdk_display_get_name = c_gdk_display_get_name;
alias gdk_display_get_primary_clipboard = c_gdk_display_get_primary_clipboard;
alias gdk_display_get_setting = c_gdk_display_get_setting;
alias gdk_display_get_startup_notification_id = c_gdk_display_get_startup_notification_id;
alias gdk_display_is_closed = c_gdk_display_is_closed;
alias gdk_display_is_composited = c_gdk_display_is_composited;
alias gdk_display_is_rgba = c_gdk_display_is_rgba;
alias gdk_display_list_seats = c_gdk_display_list_seats;
alias gdk_display_map_keycode = c_gdk_display_map_keycode;
alias gdk_display_map_keyval = c_gdk_display_map_keyval;
alias gdk_display_notify_startup_complete = c_gdk_display_notify_startup_complete;
alias gdk_display_prepare_gl = c_gdk_display_prepare_gl;
alias gdk_display_put_event = c_gdk_display_put_event;
alias gdk_display_supports_input_shapes = c_gdk_display_supports_input_shapes;
alias gdk_display_supports_shadow_width = c_gdk_display_supports_shadow_width;
alias gdk_display_sync = c_gdk_display_sync;
alias gdk_display_translate_key = c_gdk_display_translate_key;

// DisplayManager
alias gdk_display_manager_get_type = c_gdk_display_manager_get_type;
alias gdk_display_manager_get = c_gdk_display_manager_get;
alias gdk_display_manager_get_default_display = c_gdk_display_manager_get_default_display;
alias gdk_display_manager_list_displays = c_gdk_display_manager_list_displays;
alias gdk_display_manager_open_display = c_gdk_display_manager_open_display;
alias gdk_display_manager_set_default_display = c_gdk_display_manager_set_default_display;

// DmabufFormats
alias gdk_dmabuf_formats_get_type = c_gdk_dmabuf_formats_get_type;
alias gdk_dmabuf_formats_contains = c_gdk_dmabuf_formats_contains;
alias gdk_dmabuf_formats_equal = c_gdk_dmabuf_formats_equal;
alias gdk_dmabuf_formats_get_format = c_gdk_dmabuf_formats_get_format;
alias gdk_dmabuf_formats_get_n_formats = c_gdk_dmabuf_formats_get_n_formats;
alias gdk_dmabuf_formats_ref = c_gdk_dmabuf_formats_ref;
alias gdk_dmabuf_formats_unref = c_gdk_dmabuf_formats_unref;

// DmabufTexture
alias gdk_dmabuf_texture_get_type = c_gdk_dmabuf_texture_get_type;

// DmabufTextureBuilder
alias gdk_dmabuf_texture_builder_get_type = c_gdk_dmabuf_texture_builder_get_type;
alias gdk_dmabuf_texture_builder_new = c_gdk_dmabuf_texture_builder_new;
alias gdk_dmabuf_texture_builder_build = c_gdk_dmabuf_texture_builder_build;
alias gdk_dmabuf_texture_builder_get_display = c_gdk_dmabuf_texture_builder_get_display;
alias gdk_dmabuf_texture_builder_get_fd = c_gdk_dmabuf_texture_builder_get_fd;
alias gdk_dmabuf_texture_builder_get_fourcc = c_gdk_dmabuf_texture_builder_get_fourcc;
alias gdk_dmabuf_texture_builder_get_height = c_gdk_dmabuf_texture_builder_get_height;
alias gdk_dmabuf_texture_builder_get_modifier = c_gdk_dmabuf_texture_builder_get_modifier;
alias gdk_dmabuf_texture_builder_get_n_planes = c_gdk_dmabuf_texture_builder_get_n_planes;
alias gdk_dmabuf_texture_builder_get_offset = c_gdk_dmabuf_texture_builder_get_offset;
alias gdk_dmabuf_texture_builder_get_premultiplied = c_gdk_dmabuf_texture_builder_get_premultiplied;
alias gdk_dmabuf_texture_builder_get_stride = c_gdk_dmabuf_texture_builder_get_stride;
alias gdk_dmabuf_texture_builder_get_update_region = c_gdk_dmabuf_texture_builder_get_update_region;
alias gdk_dmabuf_texture_builder_get_update_texture = c_gdk_dmabuf_texture_builder_get_update_texture;
alias gdk_dmabuf_texture_builder_get_width = c_gdk_dmabuf_texture_builder_get_width;
alias gdk_dmabuf_texture_builder_set_display = c_gdk_dmabuf_texture_builder_set_display;
alias gdk_dmabuf_texture_builder_set_fd = c_gdk_dmabuf_texture_builder_set_fd;
alias gdk_dmabuf_texture_builder_set_fourcc = c_gdk_dmabuf_texture_builder_set_fourcc;
alias gdk_dmabuf_texture_builder_set_height = c_gdk_dmabuf_texture_builder_set_height;
alias gdk_dmabuf_texture_builder_set_modifier = c_gdk_dmabuf_texture_builder_set_modifier;
alias gdk_dmabuf_texture_builder_set_n_planes = c_gdk_dmabuf_texture_builder_set_n_planes;
alias gdk_dmabuf_texture_builder_set_offset = c_gdk_dmabuf_texture_builder_set_offset;
alias gdk_dmabuf_texture_builder_set_premultiplied = c_gdk_dmabuf_texture_builder_set_premultiplied;
alias gdk_dmabuf_texture_builder_set_stride = c_gdk_dmabuf_texture_builder_set_stride;
alias gdk_dmabuf_texture_builder_set_update_region = c_gdk_dmabuf_texture_builder_set_update_region;
alias gdk_dmabuf_texture_builder_set_update_texture = c_gdk_dmabuf_texture_builder_set_update_texture;
alias gdk_dmabuf_texture_builder_set_width = c_gdk_dmabuf_texture_builder_set_width;

// Drag
alias gdk_drag_get_type = c_gdk_drag_get_type;
alias gdk_drag_begin = c_gdk_drag_begin;
alias gdk_drag_drop_done = c_gdk_drag_drop_done;
alias gdk_drag_get_actions = c_gdk_drag_get_actions;
alias gdk_drag_get_content = c_gdk_drag_get_content;
alias gdk_drag_get_device = c_gdk_drag_get_device;
alias gdk_drag_get_display = c_gdk_drag_get_display;
alias gdk_drag_get_drag_surface = c_gdk_drag_get_drag_surface;
alias gdk_drag_get_formats = c_gdk_drag_get_formats;
alias gdk_drag_get_selected_action = c_gdk_drag_get_selected_action;
alias gdk_drag_get_surface = c_gdk_drag_get_surface;
alias gdk_drag_set_hotspot = c_gdk_drag_set_hotspot;

// DragSurface
alias gdk_drag_surface_get_type = c_gdk_drag_surface_get_type;
alias gdk_drag_surface_present = c_gdk_drag_surface_present;

// DragSurfaceSize
alias gdk_drag_surface_size_set_size = c_gdk_drag_surface_size_set_size;

// DrawContext
alias gdk_draw_context_get_type = c_gdk_draw_context_get_type;
alias gdk_draw_context_begin_frame = c_gdk_draw_context_begin_frame;
alias gdk_draw_context_end_frame = c_gdk_draw_context_end_frame;
alias gdk_draw_context_get_display = c_gdk_draw_context_get_display;
alias gdk_draw_context_get_frame_region = c_gdk_draw_context_get_frame_region;
alias gdk_draw_context_get_surface = c_gdk_draw_context_get_surface;
alias gdk_draw_context_is_in_frame = c_gdk_draw_context_is_in_frame;

// Drop
alias gdk_drop_get_type = c_gdk_drop_get_type;
alias gdk_drop_finish = c_gdk_drop_finish;
alias gdk_drop_get_actions = c_gdk_drop_get_actions;
alias gdk_drop_get_device = c_gdk_drop_get_device;
alias gdk_drop_get_display = c_gdk_drop_get_display;
alias gdk_drop_get_drag = c_gdk_drop_get_drag;
alias gdk_drop_get_formats = c_gdk_drop_get_formats;
alias gdk_drop_get_surface = c_gdk_drop_get_surface;
alias gdk_drop_read_async = c_gdk_drop_read_async;
alias gdk_drop_read_finish = c_gdk_drop_read_finish;
alias gdk_drop_read_value_async = c_gdk_drop_read_value_async;
alias gdk_drop_read_value_finish = c_gdk_drop_read_value_finish;
alias gdk_drop_status = c_gdk_drop_status;

// Event
alias gdk_event_get_type = c_gdk_event_get_type;
alias gdk_event_get_axes = c_gdk_event_get_axes;
alias gdk_event_get_axis = c_gdk_event_get_axis;
alias gdk_event_get_device = c_gdk_event_get_device;
alias gdk_event_get_device_tool = c_gdk_event_get_device_tool;
alias gdk_event_get_display = c_gdk_event_get_display;
alias gdk_event_get_event_sequence = c_gdk_event_get_event_sequence;
alias gdk_event_get_event_type = c_gdk_event_get_event_type;
alias gdk_event_get_history = c_gdk_event_get_history;
alias gdk_event_get_modifier_state = c_gdk_event_get_modifier_state;
alias gdk_event_get_pointer_emulated = c_gdk_event_get_pointer_emulated;
alias gdk_event_get_position = c_gdk_event_get_position;
alias gdk_event_get_seat = c_gdk_event_get_seat;
alias gdk_event_get_surface = c_gdk_event_get_surface;
alias gdk_event_get_time = c_gdk_event_get_time;
alias gdk_event_ref = c_gdk_event_ref;
alias gdk_event_triggers_context_menu = c_gdk_event_triggers_context_menu;
alias gdk_event_unref = c_gdk_event_unref;

// EventSequence
alias gdk_event_sequence_get_type = c_gdk_event_sequence_get_type;

// FileList
alias gdk_file_list_get_type = c_gdk_file_list_get_type;
alias gdk_file_list_new_from_array = c_gdk_file_list_new_from_array;
alias gdk_file_list_new_from_list = c_gdk_file_list_new_from_list;
alias gdk_file_list_get_files = c_gdk_file_list_get_files;

// FocusEvent
alias gdk_focus_event_get_type = c_gdk_focus_event_get_type;
alias gdk_focus_event_get_in = c_gdk_focus_event_get_in;

// FrameClock
alias gdk_frame_clock_get_type = c_gdk_frame_clock_get_type;
alias gdk_frame_clock_begin_updating = c_gdk_frame_clock_begin_updating;
alias gdk_frame_clock_end_updating = c_gdk_frame_clock_end_updating;
alias gdk_frame_clock_get_current_timings = c_gdk_frame_clock_get_current_timings;
alias gdk_frame_clock_get_fps = c_gdk_frame_clock_get_fps;
alias gdk_frame_clock_get_frame_counter = c_gdk_frame_clock_get_frame_counter;
alias gdk_frame_clock_get_frame_time = c_gdk_frame_clock_get_frame_time;
alias gdk_frame_clock_get_history_start = c_gdk_frame_clock_get_history_start;
alias gdk_frame_clock_get_refresh_info = c_gdk_frame_clock_get_refresh_info;
alias gdk_frame_clock_get_timings = c_gdk_frame_clock_get_timings;
alias gdk_frame_clock_request_phase = c_gdk_frame_clock_request_phase;

// FrameTimings
alias gdk_frame_timings_get_type = c_gdk_frame_timings_get_type;
alias gdk_frame_timings_get_complete = c_gdk_frame_timings_get_complete;
alias gdk_frame_timings_get_frame_counter = c_gdk_frame_timings_get_frame_counter;
alias gdk_frame_timings_get_frame_time = c_gdk_frame_timings_get_frame_time;
alias gdk_frame_timings_get_predicted_presentation_time = c_gdk_frame_timings_get_predicted_presentation_time;
alias gdk_frame_timings_get_presentation_time = c_gdk_frame_timings_get_presentation_time;
alias gdk_frame_timings_get_refresh_interval = c_gdk_frame_timings_get_refresh_interval;
alias gdk_frame_timings_ref = c_gdk_frame_timings_ref;
alias gdk_frame_timings_unref = c_gdk_frame_timings_unref;

// GLContext
alias gdk_gl_context_get_type = c_gdk_gl_context_get_type;
alias gdk_gl_context_clear_current = c_gdk_gl_context_clear_current;
alias gdk_gl_context_get_current = c_gdk_gl_context_get_current;
alias gdk_gl_context_get_allowed_apis = c_gdk_gl_context_get_allowed_apis;
alias gdk_gl_context_get_api = c_gdk_gl_context_get_api;
alias gdk_gl_context_get_debug_enabled = c_gdk_gl_context_get_debug_enabled;
alias gdk_gl_context_get_display = c_gdk_gl_context_get_display;
alias gdk_gl_context_get_forward_compatible = c_gdk_gl_context_get_forward_compatible;
alias gdk_gl_context_get_required_version = c_gdk_gl_context_get_required_version;
alias gdk_gl_context_get_shared_context = c_gdk_gl_context_get_shared_context;
alias gdk_gl_context_get_surface = c_gdk_gl_context_get_surface;
alias gdk_gl_context_get_use_es = c_gdk_gl_context_get_use_es;
alias gdk_gl_context_get_version = c_gdk_gl_context_get_version;
alias gdk_gl_context_is_legacy = c_gdk_gl_context_is_legacy;
alias gdk_gl_context_is_shared = c_gdk_gl_context_is_shared;
alias gdk_gl_context_make_current = c_gdk_gl_context_make_current;
alias gdk_gl_context_realize = c_gdk_gl_context_realize;
alias gdk_gl_context_set_allowed_apis = c_gdk_gl_context_set_allowed_apis;
alias gdk_gl_context_set_debug_enabled = c_gdk_gl_context_set_debug_enabled;
alias gdk_gl_context_set_forward_compatible = c_gdk_gl_context_set_forward_compatible;
alias gdk_gl_context_set_required_version = c_gdk_gl_context_set_required_version;
alias gdk_gl_context_set_use_es = c_gdk_gl_context_set_use_es;

// GLTexture
alias gdk_gl_texture_get_type = c_gdk_gl_texture_get_type;
alias gdk_gl_texture_new = c_gdk_gl_texture_new;
alias gdk_gl_texture_release = c_gdk_gl_texture_release;

// GLTextureBuilder
alias gdk_gl_texture_builder_get_type = c_gdk_gl_texture_builder_get_type;
alias gdk_gl_texture_builder_new = c_gdk_gl_texture_builder_new;
alias gdk_gl_texture_builder_build = c_gdk_gl_texture_builder_build;
alias gdk_gl_texture_builder_get_context = c_gdk_gl_texture_builder_get_context;
alias gdk_gl_texture_builder_get_format = c_gdk_gl_texture_builder_get_format;
alias gdk_gl_texture_builder_get_has_mipmap = c_gdk_gl_texture_builder_get_has_mipmap;
alias gdk_gl_texture_builder_get_height = c_gdk_gl_texture_builder_get_height;
alias gdk_gl_texture_builder_get_id = c_gdk_gl_texture_builder_get_id;
alias gdk_gl_texture_builder_get_sync = c_gdk_gl_texture_builder_get_sync;
alias gdk_gl_texture_builder_get_update_region = c_gdk_gl_texture_builder_get_update_region;
alias gdk_gl_texture_builder_get_update_texture = c_gdk_gl_texture_builder_get_update_texture;
alias gdk_gl_texture_builder_get_width = c_gdk_gl_texture_builder_get_width;
alias gdk_gl_texture_builder_set_context = c_gdk_gl_texture_builder_set_context;
alias gdk_gl_texture_builder_set_format = c_gdk_gl_texture_builder_set_format;
alias gdk_gl_texture_builder_set_has_mipmap = c_gdk_gl_texture_builder_set_has_mipmap;
alias gdk_gl_texture_builder_set_height = c_gdk_gl_texture_builder_set_height;
alias gdk_gl_texture_builder_set_id = c_gdk_gl_texture_builder_set_id;
alias gdk_gl_texture_builder_set_sync = c_gdk_gl_texture_builder_set_sync;
alias gdk_gl_texture_builder_set_update_region = c_gdk_gl_texture_builder_set_update_region;
alias gdk_gl_texture_builder_set_update_texture = c_gdk_gl_texture_builder_set_update_texture;
alias gdk_gl_texture_builder_set_width = c_gdk_gl_texture_builder_set_width;

// Global
alias gdk_cairo_draw_from_gl = c_gdk_cairo_draw_from_gl;
alias gdk_cairo_rectangle = c_gdk_cairo_rectangle;
alias gdk_cairo_region = c_gdk_cairo_region;
alias gdk_cairo_region_create_from_surface = c_gdk_cairo_region_create_from_surface;
alias gdk_cairo_set_source_pixbuf = c_gdk_cairo_set_source_pixbuf;
alias gdk_cairo_set_source_rgba = c_gdk_cairo_set_source_rgba;
alias gdk_content_deserialize_async = c_gdk_content_deserialize_async;
alias gdk_content_deserialize_finish = c_gdk_content_deserialize_finish;
alias gdk_content_register_deserializer = c_gdk_content_register_deserializer;
alias gdk_content_register_serializer = c_gdk_content_register_serializer;
alias gdk_content_serialize_async = c_gdk_content_serialize_async;
alias gdk_content_serialize_finish = c_gdk_content_serialize_finish;
alias gdk_drag_surface_size_get_type = c_gdk_drag_surface_size_get_type;
alias gdk_events_get_angle = c_gdk_events_get_angle;
alias gdk_events_get_center = c_gdk_events_get_center;
alias gdk_events_get_distance = c_gdk_events_get_distance;
alias gdk_intern_mime_type = c_gdk_intern_mime_type;
alias gdk_keyval_convert_case = c_gdk_keyval_convert_case;
alias gdk_keyval_from_name = c_gdk_keyval_from_name;
alias gdk_keyval_is_lower = c_gdk_keyval_is_lower;
alias gdk_keyval_is_upper = c_gdk_keyval_is_upper;
alias gdk_keyval_name = c_gdk_keyval_name;
alias gdk_keyval_to_lower = c_gdk_keyval_to_lower;
alias gdk_keyval_to_unicode = c_gdk_keyval_to_unicode;
alias gdk_keyval_to_upper = c_gdk_keyval_to_upper;
alias gdk_pango_layout_get_clip_region = c_gdk_pango_layout_get_clip_region;
alias gdk_pango_layout_line_get_clip_region = c_gdk_pango_layout_line_get_clip_region;
alias gdk_pixbuf_get_from_surface = c_gdk_pixbuf_get_from_surface;
alias gdk_pixbuf_get_from_texture = c_gdk_pixbuf_get_from_texture;
alias gdk_set_allowed_backends = c_gdk_set_allowed_backends;
alias gdk_toplevel_size_get_type = c_gdk_toplevel_size_get_type;
alias gdk_unicode_to_keyval = c_gdk_unicode_to_keyval;

// GrabBrokenEvent
alias gdk_grab_broken_event_get_type = c_gdk_grab_broken_event_get_type;
alias gdk_grab_broken_event_get_grab_surface = c_gdk_grab_broken_event_get_grab_surface;
alias gdk_grab_broken_event_get_implicit = c_gdk_grab_broken_event_get_implicit;

// KeyEvent
alias gdk_key_event_get_type = c_gdk_key_event_get_type;
alias gdk_key_event_get_consumed_modifiers = c_gdk_key_event_get_consumed_modifiers;
alias gdk_key_event_get_keycode = c_gdk_key_event_get_keycode;
alias gdk_key_event_get_keyval = c_gdk_key_event_get_keyval;
alias gdk_key_event_get_layout = c_gdk_key_event_get_layout;
alias gdk_key_event_get_level = c_gdk_key_event_get_level;
alias gdk_key_event_get_match = c_gdk_key_event_get_match;
alias gdk_key_event_is_modifier = c_gdk_key_event_is_modifier;
alias gdk_key_event_matches = c_gdk_key_event_matches;

// MemoryTexture
alias gdk_memory_texture_get_type = c_gdk_memory_texture_get_type;
alias gdk_memory_texture_new = c_gdk_memory_texture_new;

// MonitorG
alias gdk_monitor_get_type = c_gdk_monitor_get_type;
alias gdk_monitor_get_connector = c_gdk_monitor_get_connector;
alias gdk_monitor_get_description = c_gdk_monitor_get_description;
alias gdk_monitor_get_display = c_gdk_monitor_get_display;
alias gdk_monitor_get_geometry = c_gdk_monitor_get_geometry;
alias gdk_monitor_get_height_mm = c_gdk_monitor_get_height_mm;
alias gdk_monitor_get_manufacturer = c_gdk_monitor_get_manufacturer;
alias gdk_monitor_get_model = c_gdk_monitor_get_model;
alias gdk_monitor_get_refresh_rate = c_gdk_monitor_get_refresh_rate;
alias gdk_monitor_get_scale = c_gdk_monitor_get_scale;
alias gdk_monitor_get_scale_factor = c_gdk_monitor_get_scale_factor;
alias gdk_monitor_get_subpixel_layout = c_gdk_monitor_get_subpixel_layout;
alias gdk_monitor_get_width_mm = c_gdk_monitor_get_width_mm;
alias gdk_monitor_is_valid = c_gdk_monitor_is_valid;

// MotionEvent
alias gdk_motion_event_get_type = c_gdk_motion_event_get_type;

// PadEvent
alias gdk_pad_event_get_type = c_gdk_pad_event_get_type;
alias gdk_pad_event_get_axis_value = c_gdk_pad_event_get_axis_value;
alias gdk_pad_event_get_button = c_gdk_pad_event_get_button;
alias gdk_pad_event_get_group_mode = c_gdk_pad_event_get_group_mode;

// Paintable
alias gdk_paintable_get_type = c_gdk_paintable_get_type;
alias gdk_paintable_new_empty = c_gdk_paintable_new_empty;
alias gdk_paintable_compute_concrete_size = c_gdk_paintable_compute_concrete_size;
alias gdk_paintable_get_current_image = c_gdk_paintable_get_current_image;
alias gdk_paintable_get_flags = c_gdk_paintable_get_flags;
alias gdk_paintable_get_intrinsic_aspect_ratio = c_gdk_paintable_get_intrinsic_aspect_ratio;
alias gdk_paintable_get_intrinsic_height = c_gdk_paintable_get_intrinsic_height;
alias gdk_paintable_get_intrinsic_width = c_gdk_paintable_get_intrinsic_width;
alias gdk_paintable_invalidate_contents = c_gdk_paintable_invalidate_contents;
alias gdk_paintable_invalidate_size = c_gdk_paintable_invalidate_size;
alias gdk_paintable_snapshot = c_gdk_paintable_snapshot;

// Popup
alias gdk_popup_get_type = c_gdk_popup_get_type;
alias gdk_popup_get_autohide = c_gdk_popup_get_autohide;
alias gdk_popup_get_parent = c_gdk_popup_get_parent;
alias gdk_popup_get_position_x = c_gdk_popup_get_position_x;
alias gdk_popup_get_position_y = c_gdk_popup_get_position_y;
alias gdk_popup_get_rect_anchor = c_gdk_popup_get_rect_anchor;
alias gdk_popup_get_surface_anchor = c_gdk_popup_get_surface_anchor;
alias gdk_popup_present = c_gdk_popup_present;

// PopupLayout
alias gdk_popup_layout_get_type = c_gdk_popup_layout_get_type;
alias gdk_popup_layout_new = c_gdk_popup_layout_new;
alias gdk_popup_layout_copy = c_gdk_popup_layout_copy;
alias gdk_popup_layout_equal = c_gdk_popup_layout_equal;
alias gdk_popup_layout_get_anchor_hints = c_gdk_popup_layout_get_anchor_hints;
alias gdk_popup_layout_get_anchor_rect = c_gdk_popup_layout_get_anchor_rect;
alias gdk_popup_layout_get_offset = c_gdk_popup_layout_get_offset;
alias gdk_popup_layout_get_rect_anchor = c_gdk_popup_layout_get_rect_anchor;
alias gdk_popup_layout_get_shadow_width = c_gdk_popup_layout_get_shadow_width;
alias gdk_popup_layout_get_surface_anchor = c_gdk_popup_layout_get_surface_anchor;
alias gdk_popup_layout_ref = c_gdk_popup_layout_ref;
alias gdk_popup_layout_set_anchor_hints = c_gdk_popup_layout_set_anchor_hints;
alias gdk_popup_layout_set_anchor_rect = c_gdk_popup_layout_set_anchor_rect;
alias gdk_popup_layout_set_offset = c_gdk_popup_layout_set_offset;
alias gdk_popup_layout_set_rect_anchor = c_gdk_popup_layout_set_rect_anchor;
alias gdk_popup_layout_set_shadow_width = c_gdk_popup_layout_set_shadow_width;
alias gdk_popup_layout_set_surface_anchor = c_gdk_popup_layout_set_surface_anchor;
alias gdk_popup_layout_unref = c_gdk_popup_layout_unref;

// ProximityEvent
alias gdk_proximity_event_get_type = c_gdk_proximity_event_get_type;

// RGBA
alias gdk_rgba_get_type = c_gdk_rgba_get_type;
alias gdk_rgba_copy = c_gdk_rgba_copy;
alias gdk_rgba_equal = c_gdk_rgba_equal;
alias gdk_rgba_free = c_gdk_rgba_free;
alias gdk_rgba_hash = c_gdk_rgba_hash;
alias gdk_rgba_is_clear = c_gdk_rgba_is_clear;
alias gdk_rgba_is_opaque = c_gdk_rgba_is_opaque;
alias gdk_rgba_parse = c_gdk_rgba_parse;
alias gdk_rgba_to_string = c_gdk_rgba_to_string;

// Rectangle
alias gdk_rectangle_get_type = c_gdk_rectangle_get_type;
alias gdk_rectangle_contains_point = c_gdk_rectangle_contains_point;
alias gdk_rectangle_equal = c_gdk_rectangle_equal;
alias gdk_rectangle_intersect = c_gdk_rectangle_intersect;
alias gdk_rectangle_union = c_gdk_rectangle_union;

// ScrollEvent
alias gdk_scroll_event_get_type = c_gdk_scroll_event_get_type;
alias gdk_scroll_event_get_deltas = c_gdk_scroll_event_get_deltas;
alias gdk_scroll_event_get_direction = c_gdk_scroll_event_get_direction;
alias gdk_scroll_event_get_unit = c_gdk_scroll_event_get_unit;
alias gdk_scroll_event_is_stop = c_gdk_scroll_event_is_stop;

// Seat
alias gdk_seat_get_type = c_gdk_seat_get_type;
alias gdk_seat_get_capabilities = c_gdk_seat_get_capabilities;
alias gdk_seat_get_devices = c_gdk_seat_get_devices;
alias gdk_seat_get_display = c_gdk_seat_get_display;
alias gdk_seat_get_keyboard = c_gdk_seat_get_keyboard;
alias gdk_seat_get_pointer = c_gdk_seat_get_pointer;
alias gdk_seat_get_tools = c_gdk_seat_get_tools;

// Snapshot
alias gdk_snapshot_get_type = c_gdk_snapshot_get_type;

// Surface
alias gdk_surface_get_type = c_gdk_surface_get_type;
alias gdk_surface_new_popup = c_gdk_surface_new_popup;
alias gdk_surface_new_toplevel = c_gdk_surface_new_toplevel;
alias gdk_surface_beep = c_gdk_surface_beep;
alias gdk_surface_create_cairo_context = c_gdk_surface_create_cairo_context;
alias gdk_surface_create_gl_context = c_gdk_surface_create_gl_context;
alias gdk_surface_create_similar_surface = c_gdk_surface_create_similar_surface;
alias gdk_surface_create_vulkan_context = c_gdk_surface_create_vulkan_context;
alias gdk_surface_destroy = c_gdk_surface_destroy;
alias gdk_surface_get_cursor = c_gdk_surface_get_cursor;
alias gdk_surface_get_device_cursor = c_gdk_surface_get_device_cursor;
alias gdk_surface_get_device_position = c_gdk_surface_get_device_position;
alias gdk_surface_get_display = c_gdk_surface_get_display;
alias gdk_surface_get_frame_clock = c_gdk_surface_get_frame_clock;
alias gdk_surface_get_height = c_gdk_surface_get_height;
alias gdk_surface_get_mapped = c_gdk_surface_get_mapped;
alias gdk_surface_get_scale = c_gdk_surface_get_scale;
alias gdk_surface_get_scale_factor = c_gdk_surface_get_scale_factor;
alias gdk_surface_get_width = c_gdk_surface_get_width;
alias gdk_surface_hide = c_gdk_surface_hide;
alias gdk_surface_is_destroyed = c_gdk_surface_is_destroyed;
alias gdk_surface_queue_render = c_gdk_surface_queue_render;
alias gdk_surface_request_layout = c_gdk_surface_request_layout;
alias gdk_surface_set_cursor = c_gdk_surface_set_cursor;
alias gdk_surface_set_device_cursor = c_gdk_surface_set_device_cursor;
alias gdk_surface_set_input_region = c_gdk_surface_set_input_region;
alias gdk_surface_set_opaque_region = c_gdk_surface_set_opaque_region;
alias gdk_surface_translate_coordinates = c_gdk_surface_translate_coordinates;

// Texture
alias gdk_texture_get_type = c_gdk_texture_get_type;
alias gdk_texture_new_for_pixbuf = c_gdk_texture_new_for_pixbuf;
alias gdk_texture_new_from_bytes = c_gdk_texture_new_from_bytes;
alias gdk_texture_new_from_file = c_gdk_texture_new_from_file;
alias gdk_texture_new_from_filename = c_gdk_texture_new_from_filename;
alias gdk_texture_new_from_resource = c_gdk_texture_new_from_resource;
alias gdk_texture_download = c_gdk_texture_download;
alias gdk_texture_get_format = c_gdk_texture_get_format;
alias gdk_texture_get_height = c_gdk_texture_get_height;
alias gdk_texture_get_width = c_gdk_texture_get_width;
alias gdk_texture_save_to_png = c_gdk_texture_save_to_png;
alias gdk_texture_save_to_png_bytes = c_gdk_texture_save_to_png_bytes;
alias gdk_texture_save_to_tiff = c_gdk_texture_save_to_tiff;
alias gdk_texture_save_to_tiff_bytes = c_gdk_texture_save_to_tiff_bytes;

// TextureDownloader
alias gdk_texture_downloader_get_type = c_gdk_texture_downloader_get_type;
alias gdk_texture_downloader_new = c_gdk_texture_downloader_new;
alias gdk_texture_downloader_copy = c_gdk_texture_downloader_copy;
alias gdk_texture_downloader_download_bytes = c_gdk_texture_downloader_download_bytes;
alias gdk_texture_downloader_download_into = c_gdk_texture_downloader_download_into;
alias gdk_texture_downloader_free = c_gdk_texture_downloader_free;
alias gdk_texture_downloader_get_format = c_gdk_texture_downloader_get_format;
alias gdk_texture_downloader_get_texture = c_gdk_texture_downloader_get_texture;
alias gdk_texture_downloader_set_format = c_gdk_texture_downloader_set_format;
alias gdk_texture_downloader_set_texture = c_gdk_texture_downloader_set_texture;

// Toplevel
alias gdk_toplevel_get_type = c_gdk_toplevel_get_type;
alias gdk_toplevel_begin_move = c_gdk_toplevel_begin_move;
alias gdk_toplevel_begin_resize = c_gdk_toplevel_begin_resize;
alias gdk_toplevel_focus = c_gdk_toplevel_focus;
alias gdk_toplevel_get_state = c_gdk_toplevel_get_state;
alias gdk_toplevel_inhibit_system_shortcuts = c_gdk_toplevel_inhibit_system_shortcuts;
alias gdk_toplevel_lower = c_gdk_toplevel_lower;
alias gdk_toplevel_minimize = c_gdk_toplevel_minimize;
alias gdk_toplevel_present = c_gdk_toplevel_present;
alias gdk_toplevel_restore_system_shortcuts = c_gdk_toplevel_restore_system_shortcuts;
alias gdk_toplevel_set_decorated = c_gdk_toplevel_set_decorated;
alias gdk_toplevel_set_deletable = c_gdk_toplevel_set_deletable;
alias gdk_toplevel_set_icon_list = c_gdk_toplevel_set_icon_list;
alias gdk_toplevel_set_modal = c_gdk_toplevel_set_modal;
alias gdk_toplevel_set_startup_id = c_gdk_toplevel_set_startup_id;
alias gdk_toplevel_set_title = c_gdk_toplevel_set_title;
alias gdk_toplevel_set_transient_for = c_gdk_toplevel_set_transient_for;
alias gdk_toplevel_show_window_menu = c_gdk_toplevel_show_window_menu;
alias gdk_toplevel_supports_edge_constraints = c_gdk_toplevel_supports_edge_constraints;
alias gdk_toplevel_titlebar_gesture = c_gdk_toplevel_titlebar_gesture;

// ToplevelLayout
alias gdk_toplevel_layout_get_type = c_gdk_toplevel_layout_get_type;
alias gdk_toplevel_layout_new = c_gdk_toplevel_layout_new;
alias gdk_toplevel_layout_copy = c_gdk_toplevel_layout_copy;
alias gdk_toplevel_layout_equal = c_gdk_toplevel_layout_equal;
alias gdk_toplevel_layout_get_fullscreen = c_gdk_toplevel_layout_get_fullscreen;
alias gdk_toplevel_layout_get_fullscreen_monitor = c_gdk_toplevel_layout_get_fullscreen_monitor;
alias gdk_toplevel_layout_get_maximized = c_gdk_toplevel_layout_get_maximized;
alias gdk_toplevel_layout_get_resizable = c_gdk_toplevel_layout_get_resizable;
alias gdk_toplevel_layout_ref = c_gdk_toplevel_layout_ref;
alias gdk_toplevel_layout_set_fullscreen = c_gdk_toplevel_layout_set_fullscreen;
alias gdk_toplevel_layout_set_maximized = c_gdk_toplevel_layout_set_maximized;
alias gdk_toplevel_layout_set_resizable = c_gdk_toplevel_layout_set_resizable;
alias gdk_toplevel_layout_unref = c_gdk_toplevel_layout_unref;

// ToplevelSize
alias gdk_toplevel_size_get_bounds = c_gdk_toplevel_size_get_bounds;
alias gdk_toplevel_size_set_min_size = c_gdk_toplevel_size_set_min_size;
alias gdk_toplevel_size_set_shadow_width = c_gdk_toplevel_size_set_shadow_width;
alias gdk_toplevel_size_set_size = c_gdk_toplevel_size_set_size;

// TouchEvent
alias gdk_touch_event_get_type = c_gdk_touch_event_get_type;
alias gdk_touch_event_get_emulating_pointer = c_gdk_touch_event_get_emulating_pointer;

// TouchpadEvent
alias gdk_touchpad_event_get_type = c_gdk_touchpad_event_get_type;
alias gdk_touchpad_event_get_deltas = c_gdk_touchpad_event_get_deltas;
alias gdk_touchpad_event_get_gesture_phase = c_gdk_touchpad_event_get_gesture_phase;
alias gdk_touchpad_event_get_n_fingers = c_gdk_touchpad_event_get_n_fingers;
alias gdk_touchpad_event_get_pinch_angle_delta = c_gdk_touchpad_event_get_pinch_angle_delta;
alias gdk_touchpad_event_get_pinch_scale = c_gdk_touchpad_event_get_pinch_scale;

// VulkanContext
alias gdk_vulkan_context_get_type = c_gdk_vulkan_context_get_type;

shared static this()
{
  // AppLaunchContext
  gidLink(cast(void**)&gdk_app_launch_context_get_type, "gdk_app_launch_context_get_type", LIBS);
  gidLink(cast(void**)&gdk_app_launch_context_get_display, "gdk_app_launch_context_get_display", LIBS);
  gidLink(cast(void**)&gdk_app_launch_context_set_desktop, "gdk_app_launch_context_set_desktop", LIBS);
  gidLink(cast(void**)&gdk_app_launch_context_set_icon, "gdk_app_launch_context_set_icon", LIBS);
  gidLink(cast(void**)&gdk_app_launch_context_set_icon_name, "gdk_app_launch_context_set_icon_name", LIBS);
  gidLink(cast(void**)&gdk_app_launch_context_set_timestamp, "gdk_app_launch_context_set_timestamp", LIBS);

  // ButtonEvent
  gidLink(cast(void**)&gdk_button_event_get_type, "gdk_button_event_get_type", LIBS);
  gidLink(cast(void**)&gdk_button_event_get_button, "gdk_button_event_get_button", LIBS);

  // CairoContext
  gidLink(cast(void**)&gdk_cairo_context_get_type, "gdk_cairo_context_get_type", LIBS);
  gidLink(cast(void**)&gdk_cairo_context_cairo_create, "gdk_cairo_context_cairo_create", LIBS);

  // Clipboard
  gidLink(cast(void**)&gdk_clipboard_get_type, "gdk_clipboard_get_type", LIBS);
  gidLink(cast(void**)&gdk_clipboard_get_content, "gdk_clipboard_get_content", LIBS);
  gidLink(cast(void**)&gdk_clipboard_get_display, "gdk_clipboard_get_display", LIBS);
  gidLink(cast(void**)&gdk_clipboard_get_formats, "gdk_clipboard_get_formats", LIBS);
  gidLink(cast(void**)&gdk_clipboard_is_local, "gdk_clipboard_is_local", LIBS);
  gidLink(cast(void**)&gdk_clipboard_read_async, "gdk_clipboard_read_async", LIBS);
  gidLink(cast(void**)&gdk_clipboard_read_finish, "gdk_clipboard_read_finish", LIBS);
  gidLink(cast(void**)&gdk_clipboard_read_text_async, "gdk_clipboard_read_text_async", LIBS);
  gidLink(cast(void**)&gdk_clipboard_read_text_finish, "gdk_clipboard_read_text_finish", LIBS);
  gidLink(cast(void**)&gdk_clipboard_read_texture_async, "gdk_clipboard_read_texture_async", LIBS);
  gidLink(cast(void**)&gdk_clipboard_read_texture_finish, "gdk_clipboard_read_texture_finish", LIBS);
  gidLink(cast(void**)&gdk_clipboard_read_value_async, "gdk_clipboard_read_value_async", LIBS);
  gidLink(cast(void**)&gdk_clipboard_read_value_finish, "gdk_clipboard_read_value_finish", LIBS);
  gidLink(cast(void**)&gdk_clipboard_set, "gdk_clipboard_set", LIBS);
  gidLink(cast(void**)&gdk_clipboard_set_content, "gdk_clipboard_set_content", LIBS);
  gidLink(cast(void**)&gdk_clipboard_set_text, "gdk_clipboard_set_text", LIBS);
  gidLink(cast(void**)&gdk_clipboard_set_texture, "gdk_clipboard_set_texture", LIBS);
  gidLink(cast(void**)&gdk_clipboard_set_valist, "gdk_clipboard_set_valist", LIBS);
  gidLink(cast(void**)&gdk_clipboard_set_value, "gdk_clipboard_set_value", LIBS);
  gidLink(cast(void**)&gdk_clipboard_store_async, "gdk_clipboard_store_async", LIBS);
  gidLink(cast(void**)&gdk_clipboard_store_finish, "gdk_clipboard_store_finish", LIBS);

  // ContentDeserializer
  gidLink(cast(void**)&gdk_content_deserializer_get_type, "gdk_content_deserializer_get_type", LIBS);
  gidLink(cast(void**)&gdk_content_deserializer_get_cancellable, "gdk_content_deserializer_get_cancellable", LIBS);
  gidLink(cast(void**)&gdk_content_deserializer_get_gtype, "gdk_content_deserializer_get_gtype", LIBS);
  gidLink(cast(void**)&gdk_content_deserializer_get_input_stream, "gdk_content_deserializer_get_input_stream", LIBS);
  gidLink(cast(void**)&gdk_content_deserializer_get_mime_type, "gdk_content_deserializer_get_mime_type", LIBS);
  gidLink(cast(void**)&gdk_content_deserializer_get_priority, "gdk_content_deserializer_get_priority", LIBS);
  gidLink(cast(void**)&gdk_content_deserializer_get_task_data, "gdk_content_deserializer_get_task_data", LIBS);
  gidLink(cast(void**)&gdk_content_deserializer_get_user_data, "gdk_content_deserializer_get_user_data", LIBS);
  gidLink(cast(void**)&gdk_content_deserializer_get_value, "gdk_content_deserializer_get_value", LIBS);
  gidLink(cast(void**)&gdk_content_deserializer_return_error, "gdk_content_deserializer_return_error", LIBS);
  gidLink(cast(void**)&gdk_content_deserializer_return_success, "gdk_content_deserializer_return_success", LIBS);
  gidLink(cast(void**)&gdk_content_deserializer_set_task_data, "gdk_content_deserializer_set_task_data", LIBS);

  // ContentFormats
  gidLink(cast(void**)&gdk_content_formats_get_type, "gdk_content_formats_get_type", LIBS);
  gidLink(cast(void**)&gdk_content_formats_new, "gdk_content_formats_new", LIBS);
  gidLink(cast(void**)&gdk_content_formats_new_for_gtype, "gdk_content_formats_new_for_gtype", LIBS);
  gidLink(cast(void**)&gdk_content_formats_contain_gtype, "gdk_content_formats_contain_gtype", LIBS);
  gidLink(cast(void**)&gdk_content_formats_contain_mime_type, "gdk_content_formats_contain_mime_type", LIBS);
  gidLink(cast(void**)&gdk_content_formats_get_gtypes, "gdk_content_formats_get_gtypes", LIBS);
  gidLink(cast(void**)&gdk_content_formats_get_mime_types, "gdk_content_formats_get_mime_types", LIBS);
  gidLink(cast(void**)&gdk_content_formats_match, "gdk_content_formats_match", LIBS);
  gidLink(cast(void**)&gdk_content_formats_match_gtype, "gdk_content_formats_match_gtype", LIBS);
  gidLink(cast(void**)&gdk_content_formats_match_mime_type, "gdk_content_formats_match_mime_type", LIBS);
  gidLink(cast(void**)&gdk_content_formats_print, "gdk_content_formats_print", LIBS);
  gidLink(cast(void**)&gdk_content_formats_ref, "gdk_content_formats_ref", LIBS);
  gidLink(cast(void**)&gdk_content_formats_to_string, "gdk_content_formats_to_string", LIBS);
  gidLink(cast(void**)&gdk_content_formats_union, "gdk_content_formats_union", LIBS);
  gidLink(cast(void**)&gdk_content_formats_union_deserialize_gtypes, "gdk_content_formats_union_deserialize_gtypes", LIBS);
  gidLink(cast(void**)&gdk_content_formats_union_deserialize_mime_types, "gdk_content_formats_union_deserialize_mime_types", LIBS);
  gidLink(cast(void**)&gdk_content_formats_union_serialize_gtypes, "gdk_content_formats_union_serialize_gtypes", LIBS);
  gidLink(cast(void**)&gdk_content_formats_union_serialize_mime_types, "gdk_content_formats_union_serialize_mime_types", LIBS);
  gidLink(cast(void**)&gdk_content_formats_unref, "gdk_content_formats_unref", LIBS);
  gidLink(cast(void**)&gdk_content_formats_parse, "gdk_content_formats_parse", LIBS);

  // ContentFormatsBuilder
  gidLink(cast(void**)&gdk_content_formats_builder_get_type, "gdk_content_formats_builder_get_type", LIBS);
  gidLink(cast(void**)&gdk_content_formats_builder_new, "gdk_content_formats_builder_new", LIBS);
  gidLink(cast(void**)&gdk_content_formats_builder_add_formats, "gdk_content_formats_builder_add_formats", LIBS);
  gidLink(cast(void**)&gdk_content_formats_builder_add_gtype, "gdk_content_formats_builder_add_gtype", LIBS);
  gidLink(cast(void**)&gdk_content_formats_builder_add_mime_type, "gdk_content_formats_builder_add_mime_type", LIBS);
  gidLink(cast(void**)&gdk_content_formats_builder_free_to_formats, "gdk_content_formats_builder_free_to_formats", LIBS);
  gidLink(cast(void**)&gdk_content_formats_builder_ref, "gdk_content_formats_builder_ref", LIBS);
  gidLink(cast(void**)&gdk_content_formats_builder_to_formats, "gdk_content_formats_builder_to_formats", LIBS);
  gidLink(cast(void**)&gdk_content_formats_builder_unref, "gdk_content_formats_builder_unref", LIBS);

  // ContentProvider
  gidLink(cast(void**)&gdk_content_provider_get_type, "gdk_content_provider_get_type", LIBS);
  gidLink(cast(void**)&gdk_content_provider_new_for_bytes, "gdk_content_provider_new_for_bytes", LIBS);
  gidLink(cast(void**)&gdk_content_provider_new_for_value, "gdk_content_provider_new_for_value", LIBS);
  gidLink(cast(void**)&gdk_content_provider_new_typed, "gdk_content_provider_new_typed", LIBS);
  gidLink(cast(void**)&gdk_content_provider_new_union, "gdk_content_provider_new_union", LIBS);
  gidLink(cast(void**)&gdk_content_provider_content_changed, "gdk_content_provider_content_changed", LIBS);
  gidLink(cast(void**)&gdk_content_provider_get_value, "gdk_content_provider_get_value", LIBS);
  gidLink(cast(void**)&gdk_content_provider_ref_formats, "gdk_content_provider_ref_formats", LIBS);
  gidLink(cast(void**)&gdk_content_provider_ref_storable_formats, "gdk_content_provider_ref_storable_formats", LIBS);
  gidLink(cast(void**)&gdk_content_provider_write_mime_type_async, "gdk_content_provider_write_mime_type_async", LIBS);
  gidLink(cast(void**)&gdk_content_provider_write_mime_type_finish, "gdk_content_provider_write_mime_type_finish", LIBS);

  // ContentSerializer
  gidLink(cast(void**)&gdk_content_serializer_get_type, "gdk_content_serializer_get_type", LIBS);
  gidLink(cast(void**)&gdk_content_serializer_get_cancellable, "gdk_content_serializer_get_cancellable", LIBS);
  gidLink(cast(void**)&gdk_content_serializer_get_gtype, "gdk_content_serializer_get_gtype", LIBS);
  gidLink(cast(void**)&gdk_content_serializer_get_mime_type, "gdk_content_serializer_get_mime_type", LIBS);
  gidLink(cast(void**)&gdk_content_serializer_get_output_stream, "gdk_content_serializer_get_output_stream", LIBS);
  gidLink(cast(void**)&gdk_content_serializer_get_priority, "gdk_content_serializer_get_priority", LIBS);
  gidLink(cast(void**)&gdk_content_serializer_get_task_data, "gdk_content_serializer_get_task_data", LIBS);
  gidLink(cast(void**)&gdk_content_serializer_get_user_data, "gdk_content_serializer_get_user_data", LIBS);
  gidLink(cast(void**)&gdk_content_serializer_get_value, "gdk_content_serializer_get_value", LIBS);
  gidLink(cast(void**)&gdk_content_serializer_return_error, "gdk_content_serializer_return_error", LIBS);
  gidLink(cast(void**)&gdk_content_serializer_return_success, "gdk_content_serializer_return_success", LIBS);
  gidLink(cast(void**)&gdk_content_serializer_set_task_data, "gdk_content_serializer_set_task_data", LIBS);

  // CrossingEvent
  gidLink(cast(void**)&gdk_crossing_event_get_type, "gdk_crossing_event_get_type", LIBS);
  gidLink(cast(void**)&gdk_crossing_event_get_detail, "gdk_crossing_event_get_detail", LIBS);
  gidLink(cast(void**)&gdk_crossing_event_get_focus, "gdk_crossing_event_get_focus", LIBS);
  gidLink(cast(void**)&gdk_crossing_event_get_mode, "gdk_crossing_event_get_mode", LIBS);

  // Cursor
  gidLink(cast(void**)&gdk_cursor_get_type, "gdk_cursor_get_type", LIBS);
  gidLink(cast(void**)&gdk_cursor_new_from_name, "gdk_cursor_new_from_name", LIBS);
  gidLink(cast(void**)&gdk_cursor_new_from_texture, "gdk_cursor_new_from_texture", LIBS);
  gidLink(cast(void**)&gdk_cursor_get_fallback, "gdk_cursor_get_fallback", LIBS);
  gidLink(cast(void**)&gdk_cursor_get_hotspot_x, "gdk_cursor_get_hotspot_x", LIBS);
  gidLink(cast(void**)&gdk_cursor_get_hotspot_y, "gdk_cursor_get_hotspot_y", LIBS);
  gidLink(cast(void**)&gdk_cursor_get_name, "gdk_cursor_get_name", LIBS);
  gidLink(cast(void**)&gdk_cursor_get_texture, "gdk_cursor_get_texture", LIBS);

  // DNDEvent
  gidLink(cast(void**)&gdk_dnd_event_get_type, "gdk_dnd_event_get_type", LIBS);
  gidLink(cast(void**)&gdk_dnd_event_get_drop, "gdk_dnd_event_get_drop", LIBS);

  // DeleteEvent
  gidLink(cast(void**)&gdk_delete_event_get_type, "gdk_delete_event_get_type", LIBS);

  // Device
  gidLink(cast(void**)&gdk_device_get_type, "gdk_device_get_type", LIBS);
  gidLink(cast(void**)&gdk_device_get_caps_lock_state, "gdk_device_get_caps_lock_state", LIBS);
  gidLink(cast(void**)&gdk_device_get_device_tool, "gdk_device_get_device_tool", LIBS);
  gidLink(cast(void**)&gdk_device_get_direction, "gdk_device_get_direction", LIBS);
  gidLink(cast(void**)&gdk_device_get_display, "gdk_device_get_display", LIBS);
  gidLink(cast(void**)&gdk_device_get_has_cursor, "gdk_device_get_has_cursor", LIBS);
  gidLink(cast(void**)&gdk_device_get_modifier_state, "gdk_device_get_modifier_state", LIBS);
  gidLink(cast(void**)&gdk_device_get_name, "gdk_device_get_name", LIBS);
  gidLink(cast(void**)&gdk_device_get_num_lock_state, "gdk_device_get_num_lock_state", LIBS);
  gidLink(cast(void**)&gdk_device_get_num_touches, "gdk_device_get_num_touches", LIBS);
  gidLink(cast(void**)&gdk_device_get_product_id, "gdk_device_get_product_id", LIBS);
  gidLink(cast(void**)&gdk_device_get_scroll_lock_state, "gdk_device_get_scroll_lock_state", LIBS);
  gidLink(cast(void**)&gdk_device_get_seat, "gdk_device_get_seat", LIBS);
  gidLink(cast(void**)&gdk_device_get_source, "gdk_device_get_source", LIBS);
  gidLink(cast(void**)&gdk_device_get_surface_at_position, "gdk_device_get_surface_at_position", LIBS);
  gidLink(cast(void**)&gdk_device_get_timestamp, "gdk_device_get_timestamp", LIBS);
  gidLink(cast(void**)&gdk_device_get_vendor_id, "gdk_device_get_vendor_id", LIBS);
  gidLink(cast(void**)&gdk_device_has_bidi_layouts, "gdk_device_has_bidi_layouts", LIBS);

  // DevicePad
  gidLink(cast(void**)&gdk_device_pad_get_type, "gdk_device_pad_get_type", LIBS);
  gidLink(cast(void**)&gdk_device_pad_get_feature_group, "gdk_device_pad_get_feature_group", LIBS);
  gidLink(cast(void**)&gdk_device_pad_get_group_n_modes, "gdk_device_pad_get_group_n_modes", LIBS);
  gidLink(cast(void**)&gdk_device_pad_get_n_features, "gdk_device_pad_get_n_features", LIBS);
  gidLink(cast(void**)&gdk_device_pad_get_n_groups, "gdk_device_pad_get_n_groups", LIBS);

  // DeviceTool
  gidLink(cast(void**)&gdk_device_tool_get_type, "gdk_device_tool_get_type", LIBS);
  gidLink(cast(void**)&gdk_device_tool_get_axes, "gdk_device_tool_get_axes", LIBS);
  gidLink(cast(void**)&gdk_device_tool_get_hardware_id, "gdk_device_tool_get_hardware_id", LIBS);
  gidLink(cast(void**)&gdk_device_tool_get_serial, "gdk_device_tool_get_serial", LIBS);
  gidLink(cast(void**)&gdk_device_tool_get_tool_type, "gdk_device_tool_get_tool_type", LIBS);

  // Display
  gidLink(cast(void**)&gdk_display_get_type, "gdk_display_get_type", LIBS);
  gidLink(cast(void**)&gdk_display_get_default, "gdk_display_get_default", LIBS);
  gidLink(cast(void**)&gdk_display_open, "gdk_display_open", LIBS);
  gidLink(cast(void**)&gdk_display_beep, "gdk_display_beep", LIBS);
  gidLink(cast(void**)&gdk_display_close, "gdk_display_close", LIBS);
  gidLink(cast(void**)&gdk_display_create_gl_context, "gdk_display_create_gl_context", LIBS);
  gidLink(cast(void**)&gdk_display_device_is_grabbed, "gdk_display_device_is_grabbed", LIBS);
  gidLink(cast(void**)&gdk_display_flush, "gdk_display_flush", LIBS);
  gidLink(cast(void**)&gdk_display_get_app_launch_context, "gdk_display_get_app_launch_context", LIBS);
  gidLink(cast(void**)&gdk_display_get_clipboard, "gdk_display_get_clipboard", LIBS);
  gidLink(cast(void**)&gdk_display_get_default_seat, "gdk_display_get_default_seat", LIBS);
  gidLink(cast(void**)&gdk_display_get_dmabuf_formats, "gdk_display_get_dmabuf_formats", LIBS);
  gidLink(cast(void**)&gdk_display_get_monitor_at_surface, "gdk_display_get_monitor_at_surface", LIBS);
  gidLink(cast(void**)&gdk_display_get_monitors, "gdk_display_get_monitors", LIBS);
  gidLink(cast(void**)&gdk_display_get_name, "gdk_display_get_name", LIBS);
  gidLink(cast(void**)&gdk_display_get_primary_clipboard, "gdk_display_get_primary_clipboard", LIBS);
  gidLink(cast(void**)&gdk_display_get_setting, "gdk_display_get_setting", LIBS);
  gidLink(cast(void**)&gdk_display_get_startup_notification_id, "gdk_display_get_startup_notification_id", LIBS);
  gidLink(cast(void**)&gdk_display_is_closed, "gdk_display_is_closed", LIBS);
  gidLink(cast(void**)&gdk_display_is_composited, "gdk_display_is_composited", LIBS);
  gidLink(cast(void**)&gdk_display_is_rgba, "gdk_display_is_rgba", LIBS);
  gidLink(cast(void**)&gdk_display_list_seats, "gdk_display_list_seats", LIBS);
  gidLink(cast(void**)&gdk_display_map_keycode, "gdk_display_map_keycode", LIBS);
  gidLink(cast(void**)&gdk_display_map_keyval, "gdk_display_map_keyval", LIBS);
  gidLink(cast(void**)&gdk_display_notify_startup_complete, "gdk_display_notify_startup_complete", LIBS);
  gidLink(cast(void**)&gdk_display_prepare_gl, "gdk_display_prepare_gl", LIBS);
  gidLink(cast(void**)&gdk_display_put_event, "gdk_display_put_event", LIBS);
  gidLink(cast(void**)&gdk_display_supports_input_shapes, "gdk_display_supports_input_shapes", LIBS);
  gidLink(cast(void**)&gdk_display_supports_shadow_width, "gdk_display_supports_shadow_width", LIBS);
  gidLink(cast(void**)&gdk_display_sync, "gdk_display_sync", LIBS);
  gidLink(cast(void**)&gdk_display_translate_key, "gdk_display_translate_key", LIBS);

  // DisplayManager
  gidLink(cast(void**)&gdk_display_manager_get_type, "gdk_display_manager_get_type", LIBS);
  gidLink(cast(void**)&gdk_display_manager_get, "gdk_display_manager_get", LIBS);
  gidLink(cast(void**)&gdk_display_manager_get_default_display, "gdk_display_manager_get_default_display", LIBS);
  gidLink(cast(void**)&gdk_display_manager_list_displays, "gdk_display_manager_list_displays", LIBS);
  gidLink(cast(void**)&gdk_display_manager_open_display, "gdk_display_manager_open_display", LIBS);
  gidLink(cast(void**)&gdk_display_manager_set_default_display, "gdk_display_manager_set_default_display", LIBS);

  // DmabufFormats
  gidLink(cast(void**)&gdk_dmabuf_formats_get_type, "gdk_dmabuf_formats_get_type", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_formats_contains, "gdk_dmabuf_formats_contains", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_formats_equal, "gdk_dmabuf_formats_equal", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_formats_get_format, "gdk_dmabuf_formats_get_format", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_formats_get_n_formats, "gdk_dmabuf_formats_get_n_formats", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_formats_ref, "gdk_dmabuf_formats_ref", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_formats_unref, "gdk_dmabuf_formats_unref", LIBS);

  // DmabufTexture
  gidLink(cast(void**)&gdk_dmabuf_texture_get_type, "gdk_dmabuf_texture_get_type", LIBS);

  // DmabufTextureBuilder
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_type, "gdk_dmabuf_texture_builder_get_type", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_new, "gdk_dmabuf_texture_builder_new", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_build, "gdk_dmabuf_texture_builder_build", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_display, "gdk_dmabuf_texture_builder_get_display", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_fd, "gdk_dmabuf_texture_builder_get_fd", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_fourcc, "gdk_dmabuf_texture_builder_get_fourcc", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_height, "gdk_dmabuf_texture_builder_get_height", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_modifier, "gdk_dmabuf_texture_builder_get_modifier", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_n_planes, "gdk_dmabuf_texture_builder_get_n_planes", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_offset, "gdk_dmabuf_texture_builder_get_offset", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_premultiplied, "gdk_dmabuf_texture_builder_get_premultiplied", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_stride, "gdk_dmabuf_texture_builder_get_stride", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_update_region, "gdk_dmabuf_texture_builder_get_update_region", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_update_texture, "gdk_dmabuf_texture_builder_get_update_texture", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_get_width, "gdk_dmabuf_texture_builder_get_width", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_display, "gdk_dmabuf_texture_builder_set_display", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_fd, "gdk_dmabuf_texture_builder_set_fd", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_fourcc, "gdk_dmabuf_texture_builder_set_fourcc", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_height, "gdk_dmabuf_texture_builder_set_height", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_modifier, "gdk_dmabuf_texture_builder_set_modifier", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_n_planes, "gdk_dmabuf_texture_builder_set_n_planes", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_offset, "gdk_dmabuf_texture_builder_set_offset", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_premultiplied, "gdk_dmabuf_texture_builder_set_premultiplied", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_stride, "gdk_dmabuf_texture_builder_set_stride", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_update_region, "gdk_dmabuf_texture_builder_set_update_region", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_update_texture, "gdk_dmabuf_texture_builder_set_update_texture", LIBS);
  gidLink(cast(void**)&gdk_dmabuf_texture_builder_set_width, "gdk_dmabuf_texture_builder_set_width", LIBS);

  // Drag
  gidLink(cast(void**)&gdk_drag_get_type, "gdk_drag_get_type", LIBS);
  gidLink(cast(void**)&gdk_drag_begin, "gdk_drag_begin", LIBS);
  gidLink(cast(void**)&gdk_drag_drop_done, "gdk_drag_drop_done", LIBS);
  gidLink(cast(void**)&gdk_drag_get_actions, "gdk_drag_get_actions", LIBS);
  gidLink(cast(void**)&gdk_drag_get_content, "gdk_drag_get_content", LIBS);
  gidLink(cast(void**)&gdk_drag_get_device, "gdk_drag_get_device", LIBS);
  gidLink(cast(void**)&gdk_drag_get_display, "gdk_drag_get_display", LIBS);
  gidLink(cast(void**)&gdk_drag_get_drag_surface, "gdk_drag_get_drag_surface", LIBS);
  gidLink(cast(void**)&gdk_drag_get_formats, "gdk_drag_get_formats", LIBS);
  gidLink(cast(void**)&gdk_drag_get_selected_action, "gdk_drag_get_selected_action", LIBS);
  gidLink(cast(void**)&gdk_drag_get_surface, "gdk_drag_get_surface", LIBS);
  gidLink(cast(void**)&gdk_drag_set_hotspot, "gdk_drag_set_hotspot", LIBS);

  // DragSurface
  gidLink(cast(void**)&gdk_drag_surface_get_type, "gdk_drag_surface_get_type", LIBS);
  gidLink(cast(void**)&gdk_drag_surface_present, "gdk_drag_surface_present", LIBS);

  // DragSurfaceSize
  gidLink(cast(void**)&gdk_drag_surface_size_set_size, "gdk_drag_surface_size_set_size", LIBS);

  // DrawContext
  gidLink(cast(void**)&gdk_draw_context_get_type, "gdk_draw_context_get_type", LIBS);
  gidLink(cast(void**)&gdk_draw_context_begin_frame, "gdk_draw_context_begin_frame", LIBS);
  gidLink(cast(void**)&gdk_draw_context_end_frame, "gdk_draw_context_end_frame", LIBS);
  gidLink(cast(void**)&gdk_draw_context_get_display, "gdk_draw_context_get_display", LIBS);
  gidLink(cast(void**)&gdk_draw_context_get_frame_region, "gdk_draw_context_get_frame_region", LIBS);
  gidLink(cast(void**)&gdk_draw_context_get_surface, "gdk_draw_context_get_surface", LIBS);
  gidLink(cast(void**)&gdk_draw_context_is_in_frame, "gdk_draw_context_is_in_frame", LIBS);

  // Drop
  gidLink(cast(void**)&gdk_drop_get_type, "gdk_drop_get_type", LIBS);
  gidLink(cast(void**)&gdk_drop_finish, "gdk_drop_finish", LIBS);
  gidLink(cast(void**)&gdk_drop_get_actions, "gdk_drop_get_actions", LIBS);
  gidLink(cast(void**)&gdk_drop_get_device, "gdk_drop_get_device", LIBS);
  gidLink(cast(void**)&gdk_drop_get_display, "gdk_drop_get_display", LIBS);
  gidLink(cast(void**)&gdk_drop_get_drag, "gdk_drop_get_drag", LIBS);
  gidLink(cast(void**)&gdk_drop_get_formats, "gdk_drop_get_formats", LIBS);
  gidLink(cast(void**)&gdk_drop_get_surface, "gdk_drop_get_surface", LIBS);
  gidLink(cast(void**)&gdk_drop_read_async, "gdk_drop_read_async", LIBS);
  gidLink(cast(void**)&gdk_drop_read_finish, "gdk_drop_read_finish", LIBS);
  gidLink(cast(void**)&gdk_drop_read_value_async, "gdk_drop_read_value_async", LIBS);
  gidLink(cast(void**)&gdk_drop_read_value_finish, "gdk_drop_read_value_finish", LIBS);
  gidLink(cast(void**)&gdk_drop_status, "gdk_drop_status", LIBS);

  // Event
  gidLink(cast(void**)&gdk_event_get_type, "gdk_event_get_type", LIBS);
  gidLink(cast(void**)&gdk_event_get_axes, "gdk_event_get_axes", LIBS);
  gidLink(cast(void**)&gdk_event_get_axis, "gdk_event_get_axis", LIBS);
  gidLink(cast(void**)&gdk_event_get_device, "gdk_event_get_device", LIBS);
  gidLink(cast(void**)&gdk_event_get_device_tool, "gdk_event_get_device_tool", LIBS);
  gidLink(cast(void**)&gdk_event_get_display, "gdk_event_get_display", LIBS);
  gidLink(cast(void**)&gdk_event_get_event_sequence, "gdk_event_get_event_sequence", LIBS);
  gidLink(cast(void**)&gdk_event_get_event_type, "gdk_event_get_event_type", LIBS);
  gidLink(cast(void**)&gdk_event_get_history, "gdk_event_get_history", LIBS);
  gidLink(cast(void**)&gdk_event_get_modifier_state, "gdk_event_get_modifier_state", LIBS);
  gidLink(cast(void**)&gdk_event_get_pointer_emulated, "gdk_event_get_pointer_emulated", LIBS);
  gidLink(cast(void**)&gdk_event_get_position, "gdk_event_get_position", LIBS);
  gidLink(cast(void**)&gdk_event_get_seat, "gdk_event_get_seat", LIBS);
  gidLink(cast(void**)&gdk_event_get_surface, "gdk_event_get_surface", LIBS);
  gidLink(cast(void**)&gdk_event_get_time, "gdk_event_get_time", LIBS);
  gidLink(cast(void**)&gdk_event_ref, "gdk_event_ref", LIBS);
  gidLink(cast(void**)&gdk_event_triggers_context_menu, "gdk_event_triggers_context_menu", LIBS);
  gidLink(cast(void**)&gdk_event_unref, "gdk_event_unref", LIBS);

  // EventSequence
  gidLink(cast(void**)&gdk_event_sequence_get_type, "gdk_event_sequence_get_type", LIBS);

  // FileList
  gidLink(cast(void**)&gdk_file_list_get_type, "gdk_file_list_get_type", LIBS);
  gidLink(cast(void**)&gdk_file_list_new_from_array, "gdk_file_list_new_from_array", LIBS);
  gidLink(cast(void**)&gdk_file_list_new_from_list, "gdk_file_list_new_from_list", LIBS);
  gidLink(cast(void**)&gdk_file_list_get_files, "gdk_file_list_get_files", LIBS);

  // FocusEvent
  gidLink(cast(void**)&gdk_focus_event_get_type, "gdk_focus_event_get_type", LIBS);
  gidLink(cast(void**)&gdk_focus_event_get_in, "gdk_focus_event_get_in", LIBS);

  // FrameClock
  gidLink(cast(void**)&gdk_frame_clock_get_type, "gdk_frame_clock_get_type", LIBS);
  gidLink(cast(void**)&gdk_frame_clock_begin_updating, "gdk_frame_clock_begin_updating", LIBS);
  gidLink(cast(void**)&gdk_frame_clock_end_updating, "gdk_frame_clock_end_updating", LIBS);
  gidLink(cast(void**)&gdk_frame_clock_get_current_timings, "gdk_frame_clock_get_current_timings", LIBS);
  gidLink(cast(void**)&gdk_frame_clock_get_fps, "gdk_frame_clock_get_fps", LIBS);
  gidLink(cast(void**)&gdk_frame_clock_get_frame_counter, "gdk_frame_clock_get_frame_counter", LIBS);
  gidLink(cast(void**)&gdk_frame_clock_get_frame_time, "gdk_frame_clock_get_frame_time", LIBS);
  gidLink(cast(void**)&gdk_frame_clock_get_history_start, "gdk_frame_clock_get_history_start", LIBS);
  gidLink(cast(void**)&gdk_frame_clock_get_refresh_info, "gdk_frame_clock_get_refresh_info", LIBS);
  gidLink(cast(void**)&gdk_frame_clock_get_timings, "gdk_frame_clock_get_timings", LIBS);
  gidLink(cast(void**)&gdk_frame_clock_request_phase, "gdk_frame_clock_request_phase", LIBS);

  // FrameTimings
  gidLink(cast(void**)&gdk_frame_timings_get_type, "gdk_frame_timings_get_type", LIBS);
  gidLink(cast(void**)&gdk_frame_timings_get_complete, "gdk_frame_timings_get_complete", LIBS);
  gidLink(cast(void**)&gdk_frame_timings_get_frame_counter, "gdk_frame_timings_get_frame_counter", LIBS);
  gidLink(cast(void**)&gdk_frame_timings_get_frame_time, "gdk_frame_timings_get_frame_time", LIBS);
  gidLink(cast(void**)&gdk_frame_timings_get_predicted_presentation_time, "gdk_frame_timings_get_predicted_presentation_time", LIBS);
  gidLink(cast(void**)&gdk_frame_timings_get_presentation_time, "gdk_frame_timings_get_presentation_time", LIBS);
  gidLink(cast(void**)&gdk_frame_timings_get_refresh_interval, "gdk_frame_timings_get_refresh_interval", LIBS);
  gidLink(cast(void**)&gdk_frame_timings_ref, "gdk_frame_timings_ref", LIBS);
  gidLink(cast(void**)&gdk_frame_timings_unref, "gdk_frame_timings_unref", LIBS);

  // GLContext
  gidLink(cast(void**)&gdk_gl_context_get_type, "gdk_gl_context_get_type", LIBS);
  gidLink(cast(void**)&gdk_gl_context_clear_current, "gdk_gl_context_clear_current", LIBS);
  gidLink(cast(void**)&gdk_gl_context_get_current, "gdk_gl_context_get_current", LIBS);
  gidLink(cast(void**)&gdk_gl_context_get_allowed_apis, "gdk_gl_context_get_allowed_apis", LIBS);
  gidLink(cast(void**)&gdk_gl_context_get_api, "gdk_gl_context_get_api", LIBS);
  gidLink(cast(void**)&gdk_gl_context_get_debug_enabled, "gdk_gl_context_get_debug_enabled", LIBS);
  gidLink(cast(void**)&gdk_gl_context_get_display, "gdk_gl_context_get_display", LIBS);
  gidLink(cast(void**)&gdk_gl_context_get_forward_compatible, "gdk_gl_context_get_forward_compatible", LIBS);
  gidLink(cast(void**)&gdk_gl_context_get_required_version, "gdk_gl_context_get_required_version", LIBS);
  gidLink(cast(void**)&gdk_gl_context_get_shared_context, "gdk_gl_context_get_shared_context", LIBS);
  gidLink(cast(void**)&gdk_gl_context_get_surface, "gdk_gl_context_get_surface", LIBS);
  gidLink(cast(void**)&gdk_gl_context_get_use_es, "gdk_gl_context_get_use_es", LIBS);
  gidLink(cast(void**)&gdk_gl_context_get_version, "gdk_gl_context_get_version", LIBS);
  gidLink(cast(void**)&gdk_gl_context_is_legacy, "gdk_gl_context_is_legacy", LIBS);
  gidLink(cast(void**)&gdk_gl_context_is_shared, "gdk_gl_context_is_shared", LIBS);
  gidLink(cast(void**)&gdk_gl_context_make_current, "gdk_gl_context_make_current", LIBS);
  gidLink(cast(void**)&gdk_gl_context_realize, "gdk_gl_context_realize", LIBS);
  gidLink(cast(void**)&gdk_gl_context_set_allowed_apis, "gdk_gl_context_set_allowed_apis", LIBS);
  gidLink(cast(void**)&gdk_gl_context_set_debug_enabled, "gdk_gl_context_set_debug_enabled", LIBS);
  gidLink(cast(void**)&gdk_gl_context_set_forward_compatible, "gdk_gl_context_set_forward_compatible", LIBS);
  gidLink(cast(void**)&gdk_gl_context_set_required_version, "gdk_gl_context_set_required_version", LIBS);
  gidLink(cast(void**)&gdk_gl_context_set_use_es, "gdk_gl_context_set_use_es", LIBS);

  // GLTexture
  gidLink(cast(void**)&gdk_gl_texture_get_type, "gdk_gl_texture_get_type", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_new, "gdk_gl_texture_new", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_release, "gdk_gl_texture_release", LIBS);

  // GLTextureBuilder
  gidLink(cast(void**)&gdk_gl_texture_builder_get_type, "gdk_gl_texture_builder_get_type", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_new, "gdk_gl_texture_builder_new", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_build, "gdk_gl_texture_builder_build", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_context, "gdk_gl_texture_builder_get_context", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_format, "gdk_gl_texture_builder_get_format", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_has_mipmap, "gdk_gl_texture_builder_get_has_mipmap", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_height, "gdk_gl_texture_builder_get_height", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_id, "gdk_gl_texture_builder_get_id", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_sync, "gdk_gl_texture_builder_get_sync", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_update_region, "gdk_gl_texture_builder_get_update_region", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_update_texture, "gdk_gl_texture_builder_get_update_texture", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_get_width, "gdk_gl_texture_builder_get_width", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_context, "gdk_gl_texture_builder_set_context", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_format, "gdk_gl_texture_builder_set_format", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_has_mipmap, "gdk_gl_texture_builder_set_has_mipmap", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_height, "gdk_gl_texture_builder_set_height", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_id, "gdk_gl_texture_builder_set_id", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_sync, "gdk_gl_texture_builder_set_sync", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_update_region, "gdk_gl_texture_builder_set_update_region", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_update_texture, "gdk_gl_texture_builder_set_update_texture", LIBS);
  gidLink(cast(void**)&gdk_gl_texture_builder_set_width, "gdk_gl_texture_builder_set_width", LIBS);

  // Global
  gidLink(cast(void**)&gdk_cairo_draw_from_gl, "gdk_cairo_draw_from_gl", LIBS);
  gidLink(cast(void**)&gdk_cairo_rectangle, "gdk_cairo_rectangle", LIBS);
  gidLink(cast(void**)&gdk_cairo_region, "gdk_cairo_region", LIBS);
  gidLink(cast(void**)&gdk_cairo_region_create_from_surface, "gdk_cairo_region_create_from_surface", LIBS);
  gidLink(cast(void**)&gdk_cairo_set_source_pixbuf, "gdk_cairo_set_source_pixbuf", LIBS);
  gidLink(cast(void**)&gdk_cairo_set_source_rgba, "gdk_cairo_set_source_rgba", LIBS);
  gidLink(cast(void**)&gdk_content_deserialize_async, "gdk_content_deserialize_async", LIBS);
  gidLink(cast(void**)&gdk_content_deserialize_finish, "gdk_content_deserialize_finish", LIBS);
  gidLink(cast(void**)&gdk_content_register_deserializer, "gdk_content_register_deserializer", LIBS);
  gidLink(cast(void**)&gdk_content_register_serializer, "gdk_content_register_serializer", LIBS);
  gidLink(cast(void**)&gdk_content_serialize_async, "gdk_content_serialize_async", LIBS);
  gidLink(cast(void**)&gdk_content_serialize_finish, "gdk_content_serialize_finish", LIBS);
  gidLink(cast(void**)&gdk_drag_surface_size_get_type, "gdk_drag_surface_size_get_type", LIBS);
  gidLink(cast(void**)&gdk_events_get_angle, "gdk_events_get_angle", LIBS);
  gidLink(cast(void**)&gdk_events_get_center, "gdk_events_get_center", LIBS);
  gidLink(cast(void**)&gdk_events_get_distance, "gdk_events_get_distance", LIBS);
  gidLink(cast(void**)&gdk_intern_mime_type, "gdk_intern_mime_type", LIBS);
  gidLink(cast(void**)&gdk_keyval_convert_case, "gdk_keyval_convert_case", LIBS);
  gidLink(cast(void**)&gdk_keyval_from_name, "gdk_keyval_from_name", LIBS);
  gidLink(cast(void**)&gdk_keyval_is_lower, "gdk_keyval_is_lower", LIBS);
  gidLink(cast(void**)&gdk_keyval_is_upper, "gdk_keyval_is_upper", LIBS);
  gidLink(cast(void**)&gdk_keyval_name, "gdk_keyval_name", LIBS);
  gidLink(cast(void**)&gdk_keyval_to_lower, "gdk_keyval_to_lower", LIBS);
  gidLink(cast(void**)&gdk_keyval_to_unicode, "gdk_keyval_to_unicode", LIBS);
  gidLink(cast(void**)&gdk_keyval_to_upper, "gdk_keyval_to_upper", LIBS);
  gidLink(cast(void**)&gdk_pango_layout_get_clip_region, "gdk_pango_layout_get_clip_region", LIBS);
  gidLink(cast(void**)&gdk_pango_layout_line_get_clip_region, "gdk_pango_layout_line_get_clip_region", LIBS);
  gidLink(cast(void**)&gdk_pixbuf_get_from_surface, "gdk_pixbuf_get_from_surface", LIBS);
  gidLink(cast(void**)&gdk_pixbuf_get_from_texture, "gdk_pixbuf_get_from_texture", LIBS);
  gidLink(cast(void**)&gdk_set_allowed_backends, "gdk_set_allowed_backends", LIBS);
  gidLink(cast(void**)&gdk_toplevel_size_get_type, "gdk_toplevel_size_get_type", LIBS);
  gidLink(cast(void**)&gdk_unicode_to_keyval, "gdk_unicode_to_keyval", LIBS);

  // GrabBrokenEvent
  gidLink(cast(void**)&gdk_grab_broken_event_get_type, "gdk_grab_broken_event_get_type", LIBS);
  gidLink(cast(void**)&gdk_grab_broken_event_get_grab_surface, "gdk_grab_broken_event_get_grab_surface", LIBS);
  gidLink(cast(void**)&gdk_grab_broken_event_get_implicit, "gdk_grab_broken_event_get_implicit", LIBS);

  // KeyEvent
  gidLink(cast(void**)&gdk_key_event_get_type, "gdk_key_event_get_type", LIBS);
  gidLink(cast(void**)&gdk_key_event_get_consumed_modifiers, "gdk_key_event_get_consumed_modifiers", LIBS);
  gidLink(cast(void**)&gdk_key_event_get_keycode, "gdk_key_event_get_keycode", LIBS);
  gidLink(cast(void**)&gdk_key_event_get_keyval, "gdk_key_event_get_keyval", LIBS);
  gidLink(cast(void**)&gdk_key_event_get_layout, "gdk_key_event_get_layout", LIBS);
  gidLink(cast(void**)&gdk_key_event_get_level, "gdk_key_event_get_level", LIBS);
  gidLink(cast(void**)&gdk_key_event_get_match, "gdk_key_event_get_match", LIBS);
  gidLink(cast(void**)&gdk_key_event_is_modifier, "gdk_key_event_is_modifier", LIBS);
  gidLink(cast(void**)&gdk_key_event_matches, "gdk_key_event_matches", LIBS);

  // MemoryTexture
  gidLink(cast(void**)&gdk_memory_texture_get_type, "gdk_memory_texture_get_type", LIBS);
  gidLink(cast(void**)&gdk_memory_texture_new, "gdk_memory_texture_new", LIBS);

  // MonitorG
  gidLink(cast(void**)&gdk_monitor_get_type, "gdk_monitor_get_type", LIBS);
  gidLink(cast(void**)&gdk_monitor_get_connector, "gdk_monitor_get_connector", LIBS);
  gidLink(cast(void**)&gdk_monitor_get_description, "gdk_monitor_get_description", LIBS);
  gidLink(cast(void**)&gdk_monitor_get_display, "gdk_monitor_get_display", LIBS);
  gidLink(cast(void**)&gdk_monitor_get_geometry, "gdk_monitor_get_geometry", LIBS);
  gidLink(cast(void**)&gdk_monitor_get_height_mm, "gdk_monitor_get_height_mm", LIBS);
  gidLink(cast(void**)&gdk_monitor_get_manufacturer, "gdk_monitor_get_manufacturer", LIBS);
  gidLink(cast(void**)&gdk_monitor_get_model, "gdk_monitor_get_model", LIBS);
  gidLink(cast(void**)&gdk_monitor_get_refresh_rate, "gdk_monitor_get_refresh_rate", LIBS);
  gidLink(cast(void**)&gdk_monitor_get_scale, "gdk_monitor_get_scale", LIBS);
  gidLink(cast(void**)&gdk_monitor_get_scale_factor, "gdk_monitor_get_scale_factor", LIBS);
  gidLink(cast(void**)&gdk_monitor_get_subpixel_layout, "gdk_monitor_get_subpixel_layout", LIBS);
  gidLink(cast(void**)&gdk_monitor_get_width_mm, "gdk_monitor_get_width_mm", LIBS);
  gidLink(cast(void**)&gdk_monitor_is_valid, "gdk_monitor_is_valid", LIBS);

  // MotionEvent
  gidLink(cast(void**)&gdk_motion_event_get_type, "gdk_motion_event_get_type", LIBS);

  // PadEvent
  gidLink(cast(void**)&gdk_pad_event_get_type, "gdk_pad_event_get_type", LIBS);
  gidLink(cast(void**)&gdk_pad_event_get_axis_value, "gdk_pad_event_get_axis_value", LIBS);
  gidLink(cast(void**)&gdk_pad_event_get_button, "gdk_pad_event_get_button", LIBS);
  gidLink(cast(void**)&gdk_pad_event_get_group_mode, "gdk_pad_event_get_group_mode", LIBS);

  // Paintable
  gidLink(cast(void**)&gdk_paintable_get_type, "gdk_paintable_get_type", LIBS);
  gidLink(cast(void**)&gdk_paintable_new_empty, "gdk_paintable_new_empty", LIBS);
  gidLink(cast(void**)&gdk_paintable_compute_concrete_size, "gdk_paintable_compute_concrete_size", LIBS);
  gidLink(cast(void**)&gdk_paintable_get_current_image, "gdk_paintable_get_current_image", LIBS);
  gidLink(cast(void**)&gdk_paintable_get_flags, "gdk_paintable_get_flags", LIBS);
  gidLink(cast(void**)&gdk_paintable_get_intrinsic_aspect_ratio, "gdk_paintable_get_intrinsic_aspect_ratio", LIBS);
  gidLink(cast(void**)&gdk_paintable_get_intrinsic_height, "gdk_paintable_get_intrinsic_height", LIBS);
  gidLink(cast(void**)&gdk_paintable_get_intrinsic_width, "gdk_paintable_get_intrinsic_width", LIBS);
  gidLink(cast(void**)&gdk_paintable_invalidate_contents, "gdk_paintable_invalidate_contents", LIBS);
  gidLink(cast(void**)&gdk_paintable_invalidate_size, "gdk_paintable_invalidate_size", LIBS);
  gidLink(cast(void**)&gdk_paintable_snapshot, "gdk_paintable_snapshot", LIBS);

  // Popup
  gidLink(cast(void**)&gdk_popup_get_type, "gdk_popup_get_type", LIBS);
  gidLink(cast(void**)&gdk_popup_get_autohide, "gdk_popup_get_autohide", LIBS);
  gidLink(cast(void**)&gdk_popup_get_parent, "gdk_popup_get_parent", LIBS);
  gidLink(cast(void**)&gdk_popup_get_position_x, "gdk_popup_get_position_x", LIBS);
  gidLink(cast(void**)&gdk_popup_get_position_y, "gdk_popup_get_position_y", LIBS);
  gidLink(cast(void**)&gdk_popup_get_rect_anchor, "gdk_popup_get_rect_anchor", LIBS);
  gidLink(cast(void**)&gdk_popup_get_surface_anchor, "gdk_popup_get_surface_anchor", LIBS);
  gidLink(cast(void**)&gdk_popup_present, "gdk_popup_present", LIBS);

  // PopupLayout
  gidLink(cast(void**)&gdk_popup_layout_get_type, "gdk_popup_layout_get_type", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_new, "gdk_popup_layout_new", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_copy, "gdk_popup_layout_copy", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_equal, "gdk_popup_layout_equal", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_get_anchor_hints, "gdk_popup_layout_get_anchor_hints", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_get_anchor_rect, "gdk_popup_layout_get_anchor_rect", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_get_offset, "gdk_popup_layout_get_offset", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_get_rect_anchor, "gdk_popup_layout_get_rect_anchor", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_get_shadow_width, "gdk_popup_layout_get_shadow_width", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_get_surface_anchor, "gdk_popup_layout_get_surface_anchor", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_ref, "gdk_popup_layout_ref", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_set_anchor_hints, "gdk_popup_layout_set_anchor_hints", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_set_anchor_rect, "gdk_popup_layout_set_anchor_rect", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_set_offset, "gdk_popup_layout_set_offset", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_set_rect_anchor, "gdk_popup_layout_set_rect_anchor", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_set_shadow_width, "gdk_popup_layout_set_shadow_width", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_set_surface_anchor, "gdk_popup_layout_set_surface_anchor", LIBS);
  gidLink(cast(void**)&gdk_popup_layout_unref, "gdk_popup_layout_unref", LIBS);

  // ProximityEvent
  gidLink(cast(void**)&gdk_proximity_event_get_type, "gdk_proximity_event_get_type", LIBS);

  // RGBA
  gidLink(cast(void**)&gdk_rgba_get_type, "gdk_rgba_get_type", LIBS);
  gidLink(cast(void**)&gdk_rgba_copy, "gdk_rgba_copy", LIBS);
  gidLink(cast(void**)&gdk_rgba_equal, "gdk_rgba_equal", LIBS);
  gidLink(cast(void**)&gdk_rgba_free, "gdk_rgba_free", LIBS);
  gidLink(cast(void**)&gdk_rgba_hash, "gdk_rgba_hash", LIBS);
  gidLink(cast(void**)&gdk_rgba_is_clear, "gdk_rgba_is_clear", LIBS);
  gidLink(cast(void**)&gdk_rgba_is_opaque, "gdk_rgba_is_opaque", LIBS);
  gidLink(cast(void**)&gdk_rgba_parse, "gdk_rgba_parse", LIBS);
  gidLink(cast(void**)&gdk_rgba_to_string, "gdk_rgba_to_string", LIBS);

  // Rectangle
  gidLink(cast(void**)&gdk_rectangle_get_type, "gdk_rectangle_get_type", LIBS);
  gidLink(cast(void**)&gdk_rectangle_contains_point, "gdk_rectangle_contains_point", LIBS);
  gidLink(cast(void**)&gdk_rectangle_equal, "gdk_rectangle_equal", LIBS);
  gidLink(cast(void**)&gdk_rectangle_intersect, "gdk_rectangle_intersect", LIBS);
  gidLink(cast(void**)&gdk_rectangle_union, "gdk_rectangle_union", LIBS);

  // ScrollEvent
  gidLink(cast(void**)&gdk_scroll_event_get_type, "gdk_scroll_event_get_type", LIBS);
  gidLink(cast(void**)&gdk_scroll_event_get_deltas, "gdk_scroll_event_get_deltas", LIBS);
  gidLink(cast(void**)&gdk_scroll_event_get_direction, "gdk_scroll_event_get_direction", LIBS);
  gidLink(cast(void**)&gdk_scroll_event_get_unit, "gdk_scroll_event_get_unit", LIBS);
  gidLink(cast(void**)&gdk_scroll_event_is_stop, "gdk_scroll_event_is_stop", LIBS);

  // Seat
  gidLink(cast(void**)&gdk_seat_get_type, "gdk_seat_get_type", LIBS);
  gidLink(cast(void**)&gdk_seat_get_capabilities, "gdk_seat_get_capabilities", LIBS);
  gidLink(cast(void**)&gdk_seat_get_devices, "gdk_seat_get_devices", LIBS);
  gidLink(cast(void**)&gdk_seat_get_display, "gdk_seat_get_display", LIBS);
  gidLink(cast(void**)&gdk_seat_get_keyboard, "gdk_seat_get_keyboard", LIBS);
  gidLink(cast(void**)&gdk_seat_get_pointer, "gdk_seat_get_pointer", LIBS);
  gidLink(cast(void**)&gdk_seat_get_tools, "gdk_seat_get_tools", LIBS);

  // Snapshot
  gidLink(cast(void**)&gdk_snapshot_get_type, "gdk_snapshot_get_type", LIBS);

  // Surface
  gidLink(cast(void**)&gdk_surface_get_type, "gdk_surface_get_type", LIBS);
  gidLink(cast(void**)&gdk_surface_new_popup, "gdk_surface_new_popup", LIBS);
  gidLink(cast(void**)&gdk_surface_new_toplevel, "gdk_surface_new_toplevel", LIBS);
  gidLink(cast(void**)&gdk_surface_beep, "gdk_surface_beep", LIBS);
  gidLink(cast(void**)&gdk_surface_create_cairo_context, "gdk_surface_create_cairo_context", LIBS);
  gidLink(cast(void**)&gdk_surface_create_gl_context, "gdk_surface_create_gl_context", LIBS);
  gidLink(cast(void**)&gdk_surface_create_similar_surface, "gdk_surface_create_similar_surface", LIBS);
  gidLink(cast(void**)&gdk_surface_create_vulkan_context, "gdk_surface_create_vulkan_context", LIBS);
  gidLink(cast(void**)&gdk_surface_destroy, "gdk_surface_destroy", LIBS);
  gidLink(cast(void**)&gdk_surface_get_cursor, "gdk_surface_get_cursor", LIBS);
  gidLink(cast(void**)&gdk_surface_get_device_cursor, "gdk_surface_get_device_cursor", LIBS);
  gidLink(cast(void**)&gdk_surface_get_device_position, "gdk_surface_get_device_position", LIBS);
  gidLink(cast(void**)&gdk_surface_get_display, "gdk_surface_get_display", LIBS);
  gidLink(cast(void**)&gdk_surface_get_frame_clock, "gdk_surface_get_frame_clock", LIBS);
  gidLink(cast(void**)&gdk_surface_get_height, "gdk_surface_get_height", LIBS);
  gidLink(cast(void**)&gdk_surface_get_mapped, "gdk_surface_get_mapped", LIBS);
  gidLink(cast(void**)&gdk_surface_get_scale, "gdk_surface_get_scale", LIBS);
  gidLink(cast(void**)&gdk_surface_get_scale_factor, "gdk_surface_get_scale_factor", LIBS);
  gidLink(cast(void**)&gdk_surface_get_width, "gdk_surface_get_width", LIBS);
  gidLink(cast(void**)&gdk_surface_hide, "gdk_surface_hide", LIBS);
  gidLink(cast(void**)&gdk_surface_is_destroyed, "gdk_surface_is_destroyed", LIBS);
  gidLink(cast(void**)&gdk_surface_queue_render, "gdk_surface_queue_render", LIBS);
  gidLink(cast(void**)&gdk_surface_request_layout, "gdk_surface_request_layout", LIBS);
  gidLink(cast(void**)&gdk_surface_set_cursor, "gdk_surface_set_cursor", LIBS);
  gidLink(cast(void**)&gdk_surface_set_device_cursor, "gdk_surface_set_device_cursor", LIBS);
  gidLink(cast(void**)&gdk_surface_set_input_region, "gdk_surface_set_input_region", LIBS);
  gidLink(cast(void**)&gdk_surface_set_opaque_region, "gdk_surface_set_opaque_region", LIBS);
  gidLink(cast(void**)&gdk_surface_translate_coordinates, "gdk_surface_translate_coordinates", LIBS);

  // Texture
  gidLink(cast(void**)&gdk_texture_get_type, "gdk_texture_get_type", LIBS);
  gidLink(cast(void**)&gdk_texture_new_for_pixbuf, "gdk_texture_new_for_pixbuf", LIBS);
  gidLink(cast(void**)&gdk_texture_new_from_bytes, "gdk_texture_new_from_bytes", LIBS);
  gidLink(cast(void**)&gdk_texture_new_from_file, "gdk_texture_new_from_file", LIBS);
  gidLink(cast(void**)&gdk_texture_new_from_filename, "gdk_texture_new_from_filename", LIBS);
  gidLink(cast(void**)&gdk_texture_new_from_resource, "gdk_texture_new_from_resource", LIBS);
  gidLink(cast(void**)&gdk_texture_download, "gdk_texture_download", LIBS);
  gidLink(cast(void**)&gdk_texture_get_format, "gdk_texture_get_format", LIBS);
  gidLink(cast(void**)&gdk_texture_get_height, "gdk_texture_get_height", LIBS);
  gidLink(cast(void**)&gdk_texture_get_width, "gdk_texture_get_width", LIBS);
  gidLink(cast(void**)&gdk_texture_save_to_png, "gdk_texture_save_to_png", LIBS);
  gidLink(cast(void**)&gdk_texture_save_to_png_bytes, "gdk_texture_save_to_png_bytes", LIBS);
  gidLink(cast(void**)&gdk_texture_save_to_tiff, "gdk_texture_save_to_tiff", LIBS);
  gidLink(cast(void**)&gdk_texture_save_to_tiff_bytes, "gdk_texture_save_to_tiff_bytes", LIBS);

  // TextureDownloader
  gidLink(cast(void**)&gdk_texture_downloader_get_type, "gdk_texture_downloader_get_type", LIBS);
  gidLink(cast(void**)&gdk_texture_downloader_new, "gdk_texture_downloader_new", LIBS);
  gidLink(cast(void**)&gdk_texture_downloader_copy, "gdk_texture_downloader_copy", LIBS);
  gidLink(cast(void**)&gdk_texture_downloader_download_bytes, "gdk_texture_downloader_download_bytes", LIBS);
  gidLink(cast(void**)&gdk_texture_downloader_download_into, "gdk_texture_downloader_download_into", LIBS);
  gidLink(cast(void**)&gdk_texture_downloader_free, "gdk_texture_downloader_free", LIBS);
  gidLink(cast(void**)&gdk_texture_downloader_get_format, "gdk_texture_downloader_get_format", LIBS);
  gidLink(cast(void**)&gdk_texture_downloader_get_texture, "gdk_texture_downloader_get_texture", LIBS);
  gidLink(cast(void**)&gdk_texture_downloader_set_format, "gdk_texture_downloader_set_format", LIBS);
  gidLink(cast(void**)&gdk_texture_downloader_set_texture, "gdk_texture_downloader_set_texture", LIBS);

  // Toplevel
  gidLink(cast(void**)&gdk_toplevel_get_type, "gdk_toplevel_get_type", LIBS);
  gidLink(cast(void**)&gdk_toplevel_begin_move, "gdk_toplevel_begin_move", LIBS);
  gidLink(cast(void**)&gdk_toplevel_begin_resize, "gdk_toplevel_begin_resize", LIBS);
  gidLink(cast(void**)&gdk_toplevel_focus, "gdk_toplevel_focus", LIBS);
  gidLink(cast(void**)&gdk_toplevel_get_state, "gdk_toplevel_get_state", LIBS);
  gidLink(cast(void**)&gdk_toplevel_inhibit_system_shortcuts, "gdk_toplevel_inhibit_system_shortcuts", LIBS);
  gidLink(cast(void**)&gdk_toplevel_lower, "gdk_toplevel_lower", LIBS);
  gidLink(cast(void**)&gdk_toplevel_minimize, "gdk_toplevel_minimize", LIBS);
  gidLink(cast(void**)&gdk_toplevel_present, "gdk_toplevel_present", LIBS);
  gidLink(cast(void**)&gdk_toplevel_restore_system_shortcuts, "gdk_toplevel_restore_system_shortcuts", LIBS);
  gidLink(cast(void**)&gdk_toplevel_set_decorated, "gdk_toplevel_set_decorated", LIBS);
  gidLink(cast(void**)&gdk_toplevel_set_deletable, "gdk_toplevel_set_deletable", LIBS);
  gidLink(cast(void**)&gdk_toplevel_set_icon_list, "gdk_toplevel_set_icon_list", LIBS);
  gidLink(cast(void**)&gdk_toplevel_set_modal, "gdk_toplevel_set_modal", LIBS);
  gidLink(cast(void**)&gdk_toplevel_set_startup_id, "gdk_toplevel_set_startup_id", LIBS);
  gidLink(cast(void**)&gdk_toplevel_set_title, "gdk_toplevel_set_title", LIBS);
  gidLink(cast(void**)&gdk_toplevel_set_transient_for, "gdk_toplevel_set_transient_for", LIBS);
  gidLink(cast(void**)&gdk_toplevel_show_window_menu, "gdk_toplevel_show_window_menu", LIBS);
  gidLink(cast(void**)&gdk_toplevel_supports_edge_constraints, "gdk_toplevel_supports_edge_constraints", LIBS);
  gidLink(cast(void**)&gdk_toplevel_titlebar_gesture, "gdk_toplevel_titlebar_gesture", LIBS);

  // ToplevelLayout
  gidLink(cast(void**)&gdk_toplevel_layout_get_type, "gdk_toplevel_layout_get_type", LIBS);
  gidLink(cast(void**)&gdk_toplevel_layout_new, "gdk_toplevel_layout_new", LIBS);
  gidLink(cast(void**)&gdk_toplevel_layout_copy, "gdk_toplevel_layout_copy", LIBS);
  gidLink(cast(void**)&gdk_toplevel_layout_equal, "gdk_toplevel_layout_equal", LIBS);
  gidLink(cast(void**)&gdk_toplevel_layout_get_fullscreen, "gdk_toplevel_layout_get_fullscreen", LIBS);
  gidLink(cast(void**)&gdk_toplevel_layout_get_fullscreen_monitor, "gdk_toplevel_layout_get_fullscreen_monitor", LIBS);
  gidLink(cast(void**)&gdk_toplevel_layout_get_maximized, "gdk_toplevel_layout_get_maximized", LIBS);
  gidLink(cast(void**)&gdk_toplevel_layout_get_resizable, "gdk_toplevel_layout_get_resizable", LIBS);
  gidLink(cast(void**)&gdk_toplevel_layout_ref, "gdk_toplevel_layout_ref", LIBS);
  gidLink(cast(void**)&gdk_toplevel_layout_set_fullscreen, "gdk_toplevel_layout_set_fullscreen", LIBS);
  gidLink(cast(void**)&gdk_toplevel_layout_set_maximized, "gdk_toplevel_layout_set_maximized", LIBS);
  gidLink(cast(void**)&gdk_toplevel_layout_set_resizable, "gdk_toplevel_layout_set_resizable", LIBS);
  gidLink(cast(void**)&gdk_toplevel_layout_unref, "gdk_toplevel_layout_unref", LIBS);

  // ToplevelSize
  gidLink(cast(void**)&gdk_toplevel_size_get_bounds, "gdk_toplevel_size_get_bounds", LIBS);
  gidLink(cast(void**)&gdk_toplevel_size_set_min_size, "gdk_toplevel_size_set_min_size", LIBS);
  gidLink(cast(void**)&gdk_toplevel_size_set_shadow_width, "gdk_toplevel_size_set_shadow_width", LIBS);
  gidLink(cast(void**)&gdk_toplevel_size_set_size, "gdk_toplevel_size_set_size", LIBS);

  // TouchEvent
  gidLink(cast(void**)&gdk_touch_event_get_type, "gdk_touch_event_get_type", LIBS);
  gidLink(cast(void**)&gdk_touch_event_get_emulating_pointer, "gdk_touch_event_get_emulating_pointer", LIBS);

  // TouchpadEvent
  gidLink(cast(void**)&gdk_touchpad_event_get_type, "gdk_touchpad_event_get_type", LIBS);
  gidLink(cast(void**)&gdk_touchpad_event_get_deltas, "gdk_touchpad_event_get_deltas", LIBS);
  gidLink(cast(void**)&gdk_touchpad_event_get_gesture_phase, "gdk_touchpad_event_get_gesture_phase", LIBS);
  gidLink(cast(void**)&gdk_touchpad_event_get_n_fingers, "gdk_touchpad_event_get_n_fingers", LIBS);
  gidLink(cast(void**)&gdk_touchpad_event_get_pinch_angle_delta, "gdk_touchpad_event_get_pinch_angle_delta", LIBS);
  gidLink(cast(void**)&gdk_touchpad_event_get_pinch_scale, "gdk_touchpad_event_get_pinch_scale", LIBS);

  // VulkanContext
  gidLink(cast(void**)&gdk_vulkan_context_get_type, "gdk_vulkan_context_get_type", LIBS);
}
