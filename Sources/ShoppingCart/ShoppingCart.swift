import Foundation

struct ShoppingCart {
    var taxRate: Decimal? = nil
    var contents: [Product: Int] = [:]

    var totalPrice: Decimal {
        return (subtotal + totalSalesTax).rounded
    }

    var totalSalesTax: Decimal {
        guard let taxRate = taxRate else {
            return 0.0
        }

        return (subtotal * taxRate).rounded
    }

    var subtotal: Decimal {
        return contents
            .map { entry in entry.key.unitPrice * Decimal(entry.value) }
            .reduce(0.0, +)
            .rounded
    }

    mutating func add(_ product: Product, quantity: Int) {
        if let currentQuantity = contents[product] {
            contents[product] = currentQuantity + quantity
        } else {
            contents[product] = quantity
        }
    }
}
