class MapLocation {
  MapLocation({
      this.id, 
      this.countryId, 
      this.cityId, 
      this.title, 
      this.latitude, 
      this.longitude, 
      this.createdAt, 
      this.updatedAt, 
      this.phone, 
      this.address, 
      this.openTime, 
      this.closeTime, 
      this.isOpenAlways, 
      this.onlineOrderEnable, 
      this.showOnMap,});

  MapLocation.fromJson(dynamic json) {
    id = json['id'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    title = json['title'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    phone = json['phone'];
    address = json['address'];
    openTime = json['open_time'];
    closeTime = json['close_time'];
    isOpenAlways = json['is_open_always'];
    onlineOrderEnable = json['online_order_enable'];
    showOnMap = json['show_on_map'];
  }
  int? id;
  int? countryId;
  int? cityId;
  String? title;
  double? latitude;
  double? longitude;
  String? createdAt;
  String? updatedAt;
  String? phone;
  String? address;
  dynamic openTime;
  String? closeTime;
  int? isOpenAlways;
  int? onlineOrderEnable;
  int? showOnMap;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['country_id'] = countryId;
    map['city_id'] = cityId;
    map['title'] = title;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['phone'] = phone;
    map['address'] = address;
    map['open_time'] = openTime;
    map['close_time'] = closeTime;
    map['is_open_always'] = isOpenAlways;
    map['online_order_enable'] = onlineOrderEnable;
    map['show_on_map'] = showOnMap;
    return map;
  }

}