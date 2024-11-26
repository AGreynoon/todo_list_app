# Todo List App
### A Flutter app for organizing your Todo list with a simple UI design.

## Table of contents
* [General info](#general-info)
* [Features](#features)
* [Design info](#design-info)
* [Installation](#installation)
* [Usage](#usage)
* [Next Steps](#next-steps)

## General info
This is my first Flutter project, which I fully built without any help from any tutorial!!

At this point, I'm implementing everything I have learned in this journey. 

## Features
* **Add Tasks:** Create tasks with a title and description.
* **Edit Tasks:** Update task details with an easy-to-use form.
* **Mark Tasks as Completed:** Organize tasks by marking them as done.
* **Delete Tasks:** Remove tasks when they are no longer needed.
* **Simple UI Design:** A clean and intuitive interface.
* **Screens:** Includes a Home page, Add Task page, Edit Task page, and Completed Tasks page.

## Design info
I found this free simple design in Figma community ![LOW CODE TODO LIST APP AESTHETIC](https://www.figma.com/community/file/1301223631360583764) via **gorogurax**, then I have implemented it using Flutter framework.

<img src="https://github.com/AGreynoon/todo_list_app/blob/main/screenshots/TODO_PAGE.png" width="250" height="500"/> <img src="https://github.com/AGreynoon/todo_list_app/blob/main/screenshots/ADD_TODO.png" width="250" height="500"/>
<img src="https://github.com/AGreynoon/todo_list_app/blob/main/screenshots/EDIT_TODO.png" width="250" height="500"/> <img src="https://github.com/AGreynoon/todo_list_app/blob/main/screenshots/COMPLETED_TASK.png" width="250" height="500"/>

## Installation:
1. Clone this repository.
2. Ensure you have Flutter installed (https://docs.flutter.dev/get-started/install).
3. Run `flutter pub get` to install dependencies.

## Usage:
* Run `flutter run` to launch the app on your device or simulator.

## Next Steps
* **Optimizing State Management:** Transition from `StatefulWidget` to a scalable state management solution to `Provider` and then to `Riverpood`.
* **Adding Notes Feature:** Introduce a separate notes feature with its own page, independent of tasks.
* **Persistent Storage:** Use a storage solution like `Hive`, `SharedPreferences`, or `SQLite` to save notes and tasks even after closing the app.
* **UI Enhancements:** Improve the design by adding animations, splash screens, and better widget arrangements for a more interactive experience.
* **Organizing and Searching:** Add functionality to search and categorize tasks and notes for better organization and usability.
