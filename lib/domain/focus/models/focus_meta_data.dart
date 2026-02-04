class FocusMetaData {
  final String parentFocusId;
  final String focusId;
  final bool ttsMute;

  FocusMetaData({required this.parentFocusId, required this.focusId, this.ttsMute = false});
}
