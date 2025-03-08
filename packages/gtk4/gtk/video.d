module gtk.video;

import gid.gid;
import gio.file;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.media_stream;
import gtk.types;
import gtk.widget;

/**
    [gtk.video.Video] is a widget to show a [gtk.media_stream.MediaStream] with media controls.
  
  ![An example GtkVideo](video.png)
  
  The controls are available separately as [gtk.media_controls.MediaControls].
  If you just want to display a video without controls, you can treat it
  like any other paintable and for example put it into a [gtk.picture.Picture].
  
  [gtk.video.Video] aims to cover use cases such as previews, embedded animations,
  etc. It supports autoplay, looping, and simple media controls. It does
  not have support for video overlays, multichannel audio, device
  selection, or input. If you are writing a full-fledged video player,
  you may want to use the [gdk.paintable.Paintable] API and a media framework
  such as Gstreamer directly.
*/
class Video : gtk.widget.Widget
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_video_get_type != &gidSymbolNotFound ? gtk_video_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new empty [gtk.video.Video].
    Returns:     a new [gtk.video.Video]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_video_new();
    this(_cretval, No.take);
  }

  /**
      Creates a [gtk.video.Video] to play back the given file.
    Params:
      file =       a [gio.file.File]
    Returns:     a new [gtk.video.Video]
  */
  static gtk.video.Video newForFile(gio.file.File file = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_video_new_for_file(file ? cast(GFile*)(cast(ObjectG)file).cPtr(No.dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.video.Video)(cast(GtkWidget*)_cretval, No.take);
    return _retval;
  }

  /**
      Creates a [gtk.video.Video] to play back the given filename.
    
    This is a utility function that calls [gtk.video.Video.newForFile],
    See that function for details.
    Params:
      filename =       filename to play back
    Returns:     a new [gtk.video.Video]
  */
  static gtk.video.Video newForFilename(string filename = null)
  {
    GtkWidget* _cretval;
    const(char)* _filename = filename.toCString(No.alloc);
    _cretval = gtk_video_new_for_filename(_filename);
    auto _retval = ObjectG.getDObject!(gtk.video.Video)(cast(GtkWidget*)_cretval, No.take);
    return _retval;
  }

  /**
      Creates a [gtk.video.Video] to play back the given stream.
    Params:
      stream =       a [gtk.media_stream.MediaStream]
    Returns:     a new [gtk.video.Video]
  */
  static gtk.video.Video newForMediaStream(gtk.media_stream.MediaStream stream = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_video_new_for_media_stream(stream ? cast(GtkMediaStream*)stream.cPtr(No.dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.video.Video)(cast(GtkWidget*)_cretval, No.take);
    return _retval;
  }

  /**
      Creates a [gtk.video.Video] to play back the resource at the
    given resource_path.
    
    This is a utility function that calls [gtk.video.Video.newForFile].
    Params:
      resourcePath =       resource path to play back
    Returns:     a new [gtk.video.Video]
  */
  static gtk.video.Video newForResource(string resourcePath = null)
  {
    GtkWidget* _cretval;
    const(char)* _resourcePath = resourcePath.toCString(No.alloc);
    _cretval = gtk_video_new_for_resource(_resourcePath);
    auto _retval = ObjectG.getDObject!(gtk.video.Video)(cast(GtkWidget*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns true if videos have been set to loop.
    Returns:     true if streams should autoplay
  */
  bool getAutoplay()
  {
    bool _retval;
    _retval = gtk_video_get_autoplay(cast(GtkVideo*)cPtr);
    return _retval;
  }

  /**
      Gets the file played by self or null if not playing back
    a file.
    Returns:     The file played by self
  */
  gio.file.File getFile()
  {
    GFile* _cretval;
    _cretval = gtk_video_get_file(cast(GtkVideo*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.file.File)(cast(GFile*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns whether graphics offload is enabled.
    
    See [gtk.graphics_offload.GraphicsOffload] for more information on graphics offload.
    Returns:     the graphics offload status
  */
  gtk.types.GraphicsOffloadEnabled getGraphicsOffload()
  {
    GtkGraphicsOffloadEnabled _cretval;
    _cretval = gtk_video_get_graphics_offload(cast(GtkVideo*)cPtr);
    gtk.types.GraphicsOffloadEnabled _retval = cast(gtk.types.GraphicsOffloadEnabled)_cretval;
    return _retval;
  }

  /**
      Returns true if videos have been set to loop.
    Returns:     true if streams should loop
  */
  bool getLoop()
  {
    bool _retval;
    _retval = gtk_video_get_loop(cast(GtkVideo*)cPtr);
    return _retval;
  }

  /**
      Gets the media stream managed by self or null if none.
    Returns:     The media stream managed by self
  */
  gtk.media_stream.MediaStream getMediaStream()
  {
    GtkMediaStream* _cretval;
    _cretval = gtk_video_get_media_stream(cast(GtkVideo*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.media_stream.MediaStream)(cast(GtkMediaStream*)_cretval, No.take);
    return _retval;
  }

  /**
      Sets whether self automatically starts playback when it
    becomes visible or when a new file gets loaded.
    Params:
      autoplay =       whether media streams should autoplay
  */
  void setAutoplay(bool autoplay)
  {
    gtk_video_set_autoplay(cast(GtkVideo*)cPtr, autoplay);
  }

  /**
      Makes self play the given file.
    Params:
      file =       the file to play
  */
  void setFile(gio.file.File file = null)
  {
    gtk_video_set_file(cast(GtkVideo*)cPtr, file ? cast(GFile*)(cast(ObjectG)file).cPtr(No.dup) : null);
  }

  /**
      Makes self play the given filename.
    
    This is a utility function that calls [gtk.video.Video.setFile],
    Params:
      filename =       the filename to play
  */
  void setFilename(string filename = null)
  {
    const(char)* _filename = filename.toCString(No.alloc);
    gtk_video_set_filename(cast(GtkVideo*)cPtr, _filename);
  }

  /**
      Sets whether to enable graphics offload.
    
    See [gtk.graphics_offload.GraphicsOffload] for more information on graphics offload.
    Params:
      enabled =       the new graphics offload status
  */
  void setGraphicsOffload(gtk.types.GraphicsOffloadEnabled enabled)
  {
    gtk_video_set_graphics_offload(cast(GtkVideo*)cPtr, enabled);
  }

  /**
      Sets whether new files loaded by self should be set to loop.
    Params:
      loop =       whether media streams should loop
  */
  void setLoop(bool loop)
  {
    gtk_video_set_loop(cast(GtkVideo*)cPtr, loop);
  }

  /**
      Sets the media stream to be played back.
    
    self will take full control of managing the media stream. If you
    want to manage a media stream yourself, consider using a
    [gtk.picture.Picture] for display.
    
    If you want to display a file, consider using [gtk.video.Video.setFile]
    instead.
    Params:
      stream =       The media stream to play or null to unset
  */
  void setMediaStream(gtk.media_stream.MediaStream stream = null)
  {
    gtk_video_set_media_stream(cast(GtkVideo*)cPtr, stream ? cast(GtkMediaStream*)stream.cPtr(No.dup) : null);
  }

  /**
      Makes self play the resource at the given resource_path.
    
    This is a utility function that calls [gtk.video.Video.setFile].
    Params:
      resourcePath =       the resource to set
  */
  void setResource(string resourcePath = null)
  {
    const(char)* _resourcePath = resourcePath.toCString(No.alloc);
    gtk_video_set_resource(cast(GtkVideo*)cPtr, _resourcePath);
  }
}
