import 'package:flutter/material.dart';

class selectRooms extends StatefulWidget {
  @override
  _selectRooms createState() => _selectRooms();
}

class _selectRooms extends State<selectRooms> {
  int selectedRooms = 01;
  int selectedAdults = 01;
  int selectedChildren = 00;

  void _updateGuests() {
    // Custom method to update adults and children based on selected rooms
    // You can customize this logic based on your requirements
    selectedAdults = selectedRooms;
    selectedChildren = 0;
  }

  void _incrementCounter() {
    setState(() {
      selectedRooms++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (selectedRooms > 1) {
        selectedRooms--;
      }
    });
  }

  void _incrementAdults() {
    setState(() {
      selectedAdults++;
    });
  }

  void _decrementAdults() {
    setState(() {
      if (selectedAdults > 1) {
        selectedAdults--;
      }
    });
  }

  void _incrementChildren() {
    setState(() {
      selectedChildren++;
    });
  }

  void _decrementChildren() {
    setState(() {
      if (selectedChildren > 1) {
        selectedChildren--;
      }
    });
  }

  Future<void> _showRoomBottomSheet() {
    return showModalBottomSheet(
      barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Padding(
          padding: const EdgeInsets.all(9.0),
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey.shade200),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) =>
                  Container(
                padding: EdgeInsets.all(16.0),
                height: 220,
                child: Column(
                  children: <Widget>[
                    Text('Select Rooms and Guests'),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Rooms:'),
                        Row(
                          children: [
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: FloatingActionButton(
                                onPressed: () {
                                  _incrementCounter();
                                  _updateGuests();
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Container(
                              child: Text('$selectedRooms'),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: FloatingActionButton(
                                  tooltip: 'Decrement',
                                  onPressed: () {
                                    _decrementCounter();
                                    _updateGuests();
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: 20,
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Adults:'),
                        Row(
                          children: [
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: FloatingActionButton(
                                onPressed: () {
                                  _incrementAdults();

                                  setState(
                                    () {},
                                  );
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Container(
                              child: Text('$selectedAdults'),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: FloatingActionButton(
                                  tooltip: 'Decrement',
                                  onPressed: () {
                                    _decrementAdults();
                                    setState(
                                      () {},
                                    );
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: 20,
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Children:'),
                        Row(
                          children: [
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: FloatingActionButton(
                                onPressed: () {
                                  _incrementChildren();
                                  setState(
                                    () {},
                                  );
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Container(
                              child: Text('$selectedChildren'),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: FloatingActionButton(
                                  tooltip: 'Decrement',
                                  onPressed: () {
                                    _decrementChildren();
                                    setState(
                                      () {},
                                    );
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: 20,
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // TextButton(
                        //   onPressed: () {
                        //     Navigator.of(context).pop();
                        //   },
                        //   child: Text('Cancel'),
                        // ),
                        TextButton(
                          onPressed: () {
                            // Do something with the selected values
                            // print('Selected Rooms: $selectedRooms');
                            // print('Selected Adults: $selectedAdults');
                            // print('Selected Children: $selectedChildren');
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your Method'),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: _showRoomBottomSheet,
                child: Text('Show Room Bottom Sheet'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
