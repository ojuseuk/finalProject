		var crsList = $("#jsonCrs").val();
		var root = $("#root").val();
		var usrId = $("#usrId").val();
		var usrNm = $("#usrNm").val();
		var usrPhone = $("#usrPhone").val();
		var usrEmail = $("#usrEmail").val();
		var selectClss = new Array();
		var tMoney = 0;
		
		console.log(usrId);
		console.log(usrNm);
		console.log(usrPhone);
		console.log(usrEmail);
		crsList = JSON.parse(crsList);
		console.log(crsList);

		function format(d) {
			return '<table>'
					+ '<tr>'
					+ '<td><img src="imgs/img/이장규.JPG" width="100%"></td>' 
					+ '<td>과정 소개 : ' + d.crsIntro 
					+ '선생님 소개 :' + d.nm + '선생님'
					+ '' + d.tchrIntro + '</tr>'
					+ '</table>';
		}

		var table = $('#dataTable').DataTable({
			"language" : {
				"thousands" : ","
			},
			"processing" : true,
			"scrollY" : 300,
			"scrollCollapse" : true,
			data : crsList,
			select : {
				style : 'multi',
				selector : 'td:first-child'
			},
			columns : [ {
				orderable : false,
				className : 'select-checkbox',
				targets : 0,
				"data" : null,
				"render" : function(data, type, row, meta) {
					return "";
				}
			}, {
				"data" : "crsNm",
			}, {
				"data" : "clssNm"
			}, {
				"data" : "nm"
			}, {
				"data" : "strtDt",
				"render" : function(data, type, row, meta) {
					return data + "~" + row.endDt + "(" + row.prd + "일)";
				}
			}, {
				"data" : "stdtclssttn",
//				"render" : function(data){
//					data = '<div align="right">' + data.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '</div>';	
//					return data;
//				}
			}, {
				"className" : 'details-control',
				"width" : "10%",
				"orderable" : false,
				"data" : null,
				"defaultContent" : ''
			} ]
		});

		$('#dataTable tbody').on('click', 'td.details-control', function() {
			var tr = $(this).closest('tr');
			var row = table.row(tr);
			if (row.child.isShown()) {
				row.child.hide();
				tr.removeClass('shown');
			} else {
				row.child(format(row.data())).show();
				tr.addClass('shown');
			}

		});

	
	$(document).ready(function() {
		var events = $('#events');
		//테이블에 담기
		table.on('select',	function(e, dt, type, indexes) {
			rowData = table.rows(indexes).data().toArray();
			//JSON형태로 조합
			selectClss.push('{"id":' + JSON.stringify(usrId)
							+ ',"nm":' + JSON.stringify(rowData[0].nm)
							+ ',"clssId":' + JSON.stringify(rowData[0].clssId)
							+ ',"clssNm":' + JSON.stringify(rowData[0].clssNm)
							+ ',"strtDt":' + JSON.stringify(rowData[0].strtDt)
							+ ',"endDt":' + JSON.stringify(rowData[0].endDt)
							+ ',"stdtclssttn":' + JSON.stringify(rowData[0].stdtclssttn)
							+ '}');
			//총 금액 
			tMoney += parseInt(rowData[0].stdtclssttn);
			document.getElementById("tMoney").innerHTML = "<b>총 결제 금액 : " + tMoney + "원</b>";
			$.post({
				url : root + "/applyClss",
				data : JSON.stringify(selectClss),
				beforeSend : function(xhr)
                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
				contentType : "application/json; charset=UTF-8",
				success : function(list) {
					document.getElementById("events").innerHTML = list;
				},
				error : function() {
					alert("fail");
				}
			});
			console.log("체크한리스트" + selectClss);
			
		})
		//선택한 테이블에서 삭제
		.on('deselect', function(e, dt, type, indexes) {
			rowData = table.rows(indexes).data().toArray();
			tMoney -= parseInt(rowData[0].stdtclssttn);
			rowData = '{"id":' + JSON.stringify(usrId)
					+ ',"nm":' + JSON.stringify(rowData[0].nm)
					+ ',"clssId":' + JSON.stringify(rowData[0].clssId)
					+ ',"clssNm":' + JSON.stringify(rowData[0].clssNm)
					+ ',"strtDt":' + JSON.stringify(rowData[0].strtDt)
					+ ',"endDt":' + JSON.stringify(rowData[0].endDt)
					+ ',"stdtclssttn":' + JSON.stringify(rowData[0].stdtclssttn) + '}';
					
			console.log(tMoney);
			document.getElementById("tMoney").innerHTML = "<b>총 결제 금액 : " + tMoney + "원</b>";
			
			for (var i = 0; i < selectClss.length; i++) {
				if (rowData == selectClss[i]) {
					delete selectClss[i];
				}
			}
			
			for (var i = 0; i < selectClss.length; i++) {
				if (selectClss[i] == null) {
					for (var j = i; j < selectClss.length; j++) {
						selectClss[i] = selectClss[i + 1];
						selectClss.splice(i, 1);
					}
				}
			}
			console.log("삭제후리스트"	+ selectClss);
			$.post({
				url : root + "/applyClss",
				data : JSON.stringify(selectClss),
				beforeSend : function(xhr)
                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
				contentType : "application/json; charset=UTF-8",
				success : function(list) {
					document.getElementById("events").innerHTML = list;
				},
				error : function() {
					console.log("fail");
				}
			});
		});
	});

	function reqCrsList(sbjtNm, root) {
		$('#dataTable').dataTable().fnDestroy();
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				var crsBySbjt = xhttp.responseText;
				crsBySbjt = JSON.parse(crsBySbjt);
				console.log(crsBySbjt);
				table = $('#dataTable').DataTable(
					{
					"language" : {
						"decimal" : ",",
						"thousands" : ","
					},
					"processing" : true,
					"scrollY" : 300,
					"scrollCollapse" : true,
					data : crsBySbjt,
					select : {
						style : 'multi',
						selector : 'td:first-child'
					},
					columns : [{
						orderable : false,
						className : 'select-checkbox',
						targets : 0,
						"data" : null,
						"render" : function(data, type,	row, meta) {
							return "";
						}
					}, {
						"data" : "crsNm"
					}, {
						"data" : "clssNm"
					}, {
						"data" : "nm"
					}, {
						"data" : "strtDt",
						"render" : function(data, type,	row, meta) {
							return data + "~" + row.endDt + "(" + row.prd + "일)";
							}
					}, {
						"data" : "stdtclssttn"
// 						"render" : function(data, type, row, meta) {
// 							return data + "' type='number'/>원";
// 						}	
					}, {
						"className" : 'details-control',
						"width" : "10%",
						"orderable" : false,
						"data" : null,
						"defaultContent" : ''
					} ]
				});
			}
		}
		xhttp.open("POST", root + "/selectCrsPerSbjt", true);
		xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhttp.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		xhttp.send("sbjtNm=" + sbjtNm);
	}

		$("#payment").click(function() {
			reqPayment(tMoney, usrId, usrNm, usrPhone, usrEmail, selectClss);
		});

		function reqPayment(tMoney, usrId, usrNm, usrPhone, usrEmail, selectClss) {
			console.log(tMoney, usrId, usrNm, usrPhone, usrEmail);
			console.log(selectClss);
			IMP.request_pay({
			    pg : 'inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : tMoney,
			    buyer_email : usrEmail,
			    buyer_name : usrNm,
			    buyer_tel : usrPhone,
			}, function(rsp) {
			    if ( rsp.success ) {
			    	$.ajax({
			    		url: root + "/payments/complete", 
			    		type: 'POST',
			    		contentType : "application/json; charset=UTF-8",
			    		data: JSON.stringify(selectClss),
			    		beforeSend : function(xhr)
	                     {  
	                         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                     }
			    	}).done(function(data) {
// 			    		if ( everythings_fine ) {
			    			var msg = '결제가 완료되었습니다.';
			    			msg += '\n고유ID : ' + rsp.imp_uid;
			    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			    			msg += '\결제 금액 : ' + rsp.paid_amount;
			    			msg += '카드 승인번호 : ' + rsp.apply_num;
							document.getElementById("clssView").innerHTML = data;
			    			alert(msg);
// 			    		} else {
// 			    			var msg = '아직 제대로 결제가 되지 않았습니다.';
// 			    			alert(msg);
			    			//[3] 아직 제대로 결제가 되지 않았습니다.
			    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
// 			    		}
			    	});
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);
			    }
			});
		}