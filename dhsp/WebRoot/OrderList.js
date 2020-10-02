tsc.OrderList = {

	init: function() {
		
		// 初始化事件绑定
		tsc.OrderList.event();

	},

	//定义绑定事件
	event: function() {
		// 查询按钮
		$("#queryBtn").on("click", tsc.OrderList.doQuery);
		
		tsc.OrderList.getTdValue();
		
		// 新建按钮
		$("#addBtn").on("click", tsc.OrderList.doAdd);

	},

	// 查询
	doQuery: function(){ 
		var orderNo = $("#orderNo").val();
		var orderClient = $("#orderClient").val();
		$.ajax({
			url: "queryOrderByForm.action",
			type: "post",
			data: {"orderNo":orderNo,"orderClient":orderClient},
			success: function(data){ 
				tsc.OrderList.doTable(data);
				$("#sumArea").text(data.sum);
				$("#inventorySumArea").text(data.inventorySum);
				$("#nowDate").text(data.nowDate);
				tsc.OrderList.getTdValue();
			}
		});
	},
	
	getTdValue:function(){
		var tableId = document.getElementById("tab"); 
		var str = ""; 
		for(var i=1;i<tableId.rows.length;i++){ 
			var flag = tableId.rows[i].cells[4].innerHTML
			if(flag=='已合计'){
			}else{
				tableId.rows[i].cells[0].style.color = 'red';
				tableId.rows[i].cells[1].style.color = 'red';
				tableId.rows[i].cells[2].style.color = 'red';
				tableId.rows[i].cells[3].style.color = 'red';
				tableId.rows[i].cells[4].style.color = 'red';
			}
		} 
	},
	
	//插入表格
	doTable:function(data){
		var list = data.itemsList;
		var outHtml="";
		for(i=0;i<list.length;i++){
		outHtml=outHtml+"<tr>";
		outHtml=outHtml+"<td>"+list[i].orderNo+"</td>";
		outHtml=outHtml+"<td>"+list[i].orderClient+"</td>";
		outHtml=outHtml+"<td>"+list[i].orderTime+"</td>";
		outHtml=outHtml+"<td>"+list[i].price+"</td>";
		outHtml=outHtml+"<td>"+list[i].orderSts+"</td>";
		outHtml=outHtml+"<td><a onclick='tsc.OrderList.doEdit("+list[i].goodsId+")'>修改</a>&nbsp;"
						+"<a onclick='tsc.OrderList.doDelete("+list[i].orderId+")'>删除</a>&nbsp;<a onclick='tsc.OrderList.doDeduct("+list[i].orderId+")'>扣除</a>&nbsp;<a onclick='tsc.OrderList.doTotal("+list[i].orderId+")'>合计</a></td>";
		outHtml=outHtml+"</tr>";
		}
		document.getElementById('tbody').innerHTML=outHtml; 
	},
	
	// 修改
	doEdit: function(id){	
		$.ajax({
			url: "editOrder.action",
			data: {"id":id},
			success: function(data){
				var dialog = bootbox.dialog({
					title: "修改商品信息",
					message: data,
					buttons:{
						save:{
							label: SYS_MSG.BTN_SAVE,
						    className: "btn-success",
						    callback: function() {
						    	
						    	// 保存
						    	tsc.OrderEdit.doUpdate(function(rs){

						    		if(rs.message == "success"){
						    			
						    			// 提示保存成功
											sweetAlert({
												title: SYS_MSG.MSG_SAVE_SUCCESS,
												text: SYS_MSG.MSG_AUOT_CLOSE,
												type: 'success',
												showConfirmButton: false,
												timer: SYS_CONF.ALERT_TIMER,
											});
										
											// 重新查询
											tsc.OrderList.doQuery();
										
										// 关闭对话框
										dialog.modal("hide");
						    		}
						    	});
						    	return false;
						    }
						},
						cancel:{
							label: SYS_MSG.BTN_CANCEL,
						    className: "btn-default",
						}
					}
				});
			}
		});
	},
	
	//删除
	doDelete: function(id){
		// 提交请求
		sweetAlert({
			title: '确定要删除该条订单信息吗？',
			type: 'warning',
			showConfirmButton: true,
			showCancelButton: true,   
			confirmButtonText: SYS_MSG.BTN_CONFIRM,
			cancelButtonText: SYS_MSG.BTN_CANCEL,
			closeOnConfirm: false,
		},
		function(isConfirm){
			if (isConfirm) {
				$.getJSON("doDeleteOrder.action",{"id":id},function(rs){
					if(rs.message == "success"){
						sweetAlert({
							title: '删除成功！',
							text: SYS_MSG.MSG_AUOT_CLOSE,
							type: 'success',
							showConfirmButton: false,
							timer: SYS_CONF.ALERT_TIMER,
						});
						
					} else {
						sweetAlert({
							title: rs.desc,
							text: SYS_MSG.MSG_AUOT_CLOSE,
							type: 'success',
							showConfirmButton: false,
							timer: SYS_CONF.ALERT_TIMER,
						});
					}					
					// 重新查询
					tsc.OrderList.doQuery();
				});
			}
		});
	},	
	
	//扣除订单
	doDeduct:function(id){
		$.getJSON("doDeductOrder.action",{"id":id},function(rs){
			tsc.OrderList.doQuery();
			sweetAlert({
				title: '扣除成功，该订单将不参与盘点！',
				text: SYS_MSG.MSG_AUOT_CLOSE,
				type: 'success',
				showConfirmButton: false,
				timer: SYS_CONF.ALERT_TIMER,
			});
		});
	},
	
	//合计订单
	doTotal:function(id){
		$.getJSON("doTotalOrder.action",{"id":id},function(rs){
			tsc.OrderList.doQuery();
			sweetAlert({
				title: '合计成功，该订单将参与盘点！',
				text: SYS_MSG.MSG_AUOT_CLOSE,
				type: 'success',
				showConfirmButton: false,
				timer: SYS_CONF.ALERT_TIMER,
			});
		});
	},
	
	// 新建订单页面
	doAdd: function(){				
		$.ajax({
			url: "addOrder.action",
			success: function(data){
				var dialog = bootbox.dialog({
					title: "新增订单信息",
					message: data,
					buttons:{
						save:{
							label: SYS_MSG.BTN_SAVE,
						    className: "btn-success",
						    callback: function() {
						    	
						    	// 保存
						    	tsc.OrderEdit.doSave(function(rs){

						    		if(rs.message == "success"){
						    			
						    			// 提示保存成功
											sweetAlert({
												title: SYS_MSG.MSG_SAVE_SUCCESS,
												text: SYS_MSG.MSG_AUOT_CLOSE,
												type: 'success',
												showConfirmButton: false,
												timer: SYS_CONF.ALERT_TIMER,
											});
										
											// 重新查询
											tsc.OrderList.doQuery();
										
										// 关闭对话框
										dialog.modal("hide");
						    		}
						    	});
						    	return false;
						    }
						},
						cancel:{
							label: SYS_MSG.BTN_CANCEL,
						    className: "btn-default",
						}
					}
				});
			}
		});
	}
}

$(function(){
	tsc.OrderList.init();
});