module gstrtsp.types;

import gid.gid;
import gio.tls_certificate;
import gio.tls_connection;
import gio.types;
import gstrtsp.c.functions;
import gstrtsp.c.types;


// Enums

/** */
alias RTSPAuthMethod = GstRTSPAuthMethod;

/** */
alias RTSPEvent = GstRTSPEvent;

/** */
alias RTSPFamily = GstRTSPFamily;

/** */
alias RTSPHeaderField = GstRTSPHeaderField;

/** */
alias RTSPLowerTrans = GstRTSPLowerTrans;

/** */
alias RTSPMethod = GstRTSPMethod;

/** */
alias RTSPMsgType = GstRTSPMsgType;

/** */
alias RTSPProfile = GstRTSPProfile;

/** */
alias RTSPRangeUnit = GstRTSPRangeUnit;

/** */
alias RTSPResult = GstRTSPResult;

/** */
alias RTSPState = GstRTSPState;

/** */
alias RTSPStatusCode = GstRTSPStatusCode;

/** */
alias RTSPTimeType = GstRTSPTimeType;

/** */
alias RTSPTransMode = GstRTSPTransMode;

/** */
alias RTSPVersion = GstRTSPVersion;

// Structs

/** */
alias RTSPTime = GstRTSPTime;

/** */
alias RTSPTime2 = GstRTSPTime2;

/** */
alias RTSPWatchFuncs = GstRTSPWatchFuncs;

// Callbacks

/** */
alias RTSPConnectionAcceptCertificateFunc = bool delegate(gio.tls_connection.TlsConnection conn, gio.tls_certificate.TlsCertificate peerCert, gio.types.TlsCertificateFlags errors);

/**
    The default RTSP port to connect to.
*/
enum RTSP_DEFAULT_PORT = 554;
