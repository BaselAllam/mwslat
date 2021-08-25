
Map<String, dynamic> busesLine = {
  '10 Aug 2021' : [
    {
      'busNumber' : 102,
      'line' : 'ca to hrg',
      'stations' : [
        {
          'stationName' : 'Cairo',
          'arriveTime' : '10.15',
          'leaveTime' : '10.20'
        },
        {
          'stationName' : 'Mansoura',
          'arriveTime' : '12.15',
          'leaveTime' : '12.20'
        },
        {
          'stationName' : 'Hrg',
          'arriveTime' : '15.15',
          'leaveTime' : '15.20'
        },
      ],
      'busDriver' : {
        'driverName' : 'Ahmed',
        'driverLicenes' : 'A502'
      }
    },
    {
      'busNumber' : 105,
      'line' : 'ca to ssh',
      'stations' : [
        {
          'stationName' : 'Cairo',
          'arriveTime' : '10.15',
          'leaveTime' : '10.20'
        },
        {
          'stationName' : 'Alex',
          'arriveTime' : '12.15',
          'leaveTime' : '12.20'
        },
        {
          'stationName' : 'SSh',
          'arriveTime' : '15.15',
          'leaveTime' : '15.20'
        },
      ],
      'busDriver' : {
        'driverName' : 'Mohamed',
        'driverLicenes' : 'A505'
      }
    },
  ],
  '11 Aug 2021' : [
    {
      'busNumber' : 102,
      'line' : 'ca to hrg',
      'stations' : [
        {
          'stationName' : 'Cairo',
          'arriveTime' : '10.15',
          'leaveTime' : '10.20'
        },
        {
          'stationName' : 'Mansoura',
          'arriveTime' : '12.15',
          'leaveTime' : '12.20'
        },
        {
          'stationName' : 'Hrg',
          'arriveTime' : '15.15',
          'leaveTime' : '15.20'
        },
      ],
      'busDriver' : {
        'driverName' : 'Ali',
        'driverLicenes' : 'B502'
      }
    },
    {
      'busNumber' : 105,
      'line' : 'ca to ssh',
      'stations' : [
        {
          'stationName' : 'Cairo',
          'arriveTime' : '10.15',
          'leaveTime' : '10.20'
        },
        {
          'stationName' : 'Alex',
          'arriveTime' : '12.15',
          'leaveTime' : '12.20'
        },
        {
          'stationName' : 'SSh',
          'arriveTime' : '15.15',
          'leaveTime' : '15.20'
        },
      ],
      'busDriver' : {
        'driverName' : 'Sayed',
        'driverLicenes' : 'B602'
      }
    },
  ],
};

main() {

  // busesLine.forEach((key, value) {
  //   print('the data is $key');
  //   value.forEach((i) {
  //     print('the bus is $i');
  //     print('---------------------------------');
  //   });
  //   print('---------------------------------');
  // });

  busesLine.forEach((key, value) {
    value.forEach((i) {
      print(i['stations'].length);
    });
  });
}


// Functional Programming