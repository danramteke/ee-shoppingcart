import Foundation 

extension Decimal {
  var rounded: Decimal {
    var result: Decimal = 0
    var copy: Decimal = self
    NSDecimalRound(&result, &copy, 2, .plain)
    return result
  }
}
