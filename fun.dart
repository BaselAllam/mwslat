import 'Untitled-1.dart';


changeDriverData(Map<String, String> driverData, Map<String, String> newDriverData) {

  driverData['driverName'] = newDriverData['driverName']!;
  driverData['driverLicenes'] = newDriverData['driverLicenes']!;
}


Map<String, String> newDriverData = {
    'driverName' : 'Mohsen',
    'driverLicenes' : 'A505'
  };

  main() {

    busesLine.forEach((key, value) {
      busesLine[key].forEach((i) {
        changeDriverData(i['busDriver'], newDriverData);
      });
    });

    print(busesLine);
  }