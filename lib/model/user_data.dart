import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserData {
  String message;
  String status;
  UserInfo data;

  UserData(
    this.message,
    this.status,
    this.data,
  );

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'status': status,
      'data': data?.toMap(),
    };
  }

  static UserData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserData(
      map['message'],
      map['status'],
      UserInfo.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static UserData fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'UserData(message: $message, status: $status, data: $data)';
}

class UserInfo extends Equatable {
  String verification_code;
  String business_image_path;
  String office_no;
  String state;
  double lng;
  String password;
  String profile_image_path;
  String city;
  int id;
  int promo_quota;
  bool delete_flag;
  String phone_no;
  String created_at;
  String role;
  double lat;
  bool active_flag;
  int spam_report_count;
  String zip;
  String forgot_token;
  String website;
  String status;
  String auth_token;
  bool is_upgraded;
  String country;
  String business_name;
  String user_name;
  String updated_at;
  String email;
  String address;
  String video_path;
  String display_setting;
  String businees_hours;
  String language;
  int phone_no_verified;
  String full_name;
  String my_location;
  bool show_food_providers_feature = false;
  bool show_rewards_feature = false;
  bool allow_user_name_update = false;
  bool allow_full_name_update = false;
  int tikme_reward_points;
  bool enable_oms;
  bool oms_accept_orders;
  bool oms_enable_pay_later;
  bool oms_enable_pay_now;
  bool oms_order_window_status;
  String oms_order_window_message;
  String oms_order_confirmation_message;
  String oms_end_time;
  String oms_start_time;
  String oms_tab_name;
  String covid_survey_url;
  bool disable_call_for_requestor;
  bool disable_chat_for_requestor;
  String map_pin_type;
  int community_id;
  String community_name;
  int tikme_lifetime_reward_points;

  UserInfo({
    this.verification_code,
    this.business_image_path,
    this.office_no,
    this.state,
    this.lng,
    this.password,
    this.profile_image_path,
    this.city,
    this.id,
    this.promo_quota,
    this.delete_flag,
    this.phone_no,
    this.created_at,
    this.role,
    this.lat,
    this.active_flag,
    this.spam_report_count,
    this.zip,
    this.forgot_token,
    this.website,
    this.status,
    this.auth_token,
    this.is_upgraded,
    this.country,
    this.business_name,
    this.user_name,
    this.updated_at,
    this.email,
    this.address,
    this.video_path,
    this.display_setting,
    this.businees_hours,
    this.language,
    this.phone_no_verified,
    this.full_name,
    this.my_location,
    this.show_food_providers_feature,
    this.show_rewards_feature,
    this.allow_user_name_update,
    this.allow_full_name_update,
    this.tikme_reward_points,
    this.enable_oms,
    this.oms_accept_orders,
    this.oms_enable_pay_later,
    this.oms_enable_pay_now,
    this.oms_order_window_status,
    this.oms_order_window_message,
    this.oms_order_confirmation_message,
    this.oms_end_time,
    this.oms_start_time,
    this.oms_tab_name,
    this.covid_survey_url,
    this.disable_call_for_requestor,
    this.disable_chat_for_requestor,
    this.map_pin_type,
    this.community_id,
    this.community_name,
    this.tikme_lifetime_reward_points,
  });

  @override
  List<Object> get props => [id];

  Map<String, dynamic> toMap() {
    return {
      'verification_code': verification_code,
      'business_image_path': business_image_path,
      'office_no': office_no,
      'state': state,
      'lng': lng,
      'password': password,
      'profile_image_path': profile_image_path,
      'city': city,
      'id': id,
      'promo_quota': promo_quota,
      'delete_flag': delete_flag,
      'phone_no': phone_no,
      'created_at': created_at,
      'role': role,
      'lat': lat,
      'active_flag': active_flag,
      'spam_report_count': spam_report_count,
      'zip': zip,
      'forgot_token': forgot_token,
      'website': website,
      'status': status,
      'auth_token': auth_token,
      'is_upgraded': is_upgraded,
      'country': country,
      'business_name': business_name,
      'user_name': user_name,
      'updated_at': updated_at,
      'email': email,
      'address': address,
      'video_path': video_path,
      'display_setting': display_setting,
      'businees_hours': businees_hours,
      'language': language,
      'phone_no_verified': phone_no_verified,
      'full_name': full_name,
      'my_location': my_location,
      'show_food_providers_feature': show_food_providers_feature,
      'show_rewards_feature': show_rewards_feature,
      'allow_user_name_update': allow_user_name_update,
      'allow_full_name_update': allow_full_name_update,
      'tikme_reward_points': tikme_reward_points,
      'enable_oms': enable_oms,
      'oms_accept_orders': oms_accept_orders,
      'oms_enable_pay_later': oms_enable_pay_later,
      'oms_enable_pay_now': oms_enable_pay_now,
      'oms_order_window_status': oms_order_window_status,
      'oms_order_window_message': oms_order_window_message,
      'oms_order_confirmation_message': oms_order_confirmation_message,
      'oms_end_time': oms_end_time,
      'oms_start_time': oms_start_time,
      'oms_tab_name': oms_tab_name,
      'covid_survey_url': covid_survey_url,
      'disable_call_for_requestor': disable_call_for_requestor,
      'disable_chat_for_requestor': disable_chat_for_requestor,
      'map_pin_type': map_pin_type,
      'community_id': community_id,
      'community_name': community_name,
      'tikme_lifetime_reward_points': tikme_lifetime_reward_points,
    };
  }

  static UserInfo fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserInfo(
      verification_code: map['verification_code'],
      business_image_path: map['business_image_path'],
      office_no: map['office_no'],
      state: map['state'],
      lng: map['lng'],
      password: map['password'],
      profile_image_path: map['profile_image_path'],
      city: map['city'],
      id: map['id'],
      promo_quota: map['promo_quota'],
      delete_flag: map['delete_flag'],
      phone_no: map['phone_no'],
      created_at: map['created_at'],
      role: map['role'],
      lat: map['lat'],
      active_flag: map['active_flag'],
      spam_report_count: map['spam_report_count'],
      zip: map['zip'],
      forgot_token: map['forgot_token'],
      website: map['website'],
      status: map['status'],
      auth_token: map['auth_token'],
      is_upgraded: map['is_upgraded'],
      country: map['country'],
      business_name: map['business_name'],
      user_name: map['user_name'],
      updated_at: map['updated_at'],
      email: map['email'],
      address: map['address'],
      video_path: map['video_path'],
      display_setting: map['display_setting'],
      businees_hours: map['businees_hours'],
      language: map['language'],
      phone_no_verified: map['phone_no_verified'],
      full_name: map['full_name'],
      my_location: map['my_location'],
      show_food_providers_feature: map['show_food_providers_feature'],
      show_rewards_feature: map['show_rewards_feature'],
      allow_user_name_update: map['allow_user_name_update'],
      allow_full_name_update: map['allow_full_name_update'],
      tikme_reward_points: map['tikme_reward_points'],
      enable_oms: map['enable_oms'],
      oms_accept_orders: map['oms_accept_orders'],
      oms_enable_pay_later: map['oms_enable_pay_later'],
      oms_enable_pay_now: map['oms_enable_pay_now'],
      oms_order_window_status: map['oms_order_window_status'],
      oms_order_window_message: map['oms_order_window_message'],
      oms_order_confirmation_message: map['oms_order_confirmation_message'],
      oms_end_time: map['oms_end_time'],
      oms_start_time: map['oms_start_time'],
      oms_tab_name: map['oms_tab_name'],
      covid_survey_url: map['covid_survey_url'],
      disable_call_for_requestor: map['disable_call_for_requestor'],
      disable_chat_for_requestor: map['disable_chat_for_requestor'],
      map_pin_type: map['map_pin_type'],
      community_id: map['community_id'],
      community_name: map['community_name'],
      tikme_lifetime_reward_points: map['tikme_lifetime_reward_points'],
    );
  }

  String toJson() => json.encode(toMap());

  static UserInfo fromJson(String source) => fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
