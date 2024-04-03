class IssueModel {
  final String? complaintId;
  final String? name;
  final String? phoneNumber;
  final String? query;
  final String? imageUrl;
  final String? lat;
  final String? long;
  final String? status;
  final String? department;
  final String? email;
  final String? date;

  IssueModel({
    required this.complaintId,
    required this.name,
    required this.phoneNumber,
    required this.query,
    required this.imageUrl,
    required this.lat,
    required this.long,
    required this.status,
    required this.department,
    required this.email,
    required this.date,
  });

  factory IssueModel.fromMap(Map<String, String> map) => IssueModel(
        complaintId: map['complaintId'] ?? "",
        name: map['name'] ?? "",
        query: map['queries'] ?? "",
        phoneNumber: map['phone number'] ?? "",
        email: map['email'] ?? "",
        imageUrl: map['imageUrl'] ?? "",
        lat: map['latitude'] ?? "",
        long: map['longitude'] ?? "",
        date: map['date'] ?? "",
        status: map['status'] ?? "",
        department: map['depaetment'] ?? "",
      );
}
