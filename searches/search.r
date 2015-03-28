setwd("/home/zhur/Документы/depart.pie/Warehouse/tech/")
mytable <- read.table("Afganistan.txt", header=TRUE, sep="")
mytable
#data(mytable)
ym<-max(mytable[][2:8])
ym
names(mytable)
#plot(mytable$Year, mytable$terrorism)
attach(mytable)
plot(Year,terrorism,xlab="Год",ylab="Количество упоминаний",
     main="Частота упоминаний характеристик для Афганистана",
     pch=15,col="blue",type="b",xlim=c(2000,2014))
lines(Year,terrorist,pch=16,col="green",type="b",xlim=c(2000,2014),ylim=c(0,ym))
legend("topleft",inset=.01,title="Характеристики",c("терроризм","террорист"),lty=c(1,1),pch=c(15,16),col=c("blue","green"))
# в файл PNG
png(filename="v2.png",units="px",width=1200,res=96,pointsize=12,family="serif")
plot(Year, terrorism,xlab="Год",ylab="Количество упоминаний",main="Название",pch=23,bg="blue",type="p",xlim=c(2000,2014))
dev.off()
# в файл SVG
svg(filename="v2.svg",width=7,height=4,onefile=TRUE,family="sans",pointsize=12)
plot(Year, terrorism,xlab="Год",ylab="Количество упоминаний",main="Название",pch=23,bg="blue",type="p",xlim=c(2000,2014))
dev.off()
# в файл EPS
cairo_ps(filename="v2.eps",width=27,height=14,onefile=TRUE,family="serif",pointsize=24)
plot(Year, terrorism,xlab="Год",ylab="Количество упоминаний",main="Название",pch=23,bg="blue",type="p",xlim=c(2000,2014))
dev.off()
# в файл PDF
cairo_pdf(filename="v2.pdf",width=7,height=4,onefile=TRUE,family="serif",pointsize=12)
plot(Year, terrorism,xlab="Год",ylab="Количество упоминаний",main="Название",pch=23,bg="blue",type="p",xlim=c(2000,2014))
dev.off()

# Слияние!
years<-c(mytable[1:16,1],"sum")
chars<-c("Терроризм","Террорист","Оккупация","Наркотики","Насилие","Демократия","Развитие")
countries<-c("Молдавия","Афганистан","Киргизия","Пакистан","Украина","Россия","Грузия","Узбекистан","Сирия","Таджикистан","Ливия","Тунис","Египет","Израиль","Йемен","Ирак","Палестина","Иран","Ливан","Турция","Казахстан","Индия","Армения","Китай","Азербайджан","Туркменистан","Сомали")
# colors()
# rainbow(27)
# terrain.colors(27)
# topo.colors(27)
# heat.colors(27)
# cm.colors(27)
cols<-terrain.colors(27)
pchs<-c(1,25)
alltable <- array(0,c(17,7,27),list(years,chars,countries))
alltable

#alltable[1][1][1] <- "Афганистан"
#alltable[,,1] <- read.table("Afganistan.txt", header=TRUE, sep="")
#alltable[][][1] <- mytable[1:16,1:7]

#ms=7
#s=1
vars<-c("Молдавия","Afganistan.txt","Киргизия","Пакистан","Ukraine.txt","Россия","Georgia.txt","Узбекистан","Syria.txt","Таджикистан","Libya.txt","Tunisia.txt","Египет","Израиль","Yemen.txt","Iraq.txt","Палестина","Иран","Ливан","Turkey.txt","Казахстан","Индия","Армения","China.txt","Azerbaijan.txt","Туркменистан","Сомали")
for(s in c(2,7,5,9,11,12,15,16,20,24,25)){
  mytable1<-read.table(vars[s], header=TRUE, sep="")
  for(y in 1:16){
    for(v in 1:7){
      alltable[y,v,s]<-mytable1[y,v+1]
    }
  }
#  alltable[,,s]
  for(v in 1:7){
    alltable[y+1,v,s]<-sum(mytable1[,v+1])
  }
}
#alltable[][2]
#mytable[1:16,1:8]
alltable[,,20]
s
vars
sum(mytable[,8])
supermax<-max(alltable)
supermax
sums<-alltable[17,,]
sums[1,]
sums[,2]
for(v in 1:7){
  png(filename=paste0(chars[v],".png"),units="px",width=1200,res=96,pointsize=12,family="serif")
  barplot(sums[v,],xlab="Страна",ylab="Количество упоминаний",
          main=paste0("Частота упоминаний ",chars[v]," для ряда стран"),col=v)
  dev.off()
}

for(s in 1:20){
  if(sums[1,s]>0){
    png(filename=paste0(countries[s],".png"),units="px",width=1200,res=96,pointsize=12,family="serif")
    barplot(sums[,s],xlab="Характеристика",ylab="Количество упоминаний",
            main=paste0("Частота упоминаний характеристик для страны ",countries[s]),col=s)
    dev.off()
  }
}
