module gdkpixbuf.pixbuf_animation;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf;
import gdkpixbuf.pixbuf_animation_iter;
import gdkpixbuf.types;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.input_stream;
import gio.types;
import glib.error;
import glib.time_val;
import gobject.object;

/**
    An opaque object representing an animation.
  
  The GdkPixBuf library provides a simple mechanism to load and
  represent animations. An animation is conceptually a series of
  frames to be displayed over time.
  
  The animation may not be represented as a series of frames
  internally; for example, it may be stored as a sprite and
  instructions for moving the sprite around a background.
  
  To display an animation you don't need to understand its
  representation, however; you just ask [gdkpixbuf.pixbuf.Pixbuf] what should
  be displayed at a given point in time.
*/
class PixbufAnimation : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_pixbuf_animation_get_type != &gidSymbolNotFound ? gdk_pixbuf_animation_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new animation by loading it from a file.
    
    The file format is detected automatically.
    
    If the file's format does not support multi-frame images, then an animation
    with a single frame will be created.
    
    Possible errors are in the `GDK_PIXBUF_ERROR` and `G_FILE_ERROR` domains.
    Params:
      filename =       Name of file to load, in the GLib file
          name encoding
    Returns:     A newly-created animation
  */
  static gdkpixbuf.pixbuf_animation.PixbufAnimation newFromFile(string filename)
  {
    GdkPixbufAnimation* _cretval;
    const(char)* _filename = filename.toCString(No.alloc);
    GError *_err;
    _cretval = gdk_pixbuf_animation_new_from_file(_filename, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gdkpixbuf.pixbuf_animation.PixbufAnimation)(cast(GdkPixbufAnimation*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Creates a new pixbuf animation by loading an image from an resource.
    
    The file format is detected automatically. If `NULL` is returned, then
    error will be set.
    Params:
      resourcePath =       the path of the resource file
    Returns:     A newly-created animation
  */
  static gdkpixbuf.pixbuf_animation.PixbufAnimation newFromResource(string resourcePath)
  {
    GdkPixbufAnimation* _cretval;
    const(char)* _resourcePath = resourcePath.toCString(No.alloc);
    GError *_err;
    _cretval = gdk_pixbuf_animation_new_from_resource(_resourcePath, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gdkpixbuf.pixbuf_animation.PixbufAnimation)(cast(GdkPixbufAnimation*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Creates a new animation by loading it from an input stream.
    
    The file format is detected automatically.
    
    If `NULL` is returned, then error will be set.
    
    The cancellable can be used to abort the operation from another thread.
    If the operation was cancelled, the error [gio.types.IOErrorEnum.cancelled] will be
    returned. Other possible errors are in the `GDK_PIXBUF_ERROR` and
    `G_IO_ERROR` domains.
    
    The stream is not closed.
    Params:
      stream =       a [gio.input_stream.InputStream] to load the pixbuf from
      cancellable =       optional [gio.cancellable.Cancellable] object
    Returns:     A newly-created animation
  */
  static gdkpixbuf.pixbuf_animation.PixbufAnimation newFromStream(gio.input_stream.InputStream stream, gio.cancellable.Cancellable cancellable = null)
  {
    GdkPixbufAnimation* _cretval;
    GError *_err;
    _cretval = gdk_pixbuf_animation_new_from_stream(stream ? cast(GInputStream*)stream.cPtr(No.dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gdkpixbuf.pixbuf_animation.PixbufAnimation)(cast(GdkPixbufAnimation*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Finishes an asynchronous pixbuf animation creation operation started with
    [gdkpixbuf.pixbuf_animation.PixbufAnimation.newFromStreamAsync].
    Params:
      asyncResult =       a #GAsyncResult
    Returns:     the newly created animation
  */
  static gdkpixbuf.pixbuf_animation.PixbufAnimation newFromStreamFinish(gio.async_result.AsyncResult asyncResult)
  {
    GdkPixbufAnimation* _cretval;
    GError *_err;
    _cretval = gdk_pixbuf_animation_new_from_stream_finish(asyncResult ? cast(GAsyncResult*)(cast(ObjectG)asyncResult).cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gdkpixbuf.pixbuf_animation.PixbufAnimation)(cast(GdkPixbufAnimation*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Creates a new animation by asynchronously loading an image from an input stream.
    
    For more details see [gdkpixbuf.pixbuf.Pixbuf.newFromStream], which is the synchronous
    version of this function.
    
    When the operation is finished, `callback` will be called in the main thread.
    You can then call [gdkpixbuf.pixbuf_animation.PixbufAnimation.newFromStreamFinish] to get the
    result of the operation.
    Params:
      stream =       a #GInputStream from which to load the animation
      cancellable =       optional #GCancellable object
      callback =       a [gio.types.AsyncReadyCallback] to call when the pixbuf is loaded
  */
  static void newFromStreamAsync(gio.input_stream.InputStream stream, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gdk_pixbuf_animation_new_from_stream_async(stream ? cast(GInputStream*)stream.cPtr(No.dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.dup) : null, _callbackCB, _callback);
  }

  /**
      Queries the height of the bounding box of a pixbuf animation.
    Returns:     Height of the bounding box of the animation.
  */
  int getHeight()
  {
    int _retval;
    _retval = gdk_pixbuf_animation_get_height(cast(GdkPixbufAnimation*)cPtr);
    return _retval;
  }

  /**
      Get an iterator for displaying an animation.
    
    The iterator provides the frames that should be displayed at a
    given time.
    
    start_time would normally come from [glib.global.getCurrentTime], and marks
    the beginning of animation playback. After creating an iterator, you
    should immediately display the pixbuf returned by
    [gdkpixbuf.pixbuf_animation_iter.PixbufAnimationIter.getPixbuf]. Then, you should install
    a timeout (with [glib.global.timeoutAdd]) or by some other mechanism ensure
    that you'll update the image after
    [gdkpixbuf.pixbuf_animation_iter.PixbufAnimationIter.getDelayTime] milliseconds. Each time
    the image is updated, you should reinstall the timeout with the new,
    possibly-changed delay time.
    
    As a shortcut, if start_time is `NULL`, the result of
    [glib.global.getCurrentTime] will be used automatically.
    
    To update the image (i.e. possibly change the result of
    [gdkpixbuf.pixbuf_animation_iter.PixbufAnimationIter.getPixbuf] to a new frame of the animation),
    call [gdkpixbuf.pixbuf_animation_iter.PixbufAnimationIter.advance].
    
    If you're using #GdkPixbufLoader, in addition to updating the image
    after the delay time, you should also update it whenever you
    receive the area_updated signal and
    [gdkpixbuf.pixbuf_animation_iter.PixbufAnimationIter.onCurrentlyLoadingFrame] returns
    `TRUE`. In this case, the frame currently being fed into the loader
    has received new data, so needs to be refreshed. The delay time for
    a frame may also be modified after an area_updated signal, for
    example if the delay time for a frame is encoded in the data after
    the frame itself. So your timeout should be reinstalled after any
    area_updated signal.
    
    A delay time of -1 is possible, indicating "infinite".
    Params:
      startTime =       time when the animation starts playing
    Returns:     an iterator to move over the animation
  */
  gdkpixbuf.pixbuf_animation_iter.PixbufAnimationIter getIter(glib.time_val.TimeVal startTime = null)
  {
    GdkPixbufAnimationIter* _cretval;
    _cretval = gdk_pixbuf_animation_get_iter(cast(GdkPixbufAnimation*)cPtr, startTime ? cast(const(GTimeVal)*)startTime.cPtr : null);
    auto _retval = ObjectG.getDObject!(gdkpixbuf.pixbuf_animation_iter.PixbufAnimationIter)(cast(GdkPixbufAnimationIter*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Retrieves a static image for the animation.
    
    If an animation is really just a plain image (has only one frame),
    this function returns that image.
    
    If the animation is an animation, this function returns a reasonable
    image to use as a static unanimated image, which might be the first
    frame, or something more sophisticated depending on the file format.
    
    If an animation hasn't loaded any frames yet, this function will
    return `NULL`.
    Returns:     unanimated image representing the animation
  */
  gdkpixbuf.pixbuf.Pixbuf getStaticImage()
  {
    PixbufC* _cretval;
    _cretval = gdk_pixbuf_animation_get_static_image(cast(GdkPixbufAnimation*)cPtr);
    auto _retval = ObjectG.getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(PixbufC*)_cretval, No.take);
    return _retval;
  }

  /**
      Queries the width of the bounding box of a pixbuf animation.
    Returns:     Width of the bounding box of the animation.
  */
  int getWidth()
  {
    int _retval;
    _retval = gdk_pixbuf_animation_get_width(cast(GdkPixbufAnimation*)cPtr);
    return _retval;
  }

  /**
      Checks whether the animation is a static image.
    
    If you load a file with [gdkpixbuf.pixbuf_animation.PixbufAnimation.newFromFile] and it
    turns out to be a plain, unanimated image, then this function will
    return `TRUE`. Use [gdkpixbuf.pixbuf_animation.PixbufAnimation.getStaticImage] to retrieve
    the image.
    Returns:     `TRUE` if the "animation" was really just an image
  */
  bool isStaticImage()
  {
    bool _retval;
    _retval = gdk_pixbuf_animation_is_static_image(cast(GdkPixbufAnimation*)cPtr);
    return _retval;
  }
}
