module gdkpixbuf.types;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf;
import gdkpixbuf.pixbuf_animation;
import gdkpixbuf.pixbuf_format;
import gdkpixbuf.pixbuf_module;
import gid.gid;
import glib.error;


// Callbacks

/**
    Defines the type of the function used to fill a
  #GdkPixbufFormat structure with information about a module.

  ## Parameters
  $(LIST
    * $(B info)       a #GdkPixbufFormat.
  )
*/
alias PixbufModuleFillInfoFunc = void delegate(gdkpixbuf.pixbuf_format.PixbufFormat info);

/**
    Defines the type of the function used to set the vtable of a
  #GdkPixbufModule when it is loaded.

  ## Parameters
  $(LIST
    * $(B module_)       a #GdkPixbufModule.
  )
*/
alias PixbufModuleFillVtableFunc = void delegate(gdkpixbuf.pixbuf_module.PixbufModule module_);

/**
    Incrementally loads a buffer into the image data.

  ## Parameters
  $(LIST
    * $(B context)       the state object created by [gdkpixbuf.types.PixbufModuleBeginLoadFunc]
    * $(B buf)       the data to load
  )
  Returns:     `TRUE` if the incremental load was successful
*/
alias PixbufModuleIncrementLoadFunc = bool delegate(void* context, ubyte[] buf, GError **_err);

/**
    Loads a file from a standard C file stream into a new [gdkpixbuf.pixbuf_animation.PixbufAnimation].
  
  In case of error, this function should return `NULL` and set the `error` argument.

  ## Parameters
  $(LIST
    * $(B f)       the file stream from which the image should be loaded
  )
  Returns:     a newly created [gdkpixbuf.pixbuf_animation.PixbufAnimation] for the contents of the file
*/
alias PixbufModuleLoadAnimationFunc = gdkpixbuf.pixbuf_animation.PixbufAnimation delegate(void* f, GError **_err);

/**
    Loads a file from a standard C file stream into a new [gdkpixbuf.pixbuf.Pixbuf].
  
  In case of error, this function should return `NULL` and set the `error` argument.

  ## Parameters
  $(LIST
    * $(B f)       the file stream from which the image should be loaded
  )
  Returns:     a newly created [gdkpixbuf.pixbuf.Pixbuf] for the contents of the file
*/
alias PixbufModuleLoadFunc = gdkpixbuf.pixbuf.Pixbuf delegate(void* f, GError **_err);

/**
    Loads XPM data into a new [gdkpixbuf.pixbuf.Pixbuf].

  ## Parameters
  $(LIST
    * $(B data)       the XPM data
  )
  Returns:     a newly created [gdkpixbuf.pixbuf.Pixbuf] for the XPM data
*/
alias PixbufModuleLoadXpmDataFunc = gdkpixbuf.pixbuf.Pixbuf delegate(string[] data);

/**
    Defines the type of the function that gets called once the initial
  setup of pixbuf is done.
  
  #GdkPixbufLoader uses a function of this type to emit the
  "<link linkend="GdkPixbufLoader-area-prepared">area_prepared</link>"
  signal.

  ## Parameters
  $(LIST
    * $(B pixbuf)       the #GdkPixbuf that is currently being loaded.
    * $(B anim)       if an animation is being loaded, the #GdkPixbufAnimation, else null.
  )
*/
alias PixbufModulePreparedFunc = void delegate(gdkpixbuf.pixbuf.Pixbuf pixbuf, gdkpixbuf.pixbuf_animation.PixbufAnimation anim);

/**
    Saves a [gdkpixbuf.pixbuf.Pixbuf] into a standard C file stream.
  
  The optional `param_keys` and `param_values` arrays contain the keys and
  values (in the same order) for attributes to be saved alongside the image
  data.

  ## Parameters
  $(LIST
    * $(B f)       the file stream into which the image should be saved
    * $(B pixbuf)       the image to save
    * $(B paramKeys)       parameter keys to save
    * $(B paramValues)       parameter values to save
  )
  Returns:     `TRUE` on success; in case of failure, `FALSE` is returned and
      the `error` is set
*/
alias PixbufModuleSaveFunc = bool delegate(void* f, gdkpixbuf.pixbuf.Pixbuf pixbuf, string[] paramKeys, string[] paramValues, GError **_err);

/**
    Checks whether the given `option_key` is supported when saving.

  ## Parameters
  $(LIST
    * $(B optionKey)       the option key to check
  )
  Returns:     `TRUE` if the option is supported
*/
alias PixbufModuleSaveOptionSupportedFunc = bool delegate(string optionKey);

/**
    Defines the type of the function that gets called once the size
  of the loaded image is known.
  
  The function is expected to set width and height to the desired
  size to which the image should be scaled. If a module has no efficient
  way to achieve the desired scaling during the loading of the image, it may
  either ignore the size request, or only approximate it - gdk-pixbuf will
  then perform the required scaling on the completely loaded image.
  
  If the function sets width or height to zero, the module should interpret
  this as a hint that it will be closed soon and shouldn't allocate further
  resources. This convention is used to implement [gdkpixbuf.pixbuf.Pixbuf.getFileInfo]
  efficiently.

  ## Parameters
  $(LIST
    * $(B width)       pointer to a location containing the current image width
    * $(B height)       pointer to a location containing the current image height
  )
*/
alias PixbufModuleSizeFunc = void delegate(out int width, out int height);

/**
    Finalizes the image loading state.
  
  This function is called on success and error states.

  ## Parameters
  $(LIST
    * $(B context)       the state object created by [gdkpixbuf.types.PixbufModuleBeginLoadFunc]
  )
  Returns:     `TRUE` if the loading operation was successful
*/
alias PixbufModuleStopLoadFunc = bool delegate(void* context, GError **_err);

/**
    Defines the type of the function that gets called every time a region
  of pixbuf is updated.
  
  #GdkPixbufLoader uses a function of this type to emit the
  "<link linkend="GdkPixbufLoader-area-updated">area_updated</link>"
  signal.

  ## Parameters
  $(LIST
    * $(B pixbuf)       the #GdkPixbuf that is currently being loaded.
    * $(B x)       the X origin of the updated area.
    * $(B y)       the Y origin of the updated area.
    * $(B width)       the width of the updated area.
    * $(B height)       the height of the updated area.
  )
*/
alias PixbufModuleUpdatedFunc = void delegate(gdkpixbuf.pixbuf.Pixbuf pixbuf, int x, int y, int width, int height);

/**
    Save functions used by [gdkpixbuf.pixbuf.Pixbuf.saveToCallback].
  
  This function is called once for each block of bytes that is "written"
  by `[gdkpixbuf.pixbuf.Pixbuf.saveToCallback]`.
  
  If successful it should return `TRUE`; if an error occurs it should set
  `error` and return `FALSE`, in which case `[gdkpixbuf.pixbuf.Pixbuf.saveToCallback]`
  will fail with the same error.

  ## Parameters
  $(LIST
    * $(B buf)       bytes to be written.
    * $(B error)       A location to return an error.
  )
  Returns:     `TRUE` if successful, `FALSE` otherwise
*/
alias PixbufSaveFunc = bool delegate(ubyte[] buf, out glib.error.ErrorG error);

/**
    This enumeration defines the color spaces that are supported by
  the gdk-pixbuf library.
  
  Currently only RGB is supported.
*/
enum Colorspace
{
  /**
      Indicates a red/green/blue additive color space.
  */
  Rgb = 0,
}

/**
    Interpolation modes for scaling functions.
  
  The [gdkpixbuf.types.InterpType.Nearest] mode is the fastest scaling method, but has
  horrible quality when scaling down; [gdkpixbuf.types.InterpType.Bilinear] is the best
  choice if you aren't sure what to choose, it has a good speed/quality
  balance.
  
  **Note**: Cubic filtering is missing from the list; hyperbolic
  interpolation is just as fast and results in higher quality.
*/
enum InterpType
{
  /**
      Nearest neighbor sampling; this is the fastest
     and lowest quality mode. Quality is normally unacceptable when scaling
     down, but may be OK when scaling up.
  */
  Nearest = 0,

  /**
      This is an accurate simulation of the PostScript
     image operator without any interpolation enabled.  Each pixel is
     rendered as a tiny parallelogram of solid color, the edges of which
     are implemented with antialiasing.  It resembles nearest neighbor for
     enlargement, and bilinear for reduction.
  */
  Tiles = 1,

  /**
      Best quality/speed balance; use this mode by
     default. Bilinear interpolation.  For enlargement, it is
     equivalent to point-sampling the ideal bilinear-interpolated image.
     For reduction, it is equivalent to laying down small tiles and
     integrating over the coverage area.
  */
  Bilinear = 2,

  /**
      This is the slowest and highest quality
     reconstruction function. It is derived from the hyperbolic filters in
     Wolberg's "Digital Image Warping", and is formally defined as the
     hyperbolic-filter sampling the ideal hyperbolic-filter interpolated
     image (the filter is designed to be idempotent for 1:1 pixel mapping).
     **Deprecated**: this interpolation filter is deprecated, as in reality
     it has a lower quality than the @GDK_INTERP_BILINEAR filter
     (Since: 2.38)
  */
  Hyper = 3,
}

/**
    Control the alpha channel for drawables.
  
  These values can be passed to gdk_pixbuf_xlib_render_to_drawable_alpha()
  in gdk-pixbuf-xlib to control how the alpha channel of an image should
  be handled.
  
  This function can create a bilevel clipping mask (black and white) and use
  it while painting the image.
  
  In the future, when the X Window System gets an alpha channel extension,
  it will be possible to do full alpha compositing onto arbitrary drawables.
  For now both cases fall back to a bilevel clipping mask.

  Deprecated:     There is no user of GdkPixbufAlphaMode in GdkPixbuf,
      and the Xlib utility functions have been split out to their own
      library, gdk-pixbuf-xlib
*/
enum PixbufAlphaMode
{
  /**
      A bilevel clipping mask (black and white)
     will be created and used to draw the image.  Pixels below 0.5 opacity
     will be considered fully transparent, and all others will be
     considered fully opaque.
  */
  Bilevel = 0,

  /**
      For now falls back to #GDK_PIXBUF_ALPHA_BILEVEL.
     In the future it will do full alpha compositing.
  */
  Full = 1,
}

/**
    An error code in the `GDK_PIXBUF_ERROR` domain.
  
  Many gdk-pixbuf operations can cause errors in this domain, or in
  the `G_FILE_ERROR` domain.
*/
enum PixbufError
{
  /**
      An image file was broken somehow.
  */
  CorruptImage = 0,

  /**
      Not enough memory.
  */
  InsufficientMemory = 1,

  /**
      A bad option was passed to a pixbuf save module.
  */
  BadOption = 2,

  /**
      Unknown image type.
  */
  UnknownType = 3,

  /**
      Don't know how to perform the
     given operation on the type of image at hand.
  */
  UnsupportedOperation = 4,

  /**
      Generic failure code, something went wrong.
  */
  Failed = 5,

  /**
      Only part of the animation was loaded.
  */
  IncompleteAnimation = 6,
}

/**
    Flags which allow a module to specify further details about the supported
  operations.
*/
enum PixbufFormatFlags : uint
{
  /**
      the module can write out images in the format.
  */
  Writable = 1,

  /**
      the image format is scalable
  */
  Scalable = 2,

  /**
      the module is threadsafe. gdk-pixbuf
        ignores modules that are not marked as threadsafe. (Since 2.28).
  */
  Threadsafe = 4,
}

/**
    The possible rotations which can be passed to [gdkpixbuf.pixbuf.Pixbuf.rotateSimple].
  
  To make them easier to use, their numerical values are the actual degrees.
*/
enum PixbufRotation
{
  /**
      No rotation.
  */
  None = 0,

  /**
      Rotate by 90 degrees.
  */
  Counterclockwise = 90,

  /**
      Rotate by 180 degrees.
  */
  Upsidedown = 180,

  /**
      Rotate by 270 degrees.
  */
  Clockwise = 270,
}

/**
    Major version of gdk-pixbuf library, that is the "0" in
  "0.8.2" for example.
*/
enum PIXBUF_MAJOR = 2;

/**
    Micro version of gdk-pixbuf library, that is the "2" in
  "0.8.2" for example.
*/
enum PIXBUF_MICRO = 10;

/**
    Minor version of gdk-pixbuf library, that is the "8" in
  "0.8.2" for example.
*/
enum PIXBUF_MINOR = 42;

/**
    Contains the full version of GdkPixbuf as a string.
  
  This is the version being compiled against; contrast with
  `gdk_pixbuf_version`.
*/
enum PIXBUF_VERSION = "2.42.10";
