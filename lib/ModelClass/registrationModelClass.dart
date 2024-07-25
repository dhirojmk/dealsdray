class RegistraionModelClass {
  String? email;
  String? password;
  int? referralCode;
  String? userId;

  RegistraionModelClass(
      {this.email, this.password, this.referralCode, this.userId});

  RegistraionModelClass.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    referralCode = json['referralCode'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['referralCode'] = this.referralCode;
    data['userId'] = this.userId;
    return data;
  }
}
