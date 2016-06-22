	var ad_cnt = 1;
	$(document).ready(function() {
		setAD();
		setInterval("setAD()", 5000);
	});
	function setAD() {
		$.ajax({
			url : '/matna/admin/AD/change',
			data : {
				no : ad_cnt
			},
			type : "POST",
			success : function(result) {
				$('#AD').html(result);
				if(ad_cnt == $('#total').val()){
					ad_cnt = 1;
				}else{
					ad_cnt+=1;					
				}
			}
		})
	};