import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConfigUtils {
  static final apiURL = dotenv.env["API_URL"];
}
