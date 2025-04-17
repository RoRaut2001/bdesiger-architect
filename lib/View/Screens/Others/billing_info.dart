import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BillingInfo extends StatelessWidget {
  const BillingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text("Billing Information", style: TextStyle(
            fontSize: 1.2.t,
            fontWeight: FontWeight.w500
        ),),
        SizedBox(
          height: 20.0,
        ),
        _buildField(hintText: "Please Enter your name", controller: TextEditingController(), fieldName: "Full Name"),
        SizedBox(
          height: 20.0,
        ),
        _buildField(hintText: "Please enter company name", controller: TextEditingController(), fieldName: "Company name(optional)"),
        SizedBox(
          height: 20.0,
        ),
        _buildField(hintText: "Please enter country name", controller: TextEditingController(), fieldName: "Country"),
        SizedBox(
          height: 20.0,
        ),
        _buildField(hintText: "Please enter state name", controller: TextEditingController(), fieldName: "State/Union Territory (Mandatory)"),
        SizedBox(
          height: 20.0,
        ),
        _buildField(hintText: "Please enter your address", controller: TextEditingController(), fieldName: "Address"),
        SizedBox(
          height: 20.0,
        ),
        _buildField(hintText: "Please specify your city", controller: TextEditingController(), fieldName: "City"),
        SizedBox(
          height: 20.0,
        ),
        _buildField(hintText: "Please enter your postal code", controller: TextEditingController(), fieldName: "Postal Code"),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  Widget _buildField({required String hintText, required TextEditingController controller, required String fieldName, List<TextInputFormatter> formatters = const [], TextInputType? keyboardType}){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldName, style: TextStyle(
          fontSize: 1.t,
          fontWeight: FontWeight.w600,
          color: Color(0xFF777777)
        ),),
        SizedBox(
          height: 10.0,
        ),
        TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          inputFormatters: formatters,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
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
      ],
    );
  }

}
