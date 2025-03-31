/// D types for gstcheck1 library
module gstcheck.types;

import gid.gid;
import glib.types;
import gst.buffer;
import gst.event;
import gstcheck.c.functions;
import gstcheck.c.types;
import gstcheck.harness;


// Structs

/** */
alias CheckLogFilter = GstCheckLogFilter*;

/** */
alias HarnessThread = GstHarnessThread*;

/** */
alias StreamConsistency = GstStreamConsistency*;

// Callbacks

/**
    A function that is called for messages matching the filter added by
    gst_check_add_log_filter.

    Params:
      logDomain = the log domain of the message
      logLevel = the log level of the message
      message = the message that has occurred
    Returns: true if message should be discarded by GstCheck.
*/
alias CheckLogFilterFunc = bool delegate(string logDomain, glib.types.LogLevelFlags logLevel, string message);

/** */
alias HarnessPrepareBufferFunc = gst.buffer.Buffer delegate(gstcheck.harness.Harness h);

/** */
alias HarnessPrepareEventFunc = gst.event.Event delegate(gstcheck.harness.Harness h);
