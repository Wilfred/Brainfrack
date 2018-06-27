let matching_close prog open_idx =
  let rec worker i depth =
    if (String.get prog i) == ']' then
      if depth == 0 then
        i
      else
        worker (i + 1) (depth - 1)
    else
      if (String.get prog i) == '[' then
        worker (i + 1) (depth + 1)
      else
        worker (i + 1) depth
  in
  worker (open_idx + 1) 0;;

let matching_open prog close_idx =
  let rec worker i depth =
    if (String.get prog i) == '[' then
      if depth == 0 then
        i
      else
        worker (i - 1) (depth - 1)
    else
      if (String.get prog i) == ']' then
        worker (i - 1) (depth + 1)
      else
        worker (i - 1) depth
  in
  worker (close_idx - 1) 0;;

let eval_bf prog =
  (* TODO: use a bigger cell array.*)
  let cells = (Array.make 1000 0) in
  let rec loop cell_idx instr_idx =
    if instr_idx > String.length prog then
      ()
    else
      let instr = (String.get prog instr_idx) in
      match instr with
        '+' ->
         let cell_val = Array.get cells cell_idx in
         Array.set cells cell_idx (cell_val + 1)
      | '-' ->
         let cell_val = Array.get cells cell_idx in
         Array.set cells cell_idx (cell_val - 1)
      | _ -> loop cell_idx (instr_idx + 1)
  in
  loop 0 0;;

let () = print_endline "hello world"
