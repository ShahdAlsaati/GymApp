import 'package:flutter/material.dart';
import 'package:our_gym/style/colors.dart';

class CustumListTile extends StatelessWidget {
  IconData icon;
  String text;
  final VoidCallback? onTap;
  //Function onTap;
  CustumListTile(this.icon,this.text,this.onTap);
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade100)
        )
      ),
      child: InkWell(
        splashColor: Colors.lightBlue,
        onTap:onTap,
        child: Container(
          height: 50,
          color: pageColor,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                      icon,
                    color: Colors.brown,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.brown
                    ),
                  ),
                ],
              ),

              Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}
