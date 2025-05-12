% filepath: /Users/aryandaga/Downloads/VSC/LearningShit/TicTacToe/tictactoe.m
% TicTacToe game in MATLAB
% Based on the Python implementation

% Defining Objects -------------------------------------------------------------
a1 = ' '; a2 = ' '; a3 = ' ';
b1 = ' '; b2 = ' '; b3 = ' ';
c1 = ' '; c2 = ' '; c3 = ' ';
avpos = [1, 2, 3, 4, 5, 6, 7, 8, 9];
af = false;
nb = false;
bm = false;
moved = false;
end_game = false;

% Custom Functions -------------------------------------------------------------
function grid()
    % Custom Function to print the grid after each turn.
    global a1 a2 a3 b1 b2 b3 c1 c2 c3
    fprintf('\033[34m\n');
    fprintf('%c | %c | %c\n', a1, a2, a3);
    fprintf('——————————\n');
    fprintf('%c | %c | %c\n', b1, b2, b3);
    fprintf('——————————\n');
    fprintf('%c | %c | %c\n', c1, c2, c3);
    fprintf('\033[0m\n');
end

function enter_pos(mark, pos)
    % Custom Function to enter a position and parse it.
    global a1 a2 a3 b1 b2 b3 c1 c2 c3 avpos
    switch pos
        case 1
            a1 = mark;
            avpos = avpos(avpos ~= 1);
            grid();
        case 2
            a2 = mark;
            avpos = avpos(avpos ~= 2);
            grid();
        case 3
            a3 = mark;
            avpos = avpos(avpos ~= 3);
            grid();
        case 4
            b1 = mark;
            avpos = avpos(avpos ~= 4);
            grid();
        case 5
            b2 = mark;
            avpos = avpos(avpos ~= 5);
            grid();
        case 6
            b3 = mark;
            avpos = avpos(avpos ~= 6);
            grid();
        case 7
            c1 = mark;
            avpos = avpos(avpos ~= 7);
            grid();
        case 8
            c2 = mark;
            avpos = avpos(avpos ~= 8);
            grid();
        case 9
            c3 = mark;
            avpos = avpos(avpos ~= 9);
            grid();
    end
end

function result = check_win()
    % Custom Function to check if a player/engine won.
    global a1 a2 a3 b1 b2 b3 c1 c2 c3 end_game p1 p2
    end_game = false;
    fprintf('\n');
    
    % Horizontal Win (X)
    if strcmp(a1, 'X') && strcmp(a2, 'X') && strcmp(a3, 'X')
        fprintf('\033[32mRESULT: %s won the game!\033[0m\n', p1);
        end_game = true;
    end
    if strcmp(b1, 'X') && strcmp(b2, 'X') && strcmp(b3, 'X')
        fprintf('\033[32mRESULT: %s won the game!\033[0m\n', p1);
        end_game = true;
    end
    if strcmp(c1, 'X') && strcmp(c2, 'X') && strcmp(c3, 'X')
        fprintf('\033[32mRESULT: %s won the game!\033[0m\n', p1);
        end_game = true;
    end
    
    % Vertical Win (X)
    if strcmp(a1, 'X') && strcmp(b1, 'X') && strcmp(c1, 'X')
        fprintf('\033[32mRESULT: %s won the game!\033[0m\n', p1);
        end_game = true;
    end
    if strcmp(a2, 'X') && strcmp(b2, 'X') && strcmp(c2, 'X')
        fprintf('\033[32mRESULT: %s won the game!\033[0m\n', p1);
        end_game = true;
    end
    if strcmp(a3, 'X') && strcmp(b3, 'X') && strcmp(c3, 'X')
        fprintf('\033[32mRESULT: %s won the game!\033[0m\n', p1);
        end_game = true;
    end
    
    % Diagonal Win (X)
    if strcmp(a1, 'X') && strcmp(b2, 'X') && strcmp(c3, 'X')
        fprintf('\033[32mRESULT: %s won the game!\033[0m\n', p1);
        end_game = true;
    end
    if strcmp(a3, 'X') && strcmp(b2, 'X') && strcmp(c1, 'X')
        fprintf('\033[32mRESULT: %s won the game!\033[0m\n', p1);
        end_game = true;
    end
    
    % Horizontal Win (O)
    if strcmp(a1, 'O') && strcmp(a2, 'O') && strcmp(a3, 'O')
        fprintf('\033[32mRESULT: %s won the game!\033[0m\n', p2);
        end_game = true;
    end
    if strcmp(b1, 'O') && strcmp(b2, 'O') && strcmp(b3, 'O')
        fprintf('\033[32mRESULT: %s won the game!\033[0m\n', p2);
        end_game = true;
    end
    if strcmp(c1, 'O') && strcmp(c2, 'O') && strcmp(c3, 'O')
        fprintf('\033[32mRESULT: %s won the game!\033[0m\n', p2);
        end_game = true;
    end
    
    % Vertical Win (O)
    if strcmp(a1, 'O') && strcmp(b1, 'O') && strcmp(c1, 'O')
        fprintf('\033[32mRESULT: %s won the game!\033[0m\n', p2);
        end_game = true;
    end
    if strcmp(a2, 'O') && strcmp(b2, 'O') && strcmp(c2, 'O')
        fprintf('\033[32mRESULT: %s won the game!\033[0m\n', p2);
        end_game = true;
    end
    if strcmp(a3, 'O') && strcmp(b3, 'O') && strcmp(c3, 'O')
        fprintf('\033[32mRESULT: %s won the game!\033[0m\n', p2);
        end_game = true;
    end
    
    % Diagonal Win (O)
    if strcmp(a1, 'O') && strcmp(b2, 'O') && strcmp(c3, 'O')
        fprintf('\033[32mRESULT: %s won the game!\033[0m\n', p2);
        end_game = true;
    end
    if strcmp(a3, 'O') && strcmp(b2, 'O') && strcmp(c1, 'O')
        fprintf('\033[32mRESULT: %s won the game!\033[0m\n', p2);
        end_game = true;
    end
    
    if end_game
        result = 'break';
    else
        result = '';
    end
end

function result = block_win()
    % Custom Function for the Engine to block any potential wins.
    global a1 a2 a3 b1 b2 b3 c1 c2 c3 nb avpos
    nb = false;
    
    if (strcmp(a2, 'X') && strcmp(a3, 'X')) || (strcmp(b1, 'X') && strcmp(c1, 'X')) || (strcmp(b2, 'X') && strcmp(c3, 'X'))
        if ~strcmp(a1, 'O') && ~strcmp(a1, 'X')
            a1 = 'O';
            avpos = avpos(avpos ~= 1);
            fprintf('Computer chose Position 1!\n');
            grid();
            nb = true;
            result = nb;
            return;
        end
    end
    
    if (strcmp(a1, 'X') && strcmp(a3, 'X')) || (strcmp(b2, 'X') && strcmp(c2, 'X'))
        if ~strcmp(a2, 'O') && ~strcmp(a2, 'X')
            a2 = 'O';
            avpos = avpos(avpos ~= 2);
            fprintf('Computer chose Position 2!\n');
            grid();
            nb = true;
            result = nb;
            return;
        end
    end
    
    if (strcmp(a1, 'X') && strcmp(a2, 'X')) || (strcmp(b2, 'X') && strcmp(c1, 'X')) || (strcmp(b3, 'X') && strcmp(c3, 'X'))
        if ~strcmp(a3, 'O') && ~strcmp(a3, 'X')
            a3 = 'O';
            avpos = avpos(avpos ~= 3);
            fprintf('Computer chose Position 3!\n');
            grid();
            nb = true;
            result = nb;
            return;
        end
    end
    
    if (strcmp(a1, 'X') && strcmp(c1, 'X')) || (strcmp(b2, 'X') && strcmp(b3, 'X'))
        if ~strcmp(b1, 'O') && ~strcmp(b1, 'X')
            b1 = 'O';
            avpos = avpos(avpos ~= 4);
            fprintf('Computer chose Position 4!\n');
            grid();
            nb = true;
            result = nb;
            return;
        end
    end
    
    if (strcmp(a1, 'X') && strcmp(c3, 'X')) || (strcmp(a2, 'X') && strcmp(c2, 'X')) || (strcmp(a3, 'X') && strcmp(c1, 'X')) || (strcmp(b1, 'X') && strcmp(b3, 'X'))
        if ~strcmp(b2, 'O') && ~strcmp(b2, 'X')
            b2 = 'O';
            avpos = avpos(avpos ~= 5);
            fprintf('Computer chose Position 5!\n');
            grid();
            nb = true;
            result = nb;
            return;
        end
    end
    
    if (strcmp(a3, 'X') && strcmp(c3, 'X')) || (strcmp(b1, 'X') && strcmp(b2, 'X'))
        if ~strcmp(b3, 'O') && ~strcmp(b3, 'X')
            b3 = 'O';
            avpos = avpos(avpos ~= 6);
            fprintf('Computer chose Position 6!\n');
            grid();
            nb = true;
            result = nb;
            return;
        end
    end
    
    if (strcmp(a1, 'X') && strcmp(b1, 'X')) || (strcmp(c2, 'X') && strcmp(c3, 'X')) || (strcmp(a3, 'X') && strcmp(b2, 'X'))
        if ~strcmp(c1, 'O') && ~strcmp(c1, 'X')
            c1 = 'O';
            avpos = avpos(avpos ~= 7);
            fprintf('Computer chose Position 7!\n');
            grid();
            nb = true;
            result = nb;
            return;
        end
    end
    
    if (strcmp(a2, 'X') && strcmp(b2, 'X')) || (strcmp(c1, 'X') && strcmp(c3, 'X'))
        if ~strcmp(c2, 'O') && ~strcmp(c2, 'X')
            c2 = 'O';
            avpos = avpos(avpos ~= 8);
            fprintf('Computer chose Position 8!\n');
            grid();
            nb = true;
            result = nb;
            return;
        end
    end
    
    if (strcmp(a3, 'X') && strcmp(b3, 'X')) || (strcmp(a1, 'X') && strcmp(b2, 'X')) || (strcmp(c1, 'X') && strcmp(c2, 'X'))
        if ~strcmp(c3, 'O') && ~strcmp(c3, 'X')
            c3 = 'O';
            avpos = avpos(avpos ~= 9);
            fprintf('Computer chose Position 9!\n');
            grid();
            nb = true;
            result = nb;
            return;
        end
    end
    
    result = nb;
end

function result = win_move()
    % Custom Function for the Engine to make a winning move.
    global a1 a2 a3 b1 b2 b3 c1 c2 c3 moved avpos
    moved = false;
    
    if (strcmp(a2, 'O') && strcmp(a3, 'O')) || (strcmp(b1, 'O') && strcmp(c1, 'O')) || (strcmp(b2, 'O') && strcmp(c3, 'O'))
        if ~strcmp(a1, 'X') && ~strcmp(a1, 'O')
            a1 = 'O';
            avpos = avpos(avpos ~= 1);
            fprintf('Computer chose Position 1!\n');
            grid();
            moved = true;
            result = moved;
            return;
        end
    end
    
    if (strcmp(a1, 'O') && strcmp(a3, 'O')) || (strcmp(b2, 'O') && strcmp(c2, 'O'))
        if ~strcmp(a2, 'X') && ~strcmp(a2, 'O')
            a2 = 'O';
            avpos = avpos(avpos ~= 2);
            fprintf('Computer chose Position 2!\n');
            grid();
            moved = true;
            result = moved;
            return;
        end
    end
    
    % Add more winning move checks similar to above for all positions
    % ...
    
    % Example for position 3:
    if (strcmp(a1, 'O') && strcmp(a2, 'O')) || (strcmp(b2, 'O') && strcmp(c1, 'O')) || (strcmp(b3, 'O') && strcmp(c3, 'O'))
        if ~strcmp(a3, 'X') && ~strcmp(a3, 'O')
            a3 = 'O';
            avpos = avpos(avpos ~= 3);
            fprintf('Computer chose Position 3!\n');
            grid();
            moved = true;
            result = moved;
            return;
        end
    end
    
    result = moved;
end

function result = anti_fork()
    % Custom function for countering forks.
    global a1 a2 a3 b1 b2 b3 c1 c2 c3 af avpos
    af = false;
    
    if strcmp(b2, 'O')
        % X-O-X series (diagonal, rotated)
        if strcmp(a3, 'X') && strcmp(c1, 'X') && strcmp(b2, 'O')
            r = [2, 4, 6, 8];
            rc = r(randi(length(r)));
            if rc == 2
                if ~strcmp(a2, 'O') && ~strcmp(a2, 'X')
                    a2 = 'O';
                    avpos = avpos(avpos ~= 2);
                    fprintf('Computer chose Position 2!\n');
                    grid();
                    af = true;
                    result = af;
                    return;
                end
            end
            if rc == 4
                if ~strcmp(b1, 'O') && ~strcmp(b1, 'X')
                    b1 = 'O';
                    avpos = avpos(avpos ~= 4);
                    fprintf('Computer chose Position 4!\n');
                    grid();
                    af = true;
                    result = af;
                    return;
                end
            end
            if rc == 6
                if ~strcmp(b3, 'O') && ~strcmp(b3, 'X')
                    b3 = 'O';
                    avpos = avpos(avpos ~= 6);
                    fprintf('Computer chose Position 6!\n');
                    grid();
                    af = true;
                    result = af;
                    return;
                end
            end
            if rc == 8
                if ~strcmp(c2, 'O') && ~strcmp(c2, 'X')
                    c2 = 'O';
                    avpos = avpos(avpos ~= 8);
                    fprintf('Computer chose Position 8!\n');
                    grid();
                    af = true;
                    result = af;
                    return;
                end
            end
        end
        
        % Add more anti-fork scenarios similar to the one above
        % ...
        
        % Example for another anti-fork scenario:
        if strcmp(a1, 'X') && strcmp(c3, 'X') && strcmp(b2, 'O')
            r = [2, 4, 6, 8];
            rc = r(randi(length(r)));
            if rc == 2 && ~strcmp(a2, 'O') && ~strcmp(a2, 'X')
                a2 = 'O';
                avpos = avpos(avpos ~= 2);
                fprintf('Computer chose Position 2!\n');
                grid();
                af = true;
                result = af;
                return;
            end
            % Continue with other positions...
        end
    end
    
    result = af;
end

function result = best_move()
    % Custom Function for making a random move.
    global a1 a2 a3 b1 b2 b3 c1 c2 c3 bm nb moved avpos
    bm = false;
    
    if nb == false && moved == false
        if ~isempty(avpos)
            ranpos = avpos(randi(length(avpos)));
            switch ranpos
                case 1
                    a1 = 'O';
                    avpos = avpos(avpos ~= 1);
                    fprintf('Computer chose Position %d!\n', ranpos);
                    grid();
                    bm = true;
                case 2
                    a2 = 'O';
                    avpos = avpos(avpos ~= 2);
                    fprintf('Computer chose Position %d!\n', ranpos);
                    grid();
                    bm = true;
                case 3
                    a3 = 'O';
                    avpos = avpos(avpos ~= 3);
                    fprintf('Computer chose Position %d!\n', ranpos);
                    grid();
                    bm = true;
                case 4
                    b1 = 'O';
                    avpos = avpos(avpos ~= 4);
                    fprintf('Computer chose Position %d!\n', ranpos);
                    grid();
                    bm = true;
                case 5
                    b2 = 'O';
                    avpos = avpos(avpos ~= 5);
                    fprintf('Computer chose Position %d!\n', ranpos);
                    grid();
                    bm = true;
                case 6
                    b3 = 'O';
                    avpos = avpos(avpos ~= 6);
                    fprintf('Computer chose Position %d!\n', ranpos);
                    grid();
                    bm = true;
                case 7
                    c1 = 'O';
                    avpos = avpos(avpos ~= 7);
                    fprintf('Computer chose Position %d!\n', ranpos);
                    grid();
                    bm = true;
                case 8
                    c2 = 'O';
                    avpos = avpos(avpos ~= 8);
                    fprintf('Computer chose Position %d!\n', ranpos);
                    grid();
                    bm = true;
                case 9
                    c3 = 'O';
                    avpos = avpos(avpos ~= 9);
                    fprintf('Computer chose Position %d!\n', ranpos);
                    grid();
                    bm = true;
            end
        end
    end
    
    result = bm;
end

% Main Game Loop ---------------------------------------------------------------
% Print Introduction
fprintf('\033[32mWelcome to the Tic Tac Toe game!\n\n\n');
fprintf('\033[34mPlease use the following guide for positions to mark on your turn!\n');
fprintf('1 | 2 | 3\n');
fprintf('——————————\n');
fprintf('4 | 5 | 6\n');
fprintf('——————————\n');
fprintf('7 | 8 | 9\033[0m\n\n');

% Choose Game Mode
while true
    fprintf('\033[34m');
    choice = input('Would you like to (S) play single-player versus a Computer, or (D) play a one-versus-one with another player (Enter ''S'' or ''D'' only): ', 's');
    choice = upper(choice);
    
    if strcmp(choice, 'S')
        mode = 'S';
        % Choose difficulty
        while true
            hard = input('Would like the difficulty of the Computer to be (E) Easy, (M) Medium, (H) Hard, or (I) Impossible? (Enter ''E'',''M'',''H'', or ''I'' only): ', 's');
            hard = upper(hard);
            fprintf('\033[0m');
            
            if strcmp(hard, 'E') || strcmp(hard, 'M') || strcmp(hard, 'H') || strcmp(hard, 'I')
                break;
            else
                fprintf('\033[31mError: Please enter only ''E'',''M'',''H'', or ''I'' as your input!\033[0m\n\n');
            end
        end
        break;
    elseif strcmp(choice, 'D')
        mode = 'D';
        break;
    else
        fprintf('\033[31mError: Please enter only ''S'' or ''D'' as your input!\033[0m\n\n');
    end
end

fprintf('\n');

% SINGLE PLAYER MODE
if strcmp(mode, 'S')
    % IMPOSSIBLE DIFFICULTY
    if strcmp(hard, 'I')
        fprintf('\033[1m\033[33mCOMPUTER:\033[0m \033[3mAh, so you have decided to challenge me? Let''s do this.\033[0m\n ');
        p1 = input('Enter name of Player 1 (playing X) here: ', 's');
        p2 = 'Computer';
        grid();
        
        % Player Turn 1
        while true
            try
                fprintf('Your turn, %s, enter a position \033[36m(out of %s)\033[0m to mark X: ', p1, mat2str(avpos));
                pos = input('');
                if ismember(pos, avpos)
                    break;
                else
                    fprintf('\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n\n');
                end
            catch
                fprintf('\033[31mError: Please retry with a valid numeric value!\033[0m\n\n');
            end
        end
        
        mark = 'X';
        enter_pos(mark, pos);
        fprintf('\n');
        
        % Engine Turn 1
        fprintf('Computer''s turn, entering a position \033[36m(out of %s)\033[0m to mark O.\n', mat2str(avpos));
        
        if pos == 1 || pos == 2 || pos == 3 || pos == 4 || pos == 6 || pos == 7 || pos == 8 || pos == 9
            % Player chose a non-center value
            fprintf('Computer chose Position 5!\n');
            b2 = 'O';
            avpos = avpos(avpos ~= 5);
            grid();
        elseif pos == 5
            % If Player chose center
            corners = [1, 3, 7, 9];
            cpos = corners(randi(length(corners)));
            enter_pos('O', cpos);
        end
        
        fprintf(' \n');
        
        % Loop for Turn 2 Onwards
        while ~end_game
            % Player Turn 2 onwards
            while true
                try
                    fprintf('Your turn, %s, enter a position \033[36m(out of %s)\033[0m to mark X: ', p1, mat2str(avpos));
                    pos = input('');
                    if ismember(pos, avpos)
                        break;
                    else
                        fprintf('\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n\n');
                    end
                catch
                    fprintf('\033[31mError: Please retry with a valid numeric value!\033[0m\n\n');
                end
            end
            
            mark = 'X';
            enter_pos(mark, pos);
            
            % Check for potential wins
            res = check_win();
            if strcmp(res, 'break')
                fprintf('\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mAt least you tried, %s, but you were warned.\033[0m\n', p1);
                break;
            end
            
            if isempty(avpos)
                fprintf('\033[1m\033[33mCOMPUTER:\033[0m \033[3mWhile it may seem like it, we aren''t equal, %s. Try again.\033[0m\n\n', p1);
                fprintf('\033[32mRESULT: The game was a draw!\033[0m\n');
                break;
            end
            
            % AI Turn 2 Onwards
            fprintf('Computer''s turn, entering a position \033[36m(out of %s)\033[0m to mark O.\n', mat2str(avpos));
            
            w = win_move(); % Trying to find a winning move
            if ~w
                b = block_win(); % Blocking immediate threats
                if ~b
                    a = anti_fork(); % Blocking tactical moves with counter-tactics
                    if ~a
                        best_move(); % Random move if nothing else works
                    end
                end
            end
            
            % Check for potential wins
            res = check_win();
            if strcmp(res, 'break')
                fprintf('\n\033[1m\033[33mCOMPUTER:\033[0m \033[3mAt least you tried, %s, but you were warned.\033[0m\n', p1);
                break;
            end
            
            if isempty(avpos)
                fprintf('\033[1m\033[33mCOMPUTER:\033[0m \033[3mWhile it may seem like it, we aren''t equal, %s. Try again.\033[0m\n\n', p1);
                fprintf('\033[32mRESULT: The game was a draw!\033[0m\n');
                break;
            end
        end
    end
    
    % HARD DIFFICULTY
    if strcmp(hard, 'H')
        p1 = input('Enter name of Player 1 (playing X) here: ', 's');
        p2 = 'Computer';
        grid();
        
        % Player Turn 1
        while true
            try
                fprintf('Your turn, %s, enter a position \033[36m(out of %s)\033[0m to mark X: ', p1, mat2str(avpos));
                pos = input('');
                if ismember(pos, avpos)
                    break;
                else
                    fprintf('\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n\n');
                end
            catch
                fprintf('\033[31mError: Please retry with a valid numeric value!\033[0m\n\n');
            end
        end
        
        mark = 'X';
        enter_pos(mark, pos);
        fprintf('\n');
        
        % Engine Turn 1
        fprintf('Computer''s turn, entering a position \033[36m(out of %s)\033[0m to mark O.\n', mat2str(avpos));
        
        if pos == 1 || pos == 2 || pos == 3 || pos == 4 || pos == 6 || pos == 7 || pos == 8 || pos == 9
            % Player chose a non-center value
            fprintf('Computer chose Position 5!\n');
            b2 = 'O';
            avpos = avpos(avpos ~= 5);
            grid();
        elseif pos == 5
            % If Player chose center, make random move
            ranpos = avpos(randi(length(avpos)));
            enter_pos('O', ranpos);
        end
        
        fprintf(' \n');
        
        % Loop for Turn 2 Onwards
        while ~end_game
            % Player Turn 2 onwards
            while true
                try
                    fprintf('Your turn, %s, enter a position \033[36m(out of %s)\033[0m to mark X: ', p1, mat2str(avpos));
                    pos = input('');
                    if ismember(pos, avpos)
                        break;
                    else
                        fprintf('\033[31mError: That position is already invalid/occupied, please retry!\033[0m\n\n');
                    end
                catch
                    fprintf('\033[31mError: Please retry with a valid numeric value!\033[0m\n\n');
                end
            end
            
            mark = 'X';
            enter_pos(mark, pos);
            
            % Check for potential wins
            res = check_win();
            if strcmp(res, 'break')
                break;
            end
            
            if isempty(avpos)
                fprintf('\033[32mRESULT: The game was a draw!\033[0m\n');
                break;
            end
            
            % AI Turn 2 Onwards
            if ~end_game
                fprintf('Computer''s turn, entering a position \033[36m(out of %s)\033[0m to mark O.\n', mat2str(avpos));
                
                w = win_move(); % Trying to find a winning move
                if ~w
                    b = block_win(); % Blocking immediate threats
                    if ~b
                        best_move(); % Random move
                    end
                end
                
                % Check for potential wins
                res = check_win();
                if strcmp(res, 'break')
                    break;
                end
                
                if isempty(avpos)
                    fprintf('\033[32mRESULT: The game was a draw!\033[0m\n');
                    break;
                end
            end
        end
    end
    
    % Continue with Medium and Easy difficulties...
end

% MULTIPLAYER MODE
if strcmp(mode, 'D')
    % Implementation of multiplayer mode
end