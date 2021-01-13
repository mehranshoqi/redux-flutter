import 'package:bbloginredux/redux/products/products_state.dart';
import 'package:bbloginredux/redux/products/products_action.dart';
import 'package:redux/redux.dart';
import 'package:bbloginredux/model/product.dart';

final productReducer = combineReducers<ProductsState>([
  TypedReducer<ProductsState, ToggleFavoriteAction>(_toggleFavorite),
  TypedReducer<ProductsState, AddToCartAction>(_addToCart),
  TypedReducer<ProductsState, ListFilteringAction>(_listFiltering),
  TypedReducer<ProductsState, RemoveItemCartAction>(_removeItemCart),
]);

ProductsState _toggleFavorite(
  ProductsState state,
  ToggleFavoriteAction action,
) {
  final List<Product> products = state.productsList
      .map((Product p) =>
          p.id == action.id ? p.copyWith(isFavorite: !action.fav) : p)
      .toList();
  return state.copyWith(
    products: products,
  );
}

ProductsState _addToCart(
  ProductsState state,
  AddToCartAction action,
) {
  final List<Product> cartProducts = state.cartProductsList;
  cartProducts.add(action.product);
  return state.copyWith(
    cartProducts: cartProducts,
  );
}

ProductsState _listFiltering(
  ProductsState state,
  ListFilteringAction action,
) {
  return state.copyWith(
    filterOption: action.filteroption,
  );
}

ProductsState _removeItemCart(
  ProductsState state,
  RemoveItemCartAction action,
) {
  final List<Product> updatedCartList = state.cartProductsList;
  updatedCartList.removeWhere(
    (element) => element.id == action.productId,
  );
  return state.copyWith(
    cartProducts: updatedCartList,
  );
}
