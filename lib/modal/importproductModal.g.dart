// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'importproductModal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImportModal _$ImportModalFromJson(Map<String, dynamic> json) => ImportModal(
      json['id'] as int?,
      json['product'] as String,
      json['realprice'] as String,
      json['saleprice'] as String,
      json['quantity'] as int,
      json['note'] as String,
      json['timeStamp'] as String,
    );

Map<String, dynamic> _$ImportModalToJson(ImportModal instance) =>
    <String, dynamic>{
      'product': instance.product,
      'realprice': instance.realprice,
      'saleprice': instance.saleprice,
      'quantity': instance.quantity,
      'note': instance.note,
      'timeStamp': instance.timeStamp,
    };
