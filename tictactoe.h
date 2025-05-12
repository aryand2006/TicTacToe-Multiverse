#ifndef TICTACTOE_H
#define TICTACTOE_H

#include <iostream>
#include <vector>
#include <random>
#include <algorithm>
#include <string>
#include <chrono>

class TicTacToe {
private:
    // Game board representation
    char a1, a2, a3, b1, b2, b3, c1, c2, c3;
    
    // Available positions
    std::vector<int> avpos;
    
    // Game state flags
    bool af, nb, bm, moved, end;
    
    // Player names
    std::string p1, p2;
    
    // Game difficulty and mode
    char difficulty;
    char mode;
    
    // Random generator
    std::mt19937 rng;

    // Print the current grid state
    void grid() {
        std::cout << "\033[34m" << std::endl;
        std::cout << a1 << " | " << a2 << " | " << a3 << std::endl;
        std::cout << "——————————" << std::endl;
        std::cout << b1 << " | " << b2 << " | " << b3 << std::endl;
        std::cout << "——————————" << std::endl;
        std::cout << c1 << " | " << c2 << " | " << c3 << std::endl;
        std::cout << "\033[0m" << std::endl;
    }
    
    // Enter a mark at a position
    void enter_pos(char mark, int pos) {
        if (pos == 1) {
            a1 = mark;
            removePosition(1);
            grid();
        }
        if (pos == 2) {
            a2 = mark;
            removePosition(2);
            grid();
        }
        if (pos == 3) {
            a3 = mark;
            removePosition(3);
            grid();
        }
        if (pos == 4) {
            b1 = mark;
            removePosition(4);
            grid();
        }
        if (pos == 5) {
            b2 = mark;
            removePosition(5);
            grid();
        }
        if (pos == 6) {
            b3 = mark;
            removePosition(6);
            grid();
        }
        if (pos == 7) {
            c1 = mark;
            removePosition(7);
            grid();
        }
        if (pos == 8) {
            c2 = mark;
            removePosition(8);
            grid();
        }
        if (pos == 9) {
            c3 = mark;
            removePosition(9);
            grid();
        }
    }
    
    // Remove a position from available positions
    void removePosition(int pos) {
        avpos.erase(std::remove(avpos.begin(), avpos.end(), pos), avpos.end());
    }
    
    // Check if a player has won
    bool check_win() {
        end = false;
        std::cout << "" << std::endl;
        
        // Horizontal Win (X)
        if (a1 == 'X' && a2 == 'X' && a3 == 'X') {
            std::cout << "\033[32mRESULT: " << p1 << " won the game!\033[0m" << std::endl;
            end = true;
        }
        if (b1 == 'X' && b2 == 'X' && b3 == 'X') {
            std::cout << "\033[32mRESULT: " << p1 << " won the game!\033[0m" << std::endl;
            end = true;
        }
        if (c1 == 'X' && c2 == 'X' && c3 == 'X') {
            std::cout << "\033[32mRESULT: " << p1 << " won the game!\033[0m" << std::endl;
            end = true;
        }
        
        // Vertical Win (X)
        if (a1 == 'X' && b1 == 'X' && c1 == 'X') {
            std::cout << "\033[32mRESULT: " << p1 << " won the game!\033[0m" << std::endl;
            end = true;
        }
        if (a2 == 'X' && b2 == 'X' && c2 == 'X') {
            std::cout << "\033[32mRESULT: " << p1 << " won the game!\033[0m" << std::endl;
            end = true;
        }
        if (a3 == 'X' && b3 == 'X' && c3 == 'X') {
            std::cout << "\033[32mRESULT: " << p1 << " won the game!\033[0m" << std::endl;
            end = true;
        }
        
        // Diagonal Win (X)
        if (a1 == 'X' && b2 == 'X' && c3 == 'X') {
            std::cout << "\033[32mRESULT: " << p1 << " won the game!\033[0m" << std::endl;
            end = true;
        }
        if (a3 == 'X' && b2 == 'X' && c1 == 'X') {
            std::cout << "\033[32mRESULT: " << p1 << " won the game!\033[0m" << std::endl;
            end = true;
        }
        
        // Horizontal Win (O)
        if (a1 == 'O' && a2 == 'O' && a3 == 'O') {
            std::cout << "\033[32mRESULT: " << p2 << " won the game!\033[0m" << std::endl;
            end = true;
        }
        if (b1 == 'O' && b2 == 'O' && b3 == 'O') {
            std::cout << "\033[32mRESULT: " << p2 << " won the game!\033[0m" << std::endl;
            end = true;
        }
        if (c1 == 'O' && c2 == 'O' && c3 == 'O') {
            std::cout << "\033[32mRESULT: " << p2 << " won the game!\033[0m" << std::endl;
            end = true;
        }
        
        // Vertical Win (O)
        if (a1 == 'O' && b1 == 'O' && c1 == 'O') {
            std::cout << "\033[32mRESULT: " << p2 << " won the game!\033[0m" << std::endl;
            end = true;
        }
        if (a2 == 'O' && b2 == 'O' && c2 == 'O') {
            std::cout << "\033[32mRESULT: " << p2 << " won the game!\033[0m" << std::endl;
            end = true;
        }
        if (a3 == 'O' && b3 == 'O' && c3 == 'O') {
            std::cout << "\033[32mRESULT: " << p2 << " won the game!\033[0m" << std::endl;
            end = true;
        }
        
        // Diagonal Win (O)
        if (a1 == 'O' && b2 == 'O' && c3 == 'O') {
            std::cout << "\033[32mRESULT: " << p2 << " won the game!\033[0m" << std::endl;
            end = true;
        }
        if (a3 == 'O' && b2 == 'O' && c1 == 'O') {
            std::cout << "\033[32mRESULT: " << p2 << " won the game!\033[0m" << std::endl;
            end = true;
        }
        
        return end;
    }
    
    // Computer tries to block player from winning
    bool block_win() {
        nb = false;
        
        // Check for potential horizontal wins
        if ((a2 == 'X' && a3 == 'X') || (b1 == 'X' && c1 == 'X') || (b2 == 'X' && c3 == 'X')) {
            if (a1 != 'O' && a1 != 'X') {
                a1 = 'O';
                removePosition(1);
                std::cout << "Computer chose Position 1!" << std::endl;
                grid();
                nb = true;
                return nb;
            }
        }
        
        if ((a1 == 'X' && a3 == 'X') || (b2 == 'X' && c2 == 'X')) {
            if (a2 != 'O' && a2 != 'X') {
                a2 = 'O';
                removePosition(2);
                std::cout << "Computer chose Position 2!" << std::endl;
                grid();
                nb = true;
                return nb;
            }
        }
        
        if ((a1 == 'X' && a2 == 'X') || (b2 == 'X' && c1 == 'X') || (b3 == 'X' && c3 == 'X')) {
            if (a3 != 'O' && a3 != 'X') {
                a3 = 'O';
                removePosition(3);
                std::cout << "Computer chose Position 3!" << std::endl;
                grid();
                nb = true;
                return nb;
            }
        }
        
        if ((a1 == 'X' && c1 == 'X') || (b2 == 'X' && b3 == 'X')) {
            if (b1 != 'O' && b1 != 'X') {
                b1 = 'O';
                removePosition(4);
                std::cout << "Computer chose Position 4!" << std::endl;
                grid();
                nb = true;
                return nb;
            }
        }
        
        if ((a1 == 'X' && c3 == 'X') || (a2 == 'X' && c2 == 'X') || (a3 == 'X' && c1 == 'X') || (b1 == 'X' && b3 == 'X')) {
            if (b2 != 'O' && b2 != 'X') {
                b2 = 'O';
                removePosition(5);
                std::cout << "Computer chose Position 5!" << std::endl;
                grid();
                nb = true;
                return nb;
            }
        }
        
        if ((a3 == 'X' && c3 == 'X') || (b1 == 'X' && b2 == 'X')) {
            if (b3 != 'O' && b3 != 'X') {
                b3 = 'O';
                removePosition(6);
                std::cout << "Computer chose Position 6!" << std::endl;
                grid();
                nb = true;
                return nb;
            }
        }
        
        if ((a1 == 'X' && b1 == 'X') || (c2 == 'X' && c3 == 'X') || (a3 == 'X' && b2 == 'X')) {
            if (c1 != 'O' && c1 != 'X') {
                c1 = 'O';
                removePosition(7);
                std::cout << "Computer chose Position 7!" << std::endl;
                grid();
                nb = true;
                return nb;
            }
        }
        
        if ((a2 == 'X' && b2 == 'X') || (c1 == 'X' && c3 == 'X')) {
            if (c2 != 'O' && c2 != 'X') {
                c2 = 'O';
                removePosition(8);
                std::cout << "Computer chose Position 8!" << std::endl;
                grid();
                nb = true;
                return nb;
            }
        }
        
        if ((a3 == 'X' && b3 == 'X') || (a1 == 'X' && b2 == 'X') || (c1 == 'X' && c2 == 'X')) {
            if (c3 != 'O' && c3 != 'X') {
                c3 = 'O';
                removePosition(9);
                std::cout << "Computer chose Position 9!" << std::endl;
                grid();
                nb = true;
                return nb;
            }
        }
        
        return nb;
    }
    
    // Computer tries to make a winning move
    bool win_move() {
        moved = false;
        
        // Check for potential horizontal wins
        if ((a2 == 'O' && a3 == 'O') || (b1 == 'O' && c1 == 'O') || (b2 == 'O' && c3 == 'O')) {
            if (a1 != 'O' && a1 != 'X') {
                a1 = 'O';
                removePosition(1);
                std::cout << "Computer chose Position 1!" << std::endl;
                grid();
                moved = true;
                return moved;
            }
        }
        
        if ((a1 == 'O' && a3 == 'O') || (b2 == 'O' && c2 == 'O')) {
            if (a2 != 'O' && a2 != 'X') {
                a2 = 'O';
                removePosition(2);
                std::cout << "Computer chose Position 2!" << std::endl;
                grid();
                moved = true;
                return moved;
            }
        }
        
        if ((a1 == 'O' && a2 == 'O') || (b2 == 'O' && c1 == 'O') || (b3 == 'O' && c3 == 'O')) {
            if (a3 != 'O' && a3 != 'X') {
                a3 = 'O';
                removePosition(3);
                std::cout << "Computer chose Position 3!" << std::endl;
                grid();
                moved = true;
                return moved;
            }
        }
        
        if ((a1 == 'O' && c1 == 'O') || (b2 == 'O' && b3 == 'O')) {
            if (b1 != 'O' && b1 != 'X') {
                b1 = 'O';
                removePosition(4);
                std::cout << "Computer chose Position 4!" << std::endl;
                grid();
                moved = true;
                return moved;
            }
        }
        
        if ((a1 == 'O' && c3 == 'O') || (a2 == 'O' && c2 == 'O') || (a3 == 'O' && c1 == 'O') || (b1 == 'O' && b3 == 'O')) {
            if (b2 != 'O' && b2 != 'X') {
                b2 = 'O';
                removePosition(5);
                std::cout << "Computer chose Position 5!" << std::endl;
                grid();
                moved = true;
                return moved;
            }
        }
        
        if ((a3 == 'O' && c3 == 'O') || (b1 == 'O' && b2 == 'O')) {
            if (b3 != 'O' && b3 != 'X') {
                b3 = 'O';
                removePosition(6);
                std::cout << "Computer chose Position 6!" << std::endl;
                grid();
                moved = true;
                return moved;
            }
        }
        
        if ((a1 == 'O' && b1 == 'O') || (c2 == 'O' && c3 == 'O') || (a3 == 'O' && b2 == 'O')) {
            if (c1 != 'O' && c1 != 'X') {
                c1 = 'O';
                removePosition(7);
                std::cout << "Computer chose Position 7!" << std::endl;
                grid();
                moved = true;
                return moved;
            }
        }
        
        if ((a2 == 'O' && b2 == 'O') || (c1 == 'O' && c3 == 'O')) {
            if (c2 != 'O' && c2 != 'X') {
                c2 = 'O';
                removePosition(8);
                std::cout << "Computer chose Position 8!" << std::endl;
                grid();
                moved = true;
                return moved;
            }
        }
        
        if ((a3 == 'O' && b3 == 'O') || (a1 == 'O' && b2 == 'O') || (c1 == 'O' && c2 == 'O')) {
            if (c3 != 'O' && c3 != 'X') {
                c3 = 'O';
                removePosition(9);
                std::cout << "Computer chose Position 9!" << std::endl;
                grid();
                moved = true;
                return moved;
            }
        }
        
        return moved;
    }
    
    // Computer makes a random move
    bool best_move() {
        bm = false;
        
        if (!nb && !moved) {
            std::uniform_int_distribution<int> dist(0, avpos.size() - 1);
            int idx = dist(rng);
            int ranpos = avpos[idx];
            
            if (ranpos == 1) {
                a1 = 'O';
                removePosition(1);
                std::cout << "Computer chose Position " << ranpos << "!" << std::endl;
                grid();
                bm = true;
                return bm;
            }
            if (ranpos == 2) {
                a2 = 'O';
                removePosition(2);
                std::cout << "Computer chose Position " << ranpos << "!" << std::endl;
                grid();
                bm = true;
                return bm;
            }
            if (ranpos == 3) {
                a3 = 'O';
                removePosition(3);
                std::cout << "Computer chose Position " << ranpos << "!" << std::endl;
                grid();
                bm = true;
                return bm;
            }
            if (ranpos == 4) {
                b1 = 'O';
                removePosition(4);
                std::cout << "Computer chose Position " << ranpos << "!" << std::endl;
                grid();
                bm = true;
                return bm;
            }
            if (ranpos == 5) {
                b2 = 'O';
                removePosition(5);
                std::cout << "Computer chose Position " << ranpos << "!" << std::endl;
                grid();
                bm = true;
                return bm;
            }
            if (ranpos == 6) {
                b3 = 'O';
                removePosition(6);
                std::cout << "Computer chose Position " << ranpos << "!" << std::endl;
                grid();
                bm = true;
                return bm;
            }
            if (ranpos == 7) {
                c1 = 'O';
                removePosition(7);
                std::cout << "Computer chose Position " << ranpos << "!" << std::endl;
                grid();
                bm = true;
                return bm;
            }
            if (ranpos == 8) {
                c2 = 'O';
                removePosition(8);
                std::cout << "Computer chose Position " << ranpos << "!" << std::endl;
                grid();
                bm = true;
                return bm;
            }
            if (ranpos == 9) {
                c3 = 'O';
                removePosition(9);
                std::cout << "Computer chose Position " << ranpos << "!" << std::endl;
                grid();
                bm = true;
                return bm;
            }
        }
        return bm;
    }
    
    // Computer tries to counter fork situations
    bool anti_fork() {
        af = false;
        
        if (b2 == 'O') {
            // X-O-X series (diagonal, rotated)
            if (a3 == 'X' && c1 == 'X' && b2 == 'O') {
                std::vector<int> r = {2, 4, 6, 8};
                std::uniform_int_distribution<int> dist(0, r.size() - 1);
                int idx = dist(rng);
                int rc = r[idx];
                
                if (rc == 2) {
                    if (a2 != 'O' && a2 != 'X') {
                        a2 = 'O';
                        removePosition(2);
                        std::cout << "Computer chose Position 2!" << std::endl;
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (rc == 4) {
                    if (b1 != 'O' && b1 != 'X') {
                        b1 = 'O';
                        removePosition(4);
                        std::cout << "Computer chose Position 4!" << std::endl;
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (rc == 6) {
                    if (b3 != 'O' && b3 != 'X') {
                        b3 = 'O';
                        removePosition(6);
                        std::cout << "Computer chose Position 6!" << std::endl;
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (rc == 8) {
                    if (c2 != 'O' && c2 != 'X') {
                        c2 = 'O';
                        removePosition(8);
                        std::cout << "Computer chose Position 8!" << std::endl;
                        grid();
                        af = true;
                        return af;
                    }
                }
            }
            
            if (a1 == 'X' && c3 == 'X' && b2 == 'O') {
                std::vector<int> r = {2, 4, 6, 8};
                std::uniform_int_distribution<int> dist(0, r.size() - 1);
                int idx = dist(rng);
                int rc = r[idx];
                
                if (rc == 2) {
                    if (a2 != 'O' && a2 != 'X') {
                        a2 = 'O';
                        removePosition(2);
                        std::cout << "Computer chose Position 2!" << std::endl;
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (rc == 4) {
                    if (b1 != 'O' && b1 != 'X') {
                        b1 = 'O';
                        removePosition(4);
                        std::cout << "Computer chose Position 4!" << std::endl;
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (rc == 6) {
                    if (b3 != 'O' && b3 != 'X') {
                        b3 = 'O';
                        removePosition(6);
                        std::cout << "Computer chose Position 6!" << std::endl;
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (rc == 8) {
                    if (c2 != 'O' && c2 != 'X') {
                        c2 = 'O';
                        removePosition(8);
                        std::cout << "Computer chose Position 8!" << std::endl;
                        grid();
                        af = true;
                        return af;
                    }
                }
            }
            
            // X-O-X series (L-structure, rotated)
            if (a2 == 'X' && b1 == 'X' && b2 == 'O') {
                if (a1 != 'O' && a1 != 'X') {
                    a1 = 'O';
                    removePosition(1);
                    std::cout << "Computer chose Position 1!" << std::endl;
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (b1 == 'X' && c2 == 'X' && b2 == 'O') {
                if (c1 != 'O' && c1 != 'X') {
                    c1 = 'O';
                    removePosition(7);
                    std::cout << "Computer chose Position 7!" << std::endl;
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (c2 == 'X' && b3 == 'X' && b2 == 'O') {
                if (c3 != 'O' && c3 != 'X') {
                    c3 = 'O';
                    removePosition(9);
                    std::cout << "Computer chose Position 9!" << std::endl;
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (b2 == 'O' && a2 == 'X') {
                if (a3 != 'O' && a3 != 'X') {
                    a3 = 'O';
                    removePosition(3);
                    std::cout << "Computer chose Position 3!" << std::endl;
                    grid();
                    af = true;
                    return af;
                }
            }
            
            // Many more anti-fork patterns following the same logic
            // X-O-X series (angled upward, rotated)
            if (b1 == 'X' && a3 == 'X' && b2 == 'O') {
                if (a1 != 'O' && a1 != 'X') {
                    a1 = 'O';
                    removePosition(1);
                    std::cout << "Computer chose Position 1!" << std::endl;
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (a1 == 'X' && c2 == 'X' && b2 == 'O') {
                if (c1 != 'O' && c1 != 'X') {
                    c1 = 'O';
                    removePosition(7);
                    std::cout << "Computer chose Position 7!" << std::endl;
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (c1 == 'X' && b3 == 'X' && b2 == 'O') {
                if (c3 != 'O' && c3 != 'X') {
                    c3 = 'O';
                    removePosition(9);
                    std::cout << "Computer chose Position 9!" << std::endl;
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (c3 == 'X' && a2 == 'X' && b2 == 'O') {
                if (a3 != 'O' && a3 != 'X') {
                    a3 = 'O';
                    removePosition(3);
                    std::cout << "Computer chose Position 3!" << std::endl;
                    grid();
                    af = true;
                    return af;
                }
            }
            
            // X-O-X series (angled downward, rotated)
            if (b1 == 'X' && c3 == 'X' && b2 == 'O') {
                if (c1 != 'O' && c1 != 'X') {
                    c1 = 'O';
                    removePosition(7);
                    std::cout << "Computer chose Position 7!" << std::endl;
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (c2 == 'X' && a3 == 'X' && b2 == 'O') {
                if (c3 != 'O' && c3 != 'X') {
                    c3 = 'O';
                    removePosition(9);
                    std::cout << "Computer chose Position 9!" << std::endl;
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (a1 == 'X' && b3 == 'X' && b2 == 'O') {
                if (a3 != 'O' && a3 != 'X') {
                    a3 = 'O';
                    removePosition(3);
                    std::cout << "Computer chose Position 3!" << std::endl;
                    grid();
                    af = true;
                    return af;
                }
            }
            
            if (c1 == 'X' && a2 == 'X' && b2 == 'O') {
                if (a1 != 'O' && a1 != 'X') {
                    a1 = 'O';
                    removePosition(1);
                    std::cout << "Computer chose Position 1!" << std::endl;
                    grid();
                    af = true;
                    return af;
                }
            }
        }
        
        if (b2 == 'X') {
            // X-X-O series (vertical and horizontal, rotated)
            if (b2 == 'X' && a2 == 'X' && c2 == 'O') {
                std::vector<int> r = {7, 9};
                std::uniform_int_distribution<int> dist(0, r.size() - 1);
                int idx = dist(rng);
                int c = r[idx];
                
                if (c == 7) {
                    if (c1 != 'O' && c1 != 'X') {
                        c1 = 'O';
                        removePosition(7);
                        std::cout << "Computer chose Position " << c << "!" << std::endl;
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (c == 9) {
                    if (c3 != 'O' && c3 != 'X') {
                        c3 = 'O';
                        removePosition(9);
                        std::cout << "Computer chose Position " << c << "!" << std::endl;
                        grid();
                        af = true;
                        return af;
                    }
                }
            }
            
            if (b2 == 'X' && b3 == 'X' && b1 == 'O') {
                std::vector<int> r = {1, 7};
                std::uniform_int_distribution<int> dist(0, r.size() - 1);
                int idx = dist(rng);
                int c = r[idx];
                
                if (c == 1) {
                    if (a1 != 'O' && a1 != 'X') {
                        a1 = 'O';
                        removePosition(1);
                        std::cout << "Computer chose Position " << c << "!" << std::endl;
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (c == 7) {
                    if (c1 != 'O' && c1 != 'X') {
                        c1 = 'O';
                        removePosition(7);
                        std::cout << "Computer chose Position " << c << "!" << std::endl;
                        grid();
                        af = true;
                        return af;
                    }
                }
            }
            
            if (b2 == 'X' && c3 == 'X' && a2 == 'O') {
                std::vector<int> r = {1, 3};
                std::uniform_int_distribution<int> dist(0, r.size() - 1);
                int idx = dist(rng);
                int c = r[idx];
                
                if (c == 1) {
                    if (a1 != 'O' && a1 != 'X') {
                        a1 = 'O';
                        removePosition(1);
                        std::cout << "Computer chose Position " << c << "!" << std::endl;
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (c == 3) {
                    if (a3 != 'O' && a3 != 'X') {
                        a3 = 'O';
                        removePosition(3);
                        std::cout << "Computer chose Position " << c << "!" << std::endl;
                        grid();
                        af = true;
                        return af;
                    }
                }
            }
            
            if (b2 == 'X' && b3 == 'X' && b1 == 'O') {
                std::vector<int> r = {1, 7};
                std::uniform_int_distribution<int> dist(0, r.size() - 1);
                int idx = dist(rng);
                int c = r[idx];
                
                if (c == 1) {
                    if (a1 != 'O' && a1 != 'X') {
                        a1 = 'O';
                        removePosition(1);
                        std::cout << "Computer chose Position " << c << "!" << std::endl;
                        grid();
                        af = true;
                        return af;
                    }
                }
                if (c == 7) {
                    if (c1 != 'O' && c1 != 'X') {
                        c1 = 'O';
                        removePosition(7);
                        std::cout << "Computer chose Position " << c << "!" << std::endl;
                        grid();
                        af = true;
                        return af;
                    }
                }
            }
        }
        
        return af;
    }

public:
    // Constructor
    TicTacToe() : rng(std::chrono::steady_clock::now().time_since_epoch().count()) {
        reset();
    }

    // Reset the game state
    void reset() {
        a1 = a2 = a3 = b1 = b2 = b3 = c1 = c2 = c3 = ' ';
        avpos = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        af = nb = bm = moved = end = false;
    }

    // Play the game
    void playGame() {
        reset();
        
        // Print introduction
        std::cout << "\033[32mWelcome to the Tic Tac Toe game!" << std::endl;
        std::cout << std::endl;
        std::cout << std::endl;
        std::cout << "\033[34mPlease use the following guide for positions to mark on your turn!" << std::endl;
        std::cout << "1 | 2 | 3" << std::endl;
        std::cout << "——————————" << std::endl;
        std::cout << "4 | 5 | 6" << std::endl;
        std::cout << "——————————" << std::endl;
        std::cout << "7 | 8 | 9\033[0m" << std::endl;
        std::cout << std::endl;

        // Choose game mode
        while (true) {
            std::cout << "\033[34m";
            std::cout << "Would you like to (S) play single-player versus a Computer, or (D) play a one-versus-one with another player (Enter 'S' or 'D' only): ";
            std::cin >> mode;
            mode = toupper(mode);
            
            if (mode == 'S' || mode == 'D') {
                break;
            } else {
                std::cout << "\033[31mError: Please enter only 'S' or 'D' as your input!\033[0m\n" << std::endl;
            }
        }
        
        // Single player mode
        if (mode == 'S') {
            // Choose difficulty
            while (true) {
                std::cout << "Would like the difficulty of the Computer to be (E) Easy, (M) Medium, (H) Hard, or (I) Impossible? (Enter 'E','M','H', or 'I' only): ";
                std::cin >> difficulty;
                difficulty = toupper(difficulty);
                std::cout << "\033[0m";
                
                if (difficulty == 'E' || difficulty == 'M' || difficulty == 'H' || difficulty == 'I') {
                    break;
                } else {
                    std::cout << "\033[31mError: Please enter only 'E','M','H', or 'I' as your input!\033[0m\n" << std::endl;
                }
            }
            
            std::cout << std::endl;
            
            // Get player name
            std::cout << " " << std::endl;
            if (difficulty == 'I') {
                std::cout << "\033[1m\033[33mCOMPUTER:\033[0m \033[3mAh, so you have decided to challenge me? Let's do this.\033[0m" << std::endl;
                std::cout << " " << std::endl;
            }
            
            std::cout << "Enter name of Player 1 (playing X) here: ";
            std::cin.ignore(); // Clear input buffer
            std::getline(std::cin, p1);
            p2 = "Computer";
            grid();
            
            // Handle Impossible difficulty first turn
            if (difficulty == 'I' || difficulty == 'H') {
                // Player turn 1
                int pos;
                while (true) {
                    try {
                        std::cout << "Your turn, " << p1 << ", enter a position \033[36m(out of ";
                        for (size_t i = 0; i < avpos.size(); i++) {
                            std::cout << avpos[i];
                            if (i < avpos.size() - 1) std::cout << ", ";
                        }
                        std::cout << ")\033[0m to mark X: ";
                        std::cin >> pos;
                        
                        if (std::find(avpos.begin(), avpos.end(), pos) != avpos.end()) {
                            break;
                        } else {
                            std::cout << "\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n" << std::endl;
                        }
                    } catch (...) {
                        std::cout << "\033[31mError: Please retry with a valid numeric value!\033[0m\n" << std::endl;
                        std::cin.clear();
                        std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
                    }
                }
                enter_pos('X', pos);
                std::cout << std::endl;
                
                // Computer turn 1
                std::cout << "Computer's turn, entering a position \033[36m(out of ";
                for (size_t i = 0; i < avpos.size(); i++) {
                    std::cout << avpos[i];
                    if (i < avpos.size() - 1) std::cout << ", ";
                }
                std::cout << ")\033[0m to mark O." << std::endl;
                
                if (pos != 5) {
                    std::cout << "Computer chose Position 5!" << std::endl;
                    b2 = 'O';
                    removePosition(5);
                    grid();
                } else {
                    std::vector<int> corners = {1, 3, 7, 9};
                    std::uniform_int_distribution<int> dist(0, corners.size() - 1);
                    int idx = dist(rng);
                    enter_pos('O', corners[idx]);
                }
                std::cout << " " << std::endl;
                
                // Loop for turns 2 onwards
                while (!end) {
                    // Player turn
                    while (true) {
                        try {
                            std::cout << "Your turn, " << p1 << ", enter a position \033[36m(out of ";
                            for (size_t i = 0; i < avpos.size(); i++) {
                                std::cout << avpos[i];
                                if (i < avpos.size() - 1) std::cout << ", ";
                            }
                            std::cout << ")\033[0m to mark X: ";
                            std::cin >> pos;
                            
                            if (std::find(avpos.begin(), avpos.end(), pos) != avpos.end()) {
                                break;
                            } else {
                                std::cout << "\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n" << std::endl;
                            }
                        } catch (...) {
                            std::cout << "\033[31mError: Please retry with a valid numeric value!\033[0m\n" << std::endl;
                            std::cin.clear();
                            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
                        }
                    }
                    enter_pos('X', pos);
                    
                    // Check for win
                    if (check_win()) {
                        if (difficulty == 'I') {
                            std::cout << "\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mAt least you tried, " << p1 << ", but you were warned.\033[0m" << std::endl;
                        }
                        break;
                    }
                    
                    if (avpos.empty()) {
                        if (difficulty == 'I') {
                            std::cout << "\033[1m\033[33mCOMPUTER:\033[0m \033[3mWhile it may seem like it, we aren't equal, " << p1 << ". Try again.\033[0m\n" << std::endl;
                        }
                        std::cout << "\033[32mRESULT: The game was a draw!\033[0m" << std::endl;
                        break;
                    }
                    
                    // Computer turn
                    if (!end) {
                        std::cout << "Computer's turn, entering a position \033[36m(out of ";
                        for (size_t i = 0; i < avpos.size(); i++) {
                            std::cout << avpos[i];
                            if (i < avpos.size() - 1) std::cout << ", ";
                        }
                        std::cout << ")\033[0m to mark O." << std::endl;
                        
                        moved = win_move(); // Try to win
                        
                        if (!moved) {
                            nb = block_win(); // Block player win
                            
                            if (!nb && difficulty == 'I') {
                                af = anti_fork(); // Block forks in Impossible mode
                            }
                            
                            if ((!nb && !af) || (difficulty != 'I' && !nb)) {
                                best_move(); // Random move
                            }
                        }
                        
                        // Check for win
                        if (check_win()) {
                            if (difficulty == 'I') {
                                std::cout << "\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mAt least you tried, " << p1 << ", but you were warned.\033[0m" << std::endl;
                            }
                            break;
                        }
                        
                        if (avpos.empty()) {
                            if (difficulty == 'I') {
                                std::cout << "\033[1m\033[33mCOMPUTER:\033[0m \033[3mWhile it may seem like it, we aren't equal, " << p1 << ". Try again.\033[0m\n" << std::endl;
                            }
                            std::cout << "\033[32mRESULT: The game was a draw!\033[0m" << std::endl;
                            break;
                        }
                    }
                }
            } 
            else { // Medium/Easy mode
                // Main game loop
                while (!end) {
                    // Player turn
                    int pos;
                    while (true) {
                        try {
                            std::cout << "Your turn, " << p1 << ", enter a position \033[36m(out of ";
                            for (size_t i = 0; i < avpos.size(); i++) {
                                std::cout << avpos[i];
                                if (i < avpos.size() - 1) std::cout << ", ";
                            }
                            std::cout << ")\033[0m to mark X: ";
                            std::cin >> pos;
                            
                            if (std::find(avpos.begin(), avpos.end(), pos) != avpos.end()) {
                                break;
                            } else {
                                std::cout << "\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n" << std::endl;
                            }
                        } catch (...) {
                            std::cout << "\033[31mError: Please retry with a valid numeric value!\033[0m\n" << std::endl;
                            std::cin.clear();
                            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
                        }
                    }
                    enter_pos('X', pos);
                    
                    // Check for win
                    if (check_win()) {
                        break;
                    }
                    
                    if (avpos.empty()) {
                        std::cout << "\033[32mRESULT: The game was a draw!\033[0m" << std::endl;
                        break;
                    }
                    
                    // Computer turn
                    std::cout << "Computer's turn, entering a position \033[36m(out of ";
                    for (size_t i = 0; i < avpos.size(); i++) {
                        std::cout << avpos[i];
                        if (i < avpos.size() - 1) std::cout << ", ";
                    }
                    std::cout << ")\033[0m to mark O." << std::endl;
                    
                    if (difficulty == 'M') {
                        nb = block_win(); // Only block in medium mode
                    }
                    
                    if ((difficulty == 'E') || (difficulty == 'M' && !nb)) {
                        best_move(); // Random move
                    }
                    
                    // Check for win
                    if (check_win()) {
                        break;
                    }
                    
                    if (avpos.empty()) {
                        std::cout << "\033[32mRESULT: The game was a draw!\033[0m" << std::endl;
                        break;
                    }
                }
            }
        }
        // Multiplayer mode
        else if (mode == 'D') {
            // Get player names
            std::cout << " " << std::endl;
            std::cout << "Enter name of Player 1 (playing X) here: ";
            std::cin.ignore(); // Clear input buffer
            std::getline(std::cin, p1);
            
            std::cout << "Enter name of Player 2 (playing O) here: ";
            std::getline(std::cin, p2);
            
            grid();
            
            // Main game loop
            while (!end) {
                // Player 1 turn
                int pos;
                while (true) {
                    try {
                        std::cout << "Your turn, " << p1 << ", enter a position (out of ";
                        for (size_t i = 0; i < avpos.size(); i++) {
                            std::cout << avpos[i];
                            if (i < avpos.size() - 1) std::cout << ", ";
                        }
                        std::cout << ") to mark X: ";
                        std::cin >> pos;
                        
                        if (std::find(avpos.begin(), avpos.end(), pos) != avpos.end()) {
                            break;
                        } else {
                            std::cout << "\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n" << std::endl;
                        }
                    } catch (...) {
                        std::cout << "\033[31mError: Please retry with a valid numeric value!\033[0m\n" << std::endl;
                        std::cin.clear();
                        std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
                    }
                }
                enter_pos('X', pos);
                
                // Check for win
                if (check_win()) {
                    break;
                }
                
                if (avpos.empty()) {
                    std::cout << "\033[32mRESULT: The game was a draw!\033[0m" << std::endl;
                    break;
                }
                
                // Player 2 turn
                while (true) {
                    try {
                        std::cout << "Your turn, " << p2 << ", enter a position (out of ";
                        for (size_t i = 0; i < avpos.size(); i++) {
                            std::cout << avpos[i];
                            if (i < avpos.size() - 1) std::cout << ", ";
                        }
                        std::cout << ") to mark O: ";
                        std::cin >> pos;
                        
                        if (std::find(avpos.begin(), avpos.end(), pos) != avpos.end()) {
                            break;
                        } else {
                            std::cout << "\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n" << std::endl;
                        }
                    } catch (...) {
                        std::cout << "\033[31mError: Please retry with a valid numeric value!\033[0m\n" << std::endl;
                        std::cin.clear();
                        std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
                    }
                }
                enter_pos('O', pos);
                
                // Check for win
                if (check_win()) {
                    break;
                }
                
                if (avpos.empty()) {
                    std::cout << "\033[32mRESULT: The game was a draw!\033[0m" << std::endl;
                    break;
                }
            }
        }
    }
};

#endif // TICTACTOE_H