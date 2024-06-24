<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        
    
    <meta charset="UTF-8">
    <title>전시 상세</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 1200px;
            margin: auto; margin-top: 50px;
            padding: 20px;

        }
        .header, .footer {
            background-color: #f8f8f8;
            padding: 20px;
            text-align: center;
        }
        .content { padding: 20px; }
        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .content-header h1 { font-size: 2em; margin: 0; }
        .exhibition-details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .exhibition-item { width: 45%; }
        .exhibition-item img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }
        .exhibition-info { width: 45%; }
        .exhibition-item table {
            width: 100%;
            border-collapse: collapse;
        }
        .exhibition-item th, .exhibition-item td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .exhibition-item th { background-color: #f2f2f2; }
        .exhibition-intro { margin-top: 40px; }
        .exhibition-intro h2 {
            font-size: 1.8em;
            margin-bottom: 20px;
        }
        .exhibition-intro img {
            width: 100%;
            height: auto;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .exhibition-intro p { font-size: 1em; line-height: 1.5; }
        .back-to-list { text-align: center; margin-top: 30px; margin-bottom: 50px; }
        .back-to-list a {
            text-decoration: none;
            color: #fff;
            background-color: #333;
            padding: 10px 20px;
            border-radius: 5px;
        }
        hr {
            border: 0;
            border-top: 2px solid #ccc;
            margin: 30px 0;
        }

        #calendar-container a{ color: black; text-decoration: none;}
    </style>

    <!-- jQuery UI CSS -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

    <!-- jQuery UI 라이브러리 js -->
    <script src="https://raw.githubusercontent.com/jquery/jquery-ui/main/ui/i18n/datepicker-ko.js"></script>

    <!-- datepicker 언어팩 -->
    <script src="https://raw.githubusercontent.com/jquery/jquery-ui/main/ui/i18n/datepicker-ko.js"></script>

    <!-- full calander 관련 -->

    <!-- fullcalendar CDN -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <!-- fullcalendar 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <style>
    /* body 스타일 */
    /* html, body {
        overflow: hidden;
        font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
        font-size: 14px; 
        width: 400px;
        height: 400px; 
        
    } */
    /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
    .fc-header-toolbar {
        padding-top: 1em;
        padding-left: 1em;
        padding-right: 1em;
    }
        .fc-day-sun a {
        color: red;
        }
    .fc-daygrid-day-frame{
        height: 50px;
    }

        
    /* 토요일 날짜: 파란색 */
    .fc-day-sat a {
        color: blue;
    }
    </style>

</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="container">
    <div class="content">
        <!-- <div class="content-header">
            <h1>현재 전시</h1>
            <form action="reserveDisplay.do" method="post">
                <input type="hidden" name="dno" value="${requestScope.d.displayNo}">
                <button>예매하기</button>
            </form>
        </div> -->
        <hr>
        <div class="exhibition-details">
            <div class="exhibition-item">
                
                <h2>${requestScope.d.displayName}</h2>
                <img src="resources/display/${requestScope.list[0].changeName}" alt="전시 이미지">
                <br><br>
                <table class="table thead-dark">
                    <tr>
                        <th>전시명</th>
                        <td>${requestScope.d.displayName}</td>
                    </tr>
                    <tr>
                        <th>기간</th>
                        <td>${ requestScope.d.displayStartDate } ~ ${ requestScope.d.displayEndDate }</td>
                    </tr>
                    <tr>
                        <th>장소</th>
                        <td>${ requestScope.d.galleryNo }</td>
                    </tr>
                </table>
            </div>
            <div class="exhibition-info">
                <div id='calendar-container' style="text-align: right;">
                    <div id='calendar'></div>
                    <p style="padding: 10px; margin: 0px;"><strong>예매 인원 선택 후 날짜 선택</strong></p>
                </div>
                <div class="input-group-prepend">
                    <label class="input-group-text" for="inputGroupSelect01">예매 인원수</label>
                    <select class="custom-select" id="inputGroupSelect01">
                        <option value="1" selected>1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="3">4</option>
                        <option value="3">5</option>
                    </select>
                </div>
            </div>
        </div>
        <hr>
        <div class="exhibition-intro">
            <h2>전시 소개</h2>
            <c:forEach items="${ requestScope.list }" var="item">
            	<img src="resources/display/${ item.changeName }" alt="전시 포스터">
            </c:forEach>
            <p>${ requestScope.d.displayContent }</p>
        </div>
        <hr>
        <div class="back-to-list">
            <a href="onDisplay.do">목록으로 가기</a>
        </div>
    </div>
</div>

<script>
    
    $(function(){

        // const endYear = '${requestScope.d.displayEndDate}'.slice(0,4);
        // const endMonth = "${requestScope.d.displayEndDate}".slice(5, 7);
        // const endDay = Number("${requestScope.d.displayEndDate}".slice(8, 10));
        // let endDate = new Date(endYear, endMonth, endDay)

        // console.log(endYear);
        // console.log(endMonth);
        // console.log(endDay);
        // endDate.setDate(endDate.getDate() + 1)
        // console.log(endDate);
        
        // calendar element 취득
        var calendarEl = $('#calendar')[0];
        // full-calendar 생성하기
        var calendar = new FullCalendar.Calendar(calendarEl, {
          height: 'auto', // calendar 높이 설정
          // contentHeight : '50px',
          expandRows: false, // 화면에 맞게 높이 재설정
          // slotMinTime: '08:00', // Day 캘린더에서 시작 시간
          // slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
          // 해더에 표시할 툴바
          headerToolbar: {
            left: 'prev', //,today
            center: 'title',
            right : 'next'
          //right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
          },
          showNonCurrentDates : false, // 전달 이번달 일자 안보이기
          initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
          // initialDate: '2024-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
          navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
          editable: false, // 수정 가능?
          selectable: false, // 달력 일자 드래그 설정가능
          nowIndicator: true, // 현재 시간 마크
          dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
          locale: 'ko', // 한국어 설정
          weekends: false,
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
              console.log(info.jsEvent.toElement.innerText === "예약가능");
              console.log(info.jsEvent.toElement.className.includes("fc-bg-event fc-event fc-event-start fc-event-end fc-event-future"));
             
              if(info.jsEvent.toElement.className.includes("number")){
                
              }else{
             
              if(info.jsEvent.toElement.className.includes("fc-bg-event fc-event fc-event-start fc-event-end fc-event-future")){
                  alert('예약가능한 일자')
                  let f = document.createElement('form');
                    let dno = '${requestScope.dno}'
                
                    let obj1;
                    obj1 = document.createElement('input');
                    obj1.setAttribute('type', 'hidden');
                    obj1.setAttribute('name', 'disNo');
                    obj1.setAttribute('value', '${requestScope.d.displayNo}');

                    let obj2;
                    obj2 = document.createElement('input');
                    obj2.setAttribute('type', 'hidden');
                    obj2.setAttribute('name', 'staDay');
                    obj2.setAttribute('value', info.dateStr);
                    
                    let obj3;
                    obj3 = document.createElement('input');
                    obj3.setAttribute('type', 'hidden');
                    obj3.setAttribute('name', 'amount');
                    obj3.setAttribute('value', document.getElementById("inputGroupSelect01").value);
                

                    f.appendChild(obj1);
                    f.appendChild(obj2);
                    f.appendChild(obj3);
                    console.log(f)
                    f.setAttribute('method', 'post');
                    f.setAttribute('action', 'reserveDisplay.do');
                    
                    document.body.appendChild(f);
                    f.submit();
            }else{
                  alert('예약이 안될때 ');
              }
            }
              // window.open("https://www.google.com/"); // 오픈할 사이트 등록
             
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
          }
          // 이벤트 
        //   events: [
        //     {
        //       start: '${requestScope.d.displayStartDate}'.slice(0, 10),
        //       end : new Date('${requestScope.d.displayEndDate}'.slice(0,4),
        //                      '${requestScope.d.displayEndDate}'.slice(5,7) - 1,
        //                      '${requestScope.d.displayEndDate}'.slice(8,10) + 1

        //       ).toISOString().slice(0, 10),
        //       display: 'inverse-background',
        //     },     
        //   ]
        });

        // 이벤트 생성
        const startDate = new Date("${requestScope.d.displayStartDate}");
        const endDate = new Date("${requestScope.d.displayEndDate}");
    	  
        let loop = new Date(startDate);

        // console.log("${requestScope.d.displayEndDate}".slice(0, 4));
        // console.log("${requestScope.d.displayEndDate}".slice(5, 7));
        // console.log(Number("${requestScope.d.displayEndDate}".slice(8, 10)) + 1);
        // console.log(new Date('${requestScope.d.displayEndDate}'.slice(0,4),
        //                      '${requestScope.d.displayEndDate}'.slice(5,7) - 1,
        //                      Number('${requestScope.d.displayEndDate}'.slice(8,10)) + 1).toString());
                             
        while (loop <= endDate) {
            // console.log(loop);
            let newDate = loop.setDate(loop.getDate() + 1);
            calendar.addEvent({
                title: "",
                start: loop.toISOString().slice(0,10),
                display: 'background'
            });
            loop = new Date(newDate);
        }

        // 캘린더 랜더링
        calendar.render();
      });
  </script>

<!-- datepicker 관련 
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>
    
    $(function() {
        $.datepicker.setDefaults({
            closeText: "닫기",
            currentText: "오늘",
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            weekHeader: "주",
            yearSuffix: '년',
            dateFormat: 'yy-mm-dd',
            firstDay: 0,
            isRTL: false,
            showMonthAfterYear: true,
            yearSuffix: '년'
            });
        $("#datepicker").datepicker();
    })
</script> -->

<jsp:include page="../common/footer.jsp" />

</body>
</html>
