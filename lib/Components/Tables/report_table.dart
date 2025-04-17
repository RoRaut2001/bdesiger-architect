import 'package:flutter/material.dart';
import '../../Model/report_model.dart';

class CommonDataTable extends StatelessWidget {
  final CommonData commonData;

  const CommonDataTable({required this.commonData});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        childAspectRatio: 10/1
      ),
      children: [
        _buildDataRow("Client Name", commonData.createdBy ?? 'Unable to fetch name'),
        _buildDataRow("Selected Services", commonData.selectedServices?.join(', ') ?? '-'),
        _buildDataRow("Plot Area", '(${commonData.plotArea?.frontSide ?? '0'} x ${commonData.plotArea?.leftSide ?? '0'}) (${commonData.plotArea?.backSide ?? '0'} x ${commonData.plotArea?.rightSide ?? '0'})'),
        _buildDataRow("Builtup Area", '(${commonData.builtupArea?.frontSide ?? '0'} x ${commonData.builtupArea?.leftSide ?? '0'}) (${commonData.builtupArea?.backSide ?? '0'} x ${commonData.builtupArea?.rightSide ?? '0'})'),
        _buildDataRow("Total Builtup Area", '${commonData.totalBuildupArea ?? '0'}'),
        _buildDataRow("Floor Count", '${commonData.floorCount ?? '0'}'),
        _buildDataRow("Location", commonData.location ?? 'Unable to fetch location'),
        _buildDataRow("Family Member Count", '${commonData.familyMemberCount ?? '0'}'),
        _buildDataRow("Vastu Standard", commonData.isVastuStandard ?? 'No'),
        _buildDataRow("Landing Front Facing", commonData.homeFrontFacing ?? '-'),
        _buildDataRow("Bike Count", '${commonData.bike ?? '0'}'),
        _buildDataRow("Car Count", '${commonData.cars ?? '0'}'),
        _buildDataRow("SUV Count", '${commonData.suv ?? '0'}'),
      ],
    );
  }

  // Helper method to create each data row in the vertical table
  Widget _buildDataRow(String title, String value) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black
        )
      ),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,  // Prevents overflow if text is too long
            ),
          ),
        ],
      ),
    );
  }
}

class FloorPlanTable extends StatelessWidget {
  final FloorPlan floorPlan;

  const FloorPlanTable({required this.floorPlan});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 10 / 1,
      ),
      children: [
        _buildDataRow("Elevation Type", floorPlan.elevationType ?? '-'),
        _buildDataRow("Floor Plan Type", floorPlan.floorPlanType?.join(', ') ?? '-'),
        _buildDataRow("Side Margin", '(${floorPlan.sideMargin?.frontSide ?? '0'} x ${floorPlan.sideMargin?.leftSide ?? '0'})'),
        _buildDataRow("Side Details", '(${floorPlan.sideDetails?.frontSide ?? '0'} x ${floorPlan.sideDetails?.leftSide ?? '0'})'),
        _buildDataRow("Floor Data", floorPlan.floorData?.toString() ?? '-'),
        _buildDataRow("Floor Plan Amount", '${floorPlan.floorPlanAmount ?? '0'}'),
      ],
    );
  }

  Widget _buildDataRow(String title, String value) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}


class ThreeDPlanTable extends StatelessWidget {
  final ThreeDPlan threeDPlan;

  const ThreeDPlanTable({required this.threeDPlan});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 10 / 1,
      ),
      children: [
        _buildDataRow("Elevation Type", threeDPlan.elevationType?.join(", ") ?? '-'),
        _buildDataRow("Budget", threeDPlan.budget ?? '-'),
        _buildDataRow("Feature", threeDPlan.feature?.join(', ') ?? '-'),
        _buildDataRow("Views", threeDPlan.views?.join(', ') ?? '-'),
        _buildDataRow("ThreeD Plan Amount", '${threeDPlan.threeDPlanAmount ?? '0'}'),
      ],
    );
  }

  Widget _buildDataRow(String title, String value) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class InteriorPlanTable extends StatelessWidget {
  final InteriorPlan interiorPlan;

  const InteriorPlanTable({required this.interiorPlan});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 10 / 1,
      ),
      children: [
        _buildDataRow("Service Type", interiorPlan.serviceType ?? '-'),
        _buildDataRow("Carpet Area", '(${interiorPlan.carpetArea?.frontSide ?? '0'} x ${interiorPlan.carpetArea?.leftSide ?? '0'})'),
        _buildDataRow("Total Carpet Area", '${interiorPlan.totalCarpetArea ?? '0'}'),
        _buildDataRow("Interior Design Type", interiorPlan.interiorDesignType ?? '-'),
        _buildDataRow("Design Details", interiorPlan.designDetails?.join(', ') ?? '-'),
        _buildDataRow("Budget", interiorPlan.budget ?? '-'),
        _buildDataRow("Interior Amount", '${interiorPlan.interiorAmount ?? '0'}'),
      ],
    );
  }

  Widget _buildDataRow(String title, String value) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}



