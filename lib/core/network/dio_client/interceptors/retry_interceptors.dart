import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

class RetryInterceptorImpl {
  final int retries;
  final Dio dio;

  RetryInterceptorImpl({
    required this.retries,
    required this.dio,
  });

  RetryInterceptor get interceptor => RetryInterceptor(
        dio: dio,
        logPrint: print, // specify log function (optional)
        retries: retries, // retry count (optional)
        retryDelays: const [
          // set delays between retries (optional)
          Duration(seconds: 1), // wait 1 sec before first retry
          Duration(seconds: 2), // wait 2 sec before second retry
          Duration(seconds: 3), // wait 3 sec before third retry
        ],
      );
}
