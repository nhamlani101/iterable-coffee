import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test_app/models/cart_model.dart';

class MyCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Iterable Bottle Coffee"),
        backgroundColor: Color(0xFF34C3F2),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: catalog.length,
          itemBuilder: (BuildContext content, int index) {
            return CatalogListItem(catalog[index]);
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider()),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: null,
      //     backgroundColor: Color(0xFF34C3F2),
      //     child: Icon(Icons.exit_to_app)),
    );
  }
}

class CatalogListItem extends StatelessWidget {
  final Item item;
  CatalogListItem(this.item);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    return ListTile(
        leading: AspectRatio(
            aspectRatio: 10 / 8, child: Image.network(item.imageUrl)),
        title: Text(item.itemName),
        subtitle: Text("\$" + item.price.toStringAsFixed(2)),
        enabled: !cart.doesContain(item),
        trailing: _AddButton(item: item));
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    return IconButton(
        onPressed: () {
          if (cart.doesContain(item)) {
            return null;
          } else {
            cart.add(item);
          }
        },
        icon: cart.doesContain(item) ? Icon(Icons.check) : Icon(Icons.add));
  }
}

final catalog = [
  Item('Hayes Valley Espresso', 3.50,
      "https://blue-bottle-cms.global.ssl.fastly.net/hbhhv9rz9/image/upload/c_thumb,h_576,w_576/v1526404848/r01wlbcqpgdspyszxg0n.jpg"),
  Item('Decaf Espresso', 3.50,
      "https://blue-bottle-cms.global.ssl.fastly.net/hbhhv9rz9/image/upload/c_thumb,h_576,w_576/v1526404899/uwboy5luvxzmrttbe3ml.jpg"),
  Item('Macchiato', 4.00,
      "https://images.squarespace-cdn.com/content/v1/5be4ea9b55b02cf09b6748bd/1544147121907-RB0V2GP3R1MU42P9S7LF/ke17ZwdGBToddI8pDm48kChFtl5EkdQykgvACRh3Pu4UqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcKVIZ05sTY1cUJfpPrm2gWUtO7-4vYwz63rq69i5P7jBcOlb710wI_-1dQsm7Lv8o/Gibraltar+coffee"),
  Item('Cappuccino', 4.50,
      "https://images.squarespace-cdn.com/content/v1/5be4ea9b55b02cf09b6748bd/1542758905278-E2J19QDWIDG1THMO2UFF/ke17ZwdGBToddI8pDm48kM_vhPE09W1Jq25o_jaRGbBZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVFjgKU5EoDQKHj99g7m5cxKYfVVGFdp3Y93MXNFoeRISyb8BodarTVrzIWCp72ioWw/Blue+Bottle+Cappuccino"),
  Item('Caffe Latte', 5.00,
      "https://upload.wikimedia.org/wikipedia/commons/e/e0/Blue_Bottle%2C_Latte_%285910820935%29.jpg"),
  Item('Caffe Mocha', 5.50,
      "https://static1.squarespace.com/static/5be4ea9b55b02cf09b6748bd/5be9fe800ebbe885c5b76f3b/5bf5e9fecd8366a6d9cf7e59/1546472696110/yhaxpei1y1qiswjvjvb1.jpg?format=1500w"),
  Item('Hot Chocolate', 4.75,
      "https://assets.bonappetit.com/photos/57accdd1f1c801a1038bc794/master/pass/Hot-Chocolate-2-of-5.jpg"),
  Item('Cold Brew', 4.25,
      "https://article.images.consumerreports.org/f_auto/prod/content/dam/CRO%20Images%202018/Health/September/CR-Health-InlineHero-How-to-Choose-Healthy-Cold-Brew-09-18"),
  Item('New Orleans Iced Coffee', 4.25,
      "https://blue-bottle-cms.global.ssl.fastly.net/hbhhv9rz9/image/upload/c_thumb,h_576,w_576/v1581978832/lxguhtebcct6hqdr2qyz.jpg"),
  Item('Tea', 4.00,
      "https://s3.amazonaws.com/thumbnails.thecrimson.com/photos/2018/02/05/213058_1327580.jpg.1500x1000_q95_crop-smart_upscale.jpg"),
  Item('Lemonade', 3.75,
      "https://storage.googleapis.com/gen-atmedia/3/2018/06/bcbceed90d40c95acd29cf8295f6fda017ba9887.jpeg")
];
