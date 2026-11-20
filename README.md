# Smart Canteen 🍔🍕

A modern, high-performance Smart Canteen mobile application built with **Flutter**, **GetX State Management**, **MVC Architecture**, and **Firebase Authentication**.

---

## 🎨 UI Designs & Exact Clones (4 Screens Only)
This app contains exclusively the 4 Figma design screens with 100% pixel-perfect fidelity:
1. **Splssh (`SplsshView`)** — *From Splssh.pdf*
   - Solid Teal `#008C8C` background
   - Centered circular canteen storefront illustration
   - Timed auto-transition via `SplashController`
2. **Sign In (`SignInView`)** — *From sign in.pdf*
   - Canteen brand logo
   - Reusable `CustomTextField` for Phone Number (`+923000 0000000`)
   - Reactive `CustomTextField` with visibility toggle for Password
   - "Forgot Password?" flow
   - Reactive `CustomButton` with loading indicator
   - "Don't have an account? Sign up" navigation
3. **Sign Up (`SignUpView`)** — *From sign Up.pdf*
   - Registration form: Full Name, Phone Number, Address
   - 2-Column responsive rows: `[ City ]` + `[ State ]` and `[ Zip Code ]` + `[ Country ]`
   - Password field with show/hide toggle
   - Reactive `CustomButton` with Firebase account registration
   - Direct link to Sign In
4. **Home (`HomeView`)** — *From Home.pdf*
   - Top Header: Amirul Hakim profile avatar, golden-yellow name (`#E5A93C`), location, notification bell
   - Personalized greeting: `"Hey Halal, Good Afternoon!"`
   - Categories row (`Pizza`, `Burger`, `Shawarma`, `Rolls`) with `"See All >"`
   - 2-Column "Most Popular" grid featuring `Peri Peri Pizza Small`, price tags (`Rs 500`), and `(+)` add to tray buttons
   - Bottom navigation bar with live cart item counter badge

---

## 🏗️ Architecture & Technology Stack
- **Framework:** Flutter (Material 3)
- **State Management:** GetX (`Rx`, `Obx`, `GetxController`)
- **Pattern:** MVC (Model - View - Controller)
  - `models/`: `UserModel`, `CategoryModel`, `FoodItemModel`
  - `views/`: `SplsshView`, `SignInView`, `SignUpView`, `HomeView`
  - `controllers/`: `SplashController`, `AuthController`, `HomeController`
- **Routing:** GetX Navigation (`AppRoutes` & `AppPages` with transitions & bindings)
- **Custom Reusable Widgets:**
  - `CustomTextField`: Consistent styling, labels, hint text, outline borders, obscure text
  - `CustomButton`: Consistent Teal elevated buttons with reactive spinner
  - `CategoryItemWidget`: Food category card
  - `FoodCardWidget`: Popular menu card with image, title, price, and add action
- **Backend / Authentication:**
  - Firebase Authentication (`FirebaseAuth`)
  - Cloud Firestore (`FirebaseFirestore`) for user profile documents
  - Graceful fallback mode for instant local testing when Firebase configuration is pending

---

## 🚀 How to Run
```bash
# 1. Clone repository
git clone https://github.com/askahmad/Smart_Canteen.git
cd Smart_Canteen

# 2. Get dependencies
flutter pub get

# 3. Run application
flutter run
```
