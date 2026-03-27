# 🧬 The Seed

[![Powered by
Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)<br>[![License:
MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

> *"There is no world that cannot be reached."*\
> --- Inspired by **Sword Art Online**

**The Seed** is a **production-ready Flutter starter template** designed
to help you build scalable, maintainable, and high-performance apps ---
fast.

Built on top of the battle-tested **Very Good Core** by Very Good
Ventures, this template adds a powerful, opinionated architecture so you
can focus on building features instead of reinventing foundations.

------------------------------------------------------------------------

# 🚀 Why The Seed?

Most starter templates give you structure.

**The Seed gives you a system.**

It comes pre-wired with: 
- Architecture decisions ✅ 
- Networking layer ✅
- Dependency injection ✅ 
- Theming system ✅ 
- App configuration ✅

So you can go from:

``` bash
mason make the_seed
```

➡️ to building real features in minutes.

------------------------------------------------------------------------

# ✨ What's Included

## 🌱 The Seed Enhancements

### 🌐 Network Layer

-   Preconfigured HTTP client (Dio-ready structure)
-   Centralized API handling
-   Scalable service abstraction
-   Interceptors-ready architecture

### 💉 Dependency Injection

-   Clean DI setup (GetIt-ready structure)
-   Centralized service registration
-   Easily extendable for large apps

### 🧱 Core Architecture

``` sh
core/
├── constants     # 🔑 App constants
├── services      # ⚙️ Services layer
├── theme         # 🎨 Theming
├── router        # 🧭 Navigation
├── helpers       # 🧰 Utilities
├── components    # 🧩 UI components
├── utils         # ⚡ Shared utilities
```

### 🎨 Design System

-   Centralised AppColors
-   Theme configuration
-   Light/Dark mode ready
-   Consistent UI scaling

### ⚙️ App Configuration

-   Environment-ready structure
-   Works with VGV flavors
-   Centralized config

### 📦 Feature-Based Scaling

``` sh
features/
 └── counter/
      ├── cubit/
      ├── view/
```

-   Modular structure
-   Scalable architecture
-   Clean separation

### 🧠 Developer Experience

-   Reduced boilerplate
-   Clean architecture
-   Plug-and-play setup
-   Easy onboarding

### 🤖 Automation (Hooks)

-   Runs automatically:
    -   flutter pub get
    -   dart fix --apply
    -   dart format

------------------------------------------------------------------------

## 🦄 Very Good Foundations

-   ✅ Cross Platform
-   ✅ Build Flavors
-   ✅ Bloc Architecture
-   ✅ Testing setup
-   ✅ Strict linting
-   ✅ CI with GitHub Actions
-   ✅ Internationalization

------------------------------------------------------------------------

# 📦 Project Structure

``` sh
lib/
├── app/
├── core/
├── features/
├── l10n/
├── bootstrap.dart
└── main_*.dart
```

------------------------------------------------------------------------

# ⚡ Getting Started

## 1. Install Mason

``` bash
dart pub global activate mason_cli
```

## 2. Add the brick

``` bash
mason add the_seed --git-url https://github.com/codegeoss/the_seed.git
```

## 3. Generate your app

``` bash
mason make the_seed
```

Follow prompts and run:

``` bash
cd your_app
flutter run
```

------------------------------------------------------------------------

# 🧠 Philosophy

**The Seed is not just a template --- it's a foundation.**

It enforces: - Consistency - Scalability - Maintainability

So every app you build: - looks clean - scales easily - is
production-ready

------------------------------------------------------------------------

# 🌍 Vision

> Build worlds, not boilerplate.

------------------------------------------------------------------------

# 🪪 License

MIT License © 2026
