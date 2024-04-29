package com.javabang.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.javabang.s3.S3ClientFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


import com.javabang.model.ReviewDTO;
import com.javabang.repository.ReviewDAO;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

@Service
public class ReviewService {
	@Autowired private ReviewDAO reviewDAO;

	public List<ReviewDTO> reviewSelectAll(int idx) {
		List<ReviewDTO> list = reviewDAO.reviewSelectAll(idx);

		list.forEach(review -> {
			review.setFilePathList(reviewDAO.reviewFileSelectAll(review.getIdx()));
		});
		
		return list;
	}
   	

@Transactional
public int insertReview(ReviewDTO review) {
	int row = 0;

	row += reviewDAO.insertReview(review);
	review.setIdx(reviewDAO.selectIdx());

	for(MultipartFile file : review.getUpload()) {
		if(!file.isEmpty()) {
			String ymd = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			String fileName = UUID.randomUUID().toString();
			String ext = file.getContentType().substring(file.getContentType().indexOf("/") + 1);
			String key = "review/" + ymd + "_" + fileName + "." + ext;

			try {
				// S3에 파일 업로드
				AmazonS3 s3Client = S3ClientFactory.s3Client();
				String bucketName = "dbjava";

				// 파일을 로컬에 임시로 저장
				File tempFile = File.createTempFile(fileName, "." + ext);
				file.transferTo(tempFile);

				// PutObjectRequest에 파일 크기 명시
				PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, tempFile);
				s3Client.putObject(putObjectRequest);

				String filePath = "https://" + bucketName + ".s3.amazonaws.com/" + key;

				HashMap<String, Object> map = new HashMap<>();
				map.put("review", review.getIdx());
				map.put("filePath", filePath);

				row += reviewDAO.fileInsert(map);

				// 임시 파일 삭제
				tempFile.delete();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	return row;
}

	public void deleteReview(int reviewIdx, int memberIdx) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("reviewIdx", reviewIdx);
		map.put("memberIdx", memberIdx);
		reviewDAO.deleteReview(map);
	}

	public List<ReviewDTO> selectAllMyReview(int idx) {
		return reviewDAO.selectAllMyReview(idx);
	}

	public List<ReviewDTO> selectAllMyReviewSearch(int idx, String search) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("idx", Integer.toString(idx));
		map.put("search", search);
		
		return reviewDAO.selectAllMyReviewSearch(map);
	}
}