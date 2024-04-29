package com.javabang.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.Scanner;
import java.util.UUID;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.javabang.s3.S3ClientFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.javabang.component.HashComponent;
import com.javabang.mail.MailComponent;
import com.javabang.model.MemberDTO;
import com.javabang.repository.MemberDAO;
import com.jcraft.jsch.ChannelSftp;

import org.springframework.core.io.Resource;

@Service
public class MemberService {
	@Autowired private MemberDAO memberDAO;
	@Autowired private HashComponent hashComponent;
	@Autowired private MailComponent mailComponent;


	@Value("classpath:resetPassword.html")
	private Resource html;
	
	Random ran = new Random();

	// 회원가입
	public int add(MemberDTO dto) throws NoSuchAlgorithmException  {
		String hash = hashComponent.getHash(dto.getUserPw());
		dto.setUserPw(hash);
		int row = 0;
		
		String dateString = dto.getYear() + "-" + dto.getMonth() + "-" + dto.getDay();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if(dto.getPhoneNum().contains("-") == false) {
			String phoneNum = dto.getPhoneNum();
			String hyphen = "";
			
			for(int i = 0; i < phoneNum.length(); i++) {
				if(i == 2 || i == 6) {
					hyphen += phoneNum.charAt(i) + "-";
				}
				else {
					hyphen += phoneNum.charAt(i);
				}
			}
			dto.setPhoneNum(hyphen);
		}
		
		try {
			Date utilDate = sdf.parse(dateString);
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			
			dto.setBirth(sqlDate);
			row = memberDAO.add(dto);
		} catch (ParseException e) {
			System.err.println("dateFormat 예외 : "  + e);
		}
		return row;
	}

	// 로그인
	public MemberDTO login(MemberDTO dto) throws NoSuchAlgorithmException  {
		String hash = hashComponent.getHash(dto.getUserPw());
		dto.setUserPw(hash);
		MemberDTO login = memberDAO.login(dto);
		
		return login;
	}

	// 비밀번호 재설정
	@Transactional
	public int reset(MemberDTO dto) throws FileNotFoundException, IOException{
		String userPw = (ran.nextInt(999999)+100000) + "";
		int row = memberDAO.reset(dto);
		while(row != 0)
		{
			String content = "";
			Scanner sc = new Scanner(html.getFile());
			while(sc.hasNextLine())
			{
				content += sc.nextLine();
			}
			sc.close();
			
			content = String.format(content, userPw);
			mailComponent.sendMailPw(dto.getEmail(), content);
		}
		return row;
	}

	// 회원정보 수정 목록 하나만 불러오기
	public MemberDTO selectOne(int idx) {
		
		return memberDAO.selectOne(idx);
	}

	// 회원정보수정
	public int update(MemberDTO dto)  {
		if(dto.getPhoneNum().contains("-") == false) {
			String phoneNum = dto.getPhoneNum();
			String hyphen = "";
			
			for(int i = 0; i < phoneNum.length(); i++) {
				if(i == 2 || i == 6) {
					hyphen += phoneNum.charAt(i) + "-";
				}
				else {
					hyphen += phoneNum.charAt(i);
				}
			}
			dto.setPhoneNum(hyphen);
		}
		return memberDAO.update(dto);
	}

	// 회원탈퇴(삭제)
	public int delete(int idx) {
		return memberDAO.delete(idx);
	}

	// 비밀번호 재설정 이메일 받기
	public String getEmail(MemberDTO dto) {
		return memberDAO.getMail(dto);
	}

	public MemberDTO userCheck(MemberDTO dto) {
		return memberDAO.userCheck(dto);
	}

	public int updatePw(MemberDTO tmp) {
		return memberDAO.updatePw(tmp);
	}

	public int modifyPassword(MemberDTO dto) throws NoSuchAlgorithmException {
		String userPw = dto.getUserPw();
		userPw = hashComponent.getHash(userPw);
		dto.setUserPw(userPw);
		
		return memberDAO.updatePw(dto);
	}

	public int dupCheck(String userId) {
		return memberDAO.selectCount(userId);
	}

	public int sendAuthNumber(String email) throws IOException {
		String content = "<h3>인증번호는 [%s]입니다.</h3>";
		int authNumber = ran.nextInt(89999999) + 10000000;
		content = String.format(content, authNumber);
		int row = mailComponent.sendMailAuth(email, content);
		
		return row > 0 ? authNumber : row;
	}


// 프로필 사진 수정
@Transactional
public void updateProfile(MemberDTO dto) throws IOException {
	MultipartFile file = dto.getUpload();
	if (file != null && !file.isEmpty()) {
		String ymd = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String fileName = UUID.randomUUID().toString();
		String ext = file.getContentType().substring(file.getContentType().indexOf("/") + 1);
		String key = "profiles/" + ymd + "_" + fileName + "." + ext;

		// 파일을 로컬에 임시로 저장
		File tempFile = File.createTempFile(fileName, "." + ext);
		file.transferTo(tempFile);

		try {
			// S3에 파일 업로드
			AmazonS3 s3Client = S3ClientFactory.s3Client();
			String bucketName = "dbjava";

			// PutObjectRequest에 파일 크기 명시
			PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, tempFile);
			s3Client.putObject(putObjectRequest);

			String profileUrl = "https://" + bucketName + ".s3.amazonaws.com/" + key;
			dto.setProfile(profileUrl);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 임시 파일 삭제
			tempFile.delete();
		}
	}
	memberDAO.updateProfile(dto);
}

	public int basicProfile(MemberDTO dto) throws Exception {
		return memberDAO.basicProfile(dto);
	}

	public MemberDTO selectKakao(MemberDTO dto) {
		return memberDAO.selectKakao(dto);
	}

	public int insertKakao(MemberDTO dto) {
		return memberDAO.insertKakao(dto);
	}

	public MemberDTO selectNaver(MemberDTO dto) {
		return memberDAO.selectNaver(dto);
	}

	public MemberDTO findId(MemberDTO dto) {
		return memberDAO.findId(dto);
	}

	public int dupCheck2(String userNick) {
		return memberDAO.selectCount2(userNick);
	}
}