import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/item.dart';
import 'package:flutter_test_app/util/iterable_functions.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test_app/models/cart_model.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    updateCart(cart.getEmail, cart.getCurrentCart);
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          backgroundColor: Color(0xFF34C3F2),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: cart.getLength,
                  itemBuilder: (BuildContext content, int index) {
                    return CartListItem(cart.getByPosition(index));
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider()),
            ),
            CartTotal(cart.totalPrice)
          ],
        ));
  }
}

class CartListItem extends StatelessWidget {
  final Item item;

  CartListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: AspectRatio(
            aspectRatio: 10 / 8, child: Image.network(item.imageUrl)),
        title: Text(item.itemName),
        subtitle: Text("\$" + item.price.toStringAsFixed(2)),
        trailing: RemoveButton(item: item));
  }
}

class CartTotal extends StatelessWidget {
  final double total;
  CartTotal(this.total);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      child: RaisedButton(
        child: Text("Place Order: \$" + total.toStringAsFixed(2)),
        onPressed: () {
          trackPurchase(cart.getEmail, cart.getCurrentCart, total);
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("You just purchased something")));
          cart.clearAll();
          Navigator.pop(context);
        },
        textColor: Colors.white,
        padding: EdgeInsets.only(left: 20, right: 20),
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(18)),
        color: Color(0xFF34C3F2),
      ),
    );
  }
}

class RemoveButton extends StatelessWidget {
  final Item item;

  const RemoveButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    return IconButton(
        onPressed: () {
          cart.remove(item);
        },
        icon: Icon(Icons.delete));
  }
}
