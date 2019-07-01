import XCTest
@testable import ShoppingCart

final class ShoppingCartTests: XCTestCase {
    func testAddProductsToTheShoppingCart() {
        // Given: 

        // An empty shopping cart
        var shoppingCart = ShoppingCart()

        // And a product, Dove Soap with a unit price of 39.99
        let product = Product(name: "Dove Soap", unitPrice: 39.99)

        // When:

        // The user adds 5 Dove Soaps to the shopping cart
        shoppingCart.add(product, quantity: 5)

        // Then:

        // The shopping cart should contain 5 Dove Soaps each with a unit price of 39.99
        XCTAssertEqual(shoppingCart.products, [
            Product(name: "Dove Soap", unitPrice: 39.99), 
            Product(name: "Dove Soap", unitPrice: 39.99), 
            Product(name: "Dove Soap", unitPrice: 39.99), 
            Product(name: "Dove Soap", unitPrice: 39.99), 
            Product(name: "Dove Soap", unitPrice: 39.99)
        ])
        // And the shopping cart’s total price should equal 199.95
        XCTAssertEqual(shoppingCart.totalPrice, 199.95)
    }

    func testAddAdditionalProductsOfTheSameTypeToTheShoppingCart() {
        // Given:

        // An empty shopping cart
        var shoppingCart = ShoppingCart()
        // And a product, Dove Soap with a unit price of 39.99
        let product = Product(name: "Dove Soap", unitPrice: 39.99)

        // When:

        // The user adds 5 Dove Soaps to the shopping cart
        shoppingCart.add(product, quantity: 5)
        // And then adds another 3 Dove Soaps to the shopping cart
        shoppingCart.add(product, quantity: 3)

        // Then:

        // The shopping cart should contain 8 Dove Soaps each with a unit price of 39.99
        XCTAssertEqual(shoppingCart.products, [
            Product(name: "Dove Soap", unitPrice: 39.99),
            Product(name: "Dove Soap", unitPrice: 39.99),
            Product(name: "Dove Soap", unitPrice: 39.99),
            Product(name: "Dove Soap", unitPrice: 39.99), 
            Product(name: "Dove Soap", unitPrice: 39.99), 
            Product(name: "Dove Soap", unitPrice: 39.99), 
            Product(name: "Dove Soap", unitPrice: 39.99), 
            Product(name: "Dove Soap", unitPrice: 39.99)
        ])
        // And the shopping cart’s total price should equal 319.92
        XCTAssertEqual(shoppingCart.totalPrice, Decimal(319.92).rounded)
    }

    static var allTests = [
        ("testAddProductsToTheShoppingCart", testAddProductsToTheShoppingCart),
        ("testAddAdditionalProductsOfTheSameTypeToTheShoppingCart", testAddAdditionalProductsOfTheSameTypeToTheShoppingCart),
    ]
}
