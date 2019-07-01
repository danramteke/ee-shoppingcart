import Foundation

struct ShoppingCart {
    var products: [Product] = []

    var totalPrice: Decimal {
        let subtotal = products
            .map { $0.unitPrice }
            .reduce(0.0, +)

        return subtotal.rounded
    }

    mutating func add(_ product: Product, quantity: Int) {
        (0 ..< quantity).forEach { _ in
            products.append(product)
        }
    }
}
