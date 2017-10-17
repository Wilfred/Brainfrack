module Brainfrack

MAX_CELLS = 100

prog = """
+[-]
+++++ +++++
+++++ +++++
+++++ +++++
+++ 33 is '!' in ASCII
.. print !!
"""

brainfrack_eval(prog)

function brainfrack_eval(program::String)::Void
    prog_idx = 1
    cells = zeros(Int64, MAX_CELLS)
    cell_idx = 1

    while prog_idx <= length(program)
        char = program[prog_idx]

        # Modify cells.
        if char == '+'
            cells[cell_idx] += 1
            prog_idx += 1
        elseif char == '-'
            cells[cell_idx] -= 1
            prog_idx += 1

        # I/O.
        elseif char == '.'
            print(Char(cells[cell_idx]))
            prog_idx += 1
        elseif char == ','
            print("TODO")
            prog_idx += 1
        else
            # Skip over this character.
            prog_idx += 1
        end
    end
end

"Find the position of the closing [ that matches the ] at start_idx."
function find_matching_close(program::String, start_idx::Int64)::Int64
    depth = 0
    for (index, char) in enumerate(program)
        if index < start_idx
            continue
        end
        if char == '['
            depth += 1
        elseif char == ']'
            depth -= 1
            if depth == 0
                return index
            end
        end
    end
end

function find_matching_open(program::String, start_idx::Int64)::Int64
    depth = 0

    for i in length(program):-1:1
        if i > start_idx
            continue
        end

        char = program[i]
        if char == ']'
            depth += 1
        elseif char == '['
            depth -= 1
            if depth == 0
                return i
            end
        end
    end
end

end
