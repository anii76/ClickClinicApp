# ClickClinic

![Click Clinic](click_clinic/assets/images/l.png)

**Find healthcare near you in Algeria, and get help from volunteers, in a few clicks.**

ClickClinic is a Flutter mobile app that helps patients find nearby doctors, hospitals, pharmacies, laboratories, opticians, imaging centres and parapharmacies on a map. It is built on a dataset of **~9,800 real Algerian health facilities**. The app also connects patients with **volunteers** ("Bénévoles") who offer free help: blood donation, bringing medicines from abroad, or hosting patients who travel for treatment.

> 📚 **Context:** 2nd-year student group project (2020), *Projet Pluridisciplinaire N°12*, Classes Préparatoires, École Supérieure en Informatique (ESI) de Sidi Bel Abbès.
> Supervised by Mme Sakina Rim Bennabi. Built by a team of 6 between March and June 2020, fully remote during the COVID-19 lockdown.

---

## The problem

Algerian families regularly struggle to find the right medical care. They post requests on social media, travel long distances to other wilayas without knowing a suitable doctor exists nearby, or look for strangers who can bring medicines that aren't available locally. Existing apps at the time were mostly incomplete lists of doctors, scattered across different apps.

ClickClinic set out to:

1. **Cut the time, cost and effort** of finding a doctor or facility close to you.
2. **Get immediate help** from volunteers in your area, for example compatible blood donors in an emergency.
3. **Let anyone offer help** to people in need.

## Features

The app has two actors, and users can switch between them at any time.

### 🩺 Patient (no account needed)
- **Map-based search** centred on your location, with an adjustable search radius.
- **Doctors by speciality**: a dropdown filters doctors by speciality and refreshes the map markers.
- **Hospitals, pharmacies, labs, opticians, imaging centres, parapharmacies**, each with a detail page (address, phone, owner, opening hours).
- **Blood donors**: find compatible volunteer donors nearby.
- **Volunteer directory**: browse available volunteers by service and contact them by phone or email.

### 🤝 Volunteer (Bénévole)
- Sign up, sign in, email verification and password reset (Firebase Auth).
- Profile management: name, phone, profile photo (camera or gallery), address and location.
- **Service management**: blood donation (with blood type), medicine delivery, patient hosting, plus free-text "other services".
- **Availability toggle**: unavailable volunteers are hidden from patient searches.
- Account settings: change email or password, delete account.

## Data: ~9,800 real facilities

We couldn't find a usable public API for Algerian health facilities, and copying thousands of entries by hand wasn't realistic. So we built a small data pipeline:

1. **Scraping**: Python + BeautifulSoup scripts crawled public Algerian health directories and extracted the relevant fields into spreadsheets.
2. **Geocoding**: each address was converted to coordinates with a geocoder (*Geocode by Awesome Table*).
3. **Import**: the cleaned data was loaded into Cloud Firestore, one collection per facility type, and queried by distance with GeoFlutterFire.

| Facility type | Records |
|---|---:|
| Pharmacies | 7,400+ |
| Opticians | 548 |
| Laboratories | 510 |
| Parapharmacies | 510 |
| Imaging centres | 487 |
| Hospitals | 345 |
| Doctors | by speciality |

## Architecture

```mermaid
flowchart LR
    subgraph App["Flutter app"]
        UI["screens/<br/>patient · benevole"]
        S["services/<br/>AuthService · DatabaseService · Carte"]
        M["models/<br/>Etablissement · Doctor · Pharmacie · … · User"]
        UI --> S --> M
    end
    S -->|auth| FA[(Firebase Auth)]
    S -->|facilities & volunteers| FS[(Cloud Firestore)]
    S -->|profile pictures| ST[(Firebase Storage)]
    S -->|map & markers| GM[Google Maps API]
    SC["Python scraper<br/>+ geocoder"] -.->|one-off import| FS
```

- **Two modules**, one per actor: `screens/patient` (search screens, facility and volunteer profiles) and `screens/benevole` (`authenticate/` for the sign-up flow, `home/` for the dashboard and settings).
- **Service layer** isolates the backend: `AuthService` implements an abstract `BaseAuth` contract, `DatabaseService` handles volunteer CRUD, and `Carte` wraps `GoogleMap` with location, radius search and markers.
- **Model hierarchy**: every facility type extends a common `Etablissement` base class.
- **Security rules**: reads are public, writes are restricted to authenticated accounts.

The design phase came before implementation and included UML use-case, sequence and class diagrams, documented in the project report.

### File structure

```
click_clinic/lib/
├── main.dart
├── models/          # Etablissement + subclasses, User / UserData
├── services/        # auth.dart, database.dart, Carte.dart (map), searchResult.dart
├── screens/
│   ├── patient/     # principal (home), medecins, hopitaux, pharmacies, labo, …
│   │   └── profiles/   # facility & volunteer detail pages
│   └── benevole/
│       ├── authenticate/  # sign in, multi-step register (services, blood type, address), reset password
│       └── home/          # dashboard, drawer, account & service settings
└── shared/          # onboarding, welcome screen, app settings, loading
```

## Tech stack

| Area | Tools |
|---|---|
| App | Flutter 1.12 / Dart 2.7, Provider, SharedPreferences |
| Backend | Firebase Auth, Cloud Firestore, Firebase Storage |
| Maps & location | Google Maps API (`google_maps_flutter`), GeoFlutterFire, `location`, `geolocator` |
| Data | Python 3.7, BeautifulSoup, Geocode by Awesome Table |
| Design | Adobe XD, Zeplin (design-to-code handoff), Illustrator, Inkscape, draw.io (UML) |
| Collaboration | Git/GitHub, Trello, Google Meet, Telegram |

We chose Flutter after comparing it with React Native, Xamarin and Ionic: one codebase for Android and iOS, near-native performance and hot reload. We chose Firebase for its first-class Flutter support and its admin console.

## Design

The UI went through a full design process. We started with a low-fidelity mockup ([`Maquette.pdf`](Maquette.pdf)) and paper sketches, then built high-fidelity screens in Adobe XD, handed them off to developers through Zeplin, and iterated on feedback from the team.

- **Colour:** primary blue `#00B9FF`. Blue is the dominant colour in medical branding and is associated with trust and professionalism.
- **Typography:** sans-serif families (Poppins, Circular Std) for a clean, modern look.

## Demo

<p align="center"><img src="screenshots/demo.gif" alt="ClickClinic demo" width="300"></p>

*Promo clip from our final presentation (captions in French).*

## Screenshots

| Splash Screen | Onboarding 1 | Onboarding 2 | Onboarding 3 |
|:-:|:-:|:-:|:-:|
| ![Splash screen](screenshots/splash.jpg) | ![Onboarding 1](screenshots/onboarding1.jpg) | ![Onboarding 2](screenshots/onboarding2.jpg) | ![Onboarding 3](screenshots/onboarding3.jpg) |

| Welcome Menu | Patient Menu 1 | Patient Menu 2 | Patient Drawer |
|:-:|:-:|:-:|:-:|
| ![Welcome menu](screenshots/menu.jpg) | ![Patient menu 1](screenshots/patient-menu.jpg) | ![Patient menu 2](screenshots/patient-autres.jpg) | ![Patient drawer](screenshots/patient-drawer.jpg) |

| Doctors | Hospitals | Pharmacies | Blood Donors |
|:-:|:-:|:-:|:-:|
| ![Doctors](screenshots/specialites.jpg) | ![Hospitals](screenshots/hospitals.jpg) | ![Pharmacies](screenshots/pharmacies.jpg) | ![Blood donors](screenshots/search-area.jpg) |

| Laboratories | Parapharmacies | Opticians | Imaging Centres |
|:-:|:-:|:-:|:-:|
| ![Laboratories](screenshots/laboratories.jpg) | ![Parapharmacies](screenshots/parapharmacie.jpg) | ![Opticians](screenshots/opticien.jpg) | ![Imaging centres](screenshots/imagerie.jpg) |

| Doctor Details | Facility Details | Volunteer List | Volunteer Details |
|:-:|:-:|:-:|:-:|
| ![Doctor details](screenshots/doctor-detail.jpg) | ![Facility details](screenshots/etablissement-details.jpg) | ![Volunteer list](screenshots/benevole-list.jpg) | ![Volunteer details](screenshots/benevole-details.jpg) |

| Register | Choose Services | Blood Type | Location |
|:-:|:-:|:-:|:-:|
| ![Register](screenshots/register.jpg) | ![Choose services](screenshots/register1.jpg) | ![Blood type](screenshots/register2.jpg) | ![Location](screenshots/register3.jpg) |

| Sign In | Reset Password | Volunteer Home | Volunteer Drawer |
|:-:|:-:|:-:|:-:|
| ![Sign in](screenshots/connexion.jpg) | ![Reset password](screenshots/password-reset.jpg) | ![Volunteer home](screenshots/benevole-home.jpg) | ![Volunteer drawer](screenshots/benevole-drawer.jpg) |

| App Settings | Account Settings | Service Settings 1 | Service Settings 2 |
|:-:|:-:|:-:|:-:|
| ![App settings](screenshots/app-setting.jpg) | ![Account settings](screenshots/account-setting.jpg) | ![Service settings 1](screenshots/service-setting1.jpg) | ![Service settings 2](screenshots/service-setting2.jpg) |

## Team

Group N°09, ESI Sidi Bel Abbès, 2nd-year preparatory classes (2020):

- Anfal Bourouina, *team lead*
- Anis Amazouz
- Syphax Cherfaoui
- Rahma Hamma
- Amine Moussouni
- Ghiles Ouhenia

Supervisor: **Mme Sakina Rim Bennabi**.

## Running it

> ⚠️ This project dates from 2020 (Flutter 1.12, pre-null-safety plugins). It won't build on a current Flutter SDK without upgrading its dependencies.

To try it on a matching toolchain:

1. Install Flutter 1.12.x / Dart 2.7.
2. Add your own Firebase project config (`android/app/google-services.json`).
3. Add a Google Maps API key to `android/app/src/main/AndroidManifest.xml` (`com.google.android.geo.API_KEY`).
4. `cd click_clinic && flutter pub get && flutter run`

Minimum Android version: 6.0 (Marshmallow). The app needs internet access and GPS.

## Looking back

This was my first team project, and I'm proud of what six second-year students shipped remotely in the middle of a pandemic: real data, a real use case, and a complete design-to-delivery process. With what I know now, I'd do a few things differently:

- **Less duplication:** the facility screens are nearly identical and should be one parameterised screen.
- **Responsive layout** instead of hand-tuned alignments.
- **Async correctness** in the data layer (some getters return before their Firestore read completes).
- **Tests** and a CI pipeline.
- **Ship the scraper** and the data-cleaning scripts in the repo.

Ideas we planned but didn't build: doctor and facility ratings, pharmacy accounts with live medicine availability, a patient–volunteer chat, and publishing to the Play Store and App Store.
