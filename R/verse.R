pkgs <- c("rtweet", "graphTweets")

is_attached <- function(x) {
  paste0("package:", x) %in% search()
}

unloaded_pkgs <- function(pkgs){
  pkgs[!is_attached(pkgs)]
}

twiverse_attach <- function(pkgs){
  suppressPackageStartupMessages(
    lapply(pkgs, library, character.only = TRUE, warn.conflicts = FALSE)
  )
}

.onAttach <- function(...) {
  missing <- unloaded_pkgs(pkgs)
  if (length(missing) == 0)
    return()

  twiverse_attach(missing)

}
