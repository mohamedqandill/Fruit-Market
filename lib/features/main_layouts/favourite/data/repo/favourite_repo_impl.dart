import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/core/apis/api_manager.dart';
import 'package:responsive_adaptive_ui/core/apis/end_points.dart';
import 'package:responsive_adaptive_ui/core/local_storage_service/prefs.dart';
import 'package:responsive_adaptive_ui/di.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/favourite/data/repo/favourite_repo.dart';

import '../models/favourite_products.dart';

@Injectable(as: FavouriteRepo)
class FavouriteRepoImpl implements FavouriteRepo {
  @override
  Future<void> toggleFavourite(int favId) async {
    try {
      SharedPrefs prefs = SharedPrefs();
      var token = prefs.getString("token");
      print(token);
      await getIt<ApiManager>()
          .postData(endPoints: EndPoints.toggleFavourite, headers: {
        'Authorization': 'Bearer $token',
      }, body: {
        "favo_id": favId
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FavouriteProducts> getFavourites() async {
    try {
      SharedPrefs prefs = SharedPrefs();
      var token = prefs.getString("token");
      // print(token);
      log(token!);
      final response = await getIt<ApiManager>()
          .getData(endPoints: EndPoints.getFavourite, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      });
      return FavouriteProducts.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
