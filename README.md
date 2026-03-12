## Weather App (Flutter) — Work in Progress

A modern Flutter weather application that provides real-time weather data, city search, and personalized weather tracking.
## Weather App (Flutter) — Work in Progress

A Flutter weather application that I am building in my free time as a learning and portfolio project.

This project demonstrates my work with:

- Flutter UI development
- State management using **Bloc / Cubit**
- Backend integration using **Supabase**
- Working with **API data**
- Local storage and device features

The project is **actively under development**, and I plan to expand it into a fully featured application using **Clean Architecture**.

---

## Current Status

### Done
- Start screen with options: **Sign up / Log in / Continue as guest**
- Navigation to custom **Login** and **Sign up** screens
- Custom UI components and layout

### In Progress
- **Supabase integration** (authentication and data flow)

### Planned

- Refactor towards **Clean Architecture**
  - introduce **use cases**
  - improve project structure
  - revisit naming and layering

- Main **Weather screen**
- **City search**
- **Favorite cities** with persistent storage
- Complete **Supabase authentication flow**
- Optional **Pro subscription** with additional features

---

## Tech Stack

**Flutter / Dart**  
Dart SDK >= 3.3.1 < 4.0.0

**State Management**
- bloc
- flutter_bloc

**Networking**
- http
- weather

**Formatting**
- intl

**Local Storage**
- hive
- hive_flutter
- path_provider

**Location**
- geolocator

**Backend**
- supabase_flutter

**UI**
- google_fonts
- lottie

---

## Assets

`assets/cities_list.json` — cities list used for search functionality.

---

## Getting Started

Clone the repository and run:

```bash
flutter pub get
flutter run