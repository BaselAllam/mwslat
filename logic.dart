import 'oop.dart';


Scheduale createSchedaule(Map<String, dynamic> schedualeData) {

  Bus newBus = Bus.fromJson(schedualeData['bus']);

  Driver newDriver = Driver.fromJson(schedualeData['driver']);

  List<Station> stations = stationLists(schedualeData['scheduale']['direction']['stations']);

  Direction newDirection = Direction.fromJson(schedualeData['scheduale']['direction'], stations);
  
  Scheduale newScheduale = Scheduale.fromJson(
    schedualeData['scheduale'], newDirection, newBus, newDriver);

  return newScheduale;
}


List<Station> stationLists(List stationsData) {

  List<Station> stations = [];

  for(Map<String, dynamic> i in stationsData) {
    Station newStation = Station.fromJson(i);
    stations.add(newStation);
  }

  return stations;
}