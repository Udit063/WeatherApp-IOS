# 🌦️ WeatherApp – SwiftUI (Static Weather UI)

WeatherApp is a beautifully designed iOS application built using **SwiftUI**.  
It displays a list of locations with weather conditions, temperatures, and detailed weather info — all styled with a custom **dark blue theme** and modern UI.

This project is beginner-friendly and demonstrates key SwiftUI concepts:
- NavigationStack
- Lists, Filtering & Search
- Models, Enums & Computed Properties
- Custom UI styling
- Passing data between views

---

## 🚀 Features

### 🏠 Landing Page
- Dark blue theme  
- Umbrella logo centered  
- White text  
- Navigation arrow to proceed  

### 📍 Location List Page
- Search bar to filter cities  
- Weather icons that change color based on condition  
- Inner bluish rounded card background  
- List with transparent background  
- Smooth navigation to detail screen  

### 🌤️ Detail Page
- Weather icon  
- City name & location  
- Min/Max temperature  
- Weather description  
- Clean dark UI  

---

## 🧱 Project Structure

WeatherApp/
│
├── WeatherAppApp.swift # App Entry Point
├── ContentView.swift # Global dark theme + NavigationStack
│
├── Models.swift # WeatherType, Temperature, Location models
│
├── LandingPage.swift # Logo + navigation to list
├── LocationListPage.swift # Search + list inside bluish card
├── DetailPage.swift # Weather details screen
│
└── Assets.xcassets # App images & colors


---

## 🧩 Model Overview

### `WeatherType`
- Enum for sunny, rainy, snowy, windy, foggy  
- Provides:
  - icon name  
  - icon color  

### `Temperature`
- min / max values  
- computed text (`"22°/32°"`)

### `Location`
- id  
- name  
- location (state/country)  
- weather type  
- temperature struct  
- description  

---

## 🎨 UI Theme

### Outer Background (global)
Color(red: 0.03, green: 0.08, blue: 0.20)
