// To parse this JSON data, do
//
//     final userRole = userRoleFromJson(jsonString);

import 'dart:convert';

UserRole userRoleFromJson(String str) => UserRole.fromJson(json.decode(str));

String userRoleToJson(UserRole data) => json.encode(data.toJson());

class UserRole {
  UserRole({
    required this.content,
    this.pageable,
    this.last,
    this.totalElements,
    this.totalPages,
    this.size,
    this.number,
    this.sort,
    this.numberOfElements,
    this.first,
    this.empty,
  });

  List<Content> content;
  Pageable? pageable;
  bool? last;
  int? totalElements;
  int? totalPages;
  int? size;
  int? number;
  Sort? sort;
  int? numberOfElements;
  bool? first;
  bool? empty;

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
    content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
    pageable: Pageable.fromJson(json["pageable"]),
    last: json["last"],
    totalElements: json["totalElements"],
    totalPages: json["totalPages"],
    size: json["size"],
    number: json["number"],
    sort: Sort.fromJson(json["sort"]),
    numberOfElements: json["numberOfElements"],
    first: json["first"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
    "pageable": pageable!.toJson(),
    "last": last,
    "totalElements": totalElements,
    "totalPages": totalPages,
    "size": size,
    "number": number,
    "sort": sort!.toJson(),
    "numberOfElements": numberOfElements,
    "first": first,
    "empty": empty,
  };
}

class Content {
  Content({
    required this.id,
    required this.userId,
    required this.roleId,
  });

  int id;
  int userId;
  int roleId;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    id: json["id"],
    userId: json["userId"],
    roleId: json["roleId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "roleId": roleId,
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
    this.sorted,
    this.unsorted,
    this.empty,
  });

  bool? sorted;
  bool? unsorted;
  bool? empty;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
    sorted: json["sorted"],
    unsorted: json["unsorted"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "sorted": sorted,
    "unsorted": unsorted,
    "empty": empty,
  };
}
