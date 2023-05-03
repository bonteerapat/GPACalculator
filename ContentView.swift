//
//  ContentView.swift
//  GPA_Calculator
//
//  Created by Bon Teerapat on 2/5/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @State var resultGPA:String = "เกรดเฉลี่ยของฉัน"
    @State var resultGrade:String = "ระดับของฉัน"
    @State var mathGrade:String = ""
    @State var mathUnit:String = ""
    @State var sciGrade:String = ""
    @State var sciUnit:String = ""
    @State var engGrade:String = ""
    @State var engUnit:String = ""
    @State var thaiGrade:String = ""
    @State var thaiUnit:String = ""
    @State var socGrade:String = ""
    @State var socUnit:String = ""
    @State var sumUnit:Double = 0
    
    var body: some View {
        VStack {
            Text("ระบบคำนวณเกรดเฉลี่ย").font(.largeTitle)
            // Show GPA
            Text("เกรด: " + resultGPA)
                .font(.title)
                .foregroundColor(.blue)
                .frame(width: 300, height: 60, alignment:.center)
                .border(.blue)
                
            // Show Grade Level
            Text("ระดับ: " + resultGrade)
                .font(.title)
                .foregroundColor(.blue)
                .frame(width: 300, height: 60, alignment: .center)
                .border(.blue)
            // Math
            HStack{
                HStack{
                    Text("คณิต").font(.title3).frame(width: 60)
                }
                TextField("เกรด", text:$mathGrade)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("หน่วยกิต", text: $mathUnit)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            // Sci
            HStack{
                HStack{
                    Text("วิทย์").font(.title3).frame(width: 60)
                }
                TextField("เกรด", text:$sciGrade)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("หน่วยกิต", text: $sciUnit)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            // Eng
            HStack{
                HStack{
                    Text("อังกฤษ").font(.title3).frame(width: 60)
                }
                TextField("เกรด", text:$engGrade)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("หน่วยกิต", text: $engUnit)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            // Thai
            HStack{
                HStack{
                    Text("ไทย").font(.title3).frame(width: 60)
                }
                TextField("เกรด", text:$thaiGrade)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("หน่วยกิต", text: $thaiUnit)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            // Social
            HStack{
                HStack{
                    Text("สังคม").font(.title2).frame(width: 60)
                }
                TextField("เกรด", text:$socGrade)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("หน่วยกิต", text: $socUnit)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            
            // button cal
            Button("คำนวณเกรดเฉลี่ย"){
                self.sumUnit = (Double(self.mathUnit)!+Double(self.sciUnit)!) + (Double(self.engUnit)!+Double(self.thaiUnit)!) + (Double(self.socUnit)!)
                
                let result = ((Double(self.mathGrade)!*Double(self.mathUnit)!) + (Double(self.sciGrade)!*Double(self.sciUnit)!) + (Double(self.engGrade)!*Double(self.engUnit)!) + (Double(self.thaiGrade)!*Double(self.engUnit)!) + (Double(self.socGrade)!*Double(self.socUnit)!))/self.sumUnit
                
                self.resultGPA = String(format:"%.2f", result)
                
                if result > 4.00 || result < 0 {
                    self.resultGrade = "Error"
                }
                if result >= 3.75 {
                    self.resultGrade = "A"
                }else if result >= 3.00 {
                    self.resultGrade = "B"
                }else if result >= 2.25 {
                    self.resultGrade = "C"
                }else if result >= 2.00 {
                    self.resultGrade = "D"
                }else {
                    self.resultGrade = "F"
                }
            }.frame(width: 150, height: 50).background(.blue).foregroundColor(.white).cornerRadius(10)
            
            // button clear
            Button("Clear form"){
                self.resultGPA = "เกรดเฉลี่ยของฉัน"
                self.resultGrade = "ระดับของฉัน"
                self.mathGrade = ""
                self.mathUnit = ""
                self.sciGrade = ""
                self.sciUnit = ""
                self.engGrade = ""
                self.engUnit = ""
                self.thaiGrade = ""
                self.thaiUnit = ""
                self.socGrade = ""
                self.sciUnit = ""
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
