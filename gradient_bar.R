#====================
#  script to plot bars with color gradient making a shadow-effect
#=====================
x <- c(1,3,5,6,7,2,7)
names <- c("a","b","c","d","e","f","g")

colfunc <- colorRampPalette(c( 'olivedrab',"white")) #"#336600",
color_gradient = 50 # number of gradient layers

#===== width and the space between bars
space = 0.2
width = 1
xlim = c(0, length(x)*(width+space)+space)
ylim = c(0, 9)
#===== bars are filled layer-by-layer with decreasing darckness and decreasing bar width
for (i in 1:color_gradient){
    colori = colfunc(color_gradient*2)[i] # next color ; here we increase the color array twice to keep everything darker
    w = width*(1-(i-1)*(1.0/color_gradient)) # next bar width   
    s = c((space+(1-w)/2)/w, rep((space+1-w)/w,length(x)-1))
    
    barplot(x, col = colori, names.arg=names,
        xlim = xlim, ylim =ylim,border= colori,
        width = w, space =  s,axisnames = TRUE)
    par(new = TRUE)
    #===== to make grid under bars we need to re-plot the first layer
    if (i == 1) {
        grid(nx=NA, ny=NULL,col = "lightgray", lty = "solid")
        par(new = TRUE)
        barplot(x, col = colori, names.arg=names,
            xlim = xlim, ylim = ylim,border= colori,
            width = w, space =  s, axisnames = TRUE)
         par(new = TRUE)
    }
    
}

