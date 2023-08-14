import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shwelamin/Consts/constData.dart';

import '../Consts/constName.dart';
import '../MyHelper/methodHelper.dart';
import '../modal/ImportDataRepository.dart';
import '../modal/importproductModal.dart';

class MyCartProductsPage extends StatefulWidget {
  
  
  const MyCartProductsPage({super.key});

  @override
  State<MyCartProductsPage> createState() => _MyCartProductsPageState();
}

class _MyCartProductsPageState extends State<MyCartProductsPage> {

  List<ImportModal> cartProduct =[];

  final ImportDataRepository _inputDataRepository = ImportDataRepository();


  bool _isLoading = false;
  String _status = '';


  @override
  void initState() {
    // TODO: implement initState
   cartProduct = ConstsData.cartProducts;
    _status = 'Save Invoice';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text(cartProduct.length.toString()),
      ),

      body
          :_webUI()


      

    );
  }



  Widget _webUI(){

    return Column(
      children: [
        _tableColumn(),
        _tableCell(),

        Container(
          decoration: const BoxDecoration(

              shape: BoxShape.rectangle,
              color: Colors.blue,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Container(

                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(30),color: Colors.red
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('${ConstsName.totalAmount} \t${MethodHelper.formatCurrency(ConstsData.getTotal())}\t${ConstsName.ks}',style: const TextStyle(color: Colors.white),),
                ),
              ),
              InkWell(

                onTap: (){

                  setState(() {
                    _status = 'Loading....';
                    _isLoading = true;

                    SaveingInvoice();
                  });
                },
                child: Container(

                  height: 70,

                  margin: const EdgeInsets.symmetric(horizontal: 10,),
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(30),color: Colors.red
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,


                        children: [
                          if (_isLoading)
                            const CircularProgressIndicator(
                              color: Colors.white,

                            ),


                          SizedBox(width: 10),
                          Text(_status,style: TextStyle(color: Colors.white),)
                        ]),
                  ),
                ),
              ),



            ],
          ),
        )
      ],
    );
  }

  Widget _tableColumn() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Table(

        defaultVerticalAlignment: TableCellVerticalAlignment.middle,

        children: [
          TableRow(

            children: [
              TableCell(

                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(

                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey,),
                  margin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const Text(
                    ConstsName.nos,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),

              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey,),
                  margin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const Text(
                    ConstsName.proudctname,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),

              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey,),
                  margin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const Text(
                    ConstsName.unitQuantity,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey,),
                  margin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const Text(
                    ConstsName.unitPrice,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey,),
                  margin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const Text(
                    ConstsName.totalAmount,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
  Widget _tableCell() {
    return
      Expanded(
        child: ListView.builder(
          itemCount:cartProduct.length,
          itemBuilder: (context, index) {


            String productname = cartProduct[index].product.toString();


            String saleprice =cartProduct[index].saleprice.toString();
            int count = cartProduct[index].count;


            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(
                          border: TableBorder.all(borderRadius: BorderRadius.circular(10)),


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
                                      (index + 1).toString(),
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
                                      productname,
                                    ),
                                  ),
                                ),

                                TableCell(
                                  verticalAlignment: TableCellVerticalAlignment.middle,
                                  child: Container(
                                    margin:
                                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [


                                        InkWell(

                                            onTap: (){

                                              print('OnTap : Minus');

                                              setState(() {

                                                ConstsData.reduceProductCoun(cartProduct[index]);

                                              });

                                            },

                                            child: Container(child: const Icon(CupertinoIcons.minus_circle_fill,color: Colors.red,))),


                                        Text(
                                          MethodHelper.formatCurrency(cartProduct[index].count),
                                          textAlign: TextAlign.end,
                                        ),


                                        InkWell(

                                            onTap: (){

                                              print('OnTap : Plus');

                                              setState(() {

                                                ConstsData.addProductCount(cartProduct[index]);

                                              });

                                            },

                                            child: Container(

                                                child: const Icon(CupertinoIcons.plus_circle_fill,color: Colors.red,))),


                                      ],
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
                                      MethodHelper.formatCurrency( int.parse(saleprice)*count),textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                        top: -15,
                        right: 3,

                        child: IconButton(onPressed: (){

                          setState(() {

                            ConstsData.removeProduct(cartProduct[index]);
                            // ConstsData.cartProducts.remove(cartProduct[index]);
                          });

                        }, icon: const Icon(CupertinoIcons.clear_circled_solid,color: Colors.red,)))
                  ]
              ),
            );


          },
        ),
      );
  }





  SaveingInvoice(){

    List<ImportModal> finallist = ConstsData.cartProducts;

    for(int i =0;i<finallist.length;i++){

      Update(finallist[i]);
    }
  }


   Update (ImportModal product){

    ImportModal updateInputModal = ImportModal(
      product!.id,
      product.product,
      product.realprice,
      product.saleprice,
      (product.quantity - product.count) , // var quantity_controller = TextEditingController();
      product.note,

      MethodHelper.getCurrentTimeStamp(),
    );

    UpdateData(updateInputModal);
  }


  void UpdateData(ImportModal inputModal) {
    _inputDataRepository.updateImportProduct(inputModal).then((value) {


      setState(() {
        _isLoading = false;
        _status = ConstsName.successfullyupdate;



         cartProduct= [];

         ConstsData.cartProducts=[];
      });
      // Future.delayed(const Duration(seconds: 2), () {
      //
      //
      //   Navigator.of(context).pop(); // Close the dialog
      // });
    }).catchError((e) {
      setState(() {
        _status = ConstsName.error;
        // _status = e.toString();
      });
    });
  }
}
