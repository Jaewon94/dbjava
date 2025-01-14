<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
   <!-- host 프론트 -->
   <div class="container">
      <div id="start">
         <div id="host">
            <div class="hostLeft">
               <h1>
                 	 당신의<br> 멋진 숙소를<br> 등록해주세요 😉
               </h1>
            </div>
            <div class="hostRight">
               <div class="hostInfo">
                  <div class="infoWrite"> 
                     <h2>1. 숙소 정보를 알려주세요</h2>
                     <span> 숙소 위치와 숙박가능 인원 등<br> 기본정보를 열려주세요
                     </span>
                  </div>
                  <div class="infoImg">
                     <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/infoImgOne.png">
                  </div>
               </div>
               <div class="hostInfo">
                  <div class="infoWrite">
                     <h2>2. 숙소 사진을 등록해주세요</h2>
                     <span> 사진을 제출하고<br> 제목과 설명을 추가해주세요
                     </span>
                  </div>
                  <div class="infoImg">
                     <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/infoImgTwo.png">
                  </div>
               </div>
               <div class="hostInfo">
                  <div class="infoWrite">
                     <h2>3. 등록을 완료하세요</h2>
                     <span> 숙소 요금을 설정한 후<br> 등록을 완료하세요
                     </span>
                  </div>
                  <div class="infoImg">
                     <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/infoImgThree.png">
                  </div>
               </div>
            </div>
         </div>
      </div>
   
      <!-- category 프론트 -->
      <div id="selectCategory" class="hidden">
         <h1>숙소의 종류를 선택해주세요</h1>
         <div class="categoryItems">
            <button class="categoryItem">
               <div>
                  <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%91%E1%85%A6%E1%86%AB%E1%84%89%E1%85%A7%E1%86%AB.png">
               </div>
               <div>펜션</div>
            </button>
            <button class="categoryItem">
               <div>
                  <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%91%E1%85%AE%E1%86%AF%E1%84%87%E1%85%B5%E1%86%AF%E1%84%85%E1%85%A1.png">
               </div>
               <div>풀빌라</div>
            </button>
            <button class="categoryItem">
               <div>
                  <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%92%E1%85%A9%E1%84%90%E1%85%A6%E1%86%AF.png">
               </div>
               <div>호텔</div>
            </button>
            <button class="categoryItem">
               <div>
                  <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%85%E1%85%B5%E1%84%8C%E1%85%A9%E1%84%90%E1%85%B3.png">
               </div>
               <div>리조트</div>
            </button>
            <button class="categoryItem">
               <div>
                  <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%80%E1%85%B3%E1%86%AF%E1%84%85%E1%85%A2%E1%86%B7%E1%84%91%E1%85%B5%E1%86%BC.png">
               </div>
               <div>글램핑</div>
            </button>
            <button class="categoryItem">
               <div>
                  <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8F%E1%85%A2%E1%86%B7%E1%84%91%E1%85%B5%E1%86%BC.png">
               </div>
               <div>캠핑</div>
            </button>
            <button class="categoryItem">
               <div>
                  <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%80%E1%85%A6%E1%84%89%E1%85%B3%E1%84%90%E1%85%B3%E1%84%92%E1%85%A1%E1%84%8B%E1%85%AE%E1%84%89%E1%85%B3.png">
               </div>
               <div>게스트하우스</div>
            </button>
            <button class="categoryItem">
               <div>
                  <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%92%E1%85%A1%E1%86%AB%E1%84%8B%E1%85%A9%E1%86%A8.png">
               </div>
               <div>한옥</div>
            </button>
            <button class="categoryItem">
               <div>
                  <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%85%E1%85%AD%E1%84%8F%E1%85%A1%E1%86%AB.png">
               </div>
               <div>료칸</div>
            </button>
         </div>
      </div>
   
      <!-- roomType 프론트 -->
      <div id="selectRoomType" class="hidden">
         <div class="roomTypeWrap">
            <h1>게스트가 사용할 숙소 유형</h1>
            <button class="roomTypeItem">
               <div class="roomTypeInfo">
                  <h3>독채</h3>
                  <span>게스트가 숙소 전체를 사용합니다</span>
               </div>
               <div>
                  <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%83%E1%85%A9%E1%86%A8%E1%84%8E%E1%85%A2.png">
               </div>
            </button>
            <button class="roomTypeItem">
               <div class="roomTypeInfo">
                  <h3>원룸</h3>
                  <span>게스트가 묵을 숙소가 방이 하나인 타입입니다</span>
               </div>
               <div>
                  <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8B%E1%85%AF%E1%86%AB%E1%84%85%E1%85%AE%E1%86%B7.png">
               </div>
            </button>
            <button class="roomTypeItem">
               <div class="roomTypeInfo">
                  <h3>멀티룸</h3>
                  <span>게스트가 묵을 숙소가 방이 여러개인 타입입니다</span>
               </div>
               <div>
                  <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%86%E1%85%A5%E1%86%AF%E1%84%90%E1%85%B5%E1%84%85%E1%85%AE%E1%86%B7.png">
               </div>
            </button>
         </div>
      </div>
   
      <!-- rentCount 프론트 -->
      <div id="rentCount" class="hidden">
         <div class="rentCountWrap">
            <h1>숙소 기본 정보를 알려주세요</h1>
            <span>방, 침대 등의 갯수들을 정해주세요 ~ </span>
            <div class="roomCount">
               <div class="rentCountItem">
                  <div class="roomCountName">
                     <div>방</div>
                  </div>
                  <div class="roomCountNumber">
                     <button class="minus">
                        <span>➖</span>
                     </button>
                     <span class="roomCountValue">0</span>
                     <button class="plus">
                        <span>➕</span>
                     </button>
                  </div>
               </div>
            </div>
            <div class="bathCount">
               <div class="rentCountItem">
                  <div class="roomCountName">
                     <div>욕실</div>
                  </div>
                  <div class="roomCountNumber">
                     <button class="minus">
                        <span>➖</span>
                     </button>
                     <span class="bathCountValue">0</span>
                     <button class="plus">
                        <span>➕</span>
                     </button>
                  </div>
               </div>
            </div>
            <div class="guestCount rentCountItem">
               <div class="roomCountName">
                  <div>게스트</div>
               </div>
               <div class="roomCountNumber">
                  <button class="minus">
                     <span>➖</span>
                  </button>
                  <span class="guestCountValue">0</span>
                  <button class="plus">
                     <span>➕</span>
                  </button>
               </div>
            </div>
            <div class="bedCount rentCountItem">
               <div class="roomCountName">
                  <div>침대</div>
               </div>
               <div class="roomCountNumber">
                  <button class="minus">
                     <span>➖</span>
                  </button>
                  <span class="bedCountValue">0</span>
                  <button class="plus">
                     <span>➕</span>
                  </button>
               </div>
            </div>
         </div>
      </div>
   
      <!-- information -->
      <div id="rentInformation" class="hidden">
         <div class="rentInformationScroll">
            <div class="rentInformationWrap">
               <h1>숙소 편의시설 정보를 추가하세요</h1>
   
               <div class="rentInformationItems">
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%86%E1%85%AE%E1%84%89%E1%85%A5%E1%86%AB+%E1%84%8B%E1%85%B5%E1%86%AB%E1%84%90%E1%85%A5%E1%84%82%E1%85%A6%E1%86%BA.png">
                     </div>
                     <div>무선 인터넷</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/TV.png">
                     </div>
                     <div>TV</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8F%E1%85%A5%E1%86%B7%E1%84%91%E1%85%B2%E1%84%90%E1%85%A5.png">
                     </div>
                     <div>컴퓨터</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8C%E1%85%AE%E1%84%87%E1%85%A1%E1%86%BC.png">
                     </div>
                     <div>주방</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%89%E1%85%A6%E1%84%90%E1%85%A1%E1%86%A8%E1%84%80%E1%85%B5.png">
                     </div>
                     <div>세탁기</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8B%E1%85%A6%E1%84%8B%E1%85%A5%E1%84%8F%E1%85%A5%E1%86%AB.png">
                     </div>
                     <div>에어컨</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8C%E1%85%AE%E1%84%87%E1%85%A7%E1%86%AB+%E1%84%86%E1%85%AE%E1%84%85%E1%85%AD+%E1%84%8C%E1%85%AE%E1%84%8E%E1%85%A1.png">
                     </div>
                     <div>주변 무료 주차</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8C%E1%85%AE%E1%84%87%E1%85%A7%E1%86%AB+%E1%84%8B%E1%85%B2%E1%84%85%E1%85%AD+%E1%84%8C%E1%85%AE%E1%84%8E%E1%85%A1.png">
                     </div>
                     <div>주변 유료 주차</div>
                  </button>
               </div>
   
               <h2>자랑하고 싶은 편의시설이 있나요?</h2>
   
               <div class="rentInformationItems">
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%89%E1%85%AE%E1%84%8B%E1%85%A7%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC.png">
                     </div>
                     <div>수영장</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8B%E1%85%AD%E1%86%A8%E1%84%8C%E1%85%A9.png">
                     </div>
                     <div>욕조</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%87%E1%85%A1%E1%84%87%E1%85%A6%E1%84%8F%E1%85%B2+%E1%84%80%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AF.png">
                     </div>
                     <div>바베큐 그릴</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%91%E1%85%B5%E1%84%8B%E1%85%A1%E1%84%82%E1%85%A9.png">
                     </div>
                     <div>피아노</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8F%E1%85%B5%E1%84%8C%E1%85%B3.png">
                     </div>
                     <div>키즈</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%87%E1%85%B5%E1%86%B7%E1%84%91%E1%85%B3%E1%84%85%E1%85%A9%E1%84%8C%E1%85%A6%E1%86%A8%E1%84%90%E1%85%B3.png">
                     </div>
                     <div>빔프로젝트</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%86%E1%85%AE%E1%84%85%E1%85%AD%E1%84%8B%E1%85%A7%E1%86%BC%E1%84%92%E1%85%AA(OTT).png">
                     </div>
                     <div>무료영화(OTT)</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%8B%E1%85%AE%E1%86%AB%E1%84%83%E1%85%A9%E1%86%BC%E1%84%80%E1%85%B5%E1%84%80%E1%85%AE.png">
                     </div>
                     <div>운동기구</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%80%E1%85%A8%E1%84%80%E1%85%A9%E1%86%A8%E1%84%80%E1%85%AA+%E1%84%8B%E1%85%B5%E1%86%AB%E1%84%8C%E1%85%A5%E1%86%B8.png">
                     </div>
                     <div>계곡과 인접</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%92%E1%85%A2%E1%84%87%E1%85%A7%E1%86%AB%E1%84%80%E1%85%AA+%E1%84%8B%E1%85%B5%E1%86%AB%E1%84%8C%E1%85%A5%E1%86%B8.png">
                     </div>
                     <div>해변과 인접</div>
                  </button>
               </div>
   
               <h3>안전관련 물품이 있나요?</h3>
   
               <div class="rentInformationItems">
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%92%E1%85%AA%E1%84%8C%E1%85%A2%E1%84%80%E1%85%A7%E1%86%BC%E1%84%87%E1%85%A9%E1%84%80%E1%85%B5.png">
                     </div>
                     <div>화재경보기</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%80%E1%85%AE%E1%84%80%E1%85%B3%E1%86%B8%E1%84%89%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1.png">
                     </div>
                     <div>구급상자</div>
                  </button>
                  <button class="rentInformationItem">
                     <div>
                        <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/%E1%84%89%E1%85%A9%E1%84%92%E1%85%AA%E1%84%80%E1%85%B5.png">
                     </div>
                     <div>소화기</div>
                  </button>
               </div>
            </div>
         </div>
      </div>
   
      <!-- rentImg -->
      <div id="rentImg" class="hidden">
         <div class="rentImgAdd">
            <div class="rentImgScroll">
               <h1>사진을 넣어주세요</h1>
               <div class="rentImgWrap">
                  <div class="mainImgSpace">
                     <div class="mainInputSpace">
                        <input type="file" id="mainImg" class="fileImg" onchange="rentImgInputHandler(event)">
                        <div class="inputInfo">
                           <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/picture.png">
                           <h3>
                              	여기다 사진을 끌어다 놓으세요<br>
                           </h3>
                           <span>
				                              또는 공간을 클릭하여<br>
				                              업로드할 사진을 선택해주세요
                              <br><br>
                           </span>
                        </div>
                     </div>
                     <div class="mainImg hidden">
                        <button class="mainImgDelete" onclick="imgDeleteHandler(event)">삭제</button>
                          <img class="preview-img addMainImg">
                     </div>
                  </div>
                  <div class="subImg">
                     <div class="subImgWrap">
                        <div class="subImgSpace">
                           <div class="subInputSpace">
                              <input type="file" class="fileImg" onchange="rentImgInputHandler(event)">
                              <div class="subInfo">
                                 <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/picture.png">
                              </div>
                           </div>
                           <div class="subImg hidden">
                              <button class="subImgDelete" onclick="imgDeleteHandler(event)">삭제</button>
                                <img class="preview-img addMainImg">
                           </div>
                        </div>
                        <div class="subImgSpace">
                           <div class="subInputSpace">
                              <input type="file" class="fileImg" onchange="rentImgInputHandler(event)">
                              <div class="subInfo">
                                 <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/picture.png">
                              </div>
                           </div>
                           <div class="subImg hidden">
                              <button class="subImgDelete" onclick="imgDeleteHandler(event)">삭제</button>
                                <img class="preview-img addMainImg">
                           </div>
                        </div>
                        <div class="subImgSpace">
                           <div class="subInputSpace">
                              <input type="file" class="fileImg" onchange="rentImgInputHandler(event)">
                              <div class="subInfo">
                                 <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/picture.png">
                              </div>
                           </div>
                           <div class="subImg hidden">
                              <button class="subImgDelete" onclick="imgDeleteHandler(event)">삭제</button>
                                <img class="preview-img addMainImg">
                           </div>
                        </div>
                        <div class="subImgSpace">
                           <div class="subInputSpace">
                              <input type="file" class="fileImg" onchange="rentImgInputHandler(event)">
                              <div class="subInfo">
                                 <img src="https://dbjava.s3.ap-northeast-2.amazonaws.com/essential/picture.png">
                              </div>
                           </div>
                           <div class="subImg hidden">
                              <button class="subImgDelete" onclick="imgDeleteHandler(event)">삭제</button>
                                <img class="preview-img addMainImg">
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
      <!-- rentContent -->
      <div id="rentContent" class="hidden">
         <div class="rentContentSpace">
            <h1>숙소의 정보들을 입력해주세요 ~ </h1>
            <p><input type="text" name="title" placeholder="숙소 이름"></p>
            <p><input type="number" name="price" min="0" step="10" placeholder="숙소 가격(1박 기준)"></p>
            <p><input type="text" name="contactNum" placeholder="숙소 대표 전화번호">
            <p><textarea name="content" placeholder="숙소 소개"></textarea></p>
         </div>
      </div>
      
      <!-- rentLoacation -->
      <div id="rentLocation" class="hidden">
         <div class="rentLocationScroll">
            <div class="rentLocationWrap">
               <div class="rentLocationLeft">
                  <h1>숙소의 위치를 알려주세요</h1>
                  <h4>
			                     정확한 도로명 주소를 모를 경우 지도에 위치를 클릭해보세요 ~<br>
			                     지도에서 알아서 도로명 주소를 알려줄거에요😉
                  </h4>
                  <div id="map"></div>
                  <div id="clickLatlng"></div>
                  <div class="locationSpace">
                     <div><h4>대략적인 주소를 아신다면 지번 주소로 검색해보세요 ~</h4></div>
                     <div class="searchLocationSpace">
                        <input type="text" class="inputLocation">
                        <button class="searchLocation">검색</button>
                     </div>
                  </div>
               </div>
               
               <div class="rentLocationRight">
                  <h2>숙소의 도로명 주소를 넣어주세요 ~</h2>
                  <div class="locationValue">
                     <select name="sido">
                        <option value="">시·도 선택</option>
                        <option value="강원특별자치도">강원특별자치도</option>
                        <option value="경기도">경기도</option>
                        <option value="경상남도">경상남도</option>
                        <option value="경상북도">경상북도</option>
                        <option value="광주광역시">광주광역시</option>
                        <option value="서울특별시">대구광역시</option>
                        <option value="서울특별시">대전광역시</option>
                        <option value="부산광역시">부산광역시</option>
                        <option value="서울특별시">서울특별시</option>
                        <option value="세종특별자치시">세종특별자치시</option>
                        <option value="울산광역시">울산광역시</option>
                        <option value="인천광역시">인천광역시</option>
                        <option value="전라남도">전라남도</option>
                        <option value="전라북도">전라북도</option>
                        <option value="제주특별자치도">제주특별자치도</option>
                        <option value="충청남도">충청남도</option>
                        <option value="충청북도">충청북도</option>
                     </select>
                     <input type="text" name="sigugun" placeholder="시·구·군">
                     <input type="text" name="gueup" placeholder="구·읍(해당하는 경우만)">
                     <input type="text" name="road" placeholder="도로명 주소">
                     <input type="text" name="detailAddress" placeholder="상세주소">
                  </div>
               </div>
            </div>
         </div>
      </div>
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98207e150ca73eba7ab071704182317f&libraries=services"></script>
   </div>
<%@ include file="hostFooter.jsp" %>   
	
	<script src="${cpath }/resources/script/rent/hosting.js"></script>
	<script>
		window.addEventListener("beforeunload", beforeUnloadHandler)
		   
		const cpath = '${cpath }'
		const idx = +'${login.idx }'
   
		// host 변수
		const start = document.getElementById('start')
		const hostBtn = document.getElementById('hostBtn')
		const nextHost = document.getElementById('nextHost')
		// category 변수
		const category = document.getElementById('selectCategory')
		const categoryItemList = document.querySelectorAll('.categoryItem')
		const categoryBtn = document.getElementById('categoryBtn')
		const preCategory = document.getElementById('preCategory')
		const nextCategory = document.getElementById('nextCategory')
		// roomType 변수
		const roomType = document.getElementById('selectRoomType')
		const roomTypeBtn = document.getElementById('roomTypeBtn')
		const roomTypeItemList = document.querySelectorAll('.roomTypeItem')
		const preRoomType = document.getElementById('preRoomType')
		const nextRoomType = document.getElementById('nextRoomType')
		// rentCount 변수
		const rentCount = document.getElementById('rentCount')
		const rentCountBtn = document.getElementById('rentCountBtn')
		const minusList = document.querySelectorAll('.minus')
		const plusList = document.querySelectorAll('.plus')
		const preRentCount = document.getElementById('preRentCount')
		const nextRentCount = document.getElementById('nextRentCount')
		// rentInformation 변수
		const rentInformation = document.getElementById('rentInformation')
		const rentInformationBtn = document.getElementById('rentInformationBtn')
		const rentInformationItemList = document.querySelectorAll('.rentInformationItem')
		const preRentInformation = document.getElementById('preRentInformation')
		const nextRentInformation = document.getElementById('nextRentInformation')
		// rentImg 변수
		const rentImg = document.getElementById('rentImg')
		const rentImgBtn = document.getElementById('rentImgBtn')
		let fileImgList = document.querySelectorAll('.fileImg')
		const preRentImg = document.getElementById('preRentImg')
		const nextRentImg = document.getElementById('nextRentImg')
		let subImgWrap = document.querySelector('.subImgWrap')
		// rentContent 변수
		const rentContent = document.getElementById('rentContent')
		const rentContentBtn = document.getElementById('rentContentBtn')
		const preRentContent = document.getElementById('preRentContent')
		const nextRentContent = document.getElementById('nextRentContent')
		// rentLocation 변수
		const rentLocation = document.getElementById('rentLocation')
		const preRentLocation = document.getElementById('preRentLocation')
		const finish = document.querySelector('.finish')
		const rentLocationBtn = document.getElementById('rentLocationBtn')
		const searchLocation = document.querySelector('.searchLocation')
		// ajax 옵션
		let opt = {                  
		      method: 'POST'
		}
		let formData = new FormData()
      
		// host event
		nextHost.onclick = hostHandler
		// category event
		preCategory.onclick = preCategoryHandler
		categoryItemList.forEach(categoryItem => categoryItem.onclick = categoryItemHandler)
		nextCategory.onclick = categoryHandler
		// roomType event
		preRoomType.onclick = preRoomTypeHandler
		roomTypeItemList.forEach(roomTypeItem => roomTypeItem.onclick = roomTypeItemHandler)
		nextRoomType.onclick = roomTypeHandler
		// rentCount event
		preRentCount.onclick = preRentCountHandler
		minusList.forEach(minus => minus.onclick = minusHandler)
		plusList.forEach(plus => plus.onclick = plusHandler)
		nextRentCount.onclick = rentCountHandler
		// rentInformation event
		preRentInformation.onclick = preRentInformationHandler
		rentInformationItemList.forEach(rentInformationItem => rentInformationItem.onclick = rentInformationItemHandler)
		nextRentInformation.onclick = rentInformationHandler
		// rentImg event
		preRentImg.onclick = preRentImgHandler
		nextRentImg.onclick = rentImgHandler
		// rentContent event
		preRentContent.onclick = preRentContentHandler
		nextRentContent.onclick = rentContentHandler
		// rentLocation event
		preRentLocation.onclick = preRentLocationHandler
		finish.onclick = finishHandler
      
		// kakao 지도 API 변수
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
      
		// 지도를 클릭한 위치에 표출할 마커
		var marker = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성
		    position: map.getCenter() 
		}); 
		// 지도에 마커를 표시
		marker.setMap(map);
		
		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		   const geocoder = new kakao.maps.services.Geocoder()
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		   
		   console.log('latlng', latlng)
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    
			geocoder.coord2Address(latlng.getLng(), latlng.getLat(), (result, status) => {
				var resultDiv = document.getElementById('clickLatlng');
				const select = document.querySelector('select[name="sido"]')
				const sigugun = document.querySelector('input[name="sigugun"]')
				const gueup = document.querySelector('input[name="gueup"]')
				const road = document.querySelector('input[name="road"]')
				
				select.options[0].selected = true
				sigugun.value = ""
				gueup.value = ""
				road.value = ""
				 
				if(status === kakao.maps.services.Status.OK) {
					const roadAddress = result[0].road_address.address_name
					var message = roadAddress
				}
				resultDiv.innerText = message
				
				const addressParts = message.split(' ')
				
				for(let i = 0; i < addressParts.length; i++) {
					if(i == 0) {
						const option = document.querySelector('option[value="' + addressParts[i] + '"]')
						option.selected = true
					}
					else if(i == 1) {
						sigugun.value = addressParts[i]
					}
					else if('구/읍'.includes(addressParts[i].charAt(addressParts[i].length - 1))) {
						gueup.value = addressParts[i]
					}
					else {
						road.value += addressParts[i] + " "
					}
				}
			})
		});
      
      // 지도 검색 event
      searchLocation.onclick = searchLocationHandler
   </script>
</body>