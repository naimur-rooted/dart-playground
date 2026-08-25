# Personal Profile Card (Assignment on Module 15)

A clean, beginner-friendly Flutter app that displays a **personal profile card**
with a profile picture, contact details, interests, and two interactive buttons.

## Features

| Feature             | Widget used      | Behaviour                                                |
| ------------------- | ---------------- | --------------------------------------------------------- |
| Profile picture     | `CircleAvatar`   | Icon-based avatar inside a bordered circle                |
| Name & profession   | `Text`           | Large bold name with a subtitle profession                |
| Short bio           | `Text`           | Centred paragraph describing the developer                |
| Email & phone       | `Icons` + `Text` | Rows with envelope / phone icons                          |
| Interests           | `Chip` + `Wrap`  | Horizontal wrap of interest chips with icons              |
| **Follow** button   | `ElevatedButton` | Toggles follow state via `setState()` and shows a `SnackBar` |
| **View Profile**    | `ElevatedButton` | Opens an `AlertDialog` with full profile details          |
| Profile container   | `Card`           | Elevated card with rounded corners wraps the whole layout |

## How it works

1. **Launch** — The app opens on the *Profile* screen showing a `Card` with
   the profile picture, name, profession, bio, email, phone, and interests.
2. **Follow button** — Tapping **Follow** calls `setState()` to flip the
   `_isFollowing` boolean (the button label changes to *Following*) and a
   coloured `SnackBar` is displayed via `ScaffoldMessenger`.
3. **View Profile button** — Tapping **View Profile** opens an `AlertDialog`
   that lists every detail (name, profession, email, phone, bio, and
   interests). A **Close** button dismisses the dialog with `Navigator.pop()`.

## Profile data

The profile information is curated from the developer's file history in this
workspace — the Windows user folder name, the Flutter/Dart assignments, and the
Module 14 *Student Profile Card* exercise — resulting in:

- **Name:** Naimur Rahman Nahid
- **Profession:** Flutter Developer
- **Email:** naimur.rooted@gmail.com
- **Phone:** 01863563717
- **Interests:** Flutter, Dart, Mobile Dev, UI/UX Design, Clean Architecture, Open world game exploration, Gardening
- **Profile picture & interest images:** stored in `doc/` (sourced from assignment documentation)

To change these values, edit the `kProfile` constant in `lib/main.dart`.

## Flutter concepts covered

- `StatelessWidget` (`MyApp`) and `StatefulWidget` (`ProfileScreen`)
- `CircleAvatar`, `Card`, `Text`, `Icons`, `ElevatedButton`
- `SnackBar` via `ScaffoldMessenger.of(context).showSnackBar()`
- `AlertDialog` via `showDialog()`
- `setState()` to toggle the follow state

## Run

```bash
flutter pub get
flutter run
```

## Test

```bash
flutter test
```
