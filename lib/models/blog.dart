class Blog {
  Blog({
    required this.title,
    required this.content,
  });

  String title = "";
  String content = "";

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        title : json["fields"]["title"],
        content : json["fields"]["content"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}