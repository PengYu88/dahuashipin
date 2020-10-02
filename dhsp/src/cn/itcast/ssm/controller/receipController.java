package cn.itcast.ssm.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.itcast.ssm.po.clientAdress;
import cn.itcast.ssm.po.clientCustom;
import cn.itcast.ssm.po.clientQueryVo;
import cn.itcast.ssm.po.goodsCustom;
import cn.itcast.ssm.po.goodsQueryVo;
import cn.itcast.ssm.po.orderCustom;
import cn.itcast.ssm.service.clientService;
import cn.itcast.ssm.service.goodsService;
import cn.itcast.ssm.service.orderService;
import net.sf.json.JSONObject;

 
@Controller
public class receipController {

	@Autowired
	private goodsService goodsService;
	
	@Autowired
	private clientService clientService;
	
	@Autowired
	private orderService orderService;

	@RequestMapping("/ReceiptList")
	public ModelAndView ReceiptList(HttpServletRequest request) throws Exception {
		 
		ModelAndView modelAndView = new ModelAndView();
	 
		modelAndView.setViewName("receipt/ReceiptList");

		return modelAndView;

	}
	
	@RequestMapping("/queryGoodsForReceipt")
	public void queryGoodsForReceipt(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8"); 
		String goodsCode = request.getParameter("goodsCode");
		String goodsName = request.getParameter("goodsName");
		goodsQueryVo goodsQueryVo = new goodsQueryVo();
		goodsCustom term = new goodsCustom();
		term.setGoodsCode(goodsCode);
		term.setGoodsName(goodsName);
		goodsQueryVo.setGoodsCustom(term);
		List<goodsCustom> itemsList = goodsService.findGoodsList(goodsQueryVo);
		JSONObject jsonObject = new JSONObject();
		PrintWriter writer = null;
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		writer = response.getWriter();
		jsonObject.put("itemsList", itemsList);
		writer.println(jsonObject.toString());
		writer.flush();
		writer.close();
		 
	}
	
	@RequestMapping("/queryClientForReceipt")
	public void queryClientForReceipt(HttpServletRequest request,HttpServletResponse response) throws Exception {
		    String clientTelephone = request.getParameter("clientPhone");
			clientQueryVo clientQueryVo = new clientQueryVo();
			clientCustom term = new clientCustom();
			term.setClientTelephone(clientTelephone);
			clientQueryVo.setClientCustom(term);
			List<clientCustom> clientList = clientService.findClientList(clientQueryVo);
			JSONObject jsonObject = new JSONObject();
			PrintWriter writer = null;
			response.setContentType("text/json");
			response.setCharacterEncoding("UTF-8");
			writer = response.getWriter();
			jsonObject.put("itemsList", clientList);
			writer.println(jsonObject.toString());
			writer.flush();
			writer.close();
	}
	
	
	@RequestMapping("/findClientAdress")
	public void findClientAdress(HttpServletRequest request,HttpServletResponse response) throws Exception {
		clientAdress clientQueryVo = new clientAdress();
		List<clientAdress> clientList = clientService.clientAdress(clientQueryVo);
		JSONObject jsonObject = new JSONObject();
		PrintWriter writer = null;
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		writer = response.getWriter();
		jsonObject.put("itemsList", clientList);
		writer.println(jsonObject.toString());
		writer.flush();
		writer.close();
	}
	
	@RequestMapping("/findGoodsCode")
	public void findGoodsCode(HttpServletRequest request,HttpServletResponse response) throws Exception {
		goodsQueryVo goodsQueryVo = new goodsQueryVo();
		List<clientAdress> clientList = goodsService.goodsCode(goodsQueryVo);
		JSONObject jsonObject = new JSONObject();
		PrintWriter writer = null;
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		writer = response.getWriter();
		jsonObject.put("itemsList", clientList);
		writer.println(jsonObject.toString());
		writer.flush();
		writer.close();
	}
	
	@RequestMapping("/findGoodsName")
	public void findGoodsName(HttpServletRequest request,HttpServletResponse response) throws Exception {
		goodsQueryVo goodsQueryVo = new goodsQueryVo();
		List<clientAdress> clientList = goodsService.goodsName(goodsQueryVo);
		JSONObject jsonObject = new JSONObject();
		PrintWriter writer = null;
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		writer = response.getWriter();
		jsonObject.put("itemsList", clientList);
		writer.println(jsonObject.toString());
		writer.flush();
		writer.close();
	}
	
	@RequestMapping("/doAddOrder")
	public void doAddOrder(HttpServletRequest request,HttpServletResponse response) throws Exception{
		try{
			request.setCharacterEncoding("UTF-8"); 
			String orderNo = request.getParameter("orderNo");
			String orderClient = request.getParameter("orderClient");
			double ordreSum = Double.parseDouble(request.getParameter("ordreSum"));
			orderCustom orderCustom = new orderCustom();
			orderCustom.setOrderNo(orderNo);
			orderCustom.setOrderClient(orderClient);
			orderCustom.setOrderSum(ordreSum);
			orderService.insertOrder(orderCustom);
			JSONObject jsonObject = new JSONObject();
			PrintWriter writer = null;
			response.setContentType("text/json");
			response.setCharacterEncoding("UTF-8");
			writer = response.getWriter();
			jsonObject.put("message", "success");
			writer.println(jsonObject.toString());
			writer.flush();
			writer.close();
		}
		catch (Exception e) {
			System.out.println("Exception in doAddOrder of receipController");
		}
	}

}
