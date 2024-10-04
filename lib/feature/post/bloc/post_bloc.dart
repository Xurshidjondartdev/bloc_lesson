import 'package:bloc/bloc.dart';
import 'package:bloc_lesson/data/model/post_model.dart';
import 'package:flutter/material.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostEvent>((event, emit) {});
  }
}
