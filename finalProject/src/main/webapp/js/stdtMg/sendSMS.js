function checkValid() {
		var f = window.document.writeForm;
		if (f.content.value == "") {
			alert("문자내용을 입력하세요.");
			return false;
		}
		if (f.content.value.length > 80) {
			alert("80byte를 초과할 수 없습니다.");
			return false;
		}
		return true;
	}
	function allowDrop(ev) {
	    ev.preventDefault();
	}

	function drag(ev) {
	    ev.dataTransfer.setData("text", ev.target.id);
	}

	function drop(ev) {
	    ev.preventDefault();
	    var data = ev.dataTransfer.getData("text");
	    ev.target.appendChild(document.getElementById(data));
	}