import Foundation

extension Double {
    var formattedCalories: String {
        "\(Int(self)) kcal"
    }

    var formattedGrams: String {
        "\(Int(self))g"
    }

    var formattedLiters: String {
        String(format: "%.1fL", self)
    }

    var percentString: String {
        "\(Int(self * 100))%"
    }
}
