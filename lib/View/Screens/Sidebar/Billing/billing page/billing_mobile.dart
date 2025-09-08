import 'package:b_designer_architecture/Constants/constant_asset.dart';
import 'package:b_designer_architecture/Controller/billing_controller.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BillingMobile extends StatelessWidget {
  BillingMobile({super.key});

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
                fontSize: 15
            ),),
            subtitle: Text("Check your balance", style: GoogleFonts.outfit(
                color: Color(0xFF656565),
                fontWeight: FontWeight.w500,
                fontSize: 12
            ),),
            trailing: Image.asset(kaBalance, height: 35,width: 35,),
          ),
        ),
        const SizedBox(height: 30.0,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBalanceCard(
                title: "Total Earning",
                subtitle: "Lifetime earnings from completed projects.",
                amount: "Rs.3,50,000/-",
                onTap: () {},
                image: kaTotal,
              ),
              SizedBox(height: 10),
              _buildBalanceCard(
                title: "Available Balance",
                subtitle: "Monthly balance from completed projects.",
                amount: "Rs.35,000/-",
                onTap: () {},
                image: kaAvailable,
              ),
              SizedBox(height: 10),
              _buildBalanceCard(
                title: "Pending Balance",
                subtitle: "Monthly pending from completed projects.",
                amount: "Rs.15,000/-",
                onTap: () {},
                image: kaPending,
              ),
              const SizedBox(height: 30.0,),
              Text("Billing & Payment",
                style: GoogleFonts.outfit(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),),
              const SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(()=>TextButton(
                      onPressed: (){
                        controller.billingIndex.value = 0;
                      }, child: Text("Billing Info", style: GoogleFonts.roboto(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: controller.billingIndex.value == 0 ? FontWeight.bold : FontWeight.w500,
                      decoration: controller.billingIndex.value == 0 ? TextDecoration.underline : null
                  ),
                  ))),
                  Obx(()=>TextButton(
                      onPressed: (){
                        controller.billingIndex.value = 1;
                      }, child: Text("Payment Method", style: GoogleFonts.roboto(
                      fontSize: 12,
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
      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 7),
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
          const SizedBox(width: 18.0,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(amount, style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 12
              ),),
              Text(title, style: GoogleFonts.roboto(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF7B7B7B)
              ),),
              Text(subtitle, style: GoogleFonts.roboto(
                  fontSize: 9,
                  color: Color(0xFF7B7B7B)
              ),)
            ],
          )
        ],
      ),
    );
  }
}
