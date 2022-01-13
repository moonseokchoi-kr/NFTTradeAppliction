// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:application/models/item.dart';

PostResponse postResponseFromJson(String str) =>
    PostResponse.fromJson(json.decode(str));

String postResponseToJson(PostResponse data) => json.encode(data.toJson());

class PostResponse {
  PostResponse({
    this.pageable,
    this.last,
    this.totalElements,
    this.totalPages,
    this.size,
    this.number,
    this.sort,
    this.first,
    this.numberOfElements,
    this.empty,
    content,
  }) {
    if (null != content)
      this.content = content;
    else
      this.content = [];
  }

  List<Item> content = [];
  Pageable? pageable;
  bool? last;
  int? totalElements;
  int? totalPages;
  int? size;
  int? number;
  Sort? sort;
  bool? first;
  int? numberOfElements;
  bool? empty;

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
        content: json["content"] == null
            ? null
            : List<Item>.from(json["content"].map((x) => Item.fromJson(x))),
        pageable: json["pageable"] == null
            ? null
            : Pageable.fromJson(json["pageable"]),
        last: json["last"] == null ? null : json["last"],
        totalElements:
            json["totalElements"] == null ? null : json["totalElements"],
        totalPages: json["totalPages"] == null ? null : json["totalPages"],
        size: json["size"] == null ? null : json["size"],
        number: json["number"] == null ? null : json["number"],
        sort: json["sort"] == null ? null : Sort.fromJson(json["sort"]),
        first: json["first"] == null ? null : json["first"],
        numberOfElements:
            json["numberOfElements"] == null ? null : json["numberOfElements"],
        empty: json["empty"] == null ? null : json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable == null ? null : pageable!.toJson(),
        "last": last == null ? null : last,
        "totalElements": totalElements == null ? null : totalElements,
        "totalPages": totalPages == null ? null : totalPages,
        "size": size == null ? null : size,
        "number": number == null ? null : number,
        "sort": sort == null ? null : sort!.toJson(),
        "first": first == null ? null : first,
        "numberOfElements": numberOfElements == null ? null : numberOfElements,
        "empty": empty == null ? null : empty,
      };
}

class Pageable {
  Pageable({
    this.sort,
    this.offset,
    this.pageNumber,
    this.pageSize,
    this.paged,
    this.unpaged,
  });

  Sort? sort;
  int? offset;
  int? pageNumber;
  int? pageSize;
  bool? paged;
  bool? unpaged;

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: json["sort"] == null ? null : Sort.fromJson(json["sort"]),
        offset: json["offset"] == null ? null : json["offset"],
        pageNumber: json["pageNumber"] == null ? null : json["pageNumber"],
        pageSize: json["pageSize"] == null ? null : json["pageSize"],
        paged: json["paged"] == null ? null : json["paged"],
        unpaged: json["unpaged"] == null ? null : json["unpaged"],
      );

  Map<String, dynamic> toJson() => {
        "sort": sort == null ? null : sort!.toJson(),
        "offset": offset == null ? null : offset,
        "pageNumber": pageNumber == null ? null : pageNumber,
        "pageSize": pageSize == null ? null : pageSize,
        "paged": paged == null ? null : paged,
        "unpaged": unpaged == null ? null : unpaged,
      };
}

class Sort {
  Sort({
    this.empty,
    this.sorted,
    this.unsorted,
  });

  bool? empty;
  bool? sorted;
  bool? unsorted;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        empty: json["empty"] == null ? null : json["empty"],
        sorted: json["sorted"] == null ? null : json["sorted"],
        unsorted: json["unsorted"] == null ? null : json["unsorted"],
      );

  Map<String, dynamic> toJson() => {
        "empty": empty == null ? null : empty,
        "sorted": sorted == null ? null : sorted,
        "unsorted": unsorted == null ? null : unsorted,
      };
}
