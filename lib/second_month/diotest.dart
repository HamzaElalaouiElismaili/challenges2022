
import 'package:dio/dio.dart';

 getDataAPI()  async{

   Response response;
   var dio = Dio();
   //response = await dio.get('https://booking-com.p.rapidapi.com/v1/metadata/exchange-rates?currency=AED&locale=en-gb');

   //print(response.data.toString());
// Optionally the request above could also be done as
   response = await dio.get('https://booking-com.p.rapidapi.com/v1/hotels/room-list',
   queryParameters: {
       "checkin_date": '2022-07-23',
       "locale": 'ar',
       "currency": 'MAD',
       "checkout_date": '2022-07-24',
       'hotel_id': '161',
       "adults_number_by_rooms": '3,1',
       "units": 'metric',
       "children_ages": '5,0,9',
       "children_number_by_rooms": '2,1'
     },
       options: Options(
     headers: {
       "x-rapidapi-host":"booking-com.p.rapidapi.com",
       "x-rapidapi-key":"5c8428a7edmsh57836914fb983eep14da34jsn3ec4abce4453"
     }
   ));
   print(response.data.toString());
 }