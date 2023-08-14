import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'importproductModal.g.dart';

@JsonSerializable()
class ImportModal {
  @JsonKey(includeToJson: false, includeFromJson: false)
  int count = 1;


  @JsonKey(includeToJson: false)
  final int? id;
  final String product;
  final String realprice;
  final String saleprice;
  final int quantity;
  final String note;
  final String timeStamp;

  factory ImportModal.fromJson(Map<String, dynamic> json) =>
      _$ImportModalFromJson(json);

  ImportModal(this.id, this.product, this.realprice, this.saleprice,
      this.quantity, this.note, this.timeStamp);

  Map<String, dynamic> toJson() => _$ImportModalToJson(this);
}
