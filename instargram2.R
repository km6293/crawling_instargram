#�ν�Ÿ�׷� ���ƿ�, �ȷο�, ��۴ޱ� �ڵ�ȭ
#findElement �� �ٲ���� ������ ����

library(RSelenium)

remDr <- remoteDriver(remoteServerAddr="localhost" , port="��Ʈ��ȣ" , browserName="chrome")
remDr$open()
remDr$navigate("https://www.instagram.com/")
Sys.sleep(3)
#ID 
id <- remDr$findElement(using="css" , "#loginForm > div > div:nth-child(1) > div > label > input")
id$clickElement()
id$sendKeysToElement(list("���̵�"))

#PW
pw <- remDr$findElement(using="css" , "#loginForm > div > div:nth-child(2) > div > label > input")
pw$clickElement()
pw$sendKeysToElement(list("��й�ȣ",key="enter"))
Sys.sleep(5)

#�α��� ������ �����Ͻðھ��? -> ���߿� �ϱ�
late <- remDr$findElement(using="css" , "#react-root > section > main > div > div > div > div > button")
late$clickElement()

#�˸� ���� -> ���߿� �ϱ�
notice <- remDr$findElement(using="css" , "body > div.RnEpo.Yx5HN > div > div > div > div.mt3GC > button.aOOlW.HoLwm")
notice$clickElement()

#�ؽ��±� ��
search <- remDr$findElement(using="css" , "#react-root > section > nav > div._8MQSO.Cx7Bp > div > div > div.LWmhU._0aCwM > input")
search$sendKeysToElement(list("���ƿ�ݻ�",key="enter"))


#�ؽ��±� �˻�
click <- remDr$findElement(using="css" , "#react-root > section > nav > div._8MQSO.Cx7Bp > div > div > div.LWmhU._0aCwM > div.drKGC > div > a:nth-child(1) > div > div > div.uyeeR > span")
click$clickElement()




#-------------------------------------------------

# ���� & ���ƿ� & ���  â ������

post_click <- remDr$findElement(using="css" , "#react-root > section > main > article > div:nth-child(3) > div > div:nth-child(1) > div:nth-child(1) > a > div > div._9AhH0")
post_click$clickElement()

#1~10 ���� �ݺ�
for(i in c(1:10)){
  Sys.sleep(6)
  
  #���ƿ�
  like <- remDr$findElements(using="css" , ".fr66n")
  if(length(like) == 0){
    comment_click <- remDr$findElement(using="css" , "body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a._65Bje.coreSpriteRightPaginationArrow")
    comment_click$clickElement()
  }else{
    like <- remDr$findElement(using="css" , ".fr66n")
    like$clickElement()
    
    Sys.sleep(2)
    
    #�ȷο�
    follow <- remDr$findElement(using="css" , "body > div._2dDPU.CkGkG > div.zZYga > div > article > header > div.o-MQd.z8cbW > div.PQo_0.RqtMr > div.bY2yH > button")
    follow$clickElement()
    unfollow <- remDr$findElements(using="css" , "button.aOOlW.HoLwm")
    if(length(unfollow) == 1){
      cancel_unfollow <- remDr$findElement(using="css" , "body > div.RnEpo.Yx5HN > div > div > div > div.mt3GC > button.aOOlW.HoLwm")
      cancel_unfollow$clickElement()
      
      Sys.sleep(3)
      
      comment_click <- remDr$findElement(using="css" , "body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a._65Bje.coreSpriteRightPaginationArrow")
      comment_click$clickElement()
      
    }else{
      
      Sys.sleep(6)
      
      #���
      
      comment <- remDr$findElements(using="css" , "form > textarea")
      if(length(comment) == 0){
        comment_click <- remDr$findElement(using="css" , "body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a._65Bje.coreSpriteRightPaginationArrow")
        comment_click$clickElement()
      }else{
        comment <- remDr$findElement(using="css" , "form > textarea")
        comment$clickElement()
        
        comment2 <- remDr$findElement(using="css" , ".Ypffh")
        comment2$sendKeysToElement(list("���ƿ� �� ������ ���ϴ�~"))
        
        Sys.sleep(3)
        
        #��� �ޱ�
        comment_click <- remDr$findElement(using="css" , "section.sH9wk._JgwE > div > form > button")
        comment_click$clickElement()
        
        Sys.sleep(5)
      }
      comment_click <- remDr$findElement(using="css" , "body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a._65Bje.coreSpriteRightPaginationArrow")
      comment_click$clickElement()
      
      Sys.sleep(1)
      
    }
  }
}
