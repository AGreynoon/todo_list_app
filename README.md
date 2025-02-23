# Todo List App - feature/riverpod_v2

This branch demonstrates the implementation of state management using Riverpod 2.0 with `StateNotifierProvider` in the To-Do List App.

## Purpose

The purpose of this branch is to refactor the app by replacing `StatefulWidget` with Riverpod's `StateNotifierProvider` for state management. This change enhances scalability, code maintainability, and separation of concerns.

## Key Features

- **Riverpod 2.0 State Management:** Centralized state management using `StateNotifierProvider`.
- **Refactored File Structure:** Organized codebase for better scalability.
- **Improved Readability and Maintenance:** Logic separated from UI components.
- **Fully Functional CRUD Operations:** Add, Edit, and Delete task features.

## Known Limitations

- Tasks are not persisted; data will be lost upon app closure.
- Additional testing is needed to ensure all edge cases are handled.

## Installation

Follow the same installation steps as the main branch.

## Usage

Switch to this branch:

```sh
git checkout feature/riverpod_v2
```

