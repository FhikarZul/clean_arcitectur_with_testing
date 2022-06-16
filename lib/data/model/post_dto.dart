import 'package:clean_arcitectur_with_testing/domain/model/domain_post.dart';
import 'package:equatable/equatable.dart';

class PostDto extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const PostDto({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) => PostDto(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );

  DomainPost toDomainModel() => DomainPost(
        id: id,
        title: title,
        body: body,
      );

  @override
  List<Object?> get props => [userId, id, title, body];
}
