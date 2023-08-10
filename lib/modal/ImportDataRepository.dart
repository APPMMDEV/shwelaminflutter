import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shwelamin/modal/importproductModal.dart';

class ImportDataRepository {
  final SupabaseClient _client = Supabase.instance.client;
  Stream<List<ImportModal>> getAllInputData() {
    final inputDatas =
        _client.from('InputData').stream(primaryKey: ['id']).order('product',ascending: true).map((event) {
      return event.map((e) {
        return ImportModal.fromJson(e);
      }).toList();
    });

    return inputDatas;
  }

  Future addImportProduct(ImportModal importModal) async {
    print('::: future addimport');
    await _client.from('InputData').insert(importModal);
  }

  Future<void> deleteImportProduct(ImportModal importModal) async {
    await _client.from('InputData').delete().eq('id', importModal.id);
  }

  Future<void> updateImportProduct(ImportModal importModal) async {
    await _client.from('InputData').update({
      'id': importModal.id,
      'product': importModal.product,
      'realprice': importModal.realprice,
      'saleprice': importModal.saleprice,
      'quantity': importModal.quantity,
      'note': importModal.note,
    }).eq('id', importModal.id);
  }
}
