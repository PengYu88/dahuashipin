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
								<input id="clientSearch" name="clientCode" type="text" class="form-control" onchange="tsc.ReceiptList.doClientQuery()">
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
				</div>
				<div class="row">
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">商品条码</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="goodsCode" name="goodsCode" type="text" class="form-control" onchange="tsc.ReceiptList.doGoodsQueryForCode()">
							</div>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">商品名称</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="goodsName" name="goodsName" type="text" class="form-control" onchange="tsc.ReceiptList.doGoodsQueryForName()">
							</div>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">商品规格</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="goodsSpec" name="goodsSpec" type="text" class="form-control">
							</div>
						</div>
					</div>
					
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">订货数量</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="amount" name="amount" type="text" class="form-control" onblur="tsc.ReceiptList.doCompute()">
							</div>
						</div>
					</div>
					
				</div>
				<div class="row">

					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">单位</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="goodsUnit" name="goodsUnit" type="text" class="form-control">
							</div>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">商品单价</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="goodsPrice" name="goodsPrice" type="text" class="form-control" placeholder="例：100.00" onblur="tsc.ReceiptList.doCompute()">
							</div>
						</div>
					</div>
				<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">金额</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="sum" name="sum" type="text" class="form-control" readonly="readonly" placeholder="0.00">
							</div>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="form-group form-group-sm">
							<label class="col-xs-4 control-label control-label-sm">备注</label>
							<div class="col-xs-8" style="padding-right: 0px; padding-left: 0px;">
								<input id="remark" name="remark" type="text" class="form-control">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-10">
					</div>
					<div class="col-xs-1" style="padding-right: 0;">
						<a href="#" id="addBtn" class="btn btn-primary btn-sm pull-right">插入</a>
					</div>
					<div class="col-xs-1" style="padding-left: 0;">
						<a href="#" id="printBtn" onclick="prn1_print()" class="btn btn-primary btn-sm pull-right">打印</a>
					</div>
				</div>
			</form>
		</div>
		<div id="printArea">
			<h1 align="center" style="padding-top:0;padding-bottom:0;margin-top:0;margin-bottom:0">华都酒行商品供货单</h1>
			<table>
				<tr>
					<th width="25%" align="left">供货日期：<label id="orderDate"></label></th>
					<th width="20%" align="left">物流到站：<label id="arrival" style="font-size:20px;"></label></th>
					<th width="20%" align="left">收货人：<label id="consignee" style="font-size:20px;"></label></th>
					<th width="25%" align="left">电话：<label id="telephone" style="font-size:20px;"></label></th>
				</tr>
			</table>
			<table>
				<tr>
					<th width="30%" align="left">所属地区：<label id="area" style="font-size:20px;"></label></th>
					<th width="60%" align="left">&nbsp;&nbsp;收货人地址：<label id="adress" style="font-size:20px;"></label></th>
				</tr>
			</table>
			<table id="orderTable"  border="1" style="border:solid 1px black;border-collapse:collapse;width: 100%;">
				<thead>
					<tr>
					    <th width="6%" style="text-align: center;">商品条码</th>
					    <th width="25%" style="text-align: center;">品名</th>
					    <th width="8%" style="text-align: center;">规格</th>
					    <th width="8%" style="text-align: center;">单位</th>
					    <th width="8%" style="text-align: center;">数量</th>
					    <th width="10%" style="text-align: center;">价格</th>
					    <th width="10%" style="text-align: center;">货款金额</th>
					    <th width="10%" style="text-align: center;">备注</th>
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
	    		<tr>
		    		<td width="50%">货款结算记录：微信转账</td>
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
		$("#number").text(tsc.ReceiptList.doQueryMaxId());
		CreateOneFormPage();
		LODOP.PREVIEW();
		tsc.ReceiptList.doInsert();
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
