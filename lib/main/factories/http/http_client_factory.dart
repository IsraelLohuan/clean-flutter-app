import 'package:ForDev/data/http/http.dart';
import 'package:ForDev/infra/http/http.dart';
import 'package:http/http.dart';

HttpClient makeHttpAdapter() {
  final client = Client();
  return HttpAdapter(client);
}