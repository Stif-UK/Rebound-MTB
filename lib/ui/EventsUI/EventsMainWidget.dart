import 'package:flutter/material.dart';
import 'package:rebound_mtb/model/CalendarEventModel.dart';
import 'package:rebound_mtb/network/CalendarEventNetwork.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:rebound_mtb/ui/Dialogs/Alerts.dart' as alerts;
import 'package:rebound_mtb/util/utils.dart' as util;

class EventsMainWidget extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<EventsMainWidget> {
  CalendarController _calendarController;
  Future<Map<DateTime, List<dynamic>>> eventMap;
  List<dynamic> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    eventMap = CalendarEventNetwork().getEvents();
    _selectedEvents = [];
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: eventMap,
          builder: (BuildContext context,
          AsyncSnapshot<Map<DateTime, List<dynamic>>> events) {
            if(events.hasData){

              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 20.0, 2.0, 8.0),
                    child: TableCalendar(
                      calendarController: _calendarController,
                      initialCalendarFormat: CalendarFormat.month,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      events: events.data,


                      onDaySelected: (date, events){
                        print(date);
                        setState(() {
                          _selectedEvents = events;
                          print(events);
                        });
                      },


                      //Styling of the Calendar header row and icons
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        leftChevronIcon: Icon(Icons.arrow_back,
                        color: Theme.of(context).primaryColor,),
                        rightChevronIcon: Icon(Icons.arrow_forward,
                          color: Theme.of(context).primaryColor,),
                        centerHeaderTitle: true,
                        headerMargin: EdgeInsets.fromLTRB(4.0, 15.0, 4.0, 15.0)
                      ),

                      //Styling of the main calendar
                      calendarStyle: CalendarStyle(
                          todayColor: Theme.of(context).primaryColor,
                          markersColor: Theme.of(context).primaryColor,
                        selectedColor: Colors.orangeAccent,


                      ) ,

                    ),
                  ),
                  

                  /*Check if there are any events for the given date - if there are populate list
                      tiles with info. If not, return a container with text stating no events that day.
                       */
                  /*
                  Populate the bottom view with details of any events on selected days.
                  First, check if there are events on that day - if not return a message.
                   */
                  _selectedEvents.isEmpty?
                      Container(
                        alignment: Alignment.center,


                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 0.0),
                          child: Text("We've got nothing planned for ${util.Utils.getFormattedDate(_calendarController.selectedDay)}!",
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic
                          ),),


                        ),
                      ):
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _selectedEvents.length,
                      itemBuilder: (BuildContext context, int index){

                      return ListTile(
                        leading: Container(
                          child: CircleAvatar(
                            //backgroundImage: NetworkImage("http://178.128.164.111${_selectedEvents[inde}"),
                          ),
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(2.0), // border width
                          decoration: new BoxDecoration(
                            color: Colors.blue, // border color
                            shape: BoxShape.circle,
                          ),
                        ),
                       title: Text(_selectedEvents[index].title),

                      );

                      }
                  )
                ],
              );
            } else {
              eventMap.then((value) => (print("Got the calendar!")),
                  onError: (error) {
                    alerts.Alerts.failedAPICallAlert(
                        context, error.toString());
                    print("${error.toString()}");
                  }
              );
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                        child: CircularProgressIndicator())
                  ],
              );
            }
          },



    );
  }
}
