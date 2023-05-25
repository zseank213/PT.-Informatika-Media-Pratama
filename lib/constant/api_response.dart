class Message {
  String? error;
  String? success;

  Message({
    this.error,
    this.success,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        error: json["error"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "success": success,
      };
}

class Pagination {
  int? currentPage;
  int? totalRows;

  Pagination({
    this.currentPage,
    this.totalRows,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["current_page"],
        totalRows: json["total_rows"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "total_rows": totalRows,
      };
}
