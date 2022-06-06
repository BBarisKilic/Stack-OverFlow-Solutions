void main() {
  final articleList = ArticleRepository().getArticleList();
  final customerFavList = CustomerFavoriteRepository().getCustomerFavorite();
  final List<NewCustomerFav> customFavartList = [];

  // for (final article in articleList) {
  //   for (final customArticle in customerFavList) {
  //     if (article.id == customArticle.articleId) {
  //       final fav =
  //           NewCustomerFav(customArticle.id, article, customArticle.like);
  //       customFavartList.add(fav);
  //     }
  //   }
  // }

  articleList.forEach(
    (article) => customerFavList.forEach(
      (customerFav) {
        if (article.id == customerFav.articleId) {
          final fav = NewCustomerFav(customerFav.id, article, customerFav.like);
          customFavartList.add(fav);
        }
      },
    ),
  );

  articleList.forEach(
    (article) => customerFavList
        .where(
      (customerFav) => article.id == customerFav.articleId,
    )
        .forEach((newCustomerFav) {
      final fav =
          NewCustomerFav(newCustomerFav.id, article, newCustomerFav.like);
      customFavartList.add(fav);
    }),
  );

  for (final customFavitem in customFavartList) {
    print('${customFavitem.article.name} ${customFavitem.like}');
  }
}
//Here is what i tried but i am getting error inside the New CustomerFav()
//   final customFavitem = articleList
//  .map((article)=> NewCustomerFav(customerArticle.id, article, customArticle.like ))
//  .where()

class NewCustomerFav {
  final int id;
  final Article article;
  final int like;

  NewCustomerFav(this.id, this.article, this.like);
}

class ArticleRepository {
  final _articleList = [
    Article(1, 'burger'),
    Article(2, 'pizza'),
    Article(3, 'chicken'),
    Article(4, 'pasta'),
  ];

  List<Article> getArticleList() {
    return _articleList;
  }
}

class CustomerFavoriteRepository {
  final _customerFavoriteList = [
    CustomerFavorite(1, 1, 2),
    CustomerFavorite(2, 2, 2),
    CustomerFavorite(3, 4, 4),
  ];

  List<CustomerFavorite> getCustomerFavorite() {
    return _customerFavoriteList;
  }
}

class CustomerFavorite {
  final int id;
  final int articleId;
  final int like;

  CustomerFavorite(this.id, this.articleId, this.like);
}

class Article {
  final int id;
  final String name;

  Article(this.id, this.name);
}
