package com.javabang.controller;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.javabang.component.HashComponent;
import com.javabang.mail.MailComponent;
import com.javabang.model.MemberDTO;
import com.javabang.model.ReviewDTO;
import com.javabang.service.MemberService;
import com.javabang.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService memberService;
	@Autowired private MailComponent mailComponent;
	@Autowired private HashComponent hashComponent;
	@Autowired private ReviewService reviewService;

	// 회원가입
	@GetMapping("/join")
	public void join() {}

	@PostMapping("/join")
	public String join(MemberDTO dto) throws NoSuchAlgorithmException {
		memberService.add(dto);
		return "redirect:/member/login";
	}

	// 로그인
	@GetMapping("/login")
	public void login() {}

	@PostMapping("/login")
	public ModelAndView login(String url, MemberDTO dto, HttpSession session) throws NoSuchAlgorithmException {
		MemberDTO login = memberService.login(dto);
		ModelAndView mav = new ModelAndView("alert");
		
		try {
			if(url != null) {
				url = URLDecoder.decode(url, "UTF-8");
			}
			else {
				url = "/";
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		if(login != null && login.getUserPw().equals(dto.getUserPw())){
			session.setAttribute("login", login);
			mav.addObject("msg", login.getUserNick() + "님 환영합니다 ~ ");
			mav.addObject("url", url);
		}
		else {
			mav.addObject("msg", "로그인 실패 ! 아이디 또는 비밀번호가 올바르지 않습니다");
			mav.addObject("url", "/member/login");
		}
		
		return mav;
	}

	@GetMapping("/naver-login")
	public String naverLogin(String access_token, HttpSession session) {
		String token = access_token;
		String header = "Bearer " + token; // Bearer 다음에 공백 추가

		String apiURL = "https://openapi.naver.com/v1/nid/me";

		try {
			URL url = new URL(apiURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", header);

			int responseCode = conn.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}

			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

			String responseBody = response.toString();

			// JSON 파싱
			JsonParser parser = new JsonParser();
			JsonObject jsonObject = parser.parse(responseBody).getAsJsonObject();
			JsonObject properties = jsonObject.getAsJsonObject("response");

			// 사용자 정보 추출
			String naverId = properties.getAsJsonObject().get("id").getAsString();
			String email = properties.getAsJsonObject().get("email").getAsString();
			String name = properties.getAsJsonObject().get("name").getAsString();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();

			// 세션에 사용자 정보 저장
			MemberDTO member = new MemberDTO();
			member.setUserId(naverId);
			member.setEmail(email);
			member.setUserName(name);
			member.setUserNick(nickname);
			session.setAttribute("login", member);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("e.toString() = " + e.toString());
		}

		return "redirect:/member/login";
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 회원정보 수정
	@GetMapping("/update/{idx}")
	public ModelAndView update(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("member/update");

		MemberDTO dto = memberService.selectOne(idx);
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		if(login.getIdx() != idx) {
			mav.setViewName("alert");
			mav.addObject("url", "/");
			mav.addObject("msg", "잘못된 접근입니다 ~ ");
		}
		mav.addObject("dto", dto);
		
		return mav;
	}

	@PostMapping("/update/{idx}")
	public String update(MemberDTO dto, HttpSession session) {
		memberService.update(dto);
		MemberDTO tmp = memberService.selectOne(dto.getIdx());
		
		session.setAttribute("login", tmp);
		
		return "redirect:/";
	}

	// 비밀번호만 수정하기
	@GetMapping("/modifyPassword/{idx}")
	public ModelAndView modifyPassword(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("member/modifyPassword");
		
		MemberDTO dto = memberService.selectOne(idx);
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		if(login.getIdx() != idx) {
			mav.setViewName("alert");
			mav.addObject("url", "/");
			mav.addObject("msg", "잘못된 접근입니다 ~ ");
		}
		else {
			mav.addObject("dto", dto);			
		}
		
		return mav;
	}

	@PostMapping("/modifyPassword/{idx}")
	public ModelAndView modifyPassword(MemberDTO dto) throws NoSuchAlgorithmException {
		ModelAndView mav = new ModelAndView("home");
		
		memberService.modifyPassword(dto);
		
		return mav;
	}

	// 회원 탈퇴
	@GetMapping("/delete/{idx}")
	public ModelAndView delete(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("alert");
		
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		if(login.getIdx() != idx) {
			mav.addObject("msg", "잘못된 접근입니다 ~ ");
			mav.addObject("url", "/");
			
			return mav;
		}
		int row = memberService.delete(idx);
		String msg = row != 0 ? "회원탈퇴 완료!" : "회원탈퇴에 실패했습니다";
		String url = row != 0 ? "/" : "/member/update";
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		session.invalidate();
		
		return mav;
	}

	// 비밀번호 재설정
	@GetMapping("/resetPassword")
	public void resetPassword() {}

	@PostMapping("/resetPassword")
	@Transactional
	public ModelAndView resetPassword(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView("alert");

		MemberDTO tmp = memberService.userCheck(dto);
		String random = UUID.randomUUID().toString().replace("-", "").substring(0, 16);

		tmp.setUserPw(random);
		mailComponent.sendMailPw(tmp.getEmail(), tmp.getUserPw());
		random = hashComponent.getHash(random);
		tmp.setUserPw(random);
		int row = memberService.updatePw(tmp);

		String msg = row != 0 ? "재설정 메일 발송 성공!" : "재설정 메일 발송 실패. .";
		String url = row != 0 ? "/" : "/member/update";
		mav.addObject("msg", msg);
		mav.addObject("url", url);

		return mav;
	}

	// 마이페이지
	@GetMapping("/mypage/{idx}")
	public ModelAndView mypage(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("member/mypage");
		
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		if(login.getIdx() != idx) {
			mav.setViewName("alert");
			mav.addObject("msg", "잘못된 접근입니다 ~ ");
			mav.addObject("url", "/");
		}
		MemberDTO one = memberService.selectOne(idx);
		mav.addObject("one", one);
		
		return mav;
	}

	// 프로필 사진 수정
	@GetMapping("/updateProfile/{idx}")
	public ModelAndView profile(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("/member/updateProfile");
		
		MemberDTO tmp = memberService.selectOne(idx);
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		if(login.getIdx() != idx) {
			mav.setViewName("alert");
			mav.addObject("url", "/");
			mav.addObject("msg", "잘못된 접근입니다 ~ ");
		}
		else {
			mav.addObject("tmp", tmp);			
		}
		
		return mav;
	}

	@PostMapping("/updateProfile/{idx}")
	public String profile(HttpSession session, MemberDTO dto, @PathVariable("idx") int idx) throws Exception {
		dto.setIdx(idx); // idx 값을 DTO에 설정
		memberService.updateProfile(dto);
		MemberDTO tmp = memberService.selectOne(idx);
		session.setAttribute("login", tmp);

		return "redirect:/member/mypage/" + idx;
	}

	// 프로필 기본 이미지로 변경
	@GetMapping("/updateBasicProfile/{idx}")
	public ModelAndView basicProfilePage(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("/member/updateBasicProfile");
		
		MemberDTO tmp = memberService.selectOne(idx);
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		if(login.getIdx() != idx) {
			mav.setViewName("alert");
			mav.addObject("url", "/");
			mav.addObject("msg", "잘못된 접근입니다 ~ ");
		}
		else {
			mav.addObject("tmp", tmp);
		}
		
		return mav;
	}

	@PostMapping("/updateBasicProfile/{idx}")
	public String basicProfile(HttpSession session, @PathVariable("idx") int idx, MemberDTO dto) throws Exception {
		// 기본 이미지로 변경하는 로직을 수행
		dto.setProfile("https://dbjava.s3.amazonaws.com/essential/basicProfile.png"); // 기본 이미지 URL로 설정
		memberService.basicProfile(dto); // 기본 이미지로 변경
		MemberDTO tmp = memberService.selectOne(idx);
		session.setAttribute("login", tmp); // 로그인 정보를 변경된 MemberDTO로 업데이트
		
		return "redirect:/member/mypage/" + idx;

	}

	@GetMapping("/naverlogin")
	public void naver() {}

	@GetMapping("/navercallback")
	public ModelAndView naver2(String url) {
		ModelAndView mav = new ModelAndView("member/navercallback");
		
		if(url != null) {
			mav.addObject("url", url);
		}
		
		return mav;
	}

	@GetMapping("/findId")
	public void findId() {}

	@PostMapping("/findId")
	public ModelAndView findId(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("/member/resultId");
		
		MemberDTO tmp = memberService.findId(dto);
		mav.addObject("tmp", tmp);
		
		return mav;
	}

	@PostMapping("/resultId")
	public void resultId() {}

	// 유저별 작성한 리뷰보기
	@GetMapping("myReview/{idx}")
	public ModelAndView myReview(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("member/myReview");

		try {
			List<ReviewDTO> list = reviewService.selectAllMyReview(idx);
			MemberDTO login = (MemberDTO)session.getAttribute("login");
			if(login.getIdx() != idx) {
				mav.setViewName("alert");
				mav.addObject("url", "/");
				mav.addObject("msg", "잘못된 접근입니다 ~ ");
			}
			else {
				mav.addObject("list", list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return mav;
	}
	
	// 유저별 작성한 리뷰보기 (검색)
	@PostMapping("myReview/{idx}")
	public ModelAndView myReview(@PathVariable("idx") int idx, @RequestParam String search) {
		ModelAndView mav = new ModelAndView("member/myReview");

		List<ReviewDTO> list = reviewService.selectAllMyReviewSearch(idx, search);
		mav.addObject("list", list);
		
		return mav;
	}
}