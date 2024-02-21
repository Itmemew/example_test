import 'package:example_test/provider/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SelectProductPage extends StatefulWidget {
  const SelectProductPage({super.key});

  @override
  State<SelectProductPage> createState() => _SelectProductPageState();
}

class _SelectProductPageState extends State<SelectProductPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProductController>().getDataProduct();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<ProductController>(
            builder: (context, value, child) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: value.area,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              fillColor: Colors.grey.withOpacity(0.1),
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                              ),
                              hintText: 'พื้นที่',
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: value.codeProduct,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              fillColor: Colors.grey.withOpacity(0.1),
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                              ),
                              hintText: 'รหัสสินค้า',
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            value.checkAeaAndCodeProduct();
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepOrange,
                            ),
                            child: Text(
                              'ตรวจสอบ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                      if(value.checkAreaAndCodeProductInStock)
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: value.stock,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                fillColor: Colors.grey.withOpacity(0.1),
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.1),
                                  ),
                                ),
                                hintText: 'จำนวน',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              value.addDataProDuct();
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.deepOrange,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'บันทึกข้อมูล',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'รายการตรวจ',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    ...value.checkStockModel
                        .map((e) => Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildText(
                                      title: 'พื้นที่', val: e.area ?? ''),
                                  const SizedBox(width: 10),
                                  _buildText(
                                      title: 'รหัสสินค้า',
                                      val: e.codeProduct ?? ''),
                                  const SizedBox(width: 10),
                                  _buildText(
                                      title: 'จำนวน', val: '${e.stock ?? ''}'),
                                  const SizedBox(width: 10),
                                  _buildText(
                                      title: 'รอบที่ ${e.countCheck}',
                                      val: '${e.countCheck ?? ''}'),
                                ],
                              ),
                            ))
                        .toList(),
                    Text(
                      'สรุปการตรวจนับ',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    ...value.checkStockModel
                        .where((element) => element.stockConfirm != null)
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildText(
                                      title: 'พื้นที่', val: e.area ?? ''),
                                  const SizedBox(width: 10),
                                  _buildText(
                                      title: 'รหัสสินค้า',
                                      val: e.codeProduct ?? ''),
                                  const SizedBox(width: 10),
                                  _buildText(
                                      title: 'จำนวน', val: '${e.stock ?? ''}'),
                                ],
                              ),
                            ))
                        .toList(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildText({required String title, required String val}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          val,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
