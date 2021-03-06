read.osc <- function ( file
                     , drop.id     = FALSE
                     , drop.coord  = FALSE
                     , drop.norm   = FALSE
                     , simplify    = FALSE
                     , ...) {

osctable <- read.table(
	file,
	header		=	TRUE,
	colClasses	=	c('id'='character'),
	skip		=	length(read.oscheader(file)) -1,
	comment.char	=	'',
	...)

rownames(osctable) <- ChromosomeCoordinates(osctable)

if (drop.id)    osctable <- osctable[, -grep("^id$",    colnames(osctable))]
if (drop.coord) osctable <- osctable[, c(grep("raw\\.", colnames(osctable)), grep("norm\\.", colnames(osctable)))]
if (drop.norm)  osctable <- osctable[, -grep("norm\\.", colnames(osctable))]

if (! simplify == FALSE)
  colnames(osctable) <- sub( simplify
                           , ''
                           , colnames(osctable))

return(osctable)
}
