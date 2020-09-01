//
//  ArrayOfNews.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 01.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import Foundation

let newsIvan = "Swift tuple is a container to keep multiple data values. Use tuples to combine values. A tuple can contain Int, String, Double, Float, or Struct. When you create a tuple you can not add or remove items from a tuple because they are fixed in size. You can not change the data type of items in a tuple because they always have the same data types they were created with. Tuple most commonly used in function for returning multiple values or defined a variable that returns multiple values."
let newsAndrey = "If you define like that Compiler will show you a warning message like that: “Variable ‘blankTuple’ inferred to have type ‘()’, which may be unexpected.” This is not important because this type is an alias. However, an empty tuple won’t work for you it’s just information."
let newsRichard = "Tuples are value types. For example, you can check and verify this information for more clarity. Define a simple Tuple and call it and then assign it another one variable. At last, change the first created tuple values, you will see the second variable values not changed which is assigned."
let newsJoanna = "Using the Tuples in Swift gives you more practice and that will you save from hours wasted time. If you use the tuples properly that will provide more benefits. Give a chance and use it. And one more info; I used the “var” prefix in the code’s examples and also you can use the “let” prefix. Enjoy more Swift data types. Thanks for reading :) Please feel free to drop a comment and share it."
let newsAnna = "Swift — открытый мультипарадигмальный компилируемый язык программирования общего назначения. Создан компанией Apple в первую очередь для разработчиков iOS и macOS. Swift работает с фреймворками Cocoa и Cocoa Touch и совместим с основной кодовой базой Apple, написанной на Objective-C. Swift задумывался как более лёгкий для чтения и устойчивый к ошибкам программиста язык, нежели предшествовавший ему Objective-C"
let newsLena = "Apple — американская корпорация, производитель персональных и планшетных компьютеров, аудиоплееров, телефонов, программного обеспечения. Один из пионеров в области персональных компьютеров и современных многозадачных операционных систем с графическим интерфейсом. Штаб-квартира — в Купертино, штат Калифорния"
let newsMarina = "Google — американская транснациональная корпорация, реорганизованная 15 октября 2015 года в международный конгломерат Alphabet Inc., компания в составе холдинга Alphabet, инвестирующая в интернет-поиск, облачные вычисления и рекламные технологии"


let arrayOfNews = [
    (image: "Иван Иванов", name: "Иван Иванов", dateOfNews: "30.08.2020", textNews: newsIvan, photo: "И1"),
    (image: "Андрей Петров", name: "Андрей Петров", dateOfNews: "29.08.2020", textNews: newsAndrey, photo: "И2"),
    (image: "Richard Jackson", name: "Richard Jackson", dateOfNews: "28.08.2020", textNews: newsRichard, photo: "И3"),
    (image: "Joanna Jones", name: "Joanna Jones", dateOfNews: "27.08.2020", textNews: newsJoanna, photo: "И1"),
    (image: "Анна Каренина", name: "Анна Каренина", dateOfNews: "26.08.2020", textNews: newsAnna, photo: "И2"),
    (image: "Лена Маркина", name: "Лена Маркина", dateOfNews: "25.08.2020", textNews: newsLena, photo: "И3"),
    (image: "Марина Иванова", name: "Марина Иванова", dateOfNews: "24.08.2020", textNews: newsMarina, photo: "И1")
]

let news = News.getNews(from: arrayOfNews)
