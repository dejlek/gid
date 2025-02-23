module GtkSource.CompletionProposalIfaceProxy;

import GObject.ObjectG;
import GtkSource.CompletionProposal;
import GtkSource.CompletionProposalT;

/// Proxy object for GtkSource.CompletionProposal interface when a GObject has no applicable D binding
class CompletionProposalIfaceProxy : IfaceProxy, CompletionProposal
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(CompletionProposal);
  }

  mixin CompletionProposalT!();
}
