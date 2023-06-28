class VideoModel {
  String source;
  String htmlVideoId;
  String htmlVideoPosterId;
  String sourceExternalUrl;
  String sourceYoutube;
  String sourceVimeo;
  String sourceEmbedded;
  bool isHtml;
  bool isVimeo;
  bool isYoutube;
  bool isEmbedded;

  VideoModel(
      {required this.source,
        required this.htmlVideoId,
        required this.htmlVideoPosterId,
        required this.sourceExternalUrl,
        required this.sourceYoutube,
        required this.sourceVimeo,
        required  this.sourceEmbedded,
      required this.isEmbedded,
      required this.isHtml,
      required this.isVimeo,
      required this.isYoutube});


  factory VideoModel.fromJSON(Map map) {
    return VideoModel(
      source: map['source'].toString(),
      htmlVideoId: map['html5_video_id'].toString() ,
      htmlVideoPosterId:map['html5_video_poster_id'] != null ? map['html5_video_poster_id'].toString():"",
      sourceExternalUrl:map['source_external_url'] != null ? map['source_external_url'].toString() :"",
      sourceYoutube: map['source_youtube'] != null ? map['source_youtube'].toString() :"",
      sourceVimeo: map['source_vimeo'] != null ? map['source_vimeo'].toString() :"",
      sourceEmbedded: map['source_embedded'] != null ? map['source_embedded'].toString() :"",
      isEmbedded: map['source'] == 'embedded' ? true : false,
      isYoutube: map['source'] == 'youtube' ? true : false,
      isHtml: map['source'] == 'html5' ? true : false,
      isVimeo: map['source'] == 'vimeo' ? true : false,

    );
  }
}
