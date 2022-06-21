package com.spring.javagreenS.service;

import java.util.ArrayList;

import com.spring.javagreenS.vo.ProductVO;

public interface ShopService {

	ArrayList<String> getProduct2(String product1);

	ArrayList<String> getProduct3(String product2);

	ProductVO getProduct(String product);

	public void getProductInput(ProductVO vo);

	ArrayList<ProductVO> getProductList();
	


	
}
