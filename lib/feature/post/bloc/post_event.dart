part of 'post_bloc.dart';

@immutable
sealed class PostEvent {
  const PostEvent();
}

class FetchPostEvent extends PostEvent {}

class CreatePostEvent extends PostEvent {
  final String title;
  final String body;
  const CreatePostEvent({required this.title, required this.body});
}

class UpdatePostEvent extends PostEvent {
  final String id;
  final String title;
  final String body;
  const UpdatePostEvent({required this.id, required this.title, required this.body});
}

class DeletePostEvent extends PostEvent {
  final String id;
  const DeletePostEvent({required this.id});
}
