import 'package:flutter/widgets.dart';
import 'package:mrc/MVVM/Model/Lead%20Progress/lead_progress_model.dart';
import 'package:mrc/MVVM/Model/model_error.dart';
import 'package:mrc/MVVM/Repo/Lead%20Progress/lead_progress_service.dart';
import 'package:mrc/MVVM/Repo/api_status.dart';
import 'package:mrc/utils/utils.dart';

class LeadProgressViewModel extends ChangeNotifier {
  LeadProgress? _leadProgress;
  bool _loading = false;
  ModelError? _modelError;

  bool get loading => _loading;
  LeadProgress? get universitiesInfoModel => _leadProgress;
  ModelError? get modelError => _modelError;

  LeadProgressViewModel() {
    getProgress(userData["data"]["details"]["id"].toString());
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setLeadProgress(LeadProgress leadProgress) {
    _leadProgress = leadProgress;
  }

  setModelError(ModelError modelError) {
    _modelError = modelError;
  }

  getProgress(String leadId) async {
    setLoading(true);
    var response = await LeadProgressService.getProgress(leadId);
    if (response is Success) {
      setLeadProgress(response.response as LeadProgress);
    }
    if (response is Failure) {
      ModelError modelError = ModelError(response.code, response.errorResponse);
      setModelError(modelError);
    }
    setLoading(false);
  }
}
