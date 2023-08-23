import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym/setting/settings_controller.dart';
import 'package:gym/style/colors.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatelessWidget {
  const QRCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController crt=Get.put(SettingsController());

    return Scaffold(
      backgroundColor: pageColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.brown
        ),
        backgroundColor: Colors.orange,
        title: Text('QR Code Generator',
          style: TextStyle(
            color: Colors.brown
          ),
        ),
      ),
      body: GetBuilder<SettingsController>(
        init:SettingsController(),
    builder: (controller)=>FutureBuilder(

    future:  crt.getUser(),
      builder: (context,snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting)
        {
          return  Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(
                  height: 100,
                ),
                CircularProgressIndicator(
                  color: Colors.orangeAccent,
                ),
                SizedBox(
                  height: 7,
                ),
                Text('Loading ....')
              ],
            ),
          );
        }
        else if(crt.uesrData.isEmpty)
        {
          return  Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(
                  height: 100,
                ),
                CircularProgressIndicator(
                  color: Colors.orangeAccent,
                ),
                SizedBox(
                  height: 7,
                ),
                Text('Loading ....')
              ],
            ),
          );
        }
        else
      return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: '${crt.uesrData[0].email}'+'${crt.uesrData[0].name}',
              version: QrVersions.auto,
              size: 300.0,
            ),
            SizedBox(height: 20.0),
            Text('Scan QR code',
            style: TextStyle(
              fontSize: 20
            ),),
          ],
        ),);
  },
    )
    ),
    );
  }
}
