# <img src="assets/ourLogo.png" alt="Wallet Watch Logo" width="48" height="48" style="vertical-align:bottom; margin-bottom: -8px;"> <span style="line-height: 1.2;">     Wallet Watch - Your Finance Tracking App</span>



<p><strong>Wallet Watch</strong> is an intuitive, easy-to-use finance management app designed to help users manage their finances. The app offers a clean, modern user interface and powerful features like transaction tracking, budget management, and financial goal-setting, all while securely integrating with Firebase for user authentication and data storage.</p>

Demo Link : [Wallet Watch](https://youtu.be/wfyzi7Krc6U?si=0-k_QAIWzwQtH5ND)


---

## Goal :dart: 

The main goal of **Wallet Watch** is to provide an all-in-one solution for personal finance management, allowing users to:
- 👤 Maintain a personal profile to track financial goals and details.
- 📊 Track income and expenses.
- 💰 Set budgets for different categories.
- 📅 Manage recurring subscriptions and track payments like insurance.
- 💸 Track loans and monitor progress.
---

## Tech Stack

### Frontend
- **Language**: Dart
- **Framework**: Flutter
- **State Management**: Provider
- **UI/UX**: 
  - Custom gradients, animations using `Hero`, `AnimatedContainer`
- **Libraries**:
  - `fl_chart`: Data visualization
  - `flutter_colorpicker`: Color selection for UI
  - `intl`: Internationalization (Date, Currency formatting)
  
### Backend
- **Database**: Firebase Firestore
- **Authentication**: Firebase Authentication (Email/Password)

### API Integrations
- **Currency Conversion**: ExchangeRate API for real-time currency conversion

### Dependencies
- **Core Libraries**:
  - `firebase_core`: Firebase initialization
  - `firebase_auth`: Firebase Authentication
  - `cloud_firestore`: Firebase Firestore (for transactions, budgets, feedback)
  - `http`: HTTP requests for external APIs

### Dev Tools
- **Testing**: `flutter_test`
- **Linting**: `flutter_lints`

### Platform
- **Android**: `google-services.json`

### Version Control
- **Git**: GitHub for code management


---

## Features
### User Authentication
- 🔒 **Secure Login** : Email/password authentication powered by Firebase Authentication ensures data privacy and secure access.  
- 🔑 **Password Recovery** : Option to reset forgotten passwords via email to regain access easily.  
- 🕒 **Persistent Sessions** : Automatically remembers user sessions until they log out, reducing the need for repeated logins.  

### Transactions Management
- ✏️ **Add and Edit Transactions** : Easily add, edit, or delete income and expense entries.  
- 🗂️ **Categorization** : Transactions are categorized into predefined or custom categories like Food, Transport, Shopping, etc.  
- 🔍 **Search and Filters** :  
  - Filter transactions by income, expense, or category.  
  - Sort transactions by date, amount, or mode of payment (e.g., UPI, cash, card).  
- 🔄 **Recurring Transactions** : Supports subscriptions or recurring expenses, organized by title for easy management.  
- 📊 **Loans Tracking** : Displays loan progress with repayment schedules.  

### Budget Management  
- 📂 **Category-wise Budgets** : Set monthly budgets for different spending categories like Food, Transport, Entertainment, etc.  
- 📈 **Progress Visualization** :  
  - Displays a progress bar indicating the funds allocated and remaining.  
  - Shows the daily spendable amount or required savings based on current progress.  
  - Color-coded progress bars as chosen by the user to make it visually appealing.  
- 💾 **Budget History** : Keeps a log of past budgets and performance for review and planning.  

### Home Page  
- 📊 **Summary View** :  
  - Displays total income, expenses, and savings for the selected time period.  
  - Highlights top spending categories and trends with bar graphs.   
- 🔄 **Real-Time Data Updates** : Automatically refreshes to provide up-to-date information on finances.  
- 🔍 **Spending Breakdown** : Offers detailed views of each spending category and trends for easy analysis.  
- 💡 **Financial Tips** : Displays financial tips to encourage better money management.  

### Profile Management  
- ⚙️ **User Settings** :  
  - Enable dark mode or choose from available themes for a personalized experience.  
  - Update profile details like name, email, and preferred language.  
- 📝 **Feedback** :  
  - Built-in section to gather user feedback to improve user experience.  
- ❓ **FAQs** :  
  - Provides answers to common user queries, offering quick solutions and improving app usability.  
- 👤 **Profile Card** :  
  - Displays user information such as name, email, and initials (generated from the user’s first and last name).  
  - Shows a profile with the user’s initials.  
- 🖼️ **Dynamic Profile Display** :  
  - The profile section dynamically fetches user details from Firebase Firestore and updates in real time.  
- 🔑 **Secure Log-Out** :  
  - Log-out functionality that logs the user out from Firebase authentication, ensuring secure session management.  
- 🔄 **Automatic Profile Updates** :  
  - The profile data (name, email, initials) is automatically updated if any changes are made on Firestore, ensuring up-to-date information.  

### Currency Conversion  
- 💵 **Amount Input** :  
  - Users can input the amount they want to convert using a numeric keypad.  
  - Automatically triggers conversion when the input changes.  
- 🌍 **From Currency Dropdown** :  
  - Choose the source currency from a predefined list of 20 major currencies, including USD, EUR, INR, GBP, and others.  
  - Fetches the latest exchange rates dynamically based on the selected "from" currency.  
- 💱 **To Currency Dropdown** :  
  - Select the target currency to convert the amount into, from the same predefined list of currencies.  
- 🔄 **Currency Conversion** :  
  - Converts the entered amount from the source currency to the target currency using real-time exchange rates fetched from the API.  
  - Displays the converted amount to two decimal places for clarity.  
- 🧮 **Real-Time Exchange Rates** :  
  - Fetches the latest exchange rates from a reliable external API (ExchangeRate API) for accurate conversion.  
- ⏳ **Refresh Rates** :  
  - A refresh button to fetch the most up-to-date exchange rates whenever required.  
  - Ensures that users always have access to the most accurate and current conversion rates.  
- 🔄 **Automatic Conversion on Changes** :  
  - Automatically updates the conversion result when the source currency or target currency is changed.  
  - Updates conversion in real-time when the amount is modified.

### Visual Enhancements  
- 🎬 **Animations** :  
  - Smooth transitions between screens, improving the user experience.  
  - Utilizes Flutter's animation widgets like Hero and AnimatedContainer for seamless, visually appealing navigation.  
- 🎨 **Gradients and Colors** :  
  - Contemporary gradient designs and color schemes used throughout the app to create a visually dynamic and engaging interface.  
  - Colors are selected to enhance usability while maintaining a cohesive and visually pleasing aesthetic.

---



## Running the Project

### Prerequisites

Before setting up the project, make sure you have the following installed:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Firebase Account](https://firebase.google.com/)
- A code editor like [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

### Steps to Run the Project

1. **Clone the repository**

   Clone the repository using the following command:

   ```bash
   git clone https://github.com/nainika0305/Wallet_Watch.git
   ```

2. **Install dependencies**

   Navigate to the project folder and run the following command to install all dependencies:

   ```bash
   flutter pub get
   ```

3. **Configure Firebase**

   - Set up a Firebase project from the [Firebase Console](https://console.firebase.google.com/).
   - Follow the steps to enable **Firebase Authentication** (email/password).
   - Configure **Firebase Firestore** to store transactions, budgets, and feedback.
   - Download and add the `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) to your project.

4. **Run the app**

   Ensure you have a device or emulator running, then execute the following command to run the app:

   ```bash
   flutter run
   ```

### Additional Configuration

- For **Android**, make sure to add the `google-services.json` file to the `android/app` directory.
- For **iOS**, add the `GoogleService-Info.plist` file to the `ios/Runner` directory and ensure your app’s deployment target is set to at least iOS 10.

### Troubleshooting

- If you encounter issues with Firebase, check your Firebase setup and ensure all configurations are correctly followed.
- For issues related to dependencies, try running `flutter clean` and then `flutter pub get` again.


---

## The Team 👥



We are the team behind **Wallet Watch**, focused on providing an intuitive solution to help users manage their finances effectively.

### Member 1: Nainika Agrawal
- LinkedIn: [https://www.linkedin.com/in/nainika-agrawal/](https://www.linkedin.com/in/nainika-agrawal/)
- GitHub: [https://github.com/nainika0305](https://github.com/nainika0305)

### Member 2: Kavya Gupta
- LinkedIn: [https://www.linkedin.com/in/kavya-gupta-442a62285/](https://www.linkedin.com/in/kavya-gupta-442a62285/)
- GitHub: [https://github.com/kavyagupta3011](https://github.com/kavyagupta3011)

---

## Future Enhancements  
- ☁️ **Backup and Sync** :  
  - Automatic cloud syncing of data via Firebase Firestore, ensuring data availability across multiple devices.  
- 🔔 **Notifications** :  
  - Sends timely reminders for due payments, upcoming subscriptions, or overspending warnings to keep users informed.  
- 📤 **Export Options** :  
  - Users can export their transaction history and budget details in PDF or Excel formats for better reporting and tracking.




