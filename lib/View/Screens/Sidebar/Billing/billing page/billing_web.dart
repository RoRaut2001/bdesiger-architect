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
        const SizedBox(height: 30,),
        Container(
          height: 70,
          width: double.maxFinite,
          color: Colors.white,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 50),
            title: Text("Balance Sheet", style: GoogleFonts.outfit(
                color: Color(0xFF656565),
                fontWeight: FontWeight.w600,
                fontSize: 18
            ),),
            subtitle: Text("Check your balance", style: GoogleFonts.outfit(
                color: Color(0xFF656565),
                fontWeight: FontWeight.w500,
                fontSize: 13
            ),),
            trailing: Image.asset(kaBalance, height: 35,width: 35,),
          ),
        ),
        const SizedBox(height: 30.0,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    childAspectRatio: 300/100,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 30.0
                  ),
                children: [
                  _buildBalanceCard(title: "Total Earning", subtitle: "Lifetime earnings from completed projects.", amount: "Rs.3,50,000/-", onTap: (){}, image: kaTotal),
                  _buildBalanceCard(title: "Available Balance", subtitle: "Monthly balance from completed projects.", amount: "Rs.35,000/-", onTap: (){}, image: kaAvailable),
                  _buildBalanceCard(title: "Pending Balance", subtitle: "Monthly pending from completed projects.", amount: "Rs.15,000/-", onTap: (){}, image: kaPending),
                  // _buildBalanceCard(title: "Withdrawn Amount", subtitle: "Monthly withdrawn from completed projects.", amount: "Rs.10,000/-", onTap: (){}, image: kaWithdrawn),
                ],
                shrinkWrap: true,
              ),
              const SizedBox(height: 30.0,),
              Text("Billing & Payment",
                style: GoogleFonts.outfit(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w600
              ),),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(()=>TextButton(
                      onPressed: (){
                    controller.billingIndex.value = 0;
                  }, child: Text("Billing Info", style: GoogleFonts.roboto(
                    fontSize: 1.t,
                    color: Colors.black,
                    fontWeight: controller.billingIndex.value == 0 ? FontWeight.bold : FontWeight.w500,
                    decoration: controller.billingIndex.value == 0 ? TextDecoration.underline : null
                  ),
                  ))),
                  Obx(()=>TextButton(
                      onPressed: (){
                    controller.billingIndex.value = 1;
                  }, child: Text("Payment Method", style: GoogleFonts.roboto(
                    fontSize: 1.t,
                    color: Colors.black,
                    fontWeight: controller.billingIndex.value == 1 ? FontWeight.bold : FontWeight.w500,
                      decoration: controller.billingIndex.value == 1 ? TextDecoration.underline : null
                  ),))),
                ],
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
      padding: EdgeInsets.symmetric(horizontal: 10.0,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
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
          Image.asset(image, height: 35,width: 35,),
          const SizedBox(width: 20.0,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(amount, style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 14
              ),),
              Text(title, style: GoogleFonts.roboto(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF7B7B7B)
              ),),
              Text(subtitle, style: GoogleFonts.roboto(
                fontSize: 10,
                color: Color(0xFF7B7B7B)
              ),)
            ],
          )
        ],
      ),
    );
  }
}
