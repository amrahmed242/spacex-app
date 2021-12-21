import 'package:flutter/cupertino.dart';

class LaunchQuery {
  Query query;
  Options options;

  LaunchQuery({@required DateTime startDate, @required DateTime endDate}) {
    query = Query(dateUtc: DateUtc(gte: startDate.toIso8601String(), lte: endDate.toIso8601String()));
    options = Options(limit: 500, sort: Sort(flightNumber: "desc"));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.query != null) {
      data['query'] = this.query.toJson();
    }
    if (this.options != null) {
      data['options'] = this.options.toJson();
    }
    return data;
  }
}

class Query {
  DateUtc dateUtc;

  Query({this.dateUtc});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dateUtc != null) {
      data['date_utc'] = this.dateUtc.toJson();
    }
    return data;
  }
}

class DateUtc {
  String gte;
  String lte;

  DateUtc({this.gte, this.lte});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['\$gte'] = this.gte;
    data['\$lte'] = this.lte;
    return data;
  }
}

class Options {
  int limit;
  Sort sort;

  Options({this.limit, this.sort});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    if (this.sort != null) {
      data['sort'] = this.sort.toJson();
    }
    return data;
  }
}

class Sort {
  String flightNumber;

  Sort({this.flightNumber});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flight_number'] = this.flightNumber;
    return data;
  }
}
