# 🚖 Rush Hour - Assembly Language Taxi Game

A fully-featured taxi simulation game written in x86 Assembly Language using the Irvine32 library. Developed as a Computer Organization and Assembly Language (COAL) course project, this game demonstrates low-level programming concepts through an engaging gameplay experience where players navigate a busy city grid, deliver passengers, avoid obstacles, and compete for high scores.

## 🎮 Game Overview
Take control of a taxi in a procedurally-rendered city and compete to deliver passengers while avoiding moving traffic, managing fuel, and racing against time. Choose your play style across three distinct game modes, each offering unique challenges and mechanics.
### Key Highlights:

Console-based graphics using ASCII art and ANSI colors
Real-time collision detection and physics
Dynamic difficulty scaling
Bonus collection system
Multiple game modes with different win conditions


## ✨ Features
### 🎯 Three Game Modes

#### Career Mode

Start with 3 lives and 100% fuel
Deliver 3 passengers to complete the mission
Moving cars increase speed after 2 deliveries
Collect fuel canisters to refill
Game over if lives or fuel reach zero


#### Time Mode

30-second countdown timer
Race against the clock to deliver all passengers
Visual warning flash at 10 seconds remaining
Bonus time for quick completions


#### Endless Mode

Unlimited passenger spawns
No lives or fuel restrictions
Score bonus every 3 passengers delivered
Press 'G' to end and view final score



## 🚕 Taxi Selection

Yellow/Brown Taxi: Fast speed (1x), ideal for time challenges
Red Taxi: Slower speed (0.5x), better control in tight spaces

### 🗺️ Dynamic City Environment

Walls & Buildings: Static maze-like structures
Trees: Decorative obstacles with collision detection
Moving Cars: 5 AI-controlled vehicles with vertical pathfinding
Passengers (PAS): Randomly spawned pickup locations
Destinations (DEST): Dynamic drop-off points
Bonus Items (KEY): Collectibles worth +10 points
Fuel Canisters (GAS): Refills fuel to 100% in Career Mode

### 🎲 Advanced Gameplay Mechanics

Intelligent Spawning: Passengers and objects spawn with minimum distance checks
Collision System: Separate handling for walls, trees, passengers, cars, and bonuses
Speed Progression: Car speed increases as you deliver more passengers
Fuel Management: Movement consumes fuel in Career Mode
Life System: Collision with cars costs 1 life
Score Penalties: Different penalties for wall hits (-5) and car crashes (-2 to -5 depending on taxi type)
Pause Function: Press 'P' to pause/resume gameplay


### 🛠️ Technical Implementation
#### Low-Level Programming Concepts

Direct Memory Manipulation: Grid and entity data stored in byte arrays
Procedural Architecture: Modular code with 40+ procedures
Video Memory Management: Optimized console rendering using Gotoxy and color codes
Collision Detection: Multiple algorithms for different object types
Random Number Generation: Randomize and RandomRange for spawn locations
Timing System: GetMSeconds for precise game timing and delays
Sound Integration: Beep procedure for audio feedback
