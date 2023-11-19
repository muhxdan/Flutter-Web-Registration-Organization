import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js; // Import JavaScript interop
import '../../utils/appConstants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> goToWebPage(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 44),
      child: Column(
        children: [
          const Section1(),
          AppConstants.height(150),
          const Section2(),
          AppConstants.height(120),
          const Section3(),
          AppConstants.height(150),
          const SectionFooter(),
        ],
      ),
    );
  }
}

class SectionFooter extends StatelessWidget {
  const SectionFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppConstants.height(80),
            Container(
              constraints: const BoxConstraints(maxWidth: 1152),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 432,
                    height: 246,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/logo_white.png",
                              width: 70,
                              height: 70,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              "assets/images/logo_hima_white.png",
                              width: 60,
                              height: 60,
                            ),
                          ],
                        ),
                        AppConstants.height(30),
                        const Text(
                          AppConstants.homeText12,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        AppConstants.height(50),
                        const SizedBox(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SocialMediaList(
                                image: "assets/images/ic_youtube.svg",
                                url: "https://www.youtube.com/@utdiofficial",
                              ),
                              SocialMediaList(
                                image: "assets/images/ic_instagram.svg",
                                url: "https://www.instagram.com/utdiofficial/",
                              ),
                              SocialMediaList(
                                image: "assets/images/ic_google.svg",
                                url: "https://www.utdi.ac.id/",
                              ),
                              SocialMediaList(
                                image: "assets/images/ic_linkedin.svg",
                                url:
                                    "https://www.linkedin.com/school/utdiofficial/",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 517,
                    height: 248,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ListInfoUniv(
                          title: "Address:",
                          desc: AppConstants.homeText13,
                        ),
                        AppConstants.height(25),
                        const ListInfoUniv(
                          title: "Phone:",
                          desc: AppConstants.homeText14,
                        ),
                        AppConstants.height(25),
                        const ListInfoUniv(
                          title: "Email:",
                          desc: AppConstants.homeText15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 1152,
              ),
              child: const Divider(
                color: Colors.white,
              ),
            ),
            AppConstants.height(30),
            const SizedBox(
              width: double.infinity,
              child: Text(
                AppConstants.homeText16,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            AppConstants.height(30),
          ],
        ),
      ),
    );
  }
}

class ListInfoUniv extends StatelessWidget {
  final String title, desc;
  const ListInfoUniv({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppConstants.height(6),
        Text(
          desc,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

class SocialMediaList extends StatelessWidget {
  final String url, image;
  const SocialMediaList({
    super.key,
    required this.url,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        String url = this.url;
        js.context.callMethod('open', [url, '_blank']);
      },
      icon: SvgPicture.asset(
        image,
      ),
      splashRadius: 25,
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 1152,
      ),
      child:  Column(
        children: [
          Text(
            AppConstants.homeTitleBenefit,
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          const SizedBox(
            width: 560,
            child: Text(
              AppConstants.homeDescBenefit,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Section3Item(
                image: "assets/images/section2-1.png",
                title: AppConstants.homeText6,
                desc: AppConstants.homeText9,
              ),
              Section3Item(
                image: "assets/images/section2-2.png",
                title: AppConstants.homeText7,
                desc: AppConstants.homeText10,
              ),
              Section3Item(
                image: "assets/images/section2-3.png",
                title: AppConstants.homeText8,
                desc: AppConstants.homeText11,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Section3Item extends StatelessWidget {
  final String image, title, desc;
  const Section3Item(
      {super.key,
      required this.image,
      required this.title,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Image.asset(
              image,
              width: 55,
            ),
          ),
          AppConstants.height(15),
          Text(
            title,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
          ),
          AppConstants.height(16),
          Text(
            desc,
            style: const TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 1115,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/img_home2.png",
            width: 462,
            height: 450.68,
          ),
          Column(
            children: [
              SizedBox(
                width: 546,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      AppConstants.homeText4,
                      style: TextStyle(
                        fontSize: 27,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
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
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 1152,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 590,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  AppConstants.homeText1,
                  style: TextStyle(
                    fontSize: 55,
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                  ),
                ),
                 Text(
                  AppConstants.homeText1_2,
                  style: TextStyle(
                    fontSize: 55,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppConstants.height(24),
                const Text(
                  AppConstants.homeText2,
                  style: TextStyle(
                    fontSize: 16,
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
            "assets/images/img_home1.png",
            width: 534,
            height: 455,
          )
        ],
      ),
    );
  }
}
