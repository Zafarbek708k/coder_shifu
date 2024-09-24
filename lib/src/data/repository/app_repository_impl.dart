import "dart:developer";

import "package:coder_shifu/src/core/server/api/api.dart";
import "package:coder_shifu/src/core/server/api/api_constants.dart";
import "package:coder_shifu/src/data/entity/search_model.dart";

import "app_repository.dart";


class AppRepositoryImpl implements AppRepository {
  factory AppRepositoryImpl() => _impl;
  const AppRepositoryImpl._internal();
  static const AppRepositoryImpl _impl = AppRepositoryImpl._internal();

  @override
  Future<SearchModel?> search() async{
    String? result =  await ApiService.post(ApiConst.apiSearch, {"q":"galaxy"});
    log(result ?? "no result");
    if(result != null){
      SearchModel model = searchModelFromJson(result);
      log(model.credits.toString());
      return searchModelFromJson(result);
    }else{
      return null;
    }
  }

  @override
  Future<void> images() async{
    String? result = await ApiService.post(ApiConst.apiImages, {  "q": "apple inc"});
    log("images ==> $result");
  }


  @override
  Future<void> videos() async{
  }





}
