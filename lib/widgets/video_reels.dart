import 'package:card_swiper/card_swiper.dart';
import 'package:edu_reels/controller/reels_controller.dart';
import 'package:edu_reels/model/reels_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoReels extends StatefulWidget {
  // final List<Videos> videos;
  final index;

  const VideoReels({super.key, required this.index});

  @override
  State<VideoReels> createState() => _VideoReelsState();
}

class _VideoReelsState extends State<VideoReels> {
  late VideoPlayerController? _videoPlayerController;
  late ScrollController _scrollController;
  final _controller = Get.find<ReelsController>();
  // int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = null;
    _scrollController = ScrollController();
    /*if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
//here the sublist is already build
        completeList();
      });
    }*/
    _initialization();
  }

  /*completeList() {
//to go to the last item(in first position)
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
//reset the list to the full list
    setState(() {
      currentIndex = _controller.index.value;
    });
  }*/


  @override
  void dispose() {
    super.dispose();
    _videoPlayerController!.dispose();
    // _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (_videoPlayerController != null &&
            _videoPlayerController!.value.isInitialized)
        ? VideoPlayer(_videoPlayerController!)/*Swiper(
      itemCount: widget.videos.length,
      scrollDirection: Axis.vertical,
      onIndexChanged: (index) => _controller.index.value = index,
        itemBuilder: (context, index) => VideoPlayer(_videoPlayerController!),
    )*/
        : const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              backgroundColor: Colors.black,
            ),
          );
  }
//VideoPlayer(_videoPlayerController!)
  void _initialization() async {
    debugPrint("=======Index====== : ${widget.index}");

    final fileInfo =
        await checkCacheFor(_controller.videoList[widget.index].videoUrl);
    if (fileInfo == null) {
      _videoPlayerController = VideoPlayerController.networkUrl(
          Uri.parse(_controller.videoList[widget.index].videoUrl!));

      await _videoPlayerController!.initialize().then((value) {
        cachedForUrl(_controller.videoList[widget.index].videoUrl);
        _videoPlayerController!.play();
        _videoPlayerController!.setLooping(true);
        _videoPlayerController!.setVolume(1);
        setState(() {});
      });
    } else {
      final file = fileInfo.file;
      debugPrint("File Info: ${fileInfo.file.basename}");
      _videoPlayerController = VideoPlayerController.file(file);
      await _videoPlayerController!.initialize().then((value) {
        _videoPlayerController!.play();
        _videoPlayerController!.setLooping(true);
        _videoPlayerController!.setVolume(1);
        setState(() {});
      });
    }
  }

  Future<FileInfo?> checkCacheFor(String? url) async {
    final FileInfo? value = await DefaultCacheManager().getFileFromCache(url!);
    return value;
  }

//:cached Url Data
  void cachedForUrl(String? url) async {
    await DefaultCacheManager().getSingleFile(url!).then((value) {
      print('downloaded successfully done for $url');
    });
  }
}
