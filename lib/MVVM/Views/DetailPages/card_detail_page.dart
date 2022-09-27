import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:mrc/Api/api.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:mrc/utils/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/utils.dart';
import '../../Model/universities_model.dart' as mrc;

class CardDetailPage extends StatefulWidget {
  final mrc.Datum universitiesInfo;
  const CardDetailPage({Key? key, required this.universitiesInfo})
      : super(key: key);

  @override
  State<CardDetailPage> createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  int selectedId = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          title: "Detail",
          appBar: AppBar(),
          automaticallyImplyLeading: true,
          widgets: [
            GestureDetector(
                onTap: () async {
                  var url = Uri.parse("https://wa.me/923008044449");
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
                child: const Icon(
                  Icons.whatsapp_outlined,
                  color: kblack,
                ))
          ],
          appBarHeight: 50),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(5),
        color: kWhite,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
                buttonColor: primaryColor,
                text: "Apply Now",
                textColor: primaryColor,
                invert: true,
                function: () async {
                  if (userData == "guest") {
                    Fluttertoast.showToast(
                        msg: "Login to start applying for universities");
                  } else {
                    if (selectedId == -1) {
                      Fluttertoast.showToast(msg: "Select a course first");
                    } else {
                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.loading,
                          barrierDismissible: false);
                      Response res = await Api.applyForApp(
                          widget.universitiesInfo.id.toString(),
                          widget.universitiesInfo.courses![selectedId].id
                              .toString(),
                          userData["data"]["details"]["id"].toString(),
                          userData["data"]["id"].toString());

                      if (res.statusCode == 200) {
                        popPage(false);
                        CoolAlert.show(
                            context: context,
                            type: CoolAlertType.info,
                            text:
                                "Successfully submitted application for this university",
                            barrierDismissible: false,
                            onConfirmBtnTap: () {
                              popPage(true);
                            });
                        Fluttertoast.showToast(
                            msg:
                                "Successfully submitted application for this university");
                      } else {
                        popPage(false);
                        Fluttertoast.showToast(msg: "Not working");
                      }
                    }
                  }
                }),
            CustomButton(
                buttonColor: primaryColor,
                text: "Get Consultation",
                textColor: kWhite,
                function: () async {
                  var url = Uri.parse("tel:+923214849999");
                  if (await canLaunchUrl(url)) {
                    launchUrl(url,
                        mode: LaunchMode.externalNonBrowserApplication);
                  }
                }),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.universitiesInfo.banner ??
                    "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
                errorBuilder: (context, error, stackTrace) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "http://www.sacredheart.edu/media/shu-media/site-assets/images/Sacred-Heart-OG.png",
                      height: 200,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  );
                },
                fit: BoxFit.cover,
                height: 200,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return CircularProgressIndicator(
                    value: loadingProgress.cumulativeBytesLoaded.toDouble(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              text: "Description",
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
                maxLines: 6,
                text:
                    "A case study can be defined as an intensive study about a person, a group of people or a unit, which is aimed to generalize over several units'.1 A case study has also been described as an intensive, systematic investigation of a single individual, group, community or some other unit in which the researcher examines in"),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              text: "Offered Courses",
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            (widget.universitiesInfo.courses as List).isEmpty
                ? const CustomText(text: "No courses available at the moment")
                : Row(
                    children: List.generate(
                        (widget.universitiesInfo.courses as List).length,
                        (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedId = index;
                                });
                              },
                              child: Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: selectedId == index
                                            ? primaryColor
                                            : kblack,
                                      ),
                                      color: selectedId == index
                                          ? primaryColor.withOpacity(0.1)
                                          : kWhite,
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  child: Text(
                                    widget.universitiesInfo.courses![index].name
                                        .toString(),
                                    style: TextStyle(
                                        color: selectedId == index
                                            ? primaryColor
                                            : kblack,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )),
                  ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              text: "Eligibility",
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(text: "IELTS Overall course"),
            const SizedBox(
              height: 5,
            ),
            const CustomText(text: "6.5"),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              text: "Ranking",
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(text: widget.universitiesInfo.ranking!),
          ],
        ),
      ),
    );
  }

  popPage(check) {
    Navigator.of(context, rootNavigator: true).pop();
    if (check == true) {
      KRoutes.pop(context);
    }
  }
}
