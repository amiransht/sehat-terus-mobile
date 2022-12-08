class DataBlog {
  DataBlog({
    required this.title,
    required this.content,
  });

  String title = "";
  String content = "";

  factory DataBlog.fromJson(Map<String, dynamic> json) => DataBlog(
        title : json["fields"]["title"],
        content : json["fields"]["content"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}