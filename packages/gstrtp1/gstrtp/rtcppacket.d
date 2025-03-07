module gstrtp.rtcppacket;

import gid.gid;
import gstrtp.c.functions;
import gstrtp.c.types;
import gstrtp.rtcpbuffer;
import gstrtp.types;

/**
    Data structure that points to a packet at @offset in @buffer.
  The size of the structure is made public to allow stack allocations.
*/
class RTCPPacket
{
  GstRTCPPacket cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstRtp.RTCPPacket");

    cInstance = *cast(GstRTCPPacket*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gstrtp.rtcpbuffer.RTCPBuffer rtcp()
  {
    return new gstrtp.rtcpbuffer.RTCPBuffer(cast(GstRTCPBuffer*)(cast(GstRTCPPacket*)cPtr).rtcp);
  }

  @property uint offset()
  {
    return (cast(GstRTCPPacket*)cPtr).offset;
  }

  @property void offset(uint propval)
  {
    (cast(GstRTCPPacket*)cPtr).offset = propval;
  }

  /**
      Add profile-specific extension data to packet. If packet already
    contains profile-specific extension data will be appended to the existing
    extension.
    Params:
      data =       profile-specific data
    Returns:     true if the profile specific extension data was added.
  */
  bool addProfileSpecificExt(ubyte[] data)
  {
    bool _retval;
    uint _len;
    if (data)
      _len = cast(uint)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _retval = gst_rtcp_packet_add_profile_specific_ext(cast(GstRTCPPacket*)cPtr, _data, _len);
    return _retval;
  }

  /**
      Add a new report block to packet with the given values.
    Params:
      ssrc =       data source being reported
      fractionlost =       fraction lost since last SR/RR
      packetslost =       the cumululative number of packets lost
      exthighestseq =       the extended last sequence number received
      jitter =       the interarrival jitter
      lsr =       the last SR packet from this source
      dlsr =       the delay since last SR packet
    Returns:     true if the packet was created. This function can return false if
      the max MTU is exceeded or the number of report blocks is greater than
      #GST_RTCP_MAX_RB_COUNT.
  */
  bool addRb(uint ssrc, ubyte fractionlost, int packetslost, uint exthighestseq, uint jitter, uint lsr, uint dlsr)
  {
    bool _retval;
    _retval = gst_rtcp_packet_add_rb(cast(GstRTCPPacket*)cPtr, ssrc, fractionlost, packetslost, exthighestseq, jitter, lsr, dlsr);
    return _retval;
  }

  /**
      Get the application-dependent data attached to a RTPFB or PSFB packet.
    Returns:     A pointer to the data
  */
  ubyte* appGetData()
  {
    auto _retval = gst_rtcp_packet_app_get_data(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Get the length of the application-dependent data attached to an APP
    packet.
    Returns:     The length of data in 32-bit words.
  */
  ushort appGetDataLength()
  {
    ushort _retval;
    _retval = gst_rtcp_packet_app_get_data_length(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Get the name field of the APP packet.
    Returns:     The 4-byte name field, not zero-terminated.
  */
  string appGetName()
  {
    const(char)* _cretval;
    _cretval = gst_rtcp_packet_app_get_name(cast(GstRTCPPacket*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the SSRC/CSRC field of the APP packet.
    Returns:     The SSRC/CSRC.
  */
  uint appGetSsrc()
  {
    uint _retval;
    _retval = gst_rtcp_packet_app_get_ssrc(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Get the subtype field of the APP packet.
    Returns:     The subtype.
  */
  ubyte appGetSubtype()
  {
    ubyte _retval;
    _retval = gst_rtcp_packet_app_get_subtype(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Set the length of the application-dependent data attached to an APP
    packet.
    Params:
      wordlen =       Length of the data in 32-bit words
    Returns:     true if there was enough space in the packet to add this much
      data.
  */
  bool appSetDataLength(ushort wordlen)
  {
    bool _retval;
    _retval = gst_rtcp_packet_app_set_data_length(cast(GstRTCPPacket*)cPtr, wordlen);
    return _retval;
  }

  /**
      Set the name field of the APP packet.
    Params:
      name =       4-byte ASCII name
  */
  void appSetName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_rtcp_packet_app_set_name(cast(GstRTCPPacket*)cPtr, _name);
  }

  /**
      Set the SSRC/CSRC field of the APP packet.
    Params:
      ssrc =       SSRC/CSRC of the packet
  */
  void appSetSsrc(uint ssrc)
  {
    gst_rtcp_packet_app_set_ssrc(cast(GstRTCPPacket*)cPtr, ssrc);
  }

  /**
      Set the subtype field of the APP packet.
    Params:
      subtype =       subtype of the packet
  */
  void appSetSubtype(ubyte subtype)
  {
    gst_rtcp_packet_app_set_subtype(cast(GstRTCPPacket*)cPtr, subtype);
  }

  /**
      Add ssrc to the BYE packet.
    Params:
      ssrc =       an SSRC to add
    Returns:     true if the ssrc was added. This function can return false if
      the max MTU is exceeded or the number of sources blocks is greater than
      #GST_RTCP_MAX_BYE_SSRC_COUNT.
  */
  bool byeAddSsrc(uint ssrc)
  {
    bool _retval;
    _retval = gst_rtcp_packet_bye_add_ssrc(cast(GstRTCPPacket*)cPtr, ssrc);
    return _retval;
  }

  /**
      Adds len SSRCs in ssrc to BYE packet.
    Params:
      ssrc =       an array of SSRCs to add
    Returns:     true if the all the SSRCs were added. This function can return false if
      the max MTU is exceeded or the number of sources blocks is greater than
      #GST_RTCP_MAX_BYE_SSRC_COUNT.
  */
  bool byeAddSsrcs(uint[] ssrc)
  {
    bool _retval;
    uint _len;
    if (ssrc)
      _len = cast(uint)ssrc.length;

    auto _ssrc = cast(uint*)ssrc.ptr;
    _retval = gst_rtcp_packet_bye_add_ssrcs(cast(GstRTCPPacket*)cPtr, _ssrc, _len);
    return _retval;
  }

  /**
      Get the nth SSRC of the BYE packet.
    Params:
      nth =       the nth SSRC to get
    Returns:     The nth SSRC of packet.
  */
  uint byeGetNthSsrc(uint nth)
  {
    uint _retval;
    _retval = gst_rtcp_packet_bye_get_nth_ssrc(cast(GstRTCPPacket*)cPtr, nth);
    return _retval;
  }

  /**
      Get the reason in packet.
    Returns:     The reason for the BYE packet or NULL if the packet did not contain
      a reason string. The string must be freed with [glib.global.gfree] after usage.
  */
  string byeGetReason()
  {
    char* _cretval;
    _cretval = gst_rtcp_packet_bye_get_reason(cast(GstRTCPPacket*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the length of the reason string.
    Returns:     The length of the reason string or 0 when there is no reason string
      present.
  */
  ubyte byeGetReasonLen()
  {
    ubyte _retval;
    _retval = gst_rtcp_packet_bye_get_reason_len(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Get the number of SSRC fields in packet.
    Returns:     The number of SSRC fields in packet.
  */
  uint byeGetSsrcCount()
  {
    uint _retval;
    _retval = gst_rtcp_packet_bye_get_ssrc_count(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Set the reason string to reason in packet.
    Params:
      reason =       a reason string
    Returns:     TRUE if the string could be set.
  */
  bool byeSetReason(string reason)
  {
    bool _retval;
    const(char)* _reason = reason.toCString(No.Alloc);
    _retval = gst_rtcp_packet_bye_set_reason(cast(GstRTCPPacket*)cPtr, _reason);
    return _retval;
  }

  /**
      The profile-specific extension data is copied into a new allocated
    memory area data. This must be freed with [glib.global.gfree] after usage.
    Params:
      data =       result profile-specific data
    Returns:     true if there was valid data.
  */
  bool copyProfileSpecificExt(out ubyte[] data)
  {
    bool _retval;
    uint _len;
    ubyte* _data;
    _retval = gst_rtcp_packet_copy_profile_specific_ext(cast(GstRTCPPacket*)cPtr, &_data, &_len);
    data.length = _len;
    data[0 .. $] = (cast(ubyte*)_data)[0 .. _len];
    safeFree(cast(void*)_data);
    return _retval;
  }

  /**
      Get the Feedback Control Information attached to a RTPFB or PSFB packet.
    Returns:     a pointer to the FCI
  */
  ubyte* fbGetFci()
  {
    auto _retval = gst_rtcp_packet_fb_get_fci(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Get the length of the Feedback Control Information attached to a
    RTPFB or PSFB packet.
    Returns:     The length of the FCI in 32-bit words.
  */
  ushort fbGetFciLength()
  {
    ushort _retval;
    _retval = gst_rtcp_packet_fb_get_fci_length(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Get the media SSRC field of the RTPFB or PSFB packet.
    Returns:     the media SSRC.
  */
  uint fbGetMediaSsrc()
  {
    uint _retval;
    _retval = gst_rtcp_packet_fb_get_media_ssrc(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Get the sender SSRC field of the RTPFB or PSFB packet.
    Returns:     the sender SSRC.
  */
  uint fbGetSenderSsrc()
  {
    uint _retval;
    _retval = gst_rtcp_packet_fb_get_sender_ssrc(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Get the feedback message type of the FB packet.
    Returns:     The feedback message type.
  */
  gstrtp.types.RTCPFBType fbGetType()
  {
    GstRTCPFBType _cretval;
    _cretval = gst_rtcp_packet_fb_get_type(cast(GstRTCPPacket*)cPtr);
    gstrtp.types.RTCPFBType _retval = cast(gstrtp.types.RTCPFBType)_cretval;
    return _retval;
  }

  /**
      Set the length of the Feedback Control Information attached to a
    RTPFB or PSFB packet.
    Params:
      wordlen =       Length of the FCI in 32-bit words
    Returns:     true if there was enough space in the packet to add this much FCI
  */
  bool fbSetFciLength(ushort wordlen)
  {
    bool _retval;
    _retval = gst_rtcp_packet_fb_set_fci_length(cast(GstRTCPPacket*)cPtr, wordlen);
    return _retval;
  }

  /**
      Set the media SSRC field of the RTPFB or PSFB packet.
    Params:
      ssrc =       a media SSRC
  */
  void fbSetMediaSsrc(uint ssrc)
  {
    gst_rtcp_packet_fb_set_media_ssrc(cast(GstRTCPPacket*)cPtr, ssrc);
  }

  /**
      Set the sender SSRC field of the RTPFB or PSFB packet.
    Params:
      ssrc =       a sender SSRC
  */
  void fbSetSenderSsrc(uint ssrc)
  {
    gst_rtcp_packet_fb_set_sender_ssrc(cast(GstRTCPPacket*)cPtr, ssrc);
  }

  /**
      Set the feedback message type of the FB packet.
    Params:
      type =       the #GstRTCPFBType to set
  */
  void fbSetType(gstrtp.types.RTCPFBType type)
  {
    gst_rtcp_packet_fb_set_type(cast(GstRTCPPacket*)cPtr, type);
  }

  /**
      Get the count field in packet.
    Returns:     The count field in packet or -1 if packet does not point to a
      valid packet.
  */
  ubyte getCount()
  {
    ubyte _retval;
    _retval = gst_rtcp_packet_get_count(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Get the length field of packet. This is the length of the packet in
    32-bit words minus one.
    Returns:     The length field of packet.
  */
  ushort getLength()
  {
    ushort _retval;
    _retval = gst_rtcp_packet_get_length(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Get the packet padding of the packet pointed to by packet.
    Returns:     If the packet has the padding bit set.
  */
  bool getPadding()
  {
    bool _retval;
    _retval = gst_rtcp_packet_get_padding(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /** */
  bool getProfileSpecificExt(out ubyte[] data)
  {
    bool _retval;
    uint _len;
    ubyte* _data;
    _retval = gst_rtcp_packet_get_profile_specific_ext(cast(GstRTCPPacket*)cPtr, &_data, &_len);
    data.length = _len;
    data[0 .. $] = (cast(ubyte*)_data)[0 .. _len];
    return _retval;
  }

  /** */
  ushort getProfileSpecificExtLength()
  {
    ushort _retval;
    _retval = gst_rtcp_packet_get_profile_specific_ext_length(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Parse the values of the nth report block in packet and store the result in
    the values.
    Params:
      nth =       the nth report block in packet
      ssrc =       result for data source being reported
      fractionlost =       result for fraction lost since last SR/RR
      packetslost =       result for the cumululative number of packets lost
      exthighestseq =       result for the extended last sequence number received
      jitter =       result for the interarrival jitter
      lsr =       result for the last SR packet from this source
      dlsr =       result for the delay since last SR packet
  */
  void getRb(uint nth, out uint ssrc, out ubyte fractionlost, out int packetslost, out uint exthighestseq, out uint jitter, out uint lsr, out uint dlsr)
  {
    gst_rtcp_packet_get_rb(cast(GstRTCPPacket*)cPtr, nth, cast(uint*)&ssrc, cast(ubyte*)&fractionlost, cast(int*)&packetslost, cast(uint*)&exthighestseq, cast(uint*)&jitter, cast(uint*)&lsr, cast(uint*)&dlsr);
  }

  /**
      Get the number of report blocks in packet.
    Returns:     The number of report blocks in packet.
  */
  uint getRbCount()
  {
    uint _retval;
    _retval = gst_rtcp_packet_get_rb_count(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Get the packet type of the packet pointed to by packet.
    Returns:     The packet type or GST_RTCP_TYPE_INVALID when packet is not
      pointing to a valid packet.
  */
  gstrtp.types.RTCPType getType()
  {
    GstRTCPType _cretval;
    _cretval = gst_rtcp_packet_get_type(cast(GstRTCPPacket*)cPtr);
    gstrtp.types.RTCPType _retval = cast(gstrtp.types.RTCPType)_cretval;
    return _retval;
  }

  /**
      Move the packet pointer packet to the next packet in the payload.
    Use [gstrtp.rtcpbuffer.RTCPBuffer.getFirstPacket] to initialize packet.
    Returns:     TRUE if packet is pointing to a valid packet after calling this
      function.
  */
  bool moveToNext()
  {
    bool _retval;
    _retval = gst_rtcp_packet_move_to_next(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Removes the packet pointed to by packet and moves pointer to the next one
    Returns:     TRUE if packet is pointing to a valid packet after calling this
      function.
  */
  bool remove()
  {
    bool _retval;
    _retval = gst_rtcp_packet_remove(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Get the ssrc field of the RR packet.
    Returns:     the ssrc.
  */
  uint rrGetSsrc()
  {
    uint _retval;
    _retval = gst_rtcp_packet_rr_get_ssrc(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Set the ssrc field of the RR packet.
    Params:
      ssrc =       the SSRC to set
  */
  void rrSetSsrc(uint ssrc)
  {
    gst_rtcp_packet_rr_set_ssrc(cast(GstRTCPPacket*)cPtr, ssrc);
  }

  /**
      Add a new SDES entry to the current item in packet.
    Params:
      type =       the #GstRTCPSDESType of the SDES entry
      data =       the data
    Returns:     true if the item could be added, false if the MTU has been
      reached.
  */
  bool sdesAddEntry(gstrtp.types.RTCPSDESType type, ubyte[] data)
  {
    bool _retval;
    ubyte _len;
    if (data)
      _len = cast(ubyte)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _retval = gst_rtcp_packet_sdes_add_entry(cast(GstRTCPPacket*)cPtr, type, _len, _data);
    return _retval;
  }

  /**
      Add a new SDES item for ssrc to packet.
    Params:
      ssrc =       the SSRC of the new item to add
    Returns:     true if the item could be added, false if the maximum amount of
      items has been exceeded for the SDES packet or the MTU has been reached.
  */
  bool sdesAddItem(uint ssrc)
  {
    bool _retval;
    _retval = gst_rtcp_packet_sdes_add_item(cast(GstRTCPPacket*)cPtr, ssrc);
    return _retval;
  }

  /**
      Move to the first SDES entry in the current item.
    Returns:     true if there was a first entry.
  */
  bool sdesFirstEntry()
  {
    bool _retval;
    _retval = gst_rtcp_packet_sdes_first_entry(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Move to the first SDES item in packet.
    Returns:     TRUE if there was a first item.
  */
  bool sdesFirstItem()
  {
    bool _retval;
    _retval = gst_rtcp_packet_sdes_first_item(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Get the number of items in the SDES packet packet.
    Returns:     The number of items in packet.
  */
  uint sdesGetItemCount()
  {
    uint _retval;
    _retval = gst_rtcp_packet_sdes_get_item_count(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Get the SSRC of the current SDES item.
    Returns:     the SSRC of the current item.
  */
  uint sdesGetSsrc()
  {
    uint _retval;
    _retval = gst_rtcp_packet_sdes_get_ssrc(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Move to the next SDES entry in the current item.
    Returns:     true if there was a next entry.
  */
  bool sdesNextEntry()
  {
    bool _retval;
    _retval = gst_rtcp_packet_sdes_next_entry(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Move to the next SDES item in packet.
    Returns:     TRUE if there was a next item.
  */
  bool sdesNextItem()
  {
    bool _retval;
    _retval = gst_rtcp_packet_sdes_next_item(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Set the nth new report block in packet with the given values.
    
    Note: Not implemented.
    Params:
      nth =       the nth report block to set
      ssrc =       data source being reported
      fractionlost =       fraction lost since last SR/RR
      packetslost =       the cumululative number of packets lost
      exthighestseq =       the extended last sequence number received
      jitter =       the interarrival jitter
      lsr =       the last SR packet from this source
      dlsr =       the delay since last SR packet
  */
  void setRb(uint nth, uint ssrc, ubyte fractionlost, int packetslost, uint exthighestseq, uint jitter, uint lsr, uint dlsr)
  {
    gst_rtcp_packet_set_rb(cast(GstRTCPPacket*)cPtr, nth, ssrc, fractionlost, packetslost, exthighestseq, jitter, lsr, dlsr);
  }

  /**
      Parse the SR sender info and store the values.
    Params:
      ssrc =       result SSRC
      ntptime =       result NTP time
      rtptime =       result RTP time
      packetCount =       result packet count
      octetCount =       result octet count
  */
  void srGetSenderInfo(out uint ssrc, out ulong ntptime, out uint rtptime, out uint packetCount, out uint octetCount)
  {
    gst_rtcp_packet_sr_get_sender_info(cast(GstRTCPPacket*)cPtr, cast(uint*)&ssrc, cast(ulong*)&ntptime, cast(uint*)&rtptime, cast(uint*)&packetCount, cast(uint*)&octetCount);
  }

  /**
      Set the given values in the SR packet packet.
    Params:
      ssrc =       the SSRC
      ntptime =       the NTP time
      rtptime =       the RTP time
      packetCount =       the packet count
      octetCount =       the octet count
  */
  void srSetSenderInfo(uint ssrc, ulong ntptime, uint rtptime, uint packetCount, uint octetCount)
  {
    gst_rtcp_packet_sr_set_sender_info(cast(GstRTCPPacket*)cPtr, ssrc, ntptime, rtptime, packetCount, octetCount);
  }

  /**
      Move to the first extended report block in XR packet.
    Returns:     TRUE if there was a first extended report block.
  */
  bool xrFirstRb()
  {
    bool _retval;
    _retval = gst_rtcp_packet_xr_first_rb(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /** */
  ushort xrGetBlockLength()
  {
    ushort _retval;
    _retval = gst_rtcp_packet_xr_get_block_length(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Get the extended report block type of the XR packet.
    Returns:     The extended report block type.
  */
  gstrtp.types.RTCPXRType xrGetBlockType()
  {
    GstRTCPXRType _cretval;
    _cretval = gst_rtcp_packet_xr_get_block_type(cast(GstRTCPPacket*)cPtr);
    gstrtp.types.RTCPXRType _retval = cast(gstrtp.types.RTCPXRType)_cretval;
    return _retval;
  }

  /**
      Get the ssrc field of the XR packet.
    Returns:     the ssrc.
  */
  uint xrGetSsrc()
  {
    uint _retval;
    _retval = gst_rtcp_packet_xr_get_ssrc(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }

  /**
      Move to the next extended report block in XR packet.
    Returns:     TRUE if there was a next extended report block.
  */
  bool xrNextRb()
  {
    bool _retval;
    _retval = gst_rtcp_packet_xr_next_rb(cast(GstRTCPPacket*)cPtr);
    return _retval;
  }
}
