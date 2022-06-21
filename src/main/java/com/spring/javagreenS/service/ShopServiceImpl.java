package com.spring.javagreenS.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javagreenS.dao.ShopDAO;
import com.spring.javagreenS.vo.ProductVO;

@Service
public class ShopServiceImpl implements ShopService {
	
	@Autowired
	ShopDAO shopDAO;

	@Override
	public ArrayList<String> getProduct2(String product1) {
		
		return shopDAO.getProduct2(product1);
	}

	@Override
	public ArrayList<String> getProduct3(String product2) {

		return shopDAO.getProduct3(product2);
	}

	@Override
	public ProductVO getProduct(String product) {

		return shopDAO.getProduct(product);
	}

	@Override
	public void getProductInput(ProductVO vo) {
		shopDAO.getProductInput(vo);
	}

	@Override
	public ArrayList<ProductVO> getProductList() {
		return shopDAO.getProductList();
	}

}
