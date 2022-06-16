import 'package:equatable/equatable.dart';

class DomainPost extends Equatable {
  final int id;
  final String title;
  final String body;

  const DomainPost({
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  List<Object?> get props => [title, body];
}
