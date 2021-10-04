import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';
import 'package:restaurant_app/utils/constant.dart';

class DetailPage extends StatelessWidget {

  final String restaurant;

  const DetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(create: (_) => RestaurantDetailProvider(apiService: ApiService(), id: restaurant),
      child: _buildList(),
      )
    );
  }

  Widget _buildList() {
    return Consumer<RestaurantDetailProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(
              child: CircularProgressIndicator()
          );
        } else if (state.state == ResultState.HasData) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: '${Constant.BASE_IMG}${state.restaurantDetail.restaurant.pictureId}',
                    child: Image.network(
                      '${Constant.BASE_IMG}${state.restaurantDetail.restaurant.pictureId}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text('${state.restaurantDetail.restaurant.name}'),
                  centerTitle: true,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.place, size: 16,),
                              SizedBox(width: 8),
                              Text('${state.restaurantDetail.restaurant.city}'),
                            ],
                          ),
                          SizedBox(height: 8.0,),
                          Row(
                            children: <Widget>[
                              Icon(Icons.star, size: 16, color: Colors.orange,),
                              SizedBox(width: 8),
                              Text(state.restaurantDetail.restaurant.rating.toString()),
                            ],
                          ),
                          SizedBox(height: 16.0,),
                          Text(
                            state.restaurantDetail.restaurant.description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 17),
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 2.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              height: 20,
                              child: Text(
                                Constant.foodList,
                                style:
                                TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            height: 150,
                            child: ListView(
                              children: state.restaurantDetail.restaurant.menus.foods.map((e) {
                                return Card(
                                  elevation: 4.0,
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(4.0),
                                          child: Text("- ${e.name.toString()}"),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 2.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              height: 20,
                              child: Text(
                                Constant.drinkList,
                                style:
                                TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            height: 150,
                            child: ListView(
                              children: state.restaurantDetail.restaurant.menus.drinks.map((e) {
                                return Card(
                                  elevation: 4.0,
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(4.0),
                                          child: Text("- ${e.name.toString()}"),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
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
}