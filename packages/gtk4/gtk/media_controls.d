module gtk.media_controls;

import gid.gid;
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
 * `GtkMediaControls` is a widget to show controls for a video.
 * ![An example GtkMediaControls](media-controls.png)
 * Usually, `GtkMediaControls` is used as part of [gtk.video.Video].
 */
class MediaControls : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_media_controls_get_type != &gidSymbolNotFound ? gtk_media_controls_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkMediaControls` managing the stream passed to it.
   * Params:
   *   stream = a `GtkMediaStream` to manage
   * Returns: a new `GtkMediaControls`
   */
  this(gtk.media_stream.MediaStream stream = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_media_controls_new(stream ? cast(GtkMediaStream*)stream.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
   * Gets the media stream managed by controls or %NULL if none.
   * Returns: The media stream managed by controls
   */
  gtk.media_stream.MediaStream getMediaStream()
  {
    GtkMediaStream* _cretval;
    _cretval = gtk_media_controls_get_media_stream(cast(GtkMediaControls*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.media_stream.MediaStream)(cast(GtkMediaStream*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets the stream that is controlled by controls.
   * Params:
   *   stream = a `GtkMediaStream`
   */
  void setMediaStream(gtk.media_stream.MediaStream stream = null)
  {
    gtk_media_controls_set_media_stream(cast(GtkMediaControls*)cPtr, stream ? cast(GtkMediaStream*)stream.cPtr(No.Dup) : null);
  }
}
