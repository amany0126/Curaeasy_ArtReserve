<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인천아트플랫폼 > 공지사항</title>

    <!-- Stylesheets (link rel 제거) -->
    <style>
        /* 최소한의 스타일만 유지 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .sub_top_bnr {
            background-color: #f5f5f5;
            padding: 20px;
            text-align: center;
        }
        .sub_top_bnr h2 {
            margin: 0;
            font-size: 24px;
        }
        .sub_top_bnr small {
            display: block;
            margin-top: 10px;
            font-size: 14px;
        }
        .sub_path {
            list-style: none;
            padding: 0;
            margin: 20px 0 0;
            display: flex;
            justify-content: center;
        }
        .sub_path li {
            margin: 0 10px;
        }
        .sub_container {
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }
        .board_list_table {
            width: 100%;
            border-collapse: collapse;
        }
        .board_list_table th, .board_list_table td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .board_list_table th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<!-- Header 영역은 생략 -->

<section class="sub_top_bnr marginB160">
    <div>
        <h2 class="dcb">COMMUNITY</h2>
        <small>소식/정보</small>
    </div>
    <ul class="sub_path">
        <li><a href="../index.html"><img src="../img/sub_path_home.png" alt="Home" /></a></li>
        <li>소식/정보</li>
        <li>공지사항</li>
    </ul>
</section>

<section id="board_notice" class="sub_container">
    <div class="sub_tit_box marginB120">
        <h3>공지사항</h3>
    </div>

    <div class="board_list_container">
        <h4 class="sub_tit03">공지사항</h4>
        <div class="board_list_search marginB50">
            <div style="display:contents">
                <label for="q" style="display:none">검색어</label>
                <input type="text" id="q" name="q" class="input_com" value="">
                <button id="search">검색</button>
            </div>
        </div>

        <div class="board_list_inner">
            <div class="board_list_table">
                <table>
                    <caption>공지사항</caption>
                    <colgroup>
                        <col class="wr_num" />
                        <col class="wr_subject" />
                        <col class="wr_date" />
                    </colgroup>
                    <thead>
                        <tr class="list_head">
                            <th>No.</th>
                            <th>제목</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="list_body">
                            <td>1</td>
                            <td>
                                <a href="#" class="subject">[공지] 2024 인천아트플랫폼 정기대관(6월~12월) 결과 공고</a>
                            </td>
                            <td>2024-05-28</td>
                        </tr>
                        <tr class="list_body">
                            <td>2</td>
                            <td>
                                <a href="#" class="subject">[공지] 2024 인천아트플랫폼 보안인력 운영 용역 소액 수의 견적 제출 안내 공고</a>
                            </td>
                            <td>2024-05-21</td>
                        </tr>
                        <tr class="list_body">
                            <td>3</td>
                            <td>
                                <a href="#" class="subject">[공지] 인천아트플랫폼 2024 청년예술가 스튜디오 지원사업 입주 예술가 모집 공고</a>
                            </td>
                            <td>2024-05-10</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="board_paging">
            <a href="#" class="paging_btn prev page_no">이전 페이지</a>
            <ol class="paging_num">
                <li><a class="on" href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">6</a></li>
                <li><a href="#">7</a></li>
                <li><a href="#">8</a></li>
                <li><a href="#">9</a></li>
            </ol>
            <a href="#" class="paging_btn next">다음 페이지</a>
        </div>
    </div>
</section>

<footer id="ft">
    <div class="ft_menu">
        <div class="top_box">
            <img src="../img/ft_menu_top_img01.png" alt="INCHEON ART PLATFORM" />
            <img src="../img/ft_menu_top_img02.png" alt="I-A-P" />
        </div>
        <nav class="wid1780">
            <ul class="menu_list">
                <li class="dep1_li">
                    <a href="../intro/about.html" class="dep1_a">인천아트플랫폼</a>
                    <ul class="dep2_ul">
                        <li class="dep2_li"><a href="../intro/about.html" class="dep2_a"><span>IAP 소개</span></a></li>
                        <li class="dep2_li"><a href="../intro/space.html" class="dep2_a"><span>IAP 공간</span></a></li>
                        <li class="dep2_li"><a href="../intro/organization.html" class="dep2_a"><span>IAP 조직도</span></a></li>
                        <li class="dep2_li"><a href="../intro/ci.html" class="dep2_a"><span>CI 소개</span></a></li>
                        <li class="dep2_li"><a href="../intro/location.html" class="dep2_a"><span>오시는 길</span></a></li>
                    </ul>
                </li>
                <li class="dep1_li">
                    <a href="../residency/intro.html" class="dep1_a">예술창작공간</a>
                    <ul class="dep2_ul">
                        <li class="dep2_li"><a href="../residency/intro.html" class="dep2_a"><span>예술창작공간 소개</span></a></li>
                        <li class="dep2_li"><a href="../residency/list.html" class="dep2_a"><span>입주작가</span></a></li>
                        <li class="dep2_li"><a href="../opencall/list.html" class="dep2_a"><span>입주 신청</span></a></li>
                        <li class="dep2_li"><a href="../news/list.html" class="dep2_a"><span>입주작가 소식</span></a></li>
                    </ul>
                </li>
                <li class="dep1_li">
                    <a href="../program/list.html" class="dep1_a">전시</a>
                    <ul class="dep2_ul">
                        <li class="dep2_li"><a href="../program/list.html" class="dep2_a"><span>현재 전시</span></a></li>
                        <li class="dep2_li"><a href="../program/list.html" class="dep2_a"><span>지난 전시</span></a></li>
                        <li class="dep2_li"><a href="../program/list.html" class="dep2_a"><span>온라인 전시</span></a></li>
                    </ul>
                </li>
                <li class="dep1_li">
                    <a href="../program/list.html" class="dep1_a">공연</a>
                    <ul class="dep2_ul">
                        <li class="dep2_li"><a href="../program/list.html" class="dep2_a"><span>현재 공연</span></a></li>
                        <li class="dep2_li"><a href="../program/list.html" class="dep2_a"><span>지난 공연</span></a></li>
                    </ul>
                </li>
                <li class="dep1_li">
                    <a href="../program/list.html" class="dep1_a">교육/행사</a>
                    <ul class="dep2_ul">
                        <li class="dep2_li"><a href="../program/list.html" class="dep2_a"><span>교육</span></a></li>
                        <li class="dep2_li"><a href="../program/list.html" class="dep2_a"><span>행사</span></a></li>
                        <li class="dep2_li"><a href="../program/list.html" class="dep2_a"><span>대관행사</span></a></li>
                    </ul>
                </li>
                <li class="dep1_li">
                    <a href="../reservation/intro.html" class="dep1_a">대관</a>
                    <ul class="dep2_ul">
                        <li class="dep2_li"><a href="../reservation/intro.html" class="dep2_a"><span>대관안내</span></a></li>
                        <li class="dep2_li"><a href="../reservation/list.html" class="dep2_a"><span>대관신청</span></a></li>
                    </ul>
                </li>
                <li class="dep1_li">
                    <a href="list.html" class="dep1_a">소식/정보</a>
                    <ul class="dep2_ul">
                        <li class="dep2_li"><a href="list.html" class="dep2_a"><span>공지사항</span></a></li>
                        <li class="dep2_li"><a href="../reference/list.html" class="dep2_a"><span>IAP 자료</span></a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
    <div class="ft_content">
        <div class="ft_top">
            <ul class="ft_link">
                <li><a href="https://ifac.or.kr/IFACBBS/page.php?hid=privacy_ft" target="_blank">개인정보처리방침</a></li>
                <li><a href="http://ifac.or.kr/IFACBBS/page.php?hid=noemail" target="_blank">이메일무단수집거부<img src="../img/ft_link_ico.png" alt="새창열림" /></a></li>
                <li><a href="../mailing/write.html">메일링 신청</a></li>
            </ul>
            <ul class="ft_sns">
                <li><a href="http://instagram.com/incheonartplatform" target="_blank" class="ico02">인스타그램</a></li>
                <li><a href="http://facebook.com/Inartplatform" target="_blank" class="ico01">페이스북</a></li>
                <li><a href="http://www.youtube.com/channel/UCQjJedZBKq1oyyobu0dtZVQ" target="_blank" class="ico03">유튜브</a></li>
            </ul>
            <div class="ft_family">
                <button id="family_btn">패밀리사이트</button>
                <ul>
                    <li><a href="http://ifac.or.kr/" target="_blank" title="새창열림">인천문화재단</a></li>
                    <li><a href="http://artist.ifac.or.kr/" target="_blank" title="새창열림">인천예술인지원센터</a></li>
                    <li><a href="http://incheon.go.kr/" target="_blank" title="새창열림">인천광역시</a></li>
                </ul>
            </div>
        </div>
        <div class="ft_btm wid1780">
            <strong class="ft_logo"><img src="../img/ft_logo.png" alt="인천아트플랫폼" /></strong>
            <div class="ft_compy">
                <p>
                    <span>(재)인천문화재단 인천아트플랫폼</span>
                    <span>인천광역시 중구 제물량로 218번길 3(해안동 1가)</span>
                </p>
                <p>
                    <span>Tel. 032-760-1000</span>
                    <span>Fax. 032-760-1010</span>
                </p>
            </div>
            <p class="ft_copy">Copyright @ Incheon Art Platform. All Rights Reserved.</p>
        </div>
    </div>
</footer><!--footer end-->

<script>
    $(function() {
        $("#q").keydown(function(e) {
            if(e.keyCode == 13) {
                search();
            }
        });

        $("#search").click(function(e) {
            search();
        });
    });

    function search() {
        var q = $("#q").val();
        location.href = "/notice/list?p=1&q="+q;
    }
</script>

</body>
</html>
