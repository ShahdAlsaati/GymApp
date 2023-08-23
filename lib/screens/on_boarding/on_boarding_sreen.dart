import 'package:flutter/material.dart';
import 'package:gym/screens/login_screen/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../style/colors.dart';


class OnBoarding{
  final imageAssets;
  final title;
  final description;

  OnBoarding(this.imageAssets, this.title, this.description);

}
class onBoardingSreen extends StatefulWidget {
  @override
  State<onBoardingSreen> createState() => _onBoardingSreenState();
}

class _onBoardingSreenState extends State<onBoardingSreen> {
  List<OnBoarding> baording=[
    OnBoarding('assets/images/gym5.jpg',
        'FITNESS',
        'description'),
    OnBoarding('assets/images/gym6.jpg',
        'POWERLIFTING',
        'description'),
    OnBoarding('assets/images/gym7.jpg',
        'YOGA',
        'description'),
  ];
  var pageController=PageController();
  bool isLast=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: onBoardingColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: onBoardingColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(child: PageView.builder(
              onPageChanged: (int index){
      if(index==baording.length-1){
           setState((){
             isLast=true;
           });
      }
      else{
        setState((){
          isLast=false;
        });
      }

      },
              physics: BouncingScrollPhysics(),
              controller: pageController,
              itemBuilder:(context,index)=>
                buildBoardingItem(baording[index]),
              itemCount: baording.length,
            ),),
            SizedBox(
              height:40 ,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller:pageController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.orangeAccent,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 5
                    ),
                    count:baording.length),
                Spacer(),
    FloatingActionButton(
    backgroundColor: Colors.orange,
    child: Icon(

    Icons.arrow_forward_ios,
      color: Colors.black,
    ),

    onPressed: (){
    if(isLast)
    {
      navigateTo(context,
    LoginScreen()
    );
    }
    else{
    pageController.nextPage(
    duration: Duration(
    milliseconds: 750,
    ),
    curve: Curves.fastLinearToSlowEaseIn);
    }}),


              ],
            )
          ],
        ),
      )
    );
  }

  Widget buildBoardingItem(OnBoarding model)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(image: AssetImage(
            '${model.imageAssets}',

        ),
          fit: BoxFit.fitWidth,

        ),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
      ),

      Text(
        '${model.description}',
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold
        ),
      ),
    ],
  );

  void navigateTo(context,Widget)=>Navigator.push(context,
    MaterialPageRoute(
      builder:(context)=>Widget,
    ),
  );

  void navigateAndFinish(context,Widget)=>Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder:(context)=>Widget,
    ),
        (Route<dynamic> route)=>false,
  );
}
