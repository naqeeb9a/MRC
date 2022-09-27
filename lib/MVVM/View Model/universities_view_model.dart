import 'package:flutter/widgets.dart';
import 'package:mrc/MVVM/Model/model_error.dart';
import 'package:mrc/MVVM/Model/universities_model.dart';
import 'package:mrc/MVVM/Repo/api_status.dart';
import 'package:mrc/MVVM/Repo/universities_service.dart';

class UniversitiesViewModel extends ChangeNotifier {
  UniversitiesInfoModel? _universitiesInfoModel;
  bool _loading = false;
  ModelError? _modelError;

  UniversitiesViewModel() {
    getUniversitites();
  }

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

  setModelError(ModelError modelError) {
    _modelError = modelError;
  }

  getUniversitites() async {
    setLoading(true);
    var response = await UniversititesService.getUniversitites();
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
