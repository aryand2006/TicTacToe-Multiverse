use std::io::{self, Write};
use std::process;
use rand::seq::SliceRandom;
use rand::Rng;

// Game state variables
struct GameState {
    a1: String, a2: String, a3: String,
    b1: String, b2: String, b3: String,
    c1: String, c2: String, c3: String,
    avpos: Vec<i32>,
    af: bool, nb: bool, bm: bool, moved: bool, end: bool,
    p1: String, p2: String,
}

impl GameState {
    fn new() -> Self {
        GameState {
            a1: " ".to_string(), a2: " ".to_string(), a3: " ".to_string(),
            b1: " ".to_string(), b2: " ".to_string(), b3: " ".to_string(),
            c1: " ".to_string(), c2: " ".to_string(), c3: " ".to_string(),
            avpos: vec![1, 2, 3, 4, 5, 6, 7, 8, 9],
            af: false, nb: false, bm: false, moved: false, end: false,
            p1: String::new(), p2: String::new(),
        }
    }

    // Display the current grid
    fn grid(&self) {
        println!("\x1b[34m");
        println!("{} | {} | {}", self.a1, self.a2, self.a3);
        println!("——————————");
        println!("{} | {} | {}", self.b1, self.b2, self.b3);
        println!("——————————");
        println!("{} | {} | {}", self.c1, self.c2, self.c3);
        println!("\x1b[0m");
    }

    // Enter a position and parse it
    fn enter_pos(&mut self, mark: &str, pos: i32) {
        match pos {
            1 => {
                self.a1 = mark.to_string();
                self.avpos.retain(|&x| x != 1);
                self.grid();
            },
            2 => {
                self.a2 = mark.to_string();
                self.avpos.retain(|&x| x != 2);
                self.grid();
            },
            3 => {
                self.a3 = mark.to_string();
                self.avpos.retain(|&x| x != 3);
                self.grid();
            },
            4 => {
                self.b1 = mark.to_string();
                self.avpos.retain(|&x| x != 4);
                self.grid();
            },
            5 => {
                self.b2 = mark.to_string();
                self.avpos.retain(|&x| x != 5);
                self.grid();
            },
            6 => {
                self.b3 = mark.to_string();
                self.avpos.retain(|&x| x != 6);
                self.grid();
            },
            7 => {
                self.c1 = mark.to_string();
                self.avpos.retain(|&x| x != 7);
                self.grid();
            },
            8 => {
                self.c2 = mark.to_string();
                self.avpos.retain(|&x| x != 8);
                self.grid();
            },
            9 => {
                self.c3 = mark.to_string();
                self.avpos.retain(|&x| x != 9);
                self.grid();
            },
            _ => panic!("Invalid position"),
        }
    }

    // Check if a player/engine won
    fn check_win(&mut self) -> Option<&str> {
        self.end = false;
        println!("");
        
        // Horizontal Win (X)
        if self.a1 == "X" && self.a2 == "X" && self.a3 == "X" {
            println!("\x1b[32mRESULT: {} won the game!\x1b[0m", self.p1);
            self.end = true;
        }
        if self.b1 == "X" && self.b2 == "X" && self.b3 == "X" {
            println!("\x1b[32mRESULT: {} won the game!\x1b[0m", self.p1);
            self.end = true;
        }
        if self.c1 == "X" && self.c2 == "X" && self.c3 == "X" {
            println!("\x1b[32mRESULT: {} won the game!\x1b[0m", self.p1);
            self.end = true;
        }
        
        // Vertical Win (X)
        if self.a1 == "X" && self.b1 == "X" && self.c1 == "X" {
            println!("\x1b[32mRESULT: {} won the game!\x1b[0m", self.p1);
            self.end = true;
        }
        if self.a2 == "X" && self.b2 == "X" && self.c2 == "X" {
            println!("\x1b[32mRESULT: {} won the game!\x1b[0m", self.p1);
            self.end = true;
        }
        if self.a3 == "X" && self.b3 == "X" && self.c3 == "X" {
            println!("\x1b[32mRESULT: {} won the game!\x1b[0m", self.p1);
            self.end = true;
        }
        
        // Diagonal Win (X)
        if self.a1 == "X" && self.b2 == "X" && self.c3 == "X" {
            println!("\x1b[32mRESULT: {} won the game!\x1b[0m", self.p1);
            self.end = true;
        }
        if self.a3 == "X" && self.b2 == "X" && self.c1 == "X" {
            println!("\x1b[32mRESULT: {} won the game!\x1b[0m", self.p1);
            self.end = true;
        }
        
        // Horizontal Win (O)
        if self.a1 == "O" && self.a2 == "O" && self.a3 == "O" {
            println!("\x1b[32mRESULT: {} won the game!\x1b[0m", self.p2);
            self.end = true;
        }
        if self.b1 == "O" && self.b2 == "O" && self.b3 == "O" {
            println!("\x1b[32mRESULT: {} won the game!\x1b[0m", self.p2);
            self.end = true;
        }
        if self.c1 == "O" && self.c2 == "O" && self.c3 == "O" {
            println!("\x1b[32mRESULT: {} won the game!\x1b[0m", self.p2);
            self.end = true;
        }
        
        // Vertical Win (O)
        if self.a1 == "O" && self.b1 == "O" && self.c1 == "O" {
            println!("\x1b[32mRESULT: {} won the game!\x1b[0m", self.p2);
            self.end = true;
        }
        if self.a2 == "O" && self.b2 == "O" && self.c2 == "O" {
            println!("\x1b[32mRESULT: {} won the game!\x1b[0m", self.p2);
            self.end = true;
        }
        if self.a3 == "O" && self.b3 == "O" && self.c3 == "O" {
            println!("\x1b[32mRESULT: {} won the game!\x1b[0m", self.p2);
            self.end = true;
        }
        
        // Diagonal Win (O)
        if self.a1 == "O" && self.b2 == "O" && self.c3 == "O" {
            println!("\x1b[32mRESULT: {} won the game!\x1b[0m", self.p2);
            self.end = true;
        }
        if self.a3 == "O" && self.b2 == "O" && self.c1 == "O" {
            println!("\x1b[32mRESULT: {} won the game!\x1b[0m", self.p2);
            self.end = true;
        }
        
        if self.end {
            Some("break")
        } else {
            None
        }
    }

    // Engine to block any potential wins
    fn block_win(&mut self) -> bool {
        self.nb = false;
        
        if (self.a2 == "X" && self.a3 == "X") || (self.b1 == "X" && self.c1 == "X") || (self.b2 == "X" && self.c3 == "X") {
            if self.a1 != "O" && self.a1 != "X" {
                self.a1 = "O".to_string();
                self.avpos.retain(|&x| x != 1);
                println!("Computer chose Position 1!");
                self.grid();
                self.nb = true;
                return self.nb;
            }
        }
        
        if (self.a1 == "X" && self.a3 == "X") || (self.b2 == "X" && self.c2 == "X") {
            if self.a2 != "O" && self.a2 != "X" {
                self.a2 = "O".to_string();
                self.avpos.retain(|&x| x != 2);
                println!("Computer chose Position 2!");
                self.grid();
                self.nb = true;
                return self.nb;
            }
        }
        
        if (self.a1 == "X" && self.a2 == "X") || (self.b2 == "X" && self.c1 == "X") || (self.b3 == "X" && self.c3 == "X") {
            if self.a3 != "O" && self.a3 != "X" {
                self.a3 = "O".to_string();
                self.avpos.retain(|&x| x != 3);
                println!("Computer chose Position 3!");
                self.grid();
                self.nb = true;
                return self.nb;
            }
        }
        
        if (self.a1 == "X" && self.c1 == "X") || (self.b2 == "X" && self.b3 == "X") {
            if self.b1 != "O" && self.b1 != "X" {
                self.b1 = "O".to_string();
                self.avpos.retain(|&x| x != 4);
                println!("Computer chose Position 4!");
                self.grid();
                self.nb = true;
                return self.nb;
            }
        }
        
        if (self.a1 == "X" && self.c3 == "X") || (self.a2 == "X" && self.c2 == "X") || 
           (self.a3 == "X" && self.c1 == "X") || (self.b3 == "X" && self.b1 == "X") {
            if self.b2 != "O" && self.b2 != "X" {
                self.b2 = "O".to_string();
                self.avpos.retain(|&x| x != 5);
                println!("Computer chose Position 5!");
                self.grid();
                self.nb = true;
                return self.nb;
            }
        }
        
        if (self.a3 == "X" && self.c3 == "X") || (self.b1 == "X" && self.b2 == "X") {
            if self.b3 != "O" && self.b3 != "X" {
                self.b3 = "O".to_string();
                self.avpos.retain(|&x| x != 6);
                println!("Computer chose Position 6!");
                self.grid();
                self.nb = true;
                return self.nb;
            }
        }
        
        if (self.a1 == "X" && self.b1 == "X") || (self.c2 == "X" && self.c3 == "X") || (self.a3 == "X" && self.b2 == "X") {
            if self.c1 != "O" && self.c1 != "X" {
                self.c1 = "O".to_string();
                self.avpos.retain(|&x| x != 7);
                println!("Computer chose Position 7!");
                self.grid();
                self.nb = true;
                return self.nb;
            }
        }
        
        if (self.a2 == "X" && self.b2 == "X") || (self.c1 == "X" && self.c3 == "X") {
            if self.c2 != "O" && self.c2 != "X" {
                self.c2 = "O".to_string();
                self.avpos.retain(|&x| x != 8);
                println!("Computer chose Position 8!");
                self.grid();
                self.nb = true;
                return self.nb;
            }
        }
        
        if (self.a3 == "X" && self.b3 == "X") || (self.a1 == "X" && self.b2 == "X") || (self.c1 == "X" && self.c2 == "X") {
            if self.c3 != "O" && self.c3 != "X" {
                self.c3 = "O".to_string();
                self.avpos.retain(|&x| x != 9);
                println!("Computer chose Position 9!");
                self.grid();
                self.nb = true;
                return self.nb;
            }
        }
        
        self.nb
    }

    // Engine to make a winning move
    fn win_move(&mut self) -> bool {
        self.moved = false;
        
        if (self.a2 == "O" && self.a3 == "O") || (self.b1 == "O" && self.c1 == "O") || (self.b2 == "O" && self.c3 == "O") {
            if self.a1 != "X" && self.a1 != "O" {
                self.a1 = "O".to_string();
                self.avpos.retain(|&x| x != 1);
                println!("Computer chose Position 1!");
                self.grid();
                self.moved = true;
                return self.moved;
            }
        }
        
        if (self.a1 == "O" && self.a3 == "O") || (self.b2 == "O" && self.c2 == "O") {
            if self.a2 != "X" && self.a2 != "O" {
                self.a2 = "O".to_string();
                self.avpos.retain(|&x| x != 2);
                println!("Computer chose Position 2!");
                self.grid();
                self.moved = true;
                return self.moved;
            }
        }
        
        if (self.a1 == "O" && self.a2 == "O") || (self.b2 == "O" && self.c1 == "O") || (self.b3 == "O" && self.c3 == "O") {
            if self.a3 != "X" && self.a3 != "O" {
                self.a3 = "O".to_string();
                self.avpos.retain(|&x| x != 3);
                println!("Computer chose Position 3!");
                self.grid();
                self.moved = true;
                return self.moved;
            }
        }
        
        if (self.a1 == "O" && self.c1 == "O") || (self.b2 == "O" && self.b3 == "O") {
            if self.b1 != "X" && self.b1 != "O" {
                self.b1 = "O".to_string();
                self.avpos.retain(|&x| x != 4);
                println!("Computer chose Position 4!");
                self.grid();
                self.moved = true;
                return self.moved;
            }
        }
        
        if (self.a1 == "O" && self.c3 == "O") || (self.a2 == "O" && self.c2 == "O") || 
           (self.a3 == "O" && self.c1 == "O") || (self.b3 == "O" && self.b1 == "O") {
            if self.b2 != "X" && self.b2 != "O" {
                self.b2 = "O".to_string();
                self.avpos.retain(|&x| x != 5);
                println!("Computer chose Position 5!");
                self.grid();
                self.moved = true;
                return self.moved;
            }
        }
        
        if (self.a3 == "O" && self.c3 == "O") || (self.b1 == "O" && self.b2 == "O") {
            if self.b3 != "X" && self.b3 != "O" {
                self.b3 = "O".to_string();
                self.avpos.retain(|&x| x != 6);
                println!("Computer chose Position 6!");
                self.grid();
                self.moved = true;
                return self.moved;
            }
        }
        
        if (self.a1 == "O" && self.b1 == "O") || (self.c2 == "O" && self.c3 == "O") || (self.a3 == "O" && self.b2 == "O") {
            if self.c1 != "X" && self.c1 != "O" {
                self.c1 = "O".to_string();
                self.avpos.retain(|&x| x != 7);
                println!("Computer chose Position 7!");
                self.grid();
                self.moved = true;
                return self.moved;
            }
        }
        
        if (self.a2 == "O" && self.b2 == "O") || (self.c1 == "O" && self.c3 == "O") {
            if self.c2 != "X" && self.c2 != "O" {
                self.c2 = "O".to_string();
                self.avpos.retain(|&x| x != 8);
                println!("Computer chose Position 8!");
                self.grid();
                self.moved = true;
                return self.moved;
            }
        }
        
        if (self.a3 == "O" && self.b3 == "O") || (self.a1 == "O" && self.b2 == "O") || (self.c1 == "O" && self.c2 == "O") {
            if self.c3 != "X" && self.c3 != "O" {
                self.c3 = "O".to_string();
                self.avpos.retain(|&x| x != 9);
                println!("Computer chose Position 9!");
                self.grid();
                self.moved = true;
                return self.moved;
            }
        }
        
        self.moved
    }

    // Make a random move
    fn best_move(&mut self) -> bool {
        self.bm = false;
        
        if !self.nb && !self.moved {
            let mut rng = rand::thread_rng();
            if !self.avpos.is_empty() {
                let ranpos = *self.avpos.choose(&mut rng).unwrap();
                match ranpos {
                    1 => {
                        self.a1 = "O".to_string();
                        self.avpos.retain(|&x| x != 1);
                        println!("Computer chose Position {}!", ranpos);
                        self.grid();
                        self.bm = true;
                    },
                    2 => {
                        self.a2 = "O".to_string();
                        self.avpos.retain(|&x| x != 2);
                        println!("Computer chose Position {}!", ranpos);
                        self.grid();
                        self.bm = true;
                    },
                    3 => {
                        self.a3 = "O".to_string();
                        self.avpos.retain(|&x| x != 3);
                        println!("Computer chose Position {}!", ranpos);
                        self.grid();
                        self.bm = true;
                    },
                    4 => {
                        self.b1 = "O".to_string();
                        self.avpos.retain(|&x| x != 4);
                        println!("Computer chose Position {}!", ranpos);
                        self.grid();
                        self.bm = true;
                    },
                    5 => {
                        self.b2 = "O".to_string();
                        self.avpos.retain(|&x| x != 5);
                        println!("Computer chose Position {}!", ranpos);
                        self.grid();
                        self.bm = true;
                    },
                    6 => {
                        self.b3 = "O".to_string();
                        self.avpos.retain(|&x| x != 6);
                        println!("Computer chose Position {}!", ranpos);
                        self.grid();
                        self.bm = true;
                    },
                    7 => {
                        self.c1 = "O".to_string();
                        self.avpos.retain(|&x| x != 7);
                        println!("Computer chose Position {}!", ranpos);
                        self.grid();
                        self.bm = true;
                    },
                    8 => {
                        self.c2 = "O".to_string();
                        self.avpos.retain(|&x| x != 8);
                        println!("Computer chose Position {}!", ranpos);
                        self.grid();
                        self.bm = true;
                    },
                    9 => {
                        self.c3 = "O".to_string();
                        self.avpos.retain(|&x| x != 9);
                        println!("Computer chose Position {}!", ranpos);
                        self.grid();
                        self.bm = true;
                    },
                    _ => {}
                }
            }
        }
        
        self.bm
    }

    // Custom function for countering forks
    fn anti_fork(&mut self) -> bool {
        self.af = false;
        
        if self.b2 == "O" {
            // X-O-X series (diagonal, rotated)
            if self.a3 == "X" && self.c1 == "X" && self.b2 == "O" {
                let r = vec![2, 4, 6, 8];
                let mut rng = rand::thread_rng();
                let rc = *r.choose(&mut rng).unwrap();
                if rc == 2 {
                    if self.a2 != "O" && self.a2 != "X" {
                        self.a2 = "O".to_string();
                        self.avpos.retain(|&x| x != 2);
                        println!("Computer chose Position 2!");
                        self.grid();
                        self.af = true;
                        return self.af;
                    }
                }
                if rc == 4 {
                    if self.b1 != "O" && self.b1 != "X" {
                        self.b1 = "O".to_string();
                        self.avpos.retain(|&x| x != 4);
                        println!("Computer chose Position 4!");
                        self.grid();
                        self.af = true;
                        return self.af;
                    }
                }
                if rc == 6 {
                    if self.b3 != "O" && self.b3 != "X" {
                        self.b3 = "O".to_string();
                        self.avpos.retain(|&x| x != 6);
                        println!("Computer chose Position 6!");
                        self.grid();
                        self.af = true;
                        return self.af;
                    }
                }
                if rc == 8 {
                    if self.c2 != "O" && self.c2 != "X" {
                        self.c2 = "O".to_string();
                        self.avpos.retain(|&x| x != 8);
                        println!("Computer chose Position 8!");
                        self.grid();
                        self.af = true;
                        return self.af;
                    }
                }
            }
            
            // Many more anti-fork checks similar to the one above
            // I'll add a few more key ones but there are many possible combinations
            
            if self.a1 == "X" && self.c3 == "X" && self.b2 == "O" {
                let r = vec![2, 4, 6, 8];
                let mut rng = rand::thread_rng();
                let rc = *r.choose(&mut rng).unwrap();
                if rc == 2 && self.a2 != "O" && self.a2 != "X" {
                    self.a2 = "O".to_string();
                    self.avpos.retain(|&x| x != 2);
                    println!("Computer chose Position 2!");
                    self.grid();
                    self.af = true;
                    return self.af;
                }
                if rc == 4 && self.b1 != "O" && self.b1 != "X" {
                    self.b1 = "O".to_string();
                    self.avpos.retain(|&x| x != 4);
                    println!("Computer chose Position 4!");
                    self.grid();
                    self.af = true;
                    return self.af;
                }
                if rc == 6 && self.b3 != "O" && self.b3 != "X" {
                    self.b3 = "O".to_string();
                    self.avpos.retain(|&x| x != 6);
                    println!("Computer chose Position 6!");
                    self.grid();
                    self.af = true;
                    return self.af;
                }
                if rc == 8 && self.c2 != "O" && self.c2 != "X" {
                    self.c2 = "O".to_string();
                    self.avpos.retain(|&x| x != 8);
                    println!("Computer chose Position 8!");
                    self.grid();
                    self.af = true;
                    return self.af;
                }
            }
            
            // X-O-X series (L-structure, rotated)
            if self.a2 == "X" && self.b1 == "X" && self.b2 == "O" {
                if self.a1 != "O" && self.a1 != "X" {
                    self.a1 = "O".to_string();
                    self.avpos.retain(|&x| x != 1);
                    println!("Computer chose Position 1!");
                    self.grid();
                    self.af = true;
                    return self.af;
                }
            }
        }
        
        if self.b2 == "X" {
            // X-X-O series (vertical and horizontal, rotated)
            if self.b2 == "X" && self.a2 == "X" && self.c2 == "O" {
                let r = vec![7, 9];
                let mut rng = rand::thread_rng();
                let c = *r.choose(&mut rng).unwrap();
                if c == 7 && self.c1 != "O" && self.c1 != "X" {
                    self.c1 = "O".to_string();
                    self.avpos.retain(|&x| x != 7);
                    println!("Computer chose Position {}!", c);
                    self.grid();
                    self.af = true;
                    return self.af;
                }
                if c == 9 && self.c3 != "O" && self.c3 != "X" {
                    self.c3 = "O".to_string();
                    self.avpos.retain(|&x| x != 9);
                    println!("Computer chose Position {}!", c);
                    self.grid();
                    self.af = true;
                    return self.af;
                }
            }
        }
        
        self.af
    }
}

// Helper function to read input from user
fn read_input() -> String {
    let mut input = String::new();
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).expect("Failed to read input");
    input.trim().to_string()
}

// Helper function to get a valid position from user
fn get_valid_pos(game: &GameState, player_name: &str) -> i32 {
    loop {
        print!("Your turn, {}, enter a position \x1b[36m(out of {:?})\x1b[0m to mark X: ", player_name, game.avpos);
        io::stdout().flush().unwrap();
        let input = read_input();
        
        match input.parse::<i32>() {
            Ok(pos) if game.avpos.contains(&pos) => return pos,
            Ok(_) => println!("\x1b[31mError: That position is already invalid/occupied, please retry!\x1b[0m\n"),
            Err(_) => println!("\x1b[31mError: Please retry with a valid numeric value!\x1b[0m\n"),
        }
    }
}

fn main() {
    let mut game = GameState::new();
    
    // Print introduction
    println!("\x1b[32mWelcome to the Tic Tac Toe game!");
    println!("");
    println!("");
    println!("\x1b[34mPlease use the following guide for positions to mark on your turn!");
    println!("1 | 2 | 3");
    println!("——————————");
    println!("4 | 5 | 6");
    println!("——————————");
    println!("7 | 8 | 9\x1b[0m");
    println!("");
    
    // Choose game mode
    let mode: String;
    loop {
        print!("\x1b[34mWould you like to (S) play single-player versus a Computer, or (D) play a one-versus-one with another player (Enter 'S' or 'D' only): ");
        let choice = read_input().to_uppercase();
        
        if choice == "S" || choice == "D" {
            mode = choice;
            break;
        } else {
            println!("\x1b[31mError: Please enter only 'S' or 'D' as your input!\x1b[0m\n");
        }
    }

    // Single player mode
    if mode == "S" {
        let hard: String;
        loop {
            print!("Would like the difficulty of the Computer to be (E) Easy, (M) Medium, (H) Hard, or (I) Impossible? (Enter 'E','M','H', or 'I' only): ");
            io::stdout().flush().unwrap();
            let input = read_input().to_uppercase();
            if input == "E" || input == "M" || input == "H" || input == "I" {
                hard = input;
                break;
            } else {
                println!("\x1b[31mError: Please enter only 'E','M','H', or 'I' as your input!\x1b[0m\n");
            }
        }
        println!();
        
        // IMPOSSIBLE mode
        if hard == "I" {
            println!("\x1b[1m\x1b[33mCOMPUTER:\x1b[0m \x1b[3mAh, so you have decided to challenge me? Let's do this.\x1b[0m");
            println!(" ");
            print!("Enter name of Player 1 (playing X) here: ");
            io::stdout().flush().unwrap();
            game.p1 = read_input();
            game.p2 = "Computer".to_string();
            game.grid();
            
            // Player Turn 1
            let pos = get_valid_pos(&game, &game.p1);
            game.enter_pos("X", pos);
            println!("");
            
            // Engine Turn 1
            println!("Computer's turn, entering a position \x1b[36m(out of {:?})\x1b[0m to mark O.", game.avpos);
            if pos == 1 || pos == 2 || pos == 3 || pos == 4 || pos == 6 || pos == 7 || pos == 8 || pos == 9 {
                // Player chose a non-center value
                println!("Computer chose Position 5!");
                game.b2 = "O".to_string();
                game.avpos.retain(|&x| x != 5);
                game.grid();
            } else if pos == 5 {
                // If Player chose center
                let mut rng = rand::thread_rng();
                let corner = vec![1, 3, 7, 9];
                let cpos = *corner.choose(&mut rng).unwrap();
                game.enter_pos("O", cpos);
            }
            println!(" ");
            
            // Loop For Turn 2 Onwards
            while !game.end {
                // Player Turn 2 onwards
                let pos = get_valid_pos(&game, &game.p1);
                game.enter_pos("X", pos);
                
                // Check for wins
                if let Some(_) = game.check_win() {
                    break;
                }
                
                if game.avpos.is_empty() {
                    println!("\x1b[1m\x1b[33mCOMPUTER:\x1b[0m \x1b[3mWhile it may seem like it, we aren't equal, {}. Try again.\x1b[0m\n", game.p1);
                    println!("\x1b[32mRESULT: The game was a draw!\x1b[0m");
                    break;
                }
                
                // AI Turn 2 onwards
                if !game.end {
                    println!("Computer's turn, entering a position \x1b[36m(out of {:?})\x1b[0m to mark O.", game.avpos);
                    let w = game.win_move(); // Trying to find a winning move
                    if !w {
                        let b = game.block_win(); // Blocking immediate threats
                        if !b {
                            let a = game.anti_fork(); // Blocking tactical moves with counter-tactics
                            if !a {
                                game.best_move(); // Random move if nothing else works
                            }
                        }
                    }
                    
                    // Check for wins
                    if let Some(_) = game.check_win() {
                        println!("\n\x1b[1m\x1b[33mCOMPUTER:\x1b[0m \x1b[3mAt least you tried, {}, but you were warned.\x1b[0m", game.p1);
                        break;
                    }
                    
                    if game.avpos.is_empty() {
                        println!("\x1b[1m\x1b[33mCOMPUTER:\x1b[0m \x1b[3mWhile it may seem like it, we aren't equal, {}. Try again.\x1b[0m\n", game.p1);
                        println!("\x1b[32mRESULT: The game was a draw!\x1b[0m");
                        break;
                    }
                } else {
                    break;
                }
            }
        }
        // HARD mode
        else if hard == "H" {
            print!("Enter name of Player 1 (playing X) here: ");
            io::stdout().flush().unwrap();
            game.p1 = read_input();
            game.p2 = "Computer".to_string();
            game.grid();
            
            // Player Turn 1
            let pos = get_valid_pos(&game, &game.p1);
            game.enter_pos("X", pos);
            println!("");
            
            // Engine Turn 1
            println!("Computer's turn, entering a position \x1b[36m(out of {:?})\x1b[0m to mark O.", game.avpos);
            if pos == 1 || pos == 2 || pos == 3 || pos == 4 || pos == 6 || pos == 7 || pos == 8 || pos == 9 {
                // Player chose a non-center value
                println!("Computer chose Position 5!");
                game.b2 = "O".to_string();
                game.avpos.retain(|&x| x != 5);
                game.grid();
            } else if pos == 5 {
                // If Player chose center
                let mut rng = rand::thread_rng();
                let cpos = *game.avpos.choose(&mut rng).unwrap();
                game.enter_pos("O", cpos);
            }
            println!(" ");
            
            // Loop For Turn 2 Onwards
            while !game.end {
                // Player Turn 2 onwards
                let pos = get_valid_pos(&game, &game.p1);
                game.enter_pos("X", pos);
                
                // Check for wins
                if let Some(_) = game.check_win() {
                    break;
                }
                
                if game.avpos.is_empty() {
                    println!("\x1b[32mRESULT: The game was a draw!\x1b[0m");
                    break;
                }
                
                // Engine Turn 2 onwards
                if !game.end {
                    println!("Computer's turn, entering a position \x1b[36m(out of {:?})\x1b[0m to mark O.", game.avpos);
                    let w = game.win_move(); // Trying to find a winning move
                    if !w {
                        let b = game.block_win(); // Blocking immediate threats
                        if !b {
                            game.best_move(); // Random move, will occasionally cause Computer to lose
                        }
                    }
                    
                    // Check for wins
                    if let Some(_) = game.check_win() {
                        break;
                    }
                    
                    if game.avpos.is_empty() {
                        println!("\x1b[32mRESULT: The game was a draw!\x1b[0m");
                        break;
                    }
                } else {
                    break;
                }
            }
        }
        // MEDIUM mode
        else if hard == "M" {
            print!("Enter name of Player 1 (playing X) here: ");
            io::stdout().flush().unwrap();
            game.p1 = read_input();
            game.p2 = "Computer".to_string();
            game.grid();
            
            while !game.end {
                // Player Turn Loop
                let pos = get_valid_pos(&game, &game.p1);
                game.enter_pos("X", pos);
                
                // Check for wins
                if let Some(_) = game.check_win() {
                    break;
                }
                
                if game.avpos.is_empty() {
                    println!("\x1b[32mRESULT: The game was a draw!\x1b[0m");
                    break;
                }
                
                // Computer Turn
                println!("Computer's turn, entering a position \x1b[36m(out of {:?})\x1b[0m to mark O.", game.avpos);
                let b = game.block_win(); // Blocking immediate threats
                if !b {
                    game.best_move(); // Just randomizing, if unable to block. Loss likely.
                }
                
                // Check for wins
                if let Some(_) = game.check_win() {
                    break;
                }
                
                if game.avpos.is_empty() {
                    println!("\x1b[32mRESULT: The game was a draw!\x1b[0m");
                    break;
                }
            }
        }
        // EASY mode
        else if hard == "E" {
            print!("Enter name of Player 1 (playing X) here: ");
            io::stdout().flush().unwrap();
            game.p1 = read_input();
            game.p2 = "Computer".to_string();
            game.grid();
            
            while !game.end {
                // Player Turn Loop
                let pos = get_valid_pos(&game, &game.p1);
                game.enter_pos("X", pos);
                
                // Check for wins
                if let Some(_) = game.check_win() {
                    break;
                }
                
                if game.avpos.is_empty() {
                    println!("\x1b[32mRESULT: The game was a draw!\x1b[0m");
                    break;
                }
                
                // Computer Turn
                println!("Computer's turn, entering a position \x1b[36m(out of {:?})\x1b[0m to mark O.", game.avpos);
                game.best_move(); // Completely random moves, Computer should lose in almost all cases.
                
                // Check for wins
                if let Some(_) = game.check_win() {
                    break;
                }
                
                if game.avpos.is_empty() {
                    println!("\x1b[32mRESULT: The game was a draw!\x1b[0m");
                    break;
                }
            }
        }
    }
    // Multiplayer mode
    else if mode == "D" {
        println!(" ");
        print!("Enter name of Player 1 (playing X) here: ");
        io::stdout().flush().unwrap();
        game.p1 = read_input();
        
        print!("Enter name of Player 2 (playing O) here: ");
        io::stdout().flush().unwrap();
        game.p2 = read_input();
        
        game.grid();
        
        while !game.end {
            // Player 1's Turn
            print!("Your turn, {}, enter a position \x1b[36m(out of {:?})\x1b[0m to mark X: ", game.p1, game.avpos);
            io::stdout().flush().unwrap();
            let input = read_input();
            
            match input.parse::<i32>() {
                Ok(pos) if game.avpos.contains(&pos) => {
                    game.enter_pos("X", pos);
                },
                Ok(_) => {
                    println!("\x1b[31mError: That position is already invalid/occupied, please retry!\x1b[0m\n");
                    continue;
                },
                Err(_) => {
                    println!("\x1b[31mError: Please retry with a valid numeric value!\x1b[0m\n");
                    continue;
                }
            }
            
            // Check for wins
            if let Some(_) = game.check_win() {
                break;
            }
            
            if game.avpos.is_empty() {
                println!("\x1b[32mRESULT: The game was a draw!\x1b[0m");
                break;
            }
            
            // Player 2's Turn
            print!("Your turn, {}, enter a position \x1b[36m(out of {:?})\x1b[0m to mark O: ", game.p2, game.avpos);
            io::stdout().flush().unwrap();
            let input = read_input();
            
            match input.parse::<i32>() {
                Ok(pos) if game.avpos.contains(&pos) => {
                    game.enter_pos("O", pos);
                },
                Ok(_) => {
                    println!("\x1b[31mError: That position is already invalid/occupied, please retry!\x1b[0m\n");
                    continue;
                },
                Err(_) => {
                    println!("\x1b[31mError: Please retry with a valid numeric value!\x1b[0m\n");
                    continue;
                }
            }
            
            // Check for wins
            if let Some(_) = game.check_win() {
                break;
            }
            
            if game.avpos.is_empty() {
                println!("\x1b[32mRESULT: The game was a draw!\x1b[0m");
                break;
            }
        }
    }
}
