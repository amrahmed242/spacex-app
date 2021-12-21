class Launchpad {
  String name;
  String fullName;
  String locality;
  String region;
  String timezone;
  double latitude;
  double longitude;
  num launchAttempts;
  num launchSuccesses;
  List<String> rockets;
  List<String> launches;
  String status;
  String id;

  Launchpad(
      {this.name,
      this.fullName,
      this.locality,
      this.region,
      this.timezone,
      this.latitude,
      this.longitude,
      this.launchAttempts,
      this.launchSuccesses,
      this.rockets,
      this.launches,
      this.status,
      this.id});

  Launchpad.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fullName = json['full_name'];
    locality = json['locality'];
    region = json['region'];
    timezone = json['timezone'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    launchAttempts = json['launch_attempts'];
    launchSuccesses = json['launch_successes'];
    rockets = json['rockets'].cast<String>();
    launches = json['launches'].cast<String>();
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    data['locality'] = this.locality;
    data['region'] = this.region;
    data['timezone'] = this.timezone;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['launch_attempts'] = this.launchAttempts;
    data['launch_successes'] = this.launchSuccesses;
    data['rockets'] = this.rockets;
    data['launches'] = this.launches;
    data['status'] = this.status;
    data['id'] = this.id;
    return data;
  }
}
