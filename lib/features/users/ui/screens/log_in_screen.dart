import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:pythagoras/animate_do.dart';
import 'package:pythagoras/bloc/bloc_class.dart';
import 'package:pythagoras/bloc/bloc_events.dart';
import 'package:pythagoras/bloc/bloc_states.dart';

import 'package:pythagoras/features/users/providers/auth_providers_user.dart';
import 'package:pythagoras/features/users/ui/screens/confirm_phone_screen.dart';
import 'package:pythagoras/features/users/ui/screens/sign_up_screen.dart';
import 'package:pythagoras/features/users/ui/widgets/card_phone-dialog.dart';
import 'package:pythagoras/features/users/ui/widgets/custom_Text_Field.dart';
import 'package:pythagoras/features/users/ui/widgets/custom_bottom.dart';
import 'package:pythagoras/services/sp_helper.dart';
import 'package:pythagoras/values/borders.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/constants.dart';
import 'package:pythagoras/values/images_name.dart';
import 'package:pythagoras/values/styles.dart';

import 'home_screen.dart';

class LogInScreen extends StatelessWidget {
  final GlobalKey<FormState> loginFormkey =
      GlobalKey<FormState>(debugLabel: '_loginFormKey');

  @override
  Widget build(BuildContext context) {
    final authProviderUserWithListen = Provider.of<AuthProviderUser>(context);
    final authProviderUserNoListen =
        Provider.of<AuthProviderUser>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            FadeIn(
              animate: true,
              duration: Duration(milliseconds: 1000),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: ScreenUtil().setHeight(350),
                    width: double.infinity,
                    child: SvgPicture.asset(
                      backgroundlogin,
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
            Transform.translate(
              offset: Offset(0, 150),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "مرحبا بك",
                      style: styleTitleLogIn,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(30),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                        key: loginFormkey,
                        child: Column(
                          children: [
                            SlideInUp(
                              animate: true,
                              duration: Duration(milliseconds: 1000),
                              child: CustomTextField(
                                keyboardType: TextInputType.number,
                                hintTitle: "رقم الهاتف",
                                icon: Icon(
                                  Icons.phone,
                                  size: 20,
                                ),
                                onSaved: authProviderUserWithListen.setMobile,
                                onValidate:
                                    authProviderUserWithListen.validateMobile,
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(15),
                            ),
                            SlideInUp(
                              animate: true,
                              duration: Duration(milliseconds: 1300),
                              child: CustomTextField(
                                hintTitle: "كلمة السر",
                                icon: Icon(
                                  Icons.lock,
                                  size: 20,
                                ),
                                onSaved: authProviderUserWithListen.setPassword,
                                onValidate:
                                    authProviderUserWithListen.validatePassword,
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(5),
                            ),
                            SlideInUp(
                              animate: true,
                              duration: Duration(milliseconds: 1600),
                              child: InkWell(
                                onTap: () {
                                  authProviderUserWithListen.setMobile(null);
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CardPhoneDialog();
                                    },
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      right: ScreenUtil().setWidth(50)),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "نسيت كلمة السر؟",
                                      style: styleForgetPassLogIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(30),
                            ),
                            SlideInUp(
                              animate: true,
                              duration: Duration(milliseconds: 1900),
                              child: CustomBottom(
                                title: "تسجيل دخول",
                                color: orangeColor,
                                route: () {
                                  authProviderUserNoListen.onSavedLoginForm(
                                      context, loginFormkey);
                                  // if (st == true) {
                                  //   BlocProvider.of<UserBloc>(context).add(
                                  //       LogInEvent(
                                  //           authProviderUserWithListen.mobile,
                                  //           authProviderUserWithListen
                                  //               .password));
                                  // }
                                },
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            SlideInUp(
                              animate: true,
                              duration: Duration(milliseconds: 2200),
                              child: InkWell(
                                onTap: () {
                                  authProviderUserWithListen
                                      .setImageProfile(null);
                                  push(context, SignUpScreen());
                                },
                                child: Container(
                                  width: ScreenUtil().setWidth(262),
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Text(
                                        "قم بإنشاء حساب",
                                        style: styleTextFieldLogIn.copyWith(
                                            color: orangeColor),
                                      ),
                                      Text(
                                        "ليس لديك حساب ؟ ",
                                        style: styleTextFieldLogIn,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            // SlideInUp(
            //   animate: true,
            //   duration: Duration(milliseconds: 1000),
            //   child: Transform.translate(
            //     offset: Offset(-120, 50),
            //     child: Align(
            //         alignment: Alignment.bottomLeft,
            //         child: Container(
            //             //flutt color: pinkColor,
            //             height: ScreenUtil().setHeight(230),
            //             width: ScreenUtil().setWidth(280),
            //             child: SvgPicture.asset(
            //               logbt,
            //               fit: BoxFit.fill,
            //               //color: pinkColor,
            //             ))),
            //   ),
            // ),
            SizedBox(
              height: ScreenUtil().setHeight(50),
              child: BlocBuilder<UserBloc, BlocStates>(
                builder: (context, state) {
                  if (state is TasksLoadingState) {
                    return Center(
                        // child: CircularProgressIndicator(),
                        );
                  } else if (state is EmptyTasksState) {
                    return Center(
                        // child: Text('Empty Tasks'),
                        );
                  } else if (state is TasksErrorState) {
                    // Fluttertoast.showToast(
                    //     msg: "رقم الهاتف او كلمة المرور غير صحيحة",
                    //     toastLength: Toast.LENGTH_SHORT,
                    //     gravity: ToastGravity.BOTTOM,
                    //     timeInSecForIosWeb: 3,
                    //     backgroundColor: Colors.red,
                    //     textColor: Colors.white,
                    //     fontSize: 16.0);
                    return Container();
                  } else if (state is UserLogedInState) {
                    String tok = state.token;
                    print("yyuyuyuyuuuuuuuuuuuuuuuuyuyuyuuyyuyu $tok");
                    SPHelper.spHelper.setToken(tok);
                    BlocProvider.of<UserBloc>(context).add(SettingsEvent());
                    Timer(Duration(seconds: 1), () async {
                       
                       BlocProvider.of<UserBloc>(context)
                        .add(MeStatusEvent(context));
                    });
                   
                   
                    //push(context, HomeScreen());
                    return Center();
                  }
                  if (state is MeStatusState) {
                    int phoneV = state.phoneVerified;

                    Provider.of<AuthProviderUser>(context)
                        .setPhoneVerified(phoneV);
                    // if (phoneV == 1) {
                    //   push(context, HomeScreen());
                    //   return Container();
                    // }else{
                    //   push(context, ConfirmPhoneScreen());
                    //   return Container();
                    // }
                    // push(context, HomeScreen());

                  }
                  if (state is SettingsState) {
                    Map mySetting = state.data["setting"];

                    Provider.of<AuthProviderUser>(context)
                        .setInitialVideo(mySetting["guide_video_url"]);

                    Provider.of<AuthProviderUser>(context)
                        .settitlePay(mySetting["payment_guide_title"]);
                    Provider.of<AuthProviderUser>(context)
                        .setsubTitlePay(mySetting["payment_guide_description"]);
                    Provider.of<AuthProviderUser>(context)
                        .settitleLive(mySetting["online_videos_guide_title"]);
                    Provider.of<AuthProviderUser>(context).setsubTitleLive(
                        mySetting["online_videos_guide_description"]);

                    //dpush(context, LogInScreen());
                    return Container();
                  }

                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
