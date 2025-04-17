class Tender {
  final String service;
  final DateTime createdAt;
  final String clientName;
  final String builtArea;
  final String address;
  final int floors;
  final String design;
  final String facing;
  final DateTime lastDate;
  final String unitPrice;
  final String status;
  final String assignedTO;
  final String completionStatus;

  Tender({
    required this.service,
    required this.createdAt,
    required this.clientName,
    required this.builtArea,
    required this.address,
    required this.floors,
    required this.design,
    required this.facing,
    required this.lastDate,
    required this.unitPrice,
    required this.status,
    required this.assignedTO,
    required this.completionStatus,
  });

  factory Tender.fromJson(Map<String, dynamic> json) {
    DateTime parseDate(String dateStr) {
      try {
        return DateTime.parse(dateStr);
      } catch (e) {
        return DateTime.now(); // Or throw a custom error
      }
    }

    return Tender(
      service: json['service'],
      createdAt: json['createdAt'],
      clientName: json['clientName'],
      builtArea: json['builtArea'],
      address: json['address'],
      floors: json['floors'],
      design: json['design'],
      facing: json['facing'],
      lastDate: json['lastDate'],
      unitPrice: json['unitPrice'],
      status: json['status'],
      assignedTO: json['assignedTO'],
      completionStatus: json['completionStatus'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'service': service,
      'createdAt': createdAt.toIso8601String(),
      'clientName': clientName,
      'builtArea': builtArea,
      'address': address,
      'floors': floors,
      'design': design,
      'facing': facing,
      'lastDate': lastDate.toIso8601String(),
      'unitPrice': unitPrice,
      'status': status,
      'assignedTO': assignedTO,
      'completionStatus': completionStatus,
    };
  }
}
