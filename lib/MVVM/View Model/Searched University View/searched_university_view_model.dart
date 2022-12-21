import 'package:flutter/widgets.dart';
import 'package:mrc/MVVM/Model/model_error.dart';
import 'package:mrc/MVVM/Model/universities_model.dart';
import 'package:mrc/MVVM/Repo/api_status.dart';
import 'package:mrc/MVVM/Repo/universities_service.dart';

class SearchedUniversitiesViewModel extends ChangeNotifier {
  UniversitiesInfoModel? _universitiesInfoModel;
  bool _loading = false;
  ModelError? _modelError;

  bool get loading => _loading;
  UniversitiesInfoModel? get universitiesInfoModel => _universitiesInfoModel;
  ModelError? get modelError => _modelError;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setPostModelList(UniversitiesInfoModel postsModelList) {
    _universitiesInfoModel = postsModelList;
  }

  setModelError(ModelError? modelError) {
    _modelError = modelError;
  }

  getSearchedUniversitites(
      {String? name = "",
      String? country = "",
      String? ranking = "",
      String? state = ""}) async {
    setLoading(true);
    var response = await UniversititesService.getSearchedUniversitites(
        name, country, state, ranking);
    if (response is Success) {
      setPostModelList(response.response as UniversitiesInfoModel);
    }
    if (response is Failure) {
      ModelError modelError = ModelError(response.code, response.errorResponse);
      setModelError(modelError);
    }
    setLoading(false);
  }

  getCanadaUniversitites(
      {String? name = "",
      String? country = "Canada",
      String? ranking = "",
      String? state = ""}) async {
    setLoading(true);
    var response = await UniversititesService.getSearchedUniversitites(
        name, country, state, ranking);
    if (response is Success) {
      setPostModelList(response.response as UniversitiesInfoModel);
    }
    if (response is Failure) {
      ModelError modelError = ModelError(response.code, response.errorResponse);
      setModelError(modelError);
    }
    setLoading(false);
  }

  getUSAUniversitites(
      {String? name = "",
      String? country = "USA",
      String? ranking = "",
      String? state = ""}) async {
    setLoading(true);
    var response = await UniversititesService.getSearchedUniversitites(
        name, country, state, ranking);
    if (response is Success) {
      setPostModelList(response.response as UniversitiesInfoModel);
    }
    if (response is Failure) {
      ModelError modelError = ModelError(response.code, response.errorResponse);
      setModelError(modelError);
    }
    setLoading(false);
  }

  getUkUniversitites(
      {String? name = "",
      String? country = "UK",
      String? ranking = "",
      String? state = ""}) async {
    setLoading(true);
    var response = await UniversititesService.getSearchedUniversitites(
        name, country, state, ranking);
    if (response is Success) {
      setPostModelList(response.response as UniversitiesInfoModel);
    }
    if (response is Failure) {
      ModelError modelError = ModelError(response.code, response.errorResponse);
      setModelError(modelError);
    }
    setLoading(false);
  }
}
