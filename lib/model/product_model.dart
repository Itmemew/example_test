class ProductModel {
  String codeProduct;
  int stock;
  String area;

  ProductModel({
    required this.codeProduct,
    required this.stock,
    required this.area,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    codeProduct: json["code_product"],
    stock: json["stock"],
    area: json["area"],
  );

  Map<String, dynamic> toJson() => {
    "code_product": codeProduct,
    "stock": stock,
    "area": area,
  };

}
