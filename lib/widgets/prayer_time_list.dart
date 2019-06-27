import 'package:flutter/material.dart';
import 'package:prayer_time_flutter/util/constants.dart';
import 'package:prayer_time_flutter/util/prayer_time.dart';



class PrayerTimeList extends StatefulWidget {
  @override
  _PrayerTimeListState createState() => _PrayerTimeListState();
}

class _PrayerTimeListState extends State<PrayerTimeList> {

  List<String> _prayerTimes = [];
  List<String> _prayerNames = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getPrayerTimes();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Prayer Time List"),
      ),
      body: _prayerTimes.isEmpty ? circularIndicator() : prayerListWidget()
    );
  }


  Widget circularIndicator(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }


  Widget prayerListWidget(){
    return ListView.builder(
      itemCount: _prayerTimes.length,
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${_prayerNames[position]} : ${_prayerTimes[position]}",
            style: new TextStyle(fontSize: 20.0),
          ),
        );
      },
    );
  }


  //build prayer time
  getPrayerTimes() {
    PrayerTime prayers = new PrayerTime();

    prayers.setTimeFormat(prayers.getTime12());
    prayers.setCalcMethod(prayers.getKarachi());
    prayers.setAsrJuristic(prayers.getHanafi());
    prayers.setAdjustHighLats(prayers.getAdjustHighLats());

    List<int> offsets = [0, 0, 0, 0, 0, 0, 0]; // {Fajr,Sunrise,Dhuhr,Asr,Sunset,Maghrib,Isha}
    prayers.tune(offsets);

    var currentTime = DateTime.now();

    setState(() {
      _prayerTimes = prayers.getPrayerTimes(currentTime, Constants.lat, Constants.long, Constants.timeZone);
      _prayerNames = prayers.getTimeNames();
    });
  }

}