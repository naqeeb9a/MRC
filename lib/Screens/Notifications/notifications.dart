import 'package:flutter/material.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:mrc/utils/utils.dart';

class NotificationsScreen extends StatelessWidget {
  final String titleName;
  final bool backIcon;
  const NotificationsScreen(
      {Key? key, this.titleName = "Notifications", this.backIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          title: titleName,
          appBar: AppBar(),
          automaticallyImplyLeading: backIcon,
          widgets: const [],
          appBarHeight: 50),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const CustomText(
                text: "Unread",
                fontWeight: FontWeight.bold,
              ),
              customNotificationCard(check: true),
              customNotificationCard(check: true),
              const CustomText(
                text: "Read",
                fontWeight: FontWeight.bold,
              ),
              customNotificationCard(),
              customNotificationCard(),
              customNotificationCard(),
              customNotificationCard(),
            ],
          ),
        ),
      ),
    );
  }

  customNotificationCard({bool check = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 1, color: check ? primaryColor : kblack.withOpacity(0.1))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "Meeting Reminder",
                fontsize: 15,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: "1 day ago",
                color: check ? primaryColor : kblack.withOpacity(0.6),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            text:
                "You have a consultation meeting about study in Canada at 2:00 pm",
            maxLines: 5,
            color: kblack.withOpacity(0.6),
          )
        ],
      ),
    );
  }
}
