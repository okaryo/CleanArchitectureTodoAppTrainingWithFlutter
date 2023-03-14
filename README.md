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
    subgraph Presentation
    V[View]-->VM(View Model)
    W[Widgets]-->V[View]
    end
    subgraph Domain
    VM[View Model]-->U(Use Case)
    UI(Use Case Impl)-->U[Use Case]
    UI(Use Case Impl)-->MD[Model]
    UI(Use Case Impl)-->R[Repository]
    end
    subgraph Data
    RI[Repository Impl]-->MP[Mapper]
    RI[Repository Impl]-->R[Repository]
    RI[Repository Impl]-->D[Database]
    DI[Database Impl]-->D[Database]
    RI[Repository Impl]-->E[Entity]
    end
```

## Features

- Riverpod
- Drift (SQLite)
- Material 3
- Adaptive Layouts
- All 6 platforms supported

## Screenshots

![](/screenshots/desktop.png)
![](/screenshots/light.png)
![](/screenshots/dark.png)
