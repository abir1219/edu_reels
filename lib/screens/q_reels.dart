import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:edu_reels/controller/reels_controller.dart';
import 'package:edu_reels/model/reels_model.dart';
import 'package:edu_reels/widgets/video_reels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/slider_controller.dart';
import '../widgets/qreels_widget.dart';

class QReels extends StatefulWidget {
  const QReels({super.key});

  @override
  State<QReels> createState() => _QReelsState();
}

class _QReelsState extends State<QReels> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  final _controller = Get.find<ReelsController>();

  int index = 0;

  @override
  void initState() {
    super.initState();
    _controller.videoList.add(Videos(videoUrl: ""));
    // _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    // _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    /*Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentIndex < _controller.videoList.length) {
        currentIndex++;
        pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      } else {
        currentIndex = _controller.videoList.length;
      }
    });*/
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Index => ${_controller.index}");


    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: PageView(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              // physics: ClampingScrollPhysics(),
              children: [
                PageView.builder(
                  scrollDirection: Axis.vertical,
                  onPageChanged: (value) {
                    debugPrint("<<<<<Index>>>>>>>> $value  &&& ${_controller.videoList.length}");
                    if (value == _controller.videoList.length-1) {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 10),
                          curve: Curves.ease);
                    }
                  },
                  itemCount: _controller.videoList.length,
                  itemBuilder: (context, index) => VideoReels(index: index),
                ),
                /*Image.network(
                  "https://wallpapercave.com/wp/wp3246753.jpg",
                  fit: BoxFit.fill,
                ),*/
                Obx(() => Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        // aspectRatio: 16/9,
                        initialPage: 0,
                        viewportFraction: 1,
                        height: double.infinity, // Full-screen height
                        //initialPage: 0,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            //_currentIndex = index;
                            Get.find<SliderController>().index.value = index;
                          });
                        },
                      ),
                      items: _controller.imageList.map((item) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(item.imageUrl!),
                                ),
                              ),
                              /*margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Center(
                              child: Image.network(item.imageUrl!,fit: BoxFit.fill,)
                            ),*/
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Positioned(
                        bottom: 80.w,
                        child: DotsIndicator(
                          position: Get.find<SliderController>().index.value,
                          dotsCount: _controller.imageList.length,decorator: DotsDecorator(
                            color: Colors.grey,
                            activeColor: Colors.blue,
                            activeSize:const Size(18.0,8.0),
                            size:const Size(8.0,8.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            )
                        ),))
                  ],
                )),
                //     ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: footerTag(),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                // height: MediaQuery.of(context).size.height,
                //     color: Colors.red,
                margin: EdgeInsets.only(bottom: 100.w),
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    interactionWithUser(
                        icons: Icons.favorite_border,
                        count: "1.1k",
                        function: () {
                          debugPrint("Like");
                        }),
                    interactionWithUser(
                        icons: Icons.comment,
                        count: "1001",
                        function: () {
                          debugPrint("Comment");
                        }),
                    interactionWithUser(
                        icons: Icons.send,
                        count: "3.2k",
                        function: () {
                          debugPrint("Share");
                        }),
                    interactionWithUser(
                        icons: Icons.filter_alt_outlined,
                        function: () {
                          debugPrint("Share");
                        }),
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
