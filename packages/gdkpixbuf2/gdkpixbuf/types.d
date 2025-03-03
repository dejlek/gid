module gdkpixbuf.types;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf;
import gdkpixbuf.pixbuf_animation;
import gdkpixbuf.pixbuf_format;
import gdkpixbuf.pixbuf_module;
import gid.gid;
import glib.error;


// Enums
alias Colorspace = GdkColorspace;
alias InterpType = GdkInterpType;
alias PixbufAlphaMode = GdkPixbufAlphaMode;
alias PixbufError = GdkPixbufError;
alias PixbufFormatFlags = GdkPixbufFormatFlags;
alias PixbufRotation = GdkPixbufRotation;

// Callbacks
alias PixbufModuleFillInfoFunc = void delegate(gdkpixbuf.pixbuf_format.PixbufFormat info);
alias PixbufModuleFillVtableFunc = void delegate(gdkpixbuf.pixbuf_module.PixbufModule module_);
alias PixbufModuleIncrementLoadFunc = bool delegate(void* context, ubyte[] buf, GError **_err);
alias PixbufModuleLoadAnimationFunc = gdkpixbuf.pixbuf_animation.PixbufAnimation delegate(void* f, GError **_err);
alias PixbufModuleLoadFunc = gdkpixbuf.pixbuf.Pixbuf delegate(void* f, GError **_err);
alias PixbufModuleLoadXpmDataFunc = gdkpixbuf.pixbuf.Pixbuf delegate(string[] data);
alias PixbufModulePreparedFunc = void delegate(gdkpixbuf.pixbuf.Pixbuf pixbuf, gdkpixbuf.pixbuf_animation.PixbufAnimation anim);
alias PixbufModuleSaveFunc = bool delegate(void* f, gdkpixbuf.pixbuf.Pixbuf pixbuf, string[] paramKeys, string[] paramValues, GError **_err);
alias PixbufModuleSaveOptionSupportedFunc = bool delegate(string optionKey);
alias PixbufModuleSizeFunc = void delegate(out int width, out int height);
alias PixbufModuleStopLoadFunc = bool delegate(void* context, GError **_err);
alias PixbufModuleUpdatedFunc = void delegate(gdkpixbuf.pixbuf.Pixbuf pixbuf, int x, int y, int width, int height);
alias PixbufSaveFunc = bool delegate(ubyte[] buf, out glib.error.ErrorG error);

/**
 * Major version of gdk-pixbuf library, that is the "0" in
 * "0.8.2" for example.
 */
enum PIXBUF_MAJOR = 2;


/**
 * Micro version of gdk-pixbuf library, that is the "2" in
 * "0.8.2" for example.
 */
enum PIXBUF_MICRO = 10;


/**
 * Minor version of gdk-pixbuf library, that is the "8" in
 * "0.8.2" for example.
 */
enum PIXBUF_MINOR = 42;


/**
 * Contains the full version of GdkPixbuf as a string.
 * This is the version being compiled against; contrast with
 * `gdk_pixbuf_version`.
 */
enum PIXBUF_VERSION = "2.42.10";

