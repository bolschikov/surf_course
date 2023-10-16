import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget  {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            MainPersonalDataSection(
              imgPath: TestAppMocks.avatarPath,
              name: TestAppMocks.name,
              status: TestAppMocks.status,
            ),
            SizedBox(height: 10),
            MainCategoriesPanel(),
          ],
        )
      )
    );
  }
}

class MainPersonalDataSection extends StatelessWidget {
  final String name;
  final String imgPath;
  final String status;

  const MainPersonalDataSection({
    required this.name,
    required this.imgPath,
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCircleAvatar(
          radius: 60,
          imgPath: imgPath,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontFamily: 'Disket',
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: TestAppColors.textMe,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                status,
                style: const TextStyle(
                  fontSize: 13,
                  color: TestAppColors.secondaryText,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {  
  final double radius;  
  final String imgPath;  

  const CustomCircleAvatar({  
    required this.radius,  
    required this.imgPath,  
    Key? key,  
  }) : super(key: key);  

  @override  
  Widget build(BuildContext context) {  
    return SizedBox.square(  
      dimension: radius * 2,  
      child: Stack(  
        children: [  
          Container(  
            width: radius * 2,  
            height: radius * 2,  
            decoration: BoxDecoration(  
              shape: BoxShape.circle,  
              border: Border.all(  
                color: TestAppColors.avatarBorder,  
                width: 2.5,  
              ),  
              image: DecorationImage(  
                image: AssetImage(imgPath),  
                fit: BoxFit.cover,  
              ),  
            ),  
          ),    
        ],  
      ),  
    );  
  }  
}

class MainCategoriesPanel extends StatelessWidget {
  const MainCategoriesPanel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        CustomCard(
          title: TestAppStrings.aboutMeTitle,
          info: TestAppStrings.aboutMeInfo,
          iconPath: TestAppMocks.iconAboutPath,
          background: TestAppColors.secondary,
          fontName: 'Bauhas',
        ),
        SizedBox(height: 10),
        CustomCard(
          title: TestAppStrings.interestTitle,
          info: TestAppStrings.interestInfo,
          iconPath: TestAppMocks.iconInterestsPath,
          background: TestAppColors.secondary,
          fontName: 'Cyberpunk',
        ),
        SizedBox(height: 10),
        CustomCard(
          title: TestAppStrings.expTitle,
          info: TestAppStrings.expInfo,
          iconPath: TestAppMocks.iconExperiencePath,
          background: TestAppColors.secondary,
          fontName: 'Adventure',
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final Color? background;
  final String title;
  final String info;
  final String iconPath;
  final String fontName;

  const CustomCard({
    required this.title,
    required this.iconPath,
    required this.info,
    required this.fontName,
    this.background,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(TestAppColors.icon, BlendMode.srcIn),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: TextStyle( 
                    fontFamily: fontName,
                    color: TestAppColors.textAboutMe,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 35),
              Expanded(child: 
                Text(info,
                  style: TextStyle( 
                    color: TestAppColors.textAboutMe,
                    fontSize: 15,
                  ),
                )
              )
            ]
          )
        ]
      )
    );
  }
}