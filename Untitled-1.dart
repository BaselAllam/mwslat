import 'logic.dart';
import 'oop.dart';

List<Map<String, dynamic>> busesLine = [
  {
    'scheduale' : {
      'date' : '10-aug-2021',
      'time' : '10:00AM',
      'direction' : {
        'startPoint' : 'Cairo',
        'endPoint' : 'HRG',
        'stations' : [
          {
            'stationName' : 'Tahrir',
            'arriveTime' : '10:00AM',
            'leaveTime' : '10:10AM'
          },
          {
            'stationName' : 'Safaga',
            'arriveTime' : '12:00PM',
            'leaveTime' : '12:10PM'
          },
          {
            'stationName' : 'HRG',
            'arriveTime' : '03:00PM',
            'leaveTime' : '03:10PM'
          },
        ],
      },
    },
  'bus' : {
      'busName' : 'A500B',
      'status' : 'on Service'
    },
    'driver' : {
      'driverName' : 'Ahmed',
      'driverLicences' : 'AB550'
    }
  },
];

main() {

  busesLine.forEach((element) {
    Scheduale x = createSchedaule(element);
    print(x);
  });
}


// App Design URL => https://dribbble.com/shots/14420230-Public-Transport-App-Design/attachments/6098108?mode=media