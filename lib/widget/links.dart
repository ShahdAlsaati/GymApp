import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksWidget extends StatelessWidget {
  String url;
  String title;
  String path;
  void launchUrl(String url) async {

    if (await canLaunch(url)) {

      await launch(url);
    } else {
      Get.snackbar(
        "Error",
        "Could not launch $url",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  LinksWidget(this.url,this.title,this.path);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
           launchUrl(url);

        },
        child: Container(
          height: 240,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Stack(

              alignment: AlignmentDirectional.bottomCenter,

              children: [
                Image(image: NetworkImage(path),
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
                ),
                Container(
                  color: Colors.black45,
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0,left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        child: Text(

                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 30,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )

    );
  }
}
