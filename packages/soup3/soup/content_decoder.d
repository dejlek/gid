module soup.content_decoder;

import gid.gid;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.session_feature;
import soup.session_feature_mixin;
import soup.types;

/**
 * Handles decoding of HTTP messages.
 * #SoupContentDecoder handles adding the "Accept-Encoding" header on
 * outgoing messages, and processing the "Content-Encoding" header on
 * incoming ones. Currently it supports the "gzip", "deflate", and "br"
 * content codings.
 * A #SoupContentDecoder will automatically be
 * added to the session by default. $(LPAREN)You can use
 * [soup.session.Session.removeFeatureByType] if you don't
 * want this.$(RPAREN)
 * If #SoupContentDecoder successfully decodes the Content-Encoding,
 * the message body will contain the decoded data; however, the message headers
 * will be unchanged $(LPAREN)and so "Content-Encoding" will still be present,
 * "Content-Length" will describe the original encoded length, etc$(RPAREN).
 * If "Content-Encoding" contains any encoding types that
 * #SoupContentDecoder doesn't recognize, then none of the encodings
 * will be decoded.
 * $(LPAREN)Note that currently there is no way to $(LPAREN)automatically$(RPAREN) use
 * Content-Encoding when sending a request body, or to pick specific
 * encoding types to support.$(RPAREN)
 */
class ContentDecoder : gobject.object.ObjectG, soup.session_feature.SessionFeature
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_content_decoder_get_type != &gidSymbolNotFound ? soup_content_decoder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin SessionFeatureT!();
}
