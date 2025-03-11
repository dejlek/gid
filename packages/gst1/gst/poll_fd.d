module gst.poll_fd;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    A file descriptor object.
*/
class PollFD
{
  GstPollFD cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gst.PollFD");

    cInstance = *cast(GstPollFD*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property int fd()
  {
    return (cast(GstPollFD*)cPtr).fd;
  }

  @property void fd(int propval)
  {
    (cast(GstPollFD*)cPtr).fd = propval;
  }

  /**
      Initializes fd. Alternatively you can initialize it with
    #GST_POLL_FD_INIT.
  */
  void init_()
  {
    gst_poll_fd_init(cast(GstPollFD*)cPtr);
  }
}
