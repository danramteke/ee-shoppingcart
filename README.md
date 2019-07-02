# ShoppingCart

Welcome to my shopping cart. 

## Setup

This project assumes the current release of Xcode, using Swift 5. 

## Run tests

From the root directory, run `swift test`

## Test Seed

This test seed is: 627d7be039e0085025a51d47e42bdd970409ec1c

The problem statement is online at: https://equalexperts.github.io/ee-tech-interviews-uk/shopping-cart-problem.html

## Project Description

### Money

All values are represented as `Decimal`s. A separate type for money didn't seem necessary for this exercise, but would most likely be helpful when building a real shopping cart.

I have added a computed property onto `Decimal` called `rounded` which will return the rounded value.

### Product

The `Product` structure is modeled as a name and a unit price. In order to store these `Product`s in the `ShoppingCart`, they conform to `Equatable` and `Hashable`.

### Shopping Cart

The shopping cart is modeled as a dictionary of `Product`s to quantities. There is also an optional sales tax field.

#### Subtotal

To compute the `subtotal`, we iterate through the dictionary, computing a line item total, and then sum these all together. (A line item total is the unit price of the product multiplied by the quantity of the product in the cart.) Finally, we round the result.

#### Sales Tax

The current sales tax rate can be set in the optional `salesTax` field. If the sales tax rate not present, then the `totalSalesTax` is zero. Otherwise, we multiply the sales tax rate by the `subtotal` to get the total sales tax. Finally, we round the result.

#### Total Price

To compute the total price, we add the total sales tax to the subtotal, and then round.

#### Adding items

If the given product is already in the shopping cart, the `add(_:quantity:)` method will add the given quantity to the existing record to the product. Otherwise, the shopping cart will add the given product with the given quantity.

