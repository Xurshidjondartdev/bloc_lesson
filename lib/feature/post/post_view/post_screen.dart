import 'package:bloc_lesson/config/setup_locator.dart';
import 'package:bloc_lesson/feature/post/bloc/post_bloc.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});
  final PostBloc bloc = locator.get<PostBloc>()..add(FetchPostEvent());

  @override
  Widget build(BuildContext context) {
    bloc.stream.listen((state) {
      if (state is PostError) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text((bloc.state as PostError).errorText),
            ),
          );
        }
      }
      if (state is PostLoaded && state.massage != null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text((bloc.state as PostLoaded).massage!),
            ),
          );
        }
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post App"),
        centerTitle: true,
      ),
      
    );
  }
}
