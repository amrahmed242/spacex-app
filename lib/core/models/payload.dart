class Payload {
  String name;
  String type;
  bool reused;
  String launch;
  List<String> customers;
  List<num> noradIds;
  List<String> nationalities;
  List<String> manufacturers;
  num massKg;
  num massLbs;
  String orbit;
  String referenceSystem;
  String regime;
  dynamic longitude;
  num semiMajorAxisKm;
  num eccentricity;
  num periapsisKm;
  num apoapsisKm;
  num inclinationDeg;
  num periodMin;
  num lifespanYears;
  String epoch;
  num meanMotion;
  num raan;
  num argOfPericenter;
  num meanAnomaly;
  String id;

  Payload(
      {this.name,
      this.type,
      this.reused,
      this.launch,
      this.customers,
      this.noradIds,
      this.nationalities,
      this.manufacturers,
      this.massKg,
      this.massLbs,
      this.orbit,
      this.referenceSystem,
      this.regime,
      this.longitude,
      this.semiMajorAxisKm,
      this.eccentricity,
      this.periapsisKm,
      this.apoapsisKm,
      this.inclinationDeg,
      this.periodMin,
      this.lifespanYears,
      this.epoch,
      this.meanMotion,
      this.raan,
      this.argOfPericenter,
      this.meanAnomaly,
      this.id});

  Payload.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    reused = json['reused'];
    launch = json['launch'];
    customers = json['customers'].cast<String>();
    noradIds = json['norad_ids'].cast<num>();
    nationalities = json['nationalities'].cast<String>();
    manufacturers = json['manufacturers'].cast<String>();
    massKg = json['mass_kg'];
    massLbs = json['mass_lbs'];
    orbit = json['orbit'];
    referenceSystem = json['reference_system'];
    regime = json['regime'];
    longitude = json['longitude'];
    semiMajorAxisKm = json['semi_major_axis_km'];
    eccentricity = json['eccentricity'];
    periapsisKm = json['periapsis_km'];
    apoapsisKm = json['apoapsis_km'];
    inclinationDeg = json['inclination_deg'];
    periodMin = json['period_min'];
    lifespanYears = json['lifespan_years'];
    epoch = json['epoch'];
    meanMotion = json['mean_motion'];
    raan = json['raan'];
    argOfPericenter = json['arg_of_pericenter'];
    meanAnomaly = json['mean_anomaly'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['reused'] = this.reused;
    data['launch'] = this.launch;
    data['customers'] = this.customers;
    data['norad_ids'] = this.noradIds;
    data['nationalities'] = this.nationalities;
    data['manufacturers'] = this.manufacturers;
    data['mass_kg'] = this.massKg;
    data['mass_lbs'] = this.massLbs;
    data['orbit'] = this.orbit;
    data['reference_system'] = this.referenceSystem;
    data['regime'] = this.regime;
    data['longitude'] = this.longitude;
    data['semi_major_axis_km'] = this.semiMajorAxisKm;
    data['eccentricity'] = this.eccentricity;
    data['periapsis_km'] = this.periapsisKm;
    data['apoapsis_km'] = this.apoapsisKm;
    data['inclination_deg'] = this.inclinationDeg;
    data['period_min'] = this.periodMin;
    data['lifespan_years'] = this.lifespanYears;
    data['epoch'] = this.epoch;
    data['mean_motion'] = this.meanMotion;
    data['raan'] = this.raan;
    data['arg_of_pericenter'] = this.argOfPericenter;
    data['mean_anomaly'] = this.meanAnomaly;
    data['id'] = this.id;
    return data;
  }
}
