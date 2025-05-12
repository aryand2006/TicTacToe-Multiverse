import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

public class tictactoe {
    // Game state variables
    private static String a1, a2, a3, b1, b2, b3, c1, c2, c3;
    private static List<Integer> avpos;
    private static boolean af, nb, bm, moved, end;
    private static String p1, p2;
    private static Random random;
    private static Scanner scanner;

    // Custom Functions
    // Display the current grid
    public static void grid() {
        System.out.println("\033[34m");
        System.out.println(a1 + " | " + a2 + " | " + a3);
        System.out.println("——————————");
        System.out.println(b1 + " | " + b2 + " | " + b3);
        System.out.println("——————————");
        System.out.println(c1 + " | " + c2 + " | " + c3);
        System.out.println("\033[0m");
    }

    // Enter a position and parse it
    public static void enter_pos(String mark, int pos) {
        switch (pos) {
            case 1:
                a1 = mark;
                avpos.remove(Integer.valueOf(1));
                grid();
                break;
            case 2:
                a2 = mark;
                avpos.remove(Integer.valueOf(2));
                grid();
                break;
            case 3:
                a3 = mark;
                avpos.remove(Integer.valueOf(3));
                grid();
                break;
            case 4:
                b1 = mark;
                avpos.remove(Integer.valueOf(4));
                grid();
                break;
            case 5:
                b2 = mark;
                avpos.remove(Integer.valueOf(5));
                grid();
                break;
            case 6:
                b3 = mark;
                avpos.remove(Integer.valueOf(6));
                grid();
                break;
            case 7:
                c1 = mark;
                avpos.remove(Integer.valueOf(7));
                grid();
                break;
            case 8:
                c2 = mark;
                avpos.remove(Integer.valueOf(8));
                grid();
                break;
            case 9:
                c3 = mark;
                avpos.remove(Integer.valueOf(9));
                grid();
                break;
        }
    }

    // Initialize the game
    public static void initGame() {
        a1 = a2 = a3 = b1 = b2 = b3 = c1 = c2 = c3 = " ";
        avpos = new ArrayList<>(Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9));
        af = nb = bm = moved = end = false;
        random = new Random();
        scanner = new Scanner(System.in);
    }

    // Check if a player/engine won
    public static String check_win() {
        end = false;
        System.out.println("");
        
        // Horizontal Win (X)
        if (a1.equals("X") && a2.equals("X") && a3.equals("X")) {
            System.out.println("\033[32mRESULT: " + p1 + " won the game!\033[0m");
            end = true;
        }
        if (b1.equals("X") && b2.equals("X") && b3.equals("X")) {
            System.out.println("\033[32mRESULT: " + p1 + " won the game!\033[0m");
            end = true;
        }
        if (c1.equals("X") && c2.equals("X") && c3.equals("X")) {
            System.out.println("\033[32mRESULT: " + p1 + " won the game!\033[0m");
            end = true;
        }
        
        // Vertical Win (X)
        if (a1.equals("X") && b1.equals("X") && c1.equals("X")) {
            System.out.println("\033[32mRESULT: " + p1 + " won the game!\033[0m");
            end = true;
        }
        if (a2.equals("X") && b2.equals("X") && c2.equals("X")) {
            System.out.println("\033[32mRESULT: " + p1 + " won the game!\033[0m");
            end = true;
        }
        if (a3.equals("X") && b3.equals("X") && c3.equals("X")) {
            System.out.println("\033[32mRESULT: " + p1 + " won the game!\033[0m");
            end = true;
        }
        
        // Diagonal Win (X)
        if (a1.equals("X") && b2.equals("X") && c3.equals("X")) {
            System.out.println("\033[32mRESULT: " + p1 + " won the game!\033[0m");
            end = true;
        }
        if (a3.equals("X") && b2.equals("X") && c1.equals("X")) {
            System.out.println("\033[32mRESULT: " + p1 + " won the game!\033[0m");
            end = true;
        }
        
        // Horizontal Win (O)
        if (a1.equals("O") && a2.equals("O") && a3.equals("O")) {
            System.out.println("\033[32mRESULT: " + p2 + " won the game!\033[0m");
            end = true;
        }
        if (b1.equals("O") && b2.equals("O") && b3.equals("O")) {
            System.out.println("\033[32mRESULT: " + p2 + " won the game!\033[0m");
            end = true;
        }
        if (c1.equals("O") && c2.equals("O") && c3.equals("O")) {
            System.out.println("\033[32mRESULT: " + p2 + " won the game!\033[0m");
            end = true;
        }
        
        // Vertical Win (O)
        if (a1.equals("O") && b1.equals("O") && c1.equals("O")) {
            System.out.println("\033[32mRESULT: " + p2 + " won the game!\033[0m");
            end = true;
        }
        if (a2.equals("O") && b2.equals("O") && c2.equals("O")) {
            System.out.println("\033[32mRESULT: " + p2 + " won the game!\033[0m");
            end = true;
        }
        if (a3.equals("O") && b3.equals("O") && c3.equals("O")) {
            System.out.println("\033[32mRESULT: " + p2 + " won the game!\033[0m");
            end = true;
        }
        
        // Diagonal Win (O)
        if (a1.equals("O") && b2.equals("O") && c3.equals("O")) {
            System.out.println("\033[32mRESULT: " + p2 + " won the game!\033[0m");
            end = true;
        }
        if (a3.equals("O") && b2.equals("O") && c1.equals("O")) {
            System.out.println("\033[32mRESULT: " + p2 + " won the game!\033[0m");
            end = true;
        }
        
        if (end) {
            return "break";
        }
        return null;
    }

    // Engine to block any potential wins
    public static boolean block_win() {
        nb = false;
        
        if ((a2.equals("X") && a3.equals("X")) || (b1.equals("X") && c1.equals("X")) || (b2.equals("X") && c3.equals("X"))) {
            if (!a1.equals("O") && !a1.equals("X")) {
                a1 = "O";
                avpos.remove(Integer.valueOf(1));
                System.out.println("Computer chose Position 1!");
                grid();
                nb = true;
                return nb;
            }
        }
        
        if ((a1.equals("X") && a3.equals("X")) || (b2.equals("X") && c2.equals("X"))) {
            if (!a2.equals("O") && !a2.equals("X")) {
                a2 = "O";
                avpos.remove(Integer.valueOf(2));
                System.out.println("Computer chose Position 2!");
                grid();
                nb = true;
                return nb;
            }
        }
        
        if ((a1.equals("X") && a2.equals("X")) || (b2.equals("X") && c1.equals("X")) || (b3.equals("X") && c3.equals("X"))) {
            if (!a3.equals("O") && !a3.equals("X")) {
                a3 = "O";
                avpos.remove(Integer.valueOf(3));
                System.out.println("Computer chose Position 3!");
                grid();
                nb = true;
                return nb;
            }
        }
        
        if ((a1.equals("X") && c1.equals("X")) || (b2.equals("X") && b3.equals("X"))) {
            if (!b1.equals("O") && !b1.equals("X")) {
                b1 = "O";
                avpos.remove(Integer.valueOf(4));
                System.out.println("Computer chose Position 4!");
                grid();
                nb = true;
                return nb;
            }
        }
        
        if ((a1.equals("X") && c3.equals("X")) || (a2.equals("X") && c2.equals("X")) || 
            (a3.equals("X") && c1.equals("X")) || (b3.equals("X") && b1.equals("X"))) {
            if (!b2.equals("O") && !b2.equals("X")) {
                b2 = "O";
                avpos.remove(Integer.valueOf(5));
                System.out.println("Computer chose Position 5!");
                grid();
                nb = true;
                return nb;
            }
        }
        
        if ((a3.equals("X") && c3.equals("X")) || (b1.equals("X") && b2.equals("X"))) {
            if (!b3.equals("O") && !b3.equals("X")) {
                b3 = "O";
                avpos.remove(Integer.valueOf(6));
                System.out.println("Computer chose Position 6!");
                grid();
                nb = true;
                return nb;
            }
        }
        
        if ((a1.equals("X") && b1.equals("X")) || (c2.equals("X") && c3.equals("X")) || (a3.equals("X") && b2.equals("X"))) {
            if (!c1.equals("O") && !c1.equals("X")) {
                c1 = "O";
                avpos.remove(Integer.valueOf(7));
                System.out.println("Computer chose Position 7!");
                grid();
                nb = true;
                return nb;
            }
        }
        
        if ((a2.equals("X") && b2.equals("X")) || (c1.equals("X") && c3.equals("X"))) {
            if (!c2.equals("O") && !c2.equals("X")) {
                c2 = "O";
                avpos.remove(Integer.valueOf(8));
                System.out.println("Computer chose Position 8!");
                grid();
                nb = true;
                return nb;
            }
        }
        
        if ((a3.equals("X") && b3.equals("X")) || (a1.equals("X") && b2.equals("X")) || (c1.equals("X") && c2.equals("X"))) {
            if (!c3.equals("O") && !c3.equals("X")) {
                c3 = "O";
                avpos.remove(Integer.valueOf(9));
                System.out.println("Computer chose Position 9!");
                grid();
                nb = true;
                return nb;
            }
        }
        
        return nb;
    }

    // Engine to make a winning move
    public static boolean win_move() {
        moved = false;
        
        if ((a2.equals("O") && a3.equals("O")) || (b1.equals("O") && c1.equals("O")) || (b2.equals("O") && c3.equals("O"))) {
            if (!a1.equals("X") && !a1.equals("O")) {
                a1 = "O";
                avpos.remove(Integer.valueOf(1));
                System.out.println("Computer chose Position 1!");
                grid();
                moved = true;
                return moved;
            }
        }
        
        if ((a1.equals("O") && a3.equals("O")) || (b2.equals("O") && c2.equals("O"))) {
            if (!a2.equals("X") && !a2.equals("O")) {
                a2 = "O";
                avpos.remove(Integer.valueOf(2));
                System.out.println("Computer chose Position 2!");
                grid();
                moved = true;
                return moved;
            }
        }
        
        if ((a1.equals("O") && a2.equals("O")) || (b2.equals("O") && c1.equals("O")) || (b3.equals("O") && c3.equals("O"))) {
            if (!a3.equals("X") && !a3.equals("O")) {
                a3 = "O";
                avpos.remove(Integer.valueOf(3));
                System.out.println("Computer chose Position 3!");
                grid();
                moved = true;
                return moved;
            }
        }
        
        if ((a1.equals("O") && c1.equals("O")) || (b2.equals("O") && b3.equals("O"))) {
            if (!b1.equals("X") && !b1.equals("O")) {
                b1 = "O";
                avpos.remove(Integer.valueOf(4));
                System.out.println("Computer chose Position 4!");
                grid();
                moved = true;
                return moved;
            }
        }
        
        if ((a1.equals("O") && c3.equals("O")) || (a2.equals("O") && c2.equals("O")) || 
            (a3.equals("O") && c1.equals("O")) || (b3.equals("O") && b1.equals("O"))) {
            if (!b2.equals("X") && !b2.equals("O")) {
                b2 = "O";
                avpos.remove(Integer.valueOf(5));
                System.out.println("Computer chose Position 5!");
                grid();
                moved = true;
                return moved;
            }
        }
        
        if ((a3.equals("O") && c3.equals("O")) || (b1.equals("O") && b2.equals("O"))) {
            if (!b3.equals("X") && !b3.equals("O")) {
                b3 = "O";
                avpos.remove(Integer.valueOf(6));
                System.out.println("Computer chose Position 6!");
                grid();
                moved = true;
                return moved;
            }
        }
        
        if ((a1.equals("O") && b1.equals("O")) || (c2.equals("O") && c3.equals("O")) || (a3.equals("O") && b2.equals("O"))) {
            if (!c1.equals("X") && !c1.equals("O")) {
                c1 = "O";
                avpos.remove(Integer.valueOf(7));
                System.out.println("Computer chose Position 7!");
                grid();
                moved = true;
                return moved;
            }
        }
        
        if ((a2.equals("O") && b2.equals("O")) || (c1.equals("O") && c3.equals("O"))) {
            if (!c2.equals("X") && !c2.equals("O")) {
                c2 = "O";
                avpos.remove(Integer.valueOf(8));
                System.out.println("Computer chose Position 8!");
                grid();
                moved = true;
                return moved;
            }
        }
        
        if ((a3.equals("O") && b3.equals("O")) || (a1.equals("O") && b2.equals("O")) || (c1.equals("O") && c2.equals("O"))) {
            if (!c3.equals("X") && !c3.equals("O")) {
                c3 = "O";
                avpos.remove(Integer.valueOf(9));
                System.out.println("Computer chose Position 9!");
                grid();
                moved = true;
                return moved;
            }
        }
        
        return moved;
    }

    // Make a random move
    public static boolean best_move() {
        bm = false;
        
        if (!nb && !moved) {
            int ranpos = avpos.get(random.nextInt(avpos.size()));
            switch (ranpos) {
                case 1:
                    a1 = "O";
                    avpos.remove(Integer.valueOf(1));
                    System.out.println("Computer chose Position " + ranpos + "!");
                    grid();
                    bm = true;
                    return bm;
                case 2:
                    a2 = "O";
                    avpos.remove(Integer.valueOf(2));
                    System.out.println("Computer chose Position " + ranpos + "!");
                    grid();
                    bm = true;
                    return bm;
                case 3:
                    a3 = "O";
                    avpos.remove(Integer.valueOf(3));
                    System.out.println("Computer chose Position " + ranpos + "!");
                    grid();
                    bm = true;
                    return bm;
                case 4:
                    b1 = "O";
                    avpos.remove(Integer.valueOf(4));
                    System.out.println("Computer chose Position " + ranpos + "!");
                    grid();
                    bm = true;
                    return bm;
                case 5:
                    b2 = "O";
                    avpos.remove(Integer.valueOf(5));
                    System.out.println("Computer chose Position " + ranpos + "!");
                    grid();
                    bm = true;
                    return bm;
                case 6:
                    b3 = "O";
                    avpos.remove(Integer.valueOf(6));
                    System.out.println("Computer chose Position " + ranpos + "!");
                    grid();
                    bm = true;
                    return bm;
                case 7:
                    c1 = "O";
                    avpos.remove(Integer.valueOf(7));
                    System.out.println("Computer chose Position " + ranpos + "!");
                    grid();
                    bm = true;
                    return bm;
                case 8:
                    c2 = "O";
                    avpos.remove(Integer.valueOf(8));
                    System.out.println("Computer chose Position " + ranpos + "!");
                    grid();
                    bm = true;
                    return bm;
                case 9:
                    c3 = "O";
                    avpos.remove(Integer.valueOf(9));
                    System.out.println("Computer chose Position " + ranpos + "!");
                    grid();
                    bm = true;
                    return bm;
            }
        }
        
        return bm;
    }

    // Custom function for countering forks
    public static boolean anti_fork() {
        af = false;
        
        if (b2.equals("O")) {
            // X-O-X series (diagonal, rotated)
            if (a3.equals("X") && c1.equals("X") && b2.equals("O")) {
                List<Integer> r = Arrays.asList(2, 4, 6, 8);
                int rc = r.get(random.nextInt(r.size()));
                if (rc == 2) {
                    if (!a2.equals("O") && !a2.equals("X")) {
                        a2 = "O";
                        avpos.remove(Integer.valueOf(2));
                        System.out.println("Computer chose Position 2!");
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (rc == 4) {
                    if (!b1.equals("O") && !b1.equals("X")) {
                        b1 = "O";
                        avpos.remove(Integer.valueOf(4));
                        System.out.println("Computer chose Position 4!");
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (rc == 6) {
                    if (!b3.equals("O") && !b3.equals("X")) {
                        b3 = "O";
                        avpos.remove(Integer.valueOf(6));
                        System.out.println("Computer chose Position 6!");
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (rc == 8) {
                    if (!c2.equals("O") && !c2.equals("X")) {
                        c2 = "O";
                        avpos.remove(Integer.valueOf(8));
                        System.out.println("Computer chose Position 8!");
                        grid();
                        af = true;
                        return af;
                    }
                }
            }
            
            if (a1.equals("X") && c3.equals("X") && b2.equals("O")) {
                List<Integer> r = Arrays.asList(2, 4, 6, 8);
                int rc = r.get(random.nextInt(r.size()));
                if (rc == 2) {
                    if (!a2.equals("O") && !a2.equals("X")) {
                        a2 = "O";
                        avpos.remove(Integer.valueOf(2));
                        System.out.println("Computer chose Position 2!");
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (rc == 4) {
                    if (!b1.equals("O") && !b1.equals("X")) {
                        b1 = "O";
                        avpos.remove(Integer.valueOf(4));
                        System.out.println("Computer chose Position 4!");
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (rc == 6) {
                    if (!b3.equals("O") && !b3.equals("X")) {
                        b3 = "O";
                        avpos.remove(Integer.valueOf(6));
                        System.out.println("Computer chose Position 6!");
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (rc == 8) {
                    if (!c2.equals("O") && !c2.equals("X")) {
                        c2 = "O";
                        avpos.remove(Integer.valueOf(8));
                        System.out.println("Computer chose Position 8!");
                        grid();
                        af = true;
                        return af;
                    }
                }
            }
            
            // X-O-X series (L-structure, rotated)
            if (a2.equals("X") && b1.equals("X") && b2.equals("O")) {
                if (!a1.equals("O") && !a1.equals("X")) {
                    a1 = "O";
                    avpos.remove(Integer.valueOf(1));
                    System.out.println("Computer chose Position 1!");
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (b1.equals("X") && c2.equals("X") && b2.equals("O")) {
                if (!c1.equals("O") && !c1.equals("X")) {
                    c1 = "O";
                    avpos.remove(Integer.valueOf(7));
                    System.out.println("Computer chose Position 7!");
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (c2.equals("X") && b3.equals("X") && b2.equals("O")) {
                if (!c3.equals("O") && !c3.equals("X")) {
                    c3 = "O";
                    avpos.remove(Integer.valueOf(9));
                    System.out.println("Computer chose Position 9!");
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (b2.equals("O") && a2.equals("X") && b3.equals("X")) {
                if (!a3.equals("O") && !a3.equals("X")) {
                    a3 = "O";
                    avpos.remove(Integer.valueOf(3));
                    System.out.println("Computer chose Position 3!");
                    grid();
                    af = true;
                    return af;
                }
            }
            
            // X-O-X series (angled upward, rotated)
            if (b1.equals("X") && a3.equals("X") && b2.equals("O")) {
                if (!a1.equals("O") && !a1.equals("X")) {
                    a1 = "O";
                    avpos.remove(Integer.valueOf(1));
                    System.out.println("Computer chose Position 1!");
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (a1.equals("X") && c2.equals("X") && b2.equals("O")) {
                if (!c1.equals("O") && !c1.equals("X")) {
                    c1 = "O";
                    avpos.remove(Integer.valueOf(7));
                    System.out.println("Computer chose Position 7!");
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (c1.equals("X") && b3.equals("X") && b2.equals("O")) {
                if (!c3.equals("O") && !c3.equals("X")) {
                    c3 = "O";
                    avpos.remove(Integer.valueOf(9));
                    System.out.println("Computer chose Position 9!");
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (c3.equals("X") && a2.equals("X") && b2.equals("O")) {
                if (!a3.equals("O") && !a3.equals("X")) {
                    a3 = "O";
                    avpos.remove(Integer.valueOf(3));
                    System.out.println("Computer chose Position 3!");
                    grid();
                    af = true;
                    return af;
                }
            }
            
            // X-O-X series (angled downward, rotated)
            if (b1.equals("X") && c3.equals("X") && b2.equals("O")) {
                if (!c1.equals("O") && !c1.equals("X")) {
                    c1 = "O";
                    avpos.remove(Integer.valueOf(7));
                    System.out.println("Computer chose Position 7!");
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (c2.equals("X") && a3.equals("X") && b2.equals("O")) {
                if (!c3.equals("O") && !c3.equals("X")) {
                    c3 = "O";
                    avpos.remove(Integer.valueOf(9));
                    System.out.println("Computer chose Position 9!");
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (a1.equals("X") && b3.equals("X") && b2.equals("O")) {
                if (!a3.equals("O") && !a3.equals("X")) {
                    a3 = "O";
                    avpos.remove(Integer.valueOf(3));
                    System.out.println("Computer chose Position 3!");
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (c1.equals("X") && a2.equals("X") && b2.equals("O")) {
                if (!a1.equals("O") && !a1.equals("X")) {
                    a1 = "O";
                    avpos.remove(Integer.valueOf(1));
                    System.out.println("Computer chose Position 1!");
                    grid();
                    af = true;
                    return af;
                }
            }
        }
        
        if (b2.equals("X")) {
            // X-X-O series (vertical and horizontal, rotated)
            if (b2.equals("X") && a2.equals("X") && c2.equals("O")) {
                List<Integer> r = Arrays.asList(7, 9);
                int c = r.get(random.nextInt(r.size()));
                if (c == 7) {
                    if (!c1.equals("O") && !c1.equals("X")) {
                        c1 = "O";
                        avpos.remove(Integer.valueOf(7));
                        System.out.println("Computer chose Position " + c + "!");
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (c == 9) {
                    if (!c3.equals("O") && !c3.equals("X")) {
                        c3 = "O";
                        avpos.remove(Integer.valueOf(9));
                        System.out.println("Computer chose Position " + c + "!");
                        grid();
                        af = true;
                        return af;
                    }
                }
            }
            
            if (b1.equals("X") && b2.equals("X") && b3.equals("O")) {
                List<Integer> r = Arrays.asList(3, 9);
                int c = r.get(random.nextInt(r.size()));
                if (c == 3) {
                    if (!a3.equals("O") && !a3.equals("X")) {
                        a3 = "O";
                        avpos.remove(Integer.valueOf(3));
                        System.out.println("Computer chose Position " + c + "!");
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (c == 9) {
                    if (!c3.equals("O") && !c3.equals("X")) {
                        c3 = "O";
                        avpos.remove(Integer.valueOf(9));
                        System.out.println("Computer chose Position " + c + "!");
                        grid();
                        af = true;
                        return af;
                    }
                }
            }
            
            if (b2.equals("X") && c3.equals("X") && a2.equals("O")) {
                List<Integer> r = Arrays.asList(1, 3);
                int c = r.get(random.nextInt(r.size()));
                if (c == 1) {
                    if (!a1.equals("O") && !a1.equals("X")) {
                        a1 = "O";
                        avpos.remove(Integer.valueOf(1));
                        System.out.println("Computer chose Position " + c + "!");
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (c == 3) {
                    if (!a3.equals("O") && !a3.equals("X")) {
                        a3 = "O";
                        avpos.remove(Integer.valueOf(3));
                        System.out.println("Computer chose Position " + c + "!");
                        grid();
                        af = true;
                        return af;
                    }
                }
            }
            
            if (b2.equals("X") && b3.equals("X") && b1.equals("O")) {
                List<Integer> r = Arrays.asList(1, 7);
                int c = r.get(random.nextInt(r.size()));
                if (c == 1) {
                    if (!a1.equals("O") && !a1.equals("X")) {
                        a1 = "O";
                        avpos.remove(Integer.valueOf(1));
                        System.out.println("Computer chose Position " + c + "!");
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (c == 7) {
                    if (!c1.equals("O") && !c1.equals("X")) {
                        c1 = "O";
                        avpos.remove(Integer.valueOf(7));
                        System.out.println("Computer chose Position " + c + "!");
                        grid();
                        af = true;
                        return af;
                    }
                }
            }
            
            // X-X-O series (diagonal, rotated)
            if (a3.equals("X") && b2.equals("X") && c1.equals("O")) {
                if (!a1.equals("O") && !a1.equals("X")) {
                    a1 = "O";
                    avpos.remove(Integer.valueOf(1));
                    System.out.println("Computer chose Position 1!");
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (a1.equals("X") && b2.equals("X") && c3.equals("O")) {
                if (!a3.equals("O") && !a3.equals("X")) {
                    a3 = "O";
                    avpos.remove(Integer.valueOf(3));
                    System.out.println("Computer chose Position 3!");
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (c1.equals("X") && b2.equals("X") && a3.equals("O")) {
                if (!c3.equals("O") && !c3.equals("X")) {
                    c3 = "O";
                    avpos.remove(Integer.valueOf(9));
                    System.out.println("Computer chose Position 9!");
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (c3.equals("X") && b2.equals("X") && a1.equals("O")) {
                if (!c1.equals("O") && !c1.equals("X")) {
                    c1 = "O";
                    avpos.remove(Integer.valueOf(7));
                    System.out.println("Computer chose Position 7!");
                    grid();
                    af = true;
                    return af;
                }
            }
        }
        
        return af;
    }

    public static void main(String[] args) {
        // Initialize game
        initGame();
        
        // Print introduction
        System.out.println("\033[32mWelcome to the Tic Tac Toe game!");
        System.out.println("");
        System.out.println("");
        System.out.println("\033[34mPlease use the following guide for positions to mark on your turn!");
        System.out.println("1 | 2 | 3");
        System.out.println("——————————");
        System.out.println("4 | 5 | 6");
        System.out.println("——————————");
        System.out.println("7 | 8 | 9\033[0m");
        System.out.println("");
        
        // Choose game mode
        while (true) {
            System.out.print("\033[34mWould you like to (S) play single-player versus a Computer, or (D) play a one-versus-one with another player (Enter 'S' or 'D' only): ");
            String choice = scanner.nextLine().toUpperCase();
            if (choice.equals("S")) {
                String hard = "";
                while (true) {
                    // Choose difficulty
                    System.out.print("Would like the difficulty of the Computer to be (E) Easy, (M) Medium, (H) Hard, or (I) Impossible? (Enter 'E','M','H', or 'I' only): ");
                    hard = scanner.nextLine().toUpperCase();
                    System.out.print("\033[0m");
                    if (hard.equals("E") || hard.equals("M") || hard.equals("H") || hard.equals("I")) {
                        break;
                    } else {
                        System.out.println("\033[31mError: Please enter only 'E','M','H', or 'I' as your input!\033[0m\n");
                    }
                }
                
                // Single player mode
                System.out.println();
                
                // IMPOSSIBLE mode
                if (hard.equals("I")) {
                    System.out.println("\033[1m\033[33mCOMPUTER:\033[0m \033[3mAh, so you have decided to challenge me? Let's do this.\033[0m");
                    System.out.println(" ");
                    System.out.print("Enter name of Player 1 (playing X) here: ");
                    p1 = scanner.nextLine();
                    p2 = "Computer";
                    grid();
                    
                    // Player Turn 1
                    int pos;
                    while (true) {
                        try {
                            System.out.print("Your turn, " + p1 + ", enter a position \033[36m(out of " + avpos + ")\033[0m to mark X: ");
                            pos = Integer.parseInt(scanner.nextLine());
                            if (avpos.contains(pos)) {
                                break;
                            } else {
                                System.out.println("\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n");
                            }
                        } catch (NumberFormatException e) {
                            System.out.println("\033[31mError: Please retry with a valid numeric value!\033[0m\n");
                        }
                    }
                    
                    enter_pos("X", pos);
                    System.out.println("");
                    
                    // Engine Turn 1
                    System.out.println("Computer's turn, entering a position \033[36m(out of " + avpos + ")\033[0m to mark O.");
                    if (pos == 1 || pos == 2 || pos == 3 || pos == 4 || pos == 6 || pos == 7 || pos == 8 || pos == 9) {
                        // Player chose a non-center value
                        System.out.println("Computer chose Position 5!");
                        b2 = "O";
                        avpos.remove(Integer.valueOf(5));
                        grid();
                    } else if (pos == 5) {
                        // If Player chose center
                        List<Integer> corner = Arrays.asList(1, 3, 7, 9);
                        int cpos = corner.get(random.nextInt(corner.size()));
                        enter_pos("O", cpos);
                    }
                    System.out.println(" ");
                    
                    // Loop For Turn 2 Onwards
                    while (!end) {
                        // Player Turn 2 onwards
                        while (true) {
                            try {
                                System.out.print("Your turn, " + p1 + ", enter a position \033[36m(out of " + avpos + ")\033[0m to mark X: ");
                                pos = Integer.parseInt(scanner.nextLine());
                                if (avpos.contains(pos)) {
                                    break;
                                } else {
                                    System.out.println("\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n");
                                }
                            } catch (NumberFormatException e) {
                                System.out.println("\033[31mError: Please retry with a valid numeric value!\033[0m\n");
                            }
                        }
                        
                        enter_pos("X", pos);
                        
                        // Check for wins
                        String res = check_win();
                        if (res != null && res.equals("break")) {
                            break;
                        }
                        
                        if (avpos.isEmpty()) {
                            System.out.println("\033[1m\033[33mCOMPUTER:\033[0m \033[3mWhile it may seem like it, we aren't equal, " + p1 + ". Try again.\033[0m\n");
                            System.out.println("\033[32mRESULT: The game was a draw!\033[0m");
                            break;
                        }
                        
                        // AI Turn 2 onwards
                        if (!end) {
                            System.out.println("Computer's turn, entering a position \033[36m(out of " + avpos + ")\033[0m to mark O.");
                            boolean w = win_move(); // Trying to find a winning move
                            if (!w) {
                                boolean b = block_win(); // Blocking immediate threats
                                if (!b) {
                                    boolean a = anti_fork(); // Blocking tactical moves with counter-tactics
                                    if (!a) {
                                        best_move(); // Random move if nothing else works
                                    }
                                }
                            }
                            
                            // Check for wins
                            res = check_win();
                            if (res != null && res.equals("break")) {
                                System.out.println("\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mAt least you tried, " + p1 + ", but you were warned.\033[0m");
                                break;
                            }
                            
                            if (avpos.isEmpty()) {
                                System.out.println("\033[1m\033[33mCOMPUTER:\033[0m \033[3mWhile it may seem like it, we aren't equal, " + p1 + ". Try again.\033[0m\n");
                                System.out.println("\033[32mRESULT: The game was a draw!\033[0m");
                                break;
                            }
                        } else {
                            break;
                        }
                    }
                } 
                // HARD mode
                else if (hard.equals("H")) {
                    System.out.print("Enter name of Player 1 (playing X) here: ");
                    p1 = scanner.nextLine();
                    p2 = "Computer";
                    grid();
                    
                    // Player Turn 1
                    int pos;
                    while (true) {
                        try {
                            System.out.print("Your turn, " + p1 + ", enter a position \033[36m(out of " + avpos + ")\033[0m to mark X: ");
                            pos = Integer.parseInt(scanner.nextLine());
                            if (avpos.contains(pos)) {
                                break;
                            } else {
                                System.out.println("\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n");
                            }
                        } catch (NumberFormatException e) {
                            System.out.println("\033[31mError: Please retry with a valid numeric value!\033[0m\n");
                        }
                    }
                    
                    enter_pos("X", pos);
                    System.out.println("");
                    
                    // Engine Turn 1
                    System.out.println("Computer's turn, entering a position \033[36m(out of " + avpos + ")\033[0m to mark O.");
                    if (pos == 1 || pos == 2 || pos == 3 || pos == 4 || pos == 6 || pos == 7 || pos == 8 || pos == 9) {
                        // Player chose a non-center value
                        System.out.println("Computer chose Position 5!");
                        b2 = "O";
                        avpos.remove(Integer.valueOf(5));
                        grid();
                    } else if (pos == 5) {
                        // If Player chose center
                        int cpos = avpos.get(random.nextInt(avpos.size()));
                        enter_pos("O", cpos);
                    }
                    System.out.println(" ");
                    
                    // Loop For Turn 2 Onwards
                    while (!end) {
                        // Player Turn 2 onwards
                        while (true) {
                            try {
                                System.out.print("Your turn, " + p1 + ", enter a position \033[36m(out of " + avpos + ")\033[0m to mark X: ");
                                pos = Integer.parseInt(scanner.nextLine());
                                if (avpos.contains(pos)) {
                                    break;
                                } else {
                                    System.out.println("\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n");
                                }
                            } catch (NumberFormatException e) {
                                System.out.println("\033[31mError: Please retry with a valid numeric value!\033[0m\n");
                            }
                        }
                        
                        enter_pos("X", pos);
                        
                        // Check for wins
                        String res = check_win();
                        if (res != null && res.equals("break")) {
                            break;
                        }
                        
                        if (avpos.isEmpty()) {
                            System.out.println("\033[32mRESULT: The game was a draw!\033[0m");
                            break;
                        }
                        
                        // Engine Turn 2 onwards
                        if (!end) {
                            System.out.println("Computer's turn, entering a position \033[36m(out of " + avpos + ")\033[0m to mark O.");
                            boolean w = win_move(); // Trying to find a winning move
                            if (!w) {
                                boolean b = block_win(); // Blocking immediate threats
                                if (!b) {
                                    best_move(); // Random move, will occasionally cause Computer to lose
                                }
                            }
                            
                            // Check for wins
                            res = check_win();
                            if (res != null && res.equals("break")) {
                                break;
                            }
                            
                            if (avpos.isEmpty()) {
                                System.out.println("\033[32mRESULT: The game was a draw!\033[0m");
                                break;
                            }
                        } else {
                            break;
                        }
                    }
                }
                // MEDIUM mode
                else if (hard.equals("M")) {
                    System.out.print("Enter name of Player 1 (playing X) here: ");
                    p1 = scanner.nextLine();
                    p2 = "Computer";
                    grid();
                    
                    while (!end) {
                        // Player Turn Loop
                        int pos;
                        while (true) {
                            try {
                                System.out.print("Your turn, " + p1 + ", enter a position \033[36m(out of " + avpos + ")\033[0m to mark X: ");
                                pos = Integer.parseInt(scanner.nextLine());
                                if (avpos.contains(pos)) {
                                    break;
                                } else {
                                    System.out.println("\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n");
                                }
                            } catch (NumberFormatException e) {
                                System.out.println("\033[31mError: Please retry with a valid numeric value!\033[0m\n");
                            }
                        }
                        
                        enter_pos("X", pos);
                        
                        // Check for wins
                        String res = check_win();
                        if (res != null && res.equals("break")) {
                            break;
                        }
                        
                        if (avpos.isEmpty()) {
                            System.out.println("\033[32mRESULT: The game was a draw!\033[0m");
                            break;
                        }
                        
                        // Computer Turn
                        System.out.println("Computer's turn, entering a position \033[36m(out of " + avpos + ")\033[0m to mark O.");
                        boolean b = block_win(); // Blocking immediate threats
                        if (!b) {
                            best_move(); // Just randomizing, if unable to block. Loss likely.
                        }
                        
                        // Check for wins
                        res = check_win();
                        if (res != null && res.equals("break")) {
                            break;
                        }
                        
                        if (avpos.isEmpty()) {
                            System.out.println("\033[32mRESULT: The game was a draw!\033[0m");
                            break;
                        }
                    }
                }
                // EASY mode
                else if (hard.equals("E")) {
                    System.out.print("Enter name of Player 1 (playing X) here: ");
                    p1 = scanner.nextLine();
                    p2 = "Computer";
                    grid();
                    
                    while (!end) {
                        // Player Turn Loop
                        int pos;
                        while (true) {
                            try {
                                System.out.print("Your turn, " + p1 + ", enter a position \033[36m(out of " + avpos + ")\033[0m to mark X: ");
                                pos = Integer.parseInt(scanner.nextLine());
                                if (avpos.contains(pos)) {
                                    break;
                                } else {
                                    System.out.println("\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n");
                                }
                            } catch (NumberFormatException e) {
                                System.out.println("\033[31mError: Please retry with a valid numeric value!\033[0m\n");
                            }
                        }
                        
                        enter_pos("X", pos);
                        
                        // Check for wins
                        String res = check_win();
                        if (res != null && res.equals("break")) {
                            break;
                        }
                        
                        if (avpos.isEmpty()) {
                            System.out.println("\033[32mRESULT: The game was a draw!\033[0m");
                            break;
                        }
                        
                        // Computer Turn
                        System.out.println("Computer's turn, entering a position \033[36m(out of " + avpos + ")\033[0m to mark O.");
                        best_move(); // Completely random moves, Computer should lose in almost all cases.
                        
                        // Check for wins
                        res = check_win();
                        if (res != null && res.equals("break")) {
                            break;
                        }
                        
                        if (avpos.isEmpty()) {
                            System.out.println("\033[32mRESULT: The game was a draw!\033[0m");
                            break;
                        }
                    }
                }
            } 
            // Multiplayer mode
            else if (choice.equals("D")) {
                System.out.println(" ");
                System.out.print("Enter name of Player 1 (playing X) here: ");
                p1 = scanner.nextLine();
                System.out.print("Enter name of Player 2 (playing O) here: ");
                p2 = scanner.nextLine();
                grid();
                
                while (!end) {
                    // Player 1's Turn
                    int pos;
                    while (true) {
                        try {
                            System.out.print("Your turn, " + p1 + ", enter a position (out of " + avpos + ") to mark X: ");
                            pos = Integer.parseInt(scanner.nextLine());
                            if (avpos.contains(pos)) {
                                break;
                            } else {
                                System.out.println("\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n");
                            }
                        } catch (NumberFormatException e) {
                            System.out.println("\033[31mError: Please retry with a valid numeric value!\033[0m\n");
                        }
                    }
                    enter_pos("X", pos);
                    
                    // Check for wins
                    String res = check_win();
                    if (res != null && res.equals("break")) {
                        break;
                    }
                    
                    if (avpos.isEmpty()) {
                        System.out.println("\033[32mRESULT: The game was a draw!\033[0m");
                        break;
                    }
                    
                    // Player 2's Turn
                    while (true) {
                        try {
                            System.out.print("Your turn, " + p2 + ", enter a position (out of " + avpos + ") to mark O: ");
                            pos = Integer.parseInt(scanner.nextLine());
                            if (avpos.contains(pos)) {
                                break;
                            } else {
                                System.out.println("\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n");
                            }
                        } catch (NumberFormatException e) {
                            System.out.println("\033[31mError: Please retry with a valid numeric value!\033[0m\n");
                        }
                    }
                    enter_pos("O", pos);
                    
                    // Check for wins
                    res = check_win();
                    if (res != null && res.equals("break")) {
                        break;
                    }
                    
                    if (avpos.isEmpty()) {
                        System.out.println("\033[32mRESULT: The game was a draw!\033[0m");
                        break;
                    }
                }
                break;
            } else {
                System.out.println("\033[31mError: Please enter only 'S' or 'D' as your input!\033[0m\n");
            }
            
            // Exit the mode selection loop once a mode is selected and completed
            break;
        }
        
        // Close the scanner at the end of the program
        scanner.close();
    }
}