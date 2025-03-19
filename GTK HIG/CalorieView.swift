//
//  CalorieView.swift
//  GTK HIG
//
//  Created by Dini on 11/03/25.
//

import SwiftUI

struct CalorieView: View {
    
    // declare the variables and constants
    // identify the Data Types
    var totalCalories: Int = 0
    var gender: String = "Female"
    var height: Int = 170
    var weight: Double = 50.7
    var age: Int = 36
    var activityLevel: String = "Sedentary"
    
    var body: some View {
        VStack (spacing: 16) {
            
            Text("Calorie Needs (kcal)")
                .font(.largeTitle)
                .foregroundStyle(Color("ShadedBlue"))
            
            Text("0").font(.system(size: 64, weight: .bold))
                .foregroundStyle(Color("AppBlue"))
            
            
            VStack(alignment: .leading, spacing: 8) {
                // Gender Pick
                Label {
                    Text("Gender:")
                        .font(.title2)
                } icon: {
                    Image(systemName: "figure.stand.dress.line.vertical.figure")
                }
                
                Picker("Select Gender", selection: .constant(gender)) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                }
                .pickerStyle(.inline)
                
                
                // Weight
                Label {
                    Text("Weight (kg):")
                } icon: {
                    Image(systemName: "scalemass")
                }.font(.title2)
                
                TextField("Enter weight in kg", text: .constant("\(weight)"))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .font(.title2)
                
                
                // Height
                Label {
                    Text("Height (cm):")
                } icon: {
                    Image(systemName: "ruler")
                }
                .font(.title2)
                .padding(.top)
                
                
                TextField("Enter height in cm", text: .constant("\(height)"))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.title2)
                
                
                // Age
                Label {
                    Text("Age")
                } icon: {
                    Image(systemName: "number.circle.fill")
                }
                .font(.title2)
                .padding(.top)
                
                TextField("Enter your age", text: .constant("\(age)"))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.body)
                
                // Activity Level
                HStack{
                    Label {
                        Text("Activity Level")
                    } icon: {
                        Image(systemName: "figure.walk.circle.fill")
                    }
                    .font(.title2)
                    
                    Button {
                        // Pindah Halaman
                    } label: {
                        Image(systemName: "info.circle")
                    }
                }
                .padding(.top)
                
                Picker("Select Activity Level", selection: .constant(activityLevel)) {
                    Text("Sedentary").tag("Sedentary")
                    Text("Lightly Active").tag("Lightly Active")
                    Text("Moderately Active").tag("Moderately Active")
                    Text("Very Active").tag("Very Active")
                    Text("Super Active").tag("Super Active")
                }
                

                
            }
            .foregroundStyle(Color("ShadedBlue"))
            .padding(.horizontal, 24)
            .padding(.bottom, 50)
            
           
            // Calculate
            Button {
                
                // Put what to calculate
                var totalCaloriesNeed: Double  = 0
                var bmr: Double = 0 //  Basal Metabolic Rate (BMR) and Total Daily Energy Expenditure (TDEE) formulas


                // Determine activity multiplier
                let activityMultipliers: [String: Double] = [
                   "sedentary": 1.2,
                   "lightly active": 1.375,
                   "moderately active": 1.55,
                   "very active": 1.725,
                   "super active": 1.9
                ]

                // first we calculate the BMR
                if gender.lowercased() == "female" {
                   bmr = (10 * weight) + (6.25 * Double(height)) - (5 * Double(age)) - 161
                } else {
                   bmr = (10 * weight) + (6.25 * Double(height)) - (5 * Double(age)) + 5
                }

                totalCaloriesNeed = bmr * (activityMultipliers[activityLevel.lowercased()] ?? 1.2)
                
                print("Your total calories needed is \(totalCaloriesNeed)")

                
                
            } label: {
                Text("Calculate")
                    .foregroundStyle(Color("White"))
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(Color("AppBlue"))

            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding()
            
        }
        
    }
}


#Preview {
    CalorieView()
}
