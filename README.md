# ✅ Tasky - Task Manager App

Modern Flutter Task Management Application built with Clean Architecture, Local Storage, and Multiple State Management Approaches.

---

# 📱 Features

✅ Add Tasks  
✅ Edit Tasks  
✅ Delete Tasks  
✅ Mark Tasks as Completed  
✅ High Priority Tasks  
✅ Task Progress Tracking  
✅ Dark & Light Theme  
✅ Local Data Persistence  
✅ Responsive UI  
✅ Profile Section  
✅ OnBoarding Screens  

---

# 🧪 Different Implementations

This project was implemented using multiple approaches to compare different state management solutions and local storage techniques.

### 🔹 Version 1
* Shared Preferences + Cubit (BLoC)

### 🔹 Version 2
* Hive + Cubit (BLoC)

### 🔹 Version 3
* Hive + Provider

The goal was to practice scalable Flutter architectures, offline-first concepts, and multiple state management patterns.

---

# 🧱 Project Architecture

The project follows:

* Clean Architecture
* Feature-Based Structure
* SOLID Principles
* Separation of Concerns
* Reusable Components
* Scalable & Maintainable Codebase

---

# ⚙️ State Management

The project uses:

```yaml
flutter_bloc
provider
````

Architecture Flow:

```txt
UI → Controller → UseCase → Repository → Data Source
```

---

# 📂 Folder Structure

```bash
lib
│
├── core
│   ├── common_widgets
│   ├── constants
│   ├── helper
│   ├── routing
│   ├── theme
│   └── utils
│
├── feature
│   ├── data
│   │   ├── data_sources
│   │   ├── model
│   │   └── repositories_impl
│   │
│   ├── domain
│   │   ├── entities
│   │   ├── repositories
│   │   └── usecases
│   │
│   └── presentation
│       ├── controller
│       └── pages
│
├── main.dart
└── my_app.dart
```

---

# 💾 Local Storage

The project uses:

```yaml
hive_ce
shared_preferences
```

Features:

✅ Offline Storage
✅ Local Task Persistence
✅ Theme Persistence
✅ Cached User Data

---

# 🎨 UI & UX

Packages used:

* flutter_svg
* percent_indicator

Features:

✅ Responsive UI
✅ Dark & Light Mode
✅ Reusable Widgets
✅ Modern Clean Design
✅ Smooth User Experience

---

# 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_bloc: ^9.1.1
  provider: ^6.1.5+1
  get_it: ^9.2.1

  hive_ce_flutter: ^2.3.4
  shared_preferences: ^2.5.4

  flutter_svg: ^2.2.3
  percent_indicator: ^4.2.5

  image_picker: ^1.2.1
  path_provider: ^2.1.5
```

---

# 🚀 Getting Started

## 1️⃣ Clone Project

```bash
git clone https://github.com/QassemAbied/tasky
```

---

## 2️⃣ Install Packages

```bash
flutter pub get
```

---

## 3️⃣ Generate Hive Files

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 4️⃣ Run App

```bash
flutter run
```

---

# 🛠️ Tech Stack

* Flutter
* Dart
* BLoC
* Provider
* Clean Architecture
* Hive
* Shared Preferences
* GetIt

---

# 📸 App Screens

## 🏠 Home Screens

| Light Mode | Dark Mode |
|------------|------------|
| <img src="assets/screenshot_shots/home.png" width="250"/> | <img src="assets/screenshot_shots/home_black.png" width="250"/> |

---

## ✅ Todo Tasks

| Light Mode | Dark Mode |
|------------|------------|
| <img src="assets/screenshot_shots/todo.png" width="250"/> | <img src="assets/screenshot_shots/todo_black.png" width="250"/> |

---

## ✔ Completed Tasks

| Light Mode | Dark Mode |
|------------|------------|
| <img src="assets/screenshot_shots/completed.png" width="250"/> | <img src="assets/screenshot_shots/completed_black.png" width="250"/> |

---

## ➕ Add Task

| Light Mode | Dark Mode |
|------------|------------|
| <img src="assets/screenshot_shots/add_task.png" width="250"/> | <img src="assets/screenshot_shots/add_task_black.png" width="250"/> |

---

## 👤 Profile

| Light Mode | Dark Mode |
|------------|------------|
| <img src="assets/screenshot_shots/profile.png" width="250"/> | <img src="assets/screenshot_shots/profile_black.png" width="250"/> |

---
```


---

# 🎯 Key Features

✔ Clean Architecture
✔ Responsive UI
✔ Offline Storage
✔ Local Database
✔ State Management
✔ Dark & Light Theme
✔ Scalable Structure

---

# 🌿 Branches

The repository contains multiple branches demonstrating different implementations:

* `main` → Shared Preferences + Cubit
* `hive` → Hive + Cubit
* `provider` → Hive + Provider

---

# 👨‍💻 Developer

Built with ❤️ using Flutter & Clean Architecture.

```

