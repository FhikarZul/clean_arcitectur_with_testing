import 'package:equatable/equatable.dart';

class DomainComments extends Equatable {
  final String name;
  final String body;

  const DomainComments({
    required this.name,
    required this.body,
  });

  @override
  List<Object?> get props => [name, body];
}
