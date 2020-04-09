import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m2_app/ui/resources/widgets/base_widget.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation){
      if(sizingInformation.deviceType == DeviceType.phone) {
        return Scaffold(
            body: Center(
              child: Text(sizingInformation.toString()),
            )
        );
      } else {
        return Scaffold(
          body: Text("toto"));
        }
    });
  }
}