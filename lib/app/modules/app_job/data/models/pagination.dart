class Pagination<T> {
  Pagination();

  late int pageNum;
  late int pageSize;
  late int pages;
  late int size;
  late int total;
  late List<T> data;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination()
    ..pageNum = json['pageNum'] as int
    ..pageSize = json['pageSize'] as int
    ..pages = json['pages'] as int
    ..size = json['size'] as int
    ..total = json['total'] as int;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pageNum': pageNum,
        'pageSize': pageSize,
        'pages': pages,
        'size': size,
        'total': total,
        'data': data
      };
}
