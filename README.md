
# 📰 SwiftUI GNews App

A news browsing app built using **SwiftUI + MVVM**, featuring clean architecture, async/await API calls, and live headlines from the [GNews API](https://gnews.io).

## 🚀 Features

- 🔍 Fetches live news from **GNews API**
- 📱 SwiftUI layout with **MVVM architecture**
- 🔄 Async/Await for modern API calls
- 🌐 Tap to read full articles in **WebView**
- 🖼️ Screenshots of UI included
- 🔐 API Key secured using `.gitignore`

## 📸 Screenshots
<img width="300" height="650" alt="Launchview" src="https://github.com/user-attachments/assets/7d2df882-055d-458a-be44-d82bb3745587" />

<img width="300" height="650" alt="Homeview" src="https://github.com/user-attachments/assets/b7e554c3-d1c3-45c0-84fc-b78e7d2f7ae6" />

<img width="300" height="650" alt="DetailView" src="https://github.com/user-attachments/assets/90e6a853-a4fb-44b6-ac5b-15f721e72b7c" />

<img width="300" height="650" alt="Webview" src="https://github.com/user-attachments/assets/351f6a53-28da-4f53-a6d3-da93bc0ee737" />


## 🧠 Architecture

- **SwiftUI**: Declarative UI
- **MVVM**: Separation of concerns
- **ViewModel**: Uses `@StateObject` and `@Published`
- **Networking**: Uses `async/await` + `URLSession`

## 📦 Setup

1. Clone the repo
2. Add your GNews API Key in `Secrets.swift`:
