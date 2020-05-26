import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nuelitoexpress/bloc/cartlistBloc.dart';
import 'package:nuelitoexpress/bloc/listTileColorBloc.dart';
import 'package:nuelitoexpress/model/food_item.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nuelitoexpress/pages/homepage.dart';

class Cart extends StatelessWidget {
  Cart({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    List<FoodItem> foodItems;
    return StreamBuilder(
      stream: bloc.listStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          foodItems = snapshot.data;
          return Scaffold(
            body: SafeArea(
              child: CartBody(foodItems),
            ),
            bottomNavigationBar: BottomBar(foodItems, user),
          );
        } else {
          return Container(
            child: Text("Algo retorna Null"),
          );
        }
      },
    );
  }
}

class BottomBar extends StatelessWidget {
  final FirebaseUser user;
  final List<FoodItem> foodItems;
  final firestoreInstance = Firestore.instance;

  BottomBar(this.foodItems, this.user);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(left: 35, bottom: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          totalAmount(foodItems),
          nextButtonBar(foodItems),
        ],
      ),
    );
  }

  Container totalAmount(List<FoodItem> foodItems) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Total:",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
          ),
          Text(
          "\Q${returnTotalAmount(foodItems)}",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
          ),
        ],
      ),
    );
  }

  String returnTotalAmount(List<FoodItem> foodItems) {
    double totalAmount = 0.0;

    for (int i = 0; i < foodItems.length; i++) {
      totalAmount = totalAmount + foodItems[i].price * foodItems[i].quantity;
    }
    return totalAmount.toStringAsFixed(2);
  }

  Container nextButtonBar(List<FoodItem> foodItems) {
    return Container(
      margin: EdgeInsets.only(right: 25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.orange[900], borderRadius: BorderRadius.circular(15)),
        child: InkWell(
        onTap: () {
          print("Hola");
          returnCart();
    },
      child: Row(
        children: <Widget>[
          Text(
            "20-30 min",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 14,
            ),
          ),
          Spacer(),
          Text(
            "Confirmar Orden",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
    );
  }

  String _latitude;
  String _longitude;
  Future<String> returnLocation() async {
    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    _latitude = "${position.latitude}";
    _longitude = "${position.longitude}";
  }

  Future<String>returnCart() async{
    List<String> productsFB = new List();
    String cartFB;
    for (int i = 0; i < foodItems.length; i++) {
      cartFB =
          foodItems[i].quantity.toString() + " x " + foodItems[i].title + "\n";
      productsFB.add(cartFB);
    }
    returnLocation();
    if (_latitude != null && _longitude != null){
      firestoreInstance.collection('Pedidos').add({
        //'Nombre': snapshot.data['Nombre'],
        //'Telefono': snapshot.data['Telefono'],
        'Productos': productsFB,
        'Total': returnTotalAmount(foodItems),
        'Longitud': _longitude,
        'Latitud': _latitude,
      });
      Fluttertoast.showToast(
          msg: "Tu pedido se ha realizado con éxito.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green[700],
          textColor: Colors.white,
          fontSize: 16.0
      );
      ///
    } else {
      Fluttertoast.showToast(
          msg: "Hubo un problema con localizar tu ubicacion, intenta de nuevo.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }
}

class CartBody extends StatelessWidget {
  final List<FoodItem> foodItems;

  CartBody(this.foodItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(35, 40, 25, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          title(),
          Expanded(
            flex: 1,
            child: foodItems.length > 0 ? foodItemList() : noItemContainer(),
          )
        ],
      ),
    );
  }

  Container noItemContainer() {
    return Container(
      child: Center(
        child: Text(
          "Carrito Vacío",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey[500],
              fontSize: 20),
        ),
      ),
    );
  }

  ListView foodItemList() {
    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        return CartListItem(foodItem: foodItems[index]);
      },
    );
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Mi",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                ),
              ),
              Text(
                "Orden",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 35,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CartListItem extends StatelessWidget {
  final FoodItem foodItem;

  CartListItem({@required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      hapticFeedbackOnStart: false,      
      maxSimultaneousDrags: 1,
      data: foodItem,
      feedback: DraggableChildFeedback(foodItem: foodItem),
      child: DraggableChild(foodItem: foodItem),
      childWhenDragging: foodItem.quantity > 1 ? DraggableChild(foodItem: foodItem) : Container(),
    );
  }
}


class DraggableChild extends StatelessWidget {
  const DraggableChild({
    Key key,
    @required this.foodItem,
  }) : super(key: key);

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: ItemContent(
        foodItem: foodItem,
      ),
    );
  }
}

class DraggableChildFeedback extends StatelessWidget {
  const DraggableChildFeedback({
    Key key,
    @required this.foodItem,
  }) : super(key: key);

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    final ColorBloc colorBloc = BlocProvider.getBloc<ColorBloc>();

    return Opacity(
      opacity: 0.7,
      child: Material(
        child: StreamBuilder(
          stream: colorBloc.colorStream,
          builder: (context, snapshot) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: snapshot.data != null ? snapshot.data : Colors.white,
              ),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.95,
              child: ItemContent(foodItem: foodItem),
            );
          },
        ),
      ),
    );
  }
}

class ItemContent extends StatelessWidget {
  const ItemContent({
    Key key,
    @required this.foodItem,
  }) : super(key: key);

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              foodItem.imgUrl,
              fit: BoxFit.fitHeight,
              height: 55,
              width: 80,
            ),
          ),
          RichText(
            text: TextSpan(
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                    text: foodItem.quantity.toString()
                    ),
                  TextSpan(text: " x "),
                  TextSpan(
                    text: foodItem.title,
                  ),
                ]),
          ),
          Text(
            "\Q${foodItem.quantity * foodItem.price}",
            style:
                TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            child: Icon(
              CupertinoIcons.back,
              size: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        DragTargetWidget(bloc),
      ],
    );
  }
}

class DragTargetWidget extends StatefulWidget {
  final CartListBloc bloc;

  DragTargetWidget(this.bloc);

  @override
  _DragTargetWidgetState createState() => _DragTargetWidgetState();
}

class _DragTargetWidgetState extends State<DragTargetWidget> {
  @override
  Widget build(BuildContext context) {
    FoodItem currentFoodItem;
    final ColorBloc colorBloc = BlocProvider.getBloc<ColorBloc>();

    return DragTarget<FoodItem>(
      onAccept: (FoodItem foodItem) {
        currentFoodItem = foodItem;
        colorBloc.setColor(Colors.white);
        widget.bloc.removeFromList(currentFoodItem);
      },
      onWillAccept: (FoodItem foodItem) {
        colorBloc.setColor(Colors.red);
        return true;
      },
     /*onLeave: (FoodItem foodItem) {
        colorBloc.setColor(Colors.white);
      },*/
      
      builder: (BuildContext context, List incoming, List rejected) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            CupertinoIcons.delete,
            size: 35,
          ),
        );
      },
    );
  }
}
