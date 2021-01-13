import 'package:bbloginredux/model/product.dart';
import 'package:bbloginredux/model/filter_option.dart';

class ToggleFavoriteAction {
  final bool fav;
  final int id;
  ToggleFavoriteAction(this.fav, this.id);
}

class AddToCartAction {
  final Product product;
  AddToCartAction(this.product);
}

class ListFilteringAction {
  final FilterOption filteroption;
  ListFilteringAction(this.filteroption);
}

class RemoveItemCartAction {
  final int productId;
  RemoveItemCartAction(this.productId);
}
