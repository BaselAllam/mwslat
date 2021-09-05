


class Scheduale{

  String date;
  String time;
  Direction direction;
  Bus bus;
  Driver driver;

  Scheduale(this.date, this.time, this.direction, this.bus, this.driver);

  factory Scheduale.fromJson(Map<String, dynamic> i, Direction direction, Bus bus, Driver driver) {
    return Scheduale(
      i['date'],
      i['time'],
      direction,
      bus,
      driver
    );
  }
}


class Direction{

  String startPoint;
  String endPoint;
  List<Station> stations;

  Direction(this.startPoint, this.endPoint, this.stations);

  factory Direction.fromJson(Map<String, dynamic> i, List<Station> stations) {
    return Direction(
      i['startPoint'],
      i['endPoint'],
      stations
    );
  }
}


class Station{

  String stationName;
  String arriveTime;
  String leaveTime;

  Station(this.stationName, this.arriveTime, this.leaveTime);

  factory Station.fromJson(Map<String, dynamic> i) {
    return Station(
      i['stationName'], i['arriveTime'], i['leaveTime']
    );
  }  
}


class Bus{

  String busName;
  String status;

  Bus(this.busName, this.status);

  factory Bus.fromJson(Map<String, dynamic> i) {
    return Bus(
      i['busName'],
      i['status'],
    );
  }
}


class Driver{

  String driverName;
  String driverLicences;

  Driver(this.driverName, this.driverLicences);

  factory Driver.fromJson(Map<String, dynamic> i) {
    return Driver(
      i['driverName'],
      i['driverLicences'],
    );
  }
}