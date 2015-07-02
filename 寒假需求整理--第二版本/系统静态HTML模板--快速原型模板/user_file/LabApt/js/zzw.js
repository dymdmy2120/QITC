function select1(id) {
		var oA = document.getElementById(id);
		if(oA.innerHTML.indexOf("strong") != -1) {
			oA.innerHTML=oA.innerHTML.substring(8 , oA.innerHTML.length - 9);
		}else {
			oA.innerHTML = "<strong>" + oA.innerHTML + "</strong>";
		}
	}

	function all() {
		var allImg = document.getElementById("all");
		var oA = document.getElementById("pages").getElementsByTagName("a");
		var count = 0 ;
		for(i = 0 ; i < oA.length ; i ++) {
			if(oA[i].innerHTML.indexOf("strong") != -1) {
				count++;
			}
		}
		if(count == 8) {
			for(i = 0 ; i < oA.length ; i ++) {
				oA[i].innerHTML="&emsp;&emsp;" + (i+1) + "&emsp;&emsp;";
			}
			allImg.src = "images/bg30.jpg";
		}else {
			for(i = 0 ; i < oA.length ; i ++) {
				oA[i].innerHTML = "<strong>&emsp;&emsp;" + (i+1) + "&emsp;&emsp;</strong>";
			}
			allImg.src = "images/bg30_1.jpg";
			
		}
	}
	function change(verify) {
		var aTr = document.getElementById("verify_data").getElementsByTagName("tr");
		for(j = 1 ; j < aTr.length-1 ; j++) {
			aTr[j].style.display="none";
		}
		aTr[verify.selectedIndex+1].style.display="block";
	}