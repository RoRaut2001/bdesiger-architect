import 'package:b_designer_architecture/Components/Buttons/update_button.dart';
import 'package:b_designer_architecture/Controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BillingInfo extends StatelessWidget {
  BillingInfo({super.key});

  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      children: [
        Row(
          children: [
            Text(
              "Billing Information",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            UpdateButton(
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        _buildField(
          controller: controller.nameControllerBilling,
          fieldName: "First Name",
          hintText: "Please enter your first name",
        ),
        _gap(),
        _buildField(
          controller: controller.lastNameControllerBilling,
          fieldName: "Last Name",
          hintText: "Please enter your last name",
        ),
        _gap(),
        _buildField(
          controller: controller.companyController,
          fieldName: "Company name (optional)",
          hintText: "Please enter company name",
        ),
        _gap(),
        _buildField(
          controller: controller.GSTController,
          fieldName: "GSTIN (optional)",
          hintText: "Please enter GST Number",
        ),
        _gap(),
        _buildField(
          controller: controller.countryController,
          fieldName: "Country",
          hintText: "Please enter country name",
        ),
        _gap(),
        _buildField(
          controller: controller.stateControllerBilling,
          fieldName: "State/Union Territory (Mandatory)",
          hintText: "Please enter state name",
        ),
        _gap(),
        _buildField(
          controller: controller.addressController,
          fieldName: "Address",
          hintText: "Please enter your address",
        ),
        _gap(),
        _buildField(
          controller: controller.cityController,
          fieldName: "City",
          hintText: "Please specify your city",
        ),
        _gap(),
        _buildField(
          controller: controller.postalController,
          fieldName: "Postal Code",
          hintText: "Please enter your postal code",
          keyboardType: TextInputType.number,
          formatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        _gap(),
        _gap(),
        _gap(),
      ],
    );
  }

  Widget _buildField({
    required String fieldName,
    required String hintText,
    required TextEditingController controller,
    List<TextInputFormatter> formatters = const [],
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF777777),
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: formatters,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey.shade500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.black54,
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1.2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _gap() => const SizedBox(height: 20.0);
}
