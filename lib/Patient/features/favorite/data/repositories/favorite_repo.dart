import 'package:dr/Patient/features/favorite/data/datasources/favorite_ds.dart';

class FavoriteRepo {
  final FavoriteDS dataSource;

  FavoriteRepo({required this.dataSource});

  Future GetFavorite() async {
    var FavoriteResponse = await dataSource.GetFavorite();

    return FavoriteResponse;
  }
}
