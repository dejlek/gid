module gtksource.completion_proposal_iface_proxy;

import gobject.object;
import gtksource.completion_proposal;
import gtksource.completion_proposal_mixin;

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
