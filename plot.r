#!/usr/bin/Rscript

svg("bench.svg",width=11.32,height=7)

data <- read.table("out", na.strings="??")

yrange <- range(data$V3, data$V4, data$V5, 0,  na.rm = TRUE)
data$mean = rowMeans(data[c('V3', 'V4', 'V5')])

plot(data$V1, data$V3, ylim=yrange, type="l", col="blue", 
    xaxt="n", ylab="Benchmark Duration [s]", xlab="Date of Release", axes=FALSE)
points(data$V1, data$V3, ylim=yrange, col="blue")
lines(data$V1, data$V4, ylim=yrange, col="green")
points(data$V1, data$V4, ylim=yrange, col="green")
lines(data$V1, data$V5, ylim=yrange, col="orange")
points(data$V1, data$V5, ylim=yrange, col="orange")
legend("topright", legend=c("01-logmunge", "02-gauss-elimi", "03-mandelbrot", "average"), fill=c("blue", "green", "orange", "black"),
    cex=0.8, inset=c(0.01,0.01))
#lines(data$V1, data$V5, ylim=yrange, col="orange")
lines(data$V1, data$mean, ylim=yrange, col="black", lwd=3)
points(data$V1, data$mean, ylim=yrange, col="black")

axis(2)
r <- round(as.POSIXct(range(data$V1), origin="1970-01-01"), "days")
axis.POSIXct(1, at = seq(r[1], r[2], by = "month"), labels=FALSE)
axis.POSIXct(1, at = seq(r[1], r[2], by = "3 month"), format="%m.%Y")

dev.off()

svg("bench-broken.svg",width=11.32,height=7)

plot(data$V1, data$V6, ylim=yrange, type="l", col="red", 
    xaxt="n", ylab="Benchmark Duration [s]", xlab="Date of Release", axes=FALSE)
points(data$V1, data$V6, ylim=yrange, col="red")
legend("topright", legend=c("04-backend"), fill=c("red"),
    cex=0.8, inset=c(0.01,0.01))

axis(2)
r <- round(as.POSIXct(range(data$V1), origin="1970-01-01"), "days")
axis.POSIXct(1, at = seq(r[1], r[2], by = "month"), labels=FALSE)
axis.POSIXct(1, at = seq(r[1], r[2], by = "3 month"), format="%m.%Y")

dev.off()
