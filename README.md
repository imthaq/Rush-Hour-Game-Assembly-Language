# Rush-Hour-Game-Assembly-Language
x86 Assembly implementation of the classic Rush Hour puzzle using Irvine32.lib. Developed as a COAL course project, featuring custom vehicle movement, boundary checks, and console-based graphics.

# 🚖 Rush Hour - x86 Assembly Game

**Rush Hour** is a console-based taxi simulation game developed entirely in **x86 Assembly Language (MASM)** using the **Irvine32** library. This project was built for a Computer Organization and Assembly Language (COAL) course.

The player acts as a taxi driver navigating a busy city grid, picking up passengers, avoiding traffic and obstacles, and managing fuel/lives to achieve the highest score.

## 🎮 Game Features

* **Dynamic Graphics:** Custom ASCII art rendering for the city grid, buildings, obstacles, and vehicles.
* **Three Game Modes:**
    * **Career Mode:** Complete 5 deliveries with increasing difficulty.
    * **Time Mode:** Deliver as many passengers as possible in 60 seconds.
    * **Endless Mode:** Survive as long as possible without losing all lives.
* **Intelligent NPC Traffic:** Blue NPC cars roam the map randomly; players must avoid collisions.
* **Save & Load System:** Full game state serialization allowing players to save their progress and resume later (File I/O).
* **Leaderboard:** tracks the top 10 high scores using file handling.
* **Sound Effects:** Integrated `winmm.lib` for audio cues (pickup, crash, game over, etc.).
* **Taxi Selection:** Choose between a **Yellow Taxi** (Fast, high penalty) or **Red Taxi** (Slow, low penalty).

## 🛠️ Technical Implementation

This project demonstrates low-level programming concepts including:
* **Memory Management:** Direct addressing of arrays for the grid (`grid`), passengers, and NPC cars.
* **Procedures:** Modular code structure using `PROC` for rendering, logic updates, and file handling.
* **String Manipulation:** Custom string parsing for saving/loading game states.
* **Windows API:** Usage of `PlaySoundA` from `winmm.lib` for asynchronous audio.
* **Video Memory:** efficient console updating to minimize flickering.

## 📋 Prerequisites

To run or compile this project, you need:
1.  **Visual Studio** (2019 or 2022 recommended).
2.  **MASM** (Microsoft Macro Assembler) installed.
3.  **Irvine32 Library** configured in your project paths.

## 🚀 Getting Started

1.  Clone this repository.
2.  Open the solution in Visual Studio.
3.  Ensure the **Irvine32.inc** and **Irvine32.lib** paths are correctly set in Project Properties.
4.  Add `winmm.lib` to your **Additional Dependencies** in the Linker settings.
5.  **Important:** Ensure the following `.wav` files are in the same directory as the executable (or project folder):
    * `pickup.wav`, `drop.wav`, `crash.wav`, `bonus.wav`, `gameover.wav`, `horn.wav`, `engine.wav`, `warning.wav`, `levelup.wav`, `menu.wav`.
6.  Build and Run (Ctrl+F5).

## 🕹️ Controls

| Key | Action |
| :--- | :--- |
| **Arrow Keys** | Move Taxi (Up, Down, Left, Right) |
| **Spacebar** | Pick up passenger / Drop off passenger |
| **P** | Pause / Resume Game |
| **ESC** | Save Game & Return to Main Menu |

## 🚕 Game Mechanics

### The Taxis
* **Yellow Taxi:** Fast speed. High damage from obstacles (-4 pts) and cars (-2 pts).
* **Red Taxi:** Slower speed. Lower damage from obstacles (-2 pts) and cars (-3 pts).

### The Map
* **You (Taxi):** `O  O`
* **Passenger:** `>__<` (Pick these up!)
* **Destination:** `DEST` / `HERE` (Drop them here)
* **NPC Cars:** Blue `O  O` (Avoid these)
* **Obstacles:** Trees `(^)` and Buildings `----`
* **Bonus:** `$$$$` (Collect for extra points)

## 👥 Credits
Developed by *Imtishal Haq* for the COAL Course Project. Credits to Course Instructor *"Sir Shahbaz Hassan"* and Lab Instructor *"Sir Umair Khalid"*
