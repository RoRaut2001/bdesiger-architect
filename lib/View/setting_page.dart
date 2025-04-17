import 'package:b_designer_architecture/Controller/auth_controller.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final AuthController controller = Get.find<AuthController>();

  final RxString reason = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 150.w,
          margin: EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 20.0
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Padding(
                  padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Change Password", style: TextStyle(
                          fontSize: 1.1.t,
                          fontWeight: FontWeight.w600,
                          
                          color: Colors.black
                        ),),
                        SizedBox(
                          width: 30.w
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildFormField(controller: TextEditingController(), hintText: "Enter old password"),
                            SizedBox(
                              height: 20
                            ),
                            _buildFormField(controller: TextEditingController(), hintText: "Enter new password"),
                            SizedBox(
                                height: 20
                            ),
                            _buildFormField(controller: TextEditingController(), hintText: "confirm new password"),
                            SizedBox(
                                height: 20
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: _buildButton(title: "Update Password", onTap: (){}),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Deactivate Account", style: TextStyle(
                            fontSize: 1.1.t,
                            fontWeight: FontWeight.w600,

                            color: Colors.black
                        ),),
                        SizedBox(
                            width: 30.w
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("What happens when you deactivate your account?", style: TextStyle(
                                fontSize: 1.1.t,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                            ),),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("• Your profile be shown on BDesigner anymore"),
                            Text("• Active orders will be cancelled."),
                            Text("• Your rating will reset"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("I'm leaving because", style: TextStyle(
                            fontSize: 1.1.t,
                            fontWeight: FontWeight.w600,

                            color: Colors.black
                        ),),
                        SizedBox(
                            width: 30.w
                        ),
                        _buildDropDown(items: ["I can’t find what i need on BDesigner", "BDesigner is hard or complicated to use", "Negative experience with sellers", "I’m unhappy with BDesigners policies", "Other"], onChanged: (value)=>reason.value = value)
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tell us more", style: TextStyle(
                            fontSize: 1.1.t,
                            fontWeight: FontWeight.w600,

                            color: Colors.black
                        ),),
                        SizedBox(
                            width: 35.w
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildFormField(controller: TextEditingController(), hintText: "Help us become better"),
                            SizedBox(
                                height: 20
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: _buildButton(title: "Deactivate Account", onTap: (){}),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({required String title, required VoidCallback onTap}){
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0
        ),
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Color(0xFF4182F9)
        ),
        child: Text(title, style: TextStyle(
          fontSize: 0.9.t,
          color: Colors.white
        ),),
      ),
    );
  }

  Widget _buildFormField({required TextEditingController controller, required String hintText}){
    return SizedBox(
      width: 50.w,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none
          ),
          filled: true,
          fillColor: Color(0xFFF9F9F9),

          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 1.t,
            color: Color(0xFF949393),
            fontWeight: FontWeight.w600,
          )
        ),
      ),
    );
  }
  
  
  Widget _buildDropDown({required List<String> items, required Function(String) onChanged}){
    return SizedBox(
      width: 50.w,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF9F9F9),
          hintText: "Choose a reason",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none
          ),
        ),
        borderRadius: BorderRadius.circular(10.0),
          dropdownColor: Colors.white,
          onChanged: (value) {
            onChanged;
          },
          items: List.generate(items.length, (index){
        return DropdownMenuItem(value: items[index], child: Text(items[index]),);
      })),
    );
  }
}
