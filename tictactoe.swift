import Foundation

// MARK: - Game state variables
var a1 = " ", a2 = " ", a3 = " "
var b1 = " ", b2 = " ", b3 = " "
var c1 = " ", c2 = " ", c3 = " "
var avpos = [1, 2, 3, 4, 5, 6, 7, 8, 9]
var af = false
var nb = false
var bm = false
var moved = false
var end_game = false
var p1 = ""
var p2 = ""

// MARK: - ANSI color codes
let RESET = "\u{001B}[0m"
let GREEN = "\u{001B}[32m"
let RED = "\u{001B}[31m"
let BLUE = "\u{001B}[34m"
let CYAN = "\u{001B}[36m"
let YELLOW = "\u{001B}[33m"
let BOLD = "\u{001B}[1m"
let ITALIC = "\u{001B}[3m"

// MARK: - Custom Functions
// Function to print the grid after each turn
func grid() {
    print(BLUE)
    print("\(a1) | \(a2) | \(a3)")
    print("——————————")
    print("\(b1) | \(b2) | \(b3)")
    print("——————————")
    print("\(c1) | \(c2) | \(c3)")
    print(RESET)
}

// Function to enter a position and parse it
func enter_pos(mark: String, pos: Int) {
    switch pos {
    case 1:
        a1 = mark
        avpos.removeAll(where: { $0 == 1 })
        grid()
    case 2:
        a2 = mark
        avpos.removeAll(where: { $0 == 2 })
        grid()
    case 3:
        a3 = mark
        avpos.removeAll(where: { $0 == 3 })
        grid()
    case 4:
        b1 = mark
        avpos.removeAll(where: { $0 == 4 })
        grid()
    case 5:
        b2 = mark
        avpos.removeAll(where: { $0 == 5 })
        grid()
    case 6:
        b3 = mark
        avpos.removeAll(where: { $0 == 6 })
        grid()
    case 7:
        c1 = mark
        avpos.removeAll(where: { $0 == 7 })
        grid()
    case 8:
        c2 = mark
        avpos.removeAll(where: { $0 == 8 })
        grid()
    case 9:
        c3 = mark
        avpos.removeAll(where: { $0 == 9 })
        grid()
    default:
        break
    }
}

// Function to check if a player/engine won
func check_win() -> String? {
    end_game = false
    print("")
    
    // Horizontal Win (X)
    if a1 == "X" && a2 == "X" && a3 == "X" {
        print("\(GREEN)RESULT: \(p1) won the game!\(RESET)")
        end_game = true
    }
    if b1 == "X" && b2 == "X" && b3 == "X" {
        print("\(GREEN)RESULT: \(p1) won the game!\(RESET)")
        end_game = true
    }
    if c1 == "X" && c2 == "X" && c3 == "X" {
        print("\(GREEN)RESULT: \(p1) won the game!\(RESET)")
        end_game = true
    }
    
    // Vertical Win (X)
    if a1 == "X" && b1 == "X" && c1 == "X" {
        print("\(GREEN)RESULT: \(p1) won the game!\(RESET)")
        end_game = true
    }
    if a2 == "X" && b2 == "X" && c2 == "X" {
        print("\(GREEN)RESULT: \(p1) won the game!\(RESET)")
        end_game = true
    }
    if a3 == "X" && b3 == "X" && c3 == "X" {
        print("\(GREEN)RESULT: \(p1) won the game!\(RESET)")
        end_game = true
    }
    
    // Diagonal Win (X)
    if a1 == "X" && b2 == "X" && c3 == "X" {
        print("\(GREEN)RESULT: \(p1) won the game!\(RESET)")
        end_game = true
    }
    if a3 == "X" && b2 == "X" && c1 == "X" {
        print("\(GREEN)RESULT: \(p1) won the game!\(RESET)")
        end_game = true
    }
    
    // Horizontal Win (O)
    if a1 == "O" && a2 == "O" && a3 == "O" {
        print("\(GREEN)RESULT: \(p2) won the game!\(RESET)")
        end_game = true
    }
    if b1 == "O" && b2 == "O" && b3 == "O" {
        print("\(GREEN)RESULT: \(p2) won the game!\(RESET)")
        end_game = true
    }
    if c1 == "O" && c2 == "O" && c3 == "O" {
        print("\(GREEN)RESULT: \(p2) won the game!\(RESET)")
        end_game = true
    }
    
    // Vertical Win (O)
    if a1 == "O" && b1 == "O" && c1 == "O" {
        print("\(GREEN)RESULT: \(p2) won the game!\(RESET)")
        end_game = true
    }
    if a2 == "O" && b2 == "O" && c2 == "O" {
        print("\(GREEN)RESULT: \(p2) won the game!\(RESET)")
        end_game = true
    }
    if a3 == "O" && b3 == "O" && c3 == "O" {
        print("\(GREEN)RESULT: \(p2) won the game!\(RESET)")
        end_game = true
    }
    
    // Diagonal Win (O)
    if a1 == "O" && b2 == "O" && c3 == "O" {
        print("\(GREEN)RESULT: \(p2) won the game!\(RESET)")
        end_game = true
    }
    if a3 == "O" && b2 == "O" && c1 == "O" {
        print("\(GREEN)RESULT: \(p2) won the game!\(RESET)")
        end_game = true
    }
    
    if end_game {
        return "break"
    }
    return nil
}

// Function for the Engine to block any potential wins
func block_win() -> Bool {
    nb = false
    
    if (a2 == "X" && a3 == "X") || (b1 == "X" && c1 == "X") || (b2 == "X" && c3 == "X") {
        if a1 != "O" && a1 != "X" {
            a1 = "O"
            avpos.removeAll(where: { $0 == 1 })
            print("Computer chose Position 1!")
            grid()
            nb = true
            return nb
        }
    }
    
    if (a1 == "X" && a3 == "X") || (b2 == "X" && c2 == "X") {
        if a2 != "O" && a2 != "X" {
            a2 = "O"
            avpos.removeAll(where: { $0 == 2 })
            print("Computer chose Position 2!")
            grid()
            nb = true
            return nb
        }
    }
    
    if (a1 == "X" && a2 == "X") || (b2 == "X" && c1 == "X") || (b3 == "X" && c3 == "X") {
        if a3 != "O" && a3 != "X" {
            a3 = "O"
            avpos.removeAll(where: { $0 == 3 })
            print("Computer chose Position 3!")
            grid()
            nb = true
            return nb
        }
    }
    
    if (a1 == "X" && c1 == "X") || (b2 == "X" && b3 == "X") {
        if b1 != "O" && b1 != "X" {
            b1 = "O"
            avpos.removeAll(where: { $0 == 4 })
            print("Computer chose Position 4!")
            grid()
            nb = true
            return nb
        }
    }
    
    if (a1 == "X" && c3 == "X") || (a2 == "X" && c2 == "X") || (a3 == "X" && c1 == "X") || (b3 == "X" && b1 == "X") {
        if b2 != "O" && b2 != "X" {
            b2 = "O"
            avpos.removeAll(where: { $0 == 5 })
            print("Computer chose Position 5!")
            grid()
            nb = true
            return nb
        }
    }
    
    if (a3 == "X" && c3 == "X") || (b1 == "X" && b2 == "X") {
        if b3 != "O" && b3 != "X" {
            b3 = "O"
            avpos.removeAll(where: { $0 == 6 })
            print("Computer chose Position 6!")
            grid()
            nb = true
            return nb
        }
    }
    
    if (a1 == "X" && b1 == "X") || (c2 == "X" && c3 == "X") || (a3 == "X" && b2 == "X") {
        if c1 != "O" && c1 != "X" {
            c1 = "O"
            avpos.removeAll(where: { $0 == 7 })
            print("Computer chose Position 7!")
            grid()
            nb = true
            return nb
        }
    }
    
    if (a2 == "X" && b2 == "X") || (c1 == "X" && c3 == "X") {
        if c2 != "O" && c2 != "X" {
            c2 = "O"
            avpos.removeAll(where: { $0 == 8 })
            print("Computer chose Position 8!")
            grid()
            nb = true
            return nb
        }
    }
    
    if (a3 == "X" && b3 == "X") || (a1 == "X" && b2 == "X") || (c1 == "X" && c2 == "X") {
        if c3 != "O" && c3 != "X" {
            c3 = "O"
            avpos.removeAll(where: { $0 == 9 })
            print("Computer chose Position 9!")
            grid()
            nb = true
            return nb
        }
    }
    
    return nb
}

// Function for the Engine to make a winning move
func win_move() -> Bool {
    moved = false
    
    if (a2 == "O" && a3 == "O") || (b1 == "O" && c1 == "O") || (b2 == "O" && c3 == "O") {
        if a1 != "X" && a1 != "O" {
            a1 = "O"
            avpos.removeAll(where: { $0 == 1 })
            print("Computer chose Position 1!")
            grid()
            moved = true
            return moved
        }
    }
    
    if (a1 == "O" && a3 == "O") || (b2 == "O" && c2 == "O") {
        if a2 != "X" && a2 != "O" {
            a2 = "O"
            avpos.removeAll(where: { $0 == 2 })
            print("Computer chose Position 2!")
            grid()
            moved = true
            return moved
        }
    }
    
    if (a1 == "O" && a2 == "O") || (b2 == "O" && c1 == "O") || (b3 == "O" && c3 == "O") {
        if a3 != "X" && a3 != "O" {
            a3 = "O"
            avpos.removeAll(where: { $0 == 3 })
            print("Computer chose Position 3!")
            grid()
            moved = true
            return moved
        }
    }
    
    if (a1 == "O" && c1 == "O") || (b2 == "O" && b3 == "O") {
        if b1 != "X" && b1 != "O" {
            b1 = "O"
            avpos.removeAll(where: { $0 == 4 })
            print("Computer chose Position 4!")
            grid()
            moved = true
            return moved
        }
    }
    
    if (a1 == "O" && c3 == "O") || (a2 == "O" && c2 == "O") || (a3 == "O" && c1 == "O") || (b3 == "O" && b1 == "O") {
        if b2 != "X" && b2 != "O" {
            b2 = "O"
            avpos.removeAll(where: { $0 == 5 })
            print("Computer chose Position 5!")
            grid()
            moved = true
            return moved
        }
    }
    
    if (a3 == "O" && c3 == "O") || (b1 == "O" && b2 == "O") {
        if b3 != "X" && b3 != "O" {
            b3 = "O"
            avpos.removeAll(where: { $0 == 6 })
            print("Computer chose Position 6!")
            grid()
            moved = true
            return moved
        }
    }
    
    if (a1 == "O" && b1 == "O") || (c2 == "O" && c3 == "O") || (a3 == "O" && b2 == "O") {
        if c1 != "X" && c1 != "O" {
            c1 = "O"
            avpos.removeAll(where: { $0 == 7 })
            print("Computer chose Position 7!")
            grid()
            moved = true
            return moved
        }
    }
    
    if (a2 == "O" && b2 == "O") || (c1 == "O" && c3 == "O") {
        if c2 != "X" && c2 != "O" {
            c2 = "O"
            avpos.removeAll(where: { $0 == 8 })
            print("Computer chose Position 8!")
            grid()
            moved = true
            return moved
        }
    }
    
    if (a3 == "O" && b3 == "O") || (a1 == "O" && b2 == "O") || (c1 == "O" && c2 == "O") {
        if c3 != "X" && c3 != "O" {
            c3 = "O"
            avpos.removeAll(where: { $0 == 9 })
            print("Computer chose Position 9!")
            grid()
            moved = true
            return moved
        }
    }
    
    return moved
}

// Function for making a random move
func best_move() -> Bool {
    bm = false
    
    if !nb && !moved {
        if !avpos.isEmpty {
            let ranpos = avpos.randomElement()!
            switch ranpos {
            case 1:
                a1 = "O"
                avpos.removeAll(where: { $0 == 1 })
                print("Computer chose Position \(ranpos)!")
                grid()
                bm = true
            case 2:
                a2 = "O"
                avpos.removeAll(where: { $0 == 2 })
                print("Computer chose Position \(ranpos)!")
                grid()
                bm = true
            case 3:
                a3 = "O"
                avpos.removeAll(where: { $0 == 3 })
                print("Computer chose Position \(ranpos)!")
                grid()
                bm = true
            case 4:
                b1 = "O"
                avpos.removeAll(where: { $0 == 4 })
                print("Computer chose Position \(ranpos)!")
                grid()
                bm = true
            case 5:
                b2 = "O"
                avpos.removeAll(where: { $0 == 5 })
                print("Computer chose Position \(ranpos)!")
                grid()
                bm = true
            case 6:
                b3 = "O"
                avpos.removeAll(where: { $0 == 6 })
                print("Computer chose Position \(ranpos)!")
                grid()
                bm = true
            case 7:
                c1 = "O"
                avpos.removeAll(where: { $0 == 7 })
                print("Computer chose Position \(ranpos)!")
                grid()
                bm = true
            case 8:
                c2 = "O"
                avpos.removeAll(where: { $0 == 8 })
                print("Computer chose Position \(ranpos)!")
                grid()
                bm = true
            case 9:
                c3 = "O"
                avpos.removeAll(where: { $0 == 9 })
                print("Computer chose Position \(ranpos)!")
                grid()
                bm = true
            default:
                break
            }
        }
    }
    
    return bm
}

// Function for countering forks
func anti_fork() -> Bool {
    af = false
    
    if b2 == "O" {
        // X-O-X series (diagonal, rotated)
        if a3 == "X" && c1 == "X" && b2 == "O" {
            let r = [2, 4, 6, 8]
            let rc = r.randomElement()!
            if rc == 2 {
                if a2 != "O" && a2 != "X" {
                    a2 = "O"
                    avpos.removeAll(where: { $0 == 2 })
                    print("Computer chose Position 2!")
                    grid()
                    af = true
                    return af
                }
            }
            if rc == 4 {
                if b1 != "O" && b1 != "X" {
                    b1 = "O"
                    avpos.removeAll(where: { $0 == 4 })
                    print("Computer chose Position 4!")
                    grid()
                    af = true
                    return af
                }
            }
            if rc == 6 {
                if b3 != "O" && b3 != "X" {
                    b3 = "O"
                    avpos.removeAll(where: { $0 == 6 })
                    print("Computer chose Position 6!")
                    grid()
                    af = true
                    return af
                }
            }
            if rc == 8 {
                if c2 != "O" && c2 != "X" {
                    c2 = "O"
                    avpos.removeAll(where: { $0 == 8 })
                    print("Computer chose Position 8!")
                    grid()
                    af = true
                    return af
                }
            }
        }
        
        if a1 == "X" && c3 == "X" && b2 == "O" {
            let r = [2, 4, 6, 8]
            let rc = r.randomElement()!
            if rc == 2 {
                if a2 != "O" && a2 != "X" {
                    a2 = "O"
                    avpos.removeAll(where: { $0 == 2 })
                    print("Computer chose Position 2!")
                    grid()
                    af = true
                    return af
                }
            }
            if rc == 4 {
                if b1 != "O" && b1 != "X" {
                    b1 = "O"
                    avpos.removeAll(where: { $0 == 4 })
                    print("Computer chose Position 4!")
                    grid()
                    af = true
                    return af
                }
            }
            if rc == 6 {
                if b3 != "O" && b3 != "X" {
                    b3 = "O"
                    avpos.removeAll(where: { $0 == 6 })
                    print("Computer chose Position 6!")
                    grid()
                    af = true
                    return af
                }
            }
            if rc == 8 {
                if c2 != "O" && c2 != "X" {
                    c2 = "O"
                    avpos.removeAll(where: { $0 == 8 })
                    print("Computer chose Position 8!")
                    grid()
                    af = true
                    return af
                }
            }
        }
        
        // X-O-X series (L-structure, rotated)
        if a2 == "X" && b1 == "X" && b2 == "O" {
            if a1 != "O" && a1 != "X" {
                a1 = "O"
                avpos.removeAll(where: { $0 == 1 })
                print("Computer chose Position 1!")
                grid()
                af = true
                return af
            }
        }
        
        if b1 == "X" && c2 == "X" && b2 == "O" {
            if c1 != "O" && c1 != "X" {
                c1 = "O"
                avpos.removeAll(where: { $0 == 7 })
                print("Computer chose Position 7!")
                grid()
                af = true
                return af
            }
        }
        
        if c2 == "X" && b3 == "X" && b2 == "O" {
            if c3 != "O" && c3 != "X" {
                c3 = "O"
                avpos.removeAll(where: { $0 == 9 })
                print("Computer chose Position 9!")
                grid()
                af = true
                return af
            }
        }
        
        if b2 == "O" && a2 == "X" && b3 == "X" {
            if a3 != "O" && a3 != "X" {
                a3 = "O"
                avpos.removeAll(where: { $0 == 3 })
                print("Computer chose Position 3!")
                grid()
                af = true
                return af
            }
        }
        
        // X-O-X series (angled upward, rotated)
        if b1 == "X" && a3 == "X" && b2 == "O" {
            if a1 != "O" && a1 != "X" {
                a1 = "O"
                avpos.removeAll(where: { $0 == 1 })
                print("Computer chose Position 1!")
                grid()
                af = true
                return af
            }
        }
        
        if a1 == "X" && c2 == "X" && b2 == "O" {
            if c1 != "O" && c1 != "X" {
                c1 = "O"
                avpos.removeAll(where: { $0 == 7 })
                print("Computer chose Position 7!")
                grid()
                af = true
                return af
            }
        }
        
        if c1 == "X" && b3 == "X" && b2 == "O" {
            if c3 != "O" && c3 != "X" {
                c3 = "O"
                avpos.removeAll(where: { $0 == 9 })
                print("Computer chose Position 9!")
                grid()
                af = true
                return af
            }
        }
        
        if c3 == "X" && a2 == "X" && b2 == "O" {
            if a3 != "O" && a3 != "X" {
                a3 = "O"
                avpos.removeAll(where: { $0 == 3 })
                print("Computer chose Position 3!")
                grid()
                af = true
                return af
            }
        }
        
        // X-O-X series (angled downward, rotated)
        if b1 == "X" && c3 == "X" && b2 == "O" {
            if c1 != "O" && c1 != "X" {
                c1 = "O"
                avpos.removeAll(where: { $0 == 7 })
                print("Computer chose Position 7!")
                grid()
                af = true
                return af
            }
        }
        
        if c2 == "X" && a3 == "X" && b2 == "O" {
            if c3 != "O" && c3 != "X" {
                c3 = "O"
                avpos.removeAll(where: { $0 == 9 })
                print("Computer chose Position 9!")
                grid()
                af = true
                return af
            }
        }
        
        if a1 == "X" && b3 == "X" && b2 == "O" {
            if a3 != "O" && a3 != "X" {
                a3 = "O"
                avpos.removeAll(where: { $0 == 3 })
                print("Computer chose Position 3!")
                grid()
                af = true
                return af
            }
        }
        
        if c1 == "X" && a2 == "X" && b2 == "O" {
            if a1 != "O" && a1 != "X" {
                a1 = "O"
                avpos.removeAll(where: { $0 == 1 })
                print("Computer chose Position 1!")
                grid()
                af = true
                return af
            }
        }
    }
    
    if b2 == "X" {
        // X-X-O series (vertical and horizontal, rotated)
        if b2 == "X" && a2 == "X" && c2 == "O" {
            let r = [7, 9]
            let c = r.randomElement()!
            if c == 7 {
                if c1 != "O" && c1 != "X" {
                    c1 = "O"
                    avpos.removeAll(where: { $0 == 7 })
                    print("Computer chose Position \(c)!")
                    grid()
                    af = true
                    return af
                }
            }
            if c == 9 {
                if c3 != "O" && c3 != "X" {
                    c3 = "O"
                    avpos.removeAll(where: { $0 == 9 })
                    print("Computer chose Position \(c)!")
                    grid()
                    af = true
                    return af
                }
            }
        }
        
        if b1 == "X" && b2 == "X" && b3 == "O" {
            let r = [3, 9]
            let c = r.randomElement()!
            if c == 3 {
                if a3 != "O" && a3 != "X" {
                    a3 = "O"
                    avpos.removeAll(where: { $0 == 3 })
                    print("Computer chose Position \(c)!")
                    grid()
                    af = true
                    return af
                }
            }
            if c == 9 {
                if c3 != "O" && c3 != "X" {
                    c3 = "O"
                    avpos.removeAll(where: { $0 == 9 })
                    print("Computer chose Position \(c)!")
                    grid()
                    af = true
                    return af
                }
            }
        }
        
        if b2 == "X" && c3 == "X" && a2 == "O" {
            let r = [1, 3]
            let c = r.randomElement()!
            if c == 1 {
                if a1 != "O" && a1 != "X" {
                    a1 = "O"
                    avpos.removeAll(where: { $0 == 1 })
                    print("Computer chose Position \(c)!")
                    grid()
                    af = true
                    return af
                }
            }
            if c == 3 {
                if a3 != "O" && a3 != "X" {
                    a3 = "O"
                    avpos.removeAll(where: { $0 == 3 })
                    print("Computer chose Position \(c)!")
                    grid()
                    af = true
                    return af
                }
            }
        }
        
        if b2 == "X" && b3 == "X" && b1 == "O" {
            let r = [1, 7]
            let c = r.randomElement()!
            if c == 1 {
                if a1 != "O" && a1 != "X" {
                    a1 = "O"
                    avpos.removeAll(where: { $0 == 1 })
                    print("Computer chose Position \(c)!")
                    grid()
                    af = true
                    return af
                }
            }
            if c == 7 {
                if c1 != "O" && c1 != "X" {
                    c1 = "O"
                    avpos.removeAll(where: { $0 == 7 })
                    print("Computer chose Position \(c)!")
                    grid()
                    af = true
                    return af
                }
            }
        }
        
        // X-X-O series (diagonal, rotated)
        if a3 == "X" && b2 == "X" && c1 == "O" {
            if a1 != "O" && a1 != "X" {
                a1 = "O"
                avpos.removeAll(where: { $0 == 1 })
                print("Computer chose Position 1!")
                grid()
                af = true
                return af
            }
        }
        
        if a1 == "X" && b2 == "X" && c3 == "O" {
            if a3 != "O" && a3 != "X" {
                a3 = "O"
                avpos.removeAll(where: { $0 == 3 })
                print("Computer chose Position 3!")
                grid()
                af = true
                return af
            }
        }
        
        if c1 == "X" && b2 == "X" && a3 == "O" {
            if c3 != "O" && c3 != "X" {
                c3 = "O"
                avpos.removeAll(where: { $0 == 9 })
                print("Computer chose Position 9!")
                grid()
                af = true
                return af
            }
        }
        
        if c3 == "X" && b2 == "X" && a1 == "O" {
            if c1 != "O" && c1 != "X" {
                c1 = "O"
                avpos.removeAll(where: { $0 == 7 })
                print("Computer chose Position 7!")
                grid()
                af = true
                return af
            }
        }
    }
    
    return af
}

// Helper function to read a valid integer input
func readValidInt(prompt: String, validValues: [Int]) -> Int {
    while true {
        print(prompt, terminator: "")
        if let input = readLine(), let value = Int(input) {
            if validValues.contains(value) {
                return value
            } else {
                print("\(RED)Error: That position is already invalid/occupied, please retry!\(RESET)\n")
            }
        } else {
            print("\(RED)Error: Please retry with a valid numeric value!\(RESET)\n")
        }
    }
}

// MARK: - Main Game
// Print Introduction
print("\(GREEN)Welcome to the Tic Tac Toe game!\n\n")
print("\(BLUE)Please use the following guide for positions to mark on your turn!")
print("1 | 2 | 3")
print("——————————")
print("4 | 5 | 6")
print("——————————")
print("7 | 8 | 9\(RESET)\n")

// Choose Game Mode
var mode = ""
while mode.isEmpty {
    print("\(BLUE)Would you like to (S) play single-player versus a Computer, or (D) play a one-versus-one with another player (Enter 'S' or 'D' only): ", terminator: "")
    if let input = readLine() {
        let choice = input.uppercased()
        if choice == "S" {
            mode = "S"
            var hard = ""
            while hard.isEmpty {
                print("Would like the difficulty of the Computer to be (E) Easy, (M) Medium, (H) Hard, or (I) Impossible? (Enter 'E','M','H', or 'I' only): ", terminator: "")
                if let diffInput = readLine() {
                    let difficulty = diffInput.uppercased()
                    if ["E", "M", "H", "I"].contains(difficulty) {
                        hard = difficulty
                        print("\(RESET)", terminator: "")
                    } else {
                        print("\(RED)Error: Please enter only 'E','M','H', or 'I' as your input!\(RESET)\n\n")
                    }
                }
            }
        } else if choice == "D" {
            mode = "D"
        } else {
            print("\(RED)Error: Please enter only 'S' or 'D' as your input!\(RESET)\n\n")
        }
    }
}

print("")

// SINGLE PLAYER MODE
if mode == "S" {
    // IMPOSSIBLE DIFFICULTY
    if hard == "I" {
        print("\(BOLD)\(YELLOW)COMPUTER:\(RESET) \(ITALIC)Ah, so you have decided to challenge me? Let's do this.\(RESET)")
        print(" ")
        print("Enter name of Player 1 (playing X) here: ", terminator: "")
        p1 = readLine() ?? "Player 1"
        p2 = "Computer"
        grid()
        
        // Player Turn 1
        var pos = readValidInt(prompt: "Your turn, \(p1), enter a position \(CYAN)(out of \(avpos))\(RESET) to mark X: ", validValues: avpos)
        enter_pos(mark: "X", pos: pos)
        print("")
        
        // Engine Turn 1
        print("Computer's turn, entering a position \(CYAN)(out of \(avpos))\(RESET) to mark O.")
        
        if [1, 2, 3, 4, 6, 7, 8, 9].contains(pos) {
            // Player chose a non-center value
            print("Computer chose Position 5!")
            b2 = "O"
            avpos.removeAll(where: { $0 == 5 })
            grid()
        } else if pos == 5 {
            // If Player chose center
            let corner = [1, 3, 7, 9].randomElement()!
            enter_pos(mark: "O", pos: corner)
        }
        
        print(" ")
        
        // Loop for Turn 2 Onwards
        while !end_game {
            // Player Turn 2 onwards
            pos = readValidInt(prompt: "Your turn, \(p1), enter a position \(CYAN)(out of \(avpos))\(RESET) to mark X: ", validValues: avpos)
            enter_pos(mark: "X", pos: pos)
            
            // Checking For Potential Wins after a turn
            if let res = check_win() {
                if res == "break" {
                    print("\n\(BOLD)\(YELLOW)COMPUTER:\(RESET) \(ITALIC)At least you tried, \(p1), but you were warned.\(RESET)")
                    break
                }
            }
            
            if avpos.isEmpty {
                print("\(BOLD)\(YELLOW)COMPUTER:\(RESET) \(ITALIC)While it may seem like it, we aren't equal, \(p1). Try again.\(RESET)\n")
                print("\(GREEN)RESULT: The game was a draw!\(RESET)")
                break
            }
            
            // AI Turn 2 Onwards
            if !end_game {
                print("Computer's turn, entering a position \(CYAN)(out of \(avpos))\(RESET) to mark O.")
                
                let w = win_move() // Trying to find a winning move
                if !w {
                    let b = block_win() // Blocking immediate threats
                    if !b {
                        let a = anti_fork() // Blocking tactical moves with counter-tactics
                        if !a {
                            let _ = best_move() // Random move if nothing else works
                        }
                    }
                }
                
                // Checking For Potential Wins after a turn
                if let res = check_win() {
                    if res == "break" {
                        print("\n\(BOLD)\(YELLOW)COMPUTER:\(RESET) \(ITALIC)At least you tried, \(p1), but you were warned.\(RESET)")
                        break
                    }
                }
                
                if avpos.isEmpty {
                    print("\(BOLD)\(YELLOW)COMPUTER:\(RESET) \(ITALIC)While it may seem like it, we aren't equal, \(p1). Try again.\(RESET)\n")
                    print("\(GREEN)RESULT: The game was a draw!\(RESET)")
                    break
                }
            } else {
                break
            }
        }
    }
    
    // HARD DIFFICULTY
    if hard == "H" {
        print("Enter name of Player 1 (playing X) here: ", terminator: "")
        p1 = readLine() ?? "Player 1"
        p2 = "Computer"
        grid()
        
        // Player Turn 1
        var pos = readValidInt(prompt: "Your turn, \(p1), enter a position \(CYAN)(out of \(avpos))\(RESET) to mark X: ", validValues: avpos)
        enter_pos(mark: "X", pos: pos)
        print("")
        
        // Engine Turn 1
        print("Computer's turn, entering a position \(CYAN)(out of \(avpos))\(RESET) to mark O.")
        if [1, 2, 3, 4, 6, 7, 8, 9].contains(pos) {
            // Player chose a non-center value
            print("Computer chose Position 5!")
            b2 = "O"
            avpos.removeAll(where: { $0 == 5 })
            grid()
        } else if pos == 5 {
            // If Player chose center
            let cpos = avpos.randomElement()!
            enter_pos(mark: "O", pos: cpos)
        }
        
        print(" ")
        
        // Loop For Turn 2 Onwards
        while !end_game {
            // Player Turn 2 onwards
            pos = readValidInt(prompt: "Your turn, \(p1), enter a position \(CYAN)(out of \(avpos))\(RESET) to mark X: ", validValues: avpos)
            enter_pos(mark: "X", pos: pos)
            
            // Checking For Potential Wins after a turn
            if let res = check_win() {
                if res == "break" {
                    break
                }
            }
            
            if avpos.isEmpty {
                print("\(GREEN)RESULT: The game was a draw!\(RESET)")
                break
            }
            
            // Engine Turn 2 onwards
            if !end_game {
                print("Computer's turn, entering a position \(CYAN)(out of \(avpos))\(RESET) to mark O.")
                let w = win_move() // Trying to find a winning move
                if !w {
                    let b = block_win() // Blocking immediate threats
                    if !b {
                        let _ = best_move() // Random move
                    }
                }
                
                // Checking For Potential Wins after a turn
                if let res = check_win() {
                    if res == "break" {
                        break
                    }
                }
                
                if avpos.isEmpty {
                    print("\(GREEN)RESULT: The game was a draw!\(RESET)")
                    break
                }
            } else {
                break
            }
        }
    }
    
    // MEDIUM DIFFICULTY
    if hard == "M" {
        print("Enter name of Player 1 (playing X) here: ", terminator: "")
        p1 = readLine() ?? "Player 1"
        p2 = "Computer"
        grid()
        
        while !end_game {
            // Player Turn Loop
            let pos = readValidInt(prompt: "Your turn, \(p1), enter a position \(CYAN)(out of \(avpos))\(RESET) to mark X: ", validValues: avpos)
            enter_pos(mark: "X", pos: pos)
            
            // Checking For Potential Wins after a turn
            if let res = check_win() {
                if res == "break" {
                    break
                }
            }
            
            if avpos.isEmpty {
                print("\(GREEN)RESULT: The game was a draw!\(RESET)")
                break
            }
            
            // Computer Turn
            print("Computer's turn, entering a position \(CYAN)(out of \(avpos))\(RESET) to mark O.")
            let b = block_win() // Blocking immediate threats
            if !b {
                let _ = best_move() // Just randomising, if unable to block. Loss likely.
            }
            
            // Checking For Potential Wins after a turn
            if let res = check_win() {
                if res == "break" {
                    break
                }
            }
            
            if avpos.isEmpty {
                print("\(GREEN)RESULT: The game was a draw!\(RESET)")
                break
            }
        }
    }
    
    // EASY DIFFICULTY
    if hard == "E" {
        print("Enter name of Player 1 (playing X) here: ", terminator: "")
        p1 = readLine() ?? "Player 1"
        p2 = "Computer"
        grid()
        
        while !end_game {
            // Player Turn Loop
            let pos = readValidInt(prompt: "Your turn, \(p1), enter a position \(CYAN)(out of \(avpos))\(RESET) to mark X: ", validValues: avpos)
            enter_pos(mark: "X", pos: pos)
            
            // Checking For Potential Wins after a turn
            if let res = check_win() {
                if res == "break" {
                    break
                }
            }
            
            if avpos.isEmpty {
                print("\(GREEN)RESULT: The game was a draw!\(RESET)")
                break
            }
            
            // Computer Turn
            print("Computer's turn, entering a position \(CYAN)(out of \(avpos))\(RESET) to mark O.")
            let _ = best_move() // Completely random moves, Computer should lose in almost all cases
            
            // Checking For Potential Wins after a turn
            if let res = check_win() {
                if res == "break" {
                    break
                }
            }
            
            if avpos.isEmpty {
                print("\(GREEN)RESULT: The game was a draw!\(RESET)")
                break
            }
        }
    }
}

// MULTIPLAYER MODE
if mode == "D" {
    print(" ")
    print("Enter name of Player 1 (playing X) here: ", terminator: "")
    p1 = readLine() ?? "Player 1"
    print("Enter name of Player 2 (playing O) here: ", terminator: "")
    p2 = readLine() ?? "Player 2"
    grid()
    
    while !end_game {
        // Player 1's Turn
        let pos1 = readValidInt(prompt: "Your turn, \(p1), enter a position (out of \(avpos)) to mark X: ", validValues: avpos)
        enter_pos(mark: "X", pos: pos1)
        
        // Checking For Potential Wins after a turn
        if let res = check_win() {
            if res == "break" {
                break
            }
        }
        
        if avpos.isEmpty {
            print("\(GREEN)RESULT: The game was a draw!\(RESET)")
            break
        }
        
        // Player 2's Turn
        let pos2 = readValidInt(prompt: "Your turn, \(p2), enter a position (out of \(avpos)) to mark O: ", validValues: avpos)
        enter_pos(mark: "O", pos: pos2)
        
        // Checking For Potential Wins after a turn
        if let res = check_win() {
            if res == "break" {
                break
            }
        }
        
        if avpos.isEmpty {
            print("\(GREEN)RESULT: The game was a draw!\(RESET)")
            break
        }
    }
}
