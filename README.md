# Hairvana Salon Manager

A modern, feature-rich Flutter application designed to help salon owners manage their business operations efficiently. Built with Clean Architecture principles and Riverpod state management.

## 🎨 Features

### 📱 Core Features
- **Dashboard**: Overview of salon performance with key metrics
- **Appointments**: Manage upcoming, past, and pending appointment requests
- **Clients**: Client history and management with search functionality
- **Earnings**: Revenue tracking with charts, CSV export, and invoice generation
- **Settings**: App configuration with dark mode support

### 🔐 Authentication
- **Sign In**: Email/phone and password authentication
- **Registration**: Salon registration with owner details
- **Verification**: Document upload for salon verification

### 🎯 Key Capabilities
- **Dark/Light Mode**: Unified theming across the entire app
- **Search & Filter**: Advanced search functionality for clients and appointments
- **Data Export**: CSV export for transaction history
- **Invoice Generation**: PDF invoice creation and preview
- **Responsive Design**: Optimized for various screen sizes

## 🏗️ Architecture

### Clean Architecture Implementation
The app follows Clean Architecture principles with a feature-first approach:

```
lib/
├── core/
│   ├── theme/          # App theming and colors
│   ├── utils/          # Utility functions
│   └── widgets/        # Shared UI components
├── features/
│   ├── auth/           # Authentication feature
│   │   ├── domain/     # Business logic and entities
│   │   ├── data/       # Data sources and repositories
│   │   └── presentation/ # UI and state management
│   ├── appointments/   # Appointments management
│   ├── clients/        # Client management
│   ├── earnings/       # Revenue tracking
│   ├── settings/       # App settings
│   ├── onboarding/     # Onboarding flow
│   └── splash/         # Splash screen
└── main.dart           # App entry point
```

### State Management
- **Riverpod**: Modern state management solution
- **StateNotifierProvider**: For complex state management
- **Provider**: For dependency injection and simple state

## 🛠️ Technology Stack

### Core Technologies
- **Flutter**: 3.x (Latest stable)
- **Dart**: 3.x
- **Riverpod**: State management
- **Material Design 3**: UI components

### Key Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.4.9
  shared_preferences: ^2.2.2
  fl_chart: ^0.66.0
  csv: ^5.1.1
  share_plus: ^7.2.1
  pdf: ^3.10.7
  printing: ^5.11.1
  path_provider: ^2.1.1
  font_awesome_flutter: ^10.6.0
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.x or higher)
- Dart SDK (3.x or higher)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/salon_hairvana_app.git
   cd salon_hairvana_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Platform Support
- ✅ Android (API 21+)
- ✅ iOS (12.0+)
- ⏳ Web (Coming soon)
- ⏳ Desktop (Coming soon)

## 📱 Screenshots

### Light Mode
- Dashboard with key metrics
- Appointments management
- Client history
- Earnings dashboard
- Settings with dark mode toggle

### Dark Mode
- Unified dark theme across all screens
- Proper contrast and readability
- Consistent color scheme

## 🎨 UI/UX Features

### Design System
- **Color Scheme**: Purple-based primary colors
- **Typography**: Material Design 3 text styles
- **Components**: Custom widgets for consistency
- **Animations**: Smooth transitions and micro-interactions

### Responsive Design
- **Mobile-First**: Optimized for mobile devices
- **Adaptive Layout**: Responsive to different screen sizes
- **Touch-Friendly**: Proper touch targets and spacing

## 🔧 Configuration

### Environment Setup
1. **Android Configuration**
   - Minimum SDK: 21
   - Target SDK: 34
   - Compile SDK: 34

2. **iOS Configuration**
   - Minimum iOS Version: 12.0
   - Swift version: 5.0

### Build Configuration
```bash
# Debug build
flutter run

# Release build
flutter build apk --release
flutter build ios --release
```

## 📊 Features in Detail

### Dashboard
- **Key Metrics**: Appointments, ratings, earnings
- **Quick Actions**: Add stylist, add service
- **Performance Overview**: Visual representation of salon performance

### Appointments
- **Tabbed Interface**: Upcoming, Past, Requests
- **Appointment Cards**: Detailed appointment information
- **Actions**: Reschedule, cancel appointments
- **Search & Filter**: Find specific appointments

### Clients
- **Client List**: Searchable client database
- **Client Cards**: Contact information and visit history
- **History View**: Detailed client appointment history
- **Search Functionality**: Real-time client search

### Earnings
- **Revenue Charts**: Monthly revenue visualization
- **Transaction History**: Detailed transaction records
- **Export Features**: CSV export functionality
- **Invoice Generation**: PDF invoice creation

### Settings
- **Theme Toggle**: Dark/Light mode switching
- **App Configuration**: Various app settings
- **Data Management**: Export and backup options

## 🧪 Testing

### Test Structure
```
test/
├── unit/           # Unit tests
├── widget/         # Widget tests
└── integration/    # Integration tests
```

### Running Tests
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage
```

## 📦 Build & Deploy

### Android Build
```bash
# Generate APK
flutter build apk --release

# Generate App Bundle
flutter build appbundle --release
```

### iOS Build
```bash
# Build for iOS
flutter build ios --release

# Archive for App Store
flutter build ipa --release
```

## 🤝 Contributing

### Development Workflow
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style
- Follow Dart/Flutter style guidelines
- Use meaningful variable and function names
- Add comments for complex logic
- Write unit tests for business logic

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Flutter Team**: For the amazing framework
- **Riverpod**: For excellent state management
- **Material Design**: For design guidelines
- **Open Source Community**: For various packages and tools

## 📞 Support

For support and questions:
- **Email**: support@hairvana.com
- **Documentation**: [docs.hairvana.com](https://docs.hairvana.com)
- **Issues**: [GitHub Issues](https://github.com/yourusername/salon_hairvana_app/issues)

## 🔄 Version History

### v1.0.0 (Current)
- Initial release
- Core salon management features
- Dark/Light mode support
- Clean Architecture implementation
- Riverpod state management

### Upcoming Features
- [ ] Push notifications
- [ ] Online booking system
- [ ] Payment integration
- [ ] Multi-language support
- [ ] Cloud sync
- [ ] Analytics dashboard

---

**Made with ❤️ for salon owners worldwide**
