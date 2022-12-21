import 'package:flutter/material.dart';
import 'package:mrc/Widgets/widget.dart';
import 'package:mrc/utils/utils.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          title: "Profile",
          automaticallyImplyLeading: true,
          appBar: AppBar(),
          widgets: const [],
          appBarHeight: 50),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: "profile",
                  child: CircleAvatar(
                    radius: 50,
                    foregroundImage: NetworkImage(
                        "https://theundercoverrecruiter.com/wp-content/uploads/2018/09/ian-dooley-281846-unsplash-1-e1537195966706.jpg"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: "Upload Image Profile",
                  color: kblack.withOpacity(0.6),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              infoHeadings("Personal Information"),
              const SizedBox(
                height: 20,
              ),
              infoField("Name", userData["data"]["details"]["lead_name"]),
              infoField("Number", userData["data"]["details"]["mobile"]),
              infoField("Email", userData["data"]["details"]["email"]),
              const SizedBox(
                height: 20,
              ),
              infoHeadings("Educational Information"),
              const SizedBox(
                height: 20,
              ),
              infoField("Institution", "University of Dhaka"),
              infoField("Degree", "Bsc"),
              infoField("Subject", "Computer Science & Engineering"),
            ],
          ),
        ),
      ),
    );
  }

  infoHeadings(String text) {
    return CustomText(
      text: text,
      fontWeight: FontWeight.bold,
      fontsize: 18,
    );
  }

  infoField(String text1, String text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: text1,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: 5,
        ),
        CustomText(text: text2),
        const Divider()
      ],
    );
  }
}
