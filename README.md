# Salon App - Project Structure

## Project Architecture

The application follows a clean architecture pattern with a well-organized directory structure:

```
lib/
├── common/                # Shared utilities and components
│   ├── constants.dart     # App-wide constants
│   ├── extensions.dart    # Dart extensions
│   └── utils.dart         # Utility functions
├── core/                  # Core application configuration
│   ├── config/            # Configuration files
│   │   ├── assets/        # Asset management
│   │   │   └── asset_paths.dart
│   │   ├── routing/       # Navigation and routing
│   │   │   └── app_router.dart
│   │   ├── themes/        # App themes and styling
│   │   │   ├── app_colors.dart
│   │   │   └── app_theme.dart
│   │   └── widgets/       # Reusable widgets
│   │       ├── app_button.dart
│   │       └── app_text_field.dart
│   └── usecases/          # Business logic use cases
│       └── base_usecase.dart
├── data/                  # Data layer implementation
│   ├── models/            # Data models
│   │   ├── user_model.dart
│   │   └── service_model.dart
│   ├── repositories/      # Repository implementations
│   │   ├── auth_repository_impl.dart
│   │   └── booking_repository_impl.dart
│   └── services/          # API and local services
│       ├── api_service.dart
│       └── local_storage_service.dart
├── domain/                # Business logic and models
│   ├── entities/          # Domain entities
│   │   ├── user.dart
│   │   └── service.dart
│   └── repositories/      # Repository interfaces
│       ├── auth_repository.dart
│       └── booking_repository.dart
├── main.dart              # Application entry point
├── myapp.dart             # Main app widget
└── presentaion/           # UI layer components
    ├── auth/              # Authentication module
    │   ├── controller/    # Auth state management
    │   │   └── auth_controller.dart
    │   └── screens/       # Auth screens
    │       ├── login_screen.dart
    │       └── register_screen.dart
    ├── bookmark/          # Bookmark feature
    │   ├── screens/       # Bookmark screens
    │   │   └── bookmarks_screen.dart
    │   └── widgets/       # Bookmark components
    │       └── bookmark_card.dart
    ├── details/           # Details views
    │   ├── screens/       # Detail screens
    │   │   └── service_details_screen.dart
    │   └── widgets/       # Detail components
    │       └── service_info_card.dart
    ├── home/              # Home module
    │   ├── screens/       # Main app screens
    │   │   ├── home_screen.dart
    │   │   └── profile_screen.dart
    │   └── widgets/       # Home components
    │       ├── service_card.dart
    │       └── category_list.dart
    ├── notification/      # Notification feature
    │   ├── screens/       # Notification screens
    │   │   └── notifications_screen.dart
    │   └── widgets/       # Notification components
    │       └── notification_item.dart
    ├── onboarding/        # Onboarding flow
    │   ├── controller/    # Onboarding logic
    │   │   └── onboarding_controller.dart
    │   ├── screens/       # Onboarding screens
    │   │   └── onboarding_screen.dart
    │   └── widgets/       # Onboarding components
    │       └── onboarding_page.dart
    └── splash/            # App initialization
        └── screens/       # Splash screen
            └── splash_screen.dart
```

### Directory Descriptions

#### Core Layers

- **common/**: Contains shared utilities, helpers, and components used across the application:
  - `constants.dart`: App-wide constant values and configurations
  - `extensions.dart`: Dart extension methods for enhanced functionality
  - `utils.dart`: Common utility functions and helpers

- **core/**: Houses core application setup and configuration:
  - `config/`: Configuration files for assets, routing, themes, and shared widgets
    - `asset_paths.dart`: Centralized asset path management
    - `app_router.dart`: Navigation routes and configuration
    - `app_colors.dart`: Color palette definitions
    - `app_theme.dart`: Theme data and styling
    - `app_button.dart`: Reusable button widget
    - `app_text_field.dart`: Custom text input widget
  - `usecases/`: Implementation of business logic use cases
    - `base_usecase.dart`: Base class for use cases

- **data/**: Implements data layer functionality:
  - `models/`: Data transfer objects and model classes
    - `user_model.dart`: User data model
    - `service_model.dart`: Service data model
  - `repositories/`: Repository implementations
    - `auth_repository_impl.dart`: Authentication repository implementation
    - `booking_repository_impl.dart`: Booking repository implementation
  - `services/`: API and storage services
    - `api_service.dart`: REST API service implementation
    - `local_storage_service.dart`: Local data persistence

- **domain/**: Contains business logic and domain models:
  - `entities/`: Core business entities
    - `user.dart`: User entity definition
    - `service.dart`: Service entity definition
  - `repositories/`: Repository interfaces
    - `auth_repository.dart`: Authentication repository contract
    - `booking_repository.dart`: Booking repository contract

#### Entry Points

- **main.dart**: Application entry point that initializes services and launches the app
- **myapp.dart**: Root widget that sets up routing, themes, and global providers

#### Presentation Layer

- **auth/**: Authentication module
  - `auth_controller.dart`: Authentication state management
  - `login_screen.dart`: User login interface
  - `register_screen.dart`: User registration interface

- **bookmark/**: Bookmark functionality
  - `bookmarks_screen.dart`: Saved items list view
  - `bookmark_card.dart`: Bookmark item display widget

- **details/**: Detail views for services/items
  - `service_details_screen.dart`: Service information display
  - `service_info_card.dart`: Service details component

- **home/**: Main application screens
  - `home_screen.dart`: Main dashboard view
  - `profile_screen.dart`: User profile management
  - `service_card.dart`: Service preview component
  - `category_list.dart`: Service categories display

- **notification/**: Notification handling
  - `notifications_screen.dart`: Notifications list view
  - `notification_item.dart`: Individual notification display

- **onboarding/**: User onboarding experience
  - `onboarding_controller.dart`: Onboarding state management
  - `onboarding_screen.dart`: Onboarding flow container
  - `onboarding_page.dart`: Individual onboarding step

- **splash/**: Application initialization
  - `splash_screen.dart`: Initial loading screen
