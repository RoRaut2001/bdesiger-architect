import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            "Payment Method",
            style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            "Easily manage your payments methods through our secure system.",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 0.5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              InkWell(
                onTap: (){
                  addPaymentMethodPopUp(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 15,),
                  Text("Add Payment Method", style: TextStyle(
                    fontSize: 1.t,
                    color: Color(0xFF4C4C4C),
                    fontWeight: FontWeight.w600
                  ),),
                  ]
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildPaymentMethodField({required String hintText, required TextEditingController controller}){
    return SizedBox(
        width: 50.w,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 0.5
              )
            )
          ),
        )
    );
  }

  void addPaymentMethodPopUp(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPaymentMethodField(hintText: "Enter Method name", controller: TextEditingController()),
            const SizedBox(height: 10,),
            _buildPaymentMethodField(hintText: "Enter UPI ID", controller: TextEditingController()),
            const SizedBox(height: 10,),
            _buildPaymentMethodField(hintText: "Enter Backup phone number", controller: TextEditingController()),
          ],
        ),
      );
    });
  }
}
