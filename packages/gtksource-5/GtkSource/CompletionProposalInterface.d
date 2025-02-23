module GtkSource.CompletionProposalInterface;

import GObject.TypeInterface;
import Gid.gid;
import GtkSource.Types;
import GtkSource.c.functions;
import GtkSource.c.types;

class CompletionProposalInterface
{
  GtkSourceCompletionProposalInterface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GtkSource.CompletionProposalInterface");

    cInstance = *cast(GtkSourceCompletionProposalInterface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TypeInterface parentIface()
  {
    return new TypeInterface(cast(GTypeInterface*)&(cast(GtkSourceCompletionProposalInterface*)cPtr).parentIface);
  }

  alias GetTypedTextFuncType = extern(C) char* function(GtkSourceCompletionProposal* proposal);

  @property GetTypedTextFuncType getTypedText()
  {
    return (cast(GtkSourceCompletionProposalInterface*)cPtr).getTypedText;
  }
}
