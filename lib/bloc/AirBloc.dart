import 'package:finedust/models/air_result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rxdart/rxdart.dart';

/**
 * Created by freelife1191.good@gmail.com on 2019-06-10
 * Blog : https://freedeveloper.tistory.com/
 * Github : https://github.com/freelife1191
 */
class AirBloc {
  
  final _airSubject = BehaviorSubject<AirResult>(); //AirResult 값을 넣으면 가장 마지막 값을 뱉어냄

  /**
   * 앱이 실행되면 가장먼저 수행
   */
  AirBloc() {
    fetch();
  }
  
  //비동기로 데이터 받기
  Future<AirResult> fetchData() async {
    var response = await http
        .get('https://api.airvisual.com/v2/nearest_city?key=wCD5bHTNsPWH2C5pp');
    
    AirResult result = AirResult.fromJson(json.decode(response.body));
    
    return result;
  }

  void fetch() async {
    print('fetch');
    var airResult = await fetchData();
    _airSubject.add(airResult);
  }
  
  Stream<AirResult> get airResult => _airSubject.stream;
}