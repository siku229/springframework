package com.spring.javagreenS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS.vo.ProductVO;

public interface ShopDAO {

	ArrayList<String> getProduct2(@Param("product1") String product1);

	ArrayList<String> getProduct3(@Param("product2") String product2);

	ProductVO getProduct(@Param("product") String product);

	public void getProductInput(@Param("vo") ProductVO vo);

	ArrayList<ProductVO> getProductList();

	


	
}
