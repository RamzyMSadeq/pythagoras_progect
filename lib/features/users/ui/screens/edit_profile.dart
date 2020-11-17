import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pythagoras/bloc/bloc_class.dart';
import 'package:pythagoras/bloc/bloc_states.dart';
import 'package:pythagoras/features/users/providers/auth_providers_user.dart';
import 'package:pythagoras/features/users/ui/widgets/custom_Text_Field.dart';
import 'package:pythagoras/features/users/ui/widgets/custom_bottom.dart';
import 'package:pythagoras/features/users/ui/widgets/custom_dropdown.dart';
import 'package:pythagoras/values/borders.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/styles.dart';

class EditProfile extends StatelessWidget {
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormState> editProfileFormkey =
      GlobalKey<FormState>(debugLabel: '_editProfileFormkey');

  @override
  Widget build(BuildContext context) {
    final authProviderUserWithListen = Provider.of<AuthProviderUser>(context);
    final authProviderUserNoListen =
        Provider.of<AuthProviderUser>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        title: Text(
          "بياناتك",
          style: styleEditeAppBar,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: editProfileFormkey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            CustomTextField(
              hintTitle: "الاسم",
              icon: Icon(
                Icons.person,
                size: 20,
              ),
              onSaved: authProviderUserWithListen.setName,
              onValidate: authProviderUserWithListen.validateName,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            CustomDropDown(
              type: "gender",
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: InkWell(
                onTap: () {
                  return showRoundedDatePicker(
                    context: context,
                    height: 320,
                    theme: ThemeData(primarySwatch: Colors.pink),
                    initialDate: selectedDate,
                    firstDate: DateTime(selectedDate.year - 100),
                    lastDate: DateTime(selectedDate.year + 10),
                    borderRadius: 16,
                  );
                },
                child: Container(
                  height: ScreenUtil().setHeight(45),
                  width: double.infinity,
                  padding: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                      color: backgroundTextFieldColor.withOpacity(.12),
                      borderRadius: borderRadius22),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.date_range,
                          color: Colors.grey[600],
                        ),
                      ),
                      Expanded(
                          flex: 12,
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              "تاريخ الميلاد",
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontFamily: "Ithrabold",
                                  fontSize: 14),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            CustomDropDown(
              type: "class",
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            CustomDropDown(
              type: "state",
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),

            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            CustomTextField(
              hintTitle: "كلمة السر",
              icon: Icon(
                Icons.lock,
                size: 20,
              ),
              onSaved: authProviderUserWithListen.setPassword,
               onValidate: authProviderUserWithListen.validatePassword,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            CustomTextField(
              hintTitle: "اعد كتابة كلمة السر",
              icon: Icon(
                Icons.lock,
                size: 20,
              ),
              onSaved: authProviderUserWithListen.setConfirmPassword,
               onValidate: authProviderUserWithListen.validateConfirmPassword,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: ScreenUtil().setWidth(75),
                    child: Divider(
                      thickness: 2,
                      endIndent: 20,
                    )),
                Text(
                  "معلومات ولي الامر",
                  style: styleTitleSignUpLight,
                ),
                Container(
                    width: ScreenUtil().setWidth(75),
                    child: Divider(
                      thickness: 2,
                      endIndent: 20,
                    ))
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            CustomTextField(
              hintTitle: "اسم ولي الامر",
              icon: Icon(
                Icons.person,
                size: 20,
              ),
              onSaved: authProviderUserWithListen.setFatherName,
              onValidate: authProviderUserWithListen.validateFatherName,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            CustomTextField(
              hintTitle: "صلة القرابة بولي الامر",
              icon: Icon(
                Icons.group,
                size: 20,
              ),
              onSaved: authProviderUserWithListen.setLink,
              onValidate: authProviderUserWithListen.validateLink,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            Container(
              margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(50),
                right: ScreenUtil().setWidth(50),
              ),
              width: ScreenUtil().setWidth(202),
              child: CustomBottom(
                title: "تعديل",
                color: orangeColor,
                route: () {
                  authProviderUserNoListen.onSavedEditProfileForm(
                      context, editProfileFormkey);

                  // push(context, LogInScreen());
                },
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
