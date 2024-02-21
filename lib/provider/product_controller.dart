import 'package:example_test/mock_data/product_mock_data.dart';
import 'package:example_test/model/check_stock_model.dart';
import 'package:example_test/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class ProductController extends ChangeNotifier {
  late BuildContext context;

  ProductController({required this.context});

  final TextEditingController area = TextEditingController();
  final TextEditingController codeProduct = TextEditingController();
  final TextEditingController stock = TextEditingController();
  bool _checkAreaAndCodeProductInStock = false;

  List<ProductModel> _productModel = [];
  List<CheckStockModel> _checkStockModel = [];

  Future<void> getDataProduct() async {
    productModel = productData.map((e) => ProductModel.fromJson(e)).toList();
  }

  void checkAeaAndCodeProduct() {
    final check = productModel.firstWhereOrNull((element) =>
        element.area.toLowerCase() == area.text.toLowerCase() &&
        element.codeProduct.toLowerCase() == codeProduct.text.toLowerCase());
    if (check != null) {
      final countCheck = checkStockModel
          .where((element) =>
              element.area?.toLowerCase() == check.area.toLowerCase() &&
              element.codeProduct?.toLowerCase() ==
                  check.codeProduct.toLowerCase())
          .toList();
      if (countCheck.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('เคยบันทึกข้อมูลแล้ว'),
        ));
      } else {
        checkAreaAndCodeProductInStock = true;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('พื้นที่หรือข้อมูลสินค้าไม่ตรงกับฐานข้อมูล')));
    }
  }

  void addDataProDuct() {
    CheckStockModel newData = CheckStockModel();
    newData.area = area.text;
    newData.codeProduct = codeProduct.text;
    newData.stock = int.parse(stock.text);
    final countCheck = checkStockModel.where((element) =>
        element.area?.toLowerCase() == area.text.toLowerCase() &&
        element.codeProduct?.toLowerCase() == codeProduct.text.toLowerCase());

    newData.countCheck = countCheck.isEmpty ? 1 : countCheck.length +1;
    checkStockModel.add(newData);

    checkAreaAndCodeProductInStock = false;
    area.clear();
    codeProduct.clear();
    stock.clear();
  }

  List<ProductModel> get productModel => _productModel;

  set productModel(List<ProductModel> value) {
    _productModel = value;
    notifyListeners();
  }

  List<CheckStockModel> get checkStockModel => _checkStockModel;

  set checkStockModel(List<CheckStockModel> value) {
    _checkStockModel = value;
    notifyListeners();
  }

  bool get checkAreaAndCodeProductInStock => _checkAreaAndCodeProductInStock;

  set checkAreaAndCodeProductInStock(bool value) {
    _checkAreaAndCodeProductInStock = value;
    notifyListeners();
  }
}
