(* filepath: /Users/aryandaga/Downloads/VSC/LearningShit/TicTacToe/tictactoe.sml *)
(* TicTacToe game in Standard ML *)

(* ANSI color codes *)
val RESET = "\027[0m"
val GREEN = "\027[32m"
val RED = "\027[31m"
val BLUE = "\027[34m"
val CYAN = "\027[36m"
val YELLOW = "\027[33m"
val BOLD = "\027[1m"
val ITALIC = "\027[3m"

(* Game state type definition *)
type board = {
  a1: char, a2: char, a3: char,
  b1: char, b2: char, b3: char,
  c1: char, c2: char, c3: char
}

(* Game state record *)
datatype player = X | O
datatype difficulty = Easy | Medium | Hard | Impossible
datatype gameMode = SinglePlayer of difficulty | MultiPlayer

(* Set up random number generator *)
val randGen = Random.rand(Time.toSeconds(Time.now()), 0);
fun randomInt n = Random.randRange(0, n-1) randGen;

(* Create an initial empty board *)
fun initialBoard() = {
  a1 = #" ", a2 = #" ", a3 = #" ",
  b1 = #" ", b2 = #" ", b3 = #" ",
  c1 = #" ", c2 = #" ", c3 = #" "
}

(* Generate a list of available positions *)
fun availablePos(board: board) =
  let
    fun isAvailable(pos, c) = if c = #" " then SOME(pos) else NONE
  in
    List.mapPartial (fn x => x) [
      isAvailable(1, #a1 board), isAvailable(2, #a2 board), isAvailable(3, #a3 board),
      isAvailable(4, #b1 board), isAvailable(5, #b2 board), isAvailable(6, #b3 board),
      isAvailable(7, #c1 board), isAvailable(8, #c2 board), isAvailable(9, #c3 board)
    ]
  end

(* Print the game board *)
fun printGrid(board: board) =
  let 
    val a1 = Char.toString(#a1 board)
    val a2 = Char.toString(#a2 board)
    val a3 = Char.toString(#a3 board)
    val b1 = Char.toString(#b1 board)
    val b2 = Char.toString(#b2 board)
    val b3 = Char.toString(#b3 board)
    val c1 = Char.toString(#c1 board)
    val c2 = Char.toString(#c2 board)
    val c3 = Char.toString(#c3 board)
  in
    print(BLUE ^ "\n");
    print(a1 ^ " | " ^ a2 ^ " | " ^ a3 ^ "\n");
    print("——————————\n");
    print(b1 ^ " | " ^ b2 ^ " | " ^ b3 ^ "\n");
    print("——————————\n");
    print(c1 ^ " | " ^ c2 ^ " | " ^ c3 ^ "\n");
    print(RESET ^ "\n")
  end

(* Enter a position and update the board *)
fun enterPos(board: board, player: player, pos: int) =
  let
    val mark = case player of X => #"X" | O => #"O"
  in
    case pos of
      1 => {a1=mark, a2=(#a2 board), a3=(#a3 board), 
            b1=(#b1 board), b2=(#b2 board), b3=(#b3 board), 
            c1=(#c1 board), c2=(#c2 board), c3=(#c3 board)}
    | 2 => {a1=(#a1 board), a2=mark, a3=(#a3 board), 
            b1=(#b1 board), b2=(#b2 board), b3=(#b3 board), 
            c1=(#c1 board), c2=(#c2 board), c3=(#c3 board)}
    | 3 => {a1=(#a1 board), a2=(#a2 board), a3=mark, 
            b1=(#b1 board), b2=(#b2 board), b3=(#b3 board), 
            c1=(#c1 board), c2=(#c2 board), c3=(#c3 board)}
    | 4 => {a1=(#a1 board), a2=(#a2 board), a3=(#a3 board), 
            b1=mark, b2=(#b2 board), b3=(#b3 board), 
            c1=(#c1 board), c2=(#c2 board), c3=(#c3 board)}
    | 5 => {a1=(#a1 board), a2=(#a2 board), a3=(#a3 board), 
            b1=(#b1 board), b2=mark, b3=(#b3 board), 
            c1=(#c1 board), c2=(#c2 board), c3=(#c3 board)}
    | 6 => {a1=(#a1 board), a2=(#a2 board), a3=(#a3 board), 
            b1=(#b1 board), b2=(#b2 board), b3=mark, 
            c1=(#c1 board), c2=(#c2 board), c3=(#c3 board)}
    | 7 => {a1=(#a1 board), a2=(#a2 board), a3=(#a3 board), 
            b1=(#b1 board), b2=(#b2 board), b3=(#b3 board), 
            c1=mark, c2=(#c2 board), c3=(#c3 board)}
    | 8 => {a1=(#a1 board), a2=(#a2 board), a3=(#a3 board), 
            b1=(#b1 board), b2=(#b2 board), b3=(#b3 board), 
            c1=(#c1 board), c2=mark, c3=(#c3 board)}
    | 9 => {a1=(#a1 board), a2=(#a2 board), a3=(#a3 board), 
            b1=(#b1 board), b2=(#b2 board), b3=(#b3 board), 
            c1=(#c1 board), c2=(#c2 board), c3=mark}
    | _ => board
  end

(* Utility function to read integer input *)
fun readInt() = 
  Option.valOf (Int.fromString (valOf (TextIO.inputLine TextIO.stdIn))) 
  handle _ => ~1  (* Return -1 on invalid input *)

(* Utility function to read string input *)
fun readString() = 
  case TextIO.inputLine TextIO.stdIn of
    SOME s => String.substring(s, 0, String.size(s) - 1)  (* Remove newline *)
  | NONE => ""

(* Check if a player has won *)
fun checkWin(board: board, p1: string, p2: string) =
  let
    val a1 = #a1 board; val a2 = #a2 board; val a3 = #a3 board
    val b1 = #b1 board; val b2 = #b2 board; val b3 = #b3 board
    val c1 = #c1 board; val c2 = #c2 board; val c3 = #c3 board
    
    (* Check if a player with marker has won *)
    fun checkPlayerWin(marker, playerName) =
      (* Horizontal wins *)
      (a1 = marker andalso a2 = marker andalso a3 = marker) orelse
      (b1 = marker andalso b2 = marker andalso b3 = marker) orelse
      (c1 = marker andalso c2 = marker andalso c3 = marker) orelse
      (* Vertical wins *)
      (a1 = marker andalso b1 = marker andalso c1 = marker) orelse
      (a2 = marker andalso b2 = marker andalso c2 = marker) orelse
      (a3 = marker andalso b3 = marker andalso c3 = marker) orelse
      (* Diagonal wins *)
      (a1 = marker andalso b2 = marker andalso c3 = marker) orelse
      (a3 = marker andalso b2 = marker andalso c1 = marker)
  in
    if checkPlayerWin(#"X", p1) then
      (print(GREEN ^ "RESULT: " ^ p1 ^ " won the game!\n" ^ RESET); true)
    else if checkPlayerWin(#"O", p2) then
      (print(GREEN ^ "RESULT: " ^ p2 ^ " won the game!\n" ^ RESET); true)
    else 
      false
  end

(* Check if the game is a draw *)
fun isDraw(avpos: int list) = null avpos

(* Read a valid position from the player *)
fun getPlayerMove(board: board, avpos: int list, playerName: string) =
  let
    val _ = print("Your turn, " ^ playerName ^ ", enter a position (out of " ^ 
                 (String.concatWith "," (List.map Int.toString avpos)) ^ ") to mark X: ")
    val input = readString()
  in
    case Int.fromString(input) of
      SOME pos =>
        if List.exists (fn x => x = pos) avpos then
          (enterPos(board, X, pos), List.filter (fn x => x <> pos) avpos)
        else
          (print(RED ^ "Error: That position is invalid or occupied, please retry!\n" ^ RESET);
          getPlayerMove(board, avpos, playerName))
    | NONE =>
        (print(RED ^ "Error: Please enter a valid number!\n" ^ RESET);
        getPlayerMove(board, avpos, playerName))
  end

(* Computer AI: Try to make a winning move *)
fun winMove(board: board, avpos: int list) =
  let
    (* Try all positions to find a winning one *)
    fun tryPosition(pos, b, avp, found) =
      if found orelse not(List.exists (fn x => x = pos) avp) then
        (found, b, avp)
      else
        let
          (* Try placing an O at this position *)
          val newBoard = enterPos(b, O, pos)
          val newAvpos = List.filter (fn x => x <> pos) avp
          
          (* Check all winning patterns just like in Python version *)
          val a1 = #a1 newBoard; val a2 = #a2 newBoard; val a3 = #a3 newBoard
          val b1 = #b1 newBoard; val b2 = #b2 newBoard; val b3 = #b3 newBoard
          val c1 = #c1 newBoard; val c2 = #c2 newBoard; val c3 = #c3 newBoard
          
          val isWin = 
            (* Horizontal wins *)
            (a1 = #"O" andalso a2 = #"O" andalso a3 = #"O") orelse
            (b1 = #"O" andalso b2 = #"O" andalso b3 = #"O") orelse
            (c1 = #"O" andalso c2 = #"O" andalso c3 = #"O") orelse
            (* Vertical wins *)
            (a1 = #"O" andalso b1 = #"O" andalso c1 = #"O") orelse
            (a2 = #"O" andalso b2 = #"O" andalso c2 = #"O") orelse
            (a3 = #"O" andalso b3 = #"O" andalso c3 = #"O") orelse
            (* Diagonal wins *)
            (a1 = #"O" andalso b2 = #"O" andalso c3 = #"O") orelse
            (a3 = #"O" andalso b2 = #"O" andalso c1 = #"O")
        in
          if isWin then
            (* Found a winning move *)
            (print("Computer chose Position " ^ Int.toString(pos) ^ "!\n");
             printGrid(newBoard);
             (true, newBoard, newAvpos))
          else
            (* Not a winning move *)
            (found, b, avp)
        end
    
    (* Try all positions in order *)
    val positions = [1,2,3,4,5,6,7,8,9]
  in
    (* Fold through all positions and return the first winning one *)
    foldl (fn (pos, (found, b, avp)) => 
      if found then (found, b, avp)
      else tryPosition(pos, b, avp, found))
    (false, board, avpos) positions
  end

(* Computer AI: Block the player's winning move *)
fun blockWin(board: board, avpos: int list) =
  let
    (* Try all positions to find one that would let player win *)
    fun tryPosition(pos, b, avp, found) =
      if found orelse not(List.exists (fn x => x = pos) avp) then
        (found, b, avp)
      else
        let
          (* Try placing an X at this position (simulating player's move) *)
          val testBoard = enterPos(b, X, pos)
        in
          (* Check if this would be a winning move for player *)
          if checkWin(testBoard, "Player", "") then
            (* Found a position to block *)
            let
              (* Block it by placing O here *)
              val newBoard = enterPos(b, O, pos)
              val newAvpos = List.filter (fn x => x <> pos) avp
            in
              print("Computer chose Position " ^ Int.toString(pos) ^ "!\n");
              printGrid(newBoard);
              (true, newBoard, newAvpos)
            end
          else
            (* Not a winning move for player *)
            (found, b, avp)
        end
    
    (* Try all positions in order *)
    val positions = [1,2,3,4,5,6,7,8,9]
  in
    (* Fold through all positions and return the first blocking one *)
    foldl (fn (pos, (found, b, avp)) => 
      if found then (found, b, avp)
      else tryPosition(pos, b, avp, found))
    (false, board, avpos) positions
  end

(* Computer AI: Anti-fork strategy to prevent two-way traps *)
fun antiFork(board: board, avpos: int list) =
  let
    val a1 = #a1 board; val a2 = #a2 board; val a3 = #a3 board
    val b1 = #b1 board; val b2 = #b2 board; val b3 = #b3 board
    val c1 = #c1 board; val c2 = #c2 board; val c3 = #c3 board
    
    (* Add all the fork patterns from Python version *)
    fun handleDiagonalFork() =
      if (b2 = #"O") then
        if (a3 = #"X" andalso c1 = #"X") orelse (a1 = #"X" andalso c3 = #"X") then
          let
            val sides = [2,4,6,8]
            val validSides = List.filter (fn x => List.exists (fn y => x = y) avpos) sides
          in
            if null validSides then
              (false, board, avpos)
            else
              let
                val randIdx = randomInt(length validSides)
                val pos = List.nth(validSides, randIdx)
                val newBoard = enterPos(board, O, pos)
                val newAvpos = List.filter (fn x => x <> pos) avpos
              in
                print("Computer chose Position " ^ Int.toString(pos) ^ "!\n");
                printGrid(newBoard);
                (true, newBoard, newAvpos)
              end
          end
        else (false, board, avpos)
      else (false, board, avpos)
    
    fun handleLShapedFork() =
      if (b2 = #"O") then
        (* X-O-X L-shaped patterns *)
        if (a2 = #"X" andalso b1 = #"X") then
          if (a1 <> #"X" andalso a1 <> #"O") then
            let 
              val newBoard = enterPos(board, O, 1)
              val newAvpos = List.filter (fn x => x <> 1) avpos
            in
              print("Computer chose Position 1!\n");
              printGrid(newBoard);
              (true, newBoard, newAvpos)
            end
          else (false, board, avpos)
        else if (b1 = #"X" andalso c2 = #"X") then
          if (c1 <> #"X" andalso c1 <> #"O") then
            let 
              val newBoard = enterPos(board, O, 7)
              val newAvpos = List.filter (fn x => x <> 7) avpos
            in
              print("Computer chose Position 7!\n");
              printGrid(newBoard);
              (true, newBoard, newAvpos)
            end
          else (false, board, avpos)
        else if (c2 = #"X" andalso b3 = #"X") then
          if (c3 <> #"X" andalso c3 <> #"O") then
            let 
              val newBoard = enterPos(board, O, 9)
              val newAvpos = List.filter (fn x => x <> 9) avpos
            in
              print("Computer chose Position 9!\n");
              printGrid(newBoard);
              (true, newBoard, newAvpos)
            end
          else (false, board, avpos)
        else if (b3 = #"X" andalso a2 = #"X") then
          if (a3 <> #"X" andalso a3 <> #"O") then
            let 
              val newBoard = enterPos(board, O, 3)
              val newAvpos = List.filter (fn x => x <> 3) avpos
            in
              print("Computer chose Position 3!\n");
              printGrid(newBoard);
              (true, newBoard, newAvpos)
            end
          else (false, board, avpos)
        else (false, board, avpos)
      else (false, board, avpos)
    
    (* Add the angled fork patterns from Python version *)
    fun handleAngledForks() =
      if (b2 = #"O") then
        (* Angled upward forks *)
        if (b1 = #"X" andalso a3 = #"X") then
          if (a1 <> #"X" andalso a1 <> #"O") then
            let 
              val newBoard = enterPos(board, O, 1)
              val newAvpos = List.filter (fn x => x <> 1) avpos
            in
              print("Computer chose Position 1!\n");
              printGrid(newBoard);
              (true, newBoard, newAvpos)
            end
          else (false, board, avpos)
        else if (a1 = #"X" andalso c2 = #"X") then
          if (c1 <> #"X" andalso c1 <> #"O") then
            let 
              val newBoard = enterPos(board, O, 7)
              val newAvpos = List.filter (fn x => x <> 7) avpos
            in
              print("Computer chose Position 7!\n");
              printGrid(newBoard);
              (true, newBoard, newAvpos)
            end
          else (false, board, avpos)
        else if (c1 = #"X" andalso b3 = #"X") then
          if (c3 <> #"X" andalso c3 <> #"O") then
            let 
              val newBoard = enterPos(board, O, 9)
              val newAvpos = List.filter (fn x => x <> 9) avpos
            in
              print("Computer chose Position 9!\n");
              printGrid(newBoard);
              (true, newBoard, newAvpos)
            end
          else (false, board, avpos)
        else if (c3 = #"X" andalso a2 = #"X") then
          if (a3 <> #"X" andalso a3 <> #"O") then
            let 
              val newBoard = enterPos(board, O, 3)
              val newAvpos = List.filter (fn x => x <> 3) avpos
            in
              print("Computer chose Position 3!\n");
              printGrid(newBoard);
              (true, newBoard, newAvpos)
            end
          else (false, board, avpos)
        (* Angled downward forks *)
        else if (b1 = #"X" andalso c3 = #"X") then
          if (c1 <> #"X" andalso c1 <> #"O") then
            let 
              val newBoard = enterPos(board, O, 7)
              val newAvpos = List.filter (fn x => x <> 7) avpos
            in
              print("Computer chose Position 7!\n");
              printGrid(newBoard);
              (true, newBoard, newAvpos)
            end
          else (false, board, avpos)
        else if (c2 = #"X" andalso a3 = #"X") then
          if (c3 <> #"X" andalso c3 <> #"O") then
            let 
              val newBoard = enterPos(board, O, 9)
              val newAvpos = List.filter (fn x => x <> 9) avpos
            in
              print("Computer chose Position 9!\n");
              printGrid(newBoard);
              (true, newBoard, newAvpos)
            end
          else (false, board, avpos)
        else if (a1 = #"X" andalso b3 = #"X") then
          if (a3 <> #"X" andalso a3 <> #"O") then
            let 
              val newBoard = enterPos(board, O, 3)
              val newAvpos = List.filter (fn x => x <> 3) avpos
            in
              print("Computer chose Position 3!\n");
              printGrid(newBoard);
              (true, newBoard, newAvpos)
            end
          else (false, board, avpos)
        else if (c1 = #"X" andalso a2 = #"X") then
          if (a1 <> #"X" andalso a1 <> #"O") then
            let 
              val newBoard = enterPos(board, O, 1)
              val newAvpos = List.filter (fn x => x <> 1) avpos
            in
              print("Computer chose Position 1!\n");
              printGrid(newBoard);
              (true, newBoard, newAvpos)
            end
          else (false, board, avpos)
        else (false, board, avpos)
      else (false, board, avpos)
    
    (* Handle X-X-O patterns like in Python version *)
    fun handleXXOPatterns() =
      if (b2 = #"X") then
        (* Vertical and horizontal patterns *)
        if (a2 = #"X" andalso c2 = #"O") then
          let
            val r = [7, 9]
            val validPositions = List.filter (fn x => List.exists (fn y => x = y) avpos) r
          in
            if null validPositions then
              (false, board, avpos)
            else
              let
                val randIdx = randomInt(length validPositions)
                val pos = List.nth(validPositions, randIdx)
                val newBoard = enterPos(board, O, pos)
                val newAvpos = List.filter (fn x => x <> pos) avpos
              in
                print("Computer chose Position " ^ Int.toString(pos) ^ "!\n");
                printGrid(newBoard);
                (true, newBoard, newAvpos)
              end
          end
        else if (b1 = #"X" andalso b3 = #"O") then
          let
            val r = [3, 9]
            val validPositions = List.filter (fn x => List.exists (fn y => x = y) avpos) r
          in
            if null validPositions then
              (false, board, avpos)
            else
              let
                val randIdx = randomInt(length validPositions)
                val pos = List.nth(validPositions, randIdx)
                val newBoard = enterPos(board, O, pos)
                val newAvpos = List.filter (fn x => x <> pos) avpos
              in
                print("Computer chose Position " ^ Int.toString(pos) ^ "!\n");
                printGrid(newBoard);
                (true, newBoard, newAvpos)
              end
          end
        (* Add more patterns... *)
        else (false, board, avpos)
      else (false, board, avpos)
      
    (* Try all anti-fork strategies in order *)
    val (found1, board1, avpos1) = handleDiagonalFork()
  in
    if found1 then (true, board1, avpos1)
    else 
      let val (found2, board2, avpos2) = handleLShapedFork() in
        if found2 then (true, board2, avpos2)
        else
          let val (found3, board3, avpos3) = handleAngledForks() in
            if found3 then (true, board3, avpos3)
            else
              let val (found4, board4, avpos4) = handleXXOPatterns() in
                (found4, board4, avpos4)
              end
          end
      end
  end

(* Computer AI: Make a random move *)
fun bestMove(board: board, avpos: int list) =
  if null avpos then
    (false, board, avpos)
  else
    let
      (* Choose random available position *)
      val randIndex = randomInt(length avpos)
      val pos = List.nth(avpos, randIndex)
      val newBoard = enterPos(board, O, pos)
      val newAvpos = List.filter (fn x => x <> pos) avpos
    in
      print("Computer chose Position " ^ Int.toString(pos) ^ "!\n");
      printGrid(newBoard);
      (true, newBoard, newAvpos)
    end

(* Play the game in single player mode with a given difficulty *)
fun playSinglePlayer(difficulty: string) =
  let
    val _ = print("Enter name of Player 1 (playing X) here: ")
    val p1 = readString()
    val p2 = "Computer"
    
    (* Initialize the game *)
    val board = initialBoard()
    val _ = printGrid(board)
    val avpos = [1,2,3,4,5,6,7,8,9]
    
    (* First move for impossible/hard difficulty *)
    fun firstComputerMove(board, avpos, playerPos) =
      if playerPos = 5 then
        (* Player took center, take a corner *)
        let
          val corners = [1,3,7,9]
          val randIndex = randomInt(length corners)
          val cornerPos = List.nth(corners, randIndex)
          val newBoard = enterPos(board, O, cornerPos)
          val newAvpos = List.filter (fn x => x <> cornerPos) avpos
        in
          print("Computer chose Position " ^ Int.toString(cornerPos) ^ "!\n");
          printGrid(newBoard);
          (newBoard, newAvpos)
        end
      else
        (* Player took non-center, take center *)
        let
          val newBoard = enterPos(board, O, 5)
          val newAvpos = List.filter (fn x => x <> 5) avpos
        in
          print("Computer chose Position 5!\n");
          printGrid(newBoard);
          (newBoard, newAvpos)
        end
    
    (* Define AI strategies for each difficulty *)
    fun impossibleStrategy(b, avp) = 
      let
        val (winFound, winB, winAvp) = winMove(b, avp)
      in
        if winFound then (true, winB, winAvp)
        else 
          let val (blockFound, blockB, blockAvp) = blockWin(b, avp) in
            if blockFound then (true, blockB, blockAvp)
            else 
              let val (forkFound, forkB, forkAvp) = antiFork(b, avp) in
                if forkFound then (true, forkB, forkAvp)
                else bestMove(b, avp)
              end
          end
      end
    
    fun hardStrategy(b, avp) = 
      let
        val (winFound, winB, winAvp) = winMove(b, avp)
      in
        if winFound then (true, winB, winAvp)
        else 
          let val (blockFound, blockB, blockAvp) = blockWin(b, avp) in
            if blockFound then (true, blockB, blockAvp)
            else bestMove(b, avp)
          end
      end
    
    fun mediumStrategy(b, avp) =
      let val (blockFound, blockB, blockAvp) = blockWin(b, avp) in
        if blockFound then (true, blockB, blockAvp)
        else bestMove(b, avp)
      end
    
    fun easyStrategy(b, avp) = bestMove(b, avp)
    
    (* Game loop for different AI behaviors *)
    fun gameLoop(board, avpos, strategy) =
      if checkWin(board, p1, p2) then
        (* Game ended with a win *)
        ()
      else if isDraw(avpos) then
        (* Game ended with a draw *)
        print(GREEN ^ "RESULT: The game was a draw!\n" ^ RESET)
      else
        (* Continue game *)
        let
          (* Player's turn *)
          val (playerBoard, playerAvpos) = getPlayerMove(board, avpos, p1)
        in
          (* Check if player won or game is a draw *)
          if checkWin(playerBoard, p1, p2) then
            (* Player wins *)
            ()
          else if isDraw(playerAvpos) then
            (* Draw *)
            print(GREEN ^ "RESULT: The game was a draw!\n" ^ RESET)
          else
            (* Computer's turn *)
            let
              val _ = print("Computer's turn, thinking...\n")
              (* Apply the selected strategy *)
              val (_, compBoard, compAvpos) = strategy(playerBoard, playerAvpos)
            in
              (* Continue game with updated state *)
              gameLoop(compBoard, compAvpos, strategy)
            end
        end
    
    (* Get first player move *)
    val (playerBoard, playerAvpos) = getPlayerMove(board, avpos, p1)
    
    (* Determine player's choice position *)
    val playerPos = 
      if #a1 playerBoard = #"X" then 1
      else if #a2 playerBoard = #"X" then 2
      else if #a3 playerBoard = #"X" then 3
      else if #b1 playerBoard = #"X" then 4
      else if #b2 playerBoard = #"X" then 5
      else if #b3 playerBoard = #"X" then 6
      else if #c1 playerBoard = #"X" then 7
      else if #c2 playerBoard = #"X" then 8
      else 9
      
    (* Handle computer's first move based on difficulty *)
    val (firstMoveBoard, firstMoveAvpos) =
      if difficulty = "I" orelse difficulty = "H" then
        let val _ = print("Computer's turn, entering a position...\n") in
          firstComputerMove(playerBoard, playerAvpos, playerPos)
        end
      else
        (* For medium/easy, just make a move based on strategy *)
        let
          val strategy = 
            if difficulty = "M" then mediumStrategy
            else easyStrategy
          val (_, moveBoard, moveAvpos) = strategy(playerBoard, playerAvpos)
        in
          (moveBoard, moveAvpos)
        end
          
    (* Select strategy based on difficulty *)
    val aiStrategy =
      case difficulty of
        "I" => impossibleStrategy
      | "H" => hardStrategy
      | "M" => mediumStrategy
      | _   => easyStrategy
    
    (* Game loop for Impossible difficulty with matching messages *)
    fun impossibleGameLoop(board, avpos) =
      if checkWin(board, p1, p2) then
        (* Game ended with a win *)
        ()
      else if isDraw(avpos) then
        (* Game ended with a draw *)
        (print("\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mWhile it may seem like it, we aren't equal, " ^ p1 ^ ". Try again.\033[0m\n\n");
         print(GREEN ^ "RESULT: The game was a draw!\n" ^ RESET))
      else
        (* Continue game *)
        let
          (* Player's turn *)
          val (playerBoard, playerAvpos) = getPlayerMove(board, avpos, p1)
        in
          (* Check if player won or game is a draw *)
          if checkWin(playerBoard, p1, p2) then
            (* Player wins - this should be extremely rare in impossible mode *)
            ()
          else if isDraw(playerAvpos) then
            (* Draw *)
            (print("\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mWhile it may seem like it, we aren't equal, " ^ p1 ^ ". Try again.\033[0m\n\n");
             print(GREEN ^ "RESULT: The game was a draw!\n" ^ RESET))
          else
            (* Computer's turn *)
            let
              val _ = print("Computer's turn, entering a position \033[36m(out of " ^ 
                           (String.concatWith "," (List.map Int.toString playerAvpos)) ^ 
                           ")\033[0m to mark O.\n")
              
              (* Apply the full impossible strategy *)
              val (winFound, winBoard, winAvpos) = winMove(playerBoard, playerAvpos)
            in
              if winFound then 
                let val _ = checkWin(winBoard, p1, p2) in
                  if checkWin(winBoard, p1, p2) then
                    print("\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mAt least you tried, " ^ p1 ^ ", but you were warned.\033[0m\n")
                  else if isDraw(winAvpos) then
                    (print("\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mWhile it may seem like it, we aren't equal, " ^ p1 ^ ". Try again.\033[0m\n\n");
                     print(GREEN ^ "RESULT: The game was a draw!\n" ^ RESET))
                  else 
                    impossibleGameLoop(winBoard, winAvpos)
                end
              else
                let val (blockFound, blockBoard, blockAvpos) = blockWin(playerBoard, playerAvpos) in
                  if blockFound then
                    let val _ = checkWin(blockBoard, p1, p2) in
                      if checkWin(blockBoard, p1, p2) then
                        print("\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mAt least you tried, " ^ p1 ^ ", but you were warned.\033[0m\n")
                      else if isDraw(blockAvpos) then
                        (print("\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mWhile it may seem like it, we aren't equal, " ^ p1 ^ ". Try again.\033[0m\n\n");
                         print(GREEN ^ "RESULT: The game was a draw!\n" ^ RESET))
                      else 
                        impossibleGameLoop(blockBoard, blockAvpos)
                    end
                  else
                    let val (forkFound, forkBoard, forkAvpos) = antiFork(playerBoard, playerAvpos) in
                      if forkFound then
                        let val _ = checkWin(forkBoard, p1, p2) in
                          if checkWin(forkBoard, p1, p2) then
                            print("\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mAt least you tried, " ^ p1 ^ ", but you were warned.\033[0m\n")
                          else if isDraw(forkAvpos) then
                            (print("\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mWhile it may seem like it, we aren't equal, " ^ p1 ^ ". Try again.\033[0m\n\n");
                             print(GREEN ^ "RESULT: The game was a draw!\n" ^ RESET))
                          else 
                            impossibleGameLoop(forkBoard, forkAvpos)
                        end
                      else
                        let val (_, bestBoard, bestAvpos) = bestMove(playerBoard, playerAvpos) in
                          let val _ = checkWin(bestBoard, p1, p2) in
                            if checkWin(bestBoard, p1, p2) then
                              print("\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mAt least you tried, " ^ p1 ^ ", but you were warned.\033[0m\n")
                            else if isDraw(bestAvpos) then
                              (print("\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mWhile it may seem like it, we aren't equal, " ^ p1 ^ ". Try again.\033[0m\n\n");
                               print(GREEN ^ "RESULT: The game was a draw!\n" ^ RESET))
                            else 
                              impossibleGameLoop(bestBoard, bestAvpos)
                          end
                        end
                    end
                end
            end
        end
        
    (* Special handling for Impossible difficulty first move *)
    val _ = 
      if difficulty = "I" then
        print("\033[1m\033[33mCOMPUTER:\033[0m \033[3mAh, so you have decided to challenge me? Let's do this.\033[0m\n ")
      else ()
    
  in
    if difficulty = "I" then
      let
        val (playerBoard, playerAvpos) = getPlayerMove(board, avpos, p1)
        val playerPos = 
          if #a1 playerBoard = #"X" then 1
          else if #a2 playerBoard = #"X" then 2
          else if #a3 playerBoard = #"X" then 3
          else if #b1 playerBoard = #"X" then 4
          else if #b2 playerBoard = #"X" then 5
          else if #b3 playerBoard = #"X" then 6
          else if #c1 playerBoard = #"X" then 7
          else if #c2 playerBoard = #"X" then 8
          else 9
        
        val _ = print("Computer's turn, entering a position...\n")
        val (firstMoveBoard, firstMoveAvpos) = firstComputerMove(playerBoard, playerAvpos, playerPos)
        val _ = print(" \n")
      in
        (* Use the special impossible game loop *)
        impossibleGameLoop(firstMoveBoard, firstMoveAvpos)
      end
    else
      (* Use standard game loop for other difficulties *)
      let
        val (playerBoard, playerAvpos) = getPlayerMove(board, avpos, p1)
        val playerPos = 
          if #a1 playerBoard = #"X" then 1
          else if #a2 playerBoard = #"X" then 2
          else if #a3 playerBoard = #"X" then 3
          else if #b1 playerBoard = #"X" then 4
          else if #b2 playerBoard = #"X" then 5
          else if #b3 playerBoard = #"X" then 6
          else if #c1 playerBoard = #"X" then 7
          else if #c2 playerBoard = #"X" then 8
          else 9
        
        val (firstMoveBoard, firstMoveAvpos) =
          if difficulty = "H" then
            let val _ = print("Computer's turn, entering a position...\n") in
              firstComputerMove(playerBoard, playerAvpos, playerPos)
            end
          else
            let
              val strategy = 
                if difficulty = "M" then mediumStrategy
                else easyStrategy
              
              val _ = print("Computer's turn, entering a position \033[36m(out of " ^ 
                           (String.concatWith "," (List.map Int.toString playerAvpos)) ^ 
                           ")\033[0m to mark O.\n")
              val (_, moveBoard, moveAvpos) = strategy(playerBoard, playerAvpos)
            in
              (moveBoard, moveAvpos)
            end
            
        val aiStrategy =
          case difficulty of
            "H" => hardStrategy
          | "M" => mediumStrategy
          | _   => easyStrategy
      in
        gameLoop(firstMoveBoard, firstMoveAvpos, aiStrategy)
      end
  end

(* Play the game in multiplayer mode *)
fun playMultiplayer() =
  let
    val _ = print("Enter name of Player 1 (playing X) here: ")
    val p1 = readString()
    val _ = print("Enter name of Player 2 (playing O) here: ")
    val p2 = readString()
    
    (* Initialize the game *)
    val board = initialBoard()
    val _ = printGrid(board)
    val avpos = [1,2,3,4,5,6,7,8,9]
    
    (* Game loop *)
    fun gameLoop(board, avpos, currentPlayer) =
      if checkWin(board, p1, p2) then
        (* Game ended with a win *)
        ()
      else if isDraw(avpos) then
        (* Game ended with a draw *)
        print(GREEN ^ "RESULT: The game was a draw!\n" ^ RESET)
      else
        (* Continue game with next player *)
        let
          val playerName = if currentPlayer = X then p1 else p2
          val mark = currentPlayer
          val _ = print("Your turn, " ^ playerName ^ ", enter a position (out of " ^ 
                     (String.concatWith "," (List.map Int.toString avpos)) ^ 
                     ") to mark " ^ (if mark = X then "X" else "O") ^ ": ")
          val input = readString()
        in
          case Int.fromString(input) of
            SOME pos =>
              if List.exists (fn x => x = pos) avpos then
                (* Valid move *)
                let
                  val newBoard = enterPos(board, mark, pos)
                  val newAvpos = List.filter (fn x => x <> pos) avpos
                  val nextPlayer = if currentPlayer = X then O else X
                in
                  gameLoop(newBoard, newAvpos, nextPlayer)
                end
              else
                (* Invalid position *)
                (print(RED ^ "Error: That position is invalid or occupied, please retry!\n" ^ RESET);
                gameLoop(board, avpos, currentPlayer))
          | NONE =>
              (* Not a number *)
              (print(RED ^ "Error: Please enter a valid number!\n" ^ RESET);
              gameLoop(board, avpos, currentPlayer))
        end
  in
    (* Start with player 1 (X) *)
    gameLoop(board, avpos, X)
  end

(* Main function *)
fun main() =
  let
    (* Print welcome message *)
    val _ = print(GREEN ^ "Welcome to the Tic Tac Toe game!\n\n\n")
    val _ = print(BLUE ^ "Please use the following guide for positions to mark on your turn!\n")
    val _ = print("1 | 2 | 3\n")
    val _ = print("——————————\n")
    val _ = print("4 | 5 | 6\n")
    val _ = print("——————————\n")
    val _ = print("7 | 8 | 9\n" ^ RESET ^ "\n")
    
    (* Choose game mode *)
    fun chooseMode() =
      let
        val _ = print(BLUE ^ "Would you like to (S) play single-player versus a Computer, or (D) play a one-versus-one with another player (Enter 'S' or 'D' only): " ^ RESET)
        val input = readString()
      in
        case String.map Char.toUpper input of
          "S" => "S"
        | "D" => "D"
        | _ => (print(RED ^ "Error: Please enter only 'S' or 'D' as your input!\n\n" ^ RESET); 
               chooseMode())
      end
    
    (* Choose difficulty for single player mode *)
    fun chooseDifficulty() =
      let
        val _ = print("Would like the difficulty of the Computer to be (E) Easy, (M) Medium, (H) Hard, or (I) Impossible? (Enter 'E','M','H', or 'I' only): ")
        val input = readString()
      in
        case String.map Char.toUpper input of
          "E" => "E"
        | "M" => "M"
        | "H" => "H"
        | "I" => "I"
        | _ => (print(RED ^ "Error: Please enter only 'E','M','H', or 'I' as your input!\n\n" ^ RESET);
               chooseDifficulty())
      end
    
    val mode = chooseMode()
  in
    if mode = "S" then
      let
        val difficulty = chooseDifficulty()
        val _ = print("\n")
      in
        playSinglePlayer(difficulty)
      end
    else
      playMultiplayer()
  end;

(* Start the game *)
main();