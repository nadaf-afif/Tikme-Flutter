import 'dart:convert';

class OtpGenerationResponse {
  
  String message;
  String status;
  LoginInfo data;

  OtpGenerationResponse({
    this.message,
    this.status,
    this.data,
  });


  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'status': status,
      'data': data?.toMap(),
    };
  }

  static OtpGenerationResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return OtpGenerationResponse(
      message: map['message'],
      status: map['status'],
      data: LoginInfo.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static OtpGenerationResponse fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'OtpGenerationResponse(message: $message, status: $status, data: $data)';

}

class LoginInfo {
  int id;
  String user_name;
  String email;
  String phone_no;
  String role;
  String full_name;
  bool phone_no_verified;

  LoginInfo({
    this.id,
    this.user_name,
    this.email,
    this.phone_no,
    this.role,
    this.full_name,
    this.phone_no_verified,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_name': user_name,
      'email': email,
      'phone_no': phone_no,
      'role': role,
      'full_name': full_name,
      'phone_no_verified': phone_no_verified,
    };
  }

  static LoginInfo fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return LoginInfo(
      id: map['id'],
      user_name: map['user_name'],
      email: map['email'],
      phone_no: map['phone_no'],
      role: map['role'],
      full_name: map['full_name'],
      phone_no_verified: map['phone_no_verified'],
    );
  }

  String toJson() => json.encode(toMap());

  static LoginInfo fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'LoginInfo(id: $id, user_name: $user_name, email: $email, phone_no: $phone_no, role: $role, full_name: $full_name, phone_no_verified: $phone_no_verified)';
  }
}
