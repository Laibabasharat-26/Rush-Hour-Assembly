# 🚖 Rush Hour - Assembly Language Taxi Game

![Assembly](https://img.shields.io/badge/Assembly-x86-blue.svg)
![MASM](https://img.shields.io/badge/MASM-Irvine32-green.svg)

Rush Hour is an exciting console-based taxi simulation game built entirely in **x86 Assembly Language** using the **Irvine32 library**. Navigate through a dynamically rendered city grid, pick up passengers, dodge moving traffic, and race against time across three challenging game modes. With intelligent AI vehicles, fuel management, collision detection, and a comprehensive scoring system, this project showcases advanced low-level programming techniques including memory manipulation, procedural architecture, and real-time game logic—all implemented in pure Assembly for a Computer Organization and Assembly Language (COAL) course.

---

## 🎮 Game Overview

Take control of a taxi in a procedurally-rendered city and compete to deliver passengers while avoiding moving traffic, managing fuel, and racing against time. Choose your play style across three distinct game modes, each offering unique challenges and mechanics.

**Key Highlights:**
- Console-based graphics using ASCII art and ANSI colors
- Real-time collision detection and physics
- Dynamic difficulty scaling
- Bonus collection system
- Multiple game modes with different win conditions

---

## ✨ Features

### 🎯 Three Game Modes

1. **Career Mode**
   - Start with 3 lives and 100% fuel
   - Deliver 3 passengers to complete the mission
   - Moving cars increase speed after 2 deliveries
   - Collect fuel canisters to refill
   - Game over if lives or fuel reach zero

2. **Time Mode**
   - 30-second countdown timer
   - Race against the clock to deliver all passengers
   - Visual warning flash at 10 seconds remaining
   - Bonus time for quick completions

3. **Endless Mode**
   - Unlimited passenger spawns
   - No lives or fuel restrictions
   - Score bonus every 3 passengers delivered
   - Press 'G' to end and view final score

### 🚕 Taxi Selection

- **Yellow/Brown Taxi**: Fast speed (1x), ideal for time challenges
- **Red Taxi**: Slower speed (0.5x), better control in tight spaces

### 🗺️ Dynamic City Environment

- **Walls & Buildings**: Static maze-like structures
- **Trees**: Decorative obstacles with collision detection
- **Moving Cars**: 5 AI-controlled vehicles with vertical pathfinding
- **Passengers (PAS)**: Randomly spawned pickup locations
- **Destinations (DEST)**: Dynamic drop-off points
- **Bonus Items (KEY)**: Collectibles worth +10 points
- **Fuel Canisters (GAS)**: Refills fuel to 100% in Career Mode

### 🎲 Advanced Gameplay Mechanics

- **Intelligent Spawning**: Passengers and objects spawn with minimum distance checks
- **Collision System**: Separate handling for walls, trees, passengers, cars, and bonuses
- **Speed Progression**: Car speed increases as you deliver more passengers
- **Fuel Management**: Movement consumes fuel in Career Mode
- **Life System**: Collision with cars costs 1 life
- **Score Penalties**: Different penalties for wall hits (-5) and car crashes (-2 to -5 depending on taxi type)
- **Pause Function**: Press 'P' to pause/resume gameplay

---

## 🛠️ Technical Implementation

### Low-Level Programming Concepts

- **Direct Memory Manipulation**: Grid and entity data stored in byte arrays
- **Procedural Architecture**: Modular code with 40+ procedures
- **Video Memory Management**: Optimized console rendering using `Gotoxy` and color codes
- **Collision Detection**: Multiple algorithms for different object types
- **Random Number Generation**: `Randomize` and `RandomRange` for spawn locations
- **Timing System**: `GetMSeconds` for precise game timing and delays
- **Sound Integration**: `Beep` procedure for audio feedback

### Key Data Structures

```asm
; Game board boundaries
minx = 40, maxx = 105
miny = 8, maxy = 38

; Wall array (x, y, length, orientation)
wallrcla BYTE 40,8,70,0, ...  ; 25 wall segments

; Car array (x, y, minY, maxY, direction)
carrc BYTE 58,15,9,14,0, ...  ; 5 moving cars

; Passenger tracking
passrc BYTE 6 DUP(?)          ; Positions
passstate BYTE 3 DUP(0)       ; Status (0=waiting, 1=picked, 2=delivered)
destrc BYTE 6 DUP(?)          ; Destination coordinates
```

---

## 📋 Prerequisites

### Required Software
- **Visual Studio 2019/2022** (or any IDE supporting MASM)
- **MASM (Microsoft Macro Assembler)**
- **Irvine32 Library** ([Download here](http://www.asmirvine.com/))

### System Requirements
- Windows 7 or later
- x86 or x64 processor
- Console/Terminal with color support

---

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/rush-hour-game.git
cd rush-hour-game
```

### 2. Set Up Irvine32 Library

1. Download the Irvine32 library from [asmirvine.com](http://www.asmirvine.com/)
2. Extract the library files
3. In Visual Studio, go to **Project Properties** → **Configuration Properties** → **Linker** → **General**
4. Add the Irvine32 library path to **Additional Library Directories**
5. Under **Linker** → **Input** → **Additional Dependencies**, add: `Irvine32.lib`

### 3. Configure Include Path

1. Go to **Project Properties** → **Microsoft Macro Assembler** → **General**
2. Add the path to `Irvine32.inc` in **Include Paths**

### 4. Build and Run

1. Press **Ctrl+F5** or click **Start Without Debugging**
2. The game will launch in a console window

---

## 🎮 How to Play

### Main Menu Options

1. **Start New Game** - Begin a fresh game
2. **Continue Game** - Resume saved progress (if available)
3. **Change Difficulty** - Adjust game settings
4. **View Leaderboard** - See top scores
5. **Read Instructions** - In-game help guide

### Controls

| Key | Action |
|-----|--------|
| **W** | Move Up |
| **A** | Move Left |
| **S** | Move Down |
| **D** | Move Right |
| **SPACEBAR** | Pick Up / Drop Off Passenger |
| **P** | Pause/Resume Game |
| **G** | End Endless Mode |
| **ESC** | Exit to Main Menu |

### Gameplay Loop

1. Navigate to a yellow **PAS** (passenger)
2. Press **SPACEBAR** when adjacent to pick up
3. A green **DEST** marker appears - drive to it
4. Press **SPACEBAR** at the destination to drop off
5. Earn +10 points per delivery
6. Avoid moving cars, walls, and trees
7. Collect **KEY** bonuses (+10 points) and **GAS** canisters (refuel)

### Scoring System

- Passenger Delivery: **+10 points**
- Bonus Collection: **+10 points**
- Endless Mode Batch: **+20 points** (every 3 passengers)
- Wall Collision: **-5 points**
- Car Crash (Yellow Taxi): **-5 points**
- Car Crash (Red Taxi): **-2 points**

---

## 🎨 Game Elements

### Visual Guide

```
T       = Your Taxi
PAS     = Passenger (pickup)
DEST    = Destination (drop-off)
CAR     = Moving AI Vehicle
KEY     = Bonus Item
GAS     = Fuel Canister
2222    = Trees (obstacles)
####    = Walls (boundaries)
```

### Color Scheme

- **Yellow Background**: Main game area
- **Magenta Walls**: Solid boundaries
- **Green Trees**: Natural obstacles
- **Yellow Passengers**: Waiting pickups
- **Green Destinations**: Drop-off points
- **Cyan/Gray/Magenta Keys**: Bonus collectibles
- **Multicolor Cars**: AI traffic

---

## 🏆 Game Modes Comparison

| Feature | Career | Time | Endless |
|---------|--------|------|---------|
| **Lives** | 3 | ∞ | ∞ |
| **Fuel** | 100% (depletes) | ∞ | ∞ |
| **Time Limit** | None | 30s | None |
| **Passengers** | 3 (fixed) | 3 (fixed) | ∞ (respawn) |
| **Car Collisions** | -1 life | Passable | Passable |
| **Difficulty** | Increases | Static | Static |
| **Win Condition** | Deliver all | Deliver all before time | Manual end (G key) |

---

## 🧠 Advanced Strategies

### Tips for High Scores

1. **Plan Your Route**: Minimize backtracking between pickups and destinations
2. **Watch Car Patterns**: Moving cars follow predictable vertical paths
3. **Collect Bonuses Early**: Keys and fuel appear at fixed locations
4. **Taxi Choice Matters**: 
   - Yellow: Better for Time Mode speed runs
   - Red: Safer for Career Mode survival
5. **Fuel Management** (Career): Each movement consumes fuel every 4 steps
6. **Car Speed Awareness**: Traffic accelerates after 2 deliveries - stay alert!

---

## 📁 Project Structure

```
rush-hour-game/
│
├── main.asm                 # Main game file (entry point)
├── README.md                # This file
├── LICENSE                  # MIT License
│
├── docs/
│   ├── ARCHITECTURE.md      # Code structure documentation
│   └── GAMEPLAY.md          # Detailed gameplay guide
│
└── assets/
    └── screenshots/         # Game screenshots
```

---

## 🔧 Code Architecture

### Main Procedures

| Procedure | Purpose |
|-----------|---------|
| `menu` | Main menu rendering and navigation |
| `menu2` | Taxi selection and player setup |
| `gameinstruc` | Instructions screen display |
| `board` | Game board initialization |
| `wall` | Wall rendering with horizontal/vertical logic |
| `trees` | Tree obstacle rendering |
| `passengers` | Passenger spawn and display |
| `taxi` | Player taxi rendering |
| `cars` | AI car rendering |
| `carmovement` | AI pathfinding and movement |
| `gameplay` | Main game loop |
| `wallcollsion` | Wall collision detection |
| `treecollision` | Tree collision detection |
| `carcollision` | Car collision detection |
| `passpickup` | Passenger pickup logic |
| `passdrop` | Passenger delivery logic |
| `bonuscollection` | KEY bonus collection |
| `gascollection` | Fuel canister pickup |
| `gameover` | End screen and statistics |

---

## 🐛 Known Issues & Future Enhancements

### Current Limitations
- Fixed map layout (no procedural generation)
- Limited to 5 AI cars
- Console rendering may flicker on slower systems

### Planned Features
- [ ] Multiple map layouts
- [ ] Save/Load game state
- [ ] Leaderboard persistence
- [ ] More taxi types with unique abilities
- [ ] Power-ups (speed boost, invincibility)
- [ ] Traffic light system
- [ ] Weather effects

---

## 👥 Credits

**Developer:** Laiba Basharat
**Course:** Computer Organization and Assembly Language (COAL)  
**Instructor:** Sir Shahbaz Hassan  
**Lab Instructor:** Sir Umair Khalid  



---




## 📞 Contact

For questions, suggestions, or collaboration:
- **Email:** laibabasharat06@gmail.com
- **GitHub:** https://github.com/Laibabasharat-26

---


<div align="center">

**⭐ If you found this project interesting, please consider giving it a star! ⭐**

Made with ❤️ and x86 Assembly

</div>
