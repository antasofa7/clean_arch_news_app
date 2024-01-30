import 'package:dio/dio.dart';

abstract class DataSet<T> {
  final T? data;
  final DioException? error;

  DataSet({this.data, this.error});
}

class DataSuccess<T> extends DataSet<T> {
  DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataSet<T> {
  DataFailed(DioException error) : super(error: error);
}
