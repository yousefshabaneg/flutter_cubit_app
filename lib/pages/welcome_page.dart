import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_appp/cubit/app_cubits.dart';
import 'package:flutter_cubit_appp/misc/colors.dart';
import 'package:flutter_cubit_appp/widgets/app_large_text.dart';
import 'package:flutter_cubit_appp/widgets/app_text.dart';
import 'package:flutter_cubit_appp/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('img/' + images[index]),
            fit: BoxFit.cover,
          )),
          child: Container(
            margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(text: "Trips"),
                    AppText(
                      text: "Mountain",
                      size: 30,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: AppText(
                        text:
                            "Mountain hikes give you an incredible sense of freedom along with endurance test",
                        color: AppColors.textColor2,
                        size: 15,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ResponsiveButton(
                      width: 120,
                      onTap: () {
                        BlocProvider.of<AppCubits>(context).getData();
                      },
                    ),
                  ],
                ),
                Column(
                  children: List.generate(
                    3,
                    (indexDots) => Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      width: 8,
                      height: index == indexDots ? 25 : 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == indexDots
                            ? AppColors.mainColor
                            : AppColors.mainColor.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
