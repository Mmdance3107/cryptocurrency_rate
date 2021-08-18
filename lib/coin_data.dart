import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apikey = 'A8825671-8E72-4BA8-B159-410CC9BB02C3';
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {

  Future getCoinData(String currency) async {
    Map<String,String> cryptoPrices = {};
    for(String crypto in cryptoList){
      String requestUrl = '$coinAPIURL/$crypto/$currency?apikey=$apikey';
      http.Response response = await http.get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double price = decodedData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }

}