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

matching_close "[foo[] ]" 0;;

let () = print_endline "hello world"
