import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pythagoras/animate_do.dart';
import 'package:pythagoras/bloc/bloc_class.dart';
import 'package:pythagoras/bloc/bloc_events.dart';
import 'package:pythagoras/bloc/bloc_states.dart';
import 'package:pythagoras/components/models/unit.dart';
import 'package:pythagoras/features/users/ui/screens/watch_classes.dart';
import 'package:pythagoras/features/users/ui/widgets/LinearPercentIndicator2.dart';
import 'package:pythagoras/features/users/ui/widgets/card_details.dart';
import 'package:pythagoras/values/borders.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/constants.dart';
import 'package:pythagoras/values/shadows.dart';
import 'package:pythagoras/values/styles.dart';

class ClassesDetails extends StatefulWidget {
  String level;
  String term;
  Color color;
  ClassesDetails({this.level, this.term, this.color});

  @override
  _ClassesDetailsState createState() => _ClassesDetailsState();
}

class _ClassesDetailsState extends State<ClassesDetails> {
  // @override
  // void initState() {
  //   BlocProvider.of<UserBloc>(context)
  //       .add(UnitEvent(widget.term, widget.level));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        // actions: [
        //   IconButton(
        //       icon: Icon(
        //         Icons.notifications,
        //         size: 25,
        //         color: whiteColor,
        //       ),
        //       onPressed: () {
        //         // push(context , NotificationSocket());
        //       })
        // ],
        // leading: Icon(Icons.share),
        backgroundColor: widget.color,
        title: Column(
          children: [
            Text(

              widget.level == "1"
                  ? "الصف الخامس الابتدائي"
                  : widget.level == "2"
                      ? "الصف السادس الابتدائي"
                      : widget.level == "3"
                          ? "الصف السايع الابتدائي"
                          : widget.level == "4"
                              ? "الصف الثامن الابتدائي"
                              : widget.level == "5"
                                  ? "الصف التاسع الابتدائي"
                                  : widget.level == "6"
                                      ? "الصف العاشر الابتدائي"
                                      : widget.level == "7"
                                          ? "الصف الحادي عشر "
                                          : widget.level == "8"
                                              ? "الصف الثاني عشر "
                                              : "",
              style: styleTitleAppBarYears,
            ),
            Text(
                widget.term == "1"
                    ? "الفصل الدراسي الأول "
                    : widget.term == "2"
                        ? "الفصل الدراسي الثاني "
                        : "",
                style: styleTitleAppBarYears.copyWith(fontSize: 10)),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            // Container(
            //   margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
            //   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            //   height: ScreenUtil().setHeight(55),
            //   width: ScreenUtil().setWidth(350),
            //   decoration: BoxDecoration(
            //       color: widget.color,
            //       borderRadius: borderRadius6,
            //       boxShadow: <BoxShadow>[boxShadow6]),
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             "الفصل الدراسي الاول",
            //             style: styleSlideDetails.copyWith(fontSize: 8),
            //           ),
            //           Text(
            //             "الصف الخامس الابتدائي",
            //             style: styleSlideDetails,
            //           ),
            //         ],
            //       ),
            //       SizedBox(
            //         height: ScreenUtil().setHeight(5),
            //       ),
            //       LinearPercentIndicator2(
            //         isRTL: true,
            //         width: ScreenUtil().setWidth(320),
            //         animation: true,
            //         lineHeight: 12.0,
            //         animationDuration: 1500,
            //         percent: .5,
            //         center: Text(
            //           "50.0%",
            //           style: TextStyle(fontSize: 9),
            //         ),
            //         linearStrokeCap: LinearStrokeCap2.roundAll,
            //         progressColor: widget.color,
            //         backgroundColor: whiteColor,
            //         fillColor: whiteColor,
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: ScreenUtil().setHeight(5),
            ),
            Container(
              
              height: ScreenUtil().setHeight(646),
              width: double.infinity,
              child: BlocBuilder<UserBloc, BlocStates>(
                builder: (context, state) {
                  if (state is TasksLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is EmptyTasksState) {
                    return Center(
                      child: Text('Empty Tasks'),
                    );
                  } else if (state is TasksErrorState) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is UnitState) {
                    List<UnitData> unitdata = state.data;
                    print("objectdddddddddddddd ${unitdata.length}");

                    return Container(
                      child: ListView.builder(
                        itemCount: unitdata.length,
                        itemBuilder: (context, index) {
                          return Directionality(
                              textDirection: TextDirection.rtl,
                              child: InkWell(
                                  onTap: () {
                                    BlocProvider.of<UserBloc>(context)
                                        .add(VideoEvent());
                                    push(
                                        context,
                                        WatchClasses(
                                          level: widget.level,
                                          term: widget.level,
                                          unitId: unitdata[index].id,
                                          color: widget.color,
                                        ));
                                  },
                                  child: SlideInUp(
                                      animate: true,
                                      duration: Duration(
                                          milliseconds: 1000 + (300 * index)),
                                      child: CardDetails(
                                        unitdata: unitdata[index],
                                        color: widget.color,
                                        index:index
                                      ))));
                        },
                      ),
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
