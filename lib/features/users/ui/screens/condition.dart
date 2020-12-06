import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/styles.dart';

class Conditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: pinkColor,
        title: Column(
          children: [
            Image.asset(
              'assets/images/qwd.png',
              fit: BoxFit.fill,
              height: 30,
            ),
            Text("متعة تعلم الرياضيات", style: styleSubLogoLight),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        // color: pinkColor,
        child: ListView(
          children: [
            // FadeIn(
            //   animate: true,
            //   duration: Duration(milliseconds: 1000),
            //   child: Align(
            //       alignment: Alignment.topCenter,
            //       child: Container(
            //         height: ScreenUtil().setHeight(200),
            //         width: double.infinity,
            //         child: SvgPicture.asset(
            //           backgroundlogin,
            //           fit: BoxFit.fill,
            //         ),
            //       )),
            // ),

            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            ///////////////////////////////////////////////////////////
              Text(
              "سياسة الخصوصية",
              style: styleForgetPassLogIn.copyWith(fontSize: 22),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
                  Text(
              "الخصوصية وبيان سريّة المعلومات",
              style: styleForgetPassLogIn.copyWith(fontSize: 22),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
                 Text(
                   "نقدر مخاوفكم واهتمامكم بشأن خصوصية بياناتكم على شبكة الإنترنت.لقد تم إعداد هذه السياسة لمساعدتكم في تفهم طبيعة البيانات التي نقوم بتجميعها منكم عند زيارتكم لموقعنا على شبكة الانترنت وكيفية تعاملنا مع هذه البيانات الشخصية.",
                    style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
             Text(
                    "التصفح",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "لم نقم بتصميم هذا الموقع من أجل تجميع بياناتك الشخصية من جهاز الكمبيوتر الخاص بك أثناء تصفحك لهذا الموقع, وإنما سيتم فقط استخدام البيانات المقدمة من قبلك بمعرفتك ومحض إرادتك.",
                      style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),

                   Text(
                    "عنوان بروتوكول شبكة الإنترنت (IP)",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "في أي وقت تزور فيه اي موقع انترنت بما فيها هذا الموقع , سيقوم السيرفر المضيف بتسجيل عنوان بروتوكول شبكة الإنترنت   (IP) الخاص بك , تاريخ ووقت الزيارة ونوع متصفح الإنترنت الذي تستخدمه والعنوان URL الخاص بأي موقع من مواقع الإنترنت التي تقوم بإحالتك إلى الى هذا الموقع على الشبكة.",
                      style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),

                         Text(
                    "عمليات المسح على الشبكة",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "إن عمليات المسح التي نقوم بها مباشرة على الشبكة تمكننا من تجميع بيانات محددة مثل البيانات المطلوبة منك بخصوص نظرتك وشعورك تجاه موقعنا.تعتبر ردودك ذات أهمية قصوى , ومحل تقديرنا حيث أنها تمكننا من تحسين مستوى موقعنا, ولك كامل الحرية والإختيار في تقديم البيانات المتعلقة بإسمك والبيانات الأخرى.",
                      style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),



                                    Text(
                    "الروابط بالمواقع الأخرى على شبكة الإنترنت",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "قد يشتمل موقعنا على روابط بالمواقع الأخرى على شبكة الإنترنت. او علانات من مواقع اخرى مثل Google AdSense ولا نعتبر مسئولين عن أساليب تجميع البيانات من قبل تلك المواقع, يمكنك الاطلاع على سياسات السرية والمحتويات الخاصة بتلك المواقع التي يتم الدخول إليها من خلال أي رابط ضمن هذا الموقع.",
                      style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                     Text(
                       "نحن قد نستعين بشركات إعلان لأطراف ثالثة لعرض الإعلانات عندما تزور موقعنا على الويب. يحق لهذه الشركات أن تستخدم معلومات حول زياراتك لهذا الموقع ولمواقع الويب الأخرى (باستثناء الاسم أو العنوان أو عنوان البريد الإلكتروني أو رقم الهاتف)، وذلك من أجل تقديم إعلانات حول البضائع والخدمات التي تهمك. إذا كنت ترغب في مزيد من المعلومات حول هذا الأمر وكذلك إذا كنت تريد معرفة الاختيارات المتاحة لك لمنع استخدام هذه المعلومات من قِبل هذه الشركات ، فالرجاء النقر هنا.",
                      style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),

                                            Text(
                    "إفشاء المعلومات",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "سنحافظ في كافة الأوقات على خصوصية وسرية كافة البيانات الشخصية التي نتحصل عليها. ولن يتم إفشاء هذه المعلومات إلا إذا كان ذلك مطلوباً بموجب أي قانون أو عندما نعتقد بحسن نية أن مثل هذا الإجراء سيكون مطلوباً أو مرغوباً فيه للتمشي مع القانون , أو للدفاع عن أو حماية حقوق الملكية الخاصة بهذا الموقع أو الجهات المستفيدة منه.",
                      style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),

                      Text(
                    "البيانات اللازمة لتنفيذ المعاملات المطلوبة من قبلك",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "عندما نحتاج إلى أية بيانات خاصة بك , فإننا سنطلب منك تقديمها بمحض إرادتك. حيث ستساعدنا هذه المعلومات في الاتصال بك وتنفيذ طلباتك حيثما كان ذلك ممكنناً. لن يتم اطلاقاً بيع البيانات المقدمة من قبلك إلى أي طرف ثالث بغرض تسويقها لمصلحته الخاصة دون الحصول على موافقتك المسبقة والمكتوبة ما لم يتم ذلك على أساس أنها ضمن بيانات جماعية تستخدم للأغراض الإحصائية والأبحاث دون اشتمالها على أية بيانات من الممكن استخدامها للتعريف بك.",
                      style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),

                          Text(
                    "عند الاتصال بنا",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "سيتم التعامل مع كافة البيانات المقدمة من قبلك على أساس أنها سرية . تتطلب النماذج التي يتم تقديمها مباشرة على الشبكة تقديم البيانات التي ستساعدنا في تحسين موقعنا.سيتم استخدام البيانات التي يتم تقديمها من قبلك في الرد على كافة استفساراتك , ملاحظاتك , أو طلباتك من قبل هذا الموقع أو أيا من المواقع التابعة له .",
                      style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),

                                   Text(
                    "إفشاء المعلومات لأي طرف ثالث",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "لن نقوم ببيع , المتاجرة , تأجير , أو إفشاء أية معلومات لمصلحة أي طرف ثالث خارج هذا الموقع, أو المواقع التابعة له.وسيتم الكشف عن المعلومات فقط في حالة صدور أمر بذلك من قبل أي سلطة قضائية أو تنظيمية.",
                      style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                                           Text(
                    "التعديلات على سياسة سرية وخصوصية المعلومات",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "نحتفظ بالحق في تعديل بنود وشروط سياسة سرية وخصوصية المعلومات إن لزم الأمر ومتى كان ذلك ملائماً. سيتم تنفيذ التعديلات هنا او على صفحة سياسة الخصوصية الرئيسية وسيتم بصفة مستمرة إخطارك بالبيانات التي حصلنا عليها , وكيف سنستخدمها والجهة التي سنقوم بتزويدها بهذه البيانات.",
                      style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),




                                             Text(
                    "الاتصال بنا",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "يمكنكم الاتصال بنا عند الحاجة من خلال الضغط على رابط اتصل بنا المتوفر في روابط موقعنا او الارسال الى بريدنا الالكتروني info على اسم النطاق اعلاه",
                      style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),


                                                           Text(
                    "اخيرا",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "إن مخاوفك واهتمامك بشأن سرية وخصوصية البيانات تعتبر مسألة في غاية الأهمية بالنسبة لنا. نحن نأمل أن يتم تحقيق ذلك من خلال هذه السياسة.",
                      style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),

                  






            //////////////////////////////////////////////////////
            Text(
              "المقدمة",
              style: styleForgetPassLogIn.copyWith(fontSize: 22),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "منصة تعليمية عمانية رائدة  في مادة الرياضيات ..",
                  //   style: styleAboutMe,
                  // ),
                  // Text(
                  //   "رؤيتنا :",
                  //   style: styleForgetPassLogIn.copyWith(
                  //     fontSize: 16,
                  //   ),
                  // ),
                  Text(
                    "هذا الاتفاق يفرض عليك أنت أو على المؤسسة التي تمثلها ( “أنت \ أنتم ” أو “لك \ لكم”) الشروط والأحكام الواردة فيه لتنظيم العلاقة خلال فترة استخدامكم لمنصة فيثاغورث  التعليمية، المشار اليها ادناه بـ( “لنا” ، ” نحن ” ، “الشركة ” ، “الموقع” ، “المنصة” ، فيثاغورث“” ، “Pythagorath”) ومحتوياتها وبرامجها، والخدمات أو العروض الأخرى على منصتنا (التي يشار اليها بـ”المنتجات”، “الخدمات”، “الميزات”) .",
                    style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),

                  Text(
                    "باستخدامكم لأي من منتجات الشركة أو بالنقر على زر “الاشتراك” أو “SIGNUP”، فأنتم توافقون على الالتزام بشروط وأحكام هذه الاتفاقية. اذا لم توافقوا على جميع شروط وأحكام هذه الاتفاقية، انقروا على زر “الغاء” ولا تستخدموا منتجات الشركة. موافقة الشركة على استخدام خدماتها مشروطة بموافقتكم على قبول جميع شروط وأحكام هذه الاتفاقية، مما يؤدي الى استبعاد أي شروط اخرى. وإذا كانت هذه الشروط والأحكام تعتبر عرضا من الشركة فموافقتكم بقبول تلك، محدد بهذه الشروط ايضاً.",
                    style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "سياسة الخصوصية",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "أية معلومات شخصية تقدمونها للشركة خلال تواصلكم أو استخدامكم للمنتجات أو للمنصة يخضع لسياسة الخصوصية لدينا، والتي تقع في صفحة “سياسة الخصوصية” من منصة فيثاغورث التعليمية.",
                    style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "السياسة العامة",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "تمكّن منتجاتنا المستخدمين من التواصل مع المنتجين كمقاولين مستقلين (و”المنتجون”) الذين يقدمون محتوى تدريبي بالصيغ التي توفرها الشركة كدروس فيديو مسجّلة، ودروس خصوصية، وخدمات التعليم في فصول الدراسية من خلال دورات منصتنا التي نمتلكها فكرياً. تشمل المنتجات، دون حصر، تصميم واستضافة الدورات والمواد الملحقة بالدورات، والتواصل من خلال التعليقات والرد على الاسئلة والاقتراحات أو أي نوع من المعلومات التي يرسلها المستخدمين خلال فترة التحاقهم بالدورة.",
                      style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "تحتفظ الشركة بحق تنقيح هذه الشروط حسب تقديرها في أي وقت عن طريق نشر هذه التغييرات على المنصة. التغييرات تصبح فعالة فور النشر، واستمرار استخدامك للمنتجات بعد أن تصبح التغييرات فعالة تعني قبولك لتلك التغييرات. يرجى زيارة المنصة بانتظام لضمان علمك بأحدث نسخة من هذه الشروط.تحتفظ الشركة بحق تنقيح هذه الشروط حسب تقديرها في أي وقت عن طريق نشر هذه التغييرات على المنصة. التغييرات تصبح فعالة فور النشر، واستمرار استخدامك للمنتجات بعد أن تصبح التغييرات فعالة تعني قبولك لتلك التغييرات. يرجى زيارة المنصة بانتظام لضمان علمك بأحدث نسخة من هذه الشروط.",
                    style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "تحتفظ الشركة بحق ايقاف نشر محتوى اي منتج يقوم بمخالفة الشروط المنصوص عليها في هذه الصفحة، او اي شروط خاصة ضمن العقد الموقع مع المنتج، او الشك في مخالفته تلك الشروط، دون الحاجة الى ابلاغ المنتج.",
                    style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "يجوز للشركة تعديل المنتجات أو ايقاف توفيرها للمستخدمين في أي وقت دون اعلان أو اخطار مسبق.",
                    style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "أنت وحدك المسؤول عن كل الخدمات، والاتصالات الهاتفية، ورسوم البيانات و / أو أي رسوم أخرى وتكاليف مرتبطة بدخولك إلى المنصة واستخدام المنتجات، فضلا عن الحصول على والحفاظ على جميع الهواتف، وأجهزة الحاسوب، وغيرها من المعدات اللازمة لمثل هذا الوصول واستخدامها.",
                    style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "",
                    style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "إذا اخترت الوصول أو استخدام المنتجات التي تنطوي على دفع رسوم، فأنت توافق على الدفع، وستكون مسؤولا عن الدفع، لتلك الرسوم وكافة الضرائب المرتبطة بهذا الوصول أو الاستخدام. إذا قمت بتقديم معلومات بطاقة ائتمان لدفع ثمن هذه الرسوم فأنت تؤكد وتضمن بأنك تملك الصلاحية لتوفير مثل هذه المعلومات وبموجب هذا الترخيص للشركة. جميع الرسوم تكون بالريال العماني ما لم ينص على خلاف ذلك. إذا فشلت طريقة الدفع الخاصة بك أو أصبح حسابك متأخراً على الدفع، فقد نقوم بجمع الرسوم المستحقة باستخدام آليات جمع أخرى. ويمكن أن تشمل هذه سحب من خلال طرق الدفع الأخرى المسجلة في ملفكم معنا و / أو تكليف وكالات جمع أموال ومستشارين قانونيين بذلك. وقد أيضا نمنع وصولك إلى أي من المنتجات في انتظار الدفع للمبالغ المستحقة من قبلك للشركة.",
                    style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "استخدامك للمنصة والوصول إليه وأي أنشطة اخرى متصلة بالمنصة والمنتجات يجب أن تكون في إطار الالتزام بجميع القوانين واللوائح المعمول بها، بما في ذلك، وبدون قيود القوانين المتعلقة بحق المؤلف وغيرها من قوانين استخدام الملكية الفكرية، واحترام الخصوصية والهوية الشخصية. يجب عدم تقديم أي معلومات بعلمك غير صحيحة أو كاذبة؛ كما يجب عدم نسخ، توزيع، تعديل، استخدام الهندسة العكسية، تشويه، تدمير، تهكير، تخريب، اختراق، خرق، أو التلاعب بالمنتجات أو نظام تشغيل المنصة؛ تأطير أو تضمين المنصة أو المنتجات؛ انتحال شخصية شخص آخر أو الوصول غير المصرح به إلى حساب شخص آخر؛ إدخال أي فيروس، دودة، برامج التجسس أو أي شفرات حاسوبية أو ملف أو برنامج قد تكون أو تهدف إلى التسبب بالضرر أو الاستيلاء على نظام التشغيل أي أجهزة أو برامج أو معدات الاتصالات السلكية واللاسلكية ، أو أي جانب آخر من المنتجات أو نظام تشغيل المنصة؛ قشط، تسلق، عنكبة، واستخدام البرامج الآلية والمؤتمتة أو أي وسائل أخرى من أي نوع للوصول إلى المنتجات.",
                    style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                   Text(
                    "تنويه عام",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "منصة فيثاغورث التعليمية منصة تهدف لنشر علم ينتفع به باللغة العربية لإزالة حاجز اللغة عن اكتساب اي مهارات يرغب بها مستخدمونا.",
                    style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "تمنع شركة منصة فيثاغورث التعليمية نشر، تداول، مشاركة، تشجيع، او تنظيم انتاج اي محتوى يتضمن كيفية التعامل مع التكنولوجيا العسكرية او اي تكنولوجيا تستخدم من قبل الاجهزة الامنية او ما يحاكي هذه التكنولوجيا او يساعد على الحد من تأثيرها او الحد من فعالية المؤسسات المعنية باستخدامها. هذا وبالإضافة الى ذلك اية آراء سياسية، دينية، او مواد مخلة بالآداب العامة او اي دعم لما يعرف بـ”الكراهية” تجاه فكر، عنصر، قومية، معتقد، مذهب، او دين وتحتفظ الشركة بحق ابلاغ الجهات الرسمية المختصة بالتعامل مع هكذا نوع من المحتوى بغض النظر عن آراء مستخدمي المنصة او القوانين المنظمة للبلد الذي يقيم فيه وبدون ابلاغ المنتجين او المستخدمين عن هكذا محتوى في حال حدوث ذلك.",
                    style: styleAboutMe2,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "المنصة مجرد سوق للمنتجين والمستخدمين. لا تقوم الشركة باستئجار او توظيف منتجين ولا نتحمل المسؤولية عنهم أو المسؤولية عن أي تفاعلات بين المنتجين والمستخدمين وعملاء كل منهما. نحن لسنا مسؤولين عن النزاعات والمطالبات والخسائر والإصابات، أو أي ضرر من أي نوع قد ينتج عن أو يتعلق بمعلومات أو افعال للمنتجين أو المستخدمين، بما في ذلك، وليس على سبيل الحصر، اعتماد أي مستخدم على أي من المعلومات المقدمة من قبل المنتج.",
                    style: styleAboutMe2,
                  ),
                   Text(
                    "السلوك",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                    
                  ),
                   SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "تستطيع الحصول على المنتجات لاغراض قانوينة، انت المسؤول الوحيد عن جميع القوانين والقواعد واللوائح المتعلقة بي استخدامك للمنتج، انت هنا توافق على عدم استخدام المنتجات او محتوى المنصة للتعامل مع او التواصل او إجتذاب اي مدرب او مستخدم من المستخدمين المحتملين للتوظيف او التعاقد في اي قطاع عمل لا يخص منصتنا إلأ بموافقة مكتوبة مسبقة بمحض إرادتنا، وانت المسؤول عن كل المخاطر الناجمة عن اي اجتماع او اتصال بينك وبين المنتجين او المستخدمين في المنصة.",
                    style: styleAboutMe2,
                  ),
                   Text(
                    "إلتزامات وحقوق منتجي المحتوى التدريبي",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                    
                  ),
                   SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "يخضع جميع المحتوى الرقمي بكافة انواعه المنشورة باسم مؤسسة أو فرد كمنتج للمحتوى التدريبي على منصة فيثاغورث التعليمية لحقوق الملكية الفكرية في سلطنة عمان لضمان حقوق الملكية الفكرية لصاحب المحتوى المقدم وبما لا يتعارض مع القوانين واللوائح المنظمة للملكية الفكرية في سلطنة عمان أو الدولة التي يقيم فيها المنتج، أو الدولة التي تم فيها انتاج المحتوى المقدم ضمن الدورة.",
                    style: styleAboutMe2,
                  ),
                   SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "كما تضمن منصة فيثاغورث التعليمية جميع حقوق منتجي المحتوى التدريبي المنشور على المنصة باعتبارهم المالك الوحيد والحصري للمحتوى أو أي محتوى آخر مضّمن في المحتوى المنشور بما يتوافق مع قانون حماية الملكية الفكرية، وهذا يشمل ايضاً المشاركين في انتاج المحتوى ممن تنظم علاقتهم بمنصة فيثاغورث  التعليمية بعقد مخصص لذلك بعنوان “عقد المنتجين” أو ما يمثل هذا العقد.",
                    style: styleAboutMe2,
                  ),
                   SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "تضمن منصة فيثاغورث  التعليمية لمشتركيها المسجلين في دورة الوصول الى المحتوى المنشور على المنصة خلال فترة الإشتراك، وبذلك أنتم توافقون كمنتجين على توفير المحتوى المنشور من خلال منصة فيثاغورث  التعليمية وان لم يكن ذلك المحتوى موجود على خادمات المنصة لأي مستخدم قد قام بالتسجيل أو الالتحاق بدورة أو محتوى أو قام بشراء أي من الدورات المنشورة باسمكم بغض النظر عن استمرار بيع ذلك المنتج من خلال منصة فيثاغورث التعليمية خلال فترة الإشتراك وبأثر غير رجعي وغير قابل للتغيير.",
                    style: styleAboutMe2,
                  ),


                     Text(
                    "إلتزامات وحقوق طلاب المنصة",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                    
                  ),
                   SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "يمنع استخدام بطاقات ائتمان، أو بطاقات دفع، او اي وسيلة دفع أخرى لا تملك التخويل الكامل من صاحب طريقة الدفع لشراء دورة من خلالها. هذا يشمل ولا يقتصر على بطاقات دفع الكترونية غير حقيقية، بطاقات دفع الكترونية مسروقة، بطاقات دفع الكترونية غير مخول باستخدامها، هذا وتحتفظ منصة فيثاغورث  التعليمية ومنتجيها بكامل الحق باحالة المخالفين لقوانين التعاملات المالية الى الجهات القضائية المختصة او تقديم تفاصيل المستخدم الى الاجهزة المعنية في سلطنة عمان، او بلد المستخدم.",
                    style: styleAboutMe2,
                  ),
                   SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "اذا كنت احد المشاركين او المسجلين في الدورات فاذاً انت احد الطلاب وسوف تخضع للقوانين والاحكام والشروط الاضافية التالية وانت تتعهد بذلك",
                    style: styleAboutMe2,
                  ),
                   SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "· يجب ان تكون قرأت وفهمت وتوافق على الالتزام بمعلومات التسعير قبل استخدام المنصة او التسجيل في الدورة",
                    style: styleAboutMe2,
                  ),
                    SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "· سوف لن يسمح لك بتحميل او نشر او توزيع من خلال المنتج او المنصة اي محتوى يحتوي على إعلان غير مطلوب او غير مصرح به او مواد ترويجية او اي اشياء تجارية اخرى مثل المخططات الهرمية او البريد المزعج",
                    style: styleAboutMe2,
                  ),
                    SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "· لن تضع اي محتوى غير ملائم او جارح او عنصري او بغيض او إباحي او كاذب او مضلل او مخالف للقوانين السارية في بلد المنتج او تشهير او تحريض",
                    style: styleAboutMe2,
                  ),
                       SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "· يمنع اعادة انتاج او توزيع او القيام بعرض علنا او نقل الى العامة او انشاء اعمال مشتقة او استخدام او مشاركة محتوى على المنصة او المنتجات او الدورات باستثناء ما هو مسموح به ضمن هذه الشروط او من قبل المدرب خطياً وحسب اقتضاء الحاجة",
                    style: styleAboutMe2,
                  ),
                       SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "· يمنع الكشف عن اي معلومات شخصية للمدرب وخلاف ذلك انت المسؤول عن كيفية كشف المعلومات الشخصية الخاصة بك او استخدامها",
                    style: styleAboutMe2,
                  ),
                       SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "· سوف لن تتواصل مع معلومات شخصية للمدربين او المستخدمين",
                    style: styleAboutMe2,
                  ),
                      Text(
                    "التسجيل",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                    
                  ),
                   SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "في حال رغبت باستخدام بعض المنتجات سوف تحتاج للتسجيل والحصول على حساب واسم المستخدم وكلمة المرور، عندما تقوم بالتسجيل فان المعلومات التي تقدمها لنا خلال عملية التسجيل تساعدنا في عرض المحتوى وخدمات العملاء وإدارة المنصة",
                    style: styleAboutMe2,
                  ),
                   SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "انت وحدك المسؤول عن الحفاظ على معلومات حسابك بشكل عام  كإسم المستخدم وكلمة المرور وجميع الانشطة الخاصة بحسابك وانت تقر وتضمن معلومات حسابك ان تكون صحيحة ودقيقة في جميع الاوقات.",
                    style: styleAboutMe2,
                  ),
             Text(
                    "يجب ان تقوم بالإبلاغ فوراً في حال حدوث أي من التالي:",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                    
                  ),
                      SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "1. استخدام غير مصرح به لحسابك الخاص او اي خرق أمنى متعلق به",
                    style: styleAboutMe2,
                  ),
                      SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "2. استغلال لحسابكم نتيجة عدم تسجيل الخروج من المنصة بعد الانتهاء من استخدامه",
                    style: styleAboutMe2,
                  ),
                      SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "المنصة وجميع العاملين عليها غير مسؤولة عن اي خسارة او ضرر ناجم عن اخفاقك في الامتثال للمتطلبات السابقة او نتيجة استخدام حسابك بدون علمك قبل ان تبلغنا بالوصول الغير مصرح به الى حسابك وفقاً للحد المسموح به بموجب القانون المعمول به وقت حدوث أياً مما سبق",
                    style: styleAboutMe2,
                  ),
                           SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "لا تقم بإعطاء حسابك الى اي شخص اخر فاستخدام هذا الحساب حصري وغير قابل للتداول ولا يسمح بمشاركة بيانات الدخول للآخرين ولا تستخدم حساب شخص اخر.",
                    style: styleAboutMe2,
                  ),
                           SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "في الحالات التي تسمح بها باستخدام حسابك او قيامك بالتسجيل بالنيابة عن شخص اخر بما في ذلك القاصر سوف تكون مسؤول بشكل كامل عن التالي:",
                    style: styleAboutMe2,
                  ),
                               SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "1.      السلوك عبر الانترنت لهذا العضو	",
                    style: styleAboutMe2,
                  ),
                               SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "2.      التحكم في استخدام المنتج",
                    style: styleAboutMe2,
                  ),
                               SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "3.      عواقب سوء الاستخدام  ومنها إغلاق الحساب، او المسائلة القانونية أو اي اجراء تراه المنصة ضروريا لحفظ حقوقها.",
                    style: styleAboutMe2,
                  ),


                  Text(
                    "المحتوى والتراخيص والضوابط",
                    style: styleForgetPassLogIn.copyWith(
                      fontSize: 16,
                    ),
                    
                  ),
                      SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "“المحتوى” هو جميع البرامج والتكنولوجيا والتصاميم والادوات المادية والمعلومات والاتصالات والنصوص والرسومات والروابط والفنون الالكترونية والرسوم المتحركة والرسوم الإيضاحية والاعمال الفنية ومقاطع الصوت ومقاطع الفيديو والصور والعروض التقديمية والافكار والتعليقات والملاحظات وغيرها من البيانات او المواد وكل ما سبق محمي بقوانين حقوق النشر وحقوق المحتوى كل للجهة المشاركة فيه بما في ذلك كل ما يتعلق باختيارها واعدادها.",
                    style: styleAboutMe2,
                  ),
                      SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "“محتوى الشركة” هو كل ما توفره الشركة لك للوصول الى المنتجات والدورات بما في ذلك ودون الحصر البرامج والمنتجات والموقع.",
                    style: styleAboutMe2,
                  ),
                      SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "“المحتوى المقدم” هو المحتوى الذي تم رفعه وتحميله ونقله او القيام بنشره في المنصة او من خلال المنتجات عن طريق المستخدمين",
                    style: styleAboutMe2,
                  ),
                           SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "انت هنا تؤكد وتضمن أن لديك كافة التراخيص والحقوق والموافقات والتصاريح اللازمة لمنح الحقوق المنصوص عليها في هذه الشروط للشركة فيما يتعلق بالمحتوى المقدم الخاص بك، وهنا الشركة لا تحتاج للحصول على اي ترخيص او موافقات او حقوق او تقديم اي مدفوعات الى اي طرف ثالث ناتج عن اي استخدام او استغلال للمحتوى المقدم الخاص بك. انت هنا تخولنا وفق الشروط المتفق عليها لتجنيبنا أي مسؤولية عن كل ما سبق في الشروط قد ينتج عن استغلال او استخدام المحتوى الخاص بك، وانت تقر على ذلك بجميع الشروط.",
                    style: styleAboutMe2,
                  ),
                           SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "انت هنا تمنح المنصة حق غير حصري وترخيص لإعادة انتاج وتوزيع والبث العلني وتقديم العروض والتسويق وخلاف ذلك من استخدام او استثمار المحتوى المقدم للمنصة وذلك من خلال المنتجات واعادة الترخيص للمدربين والمستخدمين المباشرين لهذه الاغراض او من خلال اطراف ثالثة وبالرغم مما سبق يمكنك  ازالة او حذف اي  جزء او كل  المحتوى المقدم الخاص بيك في اي وقت من المنصة مع مراعاة المحافظة على التراخيص المقدمة قبل ذلك لأي من مستخدمي المنصة.",
                    style: styleAboutMe2,
                  ),
                               SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "حذف المحتوى الخاص بك سوف يقوم بالغاء أي ترخيص أو حقوق متفق عليها مع المنصة بعد مدة (60) يوم، بعد هذا الحذف يمكنك اعادة استخدام المواد على المنصة ولكن بشرط ان الحقوق الممنوحة للمستخدمين قبل ذلك الوقت ستستمر وفق الشروط الممنوحة لهولاء المستخدمين.",
                    style: styleAboutMe2,
                  ),
                               SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "المنصة بموجب هذا القانون تمنحك انت (المستخدم) ضمان محدود وغير حصري ورخصة غير قابلة للتحويل للوصول الى واستخدام المحتوى المقدم ومحتوى المنصة والتي قمت بدفع جميع الرسوم لغرض الاستعمال الشخصي  وليس لاغراض تجارية من خلال المنصة او المنتجات وفقا لهذه الشروط او اي شروط او قيود مرتبطة بالدورات او بمنتجات معينة وجميع الاستخدامات الاخرى ممنوعة ومحظورة الا بموافقة كتابية صريحة من الشركة.",
                    style: styleAboutMe2,
                  ),
                               SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "انت لا تستطيع اعادة انتاج او توزيع او نقل او تعيين او بيع او بث او تأجير او مشاركة او إقراض او تعديل او تكييف او إنشاء اعمال ثانوية من الترخيص او نقل او استخدام المحتوى المقدم او محتوى المنصة ما لم نقدم لك تصريح خطي للقيام بذلك.",
                    style: styleAboutMe2,
                  ),
                                 SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "انت توافق على انه يجوز لنا القيام بتسجيل كل او جزء من الدورات (بما في ذلك التواصل بالدردشة الصوتية\الخطية) لمراقبة وضبط الجودة وتقييم وتسويق والترويج لعمليات المنصة والمنتجات، انت بهذا تمنح إذن للمنصة لاستخدام اسمك ومظهرك الخارجي وصورتك او صوتك في الاتصال لتقديم العروض والتوصيل والتسويق والتشجيع على البيع على المنصة والمنتجات والدورات ومحتوى المنصة والمحتوى المقدم والتنازل على كافة حقوق الخصوصية والدعاية او اي حقوق اخرى ذات طبيعة مماثلة، الى الحد المسموح به وفق القانون المعمول به في البلد المعني.",
                    style: styleAboutMe2,
                  ),
                  
                                 SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "المنصة تحترم جميع حقوق الطبع والنشر والخصوصية والقوانين الاخرى المتعلقة بالمحتوى والمعلومات ولن تتسامح مع أي انتهاك لهذه القوانين وبالرغم مما سبق فالمنصة لا تتحمل مسؤولية المحتوى المعروض والمقدم وكل المحتويات الاخرى تعتبر ضمن المسؤولية الشخصية لصاحب المحتوى والمنصة لا تتحمل اي مسؤولية عن اي سوء استخدام للمنصة على وجه الخصوص لاستعراض او نشر او اظهار المحتوى المقدم على المنصة او من خلال المنتجات الأخرى ولا تقوم بالتاكيد او التعهد بان المحتوى خالي من اي انتهاك لحقوق النشر او الخصوصية او غير ذلك من القوانين او تتناسب مع العرض لتكون دقيقة ومفيدة.",
                    style: styleAboutMe2,
                  ),
                  
                                 SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "اذا كنت تعتقد ان المحتوى المقدم ينتهك خصوصيتك او اي قانون او اي لائحة او ان المعلومات المقدمة غير دقيقة او يشكل اي خطر على الاطلاق لطرف ثالث فيقع على عاتقك القيام بابلاغنا عن ذلك ليتسنى لنا تصحيح الوضع",
                    style: styleAboutMe2,
                  ),
                                        SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "اذا كنت تعتقد ان المحتوى المقدم من طرف ثالث او اي محتوى ينتهك شروط استخدام المنصة او ينتهك أي قوانين او لوائح معمول بها بما في ذلك وليس على سبيل الحصر قوانين حقوق النشر فيجب عليك الابلاغ عن ذلك للحفاظ على حقوق النشر وعمل ما يلزم.",
                    style: styleAboutMe2,
                  ),
                                        SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    "جميع هذه الحقوق لا تعتبر ضمان صريح لمنتجي او مالكي المحتوى لطريقة استخدام محتواهم من قبل مستخدمي المنصة كما لا تمنح هذه الشروط اي ترخيص ضمني لأي طرف غير مصرح به",
                    style: styleAboutMe2,
                  ),
                  
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
