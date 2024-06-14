<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
  <meta charset='utf-8' />
  <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<style>
  /* body 스타일 */
  html, body {
    overflow: hidden;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
    overflow: auto;
  }
  /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
  .fc-header-toolbar {
    padding-top: 1em;
    padding-left: 1em;
    padding-right: 1em;
  }
   .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
            
  }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<br><br> 
 <div class="innerOuter">
  <!-- calendar 태그 -->
	  <div id='calendar-container'  style="padding:30px;">
	    <div id='calendar'></div>
	  </div>
 </div> 
<br><br>
<jsp:include page="../common/footer.jsp" /> 
  <script>
  (function(){
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];

      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
    	 contentHeight: 700, // calendar 높이 설정
        expandRows: false, // 화면에 맞게 높이 재설정
        
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간

        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,today,next',
          center: 'title',
          right : ''
        //right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        //initialDate: '2024-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: false, // 수정 가능?
        Boolean, default: true, // 페이지의 다른 곳을 클릭하면 현재 선택이 지워지는지 여부입니다.
        selectable: false, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },

   
        eventClick: function(info) { // 이벤트 클릭시 사용할 이벤트
            
            // alert('이미 등록된 일정입니다');
        // change the border color just for fun
        info.el.style.borderColor = 'red';
        },
        
        dateClick: function(info) { // 일정 하나 선택
           console.log(info); 
           console.log(info.dateStr); 
           console.log('${requestScope.today1}'); 
            
           	
           if(info.jsEvent.toElement.className.includes("number")){
        	   
           }else{
            if(info.jsEvent.srcElement.innerText === "예약종료" || info.jsEvent.srcElement.innerText === "예약완료"){
                alert('신청이 불가능한 일정입니다');
                }else{
                alert('신청 가능한 일자입니다')
              	
            
                	    let f = document.createElement('form');
                		let gno = ${requestScope.gno};    
                	
                	    let obj1;
                	    obj1 = document.createElement('input');
                	    obj1.setAttribute('type', 'hidden');
                	    obj1.setAttribute('name', 'disNo');
                	    obj1.setAttribute('value', gno);

                	    let obj2;
                	    obj2 = document.createElement('input');
                	    obj2.setAttribute('type', 'hidden');
                	    obj2.setAttribute('name', 'staDay');
                	    obj2.setAttribute('value', info.dateStr);
                	    
                	    f.appendChild(obj1);
                	    f.appendChild(obj2);
                	    f.setAttribute('method', 'post');
                	    f.setAttribute('action', 'inrollFrom.re');
                	    document.body.appendChild(f);
                	    f.submit();
                
                
                
               /*  window.location.href = "http://localhost:8006/curaeasy/inrollFrom.re?disNo=${requestScope.gno}&staDay="+info.dateStr; */ 

            }
           }
           

           
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
        var title = prompt('일정등록 :');
          
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay,
              
            })
          }
          calendar.unselect()
        },
        // 이벤트 
        events: [
        	
        	<c:choose>
			<c:when test="${ empty requestScope.list}">
			</c:when>
			<c:otherwise>
				<c:forEach var="c" items="${list}">
				{
		            title: '예약완료',
		            start: '${c.rentalStartDate}',
		            end: '${c.rentalEndDate}',
		            display : 'background',
		            eventBackgroundColor : 'blue',
		            	eventBorderColor  : 'blue'
		          },
		          {
			            title: '예약완료',
			            start: '${c.rentalEndDate}',
			            display : 'background'
			       },
				</c:forEach>
			</c:otherwise>
		</c:choose>
	{
            title: '예약종료',
            start: '1000-01-01',
            end: '${requestScope.today}', 
            display : 'background'
        	
       },
        ]
      });
      // 캘린더 랜더링
      calendar.render();
    });
  })();
</script>

</body>
</html>