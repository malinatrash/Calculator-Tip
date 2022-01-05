//
//  ContentView.swift
//  firstProject
//
//  Created by Pavel Naumov on 20.11.2021.
//
// Property Wrapper @State



import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPrecentage = 0
    
    
    var totalPerPerson : Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPrecentages[tipPrecentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    let tipPrecentages = [0, 5, 10, 15, 20]
    var body: some View {
        VStack{
            NavigationView{
                Form{
                    Section{
                        TextField("Сумма в чеке (без учета чаевых)", text: $checkAmount)
                            .textFieldStyle(.roundedBorder)
                        
                        
                        
                        Picker("Количество человек", selection: $numberOfPeople){
                            ForEach(2..<100) {
                                Text("\($0) Человек(а)")
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                    Section(header: Text("Сколько чаевых хотите оставить?")){
                        Picker("Tip precentage", selection: $tipPrecentage) {
                            ForEach(0..<tipPrecentages.count){
                                Text("\(self.tipPrecentages[$0])% ")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    
                    
                    
                    Text("Один человек заплатит \(totalPerPerson, specifier: "%.0f" ) рублей ")
                    
                    
                    
                }.navigationBarTitle("Калькулятор чаевых")
                
            }
            Spacer()
            
            Text("Inst: ashap.fnm")
                .ignoresSafeArea()
                .font(.callout)
            
            
            
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

