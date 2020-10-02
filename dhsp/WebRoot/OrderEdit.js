tsc.OrderEdit = {
		
	// 初始化
	init: function() {
		// 初始化事件绑定
		tsc.OrderEdit.event();

		// 初始化表单验证
		tsc.OrderEdit.validate();
	},

	//定义事件绑定
	event: function() {
	},
	
	//表单验证
	validate: function(){
		$("#order-edit-form").validate({
			ignore: ".ignore",
			rules: {
				editOrderClient: {
					required: true
				},
				editOrderSum: {
					required: true,
					isMoney: true
				}   
			},
		});			
	},
	
	//自动生成订单流水号
	doRunningNum:function(){
		var todayDate=new Date();
		var year=todayDate.getFullYear();
		var date=todayDate.getDate();
		if(date<10){
			date = "0" + date;
		}
		var month=todayDate.getMonth()+1;
		if(month<10){
			month = "0" + month;
		}
		var hour=todayDate.getHours();
		if(hour<10){
			hour = "0" + hour;
		}
		var mininutes=todayDate.getMinutes();
		if(mininutes<10){
			mininutes = "0" + mininutes;
		}
		var seconds=todayDate.getSeconds();
		if(seconds<10){
			seconds = "0" + seconds;
		}
		var ran=Math.round((Math.random())*10000);
		if(ran<1000){
			ran = "0"+ran;
		}
		var runningNum = ""+year+""+""+month+""+""+date+""+""+""+hour+""+""+mininutes+""+""+seconds+""+""+ran;
		return runningNum;
	},
	 
	// 表单提交
	doSave: function(callBackFunc){
		var orderNo = tsc.OrderEdit.doRunningNum();
		var orderClient = $("#editOrderClient").val();
		var ordreSum =  $("#editOrderSum").val();
		// 表单验证
		if(!$("#order-edit-form").valid()){
			return false;
		}
		// 提交
		$.ajax({ 
			url: "doAddOrder.action",
			type: "post",
			data: {
				"orderNo":orderNo,
				"orderClient":orderClient,
				"ordreSum":ordreSum,
				},
			dataType:"json",
			success: function(rs) {
				callBackFunc(rs);
			}
		});
	},
	
	// 修改
	doUpdate: function(callBackFunc){
		var orderId = $("#editOrderId").val();
		var orderClient = $("#editOrderClient").val();
		var ordreSum =  $("#editOrderSum").val();
		// 表单验证
		if(!$("#order-edit-form").valid()){
			return false;
		}
		// 提交
		$.ajax({ 
			url: "doUpdateOrderSave.action",
			type: "post",
			data: {
				"orderId":orderId,
				"orderClient":orderClient,
				"ordreSum":ordreSum,
				},
			dataType:"json",
			success: function(rs) {
				callBackFunc(rs);
			}
		});
		return false;
	}
};

tsc.OrderEdit.init();