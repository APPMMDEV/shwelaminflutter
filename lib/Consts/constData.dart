import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../MyHelper/methodHelper.dart';
import '../modal/importproductModal.dart';

class ConstsData {
  static List<ImportModal> cartProducts = [];


  static addToCart(ImportModal product) {
    bool exist = false;

    if (cartProducts.length > 0) {
      cartProducts.forEach((prod) {
        if (prod.id == product.id) {
          if (prod.count < prod.quantity) {
            prod.count++;
          } else {
            print('Error');
          }

          exist = true;
        }
      });

      if (!exist) {
        cartProducts.add(product);
      }
    } else {
      cartProducts.add(product);
    }
  }

  static removeProduct(ImportModal product) {
    cartProducts.removeWhere((prds) => prds.id == product.id);
  }

  static addProductCount(product) {
    print('add Count');

    cartProducts.forEach((prd) {
      if (prd.id == product.id) {
        if (prd.count < prd.quantity) {
          print(' Adding${prd.count} Qut ${prd.quantity}');
          prd.count++;
        } else {
          print('Error Adding');
        }
      } else {}
    });
  }

  static reduceProductCoun(product) {
    print('reduce Count');

    cartProducts.forEach((prd) {
      if (prd.id == product.id) {
        if (prd.count > 1) {
          prd.count--;

          print('redue success Count');
        }
      } else {
        print('redue else Count');
      }
    });
  }

  static int getTotal() {
    int total = 0;

    cartProducts.forEach((product) {
      total += product.count * int.parse(product.saleprice);
    });

    return total;
  }



  static List<ImportModal> mobilecartProducts = [];

  static mobileaddToCart(ImportModal product) {
    bool exist = false;

    if (mobilecartProducts.length > 0) {
      mobilecartProducts.forEach((prod) {
        if (prod.id == product.id) {
          if (prod.count < prod.quantity) {
            prod.count++;
          } else {
            print('Error');
          }

          exist = true;
        }
      });

      if (!exist) {
        mobilecartProducts.add(product);
      }
    } else {
      mobilecartProducts.add(product);
    }
  }

  static mobileremoveProduct(ImportModal product) {
    mobilecartProducts.removeWhere((prds) => prds.id == product.id);
  }

  static mobileaddProductCount(product) {
    print('add Count');

    mobilecartProducts.forEach((prd) {
      if (prd.id == product.id) {
        if (prd.count < prd.quantity) {
          print(' Adding${prd.count} Qut ${prd.quantity}');
          prd.count++;
        } else {
          print('Error Adding');
        }
      } else {}
    });
  }

  static mobilereduceProductCoun(product) {
    print('reduce Count');

    mobilecartProducts.forEach((prd) {
      if (prd.id == product.id) {
        if (prd.count > 1) {
          prd.count--;

          print('redue success Count');
        }
      } else {
        print('redue else Count');
      }
    });
  }

  static int mobilegetTotal() {
    int total = 0;

    mobilecartProducts.forEach((product) {
      total += product.count * int.parse(product.saleprice);
    });

    return total;
  }





}
