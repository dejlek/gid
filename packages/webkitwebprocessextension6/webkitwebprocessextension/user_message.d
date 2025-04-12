/// Module for [UserMessage] class
module webkitwebprocessextension.user_message;

import gid.gid;
import gio.unix_fdlist;
import glib.error;
import glib.types;
import glib.variant;
import gobject.initially_unowned;
import gobject.object;
import webkitwebprocessextension.c.functions;
import webkitwebprocessextension.c.types;
import webkitwebprocessextension.types;

/**
    Message that can be sent between the UI process and web process extensions.
    
    A WebKitUserMessage is a message that can be used for the communication between the UI process
    and web process extensions. A WebKitUserMessage always has a name, and it can also include parameters and
    UNIX file descriptors. Messages can be sent from a #WebKitWebContext to all web process extensions,
    from a web process extension to its corresponding #WebKitWebContext, and from a #WebKitWebView to its
    corresponding #WebKitWebPage (and vice versa). One to one messages can be replied to directly with
    [webkitwebprocessextension.user_message.UserMessage.sendReply].
*/
class UserMessage : gobject.initially_unowned.InitiallyUnowned
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_user_message_get_type != &gidSymbolNotFound ? webkit_user_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UserMessage self()
  {
    return this;
  }

  /**
      Create a new #WebKitUserMessage with name.
  
      Params:
        name = the message name
        parameters = the message parameters as a #GVariant, or null
      Returns: the newly created #WebKitUserMessage object.
  */
  this(string name, glib.variant.VariantG parameters = null)
  {
    WebKitUserMessage* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = webkit_user_message_new(_name, parameters ? cast(VariantC*)parameters.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Create a new #WebKitUserMessage including also a list of UNIX file descriptors to be sent.
  
      Params:
        name = the message name
        parameters = the message parameters as a #GVariant
        fdList = the message file descriptors
      Returns: the newly created #WebKitUserMessage object.
  */
  static webkitwebprocessextension.user_message.UserMessage newWithFdList(string name, glib.variant.VariantG parameters = null, gio.unix_fdlist.UnixFDList fdList = null)
  {
    WebKitUserMessage* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = webkit_user_message_new_with_fd_list(_name, parameters ? cast(VariantC*)parameters.cPtr(No.Dup) : null, fdList ? cast(GUnixFDList*)fdList.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(webkitwebprocessextension.user_message.UserMessage)(cast(WebKitUserMessage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the quark for the domain of user message errors.
      Returns: user message error domain.
  */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = webkit_user_message_error_quark();
    return _retval;
  }

  /**
      Get the message list of file descritpor.
      Returns: the message list of file descriptors
  */
  gio.unix_fdlist.UnixFDList getFdList()
  {
    GUnixFDList* _cretval;
    _cretval = webkit_user_message_get_fd_list(cast(WebKitUserMessage*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.unix_fdlist.UnixFDList)(cast(GUnixFDList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the message name.
      Returns: the message name
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = webkit_user_message_get_name(cast(WebKitUserMessage*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the message parameters.
      Returns: the message parameters
  */
  glib.variant.VariantG getParameters()
  {
    VariantC* _cretval;
    _cretval = webkit_user_message_get_parameters(cast(WebKitUserMessage*)cPtr);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Send a reply to an user message.
      
      If reply is floating, it's consumed.
      You can only send a reply to a #WebKitUserMessage that has been
      received.
  
      Params:
        reply = a #WebKitUserMessage to send as reply
  */
  void sendReply(webkitwebprocessextension.user_message.UserMessage reply)
  {
    webkit_user_message_send_reply(cast(WebKitUserMessage*)cPtr, reply ? cast(WebKitUserMessage*)reply.cPtr(No.Dup) : null);
  }
}

class UserMessageException : ErrorG
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(webkitwebprocessextension.user_message.UserMessage.errorQuark, cast(int)code, msg);
  }

  alias Code = GUserMessageError;
}
