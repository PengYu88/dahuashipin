<style>
	.caret-change{
		transform:rotate(180deg); 
	}
	.toAddClass {
		cursor: pointer;
	}
	tr.toAddClass :HOVER{
	background-color: #e9ecf3;
}
</style>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<div class="portlet light">
	<div class="portlet-body">
		<!--高级查询搜索-->
		<div id="searchCondition">
			<form class="form-horizontal" id="receipt-query-form" action="data/query_purchase_order_page_1.json" type="post">
				<div class="row">
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">客户检索</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="clientSearch" name="clientCode" type="text" class="form-control" onchange="tsc.ReceiptList.doClientQuery()" autocomplete="off">
							</div>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">收货到站</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="logisticsArrival" name="logisticsArrival" type="text" class="form-control">
							</div>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">所属地区</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="district" name="district" type="text" class="form-control">
							</div>
						</div>
					</div>

		 			<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">收货人</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="clientName" name="clientName" type="text" class="form-control">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">电话</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="clientTelephone" name="clientTelephone" type="text" class="form-control">
							</div>
						</div>
					</div>
					<div class="col-xs-6">
						<div class="form-group form-group-sm">
							<label class="col-xs-2 control-label control-label-sm">收货地址</label>
							<div class="col-xs-10" style="padding-right: 0px; padding-left: 0px;">
								<input id="clientAddress" name="clientAddress" type="text" class="form-control">
							</div>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">提货地址</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="pickupAdress" name="pickupAdress" type="text" class="form-control">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">商品条码</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="goodsCode" name="goodsCode" type="text" class="form-control" onchange="tsc.ReceiptList.doGoodsQueryForCode()" autocomplete="off">
							</div>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">商品名称</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="goodsName" name="goodsName" type="text" class="form-control" onchange="tsc.ReceiptList.doGoodsQueryForName()" autocomplete="off">
							</div>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">商品规格</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="goodsSpec" name="goodsSpec" type="text" class="form-control" autocomplete="off">
							</div>
						</div>
					</div>
					
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">订货数量</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="amount" name="amount" type="text" class="form-control" onblur="tsc.ReceiptList.doCompute()" autocomplete="off">
							</div>
						</div>
					</div>
					
				</div>
				<div class="row">

					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">单位</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="goodsUnit" name="goodsUnit" type="text" class="form-control" autocomplete="off">
							</div>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">商品单价</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="goodsPrice" name="goodsPrice" type="text" class="form-control" placeholder="例：100.00" onblur="tsc.ReceiptList.doCompute()" autocomplete="off">
							</div>
						</div>
					</div>
				<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">金额</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="sum" name="sum" type="text" class="form-control" readonly="readonly" placeholder="0.00" autocomplete="off">
							</div>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">库房码</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="remark" name="remark" type="text" class="form-control">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
				<div class="col-xs-4">
				<input id="ifSave" type="checkbox" checked> 保存订单
				<a href="#" id="deleteAllBtn" onclick="tsc.ReceiptList.deleteAll()" class="btn btn-primary btn-sm">清空订单</a>
				</div>
					<div class="col-xs-5">
						 <label>
						    <input type="radio" name="optionsRadios" id="wechatRadios" value="wechat" checked onclick="tsc.ReceiptList.choosePayMethod('微信转账')">
						   微信转账
						 </label>
						 <label>
						    <input type="radio" name="optionsRadios" id="bankcardRadios" value="bankcard" onclick="tsc.ReceiptList.choosePayMethod('银行卡转账')">
						   银行卡转账
						 </label>
						 <label>
						    <input type="radio" name="optionsRadios" id="AlipayRadios" value="Alipay" onclick="tsc.ReceiptList.choosePayMethod('支付宝转账')">
						 	  支付宝转账
						 </label>
						 <label>
						    <input type="radio" name="optionsRadios" id="cashRadios" value="cash" onclick="tsc.ReceiptList.choosePayMethod('现金')">
						 	 现金
						 </label>
						 <label>
						    <input type="radio" name="optionsRadios" id="otherRadios" value="other" onclick="tsc.ReceiptList.choosePayMethod('其他')">
						 	其他
						 </label>
					</div>
					<div class="col-xs-1" style="padding-right: 0;">
						<a href="#" id="historyBtn" class="btn btn-primary btn-sm pull-right">历史交易</a>
					</div>
					<div class="col-xs-1" style="padding-right: 0;">
						<a href="#" id="addBtn" class="btn btn-primary btn-sm pull-right">插入</a>
					</div>
					<div class="col-xs-1" style="padding-left: 0;">
						<a href="#" id="printBtn" onclick="prn1_print()" class="btn btn-primary btn-sm pull-right">打印</a>
<!-- 						<a href="#" onclick="tsc.ReceiptList.doInsertHistory()" class="btn btn-primary btn-sm pull-right">打印</a> -->
					</div>
				</div>
			</form>
		</div>
		<div id="printArea">
			<table border="1" style="border:solid 1px black;border-collapse:collapse;width: 100%;">
				<tr>
					<td><h1 align="center" style="padding-top:0;padding-bottom:0;margin-top:0;margin-bottom:0">华都酒行商品供货单</h1></td>
				</tr>
			</table>
			<table border="1" style="border:solid 1px black;border-collapse:collapse;width: 100%;">
				<tr>
					<td width="12%"><b>供货日期</b></td><td width="17%" align="left"><b><label id="orderDate"></label></b></td>
					<td width="12%"><b>物流到站</b></td><th width="25%" align="left"><label id="arrival" style="font-size:20px;"></label></th>
					<td width="12%"><b>所属地区</b></td><td width="25%" align="left"><b><label id="area" style="font-size:20px;"></label></b></td>
				</tr>
<!-- 				<tr>
					<th width="100%" align="left">提货地址：<label id="arrival" style="font-size:20px;"></label></th>
				</tr> -->
			</table>
			<table border="1" style="border:solid 1px black;border-collapse:collapse;width: 100%;">
				<tr>
					<td width="12%"><b>总件数</b></td><td width="17%" align="left"><b><label id="totalNumTitle" style="font-size:20px;"></label></b></td>
					<td width="12%"><b>提货地址</b></td><td width="100%" align="left"><b><label id="pickup"></label></b></td>
				</tr>
			</table>
			<table border="1" style="border:solid 1px black;border-collapse:collapse;width: 100%;">
				<tr>
					<td width="8%"><b>收货人</b></td><td width="15%" align="left"><label id="consignee" style="font-size:20px;"></label></td>
					<td width="6%"><b>电话</b></td><td width="20%" align="left"><label id="telephone" style="font-size:20px;"></label></td>
					<!-- <th width="30%" align="left">所属地区：<label id="area" style="font-size:20px;"></label></th> -->
					<td width="6%"><b>地址</b><td width="60%" align="left"><label id="adress"></label></td>
				</tr>
			</table>
			<table id="orderTable"  border="1" style="border:solid 1px black;border-collapse:collapse;width: 100%;">
				<thead>
					<tr>
						<th width="7%" style="text-align: center;">库房码</th>
					    <th width="20%" style="text-align: center;">商品条码</th>
					    <th width="25%" style="text-align: center;">品名</th>
					    <th width="10%" style="text-align: center;">规格</th>
					    <th width="5%" style="text-align: center;">单位</th>
					    <th width="5%" style="text-align: center;">数量</th>
					    <th width="10%" style="text-align: center;">价格</th>
					    <th width="10%" style="text-align: center;">货款金额</th>
					    
					</tr>
				</thead>
				<tbody>
				</tbody>
	    	</table>
	    	<table style="border:solid 1px black;border-collapse:collapse;width: 100%;">
				<tr>
		    		<td width="55%">货款总计（人民币）：大写：<span id="chineseTotal"></span></td>
		    		<td width="20%">总数量：<span id="amountTotal"></span>件</td>
		    		<td width="25%" style="text-align: center;">小写：<span id="total">0</span> 元</td>
	    		</tr>
	    	</table>
	    	<table style="border:solid 1px black;border-collapse:collapse;width: 100%;">
	    		<tr>
		    		<td width="50%">供货单位：台安华都酒行&nbsp;&nbsp;地址：辽宁省鞍山市台安县八角台商业街D12门市楼</td>
	    		</tr>
	    		<tr>
		    		<td width="50%">联系电话：0412-4949519&nbsp;&nbsp;&nbsp;&nbsp;业务联系人：李波&nbsp;&nbsp;&nbsp;&nbsp;手机:13700176069&nbsp;&nbsp;&nbsp;&nbsp;微信:TAIAN6969</td>
	    		</tr>
	    		<tr>
		    		<td width="50%">营业执照信用代码：92210321MA0X2NE18L&nbsp;&nbsp;&nbsp;&nbsp;食品经营许可证: JY21032110024901</td>
	    		</tr>
	    	</table>
	    	<table style="border:solid 1px black;border-collapse:collapse;width: 100%;">
	    		<tr style="border:solid 1px black;border-collapse:collapse;width: 100%;">
		    		<td width="50%">货款结算记录：<label id="payMethod">微信转账</label></td>
	    		</tr>
	    	</table>
		</div>			
	</div>
</div>
<script src="LodopFuncs.js"></script>
<script src="ReceiptList.js" type="text/javascript"></script>
<script type="text/javascript"> 
	var LODOP; //声明为全局变量 
	function prn1_print() {
		$("#totalNumTitle").text($("#amountTotal").text()+"件");
		$("#number").text(tsc.ReceiptList.doQueryMaxId());
		CreateOneFormPage();
		LODOP.PREVIEW();
		//tsc.ReceiptList.doInsert();
		var isChecked = $('#ifSave').prop('checked');
		if(isChecked==true){
			tsc.ReceiptList.doInsertHistory()
		}
	};
	function CreateOneFormPage(){
		LODOP=getLodop();
		LODOP.ADD_PRINT_HTM(18,20,715,1000,document.getElementById("printArea").innerHTML);
	};	                     
</script> 
<script type="text/javascript"> 
function displayResult(item, val, text) {
    console.log(item);
    $('.alert').show().html('You selected <strong>' + val + '</strong>: <strong>' + text + '</strong>');
}
$(function () {
	var clientArray=new Array();
	var goodsArray=new Array();
	var goodsNameArray=new Array();
	
	$.ajax({
		url: "findClientAdress.action",
		type: "post",
		async: false,
		success: function(data){
			clientArray = data.itemsList;
		}
	});
	
	$.ajax({
		url: "findGoodsCode.action",
		type: "post",
		async: false,
		success: function(data){
			goodsArray = data.itemsList;
		}
	});
	
	$.ajax({
		url: "findGoodsName.action",
		type: "post",
		async: false,
		success: function(data){
			goodsNameArray = data.itemsList;
		}
	});

    $('#clientSearch').typeahead({
    	source:clientArray,
        itemSelected: displayResult
    });
    
    $('#goodsCode').typeahead({
    	source:goodsArray,
        itemSelected: displayResult
    });
    
    $('#goodsName').typeahead({
    	source:goodsNameArray,
        itemSelected: displayResult
    });
    
});

</script> 
<style>
	#orderTable{
		width: 100%;
	}
</style>
