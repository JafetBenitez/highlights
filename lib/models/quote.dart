class Quote {
  int id;
  String quote;
  String image;
  String author;
  BigInt likes;

  Quote({this.id, this.quote, this.image, this.author, this.likes});

  String truncatedQuote() {
    if(this.quote.length >= 100) {
      return this.quote.substring(0, 97) + "...";
    }
    return this.quote;
  }
}