import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ProviderNearByResponse {
  String status;
  String message;
  List<Providers> data;
  ProviderNearByResponse({
    this.status,
    this.message,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((x) => x?.toMap())?.toList(),
    };
  }

  static ProviderNearByResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProviderNearByResponse(
      status: map['status'],
      message: map['message'],
      data: List<Providers>.from(map['data']?.map((x) => Providers.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static ProviderNearByResponse fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() =>
      'ProviderNearByResponse(status: $status, message: $message, data: $data)';
}

class Providers extends Equatable {
  @override
  List<Object> get props => [id];

  int id;
  String profile_image_path;
  double lat;
  double lng;
  String business_image_path;
  String office_no;
  String state;
  String city;
  int promo_quota;
  double distance;
  String phone_no;
  String role;
  int spam_report_count;
  String zip;
  String website;
  String business_name;
  String country;
  String user_name;
  String email;
  String address;
  String display_setting;
  String language;
  String full_name;
  String about_me;
  num average_ratings;
  int total_reviews;
  String l1_categories;

  Providers({
    this.id,
    this.profile_image_path,
    this.lat,
    this.lng,
    this.business_image_path,
    this.office_no,
    this.state,
    this.city,
    this.promo_quota,
    this.distance,
    this.phone_no,
    this.role,
    this.spam_report_count,
    this.zip,
    this.website,
    this.business_name,
    this.country,
    this.user_name,
    this.email,
    this.address,
    this.display_setting,
    this.language,
    this.full_name,
    this.about_me,
    this.average_ratings,
    this.total_reviews,
    this.l1_categories,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'profile_image_path': profile_image_path,
      'lat': lat,
      'lng': lng,
      'business_image_path': business_image_path,
      'office_no': office_no,
      'state': state,
      'city': city,
      'promo_quota': promo_quota,
      'distance': distance,
      'phone_no': phone_no,
      'role': role,
      'spam_report_count': spam_report_count,
      'zip': zip,
      'website': website,
      'business_name': business_name,
      'country': country,
      'user_name': user_name,
      'email': email,
      'address': address,
      'display_setting': display_setting,
      'language': language,
      'full_name': full_name,
      'about_me': about_me,
      'average_ratings': average_ratings,
      'total_reviews': total_reviews,
      'l1_categories': l1_categories,
    };
  }

  static Providers fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Providers(
      id: map['id'],
      profile_image_path: map['profile_image_path'],
      lat: map['lat'],
      lng: map['lng'],
      business_image_path: map['business_image_path'],
      office_no: map['office_no'],
      state: map['state'],
      city: map['city'],
      promo_quota: map['promo_quota'],
      distance: map['distance'],
      phone_no: map['phone_no'],
      role: map['role'],
      spam_report_count: map['spam_report_count'],
      zip: map['zip'],
      website: map['website'],
      business_name: map['business_name'],
      country: map['country'],
      user_name: map['user_name'],
      email: map['email'],
      address: map['address'],
      display_setting: map['display_setting'],
      language: map['language'],
      full_name: map['full_name'],
      about_me: map['about_me'],
      average_ratings: map['average_ratings'],
      total_reviews: map['total_reviews'],
      l1_categories: map['l1_categories'],
    );
  }

  String toJson() => json.encode(toMap());

  static Providers fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Providers(id: $id, profile_image_path: $profile_image_path, lat: $lat, lng: $lng, business_image_path: $business_image_path, office_no: $office_no, state: $state, city: $city, promo_quota: $promo_quota, distance: $distance, phone_no: $phone_no, role: $role, spam_report_count: $spam_report_count, zip: $zip, website: $website, business_name: $business_name, country: $country, user_name: $user_name, email: $email, address: $address, display_setting: $display_setting, language: $language, full_name: $full_name, about_me: $about_me, average_ratings: $average_ratings, total_reviews: $total_reviews, l1_categories: $l1_categories)';
  }
}

class ProviderRequest {
  double lat;
  double lng;
  String cat_id;
  String sub_cat_id;
  String child_cat_id;
  String coverage;
  String query_text;

  ProviderRequest({
    @required this.lat,
    @required this.lng,
    @required this.cat_id,
    @required this.sub_cat_id,
    @required this.child_cat_id,
    this.coverage,
    @required this.query_text,
  });

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
      'cat_id': cat_id,
      'sub_cat_id': sub_cat_id,
      'child_cat_id': child_cat_id,
      'coverage': coverage,
      'query_text': query_text,
    };
  }

  static ProviderRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProviderRequest(
      lat: map['lat'],
      lng: map['lng'],
      cat_id: map['cat_id'],
      sub_cat_id: map['sub_cat_id'],
      child_cat_id: map['child_cat_id'],
      coverage: map['coverage'],
      query_text: map['query_text'],
    );
  }

  String toJson() => json.encode(toMap());

  static ProviderRequest fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProviderRequest(lat: $lat, lng: $lng, cat_id: $cat_id, sub_cat_id: $sub_cat_id, child_cat_id: $child_cat_id, coverage: $coverage, query_text: $query_text)';
  }
}
