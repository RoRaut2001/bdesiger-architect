import 'package:b_designer_architecture/Constants/constant_asset.dart';
import 'package:b_designer_architecture/Controller/billing_controller.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BillingWeb extends StatelessWidget {
  BillingWeb({super.key});

  final BillingController controller = Get.find<BillingController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 50,
        ),
        Container(
          height: 70,
          width: double.maxFinite,
          color: Colors.white,
          child: ListTile(
            contentPadding: EdgeInsets.only(
                left: 50.0,
                right: 20.0
            ),
            title: Text("Balance Sheet", style: GoogleFonts.outfit(
                color: Color(0xFF656565),
                fontWeight: FontWeight.w600,
                fontSize: 1.2.t
            ),),
            subtitle: Text("Check your balance", style: GoogleFonts.outfit(
                color: Color(0xFF656565),
                fontWeight: FontWeight.w500,
                fontSize: 1.0.t
            ),),
            trailing: Image.asset(kaBalance),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Padding(padding: EdgeInsets.symmetric(
          horizontal: 20.0
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    childAspectRatio: 300/80,
                    crossAxisSpacing: 30.0,
                    mainAxisSpacing: 30.0
                  ),
                children: [
                  _buildBalanceCard(title: "Total Earning", subtitle: "Lifetime earnings from completed projects.", amount: "Rs.3,50,000/-", onTap: (){}, image: kaTotal),
                  _buildBalanceCard(title: "Available Balance", subtitle: "Monthly balance from completed projects.", amount: "Rs.35,000/-", onTap: (){}, image: kaAvailable),
                  _buildBalanceCard(title: "Pending Balance", subtitle: "Monthly pending from completed projects.", amount: "Rs.15,000/-", onTap: (){}, image: kaPending),
                  _buildBalanceCard(title: "Withdrawn Amount", subtitle: "Monthly withdrawn from completed projects.", amount: "Rs.10,000/-", onTap: (){}, image: kaWithdrawn),
                ],
                shrinkWrap: true,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text("Billing & Payment", style: TextStyle(
                  fontSize: 1.5.t,
                  color: Colors.black,
                  fontWeight: FontWeight.w600
              ),),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(()=>TextButton(
                      onPressed: (){
                    controller.billingIndex.value = 0;
                  }, child: Text("Billing Info", style: TextStyle(
                    fontSize: 1.t,
                    color: Colors.black,
                    fontWeight: controller.billingIndex.value == 0 ? FontWeight.bold : FontWeight.w500,
                    decoration: controller.billingIndex.value == 0 ? TextDecoration.underline : null
                  ),
                  ))),
                  Obx(()=>TextButton(
                      onPressed: (){
                    controller.billingIndex.value = 1;
                  }, child: Text("Payment Method", style: TextStyle(
                    fontSize: 1.t,
                    color: Colors.black,
                    fontWeight: controller.billingIndex.value == 1 ? FontWeight.bold : FontWeight.w500,
                      decoration: controller.billingIndex.value == 1 ? TextDecoration.underline : null
                  ),))),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Divider(),
              Obx(()=>controller.billingScreens[controller.billingIndex.value]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceCard({required String title, required String subtitle, required String amount, required VoidCallback onTap, required String image}){
    return Container(
      height: 100,
      width: 300,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.black,
          width: 0.5
        ),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(amount, style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 1.3.t
              ),),
              Text(title, style: TextStyle(
                fontSize: 1.t,
                fontWeight: FontWeight.w600,
                color: Color(0xFF7B7B7B)
              ),),
              Text(subtitle, style: TextStyle(
                fontSize: 0.8.t,
                color: Color(0xFF7B7B7B)
              ),)
            ],
          )
        ],
      ),
    );
  }
}
