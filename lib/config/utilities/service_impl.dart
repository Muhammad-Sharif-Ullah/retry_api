import 'package:dartz/dartz.dart';
import 'package:retry_api/core/error/error.dart';

class ServiceImpl {
  static Future<dynamic> call(Either<Failure, dynamic> serviceResult) async {
    return await serviceResult.fold((l) {
      throw l.message;
    }, (r) {
      return r;
    });
  }
}
