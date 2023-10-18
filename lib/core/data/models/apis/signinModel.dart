class SignInModel {
  Result? result;
  bool? success;
  bool? unAuthorizedRequest;

  SignInModel({this.result, this.success, this.unAuthorizedRequest});

  SignInModel.fromJson(Map<String, dynamic> json) {
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
  int? tenantId;
  String? tenancyName;
  String? name;
  String? userName;
  String? emailAddress;
  bool? isTenantActive;
  bool? isActive;
  bool? isEmailConfirmationRequired;

  Result(
      {this.tenantId,
        this.tenancyName,
        this.name,
        this.userName,
        this.emailAddress,
        this.isTenantActive,
        this.isActive,
        this.isEmailConfirmationRequired});

  Result.fromJson(Map<String, dynamic> json) {
    tenantId = json['tenantId'];
    tenancyName = json['tenancyName'];
    name = json['name'];
    userName = json['userName'];
    emailAddress = json['emailAddress'];
    isTenantActive = json['isTenantActive'];
    isActive = json['isActive'];
    isEmailConfirmationRequired = json['isEmailConfirmationRequired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenantId'] = this.tenantId;
    data['tenancyName'] = this.tenancyName;
    data['name'] = this.name;
    data['userName'] = this.userName;
    data['emailAddress'] = this.emailAddress;
    data['isTenantActive'] = this.isTenantActive;
    data['isActive'] = this.isActive;
    data['isEmailConfirmationRequired'] = this.isEmailConfirmationRequired;
    return data;
  }
}
