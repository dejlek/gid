/// Module for [PollFD] class
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gst.poll_fd.PollFD");

    cInstance = *cast(GstPollFD*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `fd` field.
      Returns: a file descriptor
  */
  @property int fd()
  {
    return (cast(GstPollFD*)this._cPtr).fd;
  }

  /**
      Set `fd` field.
      Params:
        propval = a file descriptor
  */
  @property void fd(int propval)
  {
    (cast(GstPollFD*)this._cPtr).fd = propval;
  }

  /**
      Initializes fd. Alternatively you can initialize it with
      #GST_POLL_FD_INIT.
  */
  void init_()
  {
    gst_poll_fd_init(cast(GstPollFD*)this._cPtr);
  }
}
