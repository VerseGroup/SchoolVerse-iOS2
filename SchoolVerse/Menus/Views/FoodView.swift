//
//  FoodView.swift
//  SchoolVerse
//
//  Created by Steven Yu on 10/1/22.
//

import SwiftUI

struct FoodView: View {
    let food: Food
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(food.name)
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
            }
            Text(food.ingredients)
                .fontWeight(.medium)
            
            DisclosureGroup(
                content: {
                    VStack(alignment: .leading) {
                        // extract to view that expands vstack
                        HStack {
                            Spacer()
                        }
                        Text("Calories: \(food.nutrition.calories?.description ?? "N/A")")
                        
                        Text("Grams of Added Sugar: \(food.nutrition.gramsAddedSugar?.description ?? "N/A")")
                        
                        Text("Grams of Carbs: \(food.nutrition.gramsCarbs?.description ?? "N/A")")
                         
                         Text("Grams of Fat: \(food.nutrition.gramsFat?.description ?? "N/A")")
                        
                        Text("Grams of Fiber: \(food.nutrition.gramsFiber?.description ?? "N/A")")
                        
                        Text("Grams of Protein: \(food.nutrition.gramsProtein?.description ?? "N/A")")
                        
                        Text("Grams of Saturated Fat: \(food.nutrition.gramsSaturatedFat?.description ?? "N/A")")
                        
                        Text("Grams of Sugar: \(food.nutrition.gramsSugar?.description ?? "N/A")")
                    }
                }, label: {
                    Text("Nutrition")
                        .font(.headline)
                }
            )
            .accentColor(Color.white)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .foregroundColor(Color.white)
        .background(Color.purple)
        .cornerRadius(10)
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(food: Food(name: "Hamburger", ingredients: "Beef, cheese, bun, onion", nutrition: Nutrition(calories: 100, gramsAddedSugar: 100, gramsCarbs: 100, gramsFat: 100, gramsFiber: 100, gramsProtein: 100, gramsSaturatedFat: 100, gramsSugar: 100, gramsTransFat: 100, iuVitaminA: 100, mgCalcium: 100, mgCholesterol: 100, mgIron: 100, mgPotassium: 100, mgSodium: 100, mgVitaminC: 100, mgVitaminD: 100, rawCalories: 100, reVitaminA: 100), servingSize: ServingSize(servingSizeAmount: "100", servingSizeUnit: "Grams")))
    }
}
