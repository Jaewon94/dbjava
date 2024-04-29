package com.javabang.s3;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

public class S3ClientFactory {
    private static final String ACCESS_KEY = System.getenv("AWS_ACCESS_KEY_ID");;       // 실제 사용시 바꿔야함
    private static final String SECRET_KEY = System.getenv("AWS_SECRET_ACCESS_KEY");    // 실제 사용시 바꿔야함

    public static AmazonS3 s3Client() {
        AWSCredentials credentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);

        return AmazonS3ClientBuilder.standard()
                .withCredentials(new AWSStaticCredentialsProvider(credentials))
                .withRegion(Regions.AP_NORTHEAST_2)
                .build();
    }
}
