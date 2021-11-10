class Video {
  String id;
  String title;
  String description;
  String image;
  String channelTitle;
  String youtubeId;

  Video(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.channelTitle,
      required this.youtubeId});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id']['videoId'],
      title: json['snippet']['title'],
      description: json['snippet']['description'],
      image: json['snippet']['thumbnails']['high']['url'],
      channelTitle: json['snippet']['channelTitle'],
      youtubeId: json['id']['videoId'],
    );
  }
}
