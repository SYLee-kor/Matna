	function printGu() {
		$.ajax({
			url:"/matna/review/guList",
			dataType:"json",
			success:function(result){
				var gu = '<select id="gu" class="select" onchange="printDong()" name="gu">';
				gu += '<option value="" checked="true">== 구 선택 ==</option>'
				for (var int = 0; int < result.length; int++) {
					gu+='<option value="'+result[int]+'">'+result[int]+'</option>';
				}
				gu += '</select>';
/*				$('#guSpan').html(gu);*/
				$('#guSel').html(gu);
				if('${preview.gu}'.length!=0) $('[name=gu]').val('${preview.gu}');
				printDong();
			},
			error:function(xhr,status,error){
				alert('error : '+error);
			}
		})
	}
	function printDong() {
		$.ajax({
			url:"/matna/review/dongList",
			data:"gu="+$('#gu').val(),
			dataType:"json",
			success:function(result){
				var dong = '<select id="dong" class="select" name="dong">';
				dong += '<option value="" checked="checked">== 동 선택 ==</option>'
				for (var int = 0; int < result.length; int++) {
					dong+='<option value="'+result[int]+'">'+result[int]+"</option>";
				}
				dong += '</select>';
				$('#dongSel').html(dong);
				if('${preview.dong}'.length!=0) $('[name=dong]').val('${preview.dong}');
			},
			error:function(xhr,status,error){
				alert('error : '+error);
			}
		})
	}
	
	function searchDetail(){
		
		
	}
	
