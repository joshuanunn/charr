let read_file path =
  let chan = open_in path in
  Fun.protect
    ~finally:(fun () -> close_in_noerr chan)
    (fun () ->
      let len = in_channel_length chan in
      really_input_string chan len)

let assembly_path path =
  let base = Filename.remove_extension path in
  base ^ ".s"
