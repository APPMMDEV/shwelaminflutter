
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shwelamin/Consts/constData.dart';

import '../Consts/constName.dart';
import '../MyHelper/methodHelper.dart';
import '../modal/ImportDataRepository.dart';
import '../modal/importproductModal.dart';

class MobileCardProdctPage extends StatefulWidget {
  
  
  const MobileCardProdctPage({super.key});

  @override
  State<MobileCardProdctPage> createState() => _MobileCardProdctPageState();
}

class _MobileCardProdctPageState extends State<MobileCardProdctPage> {

  List<ImportModal> _mobileCardProdct =[];

  final ImportDataRepository _inputDataRepository = ImportDataRepository();


  bool _isLoading = false;
  String _status = '';


  @override
  void initState() {
    // TODO: implement initState
   _mobileCardProdct = ConstsData.mobilecartProducts;
    _status = 'Save Invoice';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text(_mobileCardProdct.length.toString()),
      ),

      body: _mobileUI()


      

    );
  }

  Widget _mobileUI (){

    return Column(
      children: [
        _mobiletableColumn(),
        Expanded(child: _mobiletableCell()),

        Container(
          decoration: const BoxDecoration(

              shape: BoxShape.rectangle,
              color: Colors.blue,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(

                margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),color: Colors.red
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('${ConstsName.totalAmount} \t${MethodHelper.formatCurrency(ConstsData.mobilegetTotal())}\t${ConstsName.ks}',style: const TextStyle(color: Colors.white,fontSize: 10),),
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

                  height: 40,

                  margin: const EdgeInsets.symmetric(horizontal: 10,),
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(30),color: Colors.red
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,


                        children: [
                          if (_isLoading)
                            const CircularProgressIndicator(
                              color: Colors.white,

                            ),


                          const SizedBox(width: 10),
                          Text(_status,style: const TextStyle(color: Colors.white,fontSize: 10),)
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





  Widget _mobiletableColumn() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Table(

        defaultVerticalAlignment: TableCellVerticalAlignment.middle,

        children: [
          TableRow(

            children: [
              TableCell(


                child: Container(

                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey,),


                  child: const Text(
                    ConstsName.nos,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10),
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
                    style: TextStyle(fontSize: 10),
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
                    style: TextStyle(fontSize: 10),
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
                    style: TextStyle(fontSize: 10),
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
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
  Widget _mobiletableCell() {
    return
      Expanded(
        child: ListView.builder(
          itemCount:_mobileCardProdct.length,
          itemBuilder: (context, index) {


            String productname = _mobileCardProdct[index].product.toString();


            String saleprice =_mobileCardProdct[index].saleprice.toString();
            int count = _mobileCardProdct[index].count;


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
                                      style: const TextStyle(fontSize: 10),
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
                                      productname, style: const TextStyle(fontSize: 10),
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

                                                ConstsData.mobilereduceProductCoun(_mobileCardProdct[index]);

                                              });

                                            },

                                            child: Container(child: const Icon(CupertinoIcons.minus_circle_fill,color: Colors.red,size: 12,))),


                                        Text(
                                          MethodHelper.formatCurrency(_mobileCardProdct[index].count),
                                          textAlign: TextAlign.end, style: const TextStyle(fontSize: 7),
                                        ),


                                        InkWell(

                                            onTap: (){

                                              print('OnTap : Plus');

                                              setState(() {

                                                ConstsData.mobileaddProductCount(_mobileCardProdct[index]);

                                              });

                                            },

                                            child: Container(

                                                child: const Icon(CupertinoIcons.plus_circle_fill,color: Colors.red,size: 12,))),


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
                                          textAlign: TextAlign.end, style: const TextStyle(fontSize: 10),
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
                                      MethodHelper.formatCurrency( int.parse(saleprice)*count),textAlign: TextAlign.end, style: const TextStyle(fontSize: 10),
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

                            ConstsData.mobileremoveProduct(_mobileCardProdct[index]);

                          });

                        }, icon: const Icon(CupertinoIcons.clear_circled_solid,color: Colors.red,size: 15,)))
                  ]
              ),
            );


          },
        ),
      );
  }



  SaveingInvoice(){

    List<ImportModal> finallist = ConstsData.mobilecartProducts;

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



         _mobileCardProdct= [];

         ConstsData.mobilecartProducts=[];
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
