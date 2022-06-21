package com.spring.javagreenS;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javagreenS.service.ShopService;
import com.spring.javagreenS.vo.OperatorVO;
import com.spring.javagreenS.vo.ProductVO;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	ShopService shopService;
	
	@RequestMapping(value = "/input/productMenu", method = RequestMethod.GET)
	public String productMenuGet() {
		return "shop/input/productMenu";
	}
	
	@RequestMapping(value = "/input/productInput", method = RequestMethod.GET)
	public String productInputGet() {
		return "shop/input/productInput";
	}

	// HashMap을 이용한 값의 전달(배열, ArrayList에 담아온 값을 다시 map에 담아서 넘길 수 있다.)
	@ResponseBody
	@RequestMapping(value = "/input/productInput", method = RequestMethod.POST)
	public HashMap<Object, Object> productInputPost(String product1) {
		ArrayList<String> vos = new ArrayList<String>();
		vos = shopService.getProduct2(product1);
		
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("product2", vos);
		
		return map;
	}
	
	@RequestMapping(value = "/input/productList", method = RequestMethod.GET)
	public String productListGet(Model model) {
		ArrayList<ProductVO> vos = shopService.getProductList();
		
		model.addAttribute("vos", vos);
		
		return "shop/input/productList";
	}
	
	// HashMap을 이용한 값의 전달(배열, ArrayList에 담아온 값을 다시 map에 담아서 넘길 수 있다.)
	@ResponseBody
	@RequestMapping(value = "/input/productInput2", method = RequestMethod.POST)
	public HashMap<Object, Object> productInput2Post(String product2) {
		ArrayList<String> vos = new ArrayList<String>();
		vos = shopService.getProduct3(product2);
		
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("product3", vos);
		
		return map;
	}
	 
	  @RequestMapping(value = "/input/productInputOk", method = RequestMethod.POST)
	  public String productInputOkPost(ProductVO vo) {
		  shopService.getProductInput(vo);
		  return "redirect:/msg/productInputOk"; 
	  }
	 
	 
	
}
