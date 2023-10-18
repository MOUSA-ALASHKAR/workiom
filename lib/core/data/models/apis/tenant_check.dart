class TenantCheck {
  Result? result;
  bool? success;
  bool? unAuthorizedRequest;

  TenantCheck({this.result, this.success, this.unAuthorizedRequest});

  TenantCheck.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    success = json['success'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['success'] = this.success;
    data['unAuthorizedRequest'] = this.unAuthorizedRequest;
    return data;
  }
}

class Result {
  int? state;
  int? tenantId;
  String? serverRootAddress;

  Result({this.state, this.tenantId, this.serverRootAddress});

  Result.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    tenantId = json['tenantId'];
    serverRootAddress = json['serverRootAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['tenantId'] = this.tenantId;
    data['serverRootAddress'] = this.serverRootAddress;
    return data;
  }
}
