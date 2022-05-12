import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'post_response.dart';

class PostListResponse extends Equatable {
  final List<PostResponse> post;

  const PostListResponse({required this.post});

  factory PostListResponse.fromJson(String json) => PostListResponse(
        post: List<PostResponse>.from(
          jsonDecode(json).map((e) => PostResponse.fromJson(e)),
        ),
      );

  @override
  List<Object?> get props => [post];
}
