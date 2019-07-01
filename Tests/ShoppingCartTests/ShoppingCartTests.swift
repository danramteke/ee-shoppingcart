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
        XCTAssertEqual(shoppingCart.contents, [Product(name: "Dove Soap", unitPrice: 39.99): 5])
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
        XCTAssertEqual(shoppingCart.contents, [Product(name: "Dove Soap", unitPrice: 39.99): 8])
        // And the shopping cart’s total price should equal 319.92
        XCTAssertEqual(shoppingCart.totalPrice, Decimal(319.92).rounded)
    }

    func testCalculateTheTaxRateOfTheShoppingCartWithMultipleItems() {
        //  Given:

        // An empty shopping cart
        var shoppingCart = ShoppingCart()

        // And a product, Dove Soap with a unit price of 39.99
        let doveSoap = Product(name: "Dove Soap", unitPrice: 39.99)
        // And another product, Axe Deo with a unit price of 99.99
        let axeDeo = Product(name: "Axe Deo", unitPrice: 99.99)
        // And a sales tax rate of 12.5%
        shoppingCart.taxRate = 0.125

        // When:

        // The user adds 2 Dove Soaps to the shopping cart
        shoppingCart.add(doveSoap, quantity: 2)
        // And then adds 2 Axe Deos to the shopping cart
        shoppingCart.add(axeDeo, quantity: 2)
        // Then:

        // The shopping cart should contain 2 Dove Soaps each with a unit price of 39.99
        XCTAssertEqual(shoppingCart.contents[Product(name: "Dove Soap", unitPrice: 39.99)], 2)
        // And the shopping cart should contain 2 Axe Deos each with a unit price of 99.99
        XCTAssertEqual(shoppingCart.contents[Product(name: "Axe Deo", unitPrice: 99.99)], 2)

        // And the total sales tax amount for the shopping cart should equal 35.00
        XCTAssertEqual(shoppingCart.totalSalesTax, 35.00)
        // And the shopping cart’s total price should equal 314.96
        XCTAssertEqual(shoppingCart.totalPrice, 314.96)
    }
    static var allTests = [
        ("testAddProductsToTheShoppingCart", testAddProductsToTheShoppingCart),
        ("testAddAdditionalProductsOfTheSameTypeToTheShoppingCart", testAddAdditionalProductsOfTheSameTypeToTheShoppingCart),
        ("testCalculateTheTaxRateOfTheShoppingCartWithMultipleItems", testCalculateTheTaxRateOfTheShoppingCartWithMultipleItems),
    ]
}
