#' Prepare
#'
#' Prepare \code{graphTweets} data for \code{sigmajs}.
#'
#' @param x A data.frame of edges or nodes.
#'
#' @rdname prepare
#' @export
edges2sg <- function(x){
  x$id <- seq(1, nrow(x))

  if("n_tweets" %in% names(x)){
    x$size <- x$n_tweets
    x$n_edges <- NULL
  }
  
  if("n" %in% names(x)){
    x$size <- x$n
    x$n <- NULL
  }

  return(x)
}

#' @rdname prepare
#' @export
nodes2sg <- function(x){

  if("nodes" %in% names(x)){
    label <- x$nodes
    id <- x$nodes

    re <- data.frame(
      id = id,
      label = label
    )

    x$nodes <- NULL

    x <- cbind.data.frame(re, x)
  }

  if("n_edges" %in% names(x)){
    x$size <- x$n_edges
    x$n_edges <- NULL
  }
  
  if("n" %in% names(x)){
    x$size <- x$n
    x$n <- NULL
  }

  return(x)
}

#' @importFrom zeallot %<-%
#' @export
zeallot::`%<-%`
