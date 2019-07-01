import Foundation

struct Product {
  let name: String
  let unitPrice: Decimal

  init(name: String, unitPrice: Decimal) {
    self.name = name
    self.unitPrice = unitPrice.rounded
  }
}

extension Product: Equatable {
  public static func == (lhs: Product, rhs: Product) -> Bool {
    return lhs.name == rhs.name && lhs.unitPrice.rounded == rhs.unitPrice.rounded
  }
}
