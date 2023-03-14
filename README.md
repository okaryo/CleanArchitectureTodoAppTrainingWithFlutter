# Clean Architecture Todo App Training With Flutter

[![github pages](https://github.com/rodydavis/clean_architecture_todo_app/actions/workflows/main.yml/badge.svg)](https://github.com/rodydavis/clean_architecture_todo_app/actions/workflows/main.yml)
[![Test and Lint](https://github.com/rodydavis/clean_architecture_todo_app/actions/workflows/test-and-lint.yml/badge.svg)](https://github.com/rodydavis/clean_architecture_todo_app/actions/workflows/test-and-lint.yml)

Flutter + Clean Architecture + riverpod + drift!

[Online Demo](https://rodydavis.github.io/clean_architecture_todo_app/)!

## Motivation

Based on a [fork](https://github.com/okaryo/CleanArchitectureTodoAppTrainingWithFlutter) and updated for the latest version of Material 3, Riverpod and Drift.

## Architecture Diagram

```mermaid
flowchart TD
    VM[View Model]-->U(Use Case)
    MP[Mapper]-->MD[Model]
    subgraph Presentation
    V[View]-->VM(View Model)
    W[Widgets]-->V[View]
    end
    subgraph Domain
    UI(Use Case Impl)-->U[Use Case]
    U[Use Case]-->MD[Model]-->R[Repository]
    UI(Use Case Impl)-->R[Repository]
    end
    subgraph Data
    RI[Repository Impl]-->MP[Mapper]
    RI[Repository Impl]-->R[Repository]
    E(Entity)-->D[Database]
    DI[Database Impl]-->D[Database]
    RI[Repository Impl]-->E(Entity)
    end
```

## Features

- Riverpod
- Riverpod Generator (StreamNotifier/FutureNotifier)
- Drift (SQLite)
- Material 3
- Adaptive Layouts
- All 6 platforms supported
- Full text search
- SQL support
- Dart Code Generation

## Screenshots

![](/screenshots/desktop.png)
![](/screenshots/light.png)
![](/screenshots/dark.png)
