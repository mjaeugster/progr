
stopifnot(require("knitr"))
stopifnot(require("whisker"))
stopifnot(require("tools"))


make_chapter <- function(file, master_file = "progr-chapter.whisker") {
  child <- readLines(file)

  data <- list()
  data$ch_number <- chapter_number(child)
  data$ch_title <- chapter_title(child)
  data$ch_file <- file
  data$ch_mtime <- format(Sys.Date())

  master <- readLines(master_file)
  master <- whisker.render(master, data)

  master_rnw <- sub("[.][^.]*$", "", master_file)
  master_rnw <- sprintf("%s-%s.Rnw", master_rnw, data$ch_number)

  cat(master, file = master_rnw)

  master_tex <- knit(master_rnw)

  texi2pdf(master_tex, clean = TRUE, quiet = FALSE)

  child_tex <- sub("[.][^.]*$", "", file)
  child_tex <- sprintf("%s.tex", child_tex)

  unlink(master_tex)
  unlink(master_rnw)
  unlink(child_tex)
}



chapter_number <- function(raw) {
  number <- grep("progrchapternumber", raw, value = TRUE)
  number <- gsub(".progrchapternumber{(\\d+)}", "\\1", number, perl = TRUE)
  number <- as.numeric(number) + 1

  number
}



chapter_title <- function(raw) {
  title <- grep("progrchapter{", raw, value = TRUE, perl = TRUE)
  title <- gsub(".progrchapter{(.+)}", "\\1", title, perl = TRUE)

  title
}

