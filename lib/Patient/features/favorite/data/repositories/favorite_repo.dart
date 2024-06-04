import 'package:dr/Patient/features/favorite/data/datasources/favorite_ds.dart';
import 'package:dr/Patient/features/favorite/data/models/AddFavoriteModel.dart';
import 'package:dr/Patient/features/favorite/data/models/favoriteModel.dart';

class FavoriteRepo {
  final FavoriteDS dataSource;

  FavoriteRepo({required this.dataSource});

  Future GetFavorite() async {
    FavoriteModel FavoriteResponse =
        FavoriteModel.fromJson(await dataSource.GetFavorite());

    return FavoriteResponse;
  }

  Future<AddFavoriteModel> AddFavorite({
    required Map<String, dynamic> body,
  }) async {
    // print("bodyyyy== $body");
    AddFavoriteModel AddFavoriteResponse = AddFavoriteModel.fromJson(
      await dataSource.addFavorite(body: body),
    );
    return AddFavoriteResponse;
  }

  Future<bool> RemoveFavorite({
    required int? favId,
  }) async {
    // print("bodyyyy== $body");
    if (favId != null) {
      final response = await dataSource.removeFavorite(id: favId);
      return response?['success'] ?? false;
    } else {
      return false;
    }
  }
}
