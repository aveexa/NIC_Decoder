# NIC Decoder App

### Description
This Flutter application decodes Sri Lankan National Identity Card (NIC) numbers to extract information such as birth date, age, gender, weekday name, NIC type, and voting eligibility. The app is built using **Material UI** and **GetX** for state management.

## Features
- Detects old and new NIC number formats.
- Displays birth date, age, gender, and weekday name.
- Identifies voting eligibility.
- User-friendly interface with Material UI.

## Screenshots
| Home Screen       | Result Screen       |
|----------------|----------------|
| ![Home Screen](assets/home.png) | ![Result Screen](assets/result.png) |

## Technologies Used
- **Flutter**
- **Dart**
- **GetX** (State Management)
- **Material UI**

## Folder Structure
```plaintext
lib/
├── main.dart                # Entry point
├── home_screen.dart     # NIC Input Screen
├── result_screen.dart   # Result Screen
├── nic_controller.dart  # NIC Decode Logic with GetX
└── assets/
    ├── bg.png              # Background Image
    └── logo.png            # Logo Image
```

## How to Run the Project
1. Clone the repository:
```bash
https://github.com/aveexa/NIC_Decoder.git
```
2. Navigate to the project directory:
```bash
cd NIC_Decoder
```
3. Install dependencies:
```bash
flutter pub get
```
4. Run the app:
```bash
flutter run
```

## NIC Decoding Logic
- Old NIC: `9 digits + 1 letter`
- New NIC: `12 digits`
- Gender identified based on day of the year (> 500 → Female, < 500 → Male)
- Birthdate calculated from the day of the year.
- Voting eligibility based on the last character in old NIC.

## Author
- **Your Name**
- [GitHub Profile](https://github.com/aveexa)

## License
This project is licensed under the MIT License.

