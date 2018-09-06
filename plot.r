#!/usr/bin/Rscript

svg("bench.svg",width=11.32,height=7)

data <- read.table("out", na.strings="??")

yrange <- range(data$V3, data$V4, data$V5, 0,  na.rm = TRUE)
data$mean = rowMeans(data[c('V3', 'V4')])

plot(data$V1, data$V3, ylim=yrange, type="l", col="blue", 
    xaxt="n", ylab="Benchmark Duration [s]", xlab="Date of Release", axes=FALSE)
lines(data$V1, data$V4, ylim=yrange, col="green")
legend("topright", legend=c("01-logmunge", "02-gauss-elimi", "total"), fill=c("blue", "green", "black"),
    cex=0.8, inset=c(0.01,0.01))
#lines(data$V1, data$V5, ylim=yrange, col="orange")
lines(data$V1, data$mean, ylim=yrange, col="black", lwd=3)

axis(2)
r <- round(as.POSIXct(range(data$V1), origin="1970-01-01"), "days")
axis.POSIXct(1, at = seq(r[1], r[2], by = "month"), labels=FALSE)
axis.POSIXct(1, at = seq(r[1], r[2], by = "3 month"), format="%m.%Y")

dev.off()

svg("bench-broken.svg",width=11.32,height=7)

plot(data$V1, data$V5, ylim=yrange, type="l", col="orange", 
    xaxt="n", ylab="Benchmark Duration [s]", xlab="Date of Release", axes=FALSE)
legend("topright", legend=c("03-backend"), fill=c("orange"),
    cex=0.8, inset=c(0.01,0.01))

axis(2)
r <- round(as.POSIXct(range(data$V1), origin="1970-01-01"), "days")
axis.POSIXct(1, at = seq(r[1], r[2], by = "month"), labels=FALSE)
axis.POSIXct(1, at = seq(r[1], r[2], by = "3 month"), format="%m.%Y")

dev.off()
