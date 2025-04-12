/// D types for webkitwebprocessextension6 library
module webkitwebprocessextension.types;

import gid.gid;
import glib.variant;
import webkitwebprocessextension.c.functions;
import webkitwebprocessextension.c.types;
import webkitwebprocessextension.web_process_extension;


// Enums

/** */
alias ConsoleMessageLevel = WebKitConsoleMessageLevel;

/** */
alias ConsoleMessageSource = WebKitConsoleMessageSource;

/** */
alias ContextMenuAction = WebKitContextMenuAction;

/** */
alias HitTestResultContext = WebKitHitTestResultContext;

/** */
alias UserMessageError = WebKitUserMessageError;

// Callbacks

/**
    Type definition for a function that will be called to initialize
    the web extension when the web process starts.

    Params:
      extension = a #WebKitWebProcessExtension
*/
alias WebProcessExtensionInitializeFunction = void delegate(webkitwebprocessextension.web_process_extension.WebProcessExtension extension);

/**
    Type definition for a function that will be called to initialize
    the web extensions when the web process starts, and which receives
    as additional argument the user data set with
    [webkit.web_context.WebContext.setWebProcessExtensionsInitializationUserData].

    Params:
      extension = a #WebKitWebProcessExtension
      userData = a #GVariant
*/
alias WebProcessExtensionInitializeWithUserDataFunction = void delegate(webkitwebprocessextension.web_process_extension.WebProcessExtension extension, glib.variant.VariantG userData);
