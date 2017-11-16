/**
 * 문제 생성 페이지에서 사용 하는 script;
 * 
 */

//var listSize = '${requestScope.listTpc.size()}';
//var json = '${requestScope.json}';
var json = "";
var sbjtNm = "";
var listSize = "";
// 데이터 가져와서 구분 및 정리
$(document).ready(function(){
	listSize = $('#list').val();
	json = $('#json').val();
	json = JSON.parse(json);
	sbjtNm = new Array();

	for (var i = 0; i < listSize; i++) {
		sbjtNm.push(json[i].sbjtNm);
	}

	Array.prototype.unique = function() {
		var a = {};
		for (var i = 0; i < this.length; i++) {
			if (typeof a[this[i]] == 'undefined') {
				a[this[i]] = 1;
			}
		}
		this.length = 0;
		for ( var i in a) {
			this[this.length] = i;
		}
		return this;
	};

	sbjtNm = sbjtNm.unique();
	for (var i = 0; i < sbjtNm.length; i++) {
		$("#sbjtNm option:eq(0)").after(
				"<option value='" + sbjtNm[i] + "'>" + sbjtNm[i] + "</option>");
	}

	
})
 
//과목명 변경시 토픽명 자동 변경
function sbjtNmClick() {
	
	$("select[name='tpcNm'] option").not("[value='선택']").remove();
	
	for (var i = 0; i < listSize; i++) {

		if (json[i].sbjtNm == $('#sbjtNm').val()) {

			$("#tpcNm option:eq(0)").after(
					"<option name='a' value='" + json[i].tpcNm + "'>"
							+ json[i].tpcNm + "</option>");
			
		}
	}

}

// 과목명 변경 안하고 토픽명 바꾸려고 할때 alert창 보여주기
function tpcNmClick(){
	
	if($('#sbjtNm').val() == "선택"){
		alert("과목명을 선택해주세요");
	}
}