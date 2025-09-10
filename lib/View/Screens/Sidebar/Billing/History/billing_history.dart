import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Controller/billing_controller.dart';
import '../../../../../API/Model/billing_history_model.dart';

class BillingHistory extends StatelessWidget {
  BillingHistory({super.key});

  final BillingController controller = Get.find<BillingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.orders.isEmpty) {
        return const Center(child: Text("No billing history found."));
      }

      // Flatten all orders & services into a single list for the table
      final List<_RowData> tableRows = [];
      int serial = 1;
      for (var order in controller.orders) {
        for (var service in order.services) {
          tableRows.add(_RowData(serial: serial++, order: order, service: service));
        }
      }

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 1.5,
          child: PaginatedDataTable(
            rowsPerPage: 10,
            showFirstLastButtons: true,
            columnSpacing: 20,
            headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
            dataRowHeight: 60,
            columns: const [
              DataColumn(label: Text("S.No")),
              DataColumn(label: Text("Order ID")),
              DataColumn(label: Text("Service Name")),
              DataColumn(label: Text("Order Value")),
              DataColumn(label: Text("Platform Commission")),
              DataColumn(label: Text("GST")),
              DataColumn(label: Text("Total")),
              DataColumn(label: Text("Status")),
              DataColumn(label: Text("Date")),
              DataColumn(label: Text("Invoice to Client")),
              DataColumn(label: Text("Invoice by Platform")),
            ],
            source: _BillingDataSource(tableRows),
          ),
        ),
      );
    });
  }
}

class _BillingDataSource extends DataTableSource {
  final List<_RowData> rows;

  _BillingDataSource(this.rows);

  @override
  DataRow? getRow(int index) {
    if (index >= rows.length) return null;
    final row = rows[index];
    return DataRow(
      color: MaterialStateProperty.all(Colors.white), // row background
      cells: [
        DataCell(Text(row.serial.toString())),
        DataCell(Text(row.order.orderId)),
        DataCell(Text(row.service.name)),
        DataCell(Text(row.service.orderValue.toString())),
        DataCell(Text("${(row.order.platformCommission * 100).toInt()}%")),
        DataCell(Text("${(row.service.gst * 100).toInt()}%")),
        DataCell(Text(row.service.total.toString())),
        DataCell(Text(row.order.status)),
        DataCell(Text(row.order.date)),
        DataCell(IconButton(icon: const Icon(Icons.download), onPressed: () {})),
        DataCell(IconButton(icon: const Icon(Icons.download), onPressed: () {})),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => rows.length;

  @override
  int get selectedRowCount => 0;
}

class _RowData {
  final int serial;
  final BillingOrderModel order;
  final BillingServiceModel service;

  _RowData({
    required this.serial,
    required this.order,
    required this.service,
  });
}