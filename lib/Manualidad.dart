import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mara/Homepage.dart';
import 'package:mara/providers/manulidad_provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'Material_build.dart';
import 'enums/view_state.dart';

class Manualidad extends StatefulWidget {

  String manualidadSubTitle;
  String manualidadInstruction;
  String manualidadMaterials;
  String manualidadVideoURl;
  bool manualidadVideo=false;
  VideoPlayerController controller;

  Manualidad({this.manualidadSubTitle,this.manualidadInstruction,this.manualidadMaterials,this.manualidadVideo,this.manualidadVideoURl,this.controller});


  @override
  _ManualidadState createState() => _ManualidadState();
}

class _ManualidadState extends State<Manualidad> {

  Future<void> initializeVideoPlayerFuture;


  @override
  void initState() {
    widget.controller = VideoPlayerController.network(widget.manualidadVideoURl);
    initializeVideoPlayerFuture = widget.controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {

      });
    },
    );
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    widget.controller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ManulidadProvider(),
      child: Consumer<ManulidadProvider>(
        builder: (ctx, model, child) {
          return Scaffold(
            body: ModalProgressHUD(
              inAsyncCall:model.state == ViewState.busy,
              opacity: 0.5,
              progressIndicator: CircularProgressIndicator(
                color: activeColor,
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color(0xFFEDECFF),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 470.h),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white24,
                    height: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50.h),
                          height: 40.h,
                          width: double.infinity,
                          child: ListTile(
                            leading: TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.only(),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                              child: Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_outlined,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            title: Text(
                              'Manualidad',
                              style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        widget.manualidadVideo?ClipRRect(
                          borderRadius: BorderRadius.circular(30.h),
                          child: Container(
                              margin: EdgeInsets.only(top: 55.h, right: 20.w, left: 20.w),
                            height: 217.h,
                            width: double.infinity,
                            child:  widget.controller.value.isInitialized
                                ? AspectRatio(
                              aspectRatio: widget.controller.value.aspectRatio,
                              child: GestureDetector(
                                onTap: ()
                                {
                                  setState(() {
                                    // If the video is playing, pause it.
                                    if (widget.controller.value.isPlaying) {
                                      widget.controller.pause();
                                    } else {
                                      // If the video is paused, play it.
                                      widget.controller.play();
                                    }
                                  });

                                },
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: <Widget>[

                                    VideoPlayer(widget.controller),
                                    ClosedCaption(text: null),
                                    // Here you can also add Overlay capacities
                                    VideoProgressIndicator(
                                      widget.controller,
                                      allowScrubbing: true,
                                      padding: EdgeInsets.all(3),
                                      colors: VideoProgressColors(
                                          playedColor: Theme.of(context).primaryColor),
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: Container(
                                        height: 30.h,
                                        width: 50,
                                        child: Icon(
                                          widget.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                          color: Color(0xFF2D2AF6),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                                : Container(
                              height: 250,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),

                            // FutureBuilder(
                            //   future: _initializeVideoPlayerFuture,
                            //   builder: (context, snapshot) {
                            //     if (snapshot.connectionState == ConnectionState.done) {
                            //       // If the VideoPlayerController has finished initialization, use
                            //       // the data it provides to limit the aspect ratio of the video.
                            //       return AspectRatio(
                            //         aspectRatio: _controller.value.aspectRatio,
                            //         // Use the VideoPlayer widget to display the video.
                            //         child: Container(
                            //             height: MediaQuery.of(context).size.height/2,
                            //             child: VideoPlayer(_controller,
                            //
                            //             )),
                            //       );
                            //     } else {
                            //       // If the VideoPlayerController is still initializing, show a
                            //       // loading spinner.
                            //       return const Center(
                            //         child: CircularProgressIndicator(),
                            //       );
                            //     }
                            //   },
                            // ),


                          ),
                        ):
                        Container(
                          margin:
                              EdgeInsets.only(top: 55.h, right: 20.w, left: 20.w),
                          width: double.infinity,
                          height: 217.h,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30.h)),
                          child: Stack(children: [
                            Image.asset(
                              'Assets/Images/s2.png',
                              fit: BoxFit.fill,
                              width: 367.w,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.play_circle_outline_outlined,
                                size: 70.sp,
                                color: Colors.white,
                              ),
                            )
                          ]),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 10.h, right: 30.w, left: 30.w),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.w, vertical: 15.h),
                          width: double.infinity,
                          height: 194.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.h),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.sp, horizontal: 10.sp),
                                decoration: BoxDecoration(
                                    color: Color(0xFF2D2AF6),
                                    borderRadius: BorderRadius.circular(8.sp)),
                                child: Text(
                                  'Materiales',
                                  style: TextStyle(
                                      fontSize: 21.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ),
                              widget.manualidadMaterials==null || widget.manualidadMaterials ==""?Text("Materials here"):Text(widget.manualidadMaterials),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(
                              //       horizontal: 2.sp, vertical: 7.sp),
                              //   child: Column(
                              //     children: [
                              //       Materials_build(
                              //         quantitiy: '1x',
                              //         item: 'Tigeras',
                              //       ),
                              //       Materials_build(
                              //         quantitiy: '2x',
                              //         item: 'Rollos de papel',
                              //       ),
                              //       Materials_build(
                              //         quantitiy: '1x',
                              //         item: 'Pintura Acrílica',
                              //       ),
                              //       Materials_build(
                              //         quantitiy: '1x',
                              //         item: 'Pincel',
                              //       ),
                              //       Materials_build(
                              //         quantitiy: '1x',
                              //         item: 'Rollo de cartón A4',
                              //       ),
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 10.h, right: 30.w, left: 30.w),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.w, vertical: 15.h),
                          width: double.infinity,
                          height: 248.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.h),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.sp, horizontal: 10.sp),
                                decoration: BoxDecoration(
                                    color: Color(0xFF2D2AF6),
                                    borderRadius: BorderRadius.circular(8.sp)),
                                child: Text(
                                  'Intrucciones',
                                  style: TextStyle(
                                      fontSize: 21.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                     widget.manualidadInstruction==null || widget.manualidadInstruction==""?Text("instruction here") :Text(
                                    widget.manualidadInstruction,
                                        // 'Seguiremos con los relieves. Para hacerlo utilizaremos pasta de modelar o estuco, una espátula y una plantilla.La plantilla la podemos fijar con cinta de carrocero sobre la caja.\n\n En los huecos podemos poner el estuco, debemos aplicarlo intentando dejarlo en una capa lisa y homogénea. Dejamos secar y lijamos para quitar imperfecciones.Vamos a ir haciendo estos adornos por las distintas partes de la caja.También vamos a realizar una linea roja en la parte superior de la caja.\n\nPara ello vamos a poner tres tiras de cinta de carrocero una al lado de otra para finalmente retirar la central y pintarla con  una pintura roja burdeos. Una vez pintado podemos retirar las cintas.',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          wordSpacing: 3.sp,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}





class VideoPlayerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Video Player Demo',
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
   VideoPlayerController _controller;
   Future<void> _initializeVideoPlayerFuture;

   String videoUrl;

  @override
  void initState() {
    _controller = VideoPlayerController.network("https://firebasestorage.googleapis.com/v0/b/mara-f8247.appspot.com/o/demo_video.mp4?alt=media&token=4d198059-2ed5-4f73-95c1-473cff7d6e77");
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
    // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    setState(() {

    });
    },
    );
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Butterfly Video'),
      ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: Container(
        height: MediaQuery.of(context).size.height/2,
        width: double.infinity,
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the VideoPlayerController has finished initialization, use
              // the data it provides to limit the aspect ratio of the video.
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video.
                child: Container(
                  height: MediaQuery.of(context).size.height/2,
                    child: VideoPlayer(_controller)),
              );
            } else {
              // If the VideoPlayerController is still initializing, show a
              // loading spinner.
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
