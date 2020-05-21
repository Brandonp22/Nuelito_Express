import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

FooditemList fooditemList = FooditemList(foodItems: [
  FoodItem(
    id: 1,
    title: "Titiman",
    hotel: "Esdras Chigna",
    price: 0.01,
    imgUrl:
        "https://media.discordapp.net/attachments/555937919664390154/712802863725805578/WhatsApp_Image_2020-05-14_at_8.27.37_AM.jpeg?width=527&height=677",
  ),
  FoodItem(
    id: 2,
    title: "Nissan Sentra 98",
    hotel: "Jonathan Cameros",
    price: 99.99,
    imgUrl:
        "https://firebasestorage.googleapis.com/v0/b/pruebaventa-e4e3b.appspot.com/o/FotosProductos%2Fnissansentra.jpg?alt=media&token=75f7f207-7f98-4dc3-81dc-b2c4b1589911",
  ),
  FoodItem(
    id: 3,
    title: "Atol de elote",
    hotel: "Negra Díaz",
    price: 5.49,
    imgUrl: "https://aprende.guatemala.com/wp-content/uploads/2016/10/Receta-para-hacer-atol-de-elote-guatemalteco-1.jpg",
  ),
  FoodItem(
    id: 4,
    title: "Churrasco Yongo",
    hotel: "Negra Díaz",
    price: 20.49,
    imgUrl: "https://mister-menu.com/foodie-tour/wp-content/uploads/2019/05/mister-menu-revista-foodie-gastronomia-guatemala-restaurantes-comida-nixtamal-centro-america-izabal-estor-morales-modelo-recetas-andre-schrei-luis-carrillo-delimax-leche-coco94-1.jpg",
  ),
  FoodItem(
    id: 5,
    title: "Jefry Calderón",
    hotel: "Sin Pancreas",
    price: 2.49,
    imgUrl: "https://pbs.twimg.com/media/D3q-h3cWwAEGici.jpg",
  ),
]);

FooditemList fooditemListdos = FooditemList(foodItems: [
  FoodItem(
    id: 6,
    title: "Pan Francés",
    hotel: "Panaderia Chigna",
    price: 0.99,
    imgUrl:
    "https://scontent.fymy1-1.fna.fbcdn.net/v/t1.0-9/s720x720/78537353_2561377834187392_1274909210152271872_o.jpg?_nc_cat=107&_nc_sid=8024bb&_nc_ohc=u1Kl109WhKEAX9q-YRk&_nc_ht=scontent.fymy1-1.fna&_nc_tp=7&oh=d9de4f8144ff259a84c44ce902f8d607&oe=5ECB9B56",
 ),
  FoodItem(
    id: 7,
    title: "Servicios Funebres",
    hotel: "Funeraria Chacón",
    price: 4999.99,
    imgUrl:
    "https://us.123rf.com/450wm/nelson99/nelson991711/nelson99171100649/90803964-primer-disparo-de-un-ataúd-colorido-en-un-coche-fúnebre-o-capilla-antes-del-funeral-o-entierro-en-el-cemente.jpg?ver=6",
  ),

]);


class FooditemList {
  List<FoodItem> foodItems;
  FooditemList({@required this.foodItems});
}

class FoodItem {
  int id;
  String title;
  String hotel;
  double price;
  String imgUrl;
  int quantity;

  FoodItem({
    @required this.id,
    @required this.title,
    @required this.hotel,
    @required this.price,
    @required this.imgUrl,
    this.quantity = 1,
  });

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}
