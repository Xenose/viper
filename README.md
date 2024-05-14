
# The Viper Engine
The Viper engine is a game engine with some general functionality added to it,
it uses C 17, Fortran 95 and Lua for its core, maths and high level API.

## Goal
To learn and create a general purpose game engine.

# Operating System status

| Name    | Supported  | Version | Description                                    | URL                                                                              |
| ------- | ---------- | ------- | ---------------------------------------------- | -------------------------------------------------------------------------------- |
| BSD     | Maybe?     |         | A Unix operating family of Operating Systems   | [ Wikipedia ](https://en.wikipedia.org/wiki/Berkeley_Software_Distribution)      |
| Linux   | In Dev     | 6.7.2   | Open Source OS based on Unix                   | [ Kernal.org ](https://kernel.org/)                                              |
| MacOS   | Unlikely   |         | Closed source Unix                             | [ Wikipedia ](https://en.wikipedia.org/wiki/MacOS)                               |
| Windows | Far future |         | Biggest desktop OS on the market               | [ Wikipedia ](https://en.wikipedia.org/wiki/Microsoft_Windows)                   |

## Build Requirements

| Name    | Version | Description                                | URL                                                                   |
| ------- | ------- | ------------------------------------------ | --------------------------------------------------------------------- |
| C       | 17      | A very old progarming language             | [ Wikipedia ](https://en.wikipedia.org/wiki/C_(programming_language)) |
| Fortran | 95      | A even older programing language           | [ Wikipedia ](https://en.wikipedia.org/wiki/Fortran)                  |
| Lua     | 5.4.6   | A scripting language with C as its backend | [ lua.org ](https://www.lua.org/)                                     |
| CMake   |         | Cross compatible build system              |       |
| Make    |         | Non cross compatible build system          |       |
| OpenGL  |         | Graphics rendering library                 |       |
| GLFW    |         | Handles window creation for now            |       |
| GLEW    |         | Bindings for modern OpenGL                 |       |
| Vulkan  |         | Here for futhure use                       |       |


## Nice to have tools

| Name    | Version | Description                                       | URL   |
| ------- | ------- | ------------------------------------------------- | ----- |
| Python  | 3       | Scripting language used for non critical scripts  |       |
| Bash    |         | Used for some quality of life scripts             |       |
| Doxygen |         | Generates documentation form the source files     |       |

## Stats
The stats needs to manual update for now using the python script "./script/state_report.py",
state was choosen as its name beacuse of the current "stats state".

[](python-stats-start)

|  Language       | File Count | Lines of Code | Procentage |
| --------------- | ---------- | ------------- | ---------- |
| C               | 139        | 3766          | 89.71%     |
| CMake           | 3          | 106           | 2.53%      |
| Lua             | 5          | 73            | 1.74%      |
| Python          | 1          | 70            | 1.67%      |
| Markdown        | 2          | 55            | 1.31%      |
| Fortran 95      | 3          | 51            | 1.21%      |
| JSON            | 1          | 27            | 0.64%      |
| Bourne Shell    | 3          | 20            | 0.48%      |
| GLSL            | 2          | 13            | 0.31%      |
| C/C++ Header    | 1          | 10            | 0.24%      |
| Text            | 2          | 4             | 0.10%      |
| C++             | 1          | 3             | 0.07%      |
| Summary         | 163        | 4198          | 100.00%    |

[](python-stats-end)
