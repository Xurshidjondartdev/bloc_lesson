import 'package:bloc_lesson/data/model/post_model.dart';
import 'package:bloc_lesson/data/repository/app_repository.dart';
import 'package:bloc_lesson/data/source/api.dart';
import 'package:bloc_lesson/data/source/data_source.dart';

class AppRepositoryImpl implements AppRepository {
  final Network network;
  const AppRepositoryImpl({required this.network});

  @override
  Future<void> createPost({required PostModel post}) async {
    await network.post(api: Api.apiPost, body: post.toJson());
  }

  @override
  Future<List<PostModel>> getAllPosts() async {
    final res = await network.get(api: Api.apiPost) as List;
    return res.map((e) => PostModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<void> updatePost({required PostModel post}) async {
    await network.put(api: Api.apiPost, body: post.toJson(), id: post.id.toString());
  }

  @override
  Future<void> deletePost({required String id}) async {
    await network.delete(api: Api.apiPost, id: id);
  }
}
