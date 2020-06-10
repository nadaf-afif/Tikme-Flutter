import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


class OmsProvidersData {
  String message;
  String status;
  OmsData data;
  OmsProvidersData({
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

  static OmsProvidersData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OmsProvidersData(
      message: map['message'],
      status: map['status'],
      data: OmsData.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static OmsProvidersData fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() =>
      'OmsProvidersData(message: $message, status: $status, data: $data)';
}

class OmsData {
  List<OmsProvider> providers;
  OmsData({
    this.providers,
  });

  Map<String, dynamic> toMap() {
    return {
      'providers': providers?.map((x) => x?.toMap())?.toList(),
    };
  }

  static OmsData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OmsData(
      providers: List<OmsProvider>.from(
          map['providers']?.map((x) => OmsProvider.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static OmsData fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'OmsData(providers: $providers)';
}

class OmsProvider extends Equatable {
  
  int id;
  String email;
  String phone_no;
  String profile_image_path;
  String address;
  String l1_categories;
  bool enable_oms;
  double lat;
  double lng;
  num distance;
  String name;
  bool oms_order_window_status;
  String oms_order_window_message;

  OmsProvider({
    this.id,
    this.email,
    this.phone_no,
    this.profile_image_path,
    this.address,
    this.l1_categories,
    this.enable_oms,
    this.lat,
    this.lng,
    this.distance,
    this.name,
    this.oms_order_window_status,
    this.oms_order_window_message,
  });

  @override
  List<Object> get props => [];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'phone_no': phone_no,
      'profile_image_path': profile_image_path,
      'address': address,
      'l1_categories': l1_categories,
      'enable_oms': enable_oms,
      'lat': lat,
      'lng': lng,
      'distance': distance,
      'name': name,
      'oms_order_window_status': oms_order_window_status,
      'oms_order_window_message': oms_order_window_message,
    };
  }

  static OmsProvider fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return OmsProvider(
      id: map['id'],
      email: map['email'],
      phone_no: map['phone_no'],
      profile_image_path: map['profile_image_path'],
      address: map['address'],
      l1_categories: map['l1_categories'],
      enable_oms: map['enable_oms'],
      lat: map['lat'],
      lng: map['lng'],
      distance: map['distance'],
      name: map['name'],
      oms_order_window_status: map['oms_order_window_status'],
      oms_order_window_message: map['oms_order_window_message'],
    );
  }

  String toJson() => json.encode(toMap());

  static OmsProvider fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'OmsProvider(id: $id, email: $email, phone_no: $phone_no, profile_image_path: $profile_image_path, address: $address, l1_categories: $l1_categories, enable_oms: $enable_oms, lat: $lat, lng: $lng, distance: $distance, name: $name, oms_order_window_status: $oms_order_window_status, oms_order_window_message: $oms_order_window_message)';
  }

}
