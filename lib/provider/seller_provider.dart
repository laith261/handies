import 'package:flutter/material.dart';
import 'package:handies/data/model/response/base/api_response.dart';
import 'package:handies/data/model/response/seller_model.dart';
import 'package:handies/data/repository/seller_repo.dart';
import 'package:handies/helper/api_checker.dart';

class SellerProvider extends ChangeNotifier {
  final SellerRepo sellerRepo;
  SellerProvider({@required this.sellerRepo});

  List<SellerModel> _orderSellerList = [];
  SellerModel _sellerModel;

  List<SellerModel> get orderSellerList => _orderSellerList;
  SellerModel get sellerModel => _sellerModel;

  void initSeller(String sellerId, BuildContext context) async {
    _orderSellerList = [];
    ApiResponse apiResponse = await sellerRepo.getSeller(sellerId);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      _orderSellerList = [];
      _orderSellerList.add(SellerModel.fromJson(apiResponse.response.data));
      _sellerModel = SellerModel.fromJson(apiResponse.response.data);
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }
}
