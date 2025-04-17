import 'package:b_designer_architecture/Components/Buttons/submit_button.dart';
import 'package:b_designer_architecture/Constants/constant_color.dart';
import 'package:b_designer_architecture/Controller/profile_controller.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileWeb extends StatelessWidget {
  ProfileWeb({super.key});

  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Obx(()=>controller.isLoading.value ? CircularProgressIndicator(strokeCap: StrokeCap.round, color: Colors.black,) : Container(
          height: MediaQuery.of(context).size.height - 50 ,
          margin: EdgeInsets.symmetric(
              horizontal: 120.0
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Colors.black,
                width: 0.5
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                height: 5.h,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.black,
                            width: 0.5
                        )
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)
                    ),
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFFB8D2F3),
                          Color(0xFFFDF7E1),
                        ]
                    )
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.arrow_back_ios_new_rounded)),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(20.0),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            !(controller.userData.value.profilePictureUrl != null && controller.userData.value.profilePictureUrl!.isNotEmpty) ? controller.pickProfilePicture() : showProfilePicture(context, controller.userData.value.profilePictureUrl!);
                          },
                          child: CircleAvatar(
                            radius: 40,
                            child: Obx(()=>CachedNetworkImage(
                                imageUrl: controller.userData.value.profilePictureUrl ?? "",
                                placeholder: (context, imageUrl)=>Center(child: CircularProgressIndicator(strokeCap: StrokeCap.round, color: kcDarkGrey,),),
                                errorWidget: (context, imageUrl, error)=>Center(child: Icon(Icons.person, color: Colors.white, size: 50,),)
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(()=>Text("${controller.userData.value.name ?? "NA"}", style: TextStyle(
                                fontSize: 2.t,
                                fontWeight: FontWeight.w500,
                                color: kcNavyBlue
                            ),)),
                            Obx(()=>Text(controller.userData.value.role ?? "NA", style: TextStyle(
                                fontSize: 1.t,
                                color: kcNavyBlue
                            ),))
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: ()=>controller.updateProfile(context, controller.userData.value.uid!),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.blue,
                            ),
                            padding: EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            child: Text("Edit", style: TextStyle(
                                color: Colors.white
                            ),),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.w,
                          childAspectRatio: 445/83
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Obx(()=>_buildField(hint: controller.userData.value.name ?? "Enter your name", fieldName: "Full Name")),
                        Obx(()=>_buildField(hint: controller.userData.value.gender ?? "Your Gender", fieldName: "Gender")),
                        Obx(()=>_buildField(hint: controller.userData.value.state ?? "Enter your state", fieldName: "State")),
                        Obx(()=>_buildField(hint: controller.userData.value.town ?? "Enter your town/village", fieldName: "Town/Village")),
                        Obx(()=>_buildField(hint: controller.userData.value.language ?? "Enter your Language", fieldName: "Language")),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("My email address", style: TextStyle(
                            fontSize: 1.2.t,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),)),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xFF4182F9).withAlpha(30),
                          child: Icon(Icons.email_rounded,color: Color(0xFF4182F9), size: 22,),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(()=>Text(controller.userData.value.email ?? "example@email.com", style: TextStyle(
                                fontSize: 1.1.t,
                                fontWeight: FontWeight.w500
                            ),)),
                            Obx(()=>Text(createdTime(controller.userData.value.addDate ?? controller.userData.value.updateDate ?? DateTime.now().toString()), style: TextStyle(
                                fontSize: 0.9.t,
                                color: Color(0xFF000000).withAlpha(80),
                                fontWeight: FontWeight.w500
                            ),)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("Documents Upload (Verified/Pending/Rejected)", style: TextStyle(
                            fontSize: 1.2.t,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),)),
                    GridView(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 445/48
                      ),
                      children: [
                        _buildUploadField(hint: "Course Certificate", onTap: (){}),
                        _buildUploadField(hint: "Degree Certificate", onTap: (){}),
                        _buildUploadField(hint: "License Certificate (Optional)", onTap: (){}),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  String createdTime(String time) {
    final DateTime dateTime = DateTime.parse(time);
    final Duration difference = DateTime.now().difference(dateTime);

    if (difference.inDays > 0) {
      return "${difference.inDays} days ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} hours ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} minutes ago";
    } else {
      return "Just now";
    }
  }

  void showProfilePicture(BuildContext context, String imageUrl) {
    showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          padding: EdgeInsets.all(10.0),
          width: 50.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  width: 20.w,
                    height: 10.h,
                    fit: BoxFit.cover,
                    imageUrl: imageUrl,
                  placeholder: (imageUrl, context)=>Center(child: CircularProgressIndicator(strokeCap: StrokeCap.round, color: kcNavyBlue,),),
                  errorWidget: (error, imageUrl, context)=>Center(child: Icon(Icons.error_outline_rounded, color: Colors.red, size: 50,),),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 55,
                      width: 100,
                      child: SubmitButton(title: "Cancel", onTap: (){Navigator.pop(context);}, theme: "grey")),
                  SizedBox(
                    width: 2.w,
                  ),
                  SizedBox(
                      width: 100,
                      height: 55,
                      child: SubmitButton(title: "Edit", onTap: (){controller.pickProfilePicture();}, theme: "black")),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _buildField({required String hint, required String fieldName, /***String? value****/}){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldName, style: TextStyle(
          fontSize: 1.1.t
        ),),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            fillColor: Color(0xFFF9F9F9),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none
            )
          ),
          readOnly: true,
        )
      ],
    );
  }

  Widget _buildUploadField({required String hint, required VoidCallback onTap}){
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xFF4182F9).withAlpha(30),
          child: Icon(Icons.email_rounded,color: Color(0xFF4182F9), size: 22,),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 50.w,
          child: TextFormField(
            readOnly: true,
            onTap: onTap,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.file_upload_outlined, color: Colors.black,),
              hintText: hint,
              filled: true,
              fillColor: Color(0xFFF9F9F9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none
              )
            ),
          ),
        )
      ],
    );
  }
}



