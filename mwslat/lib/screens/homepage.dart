import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mwslat/models/mainmodel.dart';
import 'package:mwslat/screens/searchResult.dart';
import 'package:mwslat/theme/sharedcolor.dart';
import 'package:mwslat/theme/sharedfontstyle.dart';
import 'package:mwslat/widgets/cutomsbutton.dart';
import 'package:mwslat/widgets/fields.dart';
import 'package:scoped_model/scoped_model.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  GlobalKey<FormState> toKey = GlobalKey<FormState>();

Position position = Position(latitude: 30.0444, longitude: 31.2357, accuracy: 0.0, isMocked: true, floor: 1, timestamp: DateTime(1990), speedAccuracy: 0.0, altitude: 0.0, speed: 0.0, heading: 0.0);

@override
void initState() {
  currentPosition();
  super.initState();
}

Set<Marker> markers = {
  Marker(
    markerId: MarkerId('currentPosition'),
    position: LatLng(30.0444, 31.2357),
  ),
};

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
        backgroundColor: backGroundColor,
        body: Container(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/1.9,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      zoom: 12,
                      target: LatLng(30.0444, 31.2357)
                    ),
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    mapType: MapType.hybrid,
                    markers: markers,
                  )
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width-60,
                  top: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.navigation),
                      color: blackColor,
                      iconSize: 30.0,
                      onPressed: () {},
                    )
                  ),
                ),
                Positioned(
                  height: MediaQuery.of(context).size.height/2,
                  top: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
                    ),
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Where would you like', style: primaryTextStyle),
                        Row(
                          children: [
                            Text('to go', style: primaryTextStyle),
                            Text(' Today ?', style: TextStyle(color: blackColor, fontSize: 30.0, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          height: 150.0,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.white
                                    ),
                                    height: 50.0,
                                    margin: EdgeInsets.all(10.0),
                                    child: customField('Picked Location', 'From', TextInputType.text, fromController, fromKey, () {
                                      searchLocation(fromController.text);
                                      setState(() {
                                        
                                      });
                                    }),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.white
                                    ),
                                    height: 50.0,
                                    margin: EdgeInsets.all(10.0),
                                    child: customField('Drop of Location', 'To', TextInputType.text, toController, toKey, () {}),
                                  ),
                                ],
                              ),
                              Positioned(
                                height: 55,
                                width: 55,
                                top: 50,
                                left: MediaQuery.of(context).size.width/1.4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    shape: BoxShape.circle
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(Icons.swap_vert, color: Colors.white, size: 45.0)
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_today, color: primaryColor, size: 20.0),
                                Text(' Today', style: secondaryTextStyle),
                              ],
                            ),
                            Text('1 Passenger', style: secondaryTextStyle),
                          ],
                        ),
                        CustomButton(
                          'Search',
                          () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) {return SearchResult(model);}));
                          }
                        )
                      ],
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      );
      },
    );
  }
  currentPosition() async {
    Position current = await Geolocator.getCurrentPosition();
    setState(() {
      position = current;
    });
  }
  searchLocation(String address) async {

    List<Location> locations = await locationFromAddress(address);
    Marker newMarker = Marker(
        markerId: MarkerId(locations[0].latitude.toString()),
        position: LatLng(locations[0].latitude, locations[0].longitude,),
    );
    setState(() {
      markers.add(newMarker);
      position = Position(latitude: locations[0].latitude, longitude: locations[0].longitude, accuracy: 0.0, isMocked: true, floor: 1, timestamp: DateTime(1990), speedAccuracy: 0.0, altitude: 0.0, speed: 0.0, heading: 0.0);
    });
  }
}