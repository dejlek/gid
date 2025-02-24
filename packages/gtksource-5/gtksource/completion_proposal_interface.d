module gtksource.completion_proposal_interface;

import gid.gid;
import gobject.type_interface;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

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
