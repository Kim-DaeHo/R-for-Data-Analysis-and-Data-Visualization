#-------------------------------------------------------------------------------------------------- 
#  p.413    15.1 작도 준비  
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.413    15.1.1 작도함수  
#-------------------------------------------------------------------------------------------------- 
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.414    15.1.2 작도디바이스  
#-------------------------------------------------------------------------------------------------- 
 
windows()                   # Windows버전 R의 가상 디바이스 윈도우를 연다  
jpeg(filename="plot.jpg")   # JPEG 형식 이미지 파일을 만든다  
 
#-------------------------------------------------------------------------------------------------- 
#  p.415    15.1.3 복수의 디바이스 드라이버  
#-------------------------------------------------------------------------------------------------- 
 
windows(); pdf();           # windows와 pdf 디바이스를 연다  
dev.cur()                   # 현재 디바이스  
dev.set(2)                  # 2번째 디바이스를 연다(현재 디바이스는 windows) 
dev.off(3)                  # 3번째 디바이스를 닫는다  
dev.off()                   # 현재 디바이스를 닫는다  
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.417    15.2 고수준 작도함수  
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.417    15.2.1 산포도: plot()  
#-------------------------------------------------------------------------------------------------- 
 
head(ToothGrowth)                    # 데이터프레임 ToothGrowth 
plot(ToothGrowth$supp)               # 인자 벡터를 지정    
plot(ToothGrowth$dose,  
     ToothGrowth$len)                # plot(x, y)의 형식  
plot(len ~ dose, data=ToothGrowth)   # plot(y ~ x)의 형식(위와 같다) 
 
 
plot(ToothGrowth$supp, 
     ToothGrowth$len)                # plot(인자벡터, 실수벡터) 
plot(ToothGrowth)                    # plot(데이터프레임) 
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.420    15.2.2 해바라기 그림: sunflowerplot() 
#-------------------------------------------------------------------------------------------------- 
 
x <- rnorm(50) 
z <- data.frame(round(x, d=1), round(x, d=1)) 
sunflowerplot(z) 
 
#-------------------------------------------------------------------------------------------------- 
#  p.420    15.2.3 함수의 그래프: curve() 
#-------------------------------------------------------------------------------------------------- 
 
curve(sin(x^2)*exp(-x^2), -pi, pi) 
curve(sin(x^2)*exp(-x^2), -pi, pi, n=20)   # n이 작으므로 선이 각진다  
 
#-------------------------------------------------------------------------------------------------- 
#  p.421    15.2.4 겹친 해그림: matplot() 
#-------------------------------------------------------------------------------------------------- 
 
matplot((-4:5)^2, main="Quadratic")        # plot()과 같다(출력은 생략) 
data(iris)                                 # 데이터 iris 
table(iris$Species) 
iS <- iris$Species == "setosa" 
iV <- iris$Species == "versicolor" 
matplot(c(1,8), c(0,4.5), xlab="Length", ylab="Width", type="n", 
        main = "Petal and Sepal Dimensions in Iris Blossoms") 
matpoints(iris[iS,c(1,3)], iris[iS,c(2,4)], pch="sS", col=c(2,4)) 
matpoints(iris[iV,c(1,3)], iris[iV,c(2,4)], pch="vV", col=c(2,4)) 
 
sines <- outer(1:20, 1:4, function(x, y) sin(x / 20 * pi * y)) 
matplot(sines, pch = 1:4, type = "o", col = rainbow(ncol(sines))) 
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.423    15.2.5 1차원 데이터 그리기(1): 막대그래프 barplot() 
#-------------------------------------------------------------------------------------------------- 
 
barplot(1:10) 

x <- matrix(c(0.3,0.7,0.8,0.2), 2, 2) 
barplot(x, beside=T, names=1:2)   # 옆으로 나열  
barplot(x, horiz=T,  names=1:2)   # 가로 막대  
 
#-------------------------------------------------------------------------------------------------- 
#  p.424    15.2.6 1차원 데이터 그리기(2): 점차트 dotchart()  
#-------------------------------------------------------------------------------------------------- 
 
x <- 1:10 
dotchart(x,labels=paste("sample", 1:10))   
 
x <- 1:10 
y <- as.factor( c( rep("Male",5), rep("Female",5) ) ) 
dotchart(x, labels=paste("sample", 1:10), groups=y) 
t(VADeaths) 
dotchart(t(VADeaths), xlim = c(0,100), 
         main = "Death Rates in Virginia - 1940") 
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.427    15.2.7 1차원 데이터 그리기(3): 히스토그램 hist() 
#-------------------------------------------------------------------------------------------------- 
 
x <- rnorm(50) 
hist(x, breaks = seq(-3,3,1) )        # -3 ~ 3까지 폭 1로 그린다  
hist(x, breaks = c(-3,-1,0,0.5,3) )   # 다른 구분 폭(출력예생략) 
 
hist(x, breaks="scott", freq=F)       # Scott 방법, 밀도표시  
hist(x, breaks="scott", freq=T)       # Scott 방법, 빈도표시  
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.428    15.2.8 1차원 데이터 그리기(4): 원그래프 pie() 
#-------------------------------------------------------------------------------------------------- 
 
x <- 1:10 
pie(x, labels=LETTERS[1:10]) 
 
 
pie(x, labels=LETTERS[1:10], clockwise=T) 
pie(x, labels=LETTERS[1:10], init.angle=45) 
 
#-------------------------------------------------------------------------------------------------- 
#  p.429    15.2.9 1차원 데이터 그리기(5): 상자그림 boxplot() 
#-------------------------------------------------------------------------------------------------- 


x <-rnorm(50) 
y <-rnorm(50) 
z <-rnorm(50) 
boxplot(x, y, z)   
 
boxplot(count ~ spray, data=InsectSprays, col="lightgray") 
bp <- boxplot(count ~ spray, data=InsectSprays, horizontal=T) 
bxp(bp, xaxt = "n")   # 그림 생략  
 

#-------------------------------------------------------------------------------------------------- 
#  p.432    15.2.10 1차원 데이터 그리기(6): rug() 
#-------------------------------------------------------------------------------------------------- 
 
x <- subset(InsectSprays, spray=="A")$count 
boxplot.stats(x, coef = 1.5, do.conf=TRUE, do.out=TRUE) 
x <- (rnorm(50) - 1) + 3*(runif(50) > 0.6) 
plot(density(x), main = "Title") 
rug(x, side = 3) 
rug(jitter(x, amount = 0.01), col = "blue") 
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.433    15.2.11 1차원 데이터 그리기(7): stripchart() 
#-------------------------------------------------------------------------------------------------- 
 
x <- factor(rep(1:5,10)) 
y <- rnorm(50) 
stripchart(y ~ x, xlab="data", ylab="factor") 
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.434    15.2.12 분할표 데이터 그리기(1) : fourfoldplot() 
#-------------------------------------------------------------------------------------------------- 
 
data(UCBAdmissions) 
x <- aperm(UCBAdmissions, c(2, 1, 3)) 
dimnames(x)[[2]] <- c("Yes", "No") 
names(dimnames(x)) <- c("Sex", "Admit?", "Department") 
fourfoldplot(margin.table(x, c(1, 2))) 
 
#-------------------------------------------------------------------------------------------------- 
#  p.435    15.2.13 분할표 데이터 그리기(2) : mosaicplot() 
#-------------------------------------------------------------------------------------------------- 
 
data(Titanic) 
mosaicplot(Titanic, main = "Survival on the Titanic", col = TRUE) 
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.435    15.2.14 분할표 데이터 그리기(3) : assocplot() 
#-------------------------------------------------------------------------------------------------- 
 
data(HairEyeColor) 
x <- margin.table(HairEyeColor, c(1, 2)) 
assocplot(x, main = "Relation between hair and eye color") 
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.436    15.2.15 다변량 데이터 그리기(1) : 별모양 분그림 stars() 
#-------------------------------------------------------------------------------------------------- 
 
data(mtcars) 
stars(mtcars[, 1:7], key.loc = c(14, 2), full = FALSE,  
      main = "Motor Trend Cars : stars(*, full = F)") 
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.437    15.2.16 다변량 데이터 그리기(2) : symbols() 
#-------------------------------------------------------------------------------------------------- 
 
x <- 1:10 
y <- sort(10*runif(10)) 
z <- runif(10) 
z3 <- cbind(z, 2*runif(10), runif(10)) 
symbols(x, y, thermometers=cbind(.5, 1, z), inches=.5, fg = 1:10)  
 
#-------------------------------------------------------------------------------------------------- 
#  p.439    15.2.17 다변량 데이터 그리기(3) : paris() 
#-------------------------------------------------------------------------------------------------- 
 
x <- 1:10 
y <- rnorm(10) 
z <- x*y 
C <- matrix(c(x,y,z),10,3) 
C 
 
pairs(iris[1:4]) 
 
 
panel.cor <- function(x, y, digits=2, prefix="", cex.cor) 
{    usr <- par("usr"); on.exit(par(usr)) 
    par(usr = c(0, 1, 0, 1)) 
    r <- abs(cor(x, y)) 
    txt <- format(c(r, 0.123456789), digits=digits)[1] 
    txt <- paste(prefix, txt, sep="") 
    if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt) 
    text(0.5, 0.5, txt, cex = cex.cor * r) 
} 
pairs(iris[1:4], lower.panel=panel.smooth, upper.panel=panel.cor) 
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.441    15.2.18 다변량 데이터 그리기(4) : coplot() 
#-------------------------------------------------------------------------------------------------- 
 
x <- 1:10 
y <- rnorm(10) 
z <- x*y 
coplot(x ~ y | z)   
 
#-------------------------------------------------------------------------------------------------- 
#  p.442    15.2.19 3차원  데이터 그리기(1) : image()  
#-------------------------------------------------------------------------------------------------- 
 
x <- y <- seq(-4*pi, 4*pi, len=27) 
r <- sqrt(outer(x^2, y^2, "+")) 
image(z = z <- cos(r^2)*exp(-r/6), col=gray((0:32)/32)) 
image(z, axes = FALSE, main = "Math can be beautiful ...", 
      xlab = expression(cos(r^2) * e^{-r/6})) 
 
#-------------------------------------------------------------------------------------------------- 
#  p.442    15.2.20 3차원 데이터 그리기(2) : persp() 
#-------------------------------------------------------------------------------------------------- 
 
x <- seq(-10, 10, length= 50)             # x축의 눈금폭  
y <- x                                    # y축의 눈금폭  
f <- function(x,y) { r <- sqrt(x^2+y^2); 10 * sin(r)/r } 
z <- outer(x, y, f)                       # z축의 값  
persp(x, y, z, theta = 30, phi = 30,  
      expand = 0.5, col = rainbow(50), border=NA) 
 
#-------------------------------------------------------------------------------------------------- 
#  p.444    15.2.21 3차원 데이터 그리기(3) : contour()  
#-------------------------------------------------------------------------------------------------- 
 
x  <- -6:16 
contour(outer(x, x), method = "edge",  
        vfont = c("sans serif", "plain"))   
 
#-------------------------------------------------------------------------------------------------- 
#  p.445    15.2.22 3차원 데이터 그리기(4) : filled.contour() 
#-------------------------------------------------------------------------------------------------- 
 
x <- y <- seq(-4*pi, 4*pi, len = 27) 
r <- sqrt(outer(x^2, y^2, "+")) 
filled.contour(cos(r^2)*exp(-r/(2*pi)), frame.plot = FALSE,  
               color.palette = heat.colors, plot.axes = {}) 
 
#-------------------------------------------------------------------------------------------------- 
#  p.446    15.2.23 보충학습 
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.446    (1) 회귀식의 플롯 
#-------------------------------------------------------------------------------------------------- 
 
x <- sort( rnorm(50) ) 
y <- x + rnorm(50) 
termplot(lm(y~x),partial=TRUE,rug=TRUE) 
termplot(lm(y~x),partial=TRUE,smooth=panel.smooth,span.smth=1/4) 
 
#-------------------------------------------------------------------------------------------------- 
#  p.446    (2) 패키지: scatterplot3d 
#-------------------------------------------------------------------------------------------------- 
 
install.packages("scatterplot3d") 
library(scatterplot3d) 
 
z <- seq(-10, 10, 0.01) 
x <- cos(z) 
y <- sin(z) 
scatterplot3d(x, y, z, highlight.3d=TRUE, col.axis="blue", 
              col.grid="lightblue", main="Title", pch=20) 
 
 
temp <- seq(-pi, 0, length = 50) 
x <- c(rep(1, 50) %*% t(cos(temp))) 
y <- c(cos(temp) %*% t(sin(temp))) 
z <- c(sin(temp) %*% t(sin(temp))) 
scatterplot3d(x, y, z, highlight.3d=TRUE, col.axis="blue", 
              col.grid="lightblue", main="Title", pch=20) 
 
#-------------------------------------------------------------------------------------------------- 
#  p.448    (3) 패키지: lattice 
#-------------------------------------------------------------------------------------------------- 
 
library(lattice) 
 
data(volcano) 
wireframe(volcano, shade = TRUE, aspect = c(61/87, 0.4), 
          light.source = c(10,0,10)) 
 
data(singer) 
histogram( ~ height | voice.part, data = singer, 
          xlab = "Height (inches)", type = "density", 
          panel = function(x, ...) { 
            panel.histogram(x, ...) 
            panel.mathdensity(dmath = dnorm, col = "black", 
            args = list(mean=mean(x),sd=sd(x))) 
          } ) 
 
#-------------------------------------------------------------------------------------------------- 
#  p.451   15.3 저수준 작도함수 
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.451   15.3.1  그림 제거: plot.new() 
#-------------------------------------------------------------------------------------------------- 
 
plot.new() 
frame() 
 
#-------------------------------------------------------------------------------------------------- 
#  p.451   15.3.2  점 그리기: points() 
#-------------------------------------------------------------------------------------------------- 
 
plot(-4:4, -4:4, type="n") 
points(rnorm(200), rnorm(200), pch="+", col="red") 
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.452   15.3.3  꺾은 선 그리기: lines() 
#-------------------------------------------------------------------------------------------------- 
 
x <- seq(0, 10, by=0.1) 
y <- seq(0, 1, by=0.01) 
plot(x, y, ylab="", type='n', main = "Title\n- subtitle -") 
for(i in 1:5) lines(x, beta(x,i), col=i, lty=i) 
 
#-------------------------------------------------------------------------------------------------- 
#  p.453   15.3.4  직선 그리기: abline(), grid() 
#-------------------------------------------------------------------------------------------------- 
 
plot(1:10) 
abline(a=0, b=1)                 # 절편 0,  기울기 1인 직선  
abline(h=1:10, v=1:10, lty=2)    # abline을 사용해 격자를 넣는다  
 
 
result <- lm(dist ~ speed, data = cars) 
plot(cars) 
abline(result) 
abline(coef = coef(result))   # abline(result)와 같은 결과  
 
#-------------------------------------------------------------------------------------------------- 
#  p.455   15.3.5  선분과 화살표, 사각형 그릭: segments(), arrows(), rect() 
#-------------------------------------------------------------------------------------------------- 
 
plot(1:10) 
segments(2,2,3,3)   # 점 (2,2)와 점 (3,3)을 지나는 선분을 그린다 ­ 
arrows(5,5,7,7)     # 점 (5,5)와 점 (7,7)을 지나는 화살표를 그린다­ 
 
#-------------------------------------------------------------------------------------------------- 
#  p.456   15.3.6  문자열 그리기 :  text(), mtext() 
#-------------------------------------------------------------------------------------------------- 
 
plot(1:10, ann=F) 
text(2,8, "문자열A", srt=45) 
mtext("문자열B", side=3, line=2) 
mtext("문자열C", side=4, adj=0) 
 
plot(x, y, xaxt="n") 
axis(1, labels=FALSE) 
pr <- pretty(x) 
par(xpd=TRUE) 
text(pr, par("usr")[3]-0.05, pr, srt=-45) # 시계방향으로 45도 회전  
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.458   15.3.7  테두리 그리기: box() 
#-------------------------------------------------------------------------------------------------- 
 
plot(1:10, axes = F, ann=F) 
box(lty=2, col="red") 
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.459   15.3.8  제목과 부제목 그리기: title() 
#-------------------------------------------------------------------------------------------------- 
 
plot(1:10) 
title(main="Main Title", sub = "Sub Title") 
 
#-------------------------------------------------------------------------------------------------- 
#  p.460   15.3.9  좌표축 그리기: axis() 
#-------------------------------------------------------------------------------------------------- 
 
plot(rnorm(50), rnorm(50), xlim=c(-3,3), ylim=c(-3,3),  
     axes = F, ann=F) 
axis(1, pos = 0, at = -3:3, adj = 0, col = 2)  # 빨간색으로 X축을 그린다 ­ 
axis(2, pos = 0, at = -3:3, adj = 1, las = 2)  # 검은색으로 Y축을 그린다 ­ 
box()  
 
plot(1:10, xaxt="n", yaxt="n") 
axis(1, xaxp=c(2, 9, 7)) 
axis(2, yaxp=c(3, 8, 5)) 
 
#-------------------------------------------------------------------------------------------------- 
#  p.462   15.3.10  범례 그리기: legend() 
#-------------------------------------------------------------------------------------------------- 
 
plot(1:10, 1:10, ann=F, type='n') 
legend(4, 4, "example", col=1, lwd=1, bg='gray') 
 
plot(1:10, 1:10, ann=F, type='n') 
names <- paste("example",c(1:2))   # "example1", "example2" 
legend(4, 4, names, col=c(1:2), lwd=1, merge=T, bg='gray') 
legend(5, 9, paste("sin(",6:9,"pi * x)"), col=6:9, 
       pch=3, ncol=2, cex=0.9, pt.bg="pink")  
 
#-------------------------------------------------------------------------------------------------- 
#  p.464   15.3.11  다각형 그리기: polygon() 
#-------------------------------------------------------------------------------------------------- 
 
plot(c(1,9), 1:2, type="n") 
polygon(1:9, c(2,1,2,1,NA,2,1,2,1), 
        density=c(10, 20), angle=c(-45, 45)) 
 
 
plot(dnorm,-4,4) 
xvals <- seq(-2,2,length=50)  # 영역을 50개의 다각형으로 등분할  
dvals <- dnorm(xvals)         # 대응하는 그래프의 높이  
polygon(c(xvals,rev(xvals)),c(rep(0,50),rev(dvals)),col="gray") 
 
#-------------------------------------------------------------------------------------------------- 
#  p.466   15.4  작도에 수식을 추가한다. 
#-------------------------------------------------------------------------------------------------- 
 
plot(1:4, type = "n") 
text(2, 3, expression(paste( 
     bgroup("(",atop(n,x),")"),p^x, q^{n-x})))   
 
 
plot(sqrt(1:10), type = "l", xaxt = "n", 
     main = "Title", 
     ylab = expression("sqrt(" * alpha, ") log" * alpha),  
     xlab = expression(paste("Index ", alpha)) ) 
 
 
plot(1:10, type="n", xlab="", ylab="") 
x <- 1.23 ; title(substitute(hat(theta) == that, list(that= x))) 
 
#-------------------------------------------------------------------------------------------------- 
#  p.472   15.5  대화식 작도함수 
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.472   15.5.1  대화식 작도함수: locator() 
#-------------------------------------------------------------------------------------------------- 
 
plot(1:10, type="n") 
locator()             # 입력 종료 조작을 할 때까지 좌표값을 입력한다  
locator(10)           # 10개 점을 입력한 시점에서 종료한다  
 
plot(1:10, type="n") 
z <- locator()  # z에 입력위치 좌표를 성분으로 하는 리스트를 대입  
 
plot(1:10, type="n") 
text(locator(1), "특이값", adj=0)   
 
#-------------------------------------------------------------------------------------------------- 
#  p.473   15.5.2  점의 확인 
#-------------------------------------------------------------------------------------------------- 
 
x <- rnorm(20)      # x에 정규난수를 20개 넣고  
y <- rnorm(20)      # y에 정규난수를 20개넣 고 
plot(x, y)          # (x, y)를 플롯한다  
identify(x, y, x)   # 클릭한 관측점의 x좌표가 알고 싶을 때 
identify(x, y, y)   # 클릭한 관측점의 y좌표가 알고 싶을 때  
identify(x, y)      # 클릭한 관측점의 관측번호를 알고 싶을 때  
 
pt <- identify(x,y,y)   # identify(x,y)에서도 identify(x,y,x)에서도  
pt                      # pt에는 관측번호가 저장된다  
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.475   15.6  그래픽스 파라미터 
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.475   15.6.1  그래픽스 파라미터 시작 
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.476   15.6.2  그래픽스 파라미터의 영속적  변경 
#-------------------------------------------------------------------------------------------------- 
 
par(new=T)         # 현재 작도에 다음 작도를 겹쳐그린다  
par(ask=TRUE)      # 작도하기 전에 확인을 구한다  
help(par)          # 모든 그래픽 파라미터의 도움말을 표시  
 
#-------------------------------------------------------------------------------------------------- 
#  p.477   (1) 그래픽스 파라미터값의 임시저장과 복귀 
#-------------------------------------------------------------------------------------------------- 
 
oldpar <- par(no.readonly = TRUE)   # 현재의 파리미터 값을 백업  
oldpar <- par(col=2, lty=3)         # 일부만 저장한다  
par(oldpar)                         # 작업전 파라미터로 되돌린다  

oldpar <- par(no.readonly = TRUE)   # 현재 파라미터를 백업  
par(col=2)                          # 빨간색으로 변경  
plot(1:10)                          # 플롯한다  
par(col=1, lty=3)                   # 선의 형식을 도트로 변경  
curve(sin)                          # sin(x)의 그래프를 그린다  
par(oldpar)                         # 작도 전 파라미터로 되돌린다  
 
#-------------------------------------------------------------------------------------------------- 
#  p.478   (2) 플롯영역, 작도영역 
#-------------------------------------------------------------------------------------------------- 
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.479   (3) 디바이스 영역 
#-------------------------------------------------------------------------------------------------- 
 
jpeg("mygraph.jpg", 200, 200)   # 200 x 200의 jpeg 이미지를 작성  
plot(1:10) 
dev.off() 
 
#-------------------------------------------------------------------------------------------------- 
#  p.479   (4) 작도영역에 관한 파라미터 
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.480   (5) 플롯영역에 관한 파라미터 
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.480   (6) 여백에 관한 파라미터 
#-------------------------------------------------------------------------------------------------- 
 
plot(iris$Sepal.Length, iris$Sepal.Width)  # x의 범위는 4.0 ~ 8.0  
par(fig = c(0.3, 0.7, 0.2, 0.8)) 
par(xpd = F)      # 플롯 영역 내에 들어가는 부분만 그려진다   
plot(iris$Sepal.Length, iris$Sepal.Width, xlim = c(5.5, 6.5)) 
par(xpd = T)      # 작도영역 내에 들어가는 부분만 그려진다  
plot(iris$Sepal.Length, iris$Sepal.Width, xlim = c(5.5, 6.5)) 
par(xpd = NA)     # 디바이스 영역 전체에 그림이 그려진다  
plot(iris$Sepal.Length, iris$Sepal.Width, xlim = c(5.5, 6.5)) 
 
#-------------------------------------------------------------------------------------------------- 
#  p.482   (7) 그 밖의 파라미터 
#-------------------------------------------------------------------------------------------------- 
 
plot(1:10) 
par("usr")               # 좌표계를 확인: 결과는 (x1, x2, y1, y2) 
par(usr=c(1, 10, 1, 10)) # 좌표계를 명시적으로 변경해도  
plot(1:5)                # 그냥  플롯하면  
par("usr")               # 좌표계는 자동으로 변경된다  
 
#-------------------------------------------------------------------------------------------------- 
#  p.482   15.6.3  그래픽스 파라미터의 일시속적  변경 
#-------------------------------------------------------------------------------------------------- 
 
plot(1:10, pch="+")      # 일시적으로 플롯 점의 형태를 "+"로 변경한다  
par(pch="+")             # 이후 플롯 점의 형태를 계속 "+"로 변경한다  
plot(1:10)               # 플롯 점의 형태는 "+"가 된다  
plot(1:20)               # 이것도 플롯점의 형태는 "+"가 된다  
 
#-------------------------------------------------------------------------------------------------- 
#  p.483   (1) 색깔 
#-------------------------------------------------------------------------------------------------- 
 
colors() 
 
#-------------------------------------------------------------------------------------------------- 
#  p.484   (2) 마커와 형태 
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.485   (3) 텍스트와 글꼴에 관한 파라미터 
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.486   (4) 선분의 굵기와 형식 
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.486   (5) 테두리에 관한 파라미터 
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.487   (6) 축에 관한 파라미터 
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.488   15.7 복소의 그림이나 겹친 그림을 그린다. 
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.488   15.7.1 준비 
#-------------------------------------------------------------------------------------------------- 
 
par(oma = c(0, 0, 4, 0))   # 하, 좌, 상, 우 순으로 여백을 설정한다  
 
#-------------------------------------------------------------------------------------------------- 
#  p.489   15.7.2 화면을 나누어 그린다. 
#-------------------------------------------------------------------------------------------------- 
 
par(mfrow=c(3,2))   
 
plot(sin) 
plot(cos) 
plot(tan) 
plot(asin) 
plot(acos) 
 
mtext(side = 3, line=1, outer=T, text = "Title", cex=2.5)   
 
#-------------------------------------------------------------------------------------------------- 
#  p.491   15.7.3 고도의 화면 분할 
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.491   (1) layout()을 사용한 화면 분할 
#-------------------------------------------------------------------------------------------------- 
 
mat <- matrix(c(1,0,2,2), 2, 2, byrow = TRUE) 
mat                     
layout(mat) 
plot(sin)  
plot(cos)  
 
 
layout(matrix(c(1,3,2,2), 2, 2, byrow = TRUE), respect=T, 
       widths=lcm(5), heights=lcm(5)) 
plot(sin) 
plot(cos) 
plot(acos) 
 
#-------------------------------------------------------------------------------------------------- 
#  p.493   (2) splite.screen()을 사용한 화면 분할 
#-------------------------------------------------------------------------------------------------- 
 
split.screen(c(2,1)) 
 
split.screen(c(1,3), screen = 2)   # 화면 2를 다시 3으로 분할  
screen(1);   plot(10:1)            # 화면 1에 플롯  
screen(4);   plot(10:1)            # 화면 4에 플롯  
close.screen(all = TRUE)           # 화면 분할 모드에서 벗어남  
 
#-------------------------------------------------------------------------------------------------- 
#  p.494   15.7.4 그림을 겹쳐서 그린다. 
#-------------------------------------------------------------------------------------------------- 
 
plot(sin, -pi, pi, xlab="x", ylab="y", lty=2) 
plot(cos, -pi, pi, add=T) 
 
plot(1:5,type="l") 
par(new=T) 
plot(rnorm(5), type="l", axes=F, xlab="", ylab="", lty=2)   
 
axis(side=4)   
 
mtext(side=4, line=3, text="random plot")   
 
legend(locator(1), legend=c("line", "random plot"), lty=1:2)   
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.497   15.8 그리드 그래픽스 
#-------------------------------------------------------------------------------------------------- 
 
#-------------------------------------------------------------------------------------------------- 
#  p.498   15.8.1 그리드 그래픽스 시작 
#-------------------------------------------------------------------------------------------------- 
 
library(grid) 
 
grid.multipanel(vp=viewport(0.5, 0.5, 0.8, 0.8))  # 데모(1) 
grid.plot.and.legend()                            # 데모(2) 
grid.plot.and.legend                              # 함수정의  
 
#-------------------------------------------------------------------------------------------------- 
#  p.499   15.8.2 그래픽스 출력 함수 
#-------------------------------------------------------------------------------------------------- 
 
grid.newpage()                     # 직전까지의 그림을 모두 삭제  
 
grid.frame(name="gf", draw=TRUE)   # ­선을 그릴 준비  
grid.pack("gf", rectGrob())        # 실제로 테두리를 그린다 ­ 
grid.move.to(x=0.5, y=0.5)         # 현재위치를 (x,y)=(0.5,0.5)로 설정  
grid.line.to(x=1, y=1)             # (x,y)=(0.5,0.5)에서  (x,y)=(1,1)로 선을 그린다  
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.500   15.8.3 작도영역과 좌표계: viewport()  
#-------------------------------------------------------------------------------------------------- 
 
grid.newpage() 
vp1 <- viewport(x=0.5, y=0.5, w=0.8, h=0.8, 
                xscale=c(0,10), yscale=c(0,10)) 
pushViewport(vp1)      # vp1을 호출한다  
grid.rect()            # 장방형으로 에워싼다  
grid.xaxis()           # x축을 그린다 ­ 
grid.yaxis()           # y축을 그린다 ­ 
 
 
vp2 <- viewport(x=0.5, y=0.5, w=0.2, h=0.2, 
                xscale=c(0,10), yscale=c(0,10)) 
pushViewport(vp2)            # vp2를 호출한다  
grid.rect()                  # 장방형으로 에워싼다  
grid.points(x=1:10, y=1:10)  # vp2에 점을 10개 그린다 ­ 
grid.xaxis()                 # x축을 그린다  
grid.yaxis()                 # y축을 그린다 ­ 
popViewport()                # vp2를 파기한다  
current.viewport()           # 현재의 viewport 번호를 확인한다  
 
grid.show.viewpoint(vp1) 
grid.show.viewpoint(vp2) 
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.504   15.8.4 좌표계와 단위 
#-------------------------------------------------------------------------------------------------- 
 
unit(1, "npc") 
unit(1, "inches") 
unit.c(unit(0.5, "npc"), unit(2, "inches"), unit(1, "strwidth", "hi there")) 
 
vp <- viewport(x=0.6, y=0.6, 
               w=unit(1, "inches"), h=unit(1, "inches"), 
               xscale=c(0,10), yscale=c(0,10)) 
grid.rect()              # 사각형을 그린다 ­ 
grid.circle(r=0.55)      # 원을 그린다 ­ 
grid.show.viewport(vp)   # 작도영역을 확인  
 

#-------------------------------------------------------------------------------------------------- 
#  p.506   15.8.5 그리드 그래픽스 파라미터 
#-------------------------------------------------------------------------------------------------- 
 
get.gpar(names = NULL) # 파라미터 정보 얻기   
get.gpar()             # 현재의 모든 그래픽 파라미터 정보 얻기  
 
 
grid.newpage() 
vp <- viewport(x=0.6, y=0.6, w=0.8, h=0.8)         # 작도영역을 작성  
grid.rect()                                        # 사각형을 그린다  
grid.circle(r=0.55, gp=gpar(lwd=5, fill="gray"))   # 원을 그린다  
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.508   15.8.6 레이아웃 
#-------------------------------------------------------------------------------------------------- 
 
grid.newpage() 
gl <- grid.layout(1, 2, respect=T, 
                  widths =unit(1, "inches"), 
                  heights=unit(0.25, "npc")) 
grid.show.layout(gl) 
 
 
grid.newpage() 
gl <- grid.layout(3,4) 
grid.show.layout(gl) 
 
grid.newpage() 
pushViewport(viewport(layout=gl)) 
grid.grill(h=seq(0,1,1/3), v=seq(0,1,1/4), gp=gpar(col="grey") ) 
pushViewport(viewport(layout.pos.col=2:3, layout.pos.row=2)) 
grid.rect() 
 
#-------------------------------------------------------------------------------------------------- 
#  p.511   15.8.7 grab 생성 
#-------------------------------------------------------------------------------------------------- 
 
grid.newpage() 
vp <- viewport(x=0.5, y=0.5, w=0.8, h=0.8, 
               xscale=c(0,10), yscale=c(0,10)) 
pushViewport(vp) 
gb1 <- xaxisGrob(at=seq(0,4,2))   # gb1을 생성(x축은 그리지 않는다) 
grid.draw(gb1) 
grid.xaxis(at=seq(0,4,2), name="gb1")   # gb1을 생성(x축을 그린다) 
 
 
gb2 <- editGrob(gb1, at=seq(4,10,1), gp=gpar(col="red", lty=2)) 
grid.draw(gb2) 
 
 
grid.newpage() 
vp <- viewport(x=0.5, y=0.5, w=0.8, h=0.8) 
pushViewport(vp) 
grid.frame(name="gf", draw=TRUE) 
grid.pack("gf", rectGrob(gp=gpar(fill="grey"))) 
grid.pack("gf", textGrob("hi there"), side="right") 
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.513   15.8.8 작도 예 
#-------------------------------------------------------------------------------------------------- 
 
grid.newpage() 
pvp <- plotViewport(c(5, 4, 2, 2)) 
dvp <- dataViewport(cars$speed, cars$dist) 
pushViewport(pvp) 
pushViewport(dvp) 
 
grid.points(cars$speed, cars$dist)               # 점을 그린다  
grid.rect()                                      # 사각형을 그린다  
grid.xaxis()                                     # x축을 그린다 ­ 
grid.yaxis()                                     # y축을 그린다 ­ 
grid.text("Speed", y=unit(-3, "lines"))          # x축 라벨을 그린다  
grid.text("Dist", x=unit(-3, "lines"), rot=90)   # y축 라벨을 그린다  
 
 
install.packages("gridBase") 
library(gridBase) 
 
xdata <- 1:10 
plot(xdata, type="b", ann=F, axes=F) 
axis(2) 
axis(1, at=xdata, labels=F) 
bvp <- baseViewports() 
pushViewport(bvp$inner, bvp$figure, bvp$plot) 
grid.rect(gp=gpar(lwd=3, col="red")) 
 
 
grid.text(paste("week",c(1:10)),  
          x=unit(xdata, "native"), y=unit(-1, "lines"), 
          just="right", rot=60) 
grid.text("Score", x=unit(-3, "lines"), rot=90) 
 
 
grid.newpage() 
grid.text(expression( r[i] == sqrt(x[i]^2 + y[i]^2) ),  
          gp=gpar(fontsize=20, col="red")) 
 
 
library(lattice) 
EE <- equal.count(ethanol$E, number=9, overlap=1/4) 
xyplot(NOx ~ C | EE, data = ethanol,  
  panel=function(...) { 
    grid.points(13, 3, pch=4, default.units="native") 
    grid.text("(13,3)", unit(13, "native"), 
              unit(3, "native") - unit(4, "mm")) 
    panel.xyplot(...) 
  } ) 
 
 
grid.newpage() 
mywork <- function() { 
  grid.grill();  grid.xaxis();  grid.yaxis(); 
  grid.points(unit(0.5, "npc"), 
              unit(0.5, "native")) 
} 
vp <- grid.layout(1, 3, w=unit(rep(1,3),"null")) 
pushViewport( viewport(w=0.8, h=0.8, layout=vp) ) 
pushViewport( viewport(layout.pos.col=1, yscale=c(0,2)) ) 
mywork() 
grid.move.to(0.5, unit(0.5, "native")) 
popViewport() 
pushViewport( viewport(layout.pos.col=3, yscale=c(0,1)) ) 
mywork() 
grid.line.to(0.5, unit(0.5, "native")) 
 
 
#-------------------------------------------------------------------------------------------------- 
#  p.518   15.8.9 오브젝트의 저장과 불러오기 
#-------------------------------------------------------------------------------------------------- 
 
grid.newpage() 
grid.grill()                  # 모눈을 그린다  
tmp <- recordPlot()           # 현재의 작도를 tmp에 저정한다  
save(tmp, file="tmp-041123")  # 파일 tmp-041123dp 저장  
 
 
load("tmp-041123") 
tmp                           # 저장한 tmp을 호출  
 
 
temp <- textGrob("Hello world.") 
save(temp, file="temp-041123") 
rm(temp) 
 
 
load("temp-041123") 
grid.draw(temp)               # 저장한 temp를 호출  