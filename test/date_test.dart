import 'package:flutter_test/flutter_test.dart';

import '../lib/core/utils/date_helper.dart';

void main() {
  test('Validate Unix launch date parsing', () {
    final unixDate = 1143239400; //Sat Mar 25 2006 00:30:00
    final dateHelper = DateHelper();

    final String parsedDate = dateHelper.getLaunchDate(unixDate);
    final String excpctedValue = '2006-03-25  00:30:00';

    expect(parsedDate, excpctedValue);
  });
}
