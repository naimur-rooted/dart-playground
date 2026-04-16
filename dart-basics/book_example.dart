// Book class represents a book with title, author, and price
class Book {
  Book(this.title, this.author, this.price);

  String title;
  String author;
  double price;

  // Calculates discounted price based on given percentage
  double discountedPrice(double discountPercent) {
    double discountAmount = price * (discountPercent / 100);
    return price - discountAmount;
  }

  // Prints book details
  void printBookInfo() {
    print("Title:$title");
    print("Author:$author");
    print("Price:\$$price");
  }
}

void main() {
  // First book object
  final book1 = Book("Clean Code", "Robert C. Martin", 100.00);
  book1.printBookInfo();
  double discount = book1.discountedPrice(30);
  print("Discounted Price:\$$discount\n");

  // Second book object
  final book2 = Book(
    "The Pragmatic Programmer",
    "Andrew Hunt & David Thomas",
    80.00,
  );
  book2.printBookInfo();
  double discount2 = book2.discountedPrice(25);
  print("Discounted Price:\$$discount2");
}
