class PasswordModel {
  Result? result;
  bool? success;

  PasswordModel({this.result, this.success});

  PasswordModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Result {
  Setting? setting;

  Result({this.setting});

  Result.fromJson(Map<String, dynamic> json) {
    setting =
    json['setting'] != null ? new Setting.fromJson(json['setting']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.setting != null) {
      data['setting'] = this.setting!.toJson();
    }
    return data;
  }
}

class Setting {
  bool? requireDigit;
  bool? requireLowercase;
  bool? requireNonAlphanumeric;
  bool? requireUppercase;
  int? requiredLength;

  Setting(
      {this.requireDigit,
        this.requireLowercase,
        this.requireNonAlphanumeric,
        this.requireUppercase,
        this.requiredLength});

  Setting.fromJson(Map<String, dynamic> json) {
    requireDigit = json['requireDigit'];
    requireLowercase = json['requireLowercase'];
    requireNonAlphanumeric = json['requireNonAlphanumeric'];
    requireUppercase = json['requireUppercase'];
    requiredLength = json['requiredLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requireDigit'] = this.requireDigit;
    data['requireLowercase'] = this.requireLowercase;
    data['requireNonAlphanumeric'] = this.requireNonAlphanumeric;
    data['requireUppercase'] = this.requireUppercase;
    data['requiredLength'] = this.requiredLength;
    return data;
  }
}
