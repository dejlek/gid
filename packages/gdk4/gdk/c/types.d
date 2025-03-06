module gdk.c.types;

public import gid.basictypes;
public import gdkpixbuf.c.types;
public import gio.c.types;
public import pango.c.types;
public import pangocairo.c.types;
public import cairo.c.types;
import gdk.types;


// Enums
alias GdkAnchorHints = gdk.types.AnchorHints;
alias GdkAxisFlags = gdk.types.AxisFlags;
alias GdkAxisUse = gdk.types.AxisUse;
alias GdkCrossingMode = gdk.types.CrossingMode;
alias GdkDevicePadFeature = gdk.types.DevicePadFeature;
alias GdkDeviceToolType = gdk.types.DeviceToolType;
alias GdkDmabufError = gdk.types.DmabufError;
alias GdkDragAction = gdk.types.DragAction;
alias GdkDragCancelReason = gdk.types.DragCancelReason;
alias GdkEventType = gdk.types.EventType;
alias GdkFrameClockPhase = gdk.types.FrameClockPhase;
alias GdkFullscreenMode = gdk.types.FullscreenMode;
alias GdkGLAPI = gdk.types.GLAPI;
alias GdkGLError = gdk.types.GLError;
alias GdkGravity = gdk.types.Gravity;
alias GdkInputSource = gdk.types.InputSource;
alias GdkKeyMatch = gdk.types.KeyMatch;
alias GdkMemoryFormat = gdk.types.MemoryFormat;
alias GdkModifierType = gdk.types.ModifierType;
alias GdkNotifyType = gdk.types.NotifyType;
alias GdkPaintableFlags = gdk.types.PaintableFlags;
alias GdkScrollDirection = gdk.types.ScrollDirection;
alias GdkScrollUnit = gdk.types.ScrollUnit;
alias GdkSeatCapabilities = gdk.types.SeatCapabilities;
alias GdkSubpixelLayout = gdk.types.SubpixelLayout;
alias GdkSurfaceEdge = gdk.types.SurfaceEdge;
alias GdkTextureError = gdk.types.TextureError;
alias GdkTitlebarGesture = gdk.types.TitlebarGesture;
alias GdkToplevelState = gdk.types.ToplevelState;
alias GdkTouchpadGesturePhase = gdk.types.TouchpadGesturePhase;
alias GdkVulkanError = gdk.types.VulkanError;
/**
    [gdk.app_launch_context.AppLaunchContext] handles launching an application in a graphical context.
  
  It is an implementation of [gio.app_launch_context.AppLaunchContext] that provides startup
  notification and allows to launch applications on a specific workspace.
  
  ## Launching an application
  
  ```c
  GdkAppLaunchContext *context;
  
  context = gdk_display_get_app_launch_context (display);
  
  gdk_app_launch_context_set_timestamp (gdk_event_get_time (event));
  
  if (!g_app_info_launch_default_for_uri ("http://www.gtk.org", context, &error))
    g_warning ("Launching failed: %s\n", error->message);
  
  g_object_unref (context);
  ```
*/
struct GdkAppLaunchContext;

/**
    An event related to a button on a pointer device.
*/
struct GdkButtonEvent;

/**
    [gdk.cairo_context.CairoContext] is an object representing the platform-specific
  draw context.
  
  [gdk.cairo_context.CairoContext]s are created for a surface using
  [gdk.surface.Surface.createCairoContext], and the context
  can then be used to draw on that surface.
*/
struct GdkCairoContext;

/**
    The [gdk.clipboard.Clipboard] object represents data shared between applications or
  inside an application.
  
  To get a [gdk.clipboard.Clipboard] object, use [gdk.display.Display.getClipboard] or
  [gdk.display.Display.getPrimaryClipboard]. You can find out about the data
  that is currently available in a clipboard using
  [gdk.clipboard.Clipboard.getFormats].
  
  To make text or image data available in a clipboard, use
  [gdk.clipboard.Clipboard.setText] or [gdk.clipboard.Clipboard.setTexture].
  For other data, you can use [gdk.clipboard.Clipboard.setContent], which
  takes a [gdk.content_provider.ContentProvider] object.
  
  To read textual or image data from a clipboard, use
  [gdk.clipboard.Clipboard.readTextAsync] or
  [gdk.clipboard.Clipboard.readTextureAsync]. For other data, use
  [gdk.clipboard.Clipboard.readAsync], which provides a [gio.input_stream.InputStream] object.
*/
struct GdkClipboard;

/**
    A [gdk.content_deserializer.ContentDeserializer] is used to deserialize content received via
  inter-application data transfers.
  
  The [gdk.content_deserializer.ContentDeserializer] transforms serialized content that is
  identified by a mime type into an object identified by a GType.
  
  GTK provides serializers and deserializers for common data types
  such as text, colors, images or file lists. To register your own
  deserialization functions, use `func@content_register_deserializer`.
  
  Also see [gdk.content_serializer.ContentSerializer].
*/
struct GdkContentDeserializer;

/**
    The [gdk.content_formats.ContentFormats] structure is used to advertise and negotiate the
  format of content.
  
  You will encounter [gdk.content_formats.ContentFormats] when interacting with objects
  controlling operations that pass data between different widgets, window
  or application, like [gdk.drag.Drag], [gdk.drop.Drop],
  [gdk.clipboard.Clipboard] or [gdk.content_provider.ContentProvider].
  
  GDK supports content in 2 forms: [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] and mime type.
  Using `GTypes` is meant only for in-process content transfers. Mime types
  are meant to be used for data passing both in-process and out-of-process.
  The details of how data is passed is described in the documentation of
  the actual implementations. To transform between the two forms,
  [gdk.content_serializer.ContentSerializer] and [gdk.content_deserializer.ContentDeserializer] are used.
  
  A [gdk.content_formats.ContentFormats] describes a set of possible formats content can be
  exchanged in. It is assumed that this set is ordered. `GTypes` are more
  important than mime types. Order between different `GTypes` or mime types
  is the order they were added in, most important first. Functions that
  care about order, such as [gdk.content_formats.ContentFormats.union_], will describe
  in their documentation how they interpret that order, though in general the
  order of the first argument is considered the primary order of the result,
  followed by the order of further arguments.
  
  For debugging purposes, the function [gdk.content_formats.ContentFormats.toString_]
  exists. It will print a comma-separated list of formats from most important
  to least important.
  
  [gdk.content_formats.ContentFormats] is an immutable struct. After creation, you cannot change
  the types it represents. Instead, new [gdk.content_formats.ContentFormats] have to be created.
  The [gdk.content_formats_builder.ContentFormatsBuilder] structure is meant to help in this
  endeavor.
*/
struct GdkContentFormats;

/**
    A [gdk.content_formats_builder.ContentFormatsBuilder] is an auxiliary struct used to create
  new [gdk.content_formats.ContentFormats], and should not be kept around.
*/
struct GdkContentFormatsBuilder;

/**
    A [gdk.content_provider.ContentProvider] is used to provide content for the clipboard or
  for drag-and-drop operations in a number of formats.
  
  To create a [gdk.content_provider.ContentProvider], use [gdk.content_provider.ContentProvider.newForValue]
  or [gdk.content_provider.ContentProvider.newForBytes].
  
  GDK knows how to handle common text and image formats out-of-the-box. See
  [gdk.content_serializer.ContentSerializer] and [gdk.content_deserializer.ContentDeserializer] if you want
  to add support for application-specific data formats.
*/
struct GdkContentProvider
{
  /** */
  ObjectC parent;
}

/**
    Class structure for [gdk.content_provider.ContentProvider].
*/
struct GdkContentProviderClass
{
  /** */
  GObjectClass parentClass;

  /**
      Signal class closure for `GdkContentProvider::content-changed`
  */
  extern(C) void function(GdkContentProvider* provider) contentChanged;

  /** */
  extern(C) void function(GdkContentProvider* provider, GdkClipboard* clipboard) attachClipboard;

  /** */
  extern(C) void function(GdkContentProvider* provider, GdkClipboard* clipboard) detachClipboard;

  /** */
  extern(C) GdkContentFormats* function(GdkContentProvider* provider) refFormats;

  /** */
  extern(C) GdkContentFormats* function(GdkContentProvider* provider) refStorableFormats;

  /** */
  extern(C) void function(GdkContentProvider* provider, const(char)* mimeType, GOutputStream* stream, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) writeMimeTypeAsync;

  /** */
  extern(C) bool function(GdkContentProvider* provider, GAsyncResult* result, GError** _err) writeMimeTypeFinish;

  /** */
  extern(C) bool function(GdkContentProvider* provider, GValue* value, GError** _err) getValue;

  /** */
  void*[8] padding;
}

/**
    A [gdk.content_serializer.ContentSerializer] is used to serialize content for
  inter-application data transfers.
  
  The [gdk.content_serializer.ContentSerializer] transforms an object that is identified
  by a GType into a serialized form (i.e. a byte stream) that is
  identified by a mime type.
  
  GTK provides serializers and deserializers for common data types
  such as text, colors, images or file lists. To register your own
  serialization functions, use `func@Gdk.content_register_serializer`.
  
  Also see [gdk.content_deserializer.ContentDeserializer].
*/
struct GdkContentSerializer;

/**
    An event caused by a pointing device moving between surfaces.
*/
struct GdkCrossingEvent;

/**
    [gdk.cursor.Cursor] is used to create and destroy cursors.
  
  Cursors are immutable objects, so once you created them, there is no way
  to modify them later. You should create a new cursor when you want to change
  something about it.
  
  Cursors by themselves are not very interesting: they must be bound to a
  window for users to see them. This is done with [gdk.surface.Surface.setCursor]
  or [gdk.surface.Surface.setDeviceCursor]. Applications will typically
  use higher-level GTK functions such as [[gtk.widget.Widget.setCursor]](../gtk4/method.Widget.set_cursor.html)
  instead.
  
  Cursors are not bound to a given [gdk.display.Display], so they can be shared.
  However, the appearance of cursors may vary when used on different
  platforms.
  
  ## Named and texture cursors
  
  There are multiple ways to create cursors. The platform's own cursors
  can be created with [gdk.cursor.Cursor.newFromName]. That function lists
  the commonly available names that are shared with the CSS specification.
  Other names may be available, depending on the platform in use. On some
  platforms, what images are used for named cursors may be influenced by
  the cursor theme.
  
  Another option to create a cursor is to use [gdk.cursor.Cursor.newFromTexture]
  and provide an image to use for the cursor.
  
  To ease work with unsupported cursors, a fallback cursor can be provided.
  If a [gdk.surface.Surface] cannot use a cursor because of the reasons mentioned
  above, it will try the fallback cursor. Fallback cursors can themselves have
  fallback cursors again, so it is possible to provide a chain of progressively
  easier to support cursors. If none of the provided cursors can be supported,
  the default cursor will be the ultimate fallback.
*/
struct GdkCursor;

/**
    An event related to drag and drop operations.
*/
struct GdkDNDEvent;

/**
    An event related to closing a top-level surface.
*/
struct GdkDeleteEvent;

/**
    The [gdk.device.Device] object represents an input device, such
  as a keyboard, a mouse, or a touchpad.
  
  See the [gdk.seat.Seat] documentation for more information
  about the various kinds of devices, and their relationships.
*/
struct GdkDevice;

/**
    [gdk.device_pad.DevicePad] is an interface implemented by devices of type
  [gdk.types.InputSource.TabletPad]
  
  It allows querying the features provided by the pad device.
  
  Tablet pads may contain one or more groups, each containing a subset
  of the buttons/rings/strips available. [gdk.device_pad.DevicePad.getNGroups]
  can be used to obtain the number of groups, [gdk.device_pad.DevicePad.getNFeatures]
  and [gdk.device_pad.DevicePad.getFeatureGroup] can be combined to find out
  the number of buttons/rings/strips the device has, and how are they grouped.
  
  Each of those groups have different modes, which may be used to map each
  individual pad feature to multiple actions. Only one mode is effective
  (current) for each given group, different groups may have different
  current modes. The number of available modes in a group can be found
  out through [gdk.device_pad.DevicePad.getGroupNModes], and the current mode
  for a given group will be notified through events of type [gdk.types.EventType.PadGroupMode].
*/
struct GdkDevicePad;

/** */
struct GdkDevicePadInterface;

/**
    A physical tool associated to a [gdk.device.Device].
*/
struct GdkDeviceTool;

/**
    [gdk.display.Display] objects are the GDK representation of a workstation.
  
  Their purpose are two-fold:
  
  $(LIST
    * To manage and provide information about input devices (pointers, keyboards, etc)
    * To manage and provide information about output devices (monitors, projectors, etc)
  )
    
  Most of the input device handling has been factored out into separate
  [gdk.seat.Seat] objects. Every display has a one or more seats, which
  can be accessed with [gdk.display.Display.getDefaultSeat] and
  [gdk.display.Display.listSeats].
  
  Output devices are represented by [gdk.monitor.MonitorG] objects, which can
  be accessed with [gdk.display.Display.getMonitorAtSurface] and similar APIs.
*/
struct GdkDisplay;

/**
    A singleton object that offers notification when displays appear or
  disappear.
  
  You can use [gdk.display_manager.DisplayManager.get] to obtain the [gdk.display_manager.DisplayManager]
  singleton, but that should be rarely necessary. Typically, initializing
  GTK opens a display that you can work with without ever accessing the
  [gdk.display_manager.DisplayManager].
  
  The GDK library can be built with support for multiple backends.
  The [gdk.display_manager.DisplayManager] object determines which backend is used
  at runtime.
  
  In the rare case that you need to influence which of the backends
  is being used, you can use `func@Gdk.set_allowed_backends`. Note
  that you need to call this function before initializing GTK.
  
  ## Backend-specific code
  
  When writing backend-specific code that is supposed to work with
  multiple GDK backends, you have to consider both compile time and
  runtime. At compile time, use the `GDK_WINDOWING_X11`, `GDK_WINDOWING_WIN32`
  macros, etc. to find out which backends are present in the GDK library
  you are building your application against. At runtime, use type-check
  macros like GDK_IS_X11_DISPLAY() to find out which backend is in use:
  
  ```c
  #ifdef GDK_WINDOWING_X11
    if (GDK_IS_X11_DISPLAY (display))
      {
        // make X11-specific calls here
      }
    else
  #endif
  #ifdef GDK_WINDOWING_MACOS
    if (GDK_IS_MACOS_DISPLAY (display))
      {
        // make Quartz-specific calls here
      }
    else
  #endif
    g_error ("Unsupported GDK backend");
  ```
*/
struct GdkDisplayManager;

/**
    The [gdk.dmabuf_formats.DmabufFormats] struct provides information about
  supported DMA buffer formats.
  
  You can query whether a given format is supported with
  [gdk.dmabuf_formats.DmabufFormats.contains] and you can iterate
  over the list of all supported formats with
  [gdk.dmabuf_formats.DmabufFormats.getNFormats] and
  [gdk.dmabuf_formats.DmabufFormats.getFormat].
  
  The list of supported formats is sorted by preference,
  with the best formats coming first.
  
  The list may contains (format, modifier) pairs where the modifier
  is `DMA_FORMAT_MOD_INVALID`, indicating that **_implicit modifiers_**
  may be used with this format.
  
  See [gdk.dmabuf_texture_builder.DmabufTextureBuilder] for more information
  about DMA buffers.
  
  Note that DMA buffers only exist on Linux.
*/
struct GdkDmabufFormats;

/**
    A [gdk.texture.Texture] representing a DMA buffer.
  
  To create a [gdk.dmabuf_texture.DmabufTexture], use the auxiliary
  [gdk.dmabuf_texture_builder.DmabufTextureBuilder] object.
  
  Dma-buf textures can only be created on Linux.
*/
struct GdkDmabufTexture;

/**
    [gdk.dmabuf_texture_builder.DmabufTextureBuilder] is a builder used to construct [gdk.texture.Texture]
  objects from DMA buffers.
  
  DMA buffers are commonly called **_dma-bufs_**.
  
  DMA buffers are a feature of the Linux kernel to enable efficient buffer and
  memory sharing between hardware such as codecs, GPUs, displays, cameras and the
  kernel drivers controlling them. For example, a decoder may want its output to
  be directly shared with the display server for rendering without a copy.
  
  Any device driver which participates in DMA buffer sharing, can do so as either
  the exporter or importer of buffers (or both).
  
  The memory that is shared via DMA buffers is usually stored in non-system memory
  (maybe in device's local memory or something else not directly accessible by the
  CPU), and accessing this memory from the CPU may have higher-than-usual overhead.
  
  In particular for graphics data, it is not uncommon that data consists of multiple
  separate blocks of memory, for example one block for each of the red, green and
  blue channels. These blocks are called **_planes_**. DMA buffers can have up to
  four planes. Even if the memory is a single block, the data can be organized in
  multiple planes, by specifying offsets from the beginning of the data.
  
  DMA buffers are exposed to user-space as file descriptors allowing to pass them
  between processes. If a DMA buffer has multiple planes, there is one file
  descriptor per plane.
  
  The format of the data (for graphics data, essentially its colorspace) is described
  by a 32-bit integer. These format identifiers are defined in the header file `drm_fourcc.h`
  and commonly referred to as **_fourcc_** values, since they are identified by 4 ASCII
  characters. Additionally, each DMA buffer has a **_modifier_**, which is a 64-bit integer
  that describes driver-specific details of the memory layout, such as tiling or compression.
  
  For historical reasons, some producers of dma-bufs don't provide an explicit modifier, but
  instead return `DMA_FORMAT_MOD_INVALID` to indicate that their modifier is **_implicit_**.
  GTK tries to accommodate this situation by accepting `DMA_FORMAT_MOD_INVALID` as modifier.
  
  The operation of [gdk.dmabuf_texture_builder.DmabufTextureBuilder] is quite simple: Create a texture builder,
  set all the necessary properties, and then call [gdk.dmabuf_texture_builder.DmabufTextureBuilder.build]
  to create the new texture.
  
  The required properties for a dma-buf texture are
  
   $(LIST
      * The width and height in pixels
     
      * The `fourcc` code and `modifier` which identify the format and memory layout of the dma-buf
     
      * The file descriptor, offset and stride for each of the planes
   )
     
  [gdk.dmabuf_texture_builder.DmabufTextureBuilder] can be used for quick one-shot construction of
  textures as well as kept around and reused to construct multiple textures.
  
  For further information, see
  
  $(LIST
    * The Linux kernel [documentation](https://docs.kernel.org/driver-api/dma-buf.html)
    
    * The header file [drm_fourcc.h](https://gitlab.freedesktop.org/mesa/drm/-/blob/main/include/drm/drm_fourcc.h)
  )
*/
struct GdkDmabufTextureBuilder;

/** */
struct GdkDmabufTextureBuilderClass;

/** */
struct GdkDmabufTextureClass;

/**
    The [gdk.drag.Drag] object represents the source of an ongoing DND operation.
  
  A [gdk.drag.Drag] is created when a drag is started, and stays alive for duration of
  the DND operation. After a drag has been started with [gdk.drag.Drag.begin],
  the caller gets informed about the status of the ongoing drag operation
  with signals on the [gdk.drag.Drag] object.
  
  GTK provides a higher level abstraction based on top of these functions,
  and so they are not normally needed in GTK applications. See the
  "Drag and Drop" section of the GTK documentation for more information.
*/
struct GdkDrag;

/**
    A [gdk.drag_surface.DragSurface] is an interface for surfaces used during DND.
*/
struct GdkDragSurface;

/**
    The [gdk.types.DragSurfaceInterface] implementation is private to GDK.
*/
struct GdkDragSurfaceInterface;

/**
    The [gdk.drag_surface_size.DragSurfaceSize] struct contains information that is useful
  to compute the size of a drag surface.
*/
struct GdkDragSurfaceSize;

/**
    Base class for objects implementing different rendering methods.
  
  [gdk.draw_context.DrawContext] is the base object used by contexts implementing different
  rendering methods, such as [gdk.cairo_context.CairoContext] or [gdk.glcontext.GLContext].
  It provides shared functionality between those contexts.
  
  You will always interact with one of those subclasses.
  
  A [gdk.draw_context.DrawContext] is always associated with a single toplevel surface.
*/
struct GdkDrawContext;

/**
    The [gdk.drop.Drop] object represents the target of an ongoing DND operation.
  
  Possible drop sites get informed about the status of the ongoing drag
  operation with events of type [gdk.types.EventType.DragEnter], [gdk.types.EventType.DragLeave],
  [gdk.types.EventType.DragMotion] and [gdk.types.EventType.DropStart]. The [gdk.drop.Drop] object can be obtained
  from these [gdk.event.Event] types using [gdk.dndevent.DNDEvent.getDrop].
  
  The actual data transfer is initiated from the target side via an async
  read, using one of the [gdk.drop.Drop] methods for this purpose:
  [gdk.drop.Drop.readAsync] or [gdk.drop.Drop.readValueAsync].
  
  GTK provides a higher level abstraction based on top of these functions,
  and so they are not normally needed in GTK applications. See the
  "Drag and Drop" section of the GTK documentation for more information.
*/
struct GdkDrop;

/**
    [gdk.event.Event]s are immutable data structures, created by GDK to
  represent windowing system events.
  
  In GTK applications the events are handled automatically by toplevel
  widgets and passed on to the event controllers of appropriate widgets,
  so using [gdk.event.Event] and its related API is rarely needed.
*/
struct GdkEvent;

/**
    [gdk.event_sequence.EventSequence] is an opaque type representing a sequence
  of related touch events.
*/
struct GdkEventSequence;

/**
    An opaque type representing a list of files.
*/
struct GdkFileList;

/**
    An event related to a keyboard focus change.
*/
struct GdkFocusEvent;

/**
    A [gdk.frame_clock.FrameClock] tells the application when to update and repaint
  a surface.
  
  This may be synced to the vertical refresh rate of the monitor, for example.
  Even when the frame clock uses a simple timer rather than a hardware-based
  vertical sync, the frame clock helps because it ensures everything paints at
  the same time (reducing the total number of frames).
  
  The frame clock can also automatically stop painting when it knows the frames
  will not be visible, or scale back animation framerates.
  
  [gdk.frame_clock.FrameClock] is designed to be compatible with an OpenGL-based implementation
  or with mozRequestAnimationFrame in Firefox, for example.
  
  A frame clock is idle until someone requests a frame with
  [gdk.frame_clock.FrameClock.requestPhase]. At some later point that makes sense
  for the synchronization being implemented, the clock will process a frame and
  emit signals for each phase that has been requested. (See the signals of the
  [gdk.frame_clock.FrameClock] class for documentation of the phases.
  [gdk.types.FrameClockPhase.Update] and the [gdk.frame_clock.FrameClock.update] signal
  are most interesting for application writers, and are used to update the
  animations, using the frame time given by [gdk.frame_clock.FrameClock.getFrameTime].
  
  The frame time is reported in microseconds and generally in the same
  timescale as [glib.global.getMonotonicTime], however, it is not the same
  as [glib.global.getMonotonicTime]. The frame time does not advance during
  the time a frame is being painted, and outside of a frame, an attempt
  is made so that all calls to [gdk.frame_clock.FrameClock.getFrameTime] that
  are called at a “similar” time get the same value. This means that
  if different animations are timed by looking at the difference in
  time between an initial value from [gdk.frame_clock.FrameClock.getFrameTime]
  and the value inside the [gdk.frame_clock.FrameClock.update] signal of the clock,
  they will stay exactly synchronized.
*/
struct GdkFrameClock;

/** */
struct GdkFrameClockClass;

/** */
struct GdkFrameClockPrivate;

/**
    A [gdk.frame_timings.FrameTimings] object holds timing information for a single frame
  of the application’s displays.
  
  To retrieve [gdk.frame_timings.FrameTimings] objects, use [gdk.frame_clock.FrameClock.getTimings]
  or [gdk.frame_clock.FrameClock.getCurrentTimings]. The information in
  [gdk.frame_timings.FrameTimings] is useful for precise synchronization of video with
  the event or audio streams, and for measuring quality metrics for the
  application’s display, such as latency and jitter.
*/
struct GdkFrameTimings;

/**
    [gdk.glcontext.GLContext] is an object representing a platform-specific
  OpenGL draw context.
  
  [gdk.glcontext.GLContext]s are created for a surface using
  [gdk.surface.Surface.createGlContext], and the context will match
  the characteristics of the surface.
  
  A [gdk.glcontext.GLContext] is not tied to any particular normal framebuffer.
  For instance, it cannot draw to the surface back buffer. The GDK
  repaint system is in full control of the painting to that. Instead,
  you can create render buffers or textures and use `func@cairo_draw_from_gl`
  in the draw function of your widget to draw them. Then GDK will handle
  the integration of your rendering with that of other widgets.
  
  Support for [gdk.glcontext.GLContext] is platform-specific and context creation
  can fail, returning null context.
  
  A [gdk.glcontext.GLContext] has to be made "current" in order to start using
  it, otherwise any OpenGL call will be ignored.
  
  ## Creating a new OpenGL context
  
  In order to create a new [gdk.glcontext.GLContext] instance you need a [gdk.surface.Surface],
  which you typically get during the realize call of a widget.
  
  A [gdk.glcontext.GLContext] is not realized until either [gdk.glcontext.GLContext.makeCurrent]
  or [gdk.glcontext.GLContext.realize] is called. It is possible to specify
  details of the GL context like the OpenGL version to be used, or whether
  the GL context should have extra state validation enabled after calling
  [gdk.surface.Surface.createGlContext] by calling [gdk.glcontext.GLContext.realize].
  If the realization fails you have the option to change the settings of
  the [gdk.glcontext.GLContext] and try again.
  
  ## Using a GdkGLContext
  
  You will need to make the [gdk.glcontext.GLContext] the current context before issuing
  OpenGL calls; the system sends OpenGL commands to whichever context is current.
  It is possible to have multiple contexts, so you always need to ensure that
  the one which you want to draw with is the current one before issuing commands:
  
  ```c
  gdk_gl_context_make_current (context);
  ```
  
  You can now perform your drawing using OpenGL commands.
  
  You can check which [gdk.glcontext.GLContext] is the current one by using
  [gdk.glcontext.GLContext.getCurrent]; you can also unset any [gdk.glcontext.GLContext]
  that is currently set by calling [gdk.glcontext.GLContext.clearCurrent].
*/
struct GdkGLContext;

/**
    A GdkTexture representing a GL texture object.
*/
struct GdkGLTexture;

/**
    [gdk.gltexture_builder.GLTextureBuilder] is a builder used to construct [gdk.texture.Texture] objects from
  GL textures.
  
  The operation is quite simple: Create a texture builder, set all the necessary
  properties - keep in mind that the properties [gdk.gltexture_builder.GLTextureBuilder.GLContext],
  [gdk.gltexture_builder.GLTextureBuilder.guint], [gdk.gltexture_builder.GLTextureBuilder.gint], and
  [gdk.gltexture_builder.GLTextureBuilder.gint] are mandatory - and then call
  [gdk.gltexture_builder.GLTextureBuilder.build] to create the new texture.
  
  [gdk.gltexture_builder.GLTextureBuilder] can be used for quick one-shot construction of
  textures as well as kept around and reused to construct multiple textures.
*/
struct GdkGLTextureBuilder;

/** */
struct GdkGLTextureBuilderClass;

/** */
struct GdkGLTextureClass;

/**
    An event related to a broken windowing system grab.
*/
struct GdkGrabBrokenEvent;

/**
    An event related to a key-based device.
*/
struct GdkKeyEvent;

/**
    A [gdk.types.KeymapKey] is a hardware key that can be mapped to a keyval.
*/
struct GdkKeymapKey
{
  /**
      the hardware keycode. This is an identifying number for a
      physical key.
  */
  uint keycode;

  /**
      indicates movement in a horizontal direction. Usually groups are used
      for two different languages. In group 0, a key might have two English
      characters, and in group 1 it might have two Hebrew characters. The Hebrew
      characters will be printed on the key next to the English characters.
  */
  int group;

  /**
      indicates which symbol on the key will be used, in a vertical direction.
      So on a standard US keyboard, the key with the number “1” on it also has the
      exclamation point ("!") character on it. The level indicates whether to use
      the “1” or the “!” symbol. The letter keys are considered to have a lowercase
      letter at level 0, and an uppercase letter at level 1, though only the
      uppercase letter is printed.
  */
  int level;
}

/**
    A [gdk.texture.Texture] representing image data in memory.
*/
struct GdkMemoryTexture;

/** */
struct GdkMemoryTextureClass;

/** */
struct GdkMonitorClass;

/**
    [gdk.monitor.MonitorG] objects represent the individual outputs that are
  associated with a [gdk.display.Display].
  
  [gdk.display.Display] keeps a [gio.list_model.ListModel] to enumerate and monitor
  monitors with [gdk.display.Display.getMonitors]. You can use
  [gdk.display.Display.getMonitorAtSurface] to find a particular
  monitor.
*/
struct GdkMonitor;

/**
    An event related to a pointer or touch device motion.
*/
struct GdkMotionEvent;

/**
    An event related to a pad-based device.
*/
struct GdkPadEvent;

/**
    [gdk.paintable.Paintable] is a simple interface used by GTK to represent content that
  can be painted.
  
  The content of a [gdk.paintable.Paintable] can be painted anywhere at any size
  without requiring any sort of layout. The interface is inspired by
  similar concepts elsewhere, such as
  [ClutterContent](https://developer.gnome.org/clutter/stable/ClutterContent.html),
  [HTML/CSS Paint Sources](https://www.w3.org/TR/css-images-4/#paint-source),
  or [SVG Paint Servers](https://www.w3.org/TR/SVG2/pservers.html).
  
  A [gdk.paintable.Paintable] can be snapshot at any time and size using
  [gdk.paintable.Paintable.snapshot]. How the paintable interprets that size and
  if it scales or centers itself into the given rectangle is implementation
  defined, though if you are implementing a [gdk.paintable.Paintable] and don't know what
  to do, it is suggested that you scale your paintable ignoring any potential
  aspect ratio.
  
  The contents that a [gdk.paintable.Paintable] produces may depend on the [gdk.snapshot.Snapshot]
  passed to it. For example, paintables may decide to use more detailed images
  on higher resolution screens or when OpenGL is available. A [gdk.paintable.Paintable]
  will however always produce the same output for the same snapshot.
  
  A [gdk.paintable.Paintable] may change its contents, meaning that it will now produce
  a different output with the same snapshot. Once that happens, it will call
  [gdk.paintable.Paintable.invalidateContents] which will emit the
  `signal@Gdk.Paintable::invalidate-contents` signal. If a paintable is known
  to never change its contents, it will set the [gdk.types.PaintableFlags.Contents]
  flag. If a consumer cannot deal with changing contents, it may call
  [gdk.paintable.Paintable.getCurrentImage] which will return a static
  paintable and use that.
  
  A paintable can report an intrinsic (or preferred) size or aspect ratio it
  wishes to be rendered at, though it doesn't have to. Consumers of the interface
  can use this information to layout thepaintable appropriately. Just like the
  contents, the size of a paintable can change. A paintable will indicate this
  by calling [gdk.paintable.Paintable.invalidateSize] which will emit the
  `signal@Gdk.Paintable::invalidate-size` signal. And just like for contents,
  if a paintable is known to never change its size, it will set the
  [gdk.types.PaintableFlags.Size] flag.
  
  Besides API for applications, there are some functions that are only
  useful for implementing subclasses and should not be used by applications:
  [gdk.paintable.Paintable.invalidateContents],
  [gdk.paintable.Paintable.invalidateSize],
  [gdk.paintable.Paintable.newEmpty].
*/
struct GdkPaintable;

/**
    The list of functions that can be implemented for the [gdk.paintable.Paintable]
  interface.
  
  Note that apart from the `vfunc@Gdk.Paintable.snapshot` function,
  no virtual function of this interface is mandatory to implement, though it
  is a good idea to implement `vfunc@Gdk.Paintable.get_current_image`
  for non-static paintables and `vfunc@Gdk.Paintable.get_flags` if the
  image is not dynamic as the default implementation returns no flags and
  that will make the implementation likely quite slow.
*/
struct GdkPaintableInterface
{
  /** */
  GTypeInterface gIface;

  /**
      Snapshot the paintable. The given @width and @height are
      guaranteed to be larger than 0.0. The resulting snapshot must modify
      only the area in the rectangle from (0,0) to (width, height).
      This is the only function that must be implemented for this interface.
  */
  extern(C) void function(GdkPaintable* paintable, GdkSnapshot* snapshot, double width, double height) snapshot;

  /**
      return a [gdk.paintable.Paintable] that does not change over
      time. This means the [gdk.types.PaintableFlags.Size] and
      [gdk.types.PaintableFlags.Contents] flag are set.
  */
  extern(C) GdkPaintable* function(GdkPaintable* paintable) getCurrentImage;

  /**
      Get the flags for this instance. See [gdk.types.PaintableFlags]
      for details.
  */
  extern(C) GdkPaintableFlags function(GdkPaintable* paintable) getFlags;

  /**
      The preferred width for this object to be
      snapshot at or 0 if none. This is purely a hint. The object must still
      be able to render at any size.
  */
  extern(C) int function(GdkPaintable* paintable) getIntrinsicWidth;

  /**
      The preferred height for this object to be
      snapshot at or 0 if none. This is purely a hint. The object must still
      be able to render at any size.
  */
  extern(C) int function(GdkPaintable* paintable) getIntrinsicHeight;

  /**
      The preferred aspect ratio for this object
      or 0 if none. If both `vfunc@Gdk.Paintable.get_intrinsic_width`
      and `vfunc@Gdk.Paintable.get_intrinsic_height` return non-zero
      values, this function should return the aspect ratio computed from those.
  */
  extern(C) double function(GdkPaintable* paintable) getIntrinsicAspectRatio;
}

/**
    A [gdk.popup.Popup] is a surface that is attached to another surface.
  
  The [gdk.popup.Popup] is positioned relative to its parent surface.
  
  [gdk.popup.Popup]s are typically used to implement menus and similar popups.
  They can be modal, which is indicated by the [gdk.popup.Popup.gboolean]
  property.
*/
struct GdkPopup;

/** */
struct GdkPopupInterface;

/**
    The [gdk.popup_layout.PopupLayout] struct contains information that is
  necessary position a [gdk.popup.Popup] relative to its parent.
  
  The positioning requires a negotiation with the windowing system,
  since it depends on external constraints, such as the position of
  the parent surface, and the screen dimensions.
  
  The basic ingredients are a rectangle on the parent surface,
  and the anchor on both that rectangle and the popup. The anchors
  specify a side or corner to place next to each other.
  
  ![Popup anchors](popup-anchors.png)
  
  For cases where placing the anchors next to each other would make
  the popup extend offscreen, the layout includes some hints for how
  to resolve this problem. The hints may suggest to flip the anchor
  position to the other side, or to 'slide' the popup along a side,
  or to resize it.
  
  ![Flipping popups](popup-flip.png)
  
  ![Sliding popups](popup-slide.png)
  
  These hints may be combined.
  
  Ultimatively, it is up to the windowing system to determine the position
  and size of the popup. You can learn about the result by calling
  [gdk.popup.Popup.getPositionX], [gdk.popup.Popup.getPositionY],
  [gdk.popup.Popup.getRectAnchor] and [gdk.popup.Popup.getSurfaceAnchor]
  after the popup has been presented. This can be used to adjust the rendering.
  For example, [GtkPopover](../gtk4/class.Popover.html) changes its arrow position
  accordingly. But you have to be careful avoid changing the size of the popover,
  or it has to be presented again.
*/
struct GdkPopupLayout;

/**
    An event related to the proximity of a tool to a device.
*/
struct GdkProximityEvent;

/**
    A [gdk.rgba.RGBA] is used to represent a color, in a way that is compatible
  with cairo’s notion of color.
  
  [gdk.rgba.RGBA] is a convenient way to pass colors around. It’s based on
  cairo’s way to deal with colors and mirrors its behavior. All values
  are in the range from 0.0 to 1.0 inclusive. So the color
  (0.0, 0.0, 0.0, 0.0) represents transparent black and
  (1.0, 1.0, 1.0, 1.0) is opaque white. Other values will
  be clamped to this range when drawing.
*/
struct GdkRGBA
{
  /**
      The intensity of the red channel from 0.0 to 1.0 inclusive
  */
  float red;

  /**
      The intensity of the green channel from 0.0 to 1.0 inclusive
  */
  float green;

  /**
      The intensity of the blue channel from 0.0 to 1.0 inclusive
  */
  float blue;

  /**
      The opacity of the color from 0.0 for completely translucent to
      1.0 for opaque
  */
  float alpha;
}

/**
    A [gtk.types.Rectangle] data type for representing rectangles.
  
  [gtk.types.Rectangle] is identical to [cairo.rectangle.Rectangle]. Together with Cairo’s
  [cairo.region.Region] data type, these are the central types for representing
  sets of pixels.
  
  The intersection of two rectangles can be computed with
  [gdk.rectangle.Rectangle.intersect]; to find the union of two rectangles use
  [gdk.rectangle.Rectangle.union_].
  
  The [cairo.region.Region] type provided by Cairo is usually used for managing
  non-rectangular clipping of graphical operations.
  
  The Graphene library has a number of other data types for regions and
  volumes in 2D and 3D.
*/
struct GdkRectangle
{
  /**
      the x coordinate of the top left corner
  */
  int x;

  /**
      the y coordinate of the top left corner
  */
  int y;

  /**
      the width of the rectangle
  */
  int width;

  /**
      the height of the rectangle
  */
  int height;
}

/**
    An event related to a scrolling motion.
*/
struct GdkScrollEvent;

/**
    The [gdk.seat.Seat] object represents a collection of input devices
  that belong to a user.
*/
struct GdkSeat
{
  /** */
  ObjectC parentInstance;
}

/**
    Base type for snapshot operations.
  
  The subclass of [gdk.snapshot.Snapshot] used by GTK is [GtkSnapshot](../gtk4/class.Snapshot.html).
*/
struct GdkSnapshot;

/** */
struct GdkSnapshotClass;

/**
    A [gdk.surface.Surface] is a rectangular region on the screen.
  
  It’s a low-level object, used to implement high-level objects
  such as [GtkWindow](../gtk4/class.Window.html).
  
  The surfaces you see in practice are either [gdk.toplevel.Toplevel] or
  [gdk.popup.Popup], and those interfaces provide much of the required
  API to interact with these surfaces. Other, more specialized surface
  types exist, but you will rarely interact with them directly.
*/
struct GdkSurface;

/** */
struct GdkSurfaceClass;

/**
    [gdk.texture.Texture] is the basic element used to refer to pixel data.
  
  It is primarily meant for pixel data that will not change over
  multiple frames, and will be used for a long time.
  
  There are various ways to create [gdk.texture.Texture] objects from a
  [gdkpixbuf.pixbuf.Pixbuf], or from bytes stored in memory, a file, or a
  [gio.resource.Resource].
  
  The ownership of the pixel data is transferred to the [gdk.texture.Texture]
  instance; you can only make a copy of it, via [gdk.texture.Texture.download].
  
  [gdk.texture.Texture] is an immutable object: That means you cannot change
  anything about it other than increasing the reference count via
  [gobject.object.ObjectG.ref_], and consequently, it is a thread-safe object.
*/
struct GdkTexture;

/** */
struct GdkTextureClass;

/**
    The [gdk.texture_downloader.TextureDownloader] is used to download the contents of a
  [gdk.texture.Texture].
  
  It is intended to be created as a short-term object for a single download,
  but can be used for multiple downloads of different textures or with different
  settings.
  
  [gdk.texture_downloader.TextureDownloader] can be used to convert data between different formats.
  Create a [gdk.texture.Texture] for the existing format and then download it in a
  different format.
*/
struct GdkTextureDownloader;

/**
    A [gdk.types.TimeCoord] stores a single event in a motion history.
  
  To check whether an axis is present, check whether the corresponding
  flag from the [gdk.types.AxisFlags] enumeration is set in the @flags
  To access individual axis values, use the values of the values of
  the [gdk.types.AxisUse] enumerations as indices.
*/
struct GdkTimeCoord
{
  /**
      The timestamp for this event
  */
  uint time;

  /**
      Flags indicating what axes are present, see [gdk.types.AxisFlags]
  */
  GdkAxisFlags flags;

  /**
      axis values, indexed by [gdk.types.AxisUse]
  */
  double[12] axes;
}

/**
    A [gdk.toplevel.Toplevel] is a freestanding toplevel surface.
  
  The [gdk.toplevel.Toplevel] interface provides useful APIs for interacting with
  the windowing system, such as controlling maximization and size of the
  surface, setting icons and transient parents for dialogs.
*/
struct GdkToplevel;

/** */
struct GdkToplevelInterface;

/**
    The [gdk.toplevel_layout.ToplevelLayout] struct contains information that
  is necessary to present a sovereign window on screen.
  
  The [gdk.toplevel_layout.ToplevelLayout] struct is necessary for using
  [gdk.toplevel.Toplevel.present].
  
  Toplevel surfaces are sovereign windows that can be presented
  to the user in various states (maximized, on all workspaces,
  etc).
*/
struct GdkToplevelLayout;

/**
    The [gdk.toplevel_size.ToplevelSize] struct contains information that is useful
  to compute the size of a toplevel.
*/
struct GdkToplevelSize;

/**
    An event related to a touch-based device.
*/
struct GdkTouchEvent;

/**
    An event related to a gesture on a touchpad device.
  
  Unlike touchscreens, where the windowing system sends basic
  sequences of begin, update, end events, and leaves gesture
  recognition to the clients, touchpad gestures are typically
  processed by the system, resulting in these events.
*/
struct GdkTouchpadEvent;

/**
    [gdk.vulkan_context.VulkanContext] is an object representing the platform-specific
  Vulkan draw context.
  
  [gdk.vulkan_context.VulkanContext]s are created for a surface using
  [gdk.surface.Surface.createVulkanContext], and the context will match
  the characteristics of the surface.
  
  Support for [gdk.vulkan_context.VulkanContext] is platform-specific and context creation
  can fail, returning null context.
*/
struct GdkVulkanContext;

alias extern(C) void function(GdkContentDeserializer* deserializer) GdkContentDeserializeFunc;

alias extern(C) void function(GdkContentSerializer* serializer) GdkContentSerializeFunc;

