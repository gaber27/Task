import 'package:bhi/components/comment.dart';
import 'package:bhi/constants/color.dart';
import 'package:bhi/constants/media.dart';
import 'package:bhi/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // This AppBar To make app with your ui but the best is remove it
      appBar: AppBar(toolbarHeight: 5.0),
        body: Stack(
          children: [
            _controller.value.isInitialized
                ? Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    VideoPlayer(_controller),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      icon: Icon(
                        color: secondColor,
                        size: 30,
                        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                      ),
                    ),
                  ],
              ),
            ),
                )
                : Container(),

            SizedBox.expand(

              child: DraggableScrollableSheet(
                expand: true,
                initialChildSize: bottomIntialSize,
                maxChildSize: 0.6,
                // minChildSize: 0.,
                builder: (BuildContext context, ScrollController scrollController) {
                  return ListView(
                    // controller: scrollController,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white30,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))

                                  ),
                                ),
                                Container(
                                  width: 60,
                                  height: 5,
                                  color: headColor,
                                ),

                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    AdvancedAvatar(
                                      child: Icon(
                                        Icons.account_circle,
                                        color: Colors.blue[400],
                                        size: 40,
                                      ),
                                    ),
                                    Text('purple-circle',style: TextStyle(color: headColor,fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1),)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Text('The Consistency Of These Welds',style: TextStyle(color: Colors.grey[400],fontSize: 20,fontWeight: FontWeight.w700,letterSpacing: 1),),
                                ),
                                SizedBox(height: 25,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0,right: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.rocket_outlined,color: headColor,size: 30,),
                                      Text(' BEST COMMENTS',style: TextStyle(color: headColor,fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1,),),
                                      IconButton(
                                          onPressed: (){
                                            setState(() {
                                              bottomIntialSize == 0.4 ?
                                              bottomIntialSize = 0.6:
                                              bottomIntialSize = 0.4 ;
                                            });
                                          },
                                          icon:

                                          Icon(
                                            bottomIntialSize == 0.3 ?
                                            Icons.keyboard_arrow_down_sharp:
                                            Icons.keyboard_arrow_up_sharp,

                                            color: headColor,size: 30,)),

                                    ],
                                  ),
                                ),
                                bottomIntialSize == 0.4?
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Add Comment',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[400]
                                      ),
                                      filled: true,
                                      fillColor: Colors.white30,
                                      border: OutlineInputBorder(

                                        borderRadius: BorderRadius.all(Radius.circular(10),

                                        )
                                      )
                                    ),
                                  ),
                                ):
                                    Container()

                              ],
                            ),
                            bottomIntialSize == 0.6?
                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        comment(img: Icons.engineering, name: 'Equal-Warining-8612 .', content: 'What kind of welder is this ? Expensive?', numOfLikes: '2.9K', time: "11h", isLike: true, isMain: true),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 18.0),
                                              child: comment(img: Icons.engineering, name: 'EllzgoersPro .', content: 'Laser Welder and yes .', numOfLikes: '2.3K', time: "10h", isLike: true, isMain: false),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 35.0),
                                              child: comment(img: Icons.person, name: 'Equal-Warining-8612 .', content: 'Like how much for one of these ?', numOfLikes: '2.9K', time: "5h", isLike: false, isMain: false),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: 'Add Comment',
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400]
                                            ),
                                            filled: true,
                                            fillColor: Colors.white30,
                                            border: OutlineInputBorder(

                                                borderRadius: BorderRadius.all(Radius.circular(10),

                                                )
                                            )
                                        ),
                                      ),
                                    )
                                  ],

                                )
                                :Container()




                          ],
                        ),
                        // child: ListView.builder(
                        //   controller: scrollController,
                        //   itemCount: 25,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return ListTile(title: Text('Item $index'));
                        //   },
                        // ),
                      ),
                    ],
                  );
                },
              ),
            ),


          ],

        ),

    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}