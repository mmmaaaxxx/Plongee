# 🤿 FFESSM QCM — Application de révision plongée

[![CI/CD Flutter](https://github.com/YOUR_USER/ffessm_qcm/actions/workflows/ci.yml/badge.svg)](https://github.com/YOUR_USER/ffessm_qcm/actions/workflows/ci.yml)
[![Flutter](https://img.shields.io/badge/Flutter-3.22-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.4-blue?logo=dart)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

Application Flutter de révision par QCM pour les certifications de plongée **FFESSM**, couvrant les niveaux 1 à 4 (Guide de Palanquée).

---

## 📚 Modules disponibles

| Niveau | Certification | Questions | Profondeur |
|--------|--------------|-----------|------------|
| 🐟 N1  | PE20 — Plongeur Encadré à 20m | 12 | 0–20 m |
| 🐠 N2  | PA20 / PE40 | 12 | 0–40 m |
| 🦈 N3  | PA40 / PE60 / PA60 | 12 | 0–60 m |
| ⚓ N4  | Guide de Palanquée GP-N4 | 15 | Examen |

---

## ✨ Fonctionnalités

- **QCM interactif** par niveau de certification
- **Correction immédiate** avec explication détaillée après chaque réponse
- **Bilan complet** en fin de quiz : score, pourcentage, mention
- **Revue des réponses** : toutes les questions avec la bonne réponse et l'explication
- **Animations fluides** pour une expérience agréable
- Interface **Material Design 3**, compatible Android & iOS & Web

---

## 🚀 Installation & lancement

```bash
# 1. Cloner le dépôt
git clone https://github.com/YOUR_USER/ffessm_qcm.git
cd ffessm_qcm

# 2. Installer les dépendances
flutter pub get

# 3. Lancer l'application
flutter run

# Lancer sur le web
flutter run -d chrome

# Lancer sur un émulateur Android
flutter run -d android
```

---

## 🧪 Tests

```bash
# Lancer tous les tests unitaires
flutter test

# Avec rapport de couverture
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html

# Analyse statique
flutter analyze

# Vérification du formatage
dart format --output=none --set-exit-if-changed .
```

---

## 🔄 Pipeline CI/CD (GitHub Actions)

Le fichier `.github/workflows/ci.yml` orchestre 7 jobs automatiques :

```
push/PR → analyze → test → build-android ─┐
                         → build-web      ─┼→ deploy-web (main)
                         → build-ios      ─┘
tag v* → release (APK + ZIP web)
```

| Job | Déclencheur | Action |
|-----|-------------|--------|
| 🔍 **analyze** | push/PR | `dart format` + `flutter analyze` |
| 🧪 **test** | après analyze | `flutter test --coverage` + Codecov |
| 🤖 **build-android** | après test | APK debug → artefact |
| 🌐 **build-web** | après test | Web CanvasKit → artefact |
| 🍎 **build-ios** | après test | iOS no-codesign → artefact |
| 🚀 **deploy-web** | push sur `main` | GitHub Pages automatique |
| 📦 **release** | tag `v*` | GitHub Release APK + ZIP |

### Déployer une release

```bash
git tag v1.0.0
git push origin v1.0.0
# → Crée automatiquement une GitHub Release avec APK et archive web
```

---

## 📁 Structure du projet

```
ffessm_qcm/
├── .github/
│   └── workflows/
│       └── ci.yml              # Pipeline CI/CD complet
├── lib/
│   ├── main.dart               # Point d'entrée
│   ├── models/
│   │   └── question.dart       # Modèles de données
│   ├── data/
│   │   └── quiz_data.dart      # 51 questions FFESSM N1→N4
│   └── screens/
│       ├── home_screen.dart    # Accueil — sélection du module
│       ├── quiz_screen.dart    # Quiz interactif
│       └── result_screen.dart  # Résultats + revue des réponses
├── test/
│   └── quiz_test.dart          # Tests unitaires (30 tests)
├── pubspec.yaml
├── .gitignore
└── README.md
```

---

## 📖 Sources

Questions basées sur les **Manuels de Formation Technique FFESSM** :
- Plongeur Niveau 1 — PE20 (version Décembre 2025)
- Plongeur Niveau 2 — PA20/PE40 (version Décembre 2025)
- Plongeur Niveau 3 — PA40/PE60/PA60 (version Décembre 2025)
- Guide de Palanquée Niveau 4 — GP-N4 (version Janvier 2026)

---

## 📄 Licence

MIT — Voir [LICENSE](LICENSE)
