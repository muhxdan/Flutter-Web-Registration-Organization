import 'package:flutter/material.dart';

import '../../utils/appConstants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 44),
      child: Column(
        children: [
          const Section1(),
          AppConstants.height(150),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/group2.png",
                width: 392,
                height: 360,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 546,
                    child: Column(
                      children: [
                        const Text(
                          AppConstants.homeText4,
                          style: TextStyle(
                            fontSize: 38,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AppConstants.height(24),
                        const Text(
                          AppConstants.homeText5,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class Section1 extends StatelessWidget {
  const Section1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 546,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppConstants.homeText1,
                style: TextStyle(
                  fontSize: 64,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppConstants.height(24),
              const Text(
                AppConstants.homeText2,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              AppConstants.height(48),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: const Size(200, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                child: const Text(
                  AppConstants.homeText3,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          "assets/images/group1.png",
          width: 415,
          height: 531,
        )
      ],
    );
  }
}
