import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  final Function(int) onChange;

  const HeightWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  _HeightWidgetState createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  int _height = 150;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(

          elevation: 12,
          shape: const RoundedRectangleBorder(),
          child: Column(
            children: [
              SizedBox(height: 20,),
              const Text(
                "Height",
                style: TextStyle(fontSize: 25, color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _height.toString(),
                    style: const TextStyle(fontSize: 40),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "cm",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  )
                ],
              ),
              Slider(
                activeColor:Colors.orangeAccent,
                min: 0,
                max: 240,
                value: _height.toDouble(),
                thumbColor: Colors.orange,
                onChanged: (value) {
                  setState(() {
                    _height = value.toInt();
                  });
                  widget.onChange(_height);
                },
              )
            ],
          )),
    );
  }
}