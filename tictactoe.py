import random

# Defining Objects -------------------------------------------------------------
a1 = a2 = a3 = b1 = b2 = b3 = c1 = c2 = c3 = " "
avpos = [1,2,3,4,5,6,7,8,9]
af = False
nb = False
bm = False
moved = False
end = False

# Custom Functions -------------------------------------------------------------
def grid(): # Custom Function to print the grid after each turn.
  print("\033[34m")
  print(a1, "|", a2 ,"|", a3)
  print("——————————")
  print(b1, "|", b2 ,"|", b3)
  print("——————————")
  print(c1, "|", c2 ,"|", c3)
  print("\033[0m")
# ----------------

def enter_pos(mark,pos): # Custom Function to enter a position and parse it.
  global a1,a2,a3,b1,b2,b3,c1,c2,c3,avpos
  if pos == 1:
    a1 = mark
    avpos.remove(1)
    grid()
  if pos == 2:
    a2 = mark
    avpos.remove(2)
    grid()
  if pos == 3:
    a3 = mark
    avpos.remove(3)
    grid()
  if pos == 4:
    b1 = mark
    avpos.remove(4)
    grid()
  if pos == 5:
    b2 = mark
    avpos.remove(5)
    grid()
  if pos == 6:
    b3 = mark
    avpos.remove(6)
    grid()
  if pos == 7:
    c1 = mark
    avpos.remove(7)
    grid()
  if pos == 8:
    c2 = mark
    avpos.remove(8)
    grid()
  if pos == 9:
    c3 = mark
    avpos.remove(9)
    grid()
#----------------

def check_win(): # Custom Function to check if a player/engine won.
  global end
  end = False
  print("")
  # Horizontal Win (X)
  if a1 == a2 == a3 == "X":
    print("\033[32mRESULT:",p1,"won the game!\033[0m")
    end = True
  if b1 == b2 ==  b3 == "X":
    print("\033[32mRESULT:",p1,"won the game!\033[0m")
    end = True
  if c1 == c2 == c3 == "X":
    print("\033[32mRESULT:",p1,"won the game!\033[0m")
    end = True
  # Vertical Win (X)
  if a1 == b1 == c1 == "X":
    print("\033[32mRESULT:",p1,"won the game!\033[0m")
    end = True
  if a2 == b2 == c2 == "X":
    print("\033[32mRESULT:",p1,"won the game!\033[0m")
    end = True
  if a3 == b3 == c3 == "X":
    print("\033[32mRESULT:",p1,"won the game!\033[0m")
    end = True
  # Diagonal Win (X)
  if a1 == b2 == c3 == "X":
    print("\033[32mRESULT:",p1,"won the game!\033[0m")
    end = True
  if a3 == b2 == c1 == "X":
    print("\033[32mRESULT:",p1,"won the game!\033[0m")
    end = True
  # ---------------------------------------
  # Horizontal Win (O)
  if a1 == a2 == a3 == "O":
    print("\033[32mRESULT:",p2,"won the game!\033[0m")
    end = True
  if b1 == b2 ==  b3 == "O":
    print("\033[32mRESULT:",p2,"won the game!\033[0m")
    end = True
  if c1 == c2 == c3 == "O":
    print("\033[32mRESULT:",p2,"won the game!\033[0m")
    end = True
  # Vertical Win (O)
  if a1 == b1 == c1 == "O":
    print("\033[32mRESULT:",p2,"won the game!\033[0m")
    end = True
  if a2 == b2 == c2 == "O":
    print("\033[32mRESULT:",p2,"won the game!\033[0m")
    end = True
  if a3 == b3 == c3 == "O":
    print("\033[32mRESULT:",p2,"won the game!\033[0m")
    end = True
  # Diagonal Win (O)
  if a1 == b2 == c3 == "O":
    print("\033[32mRESULT:",p2,"won the game!\033[0m")
    end = True
  if a3 == b2 == c1 == "O":
    print("\033[32mRESULT:",p2,"won the game!\033[0m")
    end = True
  if end == True:
    return "break"
#----------------

def block_win(): # Custom Function for the Engine to block any potential wins.
  global a1,a2,a3,b1,b2,b3,c1,c2,c3,nb
  if (a3  == a2 == "X") or (b1 == c1 == "X") or (b2 == c3 == "X"):
    if a1 != "O":
      a1 = "O"
      avpos.remove(1)
      print("Computer chose Position 1!")
      grid()
      nb = True
      return nb
  if (a1 == a3 == "X") or (b2 == c2 == "X"):
    if a2 != "O":
      a2 = "O"
      avpos.remove(2)
      print("Computer chose Position 2!")
      grid()
      nb = True
      return nb
  if (a1 == a2 == "X") or (b2 == c1 == "X") or (b3 == c3 == "X"):
    if a3 != "O":
      a3 = "O"
      avpos.remove(3)
      print("Computer chose Position 3!")
      grid()
      nb = True
      return nb
  if (a1 == c1 == "X") or (b2 == b3 == "X"):
    if b1 != "O":
      b1 = "O"
      avpos.remove(4)
      print("Computer chose Position 4!")
      grid()
      nb = True
      return nb
  if (a1 == c3 == "X") or (a2 == c2 == "X")  or (a3 == c1 == "X")  or (b3 == b1 == "X"):
    if b2 != "O":
      b2 = "O"
      avpos.remove(5)
      print("Computer chose Position 5!")
      grid()
      nb = True
      return nb
  if (a3 == c3 == "X") or (b1 == b2 == "X"):
    if b3 != "O":
      b3 = "O"
      avpos.remove(6)
      print("Computer chose Position 6!")
      grid()
      nb = True
      return nb
  if (a1 == b1 == "X") or (c2 == c3 == "X") or (a3 == b2 == "X"):
    if c1 != "O":
      c1 = "O"
      avpos.remove(7)
      print("Computer chose Position 7!")
      grid()
      nb = True
      return nb
  if (a2 == b2 == "X") or (c1 == c3 == "X"):
    if c2 != "O":
      c2 = "O"
      avpos.remove(8)
      print("Computer chose Position 8!")
      grid()
      nb = True
      return nb
  if (a3 == b3 == "X") or (a1 == b2 == "X") or (c1 == c2 == "X"):
    if c3 != "O":
      c3 = "O"
      avpos.remove(9)
      print("Computer chose Position 9!")
      grid()
      nb = True
      return nb
  nb = False
  return nb
#-------------

def win_move(): # Custom Function for the Engine to make a winning move.
  global a1,a2,a3,b1,b2,b3,c1,c2,c3,moved
  if (a3 == a2 == "O") or (b1 == c1 == "O") or (b2 == c3 == "O"):
    if a1 != "O" and a1 != "X":
      a1 = "O"
      avpos.remove(1)
      print("Computer chose Position 1!")
      grid()
      moved = True
      return moved
  if (a1 == a3 == "O") or (b2 == c2 == "O"):
    if a2 != "O" and a2 != "X":
      a2 = "O"
      avpos.remove(2)
      print("Computer chose Position 2!")
      grid()
      moved = True
      return moved
  if (a1 == a2 == "O") or (b2 == c1 == "O") or (b3 == c3 == "O"):
    if a3 != "O" and a3 != "X":
      a3 = "O"
      avpos.remove(3)
      print("Computer chose Position 3!")
      grid()
      moved = True
      return moved
  if (a1 == c1 == "O") or (b2 == b3 == "O"):
    if b1 != "O" and b1 != "X":
      b1 = "O"
      avpos.remove(4)
      print("Computer chose Position 4!")
      grid()
      moved = True
      return moved
  if (a1 == c3 == "O") or (a2 == c2 == "O")  or (a3 == c1 == "O")  or (b3 == b1 == "O"):
    if b2 != "O" and b2 != "X":
      b2 = "O"
      avpos.remove(5)
      print("Computer chose Position 5!")
      grid()
      moved = True
      return moved
  if (a3 == c3 == "O") or (b1 == b2 == "O"):
    if b3 != "O" and b3 != "X":
      b3 = "O"
      avpos.remove(6)
      print("Computer chose Position 6!")
      grid()
      moved = True
      return moved
  if (a1 == b1 == "O") or (c2 == b3 == "O") or (a3 == b2 == "O"):
    if c1 != "O" and c1 != "X":
      c1 = "O"
      avpos.remove(7)
      print("Computer chose Position 7!")
      grid()
      moved = True
      return moved
  if (a2 == b2 == "O") or (c1 == c3 == "O"):
    if c2 != "O" and c2 != "X":
      c2 = "O"
      avpos.remove(8)
      print("Computer chose Position 8!")
      grid()
      moved = True
      return moved
  if (a3 == b3 == "O") or (a1 == b2 == "O") or (c1 == c2 == "O"):
    if c3 != "O" and c3 != "X":
      c3 = "O"
      avpos.remove(9)
      print("Computer chose Position 9!")
      grid()
      moved = True
      return moved
  moved = False
  return moved
#----------------

def best_move(): # Custom Function for making a random move.
  global a1,a2,a3,b1,b2,b3,c1,c2,c3,bm
  if nb == moved == False:
    ranpos = random.choice(avpos)
    if ranpos == 1:
        a1 = "O"
        avpos.remove(ranpos)
        print(f"Computer chose Position {ranpos}!")
        grid()
        bm = True
        return bm
    if ranpos == 2:
        a2 = "O"
        avpos.remove(ranpos)
        print(f"Computer chose Position {ranpos}!")
        grid()
        bm = True
        return bm
    if ranpos == 3:
        a3 = "O"
        avpos.remove(ranpos)
        print(f"Computer chose Position {ranpos}!")
        grid()
        bm = True
        return bm
    if ranpos == 4:
        b1 = "O"
        avpos.remove(ranpos)
        print(f"Computer chose Position {ranpos}!")
        grid()
        bm = True
        return bm
    if ranpos == 5:
        b2 = "O"
        avpos.remove(ranpos)
        print(f"Computer chose Position {ranpos}!")
        grid()
        bm = True
        return bm
    if ranpos == 6:
        b3 = "O"
        avpos.remove(ranpos)
        print(f"Computer chose Position {ranpos}!")
        grid()
        bm = True
        return bm
    if ranpos == 7:
        c1 = "O"
        avpos.remove(ranpos)
        print(f"Computer chose Position {ranpos}!")
        grid()
        bm = True
        return bm
    if ranpos == 8:
        c2 = "O"
        avpos.remove(ranpos)
        print(f"Computer chose Position {ranpos}!")
        grid()
        bm = True
        return bm
    if ranpos == 9:
        c3 = "O"
        avpos.remove(ranpos)
        print(f"Computer chose Position {ranpos}!")
        grid()
        bm = True
        return bm
  bm = False
  return bm
#----------------

def anti_fork(): # Custom function for countering forks.
  global a1,a2,a3,b1,b2,b3,c1,c2,c3,af
  if b2 == "O":
    # X-O-X series (diagonal, rotated)
    if a3 == c1 == "X" and b2 == "O":
      r = [2,4,6,8]
      rc = random.choice(r)
      if rc == 2:
        if a2 != "O" and a2 != "X":
          a2 = "O"
          avpos.remove(2)
          print("Computer chose Position 2!")
          grid()
          af = True
          return af
      if rc == 4:
        if b1 != "O" and b1 != "X":
          b1 = "O"
          avpos.remove(4)
          print("Computer chose Position 4!")
          grid()
          af = True
          return af
      if rc == 6:
        if b3 != "O" and b3 != "X":
          b3 = "O"
          avpos.remove(6)
          print("Computer chose Position 6!")
          grid()
          af = True
          return af
      if rc == 8:
        if c2 != "O" and c2 != "X":
          c2 = "O"
          avpos.remove(8)
          print("Computer chose Position 8!")
          grid()
          af = True
          return af
    if a1 == c3 == "X" and b2 == "O":
      r = [2,4,6,8]
      rc = random.choice(r)
      if rc == 2:
        if a2 != "O" and a2 != "X":
          a2 = "O"
          avpos.remove(2)
          print("Computer chose Position 2!")
          grid()
          af = True
          return af
      if rc == 4:
        if b1 != "O" and b1 != "X":
          b1 = "O"
          avpos.remove(4)
          print("Computer chose Position 4!")
          grid()
          af = True
          return af
      if rc == 6:
        if b3 != "O" and b3 != "X":
          b3 = "O"
          avpos.remove(6)
          print("Computer chose Position 6!")
          grid()
          af = True
          return af
      if rc == 8:
        if c2 != "O" and c2 != "X":
          c2 = "O"
          avpos.remove(8)
          print("Computer chose Position 8!")
          grid()
          af = True
          return af
    # X-O-X series (L-structure, rotated)
    if a2 == b1 == "X" and b2 == "O":
      if a1 != "O" and a1 != "X":
        a1 = "O"
        avpos.remove(1)
        print("Computer chose Position 1!")
        grid()
        af = True
        return af
    if b1 == c2 == "X" and b2 == "O":
      if c1 != "O" and c1 != "X":
        c1 = "O"
        avpos.remove(7)
        print("Computer chose Position 7!")
        grid()
        af = True
        return af
    if c2 == b3 == "X" and b2 == "O":
      if c3 != "O" and c3 != "X":
        c3 = "O"
        avpos.remove(9)
        print("Computer chose Position 9!")
        grid()
        af = True
        return af
    if b2 == a2 == "X" and b2 == "O":
      if a3 != "O" and a3 != "X":
        a3 = "O"
        avpos.remove(3)
        print("Computer chose Position 3!")
        grid()
        af = True
        return af
    # X-O-X series (angled upward, rotated)
    if b1 == a3 == "X" and b2 == "O":
      if a1 != "O" and a1 != "X":
        a1 = "O"
        avpos.remove(1)
        print("Computer chose Position 1!")
        grid()
        af = True
        return af
    if a1 == c2 == "X" and b2 == "O":
      if c1 != "O" and c1 != "X":
        c1 = "O"
        avpos.remove(7)
        print("Computer chose Position 7!")
        grid()
        af = True
        return af
    if c1 == b3 == "X" and b2 == "O":
      if c3 != "O" and c3 != "X":
        c3 = "O"
        avpos.remove(9)
        print("Computer chose Position 9!")
        grid()
        af = True
        return af
    if c3 == a2 == "X" and b2 == "O":
      if a3 != "O" and a3 != "X":
        a3 = "O"
        avpos.remove(3)
        print("Computer chose Position 3!")
        grid()
        af = True
        return af
    # X-O-X series (angled downward, rotated)
    if b1 == c3 == "X" and b2 == "O":
      if c1 != "O" and c1 != "X":
        c1 = "O"
        avpos.remove(7)
        print("Computer chose Position 7!")
        grid()
        af = True
        return af
    if c2 == a3 == "X" and b2 == "O":
      if c3 != "O" and c3 != "X":
        c3 = "O"
        avpos.remove(9)
        print("Computer chose Position 9!")
        grid()
        af = True
        return af
    if a1 == b3 == "X" and b2 == "O":
      if a3 != "O" and a3 != "X":
        a3 = "O"
        avpos.remove(3)
        print("Computer chose Position 3!")
        grid()
        af = True
        return af
    if c1 == a2 == "X" and b2 == "O":
      if a1 != "O" and a1 != "X":
        a1 = "O"
        avpos.remove(1)
        print("Computer chose Position 1!")
        grid()
        af = True
        return af
  if b2 == "X":
    # X-X-O series (vertical and horizontal, rotated)
    if b2 == a2 == "X" and c2 == "O":
      r = [7,9]
      c = random.choice(r)
      if c == 7:
        if c1 != "O" and c1 != "X":
          c1 = "O"
          avpos.remove(7)
          print(f"Computer chose Position {c}!")
          grid()
          af = True
          return af
      if c == 9:
        if c3 != "O" and c3 != "X":
          c3 = "O"
          avpos.remove(9)
          print(f"Computer chose Position {c}!")
          grid()
          af = True
          return af
    if b1 == b2 == "X" and b3 == "O":
      r = [3,9]
      c = random.choice(r)
      if c == 3:
        if a3 != "O" and a3 != "X":
          a3 = "O"
          avpos.remove(3)
          print(f"Computer chose Position {c}!")
          grid()
          af = True
          return af
      if c == 9:
        if c3 != "O" and c3 != "X":
          c3 = "O"
          avpos.remove(9)
          print(f"Computer chose Position {c}!")
          grid()
          af = True
          return af
    if b2 == c3 == "X" and a2 == "O":
      r = [1,3]
      c = random.choice(r)
      if c == 1:
        if a1 != "O" and a1 != "X":
          a1 = "O"
          avpos.remove(1)
          print(f"Computer chose Position {c}!")
          grid()
          af = True
          return af
      if c == 3:
        if a3 != "O" and a3 != "X":
          a3 = "O"
          avpos.remove(3)
          print(f"Computer chose Position {c}!")
          grid()
          af = True
          return af
    if b2 == b3 == "X" and b1 == "O":
      r = [1,7]
      c = random.choice(r)
      if c == 1:
        if a1 != "O" and a1 != "X":
          a1 = "O"
          avpos.remove(1)
          print(f"Computer chose Position {c}!")
          grid()
          af = True
          return af
      if c == 7:
        if c1 != "O" and c1 != "X":
          c1 = "O"
          avpos.remove(7)
          print(f"Computer chose Position {c}!")
          grid()
          af = True
          return af
    #X-X-O series (diagonal, rotated)
    if a3 == b2 == "X" and c1 == "O":
      if a1 != "O" and a1 != "X":
        a1 = "O"
        avpos.remove(1)
        print("Computer chose Position 1!")
        grid()
        af = True
        return af
    if a1 == b2 == "X" and c3 == "O":
      if a3 != "O" and a3 != "X":
        a3 = "O"
        avpos.remove(3)
        print("Computer chose Position 3!")
        grid()
        af = True
        return af
    if c1 == b2 == "X" and a3 == "O":
      if c3 != "O" and c3 != "X":
        c3 = "O"
        avpos.remove(9)
        print("Computer chose Position 9!")
        grid()
        af = True
        return af
    if c3 == b2 == "X" and a1 == "O":
      if c1 != "O" and c1 != "X":
        c1 = "O"
        avpos.remove(7)
        print("Computer chose Position 7!")
        grid()
        af = True
        return af
  af = False
  return af
#---------------- TTT Functions End ----------------#

game = "ttt"
if game == 'ttt': # Tic Tac Toe ------------------------------------------------------------------------------------------------------------------------------------------
  # Printing Introduction --------------------------------------------------------
  print("\033[32mWelcome to the Tic Tac Toe game!")
  print("")
  print("")
  print("\033[34mPlease use the following guide for positions to mark on your turn!")
  print("1 | 2 | 3")
  print("——————————")
  print("4 | 5 | 6")
  print("——————————")
  print("7 | 8 | 9\033[0m")
  print("")
  # ========================== MAIN TIC-TAC-TOE PROGRAM ========================
  while True:
    print("\033[34m"); choice = input("Would you like to (S) play single-player versus a Computer, or (D) play a one-versus-one with another player (Enter 'S' or 'D' only): ").upper()
    if choice == "S":
      mode = "S"
      while True:
      # Difficulty of Tic Tac Toe
        hard = input("Would like the difficulty of the Computer to be (E) Easy, (M) Medium, (H) Hard, or (I) Impossible? (Enter 'E','M','H', or 'I' only): ").upper(); print("\033[0m",end = "")
        if hard == 'E' or hard == 'M' or hard == 'H' or hard == "I":
          break
        else:
          print("\033[31mError: Please enter only 'E','M','H', or 'I' as your input!\033[0m\n")
      break
    if choice == "D":
      mode = "D"
      break
    else:
      print("\033[31mError: Please enter only 'S' or 'D' as your input!\033[0m\n")
  print()
  # -------------------------- MAIN GAME PROGRAM -------------------------------

  # -------------------------- Singleplayer Mode -------------------------------
  if mode == "S":
    # Accepting Player Name ----------------------------------------------------
    print(" ")
    #--------------------- Player - Computer Block (IMPOSSIBLE) ----------------
    if hard == "I":
      print("\033[1m\033[33mCOMPUTER:\033[0m \033[3mAh, so you have decided to challenge me? Let's do this.\033[0m")
      print(" ")
      p1 = input("Enter name of Player 1 (playing X) here: ")
      p2 = "Computer"
      grid()
      # Player Turn 1 ----------------------------------------------------------
      while True:
        try:
          print("Your turn,", p1 ,", enter a position \033[36m(out of ",avpos,")\033[0m to mark X: ", end = "")
          pos = int(input(""))
          if pos in avpos:
            break
          else:
            print("\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n")
        except ValueError:
            print("\033[31mError: Please retry with a valid numeric value!\033[0m\n")
      mark = "X"
      enter_pos(mark, pos)
      print("")
      # Engine Turn 1 ----------------------------------------------------------
      print("Computer's turn, entering a position \033[36m(out of ",avpos,")\033[0m to mark O.")
      if pos == 1 or pos == 2 or pos == 3 or pos == 4 or pos == 6 or pos == 7 or pos == 8 or pos == 9:
        #Player chose a non-center value
        print("Computer chose Position 5!")
        b2 = "O"
        avpos.remove(5)
        grid()
      elif pos == 5: # If Player chose center
        mark = "O"
        corner = [1,3,7,9]
        cpos = random.choice(corner)
        enter_pos(mark,cpos)
      print(" ")
      #-------------------------- Loop For Turn 2 Onwards ----------------------
      while end == False:
        # Player Turn 2 onwards ------------------------------------------------
        while True:
          try:
            print("Your turn,", p1 ,", enter a position \033[36m(out of ",avpos,")\033[0m to mark X: ", end = "")
            pos = int(input(""))
            if pos in avpos:
              break
            else:
              print("\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n")
          except ValueError:
            print("\033[31mError: Please retry with a valid numeric value!\033[0m\n")
        mark = "X"
        enter_pos(mark,pos)
        # Checking For Potential Wins after a turn -----------------------------
        res = check_win()
        if res == "break":
            print(f"\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mAt least you tried, {p1}, but you were warned.\033[0m")
            break
        if len(avpos) == 0:
            print(f"\033[1m\033[33mCOMPUTER:\033[0m \033[3mWhile it may seem like it, we aren't equal, {p1}. Try again.\033[0m\n")
            print("\033[32mRESULT: The game was a draw!\033[0m")
            break
        # AI Turn 2 Onwards ----------------------------------------------------
        if end == False:
          print("Computer's turn, entering a position \033[36m(out of ",avpos,")\033[0m to mark O.")
          w = win_move() # Trying to find a winning move.
          if w == False:
            b = block_win() # Blocking immediate threats.
            if b == False:
              a = anti_fork() # Blocking tactical moves with counter-tactics.
              if a == False:
                best_move() # Random move if nothing else works, will lead to a draw.
          # Checking For Potential Wins after a turn ---------------------------
          res = check_win()
          if res == "break":
              print(f"\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mAt least you tried, {p1}, but you were warned.\033[0m")
              break
          if len(avpos) == 0:
              print(f"\033[1m\033[33mCOMPUTER:\033[0m \033[3mWhile it may seem like it, we aren't equal, {p1}. Try again.\033[0m\n")
              print("\033[32mRESULT: The game was a draw!\033[0m")
              break
        elif end == True:
          break
    #------------------------ Player - Computer Block (HARD) -------------------
    if hard == "H":
      p1 = input("Enter name of Player 1 (playing X) here: ")
      p2 = "Computer"
      grid()
      # Player Turn 1 ----------------------------------------------------------
      while True:
        try:
          print("Your turn,", p1 ,", enter a position \033[36m(out of ",avpos,")\033[0m to mark X: ", end = "")
          pos = int(input(""))
          if pos in avpos:
            break
          else:
            print("\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n")
        except ValueError:
            print("\033[31mError: Please retry with a valid numeric value!\033[0m\n")
      mark = "X"
      enter_pos(mark, pos)
      print("")
      # Engine Turn 1 ----------------------------------------------------------
      print("Computer's turn, entering a position \033[36m(out of ",avpos,")\033[0m to mark O.")
      if pos == 1 or pos == 2 or pos == 3 or pos == 4 or pos == 6 or pos == 7 or pos == 8 or pos == 9:
        #Player chose a non-center value
        print("Computer chose Position 5!")
        b2 = "O"
        avpos.remove(5)
        grid()
      elif pos == 5: # If Player chose center
        mark = "O"
        cpos = random.choice(avpos)
        enter_pos(mark,cpos)
      print(" ")
      #-------------------------- Loop For Turn 2 Onwards ----------------------
      while end == False:
        # Player Turn 2 onwards ------------------------------------------------
        while True:
          try:
            print("Your turn,", p1 ,", enter a position \033[36m(out of ",avpos,")\033[0m to mark X: ", end = "")
            pos = int(input(""))
            if pos in avpos:
              break
            else:
              print("\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n")
          except ValueError:
              print("\033[31mError: Please retry with a valid numeric value!\033[0m\n")
        mark = "X"
        enter_pos(mark,pos)
        # Checking For Potential Wins after a turn -----------------------------
        res = check_win()
        if res == "break":
          break
        if len(avpos) == 0:
          print("\033[32mRESULT: The game was a draw!\033[0m")
          break
        # Engine Turn 2 Onwards ----------------------------------------------------
        if end == False:
          print("Computer's turn, entering a position \033[36m(out of ",avpos,")\033[0m to mark O.")
          w = win_move() # Trying to find a winning move.
          if w == False:
            b = block_win() # Blocking immediate threats.
            if b == False:
                best_move() # Random move, will occasionally cause Computer to lose.
          # Checking For Potential Wins after a turn ---------------------------
          res = check_win()
          if res == "break":
            break
          if len(avpos) == 0:
            print("\033[32mRESULT: The game was a draw!\033[0m")
            break
        elif end == True:
          break
    # ---------------------- Player - Computer Block (MEDIUM) ------------------
    if hard == "M":
      p1 = input("Enter name of Player 1 (playing X) here: ")
      p2 = "Computer"
      grid()
      while end == False:
        # Player Turn Loop -----------------------------------------------------
        while True:
          try:
            print("Your turn,", p1 ,", enter a position \033[36m(out of ",avpos,")\033[0m to mark X: ", end = "")
            pos = int(input(""))
            if pos in avpos:
              break
            else:
              print("\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n")
          except ValueError:
            print("\033[31mError: Please retry with a valid numeric value!\033[0m\n")
        mark = "X"
        enter_pos(mark,pos)
        # Checking For Potential Wins after a turn -----------------------------
        res = check_win()
        if res == "break":
          break
        if len(avpos) == 0:
          print("\033[32mRESULT: The game was a draw!\033[0m")
          break
        # Computer Turn --------------------------------------------------------
        print("Computer's turn, entering a position \033[36m(out of ",avpos,")\033[0m to mark O.")
        b = block_win() # Blocking immediate threats.
        if b == False:
          best_move() # Just randomising, if unable to block. Loss likely.
        # Checking For Potential Wins after a turn -----------------------------
        res = check_win()
        if res == "break":
          break
        if len(avpos) == 0:
          print("\033[32mRESULT: The game was a draw!\033[0m")
          break
        elif end == True:
          break
    # ---------------------- Player - Computer Block (Easy) --------------------
    if hard == "E":
      p1 = input("Enter name of Player 1 (playing X) here: ")
      p2 = "Computer"
      grid()
      while end == False:
        # Player Turn Loop -----------------------------------------------------
        while True:
          try:
            print("Your turn,", p1 ,", enter a position \033[36m(out of ",avpos,")\033[0m to mark X: ", end = "")
            pos = int(input(""))
            if pos in avpos:
              break
            else:
              print("\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n")
          except ValueError:
            print("\033[31mError: Please retry with a valid numeric value!\033[0m\n")
        mark = "X"
        enter_pos(mark,pos)
        # Checking For Potential Wins after a turn -----------------------------
        res = check_win()
        if res == "break":
          break
        if len(avpos) == 0:
          print("\033[32mRESULT: The game was a draw!\033[0m")
          break
        # Computer Turn --------------------------------------------------------
        print("Computer's turn, entering a position \033[36m(out of ",avpos,")\033[0m to mark O.")
        best_move() # Completely random moves, Computer should lose in almost all cases.
        # Checking For Potential Wins after a turn -----------------------------
        res = check_win()
        if res == "break":
          break
        if len(avpos) == 0:
          print("\033[32mRESULT: The game was a draw!\033[0m")
          break
        elif end == True:
          break
  # ----------------------------------------------------------------------------

  # ------------------------------ MULTIPLAYER MODE ----------------------------
  if mode == "D":
    # Accepting Player Names ---------------------------------------------------
    print(" ")
    p1 = input("Enter name of Player 1 (playing X) here: ")
    p2 = input("Enter name of Player 2 (playing O) here: ")
    grid()
    # --------------------------- Multiplayer Loop------------------------------
    while end == False:
      # Player 1's Turn --------------------------------------------------------
      while True:
        try:
          print("Your turn,", p1 ,", enter a position (out of ",avpos,") to mark X: ", end = "")
          pos = int(input(""))
          if pos in avpos:
            break
          else:
            print("\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n")
        except ValueError:
          print("\033[31mError: Please retry with a valid numeric value!\033[0m\n")
      mark = "X"
      enter_pos(mark,pos)
      # Checking For Potential Wins after a turn -------------------------------
      res = check_win()
      if res == "break":
        break
      if len(avpos) == 0:
        print("\033[32mRESULT: The game was a draw!\033[0m")
        break
      # Player 2's Turn --------------------------------------------------------
      while True:
        try:
          print("Your turn,", p2 ,", enter a position (out of ",avpos,") to mark X: ", end = "")
          pos = int(input(""))
          if pos in avpos:
            break
          else:
            print("\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n")
        except ValueError:
          print("\033[31mError: Please retry with a valid numeric value!\033[0m\n")
      mark = "O"
      enter_pos(mark,pos)
      # Checking For Potential Wins after a turn -------------------------------
      res = check_win()
      if res == "break":
        break
      if len(avpos) == 0:
        print("\033[32mRESULT: The game was a draw!\033[0m")
        break
  # Multiplayer Mode End -------------------------------------------------------

  #------------------------- END OF THE TTT PROGRAM. ---------------------------