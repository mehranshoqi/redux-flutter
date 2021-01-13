import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bbloginredux/model/product.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:bbloginredux/redux/products/products_action.dart';
import 'package:bbloginredux/route/routes.dart';
import '../redux/app_state.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    final bool fav = product.isFavorite;
    final int id = product.id;
    void favToggler(fav, id) {
      StoreProvider.of<AppState>(context).dispatch(
        ToggleFavoriteAction(
          fav,
          id,
        ),
      );
    }

    void addToCart(Product product) {
      StoreProvider.of<AppState>(context).dispatch(
        AddToCartAction(product),
      );
      Scaffold.of(context).hideCurrentSnackBar();
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Added to cart!'),
          duration: Duration(
            seconds: 1,
          ),
          action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                StoreProvider.of<AppState>(context).dispatch(
                  RemoveItemCartAction(product.id),
                );
              }),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GridTile(
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
            Routes.cart,
            arguments: product.id,
          ),
          child: Image.network(
            product.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(
              fav ? Icons.favorite : Icons.favorite_border_rounded,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () => favToggler(fav, id),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).accentColor,
            ),
            // onPressed: () {},
            onPressed: () => addToCart(product),
          ),
        ),
      ),
    );
  }
}
