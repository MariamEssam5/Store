import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required int id,
    required String category,
  }) async {
    print('Updating product id  = $id');

    try {
      // Send the PUT request to update the product
      Map<String, dynamic> data = await Api().put(
        url: 'https://fakestoreapi.com/products/$id',
        body: {
          'title': title,
          'price': price,
          'description': desc,
          'image': image,
          'category': category,
        },
      );

      // Log the response from the server
      print('Update response: $data');

      // Return the updated product model
      return ProductModel.fromJson(data);
    } catch (error) {
      print('Error updating product: $error');
      // Handle error or rethrow it based on your app's needs
      throw Exception('Failed to update product');
    }
  }
}
