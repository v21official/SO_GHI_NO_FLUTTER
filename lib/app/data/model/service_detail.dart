// To parse this JSON data, do
//
//     final serviceDetail = serviceDetailFromJson(jsonString);

import 'dart:convert';

ServiceDetail serviceDetailFromJson(String str) => ServiceDetail.fromJson(json.decode(str));

String serviceDetailToJson(ServiceDetail data) => json.encode(data.toJson());

class ServiceDetail {
  ServiceDetail({
    required this.content,
    this.pageable,
    this.totalElements,
    this.totalPages,
    this.last,
    this.size,
    this.number,
    this.sort,
    this.first,
    this.numberOfElements,
    this.empty,
  });

  List<Content> content;
  Pageable? pageable;
  int? totalElements;
  int? totalPages;
  bool? last;
  int? size;
  int? number;
  Sort? sort;
  bool? first;
  int? numberOfElements;
  bool? empty;

  factory ServiceDetail.fromJson(Map<String, dynamic> json) => ServiceDetail(
    content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
    pageable: Pageable.fromJson(json["pageable"]),
    totalElements: json["totalElements"],
    totalPages: json["totalPages"],
    last: json["last"],
    size: json["size"],
    number: json["number"],
    sort: Sort.fromJson(json["sort"]),
    first: json["first"],
    numberOfElements: json["numberOfElements"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
    "pageable": pageable!.toJson(),
    "totalElements": totalElements,
    "totalPages": totalPages,
    "last": last,
    "size": size,
    "number": number,
    "sort": sort!.toJson(),
    "first": first,
    "numberOfElements": numberOfElements,
    "empty": empty,
  };
}

class Content {
  Content({
    required this.id,
    required this.serviceId,
    required this.url,
    required this.port,
    required this.timeout,
    required this.type,
    required this.startDate,
    required this.expireDate,
    required this.createdBy,
    required this.method,
    required this.canView,
    required this.lastSuccess,
    required this.lastFail,
    required this.available,
    required this.time,
    required this.host,
    required this.creationDate,
    required this.updatedDate,
    required this.expirationDate,
    required this.message,
    required this.data,
  });

  int id;
  int serviceId;
  String url;
  int port;
  int timeout;
  Type type;
  DateTime startDate;
  DateTime expireDate;
  String createdBy;
  String method;
  bool canView;
  DateTime lastSuccess;
  DateTime lastFail;
  bool available;
  int time;
  String host;
  DateTime creationDate;
  DateTime updatedDate;
  DateTime expirationDate;
  String message;
  String data;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    id: json["id"],
    serviceId: json["serviceId"],
    url: json["url"],
    port: json["port"],
    timeout: json["timeout"],
    type: json["type"],
    startDate: DateTime.parse(json["startDate"]),
    expireDate: DateTime.parse(json["expireDate"]),
    createdBy: json["createdBy"],
    method: json["method"],
    canView: json["canView"],
    lastSuccess: DateTime.parse(json["lastSuccess"]),
    lastFail: DateTime.parse(json["lastFail"]),
    available: json["available"],
    time: json["time"] == null ? null : json["time"],
    host: json["host"] == null ? null : json["host"],
    creationDate: DateTime.parse(json["creationDate"]),
    updatedDate: DateTime.parse(json["updatedDate"]),
    expirationDate: DateTime.parse(json["expirationDate"]),
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : json["data"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "serviceId": serviceId,
    "url": url,
    "port": port,
    "timeout": timeout,
    "type": type,
    "startDate": startDate.toIso8601String(),
    "expireDate": expireDate.toIso8601String(),
    "createdBy": createdBy,
    "method": method,
    "canView": canView,
    "lastSuccess": lastSuccess.toIso8601String(),
    "lastFail": lastFail.toIso8601String(),
    "available": available,
    "time": time,
    "host": host,
    "creationDate": creationDate.toIso8601String(),
    "updatedDate": updatedDate.toIso8601String(),
    "expirationDate": expirationDate.toIso8601String(),
    "message": message,
    "data": data,
  };
}

class Pageable {
  Pageable({
    this.sort,
    this.offset,
    this.pageNumber,
    this.pageSize,
    this.unpaged,
    this.paged,
  });

  Sort? sort;
  int? offset;
  int? pageNumber;
  int? pageSize;
  bool? unpaged;
  bool? paged;

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
    sort: Sort.fromJson(json["sort"]),
    offset: json["offset"],
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    unpaged: json["unpaged"],
    paged: json["paged"],
  );

  Map<String, dynamic> toJson() => {
    "sort": sort!.toJson(),
    "offset": offset,
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "unpaged": unpaged,
    "paged": paged,
  };
}

class Sort {
  Sort({
    this.unsorted,
    this.sorted,
    this.empty,
  });

  bool? unsorted;
  bool? sorted;
  bool? empty;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
    unsorted: json["unsorted"],
    sorted: json["sorted"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "unsorted": unsorted,
    "sorted": sorted,
    "empty": empty,
  };
}