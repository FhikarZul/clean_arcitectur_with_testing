import 'package:clean_arcitectur_with_testing/domain/model/domain_comments.dart';
import 'package:clean_arcitectur_with_testing/domain/model/domain_post.dart';
import 'package:equatable/equatable.dart';

class CommentsDto extends Equatable {
  final int id;
  final String name;
  final String body;

  const CommentsDto({
    required this.id,
    required this.name,
    required this.body,
  });

  factory CommentsDto.fromJson(Map<String, dynamic> json) => CommentsDto(
        id: json['id'],
        name: json['name'],
        body: json['body'],
      );

  DomainComments toDomainModel() => DomainComments(name: name, body: body);

  @override
  List<Object?> get props => [id, name, body];
}
