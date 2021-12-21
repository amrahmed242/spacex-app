import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/models/search_interval.dart';
import '../../../../ui/styles/colors.dart';
import '../../../../ui/widgets/buttons/normal_button.dart';

class FilterLaunchesWidget extends StatelessWidget {
  final Function onSearch;
  final Function onClearSearch;
  final SearchInterval searchInterval;

  const FilterLaunchesWidget({Key key, this.onSearch, this.onClearSearch, this.searchInterval}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 19, bottom: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/rocket.png', width: 36),
              Text('PAST LAUNCHES', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
              NormalButton(
                width: 50,
                raduis: 20,
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.all(0),
                child: Icon(FontAwesomeIcons.calendarAlt),
                color: AppColors.accentColor,
                onPressed: () => onSearch(),
              ),
            ],
          ),
          if (searchInterval != null)
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
              color: Colors.transparent,
              child: Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.accentColor, width: 1.2),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('From\n' + _formatDate(searchInterval.from), style: TextStyle(fontSize: 19), textAlign: TextAlign.center),
                      Text('To\n' + _formatDate(searchInterval.to), style: TextStyle(fontSize: 19), textAlign: TextAlign.center),
                      NormalButton(
                        width: 50,
                        raduis: 25,
                        margin: EdgeInsets.all(7),
                        padding: EdgeInsets.all(0),
                        child: Icon(Icons.close),
                        color: Colors.red.withOpacity(.9),
                        onPressed: () => onClearSearch(),
                      )
                    ],
                  )),
            ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final formatted = formatDate(date, [yyyy, '-', mm, '-', dd]);

    return formatted;
  }
}
