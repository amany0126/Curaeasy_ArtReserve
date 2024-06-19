<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>사이드바</title>

    <style>
        .sidbar{
            display: inline-block;
            float : left;
            margin-top: 9%;
            padding-left :3% ;
            width: 20%
        }
        hr{
            background: black;
        }
        li{
            list-style-type : none;
            font-size: large;
            font-style: inherit;
        }
        li a {
            color: black;
            text-decoration: none;
        }
        li a:hover {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="sidbar">
        <hr style="height: 3px">
        <ul>
            <li><a href="myPage.me">마이페이지</a></li>
            <li><a href="#">결제내역조회</a></li>
            <li><a href="#">후기</a></li>
            <li><a href="enrollForm.at">작가신청</a></li>
        </ul>
        <hr style="height: 3px">
        <ul>
            <li><a href="rentalList.re">대관 신청 조회</a></li>
            <li><a href="#">전시회 관련 조회</a></li>
        </ul>
    </div>
</body>
</html>
