

// Positional
  // Required Parameters
  // value pased by position
  // cant be null

// NonPositional Arg
  // not required parameters
  // key value pair
  // can be nulls
  // avoid null by
      // 1- null safety
      // 2- initial value



main() {

  List<num> x = [100, 500, 600];

  salaryCal(x, taxValue: 14);
  salaryCal(x);
}


salaryCal(List<num> salaries, {int taxValue = 0}) {

  num sum = salaries.reduce((value, element) => value + element);

  num incTax = sum + sum * (taxValue/100);

  print(incTax);
}



Map<String, dynamic> newBus = {
    'busNumber' : 110,
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
  };

  // fun to add new bus to the bus line map in any date you want