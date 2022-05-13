import 'package:clean_arcitectur_with_testing/domain/model/post.dart';
import 'package:equatable/equatable.dart';

class PostResponse extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const PostResponse({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );

  Post toDomainModel() => Post(title: title, body: body);

  @override
  List<Object?> get props => [userId, id, title, body];
}
