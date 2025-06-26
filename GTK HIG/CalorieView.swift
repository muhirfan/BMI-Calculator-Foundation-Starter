//
//  CalorieView.swift
//  GTK HIG
//
//  Created by Dini on 11/03/25.
//

import SwiftUI

/*
 Steps
 1. Tambah @state di depan deklarasi variable, hanya variable yang perubahannya perlu diketahui untuk redraw View
 2. Gunakan variable tersebut pada view yang membutuhkannya.
 3. Gunakan varable dalam perhitungan jika diperlukan
 */


struct CalorieView: View {
    
    // declare the variables and constants
    // identify the Data Types
    
    //1.
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
            
            Text("\(totalCalories)").font(.system(size: 64, weight: .bold))
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
                
                
                TextField("Enter weight in kg", value: .constant(weight), formatter: {
                    let formatter = NumberFormatter()
                    formatter.numberStyle = .decimal
                    formatter.maximumFractionDigits = 2
                    return formatter
                }())
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
                
                
                TextField("Enter height in cm", value: .constant(height), formatter: NumberFormatter() )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .font(.title2)
                
                
                // Age
                Label {
                    Text("Age")
                } icon: {
                    Image(systemName: "number.circle.fill")
                }
                .font(.title2)
                .padding(.top)
                
                TextField("Enter your age", value: .constant(age), formatter: NumberFormatter())
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
        
                //3.
                

                
                
            } label: {
                Text("Calculate")
                    .foregroundStyle(Color.appWhite)
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
