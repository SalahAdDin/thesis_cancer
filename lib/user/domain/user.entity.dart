class User {
  final String id;
  final String email;
  final String displayName;
  final String bio;
  final String photoID;
  final Map gallery;
  final Map posts;
  final Map comments;
  final Map likes;

  const User(
      {this.id,
      this.email,
      this.displayName,
      this.bio,
      this.photoID,
      this.gallery,
      this.posts,
      this.comments,
      this.likes});
}
