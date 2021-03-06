x <- c(1,3,5,6,7,2)
names <- c("a","b","c","d","e","f")
colfunc <- colorRampPalette(c( 'olivedrab',"white")) #"#336600",
color_gradient = 50
space = 0.2
width = 1

for (i in 1:color_gradient){
    colori = colfunc(color_gradient*2)[i]
    w = width*(1-(i-1)*(1.0/color_gradient))
    
    barplot(x, col = colori, names.arg=names,
        xlim = c(0, length(x)*(width+space)), ylim = c(0, 9),border= colori,
        width = w, space =  c((space+(1-w)/2)/w, rep((space+1-w)/w,length(x)-1)),
        axisnames = TRUE)
    par(new = TRUE)
    
    if (i == 1) {
        grid(nx=NA, ny=NULL,col = "lightgray", lty = "solid")
        par(new = TRUE)
        barplot(x, col = colori, names.arg=names,
            xlim = c(0, length(x)*(width+space)), ylim = c(0, 9),border= colori,
            width = w, space =  c((space+(1-w)/2)/w, rep((space+1-w)/w,length(x)-1)),
            axisnames = TRUE)
        par(new = TRUE)
    }
    
}
