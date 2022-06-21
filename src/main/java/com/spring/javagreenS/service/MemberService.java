package com.spring.javagreenS.service;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javagreenS.vo.MemberVO;

public interface MemberService {

	public MemberVO getMemIdCheck(String mid);

	public MemberVO getMemNickCheck(String nickname);

	public int setMemInputOk(MultipartFile fName, MemberVO vo);

	public void setMemberVisitProcess(MemberVO vo);

}
