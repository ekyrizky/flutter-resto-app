import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurants_provider.dart';
import 'package:restaurant_app/utils/constant.dart';
import 'package:restaurant_app/widget/CardRestaurant.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _RestaurantListState();

}

class _RestaurantListState extends State<HomePage> {
  late RestaurantsProvider _provState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEC2E1A),
      body: ListView(
          children: <Widget>[
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/alt_logo.PNG', width: 150.0,)
              ],
            ),
            SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.name,
                autofocus: false,
                onChanged: (String value) {
                  setState(() {
                    search(value);
                  });
                },
                decoration: InputDecoration(
                  hintText: Constant.searchHint,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),),
                  labelStyle: TextStyle(color: Colors.yellow),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              height: MediaQuery.of(context).size.height - 120.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(left: 56.0, top: 32.0, bottom: 32.0),
                  child: _buildList()
              ),
            )
          ]
      ),
    );
  }

  Widget _buildList() {
    return Consumer<RestaurantsProvider>(
      builder: (context, state, _) {
        _provState = state;
        if (state.state == ResultState.Loading) {
          return Center(
              child: CircularProgressIndicator()
          );
        } else if (state.state == ResultState.HasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = state.result.restaurants[index];
              return CardRestaurant(restaurant: restaurant);
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(
              child: Text(state.message)
          );
        } else if (state.state == ResultState.Error) {
          return Center(
              child: Text(state.message)
          );
        } else {
          return Center(
              child: Text('')
          );
        }
      },
    );
  }

  Timer? _timer;
  void search(String value) {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 800), () {
      setState(() {
        _provState.query = value;
      });
    });
  }


}



