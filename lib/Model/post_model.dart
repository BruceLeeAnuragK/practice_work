class Posts {
  final int id;
  final String title;
  final String body;
  final int userId;
  final List tags;
  final int reactions;

  Posts(
      {required this.id,
      required this.title,
      required this.body,
      required this.userId,
      required this.tags,
      required this.reactions});

  factory Posts.fromMap({required Map data}) {
    return Posts(
        id: data["id"],
        title: data["title"],
        body: data["body"],
        userId: data["userId"],
        tags: data["tags"],
        reactions: data["reactions"]);
  }
}
