import 'package:flutter/material.dart';
import 'package:handies/data/datasource/remote/dio/dio_client.dart';
import 'package:handies/data/datasource/remote/exception/api_error_handler.dart';
import 'package:handies/data/model/response/base/api_response.dart';
import 'package:handies/utill/app_constants.dart';

class CategoryRepo {
  final DioClient dioClient;
  CategoryRepo({@required this.dioClient});

  Future<ApiResponse> getCategoryList() async {
    try {
      final response = await dioClient.get(AppConstants.CATEGORIES_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
