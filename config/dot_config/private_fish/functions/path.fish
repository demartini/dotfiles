function path --description 'Show PATH in a human-readable format.'
  echo $PATH | tr " " "\n" | nl
end
