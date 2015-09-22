# getwd()
setwd("/home/zhur/Документы/depart.pie/Warehouse/tech/")
mytable <- read.table("Afganistan.txt", header=TRUE, sep="")
# mytable

# names(mytable)

# Слияние!
years<-c(mytable[1:16,1],"sum")
chars<-c("Терроризм","Террорист","Оккупация","Наркотики","Насилие","Демократия","Развитие")
# echars<-c("terrorism","terrorist","occupation","narcotic","violation","democracy","development")
countries<-c("Молдавия","Афганистан","Киргизия","Пакистан","Украина","Россия","Грузия","Узбекистан","Сирия","Таджикистан","Ливия","Тунис","Египет","Израиль","Йемен","Ирак","Палестина","Иран","Ливан","Турция","Казахстан","Индия","Армения","Китай","Азербайджан","Туркменистан","Сомали")
# colors()
# cols<-rainbow(27)
# cols<-terrain.colors(27)
# cols<-topo.colors(27)
# cols<-heat.colors(27)
# cols<-cm.colors(27)
# cols<-c(rainbow(8),terrain.colors(6),topo.colors(7),heat.colors(5))
colsv<-rainbow(8)
# pie(rep(1,8),col=colsv)
cols<-rainbow(27)
# cols
# pie(rep(1,27),col=cols)
pchs<-c(0:20)
pchs
alltable <- array(0,c(17,7,27),list(years,chars,countries))
# alltable
# ?hsv
# hsv(.0,1,1)
# hsv(.9,.1,.5)

attach(mytable)
vars<-c("Молдавия","Afganistan.txt","Киргизия","Пакистан","Ukraine.txt","Россия","Georgia.txt","Узбекистан","Syria.txt","Таджикистан","Libya.txt","Tunisia.txt","Египет","Израиль","Yemen.txt","Iraq.txt","Палестина","Иран","Ливан","Turkey.txt","Казахстан","Индия","Армения","China.txt","Azerbaijan.txt","Туркменистан","Сомали")
for(s in c(2,7,5,9,11,12,15,16,20,24,25)){
# for(s in c(2,7,9,11,12,15,16,20)){
#   s=12
  mytable<-read.table(vars[s], header=TRUE, sep="")
  ymax<-max(mytable[][2:8])
#   ymax
#   mytable
#   mytable[1:16,2]
  cairo_pdf(filename=paste0(countries[s],".pdf"),width=7,height=4,onefile=TRUE,family="serif",pointsize=12)
  plot(Year,mytable[1:16,2],xlab="Год",ylab="Количество упоминаний",
       main=paste0("Частота упоминаний характеристик для страны ",countries[s]),
       pch=pchs[1],col=cols[1],type="b",xlim=c(2000,2014),ylim=c(0,ymax))
  for(y in 1:16){
    for(v in 1:7){
      alltable[y,v,s]<-mytable[y,v+1]
    }
  }
#  alltable[,,s]
  for(v in 1:7){
    lines(Year,mytable[1:16,v+1],pch=pchs[v],col=colsv[v],type="b",xlim=c(2000,2014),ylim=c(0,ymax))
    #     lines(Year,mytable[1:16,v+1],pch=pchs[v],col=hsv((v+1)*.03,1,1),type="b",xlim=c(2000,2014),ylim=c(0,ymax))
    alltable[y+1,v,s]<-sum(mytable[,v+1])
  }
legend("topleft",inset=.01,title="Характеристики",chars,lty=c(1,1),pch=pchs,
       col=colsv)
dev.off()
}

#alltable[][2]
# mytable[1:16,8]
alltable[,,12]
s
vars
sum(mytable[,8])
supermax<-max(alltable)
supermax
sums<-alltable[17,,]
sums[1,]
sums[,2]
# par(mai=c(2.5,1,.5,.1))
for(v in 1:7){
  cairo_pdf(filename=paste0(chars[v],".pdf"),width=10,height=6,onefile=TRUE,family="serif",pointsize=12)
#   png(filename=paste0(chars[v],".png"),units="px",width=1200,res=96,pointsize=12,family="serif")
  par(mai=c(1.3,.8,.5,.1))
  barplot(sums[v,],cex.sub=.5,las=2,
          main=paste0("Частота упоминаний «",chars[v],"» для ряда стран"),col=cols)
  dev.off()
}

for(s in 1:20){
  if(sums[1,s]>0){
    cairo_pdf(filename=paste0(countries[s],"_sum.pdf"),width=10,height=6,onefile=TRUE,family="serif",pointsize=12)
#     png(filename=paste0(countries[s],".png"),units="px",width=1200,res=96,pointsize=12,family="serif")
    barplot(sums[,s],xlab="Характеристика",ylab="Количество упоминаний",col=colsv,
            main=paste0("Частота упоминаний характеристик для страны ",countries[s]))
    dev.off()
  }
}
