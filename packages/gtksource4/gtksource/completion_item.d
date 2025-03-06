module gtksource.completion_item;

import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.completion_proposal;
import gtksource.completion_proposal_mixin;
import gtksource.types;

/** */
class CompletionItem : gobject.object.ObjectG, gtksource.completion_proposal.CompletionProposal
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_completion_item_get_type != &gidSymbolNotFound ? gtk_source_completion_item_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin CompletionProposalT!();

  /**
      Creates a new #GtkSourceCompletionItem. The desired properties need to be set
    afterwards.
    Returns:     a new #GtkSourceCompletionItem.
  */
  this()
  {
    GtkSourceCompletionItem* _cretval;
    _cretval = gtk_source_completion_item_new();
    this(_cretval, Yes.Take);
  }

  /** */
  void setGicon(gio.icon.Icon gicon = null)
  {
    gtk_source_completion_item_set_gicon(cast(GtkSourceCompletionItem*)cPtr, gicon ? cast(GIcon*)(cast(ObjectG)gicon).cPtr(No.Dup) : null);
  }

  /** */
  void setIcon(gdkpixbuf.pixbuf.Pixbuf icon = null)
  {
    gtk_source_completion_item_set_icon(cast(GtkSourceCompletionItem*)cPtr, icon ? cast(PixbufC*)icon.cPtr(No.Dup) : null);
  }

  /** */
  void setIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_source_completion_item_set_icon_name(cast(GtkSourceCompletionItem*)cPtr, _iconName);
  }

  /** */
  void setInfo(string info = null)
  {
    const(char)* _info = info.toCString(No.Alloc);
    gtk_source_completion_item_set_info(cast(GtkSourceCompletionItem*)cPtr, _info);
  }

  /** */
  void setLabel(string label = null)
  {
    const(char)* _label = label.toCString(No.Alloc);
    gtk_source_completion_item_set_label(cast(GtkSourceCompletionItem*)cPtr, _label);
  }

  /** */
  void setMarkup(string markup = null)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_source_completion_item_set_markup(cast(GtkSourceCompletionItem*)cPtr, _markup);
  }

  /** */
  void setText(string text = null)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_source_completion_item_set_text(cast(GtkSourceCompletionItem*)cPtr, _text);
  }
}
