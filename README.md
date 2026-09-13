# MeowShell

A zero-dependency, resilient Lua CLI shell built with defensive programming patterns.

## Architecture & Features

- **Resilient UX:** Defensive `pcall` bindings to graceful fallbacks if terminal components are absent.
- **Zero-Dependency Deployment:** Vendored modules via Git Submodules avoiding system-level LuaRocks dependencies.
- **Session Authentication:** Built-in verification layer (`lock.lua`).
- **History Persistence:** Local command logging saved safely per session (`.meow_history`).

## Quick Start

```fish
git clone --recurse-submodules [https://github.com/USERNAME/MeowShell.git](https://github.com/USERNAME/MeowShell.git)
cd MeowShell
make
