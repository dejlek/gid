/// Module for [XaTransactionId] class
module gda.xa_transaction_id;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
class XaTransactionId
{
  GdaXaTransactionId cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.xa_transaction_id.XaTransactionId");

    cInstance = *cast(GdaXaTransactionId*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `format` field.
      Returns: any number
  */
  @property uint format()
  {
    return (cast(GdaXaTransactionId*)this._cPtr).format;
  }

  /**
      Set `format` field.
      Params:
        propval = any number
  */
  @property void format(uint propval)
  {
    (cast(GdaXaTransactionId*)this._cPtr).format = propval;
  }

  /**
      Get `gtridLength` field.
      Returns: number between 1 and 64
  */
  @property ushort gtridLength()
  {
    return (cast(GdaXaTransactionId*)this._cPtr).gtridLength;
  }

  /**
      Set `gtridLength` field.
      Params:
        propval = number between 1 and 64
  */
  @property void gtridLength(ushort propval)
  {
    (cast(GdaXaTransactionId*)this._cPtr).gtridLength = propval;
  }

  /**
      Get `bqualLength` field.
      Returns: number between 1 and 64
  */
  @property ushort bqualLength()
  {
    return (cast(GdaXaTransactionId*)this._cPtr).bqualLength;
  }

  /**
      Set `bqualLength` field.
      Params:
        propval = number between 1 and 64
  */
  @property void bqualLength(ushort propval)
  {
    (cast(GdaXaTransactionId*)this._cPtr).bqualLength = propval;
  }

  /**
      Creates a string representation of xid, in the format &lt;gtrid&gt;,&lt;bqual&gt;,&lt;formatID&gt; the
      &lt;gtrid&gt; and &lt;bqual&gt; strings contain alphanumeric characters, and non alphanumeric characters
      are converted to "`ab`" where ab is the hexadecimal representation of the character.
      Returns: a new string representation of xid
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gda_xa_transaction_id_to_string(cast(const(GdaXaTransactionId)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
