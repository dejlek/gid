module gtksource.snippet_chunk;

import gid.gid;
import gobject.initially_unowned;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.snippet_context;
import gtksource.types;

/**
    A chunk of text within the source snippet.
  
  The [gtksource.snippet_chunk.SnippetChunk] represents a single chunk of text that
  may or may not be an edit point within the snippet. Chunks that are
  an edit point (also called a tab stop) have the
  `property@SnippetChunk:focus-position` property set.
*/
class SnippetChunk : gobject.initially_unowned.InitiallyUnowned
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_snippet_chunk_get_type != &gidSymbolNotFound ? gtk_source_snippet_chunk_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Create a new [gtksource.snippet_chunk.SnippetChunk] that can be added to
    a `classSnippet`.
    Returns: 
  */
  this()
  {
    GtkSourceSnippetChunk* _cretval;
    _cretval = gtk_source_snippet_chunk_new();
    this(_cretval, No.take);
  }

  /**
      Copies the source snippet.
    Returns:     A #GtkSourceSnippetChunk
  */
  gtksource.snippet_chunk.SnippetChunk copy()
  {
    GtkSourceSnippetChunk* _cretval;
    _cretval = gtk_source_snippet_chunk_copy(cast(GtkSourceSnippetChunk*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.snippet_chunk.SnippetChunk)(cast(GtkSourceSnippetChunk*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Gets the context for the snippet insertion.
    Returns:     A #GtkSourceSnippetContext
  */
  gtksource.snippet_context.SnippetContext getContext()
  {
    GtkSourceSnippetContext* _cretval;
    _cretval = gtk_source_snippet_chunk_get_context(cast(GtkSourceSnippetChunk*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.snippet_context.SnippetContext)(cast(GtkSourceSnippetContext*)_cretval, No.take);
    return _retval;
  }

  /**
      Gets the `propertySnippetChunk:focus-position`.
    
    The focus-position is used to determine how many tabs it takes for the
    snippet to advanced to this chunk.
    
    A focus-position of zero will be the last focus position of the snippet
    and snippet editing ends when it has been reached.
    
    A focus-position of -1 means the chunk cannot be focused by the user.
    Returns:     the focus-position
  */
  int getFocusPosition()
  {
    int _retval;
    _retval = gtk_source_snippet_chunk_get_focus_position(cast(GtkSourceSnippetChunk*)cPtr);
    return _retval;
  }

  /**
      Gets the specification for the chunk.
    
    The specification is evaluated for variables when other chunks are edited
    within the snippet context. If the user has changed the text, the
    `propertySnippetChunk:text` and `propertySnippetChunk:text-set` properties
    are updated.
    Returns:     the specification, if any
  */
  string getSpec()
  {
    const(char)* _cretval;
    _cretval = gtk_source_snippet_chunk_get_spec(cast(GtkSourceSnippetChunk*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Gets the `propertySnippetChunk:text` property.
    
    The text property is updated when the user edits the text of the chunk.
    If it has not been edited, the `propertySnippetChunk:spec` property is
    returned.
    Returns:     the text of the chunk
  */
  string getText()
  {
    const(char)* _cretval;
    _cretval = gtk_source_snippet_chunk_get_text(cast(GtkSourceSnippetChunk*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Gets the `propertySnippetChunk:text-set` property.
    
    This is typically set when the user has edited a snippet chunk.
    Returns: 
  */
  bool getTextSet()
  {
    bool _retval;
    _retval = gtk_source_snippet_chunk_get_text_set(cast(GtkSourceSnippetChunk*)cPtr);
    return _retval;
  }

  /** */
  string getTooltipText()
  {
    const(char)* _cretval;
    _cretval = gtk_source_snippet_chunk_get_tooltip_text(cast(GtkSourceSnippetChunk*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /** */
  void setContext(gtksource.snippet_context.SnippetContext context)
  {
    gtk_source_snippet_chunk_set_context(cast(GtkSourceSnippetChunk*)cPtr, context ? cast(GtkSourceSnippetContext*)context.cPtr(No.dup) : null);
  }

  /**
      Sets the `propertySnippetChunk:focus-position` property.
    
    The focus-position is used to determine how many tabs it takes for the
    snippet to advanced to this chunk.
    
    A focus-position of zero will be the last focus position of the snippet
    and snippet editing ends when it has been reached.
    
    A focus-position of -1 means the chunk cannot be focused by the user.
    Params:
      focusPosition =       the focus-position
  */
  void setFocusPosition(int focusPosition)
  {
    gtk_source_snippet_chunk_set_focus_position(cast(GtkSourceSnippetChunk*)cPtr, focusPosition);
  }

  /**
      Sets the specification for the chunk.
    
    The specification is evaluated for variables when other chunks are edited
    within the snippet context. If the user has changed the text, the
    `propertySnippetChunk:text and` `propertySnippetChunk:text-set` properties
    are updated.
    Params:
      spec =       the new specification for the chunk
  */
  void setSpec(string spec)
  {
    const(char)* _spec = spec.toCString(No.alloc);
    gtk_source_snippet_chunk_set_spec(cast(GtkSourceSnippetChunk*)cPtr, _spec);
  }

  /**
      Sets the text for the snippet chunk.
    
    This is usually used by the snippet engine to update the text, but may
    be useful when creating custom snippets to avoid expansion of any
    specification.
    Params:
      text =       the text of the property
  */
  void setText(string text)
  {
    const(char)* _text = text.toCString(No.alloc);
    gtk_source_snippet_chunk_set_text(cast(GtkSourceSnippetChunk*)cPtr, _text);
  }

  /**
      Sets the `propertySnippetChunk:text-set` property.
    
    This is typically set when the user has edited a snippet chunk by the
    snippet engine.
    Params:
      textSet =       the property value
  */
  void setTextSet(bool textSet)
  {
    gtk_source_snippet_chunk_set_text_set(cast(GtkSourceSnippetChunk*)cPtr, textSet);
  }

  /** */
  void setTooltipText(string tooltipText)
  {
    const(char)* _tooltipText = tooltipText.toCString(No.alloc);
    gtk_source_snippet_chunk_set_tooltip_text(cast(GtkSourceSnippetChunk*)cPtr, _tooltipText);
  }
}
