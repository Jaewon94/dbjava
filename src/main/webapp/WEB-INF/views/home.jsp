<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
	<div class="homeMain">
		<div class="categories">
			<div class="categoryImgBox">
				<a href="${cpath }/category/펜션"> <img
					src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%91%E1%85%A6%E1%86%AB%E1%84%89%E1%85%A7%E1%86%AB.png" class="categoryImg"
					style="background-color: grey;"> 펜션
				</a>
			</div>
			<div class="categoryImgBox">
				<a href="${cpath }/category/풀빌라"> <img
					src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%91%E1%85%AE%E1%86%AF%E1%84%87%E1%85%B5%E1%86%AF%E1%84%85%E1%85%A1.png" class="categoryImg"> 풀빌라
				</a>
			</div>
			<div class="categoryImgBox">
				<a href="${cpath }/category/호텔"> <img
					src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%92%E1%85%A9%E1%84%90%E1%85%A6%E1%86%AF.png" class="categoryImg"> 호텔
				</a>
			</div>
			<div class="categoryImgBox">
				<a href="${cpath }/category/리조트"> <img
					src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%85%E1%85%B5%E1%84%8C%E1%85%A9%E1%84%90%E1%85%B3.png" class="categoryImg"> 리조트
				</a>
			</div>
			<div class="categoryImgBox">
				<a href="${cpath }/category/글램핑"> <img
					src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%80%E1%85%B3%E1%86%AF%E1%84%85%E1%85%A2%E1%86%B7%E1%84%91%E1%85%B5%E1%86%BC.png" class="categoryImg"> 글램핑
				</a>
			</div>
			<div class="categoryImgBox">
				<a href="${cpath }/category/캠핑"> <img
					src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8F%E1%85%A2%E1%86%B7%E1%84%91%E1%85%B5%E1%86%BC.png" class="categoryImg"> 캠핑
				</a>
			</div>
			<div class="categoryImgBox">
				<a href="${cpath }/category/게스트하우스"> <img
					src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%80%E1%85%A6%E1%84%89%E1%85%B3%E1%84%90%E1%85%B3%E1%84%92%E1%85%A1%E1%84%8B%E1%85%AE%E1%84%89%E1%85%B3.png" class="categoryImg">
					게스트하우스
				</a>
			</div>
			<div class="categoryImgBox">
				<a href="${cpath }/category/한옥"> <img
					src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%92%E1%85%A1%E1%86%AB%E1%84%8B%E1%85%A9%E1%86%A8.png" class="categoryImg"> 한옥
				</a>
			</div>
			<div class="categoryImgBox">
				<a href="${cpath }/category/료칸"> <img
					src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%85%E1%85%AD%E1%84%8F%E1%85%A1%E1%86%AB.png" class="categoryImg"> 료칸
				</a>
			</div>
			<div class="categoryImgBox">
				<button class="filter">필터✔️</button>
			</div>
		</div>
		<div class="roomBox">
			<c:forEach var="dto" items="${rentList }">
				<div class="room">
					<a href="${cpath }/room/${dto.idx}"> 
						<img src="${dto.filePath }" class="roomImg">
					</a>
					<div class="roomItemInfo">
						<div>
							<span class="ellipsis">${dto.title}</span>
							<span class="roomPrice"><fmt:formatNumber value="${dto.price }" groupingUsed="true" />원</span>
							<span class="roomInfo">${dto.information }</span>
							<span class="roomLocation">${dto.address }</span>
						</div>
						<div>
							<c:if test="${dto.wishCount == 0 }">
								<button class="wish"><img src="https://dbjava.s3.amazonaws.com/essential/blankHeart.png"></button>
							</c:if>
							<c:if test="${dto.wishCount != 0 }">
								<button class="wish"><img src="https://dbjava.s3.amazonaws.com/essential/heart.png"></button>
							</c:if>
						</div>
						<input type="hidden" value="${dto.wishCount }"> <input
							type="hidden" value="${dto.idx }">
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<!-- 필터 모달 부분 -->
	<div id="myModal" class="modal">
		<div class="modal-content filterModal">
			<span class="close">×</span>
			<p>- 가격 -</p>
			<div class="checkBoxContainer0">
				<label>
					<input type="radio" name="priceSort" id="lowPriceRadio" value="low"> ▼ 최저가 순 
				</label>
				<label>
					<input type="radio" name="priceSort" id="highPriceRadio" value="high"> ▲ 최고가 순
				</label>
			</div>
			<p>- 편의시설 -</p>
			<span>필수</span> <br>
			<div class="checkBoxContainer1">
				<div class="checkBox1">
					<label> 
						<input type="checkbox" name="information" value="무선 인터넷" class="infoCheckbox"> 
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%86%E1%85%AE%E1%84%89%E1%85%A5%E1%86%AB+%E1%84%8B%E1%85%B5%E1%86%AB%E1%84%90%E1%85%A5%E1%84%82%E1%85%A6%E1%86%BA.png" class="checkInfo"> 무선인터넷 <br>
					</label>
					<label>
						<input type="checkbox" name="information" value="주방"class="infoCheckbox"> 
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8C%E1%85%AE%E1%84%87%E1%85%A1%E1%86%BC.png" class="checkInfo"> 주방 <br>
	
					</label>
				</div>
				<div class="checkBox2">
					<label> 
						<input type="checkbox" name="information" value="세탁기" class="infoCheckbox">
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%89%E1%85%A6%E1%84%90%E1%85%A1%E1%86%A8%E1%84%80%E1%85%B5.png" class="checkInfo">세탁기 <br>
					</label>
					<label>
						<input type="checkbox" name="information" value="에어컨"class="infoCheckbox"> 
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8B%E1%85%A6%E1%84%8B%E1%85%A5%E1%84%8F%E1%85%A5%E1%86%AB.png" class="checkInfo"> 에어컨 <br>
					</label>
				</div>
				<div class="checkBox3">
					<label> 
						<input type="checkbox" name="information" value="TV" class="infoCheckbox"> 
							<img src="https://dbjava.s3.amazonaws.com/essential/TV.png" class="checkInfo"> TV <br>
					</label>
					<label>
						<input type="checkbox" name="information" value="세탁기" class="infoCheckbox">
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8F%E1%85%A5%E1%86%B7%E1%84%91%E1%85%B2%E1%84%90%E1%85%A5.png" class="checkInfo"> 컴퓨터 <br>
					</label>
				</div>
				<div class="checkBox4">
					<label> 
						<input type="checkbox" name="information" value="주변 무료 주차" class="infoCheckbox"> 
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8C%E1%85%AE%E1%84%87%E1%85%A7%E1%86%AB+%E1%84%86%E1%85%AE%E1%84%85%E1%85%AD+%E1%84%8C%E1%85%AE%E1%84%8E%E1%85%A1.png" class="checkInfo"> 주변 무료 주차 <br>
					</label>
					<label>
						<input type="checkbox" name="information" value="주변 유료 주차" class="infoCheckbox"> 
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8C%E1%85%AE%E1%84%87%E1%85%A7%E1%86%AB+%E1%84%8B%E1%85%B2%E1%84%85%E1%85%AD+%E1%84%8C%E1%85%AE%E1%84%8E%E1%85%A1.png" class="checkInfo"> 주변 유료 주차 <br>
					</label>
				</div>
			</div>
			<p>- 그 밖의 편의시설 -</p>
			<div class="checkBoxContainer2">
				<div class="checkBox1">
					<label>
						<input type="checkbox" name="information" value="수영장" class="infoCheckbox"> 
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%89%E1%85%AE%E1%84%8B%E1%85%A7%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC.png" class="checkInfo"> 수영장 <br>
					</label>
					<label>
						<input type="checkbox" name="information" value="욕조" class="infoCheckbox"> 
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8B%E1%85%AD%E1%86%A8%E1%84%8C%E1%85%A9.png" class="checkInfo">욕조 <br>
					</label>
					<label>
						<input type="checkbox" name="information" value="피아노" class="infoCheckbox"> 
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%91%E1%85%B5%E1%84%8B%E1%85%A1%E1%84%82%E1%85%A9.png" class="checkInfo"> 피아노 <br>
					</label>
				</div>
				<div class="checkBox2">
					<label>
						<input type="checkbox" name="information" value="바베큐 그릴" class="infoCheckbox"> 
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%87%E1%85%A1%E1%84%87%E1%85%A6%E1%84%8F%E1%85%B2+%E1%84%80%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AF.png" class="checkInfo">바베큐 그릴<br>
					</label>
					<label>
						<input type="checkbox" name="information" value="키즈" class="infoCheckbox"> 
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8F%E1%85%B5%E1%84%8C%E1%85%B3.png" class="checkInfo">키즈 <br>
					</label>
					<label>
						<input type="checkbox" name="information" value="무료영화(OTT)" class="infoCheckbox"> 
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%86%E1%85%AE%E1%84%85%E1%85%AD%E1%84%8B%E1%85%A7%E1%86%BC%E1%84%92%E1%85%AA(OTT).png" class="checkInfo">무료영화 OTT <br>
					</label>
				</div>
				<div class="checkBox3">
					<label>
						<input type="checkbox" name="information" value="운동기구" class="infoCheckbox"> 
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8B%E1%85%AE%E1%86%AB%E1%84%83%E1%85%A9%E1%86%BC%E1%84%80%E1%85%B5%E1%84%80%E1%85%AE.png" class="checkInfo"> 운동기구<br>
					</label>
					<label>
						<input type="checkbox" name="information" value="계곡과 인접" class="infoCheckbox"> 
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%80%E1%85%A8%E1%84%80%E1%85%A9%E1%86%A8%E1%84%80%E1%85%AA+%E1%84%8B%E1%85%B5%E1%86%AB%E1%84%8C%E1%85%A5%E1%86%B8.png" class="checkInfo"> 계곡과 인접 <br>
					</label>
					<label>
						<input type="checkbox" name="information" value="해변과 인접" class="infoCheckbox"> 
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%92%E1%85%A2%E1%84%87%E1%85%A7%E1%86%AB%E1%84%80%E1%85%AA+%E1%84%8B%E1%85%B5%E1%86%AB%E1%84%8C%E1%85%A5%E1%86%B8.png" class="checkInfo"> 해변과 인접<br>
					</label>
				</div>
			</div>
			<p>- 안전관련 물품 -</p>
			<div class="checkBoxContainer3">
				<div class="checkBox1">
				<label>
					<input type="checkbox" name="information" value="구급상자" class="infoCheckbox"> 
						<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%80%E1%85%AE%E1%84%80%E1%85%B3%E1%86%B8%E1%84%89%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1.png" class="checkInfo">구급상자 <br>
					</label>
				</div>
				<div class="checkBox2">
					<label>
						<input type="checkbox" name="information" value="화재 경보기" class="infoCheckbox"> 
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%92%E1%85%AA%E1%84%8C%E1%85%A2%E1%84%80%E1%85%A7%E1%86%BC%E1%84%87%E1%85%A9%E1%84%80%E1%85%B5.png" class="checkInfo"> 화재 경보기<br>
					</label>
				</div>
				<div class="checkBox3">
					<label>
						<input type="checkbox" name="information" value="소화기" class="infoCheckbox"> 
							<img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%89%E1%85%A9%E1%84%92%E1%85%AA%E1%84%80%E1%85%B5.png" class="checkInfo">소화기 <br>
					</label>
				</div>
			</div>
			<p>- 위치 - </p>
				<div class="checkBoxContainer4">
					<div class="checkBox1">
						<label>
							<input type="checkbox" name="address" value="강원특별자치도" class="infoCheckbox"> 강원특별자치도  
						</label>
						<label>
							<input type="checkbox" name="address" value="경기도" class="infoCheckbox"> 경기도 
						</label>
						<label>
							<input type="checkbox" name="address" value="경상남도" class="infoCheckbox"> 경상남도 
						</label>
						<label>
							<input type="checkbox" name="address" value="경상북도" class="infoCheckbox">  경상북도 
						</label>
						<label>
							<input type="checkbox" name="address" value="광주광역시" class="infoCheckbox"> 광주광역시 
						</label>
						<label>
							<input type="checkbox" name="address" value="대구광역시" class="infoCheckbox"> 대구광역시 
					    </label>
				    </div>
				    <div class="checkBox2">
						<label>
					    	<input type="checkbox" name="address" value="대전광역시" class="infoCheckbox"> 대전광역시 
						</label>
						<label>
							<input type="checkbox" name="address" value="서울특별시" class="infoCheckbox"> 서울특별시 
						</label>
						<label>
							<input type="checkbox" name="address" value="세종특별자치시" class="infoCheckbox"> 세종특별자치시
						</label>
						<label>
							<input type="checkbox" name="address" value="울산광역시" class="infoCheckbox"> 울산광역시 
					    </label>
						<label>
					    	<input type="checkbox" name="address" value="부산광역시" class="infoCheckbox"> 부산광역시 
						</label>
						<label>
							<input type="checkbox" name="address" value="인천광역시" class="infoCheckbox"> 인천광역시 
					    </label>
				    </div>
				    <div class="checkBox3">
						<label>
					    	<input type="checkbox" name="address" value="전라남도" class="infoCheckbox"> 전라남도
						</label>
						<label>
							<input type="checkbox" name="address" value="전라북도" class="infoCheckbox"> 전라북도
						</label>
						<label>
							<input type="checkbox" name="address" value="제주특별자치도" class="infoCheckbox"> 제주특별자치도
						</label>
						<label>
							<input type="checkbox" name="address" value="충청남도" class="infoCheckbox"> 충청남도 
						</label>
						<label>
							<input type="checkbox" name="address" value="충청북도" class="infoCheckbox"> 충청북도 
						</label>
					</div>
				</div>
			<br>
			<br>
			<button onclick="applyFilter()" class="seeFilter">숙소 보러가기 !</button>
		</div>
	</div>
	
	<script src="${cpath }/resources/script/home.js" ></script>
	<script>
	    // modal open button
	    var filterButton = document.querySelector(".filter")
	    // 모달 가져오기
	    var modal = document.getElementById("myModal")
	    // 모달을 닫는 <span> 요소 가져오기
	    var closeBtn = document.querySelector(".close");
	    // 찜 버튼
	    const wishBtnList = document.querySelectorAll('.wish')
	    const loginIdx = '${login.idx }'
	    const cpath = '${cpath }'
	    
	    // modal open event, handler
	    filterButton.onclick = function() {
	        modal.style.display = "block";
	    }
	    // modal close event, handler
	    closeBtn.onclick = function() {
	        modal.style.display = "none";
	    }
	    // 사용자가 모달 외부 어느 곳이든 클릭하면 모달을 닫습니다
	    window.onclick = function(event) {
	        if (event.target == modal) {
	            modal.style.display = "none";
	        }
	    }
	    // 찜 버튼 event
	    wishBtnList.forEach(wishBtn => wishBtn.onclick = wishHandler)
	</script>
</body>
</html>