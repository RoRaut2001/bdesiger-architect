import 'package:b_designer_architecture/Constants/constant_asset.dart';
import 'package:b_designer_architecture/Controller/billing_controller.dart';
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
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w600
              ),),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildTabItem(
                    title: "Billing History",
                    index: 0,
                    controller: controller,
                  ),
                  const SizedBox(width: 15),
                  buildTabItem(
                    title: "Billing Info",
                    index: 1,
                    controller: controller,
                  ),
                  const SizedBox(width: 15),
                  buildTabItem(
                    title: "Payment Method",
                    index: 2,
                    controller: controller,
                  ),
                ],
              ),
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

  Widget buildTabItem({
    required String title,
    required int index,
    required BillingController controller,
  }) {
    return Obx(() => InkWell(
      onTap: () { controller.billingIndex.value = index;},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 13,
              color: Colors.black,
              fontWeight: controller.billingIndex.value == index ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 1,
            width: 70,
            color: controller.billingIndex.value == index ? Colors.black : Colors.transparent,
          ),
        ],
      ),
    ));
  }
}
