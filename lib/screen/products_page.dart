import 'package:flutter/material.dart';
import 'package:bbloginredux/widget/product_item.dart';
import 'package:bbloginredux/model/product.dart';
import 'package:bbloginredux/redux/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:bbloginredux/redux/products/products_action.dart';
import 'package:bbloginredux/model/filter_option.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        final FilterOption selectedFilter = state.productsState.filterOption;
        final List<Product> products = state.productsState.productsList;
        final List<Product> favList =
            products.where((element) => element.isFavorite).toList();
        final List<Product> cartList = state.productsState.cartProductsList;

        return Scaffold(
          appBar: AppBar(
            title: Text('ProductsPage'),
            actions: <Widget>[
              PopupMenuButton(
                onSelected: ((val) {
                  // debugger();
                  StoreProvider.of<AppState>(context).dispatch(
                    ListFilteringAction(val),
                  );
                }),
                icon: Icon(Icons.more_vert),
                itemBuilder: (_) => [
                  PopupMenuItem(
                    child: Text('show all'),
                    value: FilterOption.All,
                  ),
                  PopupMenuItem(
                    child: Text('favorite'),
                    value: FilterOption.Favorites,
                  ),
                  PopupMenuItem(
                    child: Text('cart'),
                    value: FilterOption.Cart,
                  ),
                ],
              )
            ],
          ),
          body: GridView.builder(
            padding: EdgeInsets.all(14),
            // itemCount: products.length,
            itemCount: selectedFilter == FilterOption.All
                ? products.length
                : selectedFilter == FilterOption.Favorites
                    ? favList.length
                    : selectedFilter == FilterOption.Cart
                        ? cartList.length
                        : 0,
            itemBuilder: (ctx, idx) {
              if (selectedFilter == FilterOption.Favorites) {
                return ProductItem(
                  favList[idx],
                );
              } else if (selectedFilter == FilterOption.Cart) {
                return ProductItem(
                  cartList[idx],
                );
              } else {
                return ProductItem(
                  products[idx],
                );
              }
              // return ProductItem(products[idx]);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 16,
            ),
          ),
        );
      },
    );
  }
}
