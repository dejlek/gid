/// Module for [Settings] class
module webkit.settings;

import gid.gid;
import glib.error;
import glib.key_file;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.feature;
import webkit.feature_list;
import webkit.types;

/**
    Control the behaviour of a #WebKitWebView.
    
    #WebKitSettings can be applied to a #WebKitWebView to control text charset,
    color, font sizes, printing mode, script support, loading of images and various
    other things on a #WebKitWebView. After creation, a #WebKitSettings object
    contains default settings.
    
    ```c
    // Disable JavaScript
    WebKitSettings *settings = webkit_web_view_group_get_settings (my_view_group);
    webkit_settings_set_enable_javascript (settings, FALSE);
    ```
*/
class Settings : gobject.object.ObjectG
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_settings_get_type != &gidSymbolNotFound ? webkit_settings_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Settings self()
  {
    return this;
  }

  /**
      Creates a new #WebKitSettings instance with default values.
      
      It must be manually attached to a #WebKitWebView.
      See also [webkit.settings.Settings.newWithSettings].
      Returns: a new #WebKitSettings instance.
  */
  this()
  {
    WebKitSettings* _cretval;
    _cretval = webkit_settings_new();
    this(_cretval, Yes.Take);
  }

  /**
      Convert points to the equivalent value in pixels.
      
      Applications can use this function to convert font size values
      in points to font size values in pixels when setting the font size properties
      of #WebKitSettings.
  
      Params:
        points = the font size in points to convert to pixels
      Returns: the equivalent font size in pixels.
  */
  static uint fontSizeToPixels(uint points)
  {
    uint _retval;
    _retval = webkit_settings_font_size_to_pixels(points);
    return _retval;
  }

  /**
      Convert pixels to the equivalent value in points.
      
      Applications can use this function to convert font size values
      in pixels to font size values in points when getting the font size properties
      of #WebKitSettings.
  
      Params:
        pixels = the font size in pixels to convert to points
      Returns: the equivalent font size in points.
  */
  static uint fontSizeToPoints(uint pixels)
  {
    uint _retval;
    _retval = webkit_settings_font_size_to_points(pixels);
    return _retval;
  }

  /**
      Gets the list of all available WebKit features.
      
      Features can be toggled with [webkit.settings.Settings.setFeatureEnabled],
      and their current state determined with
      [webkit.settings.Settings.getFeatureEnabled].
      
      Note that most applications should use
      [webkit.settings.Settings.getDevelopmentFeatures] and
      [webkit.settings.Settings.getExperimentalFeatures] instead.
      Returns: List of all features.
  */
  static webkit.feature_list.FeatureList getAllFeatures()
  {
    WebKitFeatureList* _cretval;
    _cretval = webkit_settings_get_all_features();
    auto _retval = _cretval ? new webkit.feature_list.FeatureList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the list of available development WebKit features.
      
      The returned features are a subset of those returned by
      [webkit.settings.Settings.getAllFeatures], and includes those which
      web and WebKit developers might find useful, but in general should
      *not* be exposed to end users; see `enumFeatureStatus` for
      more details.
      Returns: List of development features.
  */
  static webkit.feature_list.FeatureList getDevelopmentFeatures()
  {
    WebKitFeatureList* _cretval;
    _cretval = webkit_settings_get_development_features();
    auto _retval = _cretval ? new webkit.feature_list.FeatureList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the list of available experimental WebKit features.
      
      The returned features are a subset of those returned by
      [webkit.settings.Settings.getAllFeatures], and includes those which
      certain applications may want to expose to end users; see
      `enumFeatureStatus` for more details.
      Returns: List of experimental features.
  */
  static webkit.feature_list.FeatureList getExperimentalFeatures()
  {
    WebKitFeatureList* _cretval;
    _cretval = webkit_settings_get_experimental_features();
    auto _retval = _cretval ? new webkit.feature_list.FeatureList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Reads the contents of the given group_name from the given key_file and apply the value of
      each key/value to the corresponding property on the settings.
      
      Value types have to match with the corresponding setting property type and the group keys have to
      match existing setting property names. If those conditions are not met, the function will return
      false.
      
      Supported value types are strings (unquoted), booleans (0, 1, true, false) and unsigned integers.
  
      Params:
        keyFile = a #GKeyFile
        groupName = Name of the group to read from key_file
      Returns: true if the settings were correctly applied or false on error.
      Throws: [ErrorG]
  */
  bool applyFromKeyFile(glib.key_file.KeyFile keyFile, string groupName)
  {
    bool _retval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    GError *_err;
    _retval = webkit_settings_apply_from_key_file(cast(WebKitSettings*)cPtr, keyFile ? cast(GKeyFile*)keyFile.cPtr(No.Dup) : null, _groupName, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Get the #WebKitSettings:allow-file-access-from-file-urls property.
      Returns: true If file access from file URLs is allowed or false otherwise.
  */
  bool getAllowFileAccessFromFileUrls()
  {
    bool _retval;
    _retval = webkit_settings_get_allow_file_access_from_file_urls(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:allow-modal-dialogs property.
      Returns: true if it's allowed to create and run modal dialogs or false otherwise.
  */
  bool getAllowModalDialogs()
  {
    bool _retval;
    _retval = webkit_settings_get_allow_modal_dialogs(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:allow-top-navigation-to-data-urls property.
      Returns: true If navigation to data URLs from the top frame is allowed or false\
        otherwise.
  */
  bool getAllowTopNavigationToDataUrls()
  {
    bool _retval;
    _retval = webkit_settings_get_allow_top_navigation_to_data_urls(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:allow-universal-access-from-file-urls property.
      Returns: true If universal access from file URLs is allowed or false otherwise.
  */
  bool getAllowUniversalAccessFromFileUrls()
  {
    bool _retval;
    _retval = webkit_settings_get_allow_universal_access_from_file_urls(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:auto-load-images property.
      Returns: true If auto loading of images is enabled or false otherwise.
  */
  bool getAutoLoadImages()
  {
    bool _retval;
    _retval = webkit_settings_get_auto_load_images(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:cursive-font-family property.
      Returns: The default font family used to display content marked with cursive font.
  */
  string getCursiveFontFamily()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_cursive_font_family(cast(WebKitSettings*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:default-charset property.
      Returns: Default charset.
  */
  string getDefaultCharset()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_default_charset(cast(WebKitSettings*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:default-font-family property.
      Returns: The default font family used to display content that does not specify a font.
  */
  string getDefaultFontFamily()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_default_font_family(cast(WebKitSettings*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:default-font-size property.
      Returns: The default font size, in pixels.
  */
  uint getDefaultFontSize()
  {
    uint _retval;
    _retval = webkit_settings_get_default_font_size(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:default-monospace-font-size property.
      Returns: Default monospace font size, in pixels.
  */
  uint getDefaultMonospaceFontSize()
  {
    uint _retval;
    _retval = webkit_settings_get_default_monospace_font_size(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:disable-web-security property.
      Returns: true If web security support is disabled or false otherwise.
  */
  bool getDisableWebSecurity()
  {
    bool _retval;
    _retval = webkit_settings_get_disable_web_security(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:draw-compositing-indicators property.
      Returns: true If compositing borders are drawn or false otherwise.
  */
  bool getDrawCompositingIndicators()
  {
    bool _retval;
    _retval = webkit_settings_get_draw_compositing_indicators(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-2d-canvas-acceleration property.
      Returns: true if 2D canvas acceleration is enabled or false otherwise.
  */
  bool getEnable2dCanvasAcceleration()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_2d_canvas_acceleration(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-back-forward-navigation-gestures property.
      Returns: true if horizontal swipe gesture will trigger back-forward navigaiton or false otherwise.
  */
  bool getEnableBackForwardNavigationGestures()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_back_forward_navigation_gestures(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-caret-browsing property.
      Returns: true If caret browsing is enabled or false otherwise.
  */
  bool getEnableCaretBrowsing()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_caret_browsing(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-developer-extras property.
      Returns: true If developer extras is enabled or false otherwise.
  */
  bool getEnableDeveloperExtras()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_developer_extras(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-dns-prefetching property.
      Returns: true If DNS prefetching is enabled or false otherwise.
  */
  bool getEnableDnsPrefetching()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_dns_prefetching(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-encrypted-media property.
      Returns: true if EncryptedMedia support is enabled or false otherwise.
  */
  bool getEnableEncryptedMedia()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_encrypted_media(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-fullscreen property.
      Returns: true If fullscreen support is enabled or false otherwise.
  */
  bool getEnableFullscreen()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_fullscreen(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-html5-database property.
      Returns: true if IndexedDB support is enabled or false otherwise.
  */
  bool getEnableHtml5Database()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_html5_database(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-html5-local-storage property.
      Returns: true If HTML5 local storage support is enabled or false otherwise.
  */
  bool getEnableHtml5LocalStorage()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_html5_local_storage(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-hyperlink-auditing property.
      Returns: true If hyper link auditing is enabled or false otherwise.
  */
  bool getEnableHyperlinkAuditing()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_hyperlink_auditing(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-javascript property.
      Returns: true If JavaScript is enabled or false otherwise.
  */
  bool getEnableJavascript()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_javascript(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-javascript-markup property.
      Returns: true if JavaScript markup is enabled or false otherwise.
  */
  bool getEnableJavascriptMarkup()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_javascript_markup(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-media property.
      Returns: true if media support is enabled or false otherwise.
  */
  bool getEnableMedia()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_media(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-media-capabilities property.
      Returns: true if MediaCapabilities support is enabled or false otherwise.
  */
  bool getEnableMediaCapabilities()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_media_capabilities(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-media-stream property.
      Returns: true If mediastream support is enabled or false otherwise.
  */
  bool getEnableMediaStream()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_media_stream(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-mediasource property.
      Returns: true If MediaSource support is enabled or false otherwise.
  */
  bool getEnableMediasource()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_mediasource(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-mock-capture-devices property.
      Returns: true If mock capture devices is enabled or false otherwise.
  */
  bool getEnableMockCaptureDevices()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_mock_capture_devices(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-offline-web-application-cache property.
      Returns: false.
  */
  bool getEnableOfflineWebApplicationCache()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_offline_web_application_cache(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-page-cache property.
      Returns: true if page cache enabled or false otherwise.
  */
  bool getEnablePageCache()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_page_cache(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-resizable-text-areas property.
      Returns: true If text areas can be resized or false otherwise.
  */
  bool getEnableResizableTextAreas()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_resizable_text_areas(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-site-specific-quirks property.
      Returns: true if site specific quirks are enabled or false otherwise.
  */
  bool getEnableSiteSpecificQuirks()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_site_specific_quirks(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-smooth-scrolling property.
      Returns: true if smooth scrolling is enabled or false otherwise.
  */
  bool getEnableSmoothScrolling()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_smooth_scrolling(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-spatial-navigation property.
      Returns: true If HTML5 spatial navigation support is enabled or false otherwise.
  */
  bool getEnableSpatialNavigation()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_spatial_navigation(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-tabs-to-links property.
      Returns: true If tabs to link is enabled or false otherwise.
  */
  bool getEnableTabsToLinks()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_tabs_to_links(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-webaudio property.
      Returns: true If webaudio support is enabled or false otherwise.
  */
  bool getEnableWebaudio()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_webaudio(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-webgl property.
      Returns: true If WebGL support is enabled or false otherwise.
  */
  bool getEnableWebgl()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_webgl(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the `propertySettings:enable-webrtc` property.
      Returns: true If WebRTC support is enabled or false otherwise.
  */
  bool getEnableWebrtc()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_webrtc(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:enable-write-console-messages-to-stdout property.
      Returns: true if writing console messages to stdout is enabled or false
        otherwise.
  */
  bool getEnableWriteConsoleMessagesToStdout()
  {
    bool _retval;
    _retval = webkit_settings_get_enable_write_console_messages_to_stdout(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:fantasy-font-family property.
      Returns: The default font family used to display content marked with fantasy font.
  */
  string getFantasyFontFamily()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_fantasy_font_family(cast(WebKitSettings*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether a feature is enabled.
  
      Params:
        feature = the feature to toggle.
      Returns: Whether the feature is enabled.
  */
  bool getFeatureEnabled(webkit.feature.Feature feature)
  {
    bool _retval;
    _retval = webkit_settings_get_feature_enabled(cast(WebKitSettings*)cPtr, feature ? cast(WebKitFeature*)feature.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Get the #WebKitSettings:hardware-acceleration-policy property.
      Returns: a #WebKitHardwareAccelerationPolicy
  */
  webkit.types.HardwareAccelerationPolicy getHardwareAccelerationPolicy()
  {
    WebKitHardwareAccelerationPolicy _cretval;
    _cretval = webkit_settings_get_hardware_acceleration_policy(cast(WebKitSettings*)cPtr);
    webkit.types.HardwareAccelerationPolicy _retval = cast(webkit.types.HardwareAccelerationPolicy)_cretval;
    return _retval;
  }

  /**
      Get the #WebKitSettings:javascript-can-access-clipboard property.
      Returns: true If javascript-can-access-clipboard is enabled or false otherwise.
  */
  bool getJavascriptCanAccessClipboard()
  {
    bool _retval;
    _retval = webkit_settings_get_javascript_can_access_clipboard(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:javascript-can-open-windows-automatically property.
      Returns: true If JavaScript can open window automatically or false otherwise.
  */
  bool getJavascriptCanOpenWindowsAutomatically()
  {
    bool _retval;
    _retval = webkit_settings_get_javascript_can_open_windows_automatically(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Setting no longer supported. This function returns false.
      Returns: false
  */
  bool getLoadIconsIgnoringImageLoadSetting()
  {
    bool _retval;
    _retval = webkit_settings_get_load_icons_ignoring_image_load_setting(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:media-content-types-requiring-hardware-support property.
      Returns: Media content types requiring hardware support, or null.
  */
  string getMediaContentTypesRequiringHardwareSupport()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_media_content_types_requiring_hardware_support(cast(WebKitSettings*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the #WebKitSettings:media-playback-allows-inline property.
      Returns: true If inline playback is allowed for media
           or false if only fullscreen playback is allowed.
  */
  bool getMediaPlaybackAllowsInline()
  {
    bool _retval;
    _retval = webkit_settings_get_media_playback_allows_inline(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Get the #WebKitSettings:media-playback-requires-user-gesture property.
      Returns: true If an user gesture is needed to play or load media
           or false if no user gesture is needed.
  */
  bool getMediaPlaybackRequiresUserGesture()
  {
    bool _retval;
    _retval = webkit_settings_get_media_playback_requires_user_gesture(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:minimum-font-size property.
      Returns: Minimum font size, in pixels.
  */
  uint getMinimumFontSize()
  {
    uint _retval;
    _retval = webkit_settings_get_minimum_font_size(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:monospace-font-family property.
      Returns: Default font family used to display content marked with monospace font.
  */
  string getMonospaceFontFamily()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_monospace_font_family(cast(WebKitSettings*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:pictograph-font-family property.
      Returns: The default font family used to display content marked with pictograph font.
  */
  string getPictographFontFamily()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_pictograph_font_family(cast(WebKitSettings*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the #WebKitSettings:print-backgrounds property.
      Returns: true If background images should be printed or false otherwise.
  */
  bool getPrintBackgrounds()
  {
    bool _retval;
    _retval = webkit_settings_get_print_backgrounds(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:sans-serif-font-family property.
      Returns: The default font family used to display content marked with sans-serif font.
  */
  string getSansSerifFontFamily()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_sans_serif_font_family(cast(WebKitSettings*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #WebKitSettings:serif-font-family property.
      Returns: The default font family used to display content marked with serif font.
  */
  string getSerifFontFamily()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_serif_font_family(cast(WebKitSettings*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the #WebKitSettings:user-agent property.
      Returns: The current value of the user-agent property.
  */
  string getUserAgent()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_user_agent(cast(WebKitSettings*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the `propertySettings:webrtc-udp-ports-range` property.
      Returns: The WebRTC UDP ports range, or null if un-set.
  */
  string getWebrtcUdpPortsRange()
  {
    const(char)* _cretval;
    _cretval = webkit_settings_get_webrtc_udp_ports_range(cast(WebKitSettings*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the #WebKitSettings:zoom-text-only property.
      Returns: true If zoom level of the view should only affect the text
           or false if all view contents should be scaled.
  */
  bool getZoomTextOnly()
  {
    bool _retval;
    _retval = webkit_settings_get_zoom_text_only(cast(WebKitSettings*)cPtr);
    return _retval;
  }

  /**
      Set the #WebKitSettings:allow-file-access-from-file-urls property.
  
      Params:
        allowed = Value to be set
  */
  void setAllowFileAccessFromFileUrls(bool allowed)
  {
    webkit_settings_set_allow_file_access_from_file_urls(cast(WebKitSettings*)cPtr, allowed);
  }

  /**
      Set the #WebKitSettings:allow-modal-dialogs property.
  
      Params:
        allowed = Value to be set
  */
  void setAllowModalDialogs(bool allowed)
  {
    webkit_settings_set_allow_modal_dialogs(cast(WebKitSettings*)cPtr, allowed);
  }

  /**
      Set the #WebKitSettings:allow-top-navigation-to-data-urls property.
  
      Params:
        allowed = Value to be set
  */
  void setAllowTopNavigationToDataUrls(bool allowed)
  {
    webkit_settings_set_allow_top_navigation_to_data_urls(cast(WebKitSettings*)cPtr, allowed);
  }

  /**
      Set the #WebKitSettings:allow-universal-access-from-file-urls property.
  
      Params:
        allowed = Value to be set
  */
  void setAllowUniversalAccessFromFileUrls(bool allowed)
  {
    webkit_settings_set_allow_universal_access_from_file_urls(cast(WebKitSettings*)cPtr, allowed);
  }

  /**
      Set the #WebKitSettings:auto-load-images property.
  
      Params:
        enabled = Value to be set
  */
  void setAutoLoadImages(bool enabled)
  {
    webkit_settings_set_auto_load_images(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:cursive-font-family property.
  
      Params:
        cursiveFontFamily = the new default cursive font family
  */
  void setCursiveFontFamily(string cursiveFontFamily)
  {
    const(char)* _cursiveFontFamily = cursiveFontFamily.toCString(No.Alloc);
    webkit_settings_set_cursive_font_family(cast(WebKitSettings*)cPtr, _cursiveFontFamily);
  }

  /**
      Set the #WebKitSettings:default-charset property.
  
      Params:
        defaultCharset = default charset to be set
  */
  void setDefaultCharset(string defaultCharset)
  {
    const(char)* _defaultCharset = defaultCharset.toCString(No.Alloc);
    webkit_settings_set_default_charset(cast(WebKitSettings*)cPtr, _defaultCharset);
  }

  /**
      Set the #WebKitSettings:default-font-family property.
  
      Params:
        defaultFontFamily = the new default font family
  */
  void setDefaultFontFamily(string defaultFontFamily)
  {
    const(char)* _defaultFontFamily = defaultFontFamily.toCString(No.Alloc);
    webkit_settings_set_default_font_family(cast(WebKitSettings*)cPtr, _defaultFontFamily);
  }

  /**
      Set the #WebKitSettings:default-font-size property.
  
      Params:
        fontSize = default font size to be set in pixels
  */
  void setDefaultFontSize(uint fontSize)
  {
    webkit_settings_set_default_font_size(cast(WebKitSettings*)cPtr, fontSize);
  }

  /**
      Set the #WebKitSettings:default-monospace-font-size property.
  
      Params:
        fontSize = default monospace font size to be set in pixels
  */
  void setDefaultMonospaceFontSize(uint fontSize)
  {
    webkit_settings_set_default_monospace_font_size(cast(WebKitSettings*)cPtr, fontSize);
  }

  /**
      Set the #WebKitSettings:disable-web-security property.
  
      Params:
        disabled = Value to be set
  */
  void setDisableWebSecurity(bool disabled)
  {
    webkit_settings_set_disable_web_security(cast(WebKitSettings*)cPtr, disabled);
  }

  /**
      Set the #WebKitSettings:draw-compositing-indicators property.
  
      Params:
        enabled = Value to be set
  */
  void setDrawCompositingIndicators(bool enabled)
  {
    webkit_settings_set_draw_compositing_indicators(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-2d-canvas-acceleration property.
  
      Params:
        enabled = Value to be set
  */
  void setEnable2dCanvasAcceleration(bool enabled)
  {
    webkit_settings_set_enable_2d_canvas_acceleration(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-back-forward-navigation-gestures property.
  
      Params:
        enabled = value to be set
  */
  void setEnableBackForwardNavigationGestures(bool enabled)
  {
    webkit_settings_set_enable_back_forward_navigation_gestures(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-caret-browsing property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableCaretBrowsing(bool enabled)
  {
    webkit_settings_set_enable_caret_browsing(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-developer-extras property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableDeveloperExtras(bool enabled)
  {
    webkit_settings_set_enable_developer_extras(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-dns-prefetching property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableDnsPrefetching(bool enabled)
  {
    webkit_settings_set_enable_dns_prefetching(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-encrypted-media property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableEncryptedMedia(bool enabled)
  {
    webkit_settings_set_enable_encrypted_media(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-fullscreen property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableFullscreen(bool enabled)
  {
    webkit_settings_set_enable_fullscreen(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-html5-database property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableHtml5Database(bool enabled)
  {
    webkit_settings_set_enable_html5_database(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-html5-local-storage property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableHtml5LocalStorage(bool enabled)
  {
    webkit_settings_set_enable_html5_local_storage(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-hyperlink-auditing property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableHyperlinkAuditing(bool enabled)
  {
    webkit_settings_set_enable_hyperlink_auditing(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-javascript property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableJavascript(bool enabled)
  {
    webkit_settings_set_enable_javascript(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-javascript-markup property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableJavascriptMarkup(bool enabled)
  {
    webkit_settings_set_enable_javascript_markup(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-media property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableMedia(bool enabled)
  {
    webkit_settings_set_enable_media(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-media-capabilities property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableMediaCapabilities(bool enabled)
  {
    webkit_settings_set_enable_media_capabilities(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-media-stream property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableMediaStream(bool enabled)
  {
    webkit_settings_set_enable_media_stream(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-mediasource property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableMediasource(bool enabled)
  {
    webkit_settings_set_enable_mediasource(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-mock-capture-devices property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableMockCaptureDevices(bool enabled)
  {
    webkit_settings_set_enable_mock_capture_devices(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Setting no longer supported. This function does nothing.
  
      Params:
        enabled = Value to be set
  */
  void setEnableOfflineWebApplicationCache(bool enabled)
  {
    webkit_settings_set_enable_offline_web_application_cache(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-page-cache property.
  
      Params:
        enabled = Value to be set
  */
  void setEnablePageCache(bool enabled)
  {
    webkit_settings_set_enable_page_cache(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-resizable-text-areas property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableResizableTextAreas(bool enabled)
  {
    webkit_settings_set_enable_resizable_text_areas(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-site-specific-quirks property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableSiteSpecificQuirks(bool enabled)
  {
    webkit_settings_set_enable_site_specific_quirks(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-smooth-scrolling property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableSmoothScrolling(bool enabled)
  {
    webkit_settings_set_enable_smooth_scrolling(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-spatial-navigation property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableSpatialNavigation(bool enabled)
  {
    webkit_settings_set_enable_spatial_navigation(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-tabs-to-links property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableTabsToLinks(bool enabled)
  {
    webkit_settings_set_enable_tabs_to_links(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-webaudio property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableWebaudio(bool enabled)
  {
    webkit_settings_set_enable_webaudio(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-webgl property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableWebgl(bool enabled)
  {
    webkit_settings_set_enable_webgl(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the `propertySettings:enable-webrtc` property.
      
      Setting this property to true implies the media-stream web-setting will also be enabled.
  
      Params:
        enabled = Value to be set
  */
  void setEnableWebrtc(bool enabled)
  {
    webkit_settings_set_enable_webrtc(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:enable-write-console-messages-to-stdout property.
  
      Params:
        enabled = Value to be set
  */
  void setEnableWriteConsoleMessagesToStdout(bool enabled)
  {
    webkit_settings_set_enable_write_console_messages_to_stdout(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:fantasy-font-family property.
  
      Params:
        fantasyFontFamily = the new default fantasy font family
  */
  void setFantasyFontFamily(string fantasyFontFamily)
  {
    const(char)* _fantasyFontFamily = fantasyFontFamily.toCString(No.Alloc);
    webkit_settings_set_fantasy_font_family(cast(WebKitSettings*)cPtr, _fantasyFontFamily);
  }

  /**
      Enables or disables a feature.
      
      The current status of the feature can be determined with
      `idwebkit_settings_get_feature_enabled`. To reset a feature to its
      initial status, pass the value returned by
      `idwebkit_feature_get_default_value` as the enabled parameter.
  
      Params:
        feature = the feature to toggle.
        enabled = whether the feature will be enabled.
  */
  void setFeatureEnabled(webkit.feature.Feature feature, bool enabled)
  {
    webkit_settings_set_feature_enabled(cast(WebKitSettings*)cPtr, feature ? cast(WebKitFeature*)feature.cPtr(No.Dup) : null, enabled);
  }

  /**
      Set the #WebKitSettings:hardware-acceleration-policy property.
  
      Params:
        policy = a #WebKitHardwareAccelerationPolicy
  */
  void setHardwareAccelerationPolicy(webkit.types.HardwareAccelerationPolicy policy)
  {
    webkit_settings_set_hardware_acceleration_policy(cast(WebKitSettings*)cPtr, policy);
  }

  /**
      Set the #WebKitSettings:javascript-can-access-clipboard property.
  
      Params:
        enabled = Value to be set
  */
  void setJavascriptCanAccessClipboard(bool enabled)
  {
    webkit_settings_set_javascript_can_access_clipboard(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:javascript-can-open-windows-automatically property.
  
      Params:
        enabled = Value to be set
  */
  void setJavascriptCanOpenWindowsAutomatically(bool enabled)
  {
    webkit_settings_set_javascript_can_open_windows_automatically(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Setting no longer supported. This function does nothing.
  
      Params:
        enabled = Value to be set
  */
  void setLoadIconsIgnoringImageLoadSetting(bool enabled)
  {
    webkit_settings_set_load_icons_ignoring_image_load_setting(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:media-content-types-requiring-hardware-support property.
  
      Params:
        contentTypes = list of media content types requiring hardware support split by semicolons (:) or null to use the default value.
  */
  void setMediaContentTypesRequiringHardwareSupport(string contentTypes = null)
  {
    const(char)* _contentTypes = contentTypes.toCString(No.Alloc);
    webkit_settings_set_media_content_types_requiring_hardware_support(cast(WebKitSettings*)cPtr, _contentTypes);
  }

  /**
      Set the #WebKitSettings:media-playback-allows-inline property.
  
      Params:
        enabled = Value to be set
  */
  void setMediaPlaybackAllowsInline(bool enabled)
  {
    webkit_settings_set_media_playback_allows_inline(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:media-playback-requires-user-gesture property.
  
      Params:
        enabled = Value to be set
  */
  void setMediaPlaybackRequiresUserGesture(bool enabled)
  {
    webkit_settings_set_media_playback_requires_user_gesture(cast(WebKitSettings*)cPtr, enabled);
  }

  /**
      Set the #WebKitSettings:minimum-font-size property.
  
      Params:
        fontSize = minimum font size to be set in pixels
  */
  void setMinimumFontSize(uint fontSize)
  {
    webkit_settings_set_minimum_font_size(cast(WebKitSettings*)cPtr, fontSize);
  }

  /**
      Set the #WebKitSettings:monospace-font-family property.
  
      Params:
        monospaceFontFamily = the new default monospace font family
  */
  void setMonospaceFontFamily(string monospaceFontFamily)
  {
    const(char)* _monospaceFontFamily = monospaceFontFamily.toCString(No.Alloc);
    webkit_settings_set_monospace_font_family(cast(WebKitSettings*)cPtr, _monospaceFontFamily);
  }

  /**
      Set the #WebKitSettings:pictograph-font-family property.
  
      Params:
        pictographFontFamily = the new default pictograph font family
  */
  void setPictographFontFamily(string pictographFontFamily)
  {
    const(char)* _pictographFontFamily = pictographFontFamily.toCString(No.Alloc);
    webkit_settings_set_pictograph_font_family(cast(WebKitSettings*)cPtr, _pictographFontFamily);
  }

  /**
      Set the #WebKitSettings:print-backgrounds property.
  
      Params:
        printBackgrounds = Value to be set
  */
  void setPrintBackgrounds(bool printBackgrounds)
  {
    webkit_settings_set_print_backgrounds(cast(WebKitSettings*)cPtr, printBackgrounds);
  }

  /**
      Set the #WebKitSettings:sans-serif-font-family property.
  
      Params:
        sansSerifFontFamily = the new default sans-serif font family
  */
  void setSansSerifFontFamily(string sansSerifFontFamily)
  {
    const(char)* _sansSerifFontFamily = sansSerifFontFamily.toCString(No.Alloc);
    webkit_settings_set_sans_serif_font_family(cast(WebKitSettings*)cPtr, _sansSerifFontFamily);
  }

  /**
      Set the #WebKitSettings:serif-font-family property.
  
      Params:
        serifFontFamily = the new default serif font family
  */
  void setSerifFontFamily(string serifFontFamily)
  {
    const(char)* _serifFontFamily = serifFontFamily.toCString(No.Alloc);
    webkit_settings_set_serif_font_family(cast(WebKitSettings*)cPtr, _serifFontFamily);
  }

  /**
      Set the #WebKitSettings:user-agent property.
  
      Params:
        userAgent = The new custom user agent string or null to use the default user agent
  */
  void setUserAgent(string userAgent = null)
  {
    const(char)* _userAgent = userAgent.toCString(No.Alloc);
    webkit_settings_set_user_agent(cast(WebKitSettings*)cPtr, _userAgent);
  }

  /**
      Set the #WebKitSettings:user-agent property by appending the application details.
      
      Set the #WebKitSettings:user-agent property by appending the application details to the default user
      agent. If no application name or version is given, the default user agent used will be used. If only
      the version is given, the default engine version is used with the given application name.
  
      Params:
        applicationName = The application name used for the user agent or null to use the default user agent.
        applicationVersion = The application version for the user agent or null to user the default version.
  */
  void setUserAgentWithApplicationDetails(string applicationName = null, string applicationVersion = null)
  {
    const(char)* _applicationName = applicationName.toCString(No.Alloc);
    const(char)* _applicationVersion = applicationVersion.toCString(No.Alloc);
    webkit_settings_set_user_agent_with_application_details(cast(WebKitSettings*)cPtr, _applicationName, _applicationVersion);
  }

  /**
      Set the `propertySettings:webrtc-udp-ports-range` property.
  
      Params:
        udpPortRange = Value to be set
  */
  void setWebrtcUdpPortsRange(string udpPortRange)
  {
    const(char)* _udpPortRange = udpPortRange.toCString(No.Alloc);
    webkit_settings_set_webrtc_udp_ports_range(cast(WebKitSettings*)cPtr, _udpPortRange);
  }

  /**
      Set the #WebKitSettings:zoom-text-only property.
  
      Params:
        zoomTextOnly = Value to be set
  */
  void setZoomTextOnly(bool zoomTextOnly)
  {
    webkit_settings_set_zoom_text_only(cast(WebKitSettings*)cPtr, zoomTextOnly);
  }
}
