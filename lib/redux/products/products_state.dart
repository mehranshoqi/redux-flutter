import 'package:meta/meta.dart';
import 'package:bbloginredux/model/filter_option.dart';
import 'package:bbloginredux/model/product.dart';

@immutable
class ProductsState {
  final List<Product> productsList;
  final List<Product> cartProductsList;
  FilterOption filterOption;
  ProductsState({this.productsList, this.cartProductsList, this.filterOption});

  ProductsState copyWith(
          {List<Product> products,
          List<Product> cartProducts,
          FilterOption filterOption}) =>
      new ProductsState(
        productsList: products ?? this.productsList,
        cartProductsList: cartProducts ?? this.cartProductsList,
        filterOption: filterOption ?? this.filterOption,
      );

  factory ProductsState.initial() => new ProductsState(
        productsList: <Product>[
          Product(
            id: 0,
            title: 'xxx 1',
            description: 'A red shirt - it is pretty red!',
            price: 23.99,
            imgUrl:
                'https://s2.ninifile.com/statics/posts/qi/2020/12/947b5423-0df4-4fa5-9918-86e80843623b/2047de96-a2e6-42b5-894d-ab9b81d03bd0.jpg',
          ),
          Product(
            id: 1,
            title: 'xxx2',
            description: 'A blue shirt - it is pretty red!',
            price: 14.99,
            imgUrl:
                'https://s2.ninifile.com/statics/posts/qi/2020/12/947b5423-0df4-4fa5-9918-86e80843623b/2047de96-a2e6-42b5-894d-ab9b81d03bd0.jpg',
          ),
          Product(
            id: 2,
            title: 'xxx 4',
            description: 'A pink shirt - it is pretty red!',
            price: 29.99,
            imgUrl:
                'https://s2.ninifile.com/statics/posts/qi/2020/12/947b5423-0df4-4fa5-9918-86e80843623b/2047de96-a2e6-42b5-894d-ab9b81d03bd0.jpg',
          ),
          Product(
            id: 3,
            title: 'xxx 5',
            description: 'A pink shirt - it is pretty red!',
            price: 29.99,
            imgUrl:
                'https://s2.ninifile.com/statics/posts/qi/2020/12/947b5423-0df4-4fa5-9918-86e80843623b/2047de96-a2e6-42b5-894d-ab9b81d03bd0.jpg',
            isFavorite: true,
          ),
        ],
        cartProductsList: [],
        filterOption: FilterOption.Favorites,
      );
}
