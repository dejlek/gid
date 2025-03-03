module gdkpixbuf.pixbuf_simple_anim;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf;
import gdkpixbuf.pixbuf_animation;
import gdkpixbuf.types;
import gid.gid;

/**
 * An opaque struct representing a simple animation.
 */
class PixbufSimpleAnim : gdkpixbuf.pixbuf_animation.PixbufAnimation
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_pixbuf_simple_anim_get_type != &gidSymbolNotFound ? gdk_pixbuf_simple_anim_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new, empty animation.
   * Params:
   *   width = the width of the animation
   *   height = the height of the animation
   *   rate = the speed of the animation, in frames per second
   * Returns: a newly allocated #GdkPixbufSimpleAnim
   */
  this(int width, int height, float rate)
  {
    GdkPixbufSimpleAnim* _cretval;
    _cretval = gdk_pixbuf_simple_anim_new(width, height, rate);
    this(_cretval, Yes.Take);
  }

  /**
   * Adds a new frame to animation. The pixbuf must
   * have the dimensions specified when the animation
   * was constructed.
   * Params:
   *   pixbuf = the pixbuf to add
   */
  void addFrame(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    gdk_pixbuf_simple_anim_add_frame(cast(GdkPixbufSimpleAnim*)cPtr, pixbuf ? cast(PixbufC*)pixbuf.cPtr(No.Dup) : null);
  }

  /**
   * Gets whether animation should loop indefinitely when it reaches the end.
   * Returns: %TRUE if the animation loops forever, %FALSE otherwise
   */
  bool getLoop()
  {
    bool _retval;
    _retval = gdk_pixbuf_simple_anim_get_loop(cast(GdkPixbufSimpleAnim*)cPtr);
    return _retval;
  }

  /**
   * Sets whether animation should loop indefinitely when it reaches the end.
   * Params:
   *   loop = whether to loop the animation
   */
  void setLoop(bool loop)
  {
    gdk_pixbuf_simple_anim_set_loop(cast(GdkPixbufSimpleAnim*)cPtr, loop);
  }
}
