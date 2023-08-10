import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shwelamin/Consts/constName.dart';
import 'package:shwelamin/MyHelper/methodHelper.dart';
import 'package:shwelamin/modal/ImportDataRepository.dart';
import 'package:shwelamin/modal/importproductModal.dart';

class AddNewImportProduct extends StatefulWidget {
  final ImportModal? updateModal;
  const AddNewImportProduct({super.key, required this.updateModal});

  @override
  State<AddNewImportProduct> createState() => _addnewimportPageState();
}

class _addnewimportPageState extends State<AddNewImportProduct> {
  final formkey = GlobalKey<FormState>();

  final ImportDataRepository _inputDataRepository = ImportDataRepository();

  final TextEditingController productname_controller = TextEditingController();
  final TextEditingController realprice_controller = TextEditingController();
  final TextEditingController saleprice_controller = TextEditingController();
  final TextEditingController quantity_controller = TextEditingController();
  final TextEditingController note_controller = TextEditingController();

  bool _isLoading = false;
  String _status = '';
  String _titleText = '';
  var tstamp = '';

  var totalpost = '0';

  bool mmtitle_valid = false;
  bool engtitle_valid = false;
  bool mmcontent_valid = false;
  bool engcontent_valid = false;
  bool imagelink_valid = false;


  bool isUpdate = false;

  String? imglinkfinal;

  String temporaryimg =
      'https://www.wikipedia.org/portal/wikipedia.org/assets/img/Wikipedia-logo-v2.png';

  @override
  void initState() {
    if (widget.updateModal != null) {
      productname_controller.text = widget.updateModal!.product;
      realprice_controller.text = widget.updateModal!.realprice;
      saleprice_controller.text = widget.updateModal!.saleprice;
      quantity_controller.text = widget.updateModal!.quantity;
      note_controller.text = widget.updateModal!.note;

      _status = ConstsName.update;
      _titleText = ConstsName.edit;
      isUpdate = true;
    } else {
      _status = ConstsName.save;
      _titleText = ConstsName.addnew;
      isUpdate = false;
    }
    super.initState();
  }

  void UpdateData(ImportModal inputModal) {
    _inputDataRepository.updateImportProduct(inputModal).then((value) {
      productname_controller.clear();
      realprice_controller.clear();
      saleprice_controller.clear();
      quantity_controller.clear();
      note_controller.clear();

      setState(() {
        _isLoading = false;
        _status = ConstsName.successfullyupdate;
      });
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pop(); // Close the dialog
      });
    }).catchError((e) {
      setState(() {
        _status = ConstsName.error;
        // _status = e.toString();
      });
    }).whenComplete(() {
      setState(() async {
        _isLoading = false;
        await Future.delayed(const Duration(seconds: 3));
        _status = ConstsName.update;
      });
    });
  }

  void SaveData(ImportModal inputModal) {
    _inputDataRepository.addImportProduct(inputModal).then((value) {
      productname_controller.clear();
      realprice_controller.clear();
      saleprice_controller.clear();
      quantity_controller.clear();
      note_controller.clear();

      setState(() {
        _isLoading = false;
        _status = ConstsName.successfullysave;
      });
    }).catchError((e) {
      setState(() {
        _isLoading = false;
        _status = e.toString();
      });
      // _status = ConstsName.error;
    }).whenComplete(() {
      setState(() async {
        _isLoading = false;
        await Future.delayed(const Duration(seconds: 3));
        _status = ConstsName.save;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_titleText,style: const TextStyle(fontSize: 13),)),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Form(
                          key: formkey,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: TextFormField(
                                    controller: productname_controller,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "${ConstsName.proudctname} can't be Empty";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        labelText: ConstsName.proudctname,
                                        border: OutlineInputBorder())),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: TextFormField(
                                    controller: realprice_controller,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "${ConstsName.real_price} can't be Empty";
                                      }else {
                                        return null;
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        labelText: ConstsName.labelreal_price,
                                        border: OutlineInputBorder())),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    controller: saleprice_controller,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "${ConstsName.sale_price} can't be Empty";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        labelText: ConstsName.labelsale_price,
                                        border: OutlineInputBorder())),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: TextFormField(
                                    controller: quantity_controller,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],


                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "${ConstsName.quantity} can't be Empty";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        labelText: ConstsName.labelquantity,
                                        border: OutlineInputBorder())),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: TextFormField(
                                    controller: note_controller,
                                    // s
                                    maxLines: 5,
                                    decoration: const InputDecoration(
                                        labelText: ConstsName.note,
                                        border: OutlineInputBorder())),
                              ),
                              Center(child: CheckBtn())
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget CheckBtn() {
    if (isUpdate) {
      return UpdateBtn();
    } else {
      return SaveBtn();
    }
  }

  Widget SaveBtn() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      height: 60,
      child: ElevatedButton(
          onPressed: () {

            if (formkey.currentState!.validate()) {

              setState(() {
                _isLoading = true;
                _status = ConstsName.saving;
              });
              ImportModal saveinputmodal = ImportModal(
                  null,
                  productname_controller.text,
                  realprice_controller.text,
                  saleprice_controller.text,
                  quantity_controller
                      .text, // var quantity_controller = TextEditingController();
                  note_controller.text,
              MethodHelper.getCurrentTimeStamp());

              SaveData(saveinputmodal);
            }
          },
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            if (_isLoading)
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            Text(_status)
          ])),
    );
  }

  Widget UpdateBtn() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      height: 60,
      child: ElevatedButton(
          onPressed: () {

            if (formkey.currentState!.validate()) {
              setState(() {
                _isLoading = true;
                _status = ConstsName.saving;
              });
              ImportModal updateInputModal = ImportModal(
                  widget.updateModal!.id,
                  productname_controller.text,
                  realprice_controller.text,
                  saleprice_controller.text,
                  quantity_controller
                      .text, // var quantity_controller = TextEditingController();
                  note_controller.text,
                  MethodHelper.getCurrentTimeStamp());

              UpdateData(updateInputModal);
            }
          },
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            if (_isLoading)
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            Text(_status)
          ])),
    );
  }


}
