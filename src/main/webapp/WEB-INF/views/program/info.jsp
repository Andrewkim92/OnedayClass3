<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" type="text/css" href="/resources/css/board_info.css">


<div class="sc-bWFPNQ kaCyPO">
   <div class="sc-kpOJdX jAiMre" style="opacity: 1; display: block;">
      <div class="sc-goFBvh bSSSsW">
         <!-- 왼쪽 -->
         <div class="sc-cBOTKl hkKRDg">
            <div class="sc-eomEcv esthlj">
               <!-- 메인 사진 -->
               <div class="slick-slider sc-iBfVdv iVRQGn slick-initialized" dir="ltr">
                  <img src="" >
               </div>
               <!-- content 전체 -->
               <div class="sc-hkHFWD gYLEiZ">
                  <!-- 제목+가격 부분-->
                  <section class="sc-dCaJBF bfcWhe">
                  <div class="sc-erOsFi hFjPxk">
                     <!--서브제목  -->
                     <h2 class="sc-bscRGj jYYcp"><c:out value="${program.progSmallTitle}"/></h2>
                        
                     <!-- 제목  -->
                     <h1 class="sc-hlELIx bhbvkZ"><c:out value="${program.progBigTitle}"/></h1>
                     
                     <!-- 링크 -->
                     <div class="sc-eGXxtx hxxvuL">
                     
                     </div>
                     <!--가격  -->
                     <div class="sc-eetwQk eTydPh">
                        <!-- 가격  -->
                        <div class="sc-dUcZlc ehvImL">
                        </div>
                     </div>
                  </div>
                  </section>
                  <!--   -->
                  <section class="sc-iNovjJ fLDIpJ sc-dCaJBF bfcWhe">
                     <!-- 조아요 -->
                     <div class="sc-cgzHhG bFyWVq">
                        <img class="sc-jtHxuu bmAmNZ" src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath d='M0 0h24v24H0z'/%3E %3Cpath fill='%23F66' d='M12.242 6.129l-.555-.555C9.84 3.727 6.841 3.428 4.828 5.091a5.001 5.001 0 0 0-.364 7.402l7.071 7.07a1 1 0 0 0 1.415 0l7.07-7.07a5.001 5.001 0 0 0-.364-7.402c-2.013-1.663-5.012-1.364-6.859.483l-.555.555z'/%3E %3C/g%3E %3C/svg%3E">
                        <div class="sc-blIhvV fXrOfX">
                        <c:out value="${program.progLikeCount}"/>
                        </div>
                     </div>
                     <!-- 유효기간 -->
                     <div class="sc-cgzHhG bFyWVq">  
                        <img class="sc-jtHxuu bmAmNZ" src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath d='M0 0h18v18H0z'/%3E %3Crect width='12' height='12' x='3' y='3' fill='%233397FF' fill-rule='nonzero' rx='1'/%3E %3Cpath fill='%23FFF' fill-rule='nonzero' d='M5 8h8v5H5z'/%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M5 1h2v2H5zM11 1h2v2h-2z'/%3E %3C/g%3E %3C/svg%3E">
                     </div>
                     <!-- 위치 -->
                     <div class="sc-cgzHhG bFyWVq">
                        <img class="sc-jtHxuu bmAmNZ" src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath d='M0 0h18v18H0z'/%3E %3Cpath fill='%233397FF' d='M3 7c0 1.094.298 2.117.81 3 .624 1.077 2.092 3.081 4.405 6.01a1 1 0 0 0 1.57 0c2.313-2.929 3.782-4.933 4.406-6.01A5.96 5.96 0 0 0 15 7 6 6 0 0 0 3 7z'/%3E %3Cpath fill='%23FFF' d='M8.875 8.75a1.876 1.876 0 1 1 .001-3.751 1.876 1.876 0 0 1-.001 3.751z'/%3E %3C/g%3E %3C/svg%3E">
                        <c:out value="${program.progLocation}"/>
                     </div>
                     <!-- 평점 -->
                     <div class="sc-cgzHhG bFyWVq">
                        <img class="sc-jtHxuu bmAmNZ" src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E %3Cpath fill='%233397FF' fill-rule='nonzero' d='M8 12.16l-3.852 1.894a.5.5 0 0 1-.715-.52l.61-4.248-2.991-3.079a.5.5 0 0 1 .273-.84l4.23-.733L7.558.838a.5.5 0 0 1 .884 0l2.003 3.796 4.23.732a.5.5 0 0 1 .273.841l-2.992 3.079.611 4.248a.5.5 0 0 1-.715.52L8 12.16z'/%3E %3C/svg%3E">
                     </div>
                  </section>
                  <!-- 호스트 세션 -->
                  <section class="sc-dCaJBF bfcWhe">
                     <header class="sc-cXHFlN edoDdg">
                        <h4 class="sc-ihiiSJ ixbWtH"><a href="#">호스트 프로필 보기</a></h4>
                     </header>
                     <!-- <a class="sc-frDJqD kmtMnu" href="#"><h4 class="sc-ihiiSJ ixbWtH">호스트 프로필</h4></a>
 -->                  
                  </section>
                  <!-- 호스트 후기  -->
                  <section class="sc-jJkQYJ ifemui sc-dCaJBF bfcWhe">
                     <header class="sc-cXHFlN edoDdg">
                        <h4 class="sc-ihiiSJ ixbWtH"><a href="#">호스트 후기 보기</a></h4>
                     </header>
                  </section>
                  <!--  프립 내용-->
                  <section class="sc-dCaJBF bfcWhe">
                     <header class="sc-cXHFlN edoDdg">
                        <h4 class="sc-ihiiSJ ixbWtH">프립 소개</h4>
                     </header>
                     <div class="sc-gJTSre jVuYqM">
                        <c:out value="${program.progContents}"/>
                        <p style="text-align:center">
                           <strong>ㅡ <br>
                              프립에서 구매 후 <br>
                               호스트 연락처를 문자로 보내드립니다. <br>
                               구매 전 문의사항은 Q&A 게시판을 이용해주세요.<br>
                               ㅡ
                           </strong>
                        </p>
                        
                        <!-- 내용 -->
                        <p>
                           
                        </p>
                        
                        <!-- 유의사항 -->
                        <p style="text-align:left">
                           <strong>[클래스 안내] <br></strong>
                           · 프립 진행 가능 시간 <br>
                           - 평일(월~금) 오전 10시~오후5시 원하는 시간대 신청가능 <br>
                           - 저녁수업 (금요일 19:00) <br>
                           - 토요일 14:00 / 17:00 <br>
                           · 문의 : Q&A 게시판 활용 <br>
                           ※ 정확한 일정 협의는 Q&A 게시판 또는 구매 후 문자로 발송되는 호스트 연락처로 문의해주세요. <br>
                        </p>
                        
                        <!-- 신청시 유의사항 -->
                        <p style="text-align:left">
                           <strong>[신청시 유의사항] <br></strong>
                           · 구매 시 호스트 연락처를 문자로 보내드립니다.
                           · 프립에서 구매 후 업체에 전화로 가능한 날짜 예약 바랍니다.
                           · 예약 확정 시 호스트가 출석체크를 진행합니다.
                           · 예약 시간에 맞추어 늦지 않게 도착해 주시기 바랍니다.
                           · 평일은 1인도 수업 가능합니다. 금요일 저녁, 주말 수업은 최소 2인 이상 모객이 되어야 수업 가능함을 미리 알려드립니다.
                        </p>
                     </div>   
                  </section> 
                  <!-- 포함사항 -->
                  <section class="sc-dCaJBF bfcWhe">
                     <header class="sc-cXHFlN edoDdg">
                        <h4 class="sc-ihiiSJ ixbWtH">포함 사항</h4>
                     </header>
                  </section>
                  <!-- 불포함사항 -->
                  <section class="sc-dCaJBF bfcWhe">
                     <header class="sc-cXHFlN edoDdg">
                        <h4 class="sc-ihiiSJ ixbWtH">불포함 사항</h4>
                     </header>
                  </section>
                  <!-- 준비물 -->
                  <section class="sc-dCaJBF bfcWhe">
                     <header class="sc-cXHFlN edoDdg">
                        <h4 class="sc-ihiiSJ ixbWtH">준비물</h4>
                     </header>
                  </section>
                  
                  <!-- 유의사항 -->
                  <section class="sc-dCaJBF bfcWhe">
                     <header class="sc-cXHFlN edoDdg">
                        <h4 class="sc-ihiiSJ ixbWtH">유의 사항</h4>
                     </header>
                     <div class="sc-MKjYC hfpCur">
                        원데이클래스에서 구매하시지 않는 경우, 환불 거부, 서비스 불이행 등의 문제가 생길 수 있습니다.
                     </div>
                     <div>
                        수업시간 5~10분전에 오시면 감사합니다. 당일 취소는 어렵습니다. <br>수업은 정시에 시작합니다.
                     </div>
                  </section>
                  
                  <!-- 지도  -->
                  <section class="sc-dCaJBF bfcWhe">
                     <header class="sc-cXHFlN edoDdg">
                        <h4 class="sc-ihiiSJ ixbWtH">진행 장소</h4>
                     </header>
                     
                     <!--   지도넣기!!! -->
                     <div>
                     
                     </div>
                  </section>
                  
                  <!-- 문의하기  -->
                  <section class="sc-jJkQYJ ifemui sc-dCaJBF bfcWhe">
                     <header class="sc-cXHFlN edoDdg">
                        <h4 class="sc-ihiiSJ ixbWtH"><a href="#">문의하기 </a></h4>
                     </header>
                  </section>
                  
                  <!-- 환불 정책  -->
                  <section class="sc-jJkQYJ ifemui sc-dCaJBF bfcWhe">
                     <header class="sc-cXHFlN edoDdg">
                        <h4 class="sc-ihiiSJ ixbWtH"><a href="#">환불 정책</a></h4>
                     </header>
                     <div>
                        <p>티켓 구매 후 2주 이내 100% 환불, 2주 후에는 환불 불가 <br><br>
                           [환불 신청 방법] <br>

                           1. 해당 티켓을 결제한 계정으로 로그인 <br>
                           2. 내 활동 클릭 <br>
                           3. 취소를 원하는 티켓 신청 정보 보기 클릭 후 신청 취소 클릭 <br>
                           4. 환불신청 절차에 따라 예금주, 은행명, 계좌번호 입력 <br>
                        </p>
                     </div>
                  </section>
                  
                  
                  
                  
                  
                  
               </div>
            </div>
         </div> <!-- 왼쪽 -->
         
         <!-- 오른쪽 -->
         <div class="sc-fxgLge jQVKkL">
            <div class="sc-hDgvsY dBqRBP" id="option-selector-sidebar">
               <div class="sc-ctwKVn frwmAG">옵션선택</div>
               <div class="sc-bdVaJa bZSPZg">
                  <div class="sc-htpNat jJUbVE">
                     <div class="sc-ccvjgv gPfmeZ sc-kvkilB frGBIt" font-size="13px" color="#9b9b9b" >
                        <div>날짜 선택</div>
                     
                     <div class="sc-bwzfXH hLwoa">
                        <img class="sc-bxivhb gWuKaH" src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath d='M18 0H0v18h18z'/%3E %3Cpath stroke='%23000' stroke-width='1.5' d='M7 5l4 4-4 4'/%3E %3C/g%3E %3C/svg%3E">
                     </div>
                     <!-- 참여하기 버튼-->
                     <div class="sc-dpiBDp dePIsb"></div>
                     <div class="sc-hENMEE dRcDEu">
                        <button class="sc-fyjYeE drzSNz sc-iAyFgw cnMpLR" width="90%" color="white" font-size="13px" font-weight="bold">
                           참여하기 </button>
                     </div>
                  </div>
                  </div>
                  
               
               </div>
               
               
            </div>   
         </div> <!-- 오른쪽-->
         
      </div>
   </div>
</div>