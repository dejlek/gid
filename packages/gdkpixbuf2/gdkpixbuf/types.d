module gdkpixbuf.types;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf;
import gdkpixbuf.pixbuf_animation;
import gdkpixbuf.pixbuf_format;
import gdkpixbuf.pixbuf_module;
import gdkpixbuf.types;
import gid.global;
import glib.error;


// Enums
alias Colorspace = GdkColorspace;
alias InterpType = GdkInterpType;
alias PixbufAlphaMode = GdkPixbufAlphaMode;
alias PixbufError = GdkPixbufError;
alias PixbufFormatFlags = GdkPixbufFormatFlags;
alias PixbufRotation = GdkPixbufRotation;

// Callbacks
alias PixbufModuleFillInfoFunc = void delegate(PixbufFormat info);
alias PixbufModuleFillVtableFunc = void delegate(PixbufModule module_);
alias PixbufModuleIncrementLoadFunc = bool delegate(void* context, ubyte[] buf);
alias PixbufModuleLoadAnimationFunc = PixbufAnimation delegate(void* f);
alias PixbufModuleLoadFunc = Pixbuf delegate(void* f);
alias PixbufModuleLoadXpmDataFunc = Pixbuf delegate(string[] data);
alias PixbufModulePreparedFunc = void delegate(Pixbuf pixbuf, PixbufAnimation anim);
alias PixbufModuleSaveFunc = bool delegate(void* f, Pixbuf pixbuf, string[] paramKeys, string[] paramValues);
alias PixbufModuleSaveOptionSupportedFunc = bool delegate(string optionKey);
alias PixbufModuleSizeFunc = void delegate(out int width, out int height);
alias PixbufModuleStopLoadFunc = bool delegate(void* context);
alias PixbufModuleUpdatedFunc = void delegate(Pixbuf pixbuf, int x, int y, int width, int height);
alias PixbufSaveFunc = bool delegate(ubyte[] buf, out ErrorG error);

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

