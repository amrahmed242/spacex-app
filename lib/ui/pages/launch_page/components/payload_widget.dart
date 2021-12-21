import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/models/payload.dart';
import '../../../../ui/widgets/app_card.dart';
import '../../../../ui/widgets/faded_widget.dart';
import '../../../../ui/widgets/name_value_widget.dart';
import '../../../../ui/widgets/space_logo.dart';

class PayloadWidget extends StatelessWidget {
  final bool payloadLoaded;
  final bool loading;
  final List<Payload> payloads;
  const PayloadWidget({Key key, this.payloadLoaded, this.loading, this.payloads}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(FontAwesomeIcons.weightHanging, color: Colors.white, size: 30),
          SizedBox(width: 5),
          Text("PAYLOAD DETAILS", style: TextStyle(fontSize: 36)),
        ]),
        !payloadLoaded
            ? AppCard(
                width: double.infinity,
                widget: FadedWidget(
                  repeat: loading,
                  widget: SizedBox(height: 130, child: SpaceLogo()),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final payload = payloads[index];
                  return AppCard(
                    width: double.infinity,
                    widget: FadedWidget(
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NameValueWidget(name: 'Name', value: payload.name),
                          NameValueWidget(name: 'Type', value: payload.type),
                          NameValueWidget(name: 'Mas KG', value: payload.massKg.toString()),
                          NameValueWidget(name: 'Orbit', value: payload.orbit),
                          NameValueWidget(name: 'Customers', value: payload.customers.toString()),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: payloads.length)
      ],
    );
  }
}
