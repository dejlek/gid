module adw.carousel_indicator_dots;

import adw.c.functions;
import adw.c.types;
import adw.carousel;
import adw.types;
import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.widget;

/**
    A dots indicator for `class@Carousel`.
  
  <picture>
    <source srcset="carousel-indicator-dots-dark.png" media="(prefers-color-scheme: dark)">
    <img src="carousel-indicator-dots.png" alt="carousel-indicator-dots">
  </picture>
  
  The [adw.carousel_indicator_dots.CarouselIndicatorDots] widget shows a set of dots for each page of a
  given `class@Carousel`. The dot representing the carousel's active page is
  larger and more opaque than the others, the transition to the active and
  inactive state is gradual to match the carousel's position.
  
  See also `class@CarouselIndicatorLines`.
  
  ## CSS nodes
  
  [adw.carousel_indicator_dots.CarouselIndicatorDots] has a single CSS node with name
  `carouselindicatordots`.
*/
class CarouselIndicatorDots : gtk.widget.Widget, gtk.orientable.Orientable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_carousel_indicator_dots_get_type != &gidSymbolNotFound ? adw_carousel_indicator_dots_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override CarouselIndicatorDots self()
  {
    return this;
  }

  mixin OrientableT!();

  /**
      Creates a new [adw.carousel_indicator_dots.CarouselIndicatorDots].
    Returns:     the newly created [adw.carousel_indicator_dots.CarouselIndicatorDots]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_carousel_indicator_dots_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the displayed carousel.
    Returns:     the displayed carousel
  */
  adw.carousel.Carousel getCarousel()
  {
    AdwCarousel* _cretval;
    _cretval = adw_carousel_indicator_dots_get_carousel(cast(AdwCarouselIndicatorDots*)cPtr);
    auto _retval = ObjectG.getDObject!(adw.carousel.Carousel)(cast(AdwCarousel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the displayed carousel.
    Params:
      carousel =       a carousel
  */
  void setCarousel(adw.carousel.Carousel carousel = null)
  {
    adw_carousel_indicator_dots_set_carousel(cast(AdwCarouselIndicatorDots*)cPtr, carousel ? cast(AdwCarousel*)carousel.cPtr(No.Dup) : null);
  }
}
