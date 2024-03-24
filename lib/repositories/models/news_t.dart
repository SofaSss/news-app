class New {
  int id;
  String title;
  String imageUrl;
  String url;
  String summary;
 

  New({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.url,
    required this.summary,
    
  });

  factory New.fromJson(Map<String, dynamic> parsedJson) {
    return New(
        id: parsedJson['id'] as int,
        title: parsedJson['title'].toString(),
        imageUrl: parsedJson['image_url'].toString(),
       url: parsedJson['url'].toString(),
        summary: parsedJson['summary'].toString()
    );
  }

  @override
  String toString() {
    return '${id}, ${title}, ${imageUrl}, ${url}, ${summary}';
  }
}
