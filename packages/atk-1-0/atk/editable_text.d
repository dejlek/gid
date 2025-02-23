module atk.editable_text;

public import atk.editable_text_iface_proxy;
import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;

/**
 * The ATK interface implemented by components containing user-editable text content.
 * #AtkEditableText should be implemented by UI components which
 * contain text which the user can edit, via the #AtkObject
 * corresponding to that component $(LPAREN)see #AtkObject$(RPAREN).
 * #AtkEditableText is a subclass of #AtkText, and as such, an object
 * which implements #AtkEditableText is by definition an #AtkText
 * implementor as well.
 * See iface@AtkText
 */
interface EditableText
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_editable_text_get_type != &gidSymbolNotFound ? atk_editable_text_get_type() : cast(GType)0;
  }

  /**
   * Copy text from start_pos up to, but not including end_pos
   * to the clipboard.
   * Params:
   *   startPos = start position
   *   endPos = end position
   */
  void copyText(int startPos, int endPos);

  /**
   * Copy text from start_pos up to, but not including end_pos
   * to the clipboard and then delete from the widget.
   * Params:
   *   startPos = start position
   *   endPos = end position
   */
  void cutText(int startPos, int endPos);

  /**
   * Delete text start_pos up to, but not including end_pos.
   * Params:
   *   startPos = start position
   *   endPos = end position
   */
  void deleteText(int startPos, int endPos);

  /**
   * Insert text at a given position.
   * Params:
   *   string_ = the text to insert
   *   length = the length of text to insert, in bytes
   *   position = The caller initializes this to
   *     the position at which to insert the text. After the call it
   *     points at the position after the newly inserted text.
   */
  void insertText(string string_, int length, ref int position);

  /**
   * Paste text from clipboard to specified position.
   * Params:
   *   position = position to paste
   */
  void pasteText(int position);

  /**
   * Set text contents of text.
   * Params:
   *   string_ = string to set for text contents of text
   */
  void setTextContents(string string_);
}
