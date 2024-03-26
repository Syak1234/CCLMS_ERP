class Invoice {
  final String customer;
  final String address;
  final List<LineItem> items;
  final String name;
  Invoice(this.customer, this.address, this.items,this.name);
  double totalCost() {
    return items.fold(
        0, (previousValue, element) => previousValue + element.cost);
  }
}

class LineItem {
  final String description;
  final double cost;

  LineItem(this.description, this.cost);
}
