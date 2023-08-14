import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shwelamin/Consts/constData.dart';
import 'package:shwelamin/modal/importproductModal.dart';

import 'Consts/constName.dart';
import 'MyHelper/methodHelper.dart';
import 'modal/ImportDataRepository.dart';
import 'pages/addnewimportdata.dart';

class ImportDataComponent extends StatefulWidget {
  final ImportDataRepository inputDataRepository = ImportDataRepository();
  final ImportModal importModal;
  final int Index;

  bool isVisiable = false;

  ImportDataComponent(
      {super.key, required this.importModal, required this.Index});

  @override
  State<ImportDataComponent> createState() => _ImportDataComponentState();
}

class _ImportDataComponentState extends State<ImportDataComponent> {
  @override
  Widget build(BuildContext context) {
    String productname = widget.importModal.product.toString();
    String timeStamp = widget.importModal.timeStamp.toString();
    String realprice = widget.importModal.realprice.toString();

    String saleprice = widget.importModal.saleprice.toString();
    String quantity = widget.importModal.quantity.toString();
    String note = widget.importModal.note.toString();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Table(
        border: TableBorder.all(borderRadius: BorderRadius.circular(10)),

        // columnWidths: const <int, TableColumnWidth>{
        //   0: IntrinsicColumnWidth(),
        //   1: FlexColumnWidth(),
        //   2: FixedColumnWidth(),
        // },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,

        children: [
          TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    (widget.Index + 1).toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    MethodHelper.ConvertTimeStampToDate(timeStamp),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    productname,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      Text(
                        MethodHelper.formatCurrency(int.parse(realprice)),
                        textAlign: TextAlign.end,
                      ),


                    ]
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      Text(
                        MethodHelper.formatCurrency(int.parse(saleprice)),
                        textAlign: TextAlign.end,
                      )
                      
                    ],
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    MethodHelper.formatCurrency(int.parse(quantity)),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    note,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _editButtonOnpress(context, widget.importModal);
                        });
                      },
                      tooltip: 'Edit',
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        _showLoadingDialog(context, widget.importModal);
                      },
                      tooltip: 'Delete',
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {

                          ConstsData.cartProducts.add(widget.importModal);

                        });
                      },
                      tooltip: 'Add To Cart',
                      icon: const Icon(
                        Icons.add_shopping_cart,
                        color: Colors.red,
                      ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  void _editButtonOnpress(context, ImportModal inputModal) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AddNewImportProduct(updateModal: inputModal)));
  }

  Future _deleteItem(item) async {
    try {
      await widget.inputDataRepository.deleteImportProduct(item);

      Fluttertoast.showToast(
          msg: ConstsName.successfullydelete,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      // await Future.delayed(const Duration(seconds: 2));

      // _back();
    } catch (e) {
      Fluttertoast.showToast(
          msg: ConstsName.deletefail,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void _showLoadingDialog(BuildContext context, item) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Deleting...'),
            ],
          ),
        );
      },
    );

    await _deleteItem(item).then((value) => {Navigator.of(context).pop()});
  }
}
