import 'package:bloc/bloc.dart';
import 'package:bloc_lesson/data/model/post_model.dart';
import 'package:bloc_lesson/data/repository/app_repository.dart';
import 'package:flutter/material.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final AppRepository repository;
  PostBloc({required this.repository}) : super(PostInitial()) {
    on<FetchPostEvent>((event, emit) async {
      try {
        emit(PostLoading(postList: state.postList));
        final list = await repository.getAllPosts();
        emit(PostLoaded(postList: list));
      } catch (e) {
        emit(PostError(postList: state.postList, errorText: "Smth went wrong"));
      }
    });
  }
}
