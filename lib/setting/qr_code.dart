import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:our_gym/shared/network/local/cache_helper.dart';
import 'package:our_gym/style/colors.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatelessWidget {
  const QRCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
      body:   Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        QrImageView(
          data: '${CacheHelper.getData(key: 'email').toString()}'+'${CacheHelper.getData(key: 'name').toString()}',
          version: QrVersions.auto,
          size: 300.0,
        ),
        SizedBox(height: 20.0),
        Text('Scan QR code',
          style: TextStyle(
              fontSize: 20
          ),),
      ],
    ),)
    );
  }
}
