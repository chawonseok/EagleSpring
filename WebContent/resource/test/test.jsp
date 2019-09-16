<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
$(document).ready(function(){
    // li갯수
    var liLength = $(".banner ul li").size();
 
    // ul 넓이
    var ulWidth = 200* liLength
    $(".banner ul").css("width",ulWidth+"px")
 
    // 좌우 버튼 
    $(".btn_prev").click(function(){
        if($(".banner ul").css("margin-left") == "0px"){
            $(".banner ul").css("margin-left","0");
            indicator();
        }else{
                //조건시작
                if(!$(".banner ul").is(":animated")){
                    $(".banner ul").animate({"margin-left":"+=200"},500,function(){
                        indicator();
                    });
                }
                //조건끝       
            }
    });
     
    $(".btn_next").click(function(){
        if($(".banner ul").css("margin-left") == "-"+(ulWidth-200)+"px"){
            $(".banner ul").css("margin-left","-"+(ulWidth-200)+"px");
            indicator();
        }else{
            //조건시작
            if(!$(".banner ul").is(":animated")){
                $(".banner ul").animate({"margin-left":"-=200"},500,function(){ 
                    indicator();
                }); 
            }
            //조건끝           
        }   
    });
     
    // indicator Length
    for(var i=0 ; i<lilength ;="" i++){="" if(i="=0){" $(".indicator").append("<a="" href="#" class="on">");
        }else{
            $(".indicator").append("<a href="#"></a>");
        }
    }
 
    // indicator index 
    $(".indicator a").click(function(){
        var paging = $(this).index();
        $(".banner ul").animate({"margin-left":paging*-200+"px"},500);
        $(".indicator a").removeClass("on");
        $(".indicator a").eq(paging).addClass("on");
    });
 
    //좌우indicator 함수
    function indicator(){
        var leftPosition = parseInt($(".banner ul").css("margin-left"));    //parseInt 숫자값으로 변환     
        var anchorIndex = -(leftPosition/200);
        //var anchorIndex = Math.abs(leftPosition/200);
        $(".indicator a").removeClass("on");
        $(".indicator a").eq(anchorIndex).addClass("on");   
        //$(".indicator a").eq(-( parseInt($(".banner ul").css("margin-left"))/200)).addClass("on"); 
    }
     
});


</script>
</head>
<style>
.banner_wrap{position:relative; padding:100px}
 .banner_wrap .btn{display:block; width:50px; height:50px; position:absolute; left:30px; top:120px;}
 .banner_wrap .btn.btn_next{position:absolute; left:330px; top:120px;}
 .banner_wrap .banner{overflow:hidden; width:200px; height:100px}
 .banner_wrap .banner ul{*zoom:1; wid th:600px;}
 .banner_wrap .banner ul:after{display:block; content:""; clear:both;}
 .banner_wrap .banner ul li{float:left; width:200px; height:100px; background-color:#fff;}
 .indicator{width:200px; margin-top:10px; text-align:center;}
 .indicator a{display:inline-block; margin:0 2px; border:1px solid #fff; width:14px; height:14px; border-radius:10px; background-color:#fff;}
 .indicator a.on{border:1px solid #bc6848;  background-color:#bc6848; }
</style>
<body>
  <div class="banner_wrap"> 
    <div class="banner">
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
        </ul>
    </div>
    <div class="indicator">
         
    </div>
    <a href="#" class="btn btn_prev"><img src="http://i1.daumcdn.net/cfs.tistory/static/images/xBoxReplace_250.png" alt="이전버튼" width="250" height="250"></a>
    <a href="#" class="btn btn_next"><img src="http://i1.daumcdn.net/cfs.tistory/static/images/xBoxReplace_250.png" alt="다음버튼" width="250" height="250"></a>
</div>
</body>
</html>