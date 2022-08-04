import 'package:forDev/data/http/http.dart';
import 'package:forDev/infra/http/http.dart';
import 'package:http/http.dart';

HttpClient makeHttpAdapter() {
  final client = Client();
  return HttpAdapter(client);
}