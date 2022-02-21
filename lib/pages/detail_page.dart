import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_appp/cubit/app_cubit_states.dart';
import 'package:flutter_cubit_appp/cubit/app_cubits.dart';
import 'package:flutter_cubit_appp/misc/colors.dart';
import 'package:flutter_cubit_appp/widgets/app_buttons.dart';
import 'package:flutter_cubit_appp/widgets/app_large_text.dart';
import 'package:flutter_cubit_appp/widgets/app_text.dart';
import 'package:flutter_cubit_appp/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is DetailState) {
            var place = state.place;
            selectedIndex = place.people - 1;
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "http://mark.bslmeiyu.com/uploads/" +
                                    place.img),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 40,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 230,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                  text: place.name,
                                  color: Colors.black.withOpacity(0.8)),
                              AppLargeText(
                                  text: "\$${place.price}",
                                  color: AppColors.mainColor),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: AppColors.mainColor),
                              SizedBox(width: 5),
                              AppText(
                                text: place.location,
                                color: AppColors.textColor1,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                Wrap(
                                  children: List.generate(
                                    5,
                                    (index) => Icon(
                                        index < place.stars
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: AppColors.starColor),
                                  ),
                                ),
                                SizedBox(width: 10),
                                AppText(
                                  text: "(${place.stars}.0)",
                                  color: AppColors.textColor2,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          AppLargeText(
                            text: "People",
                            color: Colors.black.withOpacity(0.8),
                            size: 22,
                          ),
                          SizedBox(height: 10),
                          AppText(
                            text: "Number of people in your group",
                            color: AppColors.mainColor,
                          ),
                          SizedBox(height: 15),
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: AppButton(
                                  size: 50,
                                  color: index == selectedIndex
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: index == selectedIndex
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  borderColor: AppColors.buttonBackground,
                                  text: "${(index + 1).toString()}",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 40,
                            child: AppText(
                              text: place.description,
                              color: AppColors.mainTextColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        AppButton(
                          size: 60,
                          color: AppColors.textColor2,
                          backgroundColor: Colors.white,
                          borderColor: AppColors.textColor2,
                          isIcon: true,
                          icon: Icons.favorite_border_outlined,
                        ),
                        ResponsiveButton(isResponsive: true)
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
