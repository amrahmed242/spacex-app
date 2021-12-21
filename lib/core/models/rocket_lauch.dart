class RocketLaunch {
  Links links;
  String staticFireDateUtc;
  num staticFireDateUnix;
  bool tdb;
  bool net;
  num window;
  String rocket;
  bool success;
  String details;
  List<String> capsules;
  List<String> payloads;
  String launchpad;
  bool autoUpdate;
  num flightNumber;
  String name;
  String dateUtc;
  num dateUnix;
  String dateLocal;
  String datePrecision;
  bool upcoming;
  List<Cores> cores;
  String id;

  RocketLaunch(
      {this.links,
      this.staticFireDateUtc,
      this.staticFireDateUnix,
      this.tdb,
      this.net,
      this.window,
      this.rocket,
      this.success,
      this.details,
      this.capsules,
      this.payloads,
      this.launchpad,
      this.autoUpdate,
      this.flightNumber,
      this.name,
      this.dateUtc,
      this.dateUnix,
      this.dateLocal,
      this.datePrecision,
      this.upcoming,
      this.cores,
      this.id});

  static List<RocketLaunch> fromListJson(data) {
    final List<RocketLaunch> launches = [];
    data.forEach((rec) => launches.add(new RocketLaunch.fromJson(rec)));
    return launches;
  }

  RocketLaunch.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    staticFireDateUtc = json['static_fire_date_utc'];
    staticFireDateUnix = json['static_fire_date_unix'];
    tdb = json['tdb'];
    net = json['net'];
    window = json['window'];
    rocket = json['rocket'];
    success = json['success'];
    details = json['details'];
    capsules = json['capsules'].cast<String>();
    payloads = json['payloads'].cast<String>();
    launchpad = json['launchpad'];
    autoUpdate = json['auto_update'];
    flightNumber = json['flight_number'];
    name = json['name'];
    dateUtc = json['date_utc'];
    dateUnix = json['date_unix'];
    dateLocal = json['date_local'];
    datePrecision = json['date_precision'];
    upcoming = json['upcoming'];
    if (json['cores'] != null) {
      cores = [];
      json['cores'].forEach((v) {
        cores.add(new Cores.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    data['static_fire_date_utc'] = this.staticFireDateUtc;
    data['static_fire_date_unix'] = this.staticFireDateUnix;
    data['tdb'] = this.tdb;
    data['net'] = this.net;
    data['window'] = this.window;
    data['rocket'] = this.rocket;
    data['success'] = this.success;
    data['details'] = this.details;
    data['capsules'] = this.capsules;
    data['payloads'] = this.payloads;
    data['launchpad'] = this.launchpad;
    data['auto_update'] = this.autoUpdate;
    data['flight_number'] = this.flightNumber;
    data['name'] = this.name;
    data['date_utc'] = this.dateUtc;
    data['date_unix'] = this.dateUnix;
    data['date_local'] = this.dateLocal;
    data['date_precision'] = this.datePrecision;
    data['upcoming'] = this.upcoming;
    if (this.cores != null) {
      data['cores'] = this.cores.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class Links {
  Patch patch;
  Reddit reddit;
  Flickr flickr;
  String presskit;
  String webcast;
  String youtubeId;
  String article;
  String wikipedia;

  Links({this.patch, this.reddit, this.flickr, this.presskit, this.webcast, this.youtubeId, this.article, this.wikipedia});

  Links.fromJson(Map<String, dynamic> json) {
    patch = json['patch'] != null ? new Patch.fromJson(json['patch']) : null;
    reddit = json['reddit'] != null ? new Reddit.fromJson(json['reddit']) : null;
    flickr = json['flickr'] != null ? new Flickr.fromJson(json['flickr']) : null;
    presskit = json['presskit'];
    webcast = json['webcast'];
    youtubeId = json['youtube_id'];
    article = json['article'];
    wikipedia = json['wikipedia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.patch != null) {
      data['patch'] = this.patch.toJson();
    }
    if (this.reddit != null) {
      data['reddit'] = this.reddit.toJson();
    }
    if (this.flickr != null) {
      data['flickr'] = this.flickr.toJson();
    }
    data['presskit'] = this.presskit;
    data['webcast'] = this.webcast;
    data['youtube_id'] = this.youtubeId;
    data['article'] = this.article;
    data['wikipedia'] = this.wikipedia;
    return data;
  }
}

class Patch {
  String small;
  String large;

  Patch({this.small, this.large});

  Patch.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    return data;
  }
}

class Reddit {
  String campaign;
  String launch;
  String media;
  String recovery;

  Reddit({this.campaign, this.launch, this.media, this.recovery});

  Reddit.fromJson(Map<String, dynamic> json) {
    campaign = json['campaign'];
    launch = json['launch'];
    media = json['media'];
    recovery = json['recovery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['campaign'] = this.campaign;
    data['launch'] = this.launch;
    data['media'] = this.media;
    data['recovery'] = this.recovery;
    return data;
  }
}

class Flickr {
  List<String> small;
  List<String> original;

  Flickr({this.small, this.original});

  Flickr.fromJson(Map<String, dynamic> json) {
    if (json['small'] != null) {
      small = [];
      json['small'].forEach((v) {
        small.add(v);
      });
    }
    original = json['original'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.small != null) {
      data['small'] = this.small;
    }
    data['original'] = this.original;
    return data;
  }
}

class Cores {
  String core;
  num flight;
  bool gridfins;
  bool legs;
  bool reused;
  bool landingAttempt;
  bool landingSuccess;
  String landingType;
  String landpad;

  Cores(
      {this.core,
      this.flight,
      this.gridfins,
      this.legs,
      this.reused,
      this.landingAttempt,
      this.landingSuccess,
      this.landingType,
      this.landpad});

  Cores.fromJson(Map<String, dynamic> json) {
    core = json['core'];
    flight = json['flight'];
    gridfins = json['gridfins'];
    legs = json['legs'];
    reused = json['reused'];
    landingAttempt = json['landing_attempt'];
    landingSuccess = json['landing_success'];
    landingType = json['landing_type'];
    landpad = json['landpad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['core'] = this.core;
    data['flight'] = this.flight;
    data['gridfins'] = this.gridfins;
    data['legs'] = this.legs;
    data['reused'] = this.reused;
    data['landing_attempt'] = this.landingAttempt;
    data['landing_success'] = this.landingSuccess;
    data['landing_type'] = this.landingType;
    data['landpad'] = this.landpad;
    return data;
  }
}
