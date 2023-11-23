<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style_join02_info_input.css">
		<title>회원가입 - 회원정보입력</title>
		<style>
			.txtOn{color: blue; font-weight: 700;}
			.txtOff{color: red; font-weight: 700;}
		</style>
		<script>
			$(function(){
				var idConfirm = 0;
				
				$("#insertBtn").click(function(){
					//alert($("#id").val());
					var id = $("#id").val();
					//var name = $("#name").val();
					//var pw = $("#pw1").val();
					//var f_tell = $("#f_tell").val();
					//var m_tell = $("#m_tell").val();
					//var l_tell = $("#l_tell").val();
					var idPtn = /^[a-zA-Z0-9]{4,16}$/; // /^:시작 $/:끝 []:들어갈수 있는 문자 {}:자리수
					//var idPtn = /^[a-z]{1}[a-zA-Z0-9]{3,15}$/; // 첫글자는 영문소문자, 다음부터는 영문자,숫자가능 4~16
					//var namePtn = /^[가-힣]{1,3}$/; // /^:시작 $/:끝 []:들어갈수 있는 문자 {}:자리수
					//var pwPtn = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{3,15}$/; // ?:비교 .:하나씩뽑아옴 *:모든입력값 // 모든 입력값을 하나씩 뽑아서 a-z에 들어있는지 비교
					//var f_tellPtn = /^[0-9]{2,3}$/; // /^:시작 $/:끝 []:들어갈수 있는 문자 {}:자리수
					//var m_tellPtn = /^[0-9]{3,4}$/; // /^:시작 $/:끝 []:들어갈수 있는 문자 {}:자리수
					//var l_tellPtn = /^[0-9]{4}$/; // /^:시작 $/:끝 []:들어갈수 있는 문자 {}:자리수
					if(!idPtn.test( id )){
						alert("1개의 영소문자 및 숫자가 포함되어야 합니다.");
						return false;
					} else {
						alert("정상입력되었습니다.");
					}
					
				});
				
				//pw1,pw2 비교
				$("#pw2").keyup(function(){
					if($("#pw1").val()!=$("#pw2").val()){
						$("#txtPw").text("비밀번호가 일치하지 않습니다.");
						$("#txtPw").addClass("txtOff");
						$("#txtPw").removeClass("txtOn");
					}else{
						$("#txtPw").text("비밀번호가 일치합니다.");
						$("#txtPw").addClass("txtOn");
						$("#txtPw").removeClass("txtOff");
					}
				});
				
				//우편번호검색
				$("#postBtn").click(function(){
					alert("daum 우편번호 검색창으로 이동");
					 new daum.Postcode({
				        oncomplete: function(data) {
				            $("#f_postal").val(data.zonecode);
				            $("#address1").val(data.address);
				        }
				    }).open();
				});//postBtn click
				
				
				//id체크
				$("#idChkBtn").click(function(){
					//alert($("#id").val());
					alert("아이디 중복체크합니다.");
					var id = $("#id").val();
					$.ajax({
						url:"IdCheck",   //어디로 
						type:"post",     //어떻게
						data:{"id":id},  //무엇을 보내고
						dataType:"text", //받는 데이터타입
						success:function(data){
							alert(data);
							if(data=='사용가능'){
								$("#txtIdChk").text(data);
								$("#txtIdChk").addClass("txtOn");
								$("#txtIdChk").removeClass("txtOff");
								idConfirm = 1;
							}else{
								$("#txtIdChk").text(data);
								$("#txtIdChk").addClass("txtOff");
								$("#txtIdChk").removeClass("txtOn");
								idConfirm = 0;
							}
							console.log("받은 결과값 : "+data)
						},
						error:function(){
							alert("실패");
						}
					});//ajax
				});//idChkBtn click
			});//jquery
		</script>
	</head>
	<body>
		<header>
			<div id="nav_up">
				<ul>
					<li><a href="#">회원가입</a></li>
					<li><a href="#">로그인</a></li>
					<li><a href="#">고객행복센터</a></li>
					<li><a href="#">배송지역검색</a></li>
					<li><a href="#">기프트카드 등록</a></li>
				</ul>
			</div>	
			<nav>
				<a href="#"></a>
				<ul>
					<li><a href="#">COOKIT소개</a></li>
					<li><a href="#">COOKIT메뉴</a></li>
					<li><a href="#">리뷰</a></li>
					<li><a href="#">이벤트</a></li>
					<li><a href="#">MY쿡킷</a></li>
				</ul>
				<ul>
					<li>
						<a href="#"><span>장바구니</span></a>
					</li>
					<li>
						<a href="#"><span>메뉴찾기</span></a>
					</li>
				</ul>
			</nav>
		</header>
		
		
		
		
		
		<section>
			<form name="agree" method="get" action="join03_success.html">
				<div id="subBanner"></div>
				<div id="locationN">
					<ul>
						<li>HOME</li>
						<li>회원가입</li>
						<li>회원정보입력</li>
					</ul>
				</div>
				
				<div id="sub_top_area">
					<h3>회원가입</h3>
				</div>
				
				<div id="join_step_div">
					<ul>
						<li>
							<span>STEP.1</span>
							<p>약관동의</p>
						</li>
						<li>
							<span>STEP.2</span>
							<p>회원정보</p>
						</li>
						<li>
							<span>STEP.3</span>
							<p>회원가입완료</p>
						</li>
					</ul>
				</div>
				
				<h4>
					필수 정보 입력 
					<span>(* 항목은 필수 항목입니다.)</span>
				</h4>
				<fieldset class="fieldset_class">
					<dl id="join_name_dl">
						<dt>
							<div></div>
							<label for="name">이름</label>
						</dt>
						<dd>
							<input type="text" id="name" name="name" required/>
						</dd>
					</dl>
					<dl id="join_id_dl">
						<dt>
							<div></div>
							<label for="id">아이디</label>
						</dt>
						<dd>
							<input type="text" id="id" name="id" minlength="4" maxlength="16" required/>
							<input type="button" id="idChkBtn" value="중복확인"/> 
							<span id="txtIdChk"></span>
							<span>4~16자리의 영문, 숫자, 특수기호(_)만 사용하실 수 있습니다. 첫 글자는 영문으로 입력해 주세요.</span>
						</dd>
					</dl>
					<dl id="join_pw1_dl">
						<dt>
							<div></div>
							<label for="pw1">비밀번호</label>
						</dt>
						<dd>
							<input type="password" id="pw1" name="pw1" minlength="8" required />
							<span>영문, 숫자, 특수문자 중 2종류 조합 시 10자리 이상 입력</span>
							<span>영문, 숫자, 특수문자 모두 조합 시 8자리 이상 입력</span>
						</dd>
					</dl>
					<dl id="join_pw2_dl">
						<dt>
							<div></div>
							<label for="pw2">비밀번호 확인</label>
						</dt>
						<dd>
							<input type="password" id="pw2" name="pw2" minlength="8" required />
							<span id="txtPw">비밀번호를 다시 한번 입력해 주세요.</span>
						</dd>
					</dl>
					<dl id="join_mail_dl">
						<dt>
							<div></div>
							<label for="mail_id">이메일</label>
						</dt>
						<dd>
							<input type="text" id="mail_id" name="mail_id" required />
							<span>@</span>
							<input type="text" id="main_tail" name="mail_tail" required />
							<select>
								<option selected>직접입력</option>
								<option>지메일</option>
								<option>네이버</option>
								<option>네이트</option>
								<option>핫메일</option>
								<option>파란</option>
								<option>엠팔</option>
								<option>야후</option>
								<option>드림위즈</option>
								<option>한메일(다음)</option>
							</select>
						</dd>
					</dl>
					
					<dl id="join_address_dl">
						<dt> 
							<div></div>
							<label for="">주소</label>
						</dt>
						<dd>
							<input type="text" id="f_postal" name="f_postal" required readonly />
							<input type="button" id="postBtn" value="우편번호"/>
							<input type="text" id="address1" name="address1" required readonly />
							<input type="text" id="address2" name="address2" required />
						</dd>
						
					</dl>
					
					<dl id="join_tell_dl">
						<dt>
							<div></div>
							<label for="f_tell">휴대전화</label>
						</dt>
						<dd>
							<input type="text" id="f_tell" name="f_tell" maxlength="3" required />
							<span> - </span>
							<input type="text" id="m_tell" name="m_tell" maxlength="4" required />
							<span> - </span>
							<input type="text" id="l_tell" name="l_tell" maxlength="4" required />
						</dd>
					</dl>
					<dl id="join_birth_dl">
						<dt>
							<div></div>
							<label for="birth_year">생년월일</label>
						</dt>
						<dd>
							<select id="birth_year" name="birth_year" required>
								<option selected>선택</option>
								<option value="1988">1988</option>
								<option value="1989">1989</option>
								<option value="1990">1990</option>
								<option value="1991">1991</option>
								<option value="1992">1992</option>
								<option value="1993">1993</option>
								<option value="1994">1994</option>
								<option value="1995">1995</option>
								<option value="1996">1996</option>
								<option value="1997">1997</option>
								<option value="1998">1998</option>
								<option value="1988">1999</option>
								<option value="1920">2000</option>
							</select>
							<span>년</span>
							<select id="birth_month" name="birth_month" required>
								<option selected>선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
							<span>월</span>
							<select id="birth_day" name="birth_day" required>
								<option selected>선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select>
							<span>일</span>
							<div>
								<input type="radio" name="calendar" id="lunar" value="lunar" checked="checked"/>
								<label for="lunar">양력</label>
								<input type="radio" name="calendar" id="solar" value="solar" />
								<label for="solar">음력</label>
							</div>
						</dd>
					</dl>
					<dl id="join_gender_dl">
						<dt>
							<div></div>
							<label for="">성별</label>
						</dt>
						<dd>
							<div>
								<input type="radio" name="gender" id="male" value="male" checked="checked"/>
								<label for="male">남성</label>
								<input type="radio" name="gender" id="female" value="female" />
								<label for="female">여성</label>
							</div>
						</dd>
					</dl>
					
					
				</fieldset>

								
				<h4>
					분양 회원 정보 입력 
					<span>(다구좌 회원일 경우 가지고 계신 카드번호 중 하나를 입력해 주시면 됩니다)</span>
				</h4>
				<fieldset class="fieldset_class">
					<dl id="join_member_number_dl">
						<dt>
							<label for="m_number">회원번호</label>
						</dt>
						<dd>
							<input type="text" name="m_number" id="m_number" />
							<span>하이픈(-)이나 띄어쓰기 없이 입력해 주시기 바랍니다.</span>
						</dd>
					</dl>
					<dl id="join_verification_number_dl">
						<dt>
							<label for="v_number">회원인증번호</label>
						</dt>
						<dd>
							<input type="text" name="v_number" id="v_number" />
							<span>숫자 4자리 입력</span>
						</dd>
					</dl>
				</fieldset>
				
				<h4>
					선택 입력 정보 
				</h4>
				<fieldset class="fieldset_class">
					<dl id="join_job_dl">
						<dt>
							<label for="job">직업</label>
						</dt>
						<dd>
							<select id="job" name="job">
								<option selected>선택</option>
								<option value="worker">회사원</option>
								<option value="slef">자영업자</option>
								<option value="freelancer">프리랜서</option>
								<option value="housewife">전업주부</option>
								<option value="student">학생</option>
								<option value="etc">기타</option>						
							</select>
						</dd>
					</dl>
					<dl id="join_marital_status_dl">
						<dt>
							<label for="">결혼여부</label>
						</dt>
						<dd>
							<input type="radio" name="marital_status" id="marital_status_y" value="yes" />
							<label for="marital_status_y">예</label>
							<input type="radio" name="marital_status" id="marital_status_n" value="no" />
							<label for="marital_status_n">아니오</label>
						</dd>
					</dl>
					<dl id="join_interests_dl">
						<dt>
							<label for="">관심사</label>
						</dt>
						<dd>
							<ul>
								<li>
									<input type="checkbox" name="computer" id="computer" value="computer" />
									<label for="computer">컴퓨터/인터넷</label>
								</li>
								<li>
									<input type="checkbox" name="movie" id="movie" value="movie" />
									<label for="movie">영화/비디오</label>
								</li>
								<li>
									<input type="checkbox" name="music" id="music" value="music" />
									<label for="music">음악</label>
								</li>
								<li>
									<input type="checkbox" name="shopping" id="shopping" value="shopping" />
									<label for="shopping">쇼핑</label>
								</li>
								<li>
									<input type="checkbox" name="game" id="game" value="game" />
									<label for="game">게임</label>
								</li>
								<li>
									<input type="checkbox" name="culture" id="culture" value="culture" />
									<label for="culture">문화/예술</label>
								</li>
								<li>
									<input type="checkbox" name="parenting" id="parenting" value="parenting" />
									<label for="parenting">육아/아동</label>
								</li>
								<li>
									<input type="checkbox" name="cooking" id="cooking" value="cooking" />
									<label for="parenting">요리</label>
								</li>
								<li>
									<input type="checkbox" name="interier" id="interier" value="interier" />
									<label for="interier">인테리어</label>
								</li>
								<li>
									<input type="checkbox" name="leisure" id="leisure" value="leisure" />
									<label for="leisure">레저/여가</label>
								</li>
								<li>
									<input type="checkbox" name="health" id="health" value="health" />
									<label for="health">건강/다이어트</label>
								</li>
								<li>
									<input type="checkbox" name="fashion" id="fashion" value="fashion" />
									<label for="fashion">패션/미용</label>
								</li>
							</ul>
						</dd>
					</dl>
				</fieldset>
				<div id="info_input_button">
					<input type="reset" value="취소하기" />
					<input type="button" id="insertBtn" value="가입하기" />
				</div>
				
			</form>
		</section>
		
		
		
		
		
		
		
		<footer>
			<div id="footer_wrap">
				<div id="footer_cont">
					<div id="fl_l">
						<a href="#"></a>
						<p>© COOKIT ALL RIGHTS RESERVED</p>
					</div>
					<div id="fl_c">
						<ul>
							<li><a href="#">이용약관</a></li>
							<li><a href="#">개인정보처리 방침</a></li>
							<li><a href="#">법적고지</a></li>
							<li><a href="#">사업자정보 확인</a></li>
						</ul>
						<div id="fl_c_info">
							<p>씨제이제일제당(주)</p>
							<p>대표이사 : 손경식,강신호,신현재</p>
							<p>사업자등록번호 : 104-86-09535</p>
							<p>주소 : 서울 중구 동호로 330 CJ제일제당 센터 (우) 04560</p>
							<p>통신판매업신고 중구 제 07767호</p>
							<p>개인정보보호책임자 : 조영민</p>
							<p>이메일 : cjon@cj.net</p>
							<p>호스팅제공자 : CJ올리브네트웍스㈜</p>
							<p>고객님은 안전거래를 위해 현금등으로 결제시 LG U+ 전자 결제의 매매보호(에스크로) 서비스를 이용하실 수 있습니다. <a href="#">가입 사실 확인</a></p>
						</div>
					</div>
					<div id="fl_r">
						<span>cj그룹계열사 바로가기 ▼</span>
						<dl>
							<dt>고객행복센터</dt>
								<dd>1688-1920</dd>
						</dl>
						<a href="#">1:1문의</a>						
					</div>
				</div>
			</div>
		
		
		
		</footer>
	</body>
</html>