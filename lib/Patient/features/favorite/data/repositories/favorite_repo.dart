import 'package:dr/Patient/features/favorite/data/datasources/favorite_ds.dart';
import 'package:dr/Patient/features/favorite/data/models/favoriteModel.dart';

class FavoriteRepo {
  final FavoriteDS dataSource;

  FavoriteRepo({required this.dataSource});

  Future GetFavorite() async {
    FavoriteModel FavoriteResponse =
        FavoriteModel.fromJson(await dataSource.GetFavorite());
    print("from Repo");
    print("////////////////////////////////////");
    print(FavoriteResponse);
    print("////////////////////////////////////");
    return FavoriteResponse;
  }
}
