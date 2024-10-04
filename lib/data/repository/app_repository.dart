import 'package:bloc_lesson/data/model/post_model.dart';

abstract class AppRepository {
  //create
  Future<void> createPost({required PostModel post});
  //read
  Future<List<PostModel>> getAllPosts();
  //update
  Future<void> updatePost({required PostModel post});
  //delete
  Future<void> deletePost({required String id});
}
