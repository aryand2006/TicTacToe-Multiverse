# TicTacToe Multiverse

**Tactical. Intuitive. Cross-language. Technical. Adaptive. Comparative. Tooling. Oriented. Exploratory.**

TicTacToe Multiverse is a comprehensive programming project that implements the classic Tic-Tac-Toe game across multiple programming languages. Unlike traditional single-language projects, this collection showcases the same game logic expressed through different programming paradigms, syntaxes, and design approaches. It serves as both a learning tool and a comparative reference for language characteristics.

## Core Philosophy

TicTacToe Multiverse is built on three key principles:
- **Learning through implementation**: Gain hands-on experience with new languages
- **Consistent problem space**: Compare language features with a standardized challenge
- **Comprehensive understanding**: Master language mechanics through practical application

## Implementations

The project currently includes TicTacToe in the following languages:

### Python
- **Paradigm**: Imperative, object-oriented
- **Key Features**: Readability, dynamic typing, extensive standard library
- **Focus Areas**: Clean syntax, straightforward implementation

### Standard ML
- **Paradigm**: Functional, statically typed
- **Key Features**: Pattern matching, algebraic data types, strong type system
- **Focus Areas**: Functional state management, recursive game logic

### Swift
- **Paradigm**: Protocol-oriented, object-oriented
- **Key Features**: Type safety, optionals, value types, protocol extensions
- **Focus Areas**: Modern iOS/macOS development patterns, Swift idioms

### MATLAB/Octave
- **Paradigm**: Matrix-based, procedural
- **Key Features**: Matrix operations, scientific computing focus
- **Focus Areas**: Numerical computing approach, visualization potential

### Rust
- **Paradigm**: Systems-level, memory safety without GC
- **Key Features**: Ownership system, zero-cost abstractions, memory safety
- **Focus Areas**: Performance, safety, modern systems programming

### Java
- **Paradigm**: Object-oriented, platform-independent
- **Key Features**: Strong typing, class-based, portability
- **Focus Areas**: OOP principles, enterprise patterns in miniature

## Game Features

All implementations include core features:

- **Single Player Mode**:
  - Four difficulty levels: Easy, Medium, Hard, and Impossible
  - AI strategies ranging from random moves to unbeatable algorithms

- **Multiplayer Mode**:
  - Two-player functionality on the same device
  - Turn-based gameplay with clear indicators

- **User Interface**:
  - ANSI color-coded terminal interface
  - Clear grid representation
  - Intuitive position selection (1-9 keypad mapping)

- **AI Intelligence**:
  - Winning move detection
  - Blocking opponent's winning moves
  - Fork creation and prevention
  - Strategic corner and center play

## Implementation Insights

### Python Implementation
The Python version serves as the reference implementation with:
- Clean, readable code structure
- Well-commented sections for each AI strategy
- Effective use of global state for game variables

### Standard ML Implementation
The SML implementation demonstrates:
- Functional programming approach to game state
- Immutable data structures for board representation
- Pattern matching for move analysis
- Type-safe function composition

### Swift Implementation
The Swift version showcases:
- Protocol-oriented design
- Strong typing with optionals for safety
- Modern Swift idioms and patterns
- iOS/macOS development fundamentals

### MATLAB Implementation
The MATLAB code illustrates:
- Scientific computing approach to game logic
- Matrix-based state representation
- Procedural programming within MATLAB's environment
- Vectorized operations where applicable

### Rust Implementation
The Rust implementation highlights:
- Memory-safe systems programming
- Ownership and borrowing mechanics
- Error handling patterns
- Zero-cost abstractions for performance

### Java Implementation
The Java code demonstrates:
- Object-oriented design principles
- Class-based organization of game components
- Type safety and exception handling
- Platform independence

## What I Learned

Each implementation taught me different aspects of programming:

- **From Python**: Rapid prototyping and readable code structuring
- **From Standard ML**: Thinking functionally and leveraging pattern matching
- **From Swift**: Protocol-oriented design and type safety benefits
- **From MATLAB**: Matrix-based approach to problem solving
- **From Rust**: Memory safety without garbage collection
- **From Java**: Object-oriented design patterns and class architecture

## Language Comparison

| Feature | Python | SML | Swift | MATLAB | Rust | Java |
|---------|--------|-----|-------|--------|------|------|
| Paradigm | Multi-paradigm | Functional | Protocol-oriented | Matrix-based | Systems | Object-oriented |
| Typing | Dynamic | Static | Static | Dynamic | Static | Static |
| Memory Management | GC | GC | ARC | Managed | Ownership | GC |
| Conciseness | ★★★★★ | ★★★★☆ | ★★★★☆ | ★★★☆☆ | ★★★☆☆ | ★★☆☆☆ |
| Performance | ★★☆☆☆ | ★★★☆☆ | ★★★★☆ | ★★☆☆☆ | ★★★★★ | ★★★☆☆ |
| AI Implementation | ★★★★★ | ★★★★☆ | ★★★★★ | ★★★☆☆ | ★★★★☆ | ★★★★☆ |
| Learning Curve | ★★★★★ | ★★☆☆☆ | ★★★☆☆ | ★★★☆☆ | ★★☆☆☆ | ★★★★☆ |

## Getting Started

### Python
```bash
# Run the Python implementation
python tictactoe.py
```

### Standard ML
```bash
# Compile and run the SML implementation using SML/NJ
sml tictactoe.sml
```

### Swift
```bash
# Compile and run the Swift implementation
swift tictactoe.swift
```

### MATLAB/Octave
```bash
# Run in MATLAB
matlab -r "run('tictactoe.m')"

# Or in Octave
octave tictactoe.m
```

### Rust
```bash
# Compile and run the Rust implementation
rustc tictactoe.rs
./tictactoe
```

### Java
```bash
# Compile the Java implementation
javac tictactoe.java

# Run the compiled class
java tictactoe
```

## Implementation Notes

### AI Strategy
All implementations follow similar AI strategies:
1. **Win**: Complete three in a row if possible
2. **Block**: Block the opponent from winning
3. **Fork**: Create opportunities for two winning moves
4. **Block Fork**: Prevent opponent from creating forks
5. **Center**: Take the center if available
6. **Corner**: Take a corner position
7. **Side**: Take a side position

The "Impossible" difficulty implements the complete minimax algorithm with these strategies, making it unbeatable.

### Code Structure
Each implementation follows a similar structure:
1. Game state representation
2. Board display functions
3. Player input handling
4. AI move functions at different difficulty levels
5. Win detection logic
6. Main game loop

## What's Next

Future enhancements could include:

- **Additional Languages**:
  - Haskell: Pure functional implementation
  - C++: Performance-focused, template-based version
  - JavaScript: Web-based implementation with visual interface
  - Go: Concurrent implementation showcasing goroutines

- **Enhanced Features**:
  - Network multiplayer functionality
  - Graphical user interfaces for each implementation
  - Performance benchmarking across implementations
  - Self-learning AI with machine learning techniques

- **Educational Components**:
  - Detailed annotations explaining language-specific features
  - Comparative analysis documents
  - Interactive tutorials based on the implementations

## Contributing

Contributions are welcome! If you'd like to add an implementation in another language or enhance existing ones, please follow these steps:
1. Fork the repository
2. Create your feature branch
3. Implement the game following the established patterns
4. Ensure your code runs correctly
5. Submit a pull request

## License

TicTacToe Multiverse is released under the MIT License.
