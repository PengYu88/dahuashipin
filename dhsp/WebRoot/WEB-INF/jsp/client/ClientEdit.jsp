<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<% 
String flag = request.getAttribute("flag").toString();
%>
<form id="client-edit-form" class="form-horizontal" role="form"  method="post">
	<input type="hidden" id="flag" value="<%=flag%>">
	<div class="form-group">
	    <label for="goodsUnit" class="col-xs-4 control-label">物流到站</label>
	    <div class="col-xs-5">
			<input class="form-control" id="editLogisticsArrival" name="editLogisticsArrival" placeholder="物流到站" maxlength="20" value="${clientCustom.logisticsArrival}">
			<input type="hidden" id="editClientId" value="${clientCustom.clientId}">
	    </div>
	</div>
	<div class="form-group">
	    <label for="pickupAdress" class="col-xs-4 control-label">提货地址</label>
	    <div class="col-xs-5">
			<input class="form-control" id="pickupAdress" name="pickupAdress" placeholder="提货地址" maxlength="120" value="${clientCustom.pickupAdress}">
	    </div>
	</div>
	<div class="form-group">
	    <label for="goodsName" class="col-xs-4 control-label">收货人</label>
	    <div class="col-xs-5">
			<input class="form-control" id="editClientName" name="editClientName" placeholder="收货人" maxlength="20" value="${clientCustom.clientName}">
	    </div>
	</div>
	<div class="form-group">
	    <label for="goodsUnit" class="col-xs-4 control-label">所属地区</label>
	    <div class="col-xs-5">
			<input class="form-control" id="editDistrict" name="editDistrict" placeholder="所属地区" maxlength="20" value="${clientCustom.district}">
	    </div>
	</div>
	<div class="form-group">
	    <label for="goodsSpec" class="col-xs-4 control-label">联系电话</label>
	    <div class="col-xs-5">
			<input class="form-control" id="editClientTelephone" name="editClientTelephone" placeholder="联系电话" maxlength="120" value="${clientCustom.clientTelephone}">
	    </div>
	</div>
		<div class="form-group">
	    <label for="goodsUnit" class="col-xs-4 control-label">收货人地址</label>
	    <div class="col-xs-5">
			<input class="form-control" id="editClientAddress" name="editClientAddress" placeholder="收货人地址" maxlength="120" value="${clientCustom.clientAddress}">
	    </div>
	</div>
</form>
<script src="ClientEdit.js" type="text/javascript"></script>