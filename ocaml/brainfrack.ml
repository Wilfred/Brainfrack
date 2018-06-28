let matching_close prog open_idx =
  let rec worker i depth =
    if (String.get prog i) = ']' then
      if depth = 0 then
        i
      else
        worker (i + 1) (depth - 1)
    else
      if (String.get prog i) = '[' then
        worker (i + 1) (depth + 1)
      else
        worker (i + 1) depth
  in
  worker (open_idx + 1) 0

let matching_open prog close_idx =
  let rec worker i depth =
    if (String.get prog i) = '[' then
      if depth = 0 then
        i
      else
        worker (i - 1) (depth - 1)
    else
      if (String.get prog i) = ']' then
        worker (i - 1) (depth + 1)
      else
        worker (i - 1) depth
  in
  worker (close_idx - 1) 0

(* Read all the lines from stdin until EOF. No concern given to
   efficiency. *) 
let read_all_stdin () =
  let text = ref "" in
  (try
    while true do
      text := !text ^ input_line stdin
    done
  with
    End_of_file -> ());
  !text

let eval_bf prog =
  let cells = (Array.make 30000 0) in
  let rec loop cell_idx instr_idx =
    if instr_idx >= String.length prog then
      (* Reached the end of the program, we're done! *)
      ()
    else
      let instr = (String.get prog instr_idx) in
      match instr with
        '+' ->
         let cell_val = Array.get cells cell_idx in
         Array.set cells cell_idx (cell_val + 1);
         loop cell_idx (instr_idx + 1)
      | '-' ->
         let cell_val = Array.get cells cell_idx in
         Array.set cells cell_idx (cell_val - 1);
         loop cell_idx (instr_idx + 1)
      | '>' ->
         loop (cell_idx + 1) (instr_idx + 1)
      | '<' ->
         loop (cell_idx - 1) (instr_idx + 1)
      | '.' ->
         let cell_val = Array.get cells cell_idx in
         print_char (Char.chr cell_val);
         loop cell_idx (instr_idx + 1)
      | ',' ->
         (* TODO: implement reading chars from stdin. *)
         loop cell_idx (instr_idx + 1)
      | '[' ->
         let cell_val = Array.get cells cell_idx in
         if cell_val = 0 then
           (* Step over the loop. *)
           loop cell_idx ((matching_close prog instr_idx) + 1)
         else
           (* Step into the loop. *)
           loop cell_idx (instr_idx + 1)
      | ']' ->
         (* Go back to the start of the loop. *)
         loop cell_idx (matching_open prog instr_idx)
      | _ ->
         (* This is a BF comment, just step over it. *)
         loop cell_idx (instr_idx + 1)
  in
  loop 0 0

let () =
  let prog = read_all_stdin () in
  eval_bf prog
